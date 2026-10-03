<?php
/**
 * One-time 1–7 city ratings with transaction-safe cached aggregates.
 *
 * @package City_Contrib
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class CC_Rating {
	/** Attach REST routes. */
	public static function hooks() {
		add_action( 'rest_api_init', array( __CLASS__, 'routes' ) );
	}

	/** Register rating routes. */
	public static function routes() {
		register_rest_route(
			CC_REST::NAMESPACE,
			'/cities/(?P<id>\d+)/rating',
			array(
				array(
					'methods'             => WP_REST_Server::READABLE,
					'callback'            => array( __CLASS__, 'get_rating' ),
					'permission_callback' => '__return_true',
				),
				array(
					'methods'             => WP_REST_Server::CREATABLE,
					'callback'            => array( __CLASS__, 'post_rating' ),
					'permission_callback' => array( 'CC_REST', 'logged_in' ),
					'args'                => array(
						'stars' => array( 'required' => true, 'type' => 'integer', 'minimum' => 1, 'maximum' => 7 ),
					),
				),
			)
		);
		register_rest_route(
			CC_REST::NAMESPACE,
			'/admin/ratings/(?P<id>\d+)',
			array(
				'methods'             => WP_REST_Server::DELETABLE,
				'callback'            => array( __CLASS__, 'delete_rating' ),
				'permission_callback' => array( 'CC_REST', 'administrator' ),
				'args'                => array( 'reason' => array( 'required' => true, 'type' => 'string' ) ),
			)
		);
	}

	/** Public aggregate plus an uncached personal rating when signed in. */
	public static function get_rating( $request ) {
		$city_id = absint( $request['id'] );
		if ( ! CC_Helpers::is_city( $city_id ) ) {
			return new WP_Error( 'cc_city_not_found', __( 'شهر پیدا نشد.', 'city-contrib' ), array( 'status' => 404 ) );
		}
		$public  = self::public_data( $city_id );
		$user_id = CC_Auth::restore_cookie_user();
		$mine    = null;
		if ( $user_id ) {
			global $wpdb;
			$mine = $wpdb->get_var(
				$wpdb->prepare(
					'SELECT stars FROM ' . CC_Config::ratings_table() . ' WHERE user_id = %d AND city_id = %d LIMIT 1', // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared
					$user_id,
					$city_id
				)
			);
		}
		$public['user_rating'] = null === $mine ? null : (int) $mine;
		$response = rest_ensure_response( $public );
		if ( $user_id ) {
			return CC_Helpers::no_store( $response );
		}
		$response->header( 'Cache-Control', 'public, max-age=60, stale-while-revalidate=120' );
		return $response;
	}

	/** Insert an immutable vote. */
	public static function post_rating( $request ) {
		global $wpdb;
		$city_id = absint( $request['id'] );
		$stars   = absint( $request['stars'] );
		$user_id = get_current_user_id();
		$max     = (int) CC_Config::get( 'rating_max_stars' );
		if ( ! CC_Helpers::is_city( $city_id ) ) {
			return new WP_Error( 'cc_city_not_found', __( 'شهر پیدا نشد.', 'city-contrib' ), array( 'status' => 404 ) );
		}
		if ( $stars < 1 || $stars > $max ) {
			return new WP_Error( 'cc_stars_invalid', __( 'امتیاز باید عددی از ۱ تا ۷ باشد.', 'city-contrib' ), array( 'status' => 400 ) );
		}

		$table = CC_Config::ratings_table();
		$now   = gmdate( 'Y-m-d H:i:s' );
		$day   = gmdate( 'Y-m-d H:i:s', time() - DAY_IN_SECONDS );
		$fast  = gmdate( 'Y-m-d H:i:s', time() - ( 5 * MINUTE_IN_SECONDS ) );

		$wpdb->query( 'SET TRANSACTION ISOLATION LEVEL READ COMMITTED' );
		$wpdb->query( 'START TRANSACTION' );
		// Lock the user first so concurrent votes to different cities cannot bypass daily limits.
		$wpdb->get_var( $wpdb->prepare( "SELECT ID FROM {$wpdb->users} WHERE ID = %d FOR UPDATE", $user_id ) );
		// The city post row is the serialization lock for aggregate writes and admin deletes.
		$locked = $wpdb->get_var( $wpdb->prepare( "SELECT ID FROM {$wpdb->posts} WHERE ID = %d FOR UPDATE", $city_id ) );
		if ( ! $locked ) {
			$wpdb->query( 'ROLLBACK' );
			return new WP_Error( 'cc_city_not_found', __( 'شهر پیدا نشد.', 'city-contrib' ), array( 'status' => 404 ) );
		}

		$existing = $wpdb->get_var( $wpdb->prepare( "SELECT id FROM {$table} WHERE user_id = %d AND city_id = %d LIMIT 1", $user_id, $city_id ) );
		if ( $existing ) {
			$wpdb->query( 'ROLLBACK' );
			return new WP_Error( 'cc_rating_exists', __( 'شما قبلاً به این شهر امتیاز داده‌اید و امتیاز قابل تغییر نیست.', 'city-contrib' ), array( 'status' => 409 ) );
		}

		$daily_count = (int) $wpdb->get_var( $wpdb->prepare( "SELECT COUNT(*) FROM {$table} WHERE user_id = %d AND created_at >= %s", $user_id, $day ) );
		if ( $daily_count >= (int) CC_Config::get( 'rating_daily_limit' ) ) {
			$wpdb->query( 'ROLLBACK' );
			return new WP_Error( 'cc_rating_daily_limit', __( 'سقف بیست امتیاز روزانه پر شده است.', 'city-contrib' ), array( 'status' => 429 ) );
		}

		$user       = get_userdata( $user_id );
		$registered = $user ? strtotime( $user->user_registered . ' UTC' ) : time();
		$new_window = (int) CC_Config::get( 'rating_new_user_minutes' ) * MINUTE_IN_SECONDS;
		if ( time() - $registered < $new_window && $daily_count >= (int) CC_Config::get( 'rating_new_user_limit' ) ) {
			$wpdb->query( 'ROLLBACK' );
			return new WP_Error( 'cc_rating_new_user_limit', __( 'برای حساب تازه، چند دقیقه بعد امتیاز بعدی را ثبت کنید.', 'city-contrib' ), array( 'status' => 429 ) );
		}
		$recent_count = (int) $wpdb->get_var( $wpdb->prepare( "SELECT COUNT(*) FROM {$table} WHERE user_id = %d AND created_at >= %s", $user_id, $fast ) );
		if ( $recent_count >= 10 ) {
			$wpdb->query( 'ROLLBACK' );
			return new WP_Error( 'cc_rating_too_fast', __( 'تعداد درخواست‌ها در چند دقیقه زیاد بود؛ کمی صبر کنید.', 'city-contrib' ), array( 'status' => 429 ) );
		}

		$inserted = $wpdb->insert(
			$table,
			array(
				'user_id'      => $user_id,
				'city_id'      => $city_id,
				'stars'        => $stars,
				'ip_hash'      => CC_Helpers::ip_hash(),
				'is_suspicious'=> $recent_count >= 5 ? 1 : 0,
				'created_at'   => $now,
			),
			array( '%d', '%d', '%d', '%s', '%d', '%s' )
		);
		if ( false === $inserted ) {
			$duplicate = false !== stripos( (string) $wpdb->last_error, 'duplicate' );
			$wpdb->query( 'ROLLBACK' );
			return new WP_Error(
				$duplicate ? 'cc_rating_exists' : 'cc_rating_failed',
				$duplicate ? __( 'شما قبلاً به این شهر امتیاز داده‌اید و امتیاز قابل تغییر نیست.', 'city-contrib' ) : __( 'ثبت امتیاز انجام نشد؛ دوباره تلاش کنید.', 'city-contrib' ),
				array( 'status' => $duplicate ? 409 : 500 )
			);
		}

		$aggregate = self::recalculate_locked( $city_id );
		if ( is_wp_error( $aggregate ) ) {
			$wpdb->query( 'ROLLBACK' );
			return $aggregate;
		}
		$wpdb->query( 'COMMIT' );
		self::clear_public_cache( $city_id );
		do_action( 'cc_rating_created', (int) $wpdb->insert_id, $user_id, $city_id, $stars );

		$result                = self::public_data( $city_id, true );
		$result['user_rating'] = $stars;
		$response              = rest_ensure_response( $result );
		$response->set_status( 201 );
		return CC_Helpers::no_store( $response );
	}

	/** Administrator-only deletion with an audit record and exact recalculation. */
	public static function delete_rating( $request ) {
		global $wpdb;
		$rating_id = absint( $request['id'] );
		$reason    = mb_substr( sanitize_text_field( $request['reason'] ), 0, 255 );
		if ( '' === $reason ) {
			return new WP_Error( 'cc_reason_required', __( 'دلیل حذف رأی لازم است.', 'city-contrib' ), array( 'status' => 400 ) );
		}
		$table = CC_Config::ratings_table();
		$row   = $wpdb->get_row( $wpdb->prepare( "SELECT * FROM {$table} WHERE id = %d", $rating_id ), ARRAY_A );
		if ( ! $row ) {
			return new WP_Error( 'cc_rating_not_found', __( 'رأی پیدا نشد.', 'city-contrib' ), array( 'status' => 404 ) );
		}
		$city_id = (int) $row['city_id'];
		$wpdb->query( 'SET TRANSACTION ISOLATION LEVEL READ COMMITTED' );
		$wpdb->query( 'START TRANSACTION' );
		$wpdb->get_var( $wpdb->prepare( "SELECT ID FROM {$wpdb->posts} WHERE ID = %d FOR UPDATE", $city_id ) );
		$wpdb->insert(
			CC_Config::audit_table(),
			array(
				'rating_id'    => $rating_id,
				'city_id'      => $city_id,
				'user_id'      => (int) $row['user_id'],
				'stars'        => (int) $row['stars'],
				'action'       => 'delete',
				'admin_user_id'=> get_current_user_id(),
				'reason'       => $reason,
				'created_at'   => gmdate( 'Y-m-d H:i:s' ),
			),
			array( '%d', '%d', '%d', '%d', '%s', '%d', '%s', '%s' )
		);
		if ( ! $wpdb->insert_id || false === $wpdb->delete( $table, array( 'id' => $rating_id ), array( '%d' ) ) ) {
			$wpdb->query( 'ROLLBACK' );
			return new WP_Error( 'cc_rating_delete_failed', __( 'حذف رأی انجام نشد.', 'city-contrib' ), array( 'status' => 500 ) );
		}
		$result = self::recalculate_locked( $city_id );
		if ( is_wp_error( $result ) ) {
			$wpdb->query( 'ROLLBACK' );
			return $result;
		}
		$wpdb->query( 'COMMIT' );
		self::clear_public_cache( $city_id );
		return CC_Helpers::no_store( rest_ensure_response( array( 'ok' => true, 'rating' => self::public_data( $city_id, true ) ) ) );
	}

	/**
	 * Read aggregate only from city meta; distribution is separately cached.
	 *
	 * @param int  $city_id City ID.
	 * @param bool $fresh   Bypass transient.
	 * @return array<string,mixed>
	 */
	public static function public_data( $city_id, $fresh = false ) {
		$key = 'cc_rating_public_' . $city_id;
		if ( ! $fresh ) {
			$cached = get_transient( $key );
			if ( is_array( $cached ) ) {
				return $cached;
			}
		}
		global $wpdb;
		$count = (int) get_post_meta( $city_id, 'cc_rating_count', true );
		$sum   = (int) get_post_meta( $city_id, 'cc_rating_sum', true );
		$avg   = $count > 0 ? (float) get_post_meta( $city_id, 'cc_rating_avg', true ) : 0.0;
		$rows  = $wpdb->get_results(
			$wpdb->prepare(
				'SELECT stars, COUNT(*) AS total FROM ' . CC_Config::ratings_table() . ' WHERE city_id = %d GROUP BY stars', // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared
				$city_id
			),
			ARRAY_A
		);
		$distribution = array_fill( 1, (int) CC_Config::get( 'rating_max_stars' ), 0 );
		foreach ( $rows as $row ) {
			$distribution[ (int) $row['stars'] ] = (int) $row['total'];
		}
		$data = array(
			'city_id'      => $city_id,
			'sum'          => $sum,
			'count'        => $count,
			'average'      => round( $avg, 1 ),
			'enough_votes' => $count >= 5,
			'distribution' => $distribution,
			'max_stars'    => (int) CC_Config::get( 'rating_max_stars' ),
		);
		set_transient( $key, $data, (int) CC_Config::get( 'rating_public_cache_seconds' ) );
		return $data;
	}

	/**
	 * Recalculate exact aggregate inside a city-locked transaction.
	 *
	 * @param int $city_id City ID.
	 * @return array|WP_Error
	 */
	private static function recalculate_locked( $city_id ) {
		global $wpdb;
		$table = CC_Config::ratings_table();
		$row   = $wpdb->get_row( $wpdb->prepare( "SELECT COUNT(*) AS total, COALESCE(SUM(stars),0) AS stars_sum FROM {$table} WHERE city_id = %d", $city_id ), ARRAY_A );
		if ( ! is_array( $row ) ) {
			return new WP_Error( 'cc_rating_aggregate', __( 'به‌روزرسانی میانگین انجام نشد.', 'city-contrib' ), array( 'status' => 500 ) );
		}
		$count = (int) $row['total'];
		$sum   = (int) $row['stars_sum'];
		$avg   = $count ? round( $sum / $count, 4 ) : 0;
		update_post_meta( $city_id, 'cc_rating_sum', $sum );
		update_post_meta( $city_id, 'cc_rating_count', $count );
		update_post_meta( $city_id, 'cc_rating_avg', $avg );
		return array( 'sum' => $sum, 'count' => $count, 'average' => $avg );
	}

	/** Clear 60-second aggregate response. */
	private static function clear_public_cache( $city_id ) {
		delete_transient( 'cc_rating_public_' . $city_id );
		clean_post_cache( $city_id );
	}
}
