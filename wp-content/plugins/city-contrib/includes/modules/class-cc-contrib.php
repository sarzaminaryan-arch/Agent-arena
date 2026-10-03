<?php
/**
 * Moderated city contributions.
 *
 * @package City_Contrib
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class CC_Contrib {
	const POST_TYPE = 'cc_submission';

	/** Attach CPT and routes. */
	public static function hooks() {
		add_action( 'init', array( __CLASS__, 'register_type' ), 9 );
		add_action( 'rest_api_init', array( __CLASS__, 'routes' ) );
		add_filter( 'the_content', array( __CLASS__, 'contributor_credit' ), 30 );
	}

	/** Private moderation-only CPT and exact workflow statuses. */
	public static function register_type() {
		register_post_status(
			'approved',
			array(
				'label'                     => _x( 'تأییدشده', 'submission status', 'city-contrib' ),
				'public'                    => false,
				'internal'                  => true,
				'show_in_admin_status_list' => true,
				'label_count'               => _n_noop( 'تأییدشده <span class="count">(%s)</span>', 'تأییدشده <span class="count">(%s)</span>', 'city-contrib' ),
			)
		);
		register_post_status(
			'rejected',
			array(
				'label'                     => _x( 'ردشده', 'submission status', 'city-contrib' ),
				'public'                    => false,
				'internal'                  => true,
				'show_in_admin_status_list' => true,
				'label_count'               => _n_noop( 'ردشده <span class="count">(%s)</span>', 'ردشده <span class="count">(%s)</span>', 'city-contrib' ),
			)
		);
		register_post_type(
			self::POST_TYPE,
			array(
				'labels' => array(
					'name'          => __( 'مشارکت‌ها', 'city-contrib' ),
					'singular_name' => __( 'مشارکت', 'city-contrib' ),
				),
				'public'           => false,
				'show_ui'          => false,
				'show_in_rest'     => false,
				'supports'         => array( 'title', 'author', 'revisions' ),
				'delete_with_user' => false,
			)
		);
	}

	/** REST routes. */
	public static function routes() {
		if ( ! CC_Config::enabled( 'contrib' ) ) {
			return;
		}
		register_rest_route(
			CC_REST::NAMESPACE,
			'/cities/(?P<id>\d+)/submissions',
			array(
				array(
					'methods'             => WP_REST_Server::CREATABLE,
					'callback'            => array( __CLASS__, 'submit' ),
					'permission_callback' => array( 'CC_REST', 'logged_in' ),
				),
				array(
					'methods'             => WP_REST_Server::READABLE,
					'callback'            => array( __CLASS__, 'public_contributions' ),
					'permission_callback' => '__return_true',
				),
			)
		);
		register_rest_route(
			CC_REST::NAMESPACE,
			'/me/submissions',
			array(
				'methods'             => WP_REST_Server::READABLE,
				'callback'            => array( __CLASS__, 'my_submissions' ),
				'permission_callback' => array( 'CC_REST', 'logged_in' ),
			)
		);
		register_rest_route(
			CC_REST::NAMESPACE,
			'/moderation/submissions',
			array(
				'methods'             => WP_REST_Server::READABLE,
				'callback'            => array( __CLASS__, 'moderation_queue' ),
				'permission_callback' => array( 'CC_REST', 'moderator' ),
			)
		);
		register_rest_route(
			CC_REST::NAMESPACE,
			'/moderation/submissions/(?P<id>\d+)',
			array(
				'methods'             => WP_REST_Server::EDITABLE,
				'callback'            => array( __CLASS__, 'moderate' ),
				'permission_callback' => array( 'CC_REST', 'moderator' ),
			)
		);
		register_rest_route(
			CC_REST::NAMESPACE,
			'/moderation/submissions/batch',
			array(
				'methods'             => WP_REST_Server::CREATABLE,
				'callback'            => array( __CLASS__, 'moderate_batch' ),
				'permission_callback' => array( 'CC_REST', 'moderator' ),
			)
		);
	}

	/** Accept one pending contribution. */
	public static function submit( $request ) {
		$city_id = absint( $request['id'] );
		$user_id = get_current_user_id();
		if ( ! CC_Helpers::is_city( $city_id ) ) {
			return new WP_Error( 'cc_city_not_found', __( 'شهر پیدا نشد.', 'city-contrib' ), array( 'status' => 404 ) );
		}
		if ( '' !== trim( (string) $request->get_param( 'website' ) ) ) {
			return new WP_Error( 'cc_spam', __( 'ارسال نامعتبر تشخیص داده شد.', 'city-contrib' ), array( 'status' => 400 ) );
		}
		$limit = self::submission_limit( $user_id );
		if ( is_wp_error( $limit ) ) {
			return $limit;
		}
		$type = sanitize_key( (string) $request->get_param( 'type' ) );
		if ( ! in_array( $type, array( 'introduce', 'correction', 'report', 'tip' ), true ) ) {
			return new WP_Error( 'cc_submission_type', __( 'نوع مشارکت معتبر نیست.', 'city-contrib' ), array( 'status' => 400 ) );
		}
		$payload = self::sanitize_payload( $type, $request->get_params(), $city_id );
		if ( is_wp_error( $payload ) ) {
			return $payload;
		}
		if ( self::contains_promotion( wp_json_encode( $payload, JSON_UNESCAPED_UNICODE ) ) ) {
			return new WP_Error( 'cc_promotional_content', __( 'لینک یا شماره تلفن تبلیغاتی در مشارکت پذیرفته نمی‌شود.', 'city-contrib' ), array( 'status' => 400 ) );
		}
		if ( 'introduce' === $type ) {
			$duplicate = self::find_duplicate( $city_id, $payload );
			if ( $duplicate ) {
				return new WP_Error( 'cc_duplicate', __( 'موردی با نام و موقعیت نزدیک قبلاً ثبت شده است.', 'city-contrib' ), array( 'status' => 409, 'duplicate_id' => $duplicate ) );
			}
		}

		$title = self::submission_title( $type, $payload );
		$post_id = wp_insert_post(
			array(
				'post_type'   => self::POST_TYPE,
				'post_status' => 'pending',
				'post_title'  => $title,
				'post_author' => $user_id,
			),
			true
		);
		if ( is_wp_error( $post_id ) ) {
			return new WP_Error( 'cc_submission_failed', __( 'ذخیره مشارکت انجام نشد؛ دوباره تلاش کنید.', 'city-contrib' ), array( 'status' => 500 ) );
		}

		$attachments = array();
		if ( 'introduce' === $type ) {
			$files = $request->get_file_params();
			$attachments = CC_Images::process( isset( $files['photos'] ) ? $files['photos'] : array(), $post_id );
			if ( is_wp_error( $attachments ) ) {
				wp_delete_post( $post_id, true );
				return $attachments;
			}
			if ( count( $attachments ) < 1 ) {
				wp_delete_post( $post_id, true );
				return new WP_Error( 'cc_photo_required', __( 'برای معرفی مکان یا خوراکی دست‌کم یک عکس لازم است.', 'city-contrib' ), array( 'status' => 400 ) );
			}
		}

		update_post_meta( $post_id, '_cc_type', $type );
		update_post_meta( $post_id, '_cc_city_id', $city_id );
		update_post_meta( $post_id, '_cc_user_id', $user_id );
		update_post_meta( $post_id, '_cc_payload', wp_json_encode( $payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES ) );
		update_post_meta( $post_id, '_cc_attachment_ids', array_map( 'absint', $attachments ) );
		update_post_meta( $post_id, '_cc_ip_hash', CC_Helpers::ip_hash() );
		if ( ! empty( $payload['target_id'] ) ) {
			update_post_meta( $post_id, '_cc_target_id', (int) $payload['target_id'] );
		}
		do_action( 'cc_submission_created', $post_id, $type, $city_id, $user_id );

		$response = rest_ensure_response(
			array(
				'id'      => $post_id,
				'status'  => 'pending',
				'message' => __( 'مشارکت شما ثبت شد و در انتظار تأیید ناظر است.', 'city-contrib' ),
			)
		);
		$response->set_status( 201 );
		return CC_Helpers::no_store( $response );
	}

	/** Public, approved tips and introductions; reports never leak publicly. */
	public static function public_contributions( $request ) {
		$city_id = absint( $request['id'] );
		if ( ! CC_Helpers::is_city( $city_id ) ) {
			return new WP_Error( 'cc_city_not_found', __( 'شهر پیدا نشد.', 'city-contrib' ), array( 'status' => 404 ) );
		}
		$page = max( 1, absint( $request->get_param( 'page' ) ) );
		$query = new WP_Query(
			array(
				'post_type'      => self::POST_TYPE,
				'post_status'    => 'approved',
				'posts_per_page' => 12,
				'paged'          => $page,
				'orderby'        => 'date',
				'order'          => 'DESC',
				'meta_query'     => array(
					'relation' => 'AND',
					array( 'key' => '_cc_city_id', 'value' => $city_id, 'compare' => '=', 'type' => 'NUMERIC' ),
					array( 'key' => '_cc_type', 'value' => array( 'introduce', 'tip' ), 'compare' => 'IN' ),
				),
			)
		);
		$items = array();
		foreach ( $query->posts as $post ) {
			$items[] = self::serialize_submission( $post, false );
		}
		$response = rest_ensure_response( array( 'items' => $items, 'page' => $page, 'pages' => (int) $query->max_num_pages, 'total' => (int) $query->found_posts ) );
		$response->header( 'Cache-Control', 'public, max-age=60, stale-while-revalidate=120' );
		return $response;
	}

	/** Current user's paginated submissions. */
	public static function my_submissions( $request ) {
		$page  = max( 1, absint( $request->get_param( 'page' ) ) );
		$query = new WP_Query(
			array(
				'post_type'      => self::POST_TYPE,
				'post_status'    => array( 'pending', 'approved', 'rejected' ),
				'author'         => get_current_user_id(),
				'posts_per_page' => 12,
				'paged'          => $page,
				'orderby'        => 'date',
				'order'          => 'DESC',
			)
		);
		$items = array_map( static function ( $post ) { return self::serialize_submission( $post, true ); }, $query->posts );
		return CC_Helpers::no_store( rest_ensure_response( array( 'items' => $items, 'page' => $page, 'pages' => (int) $query->max_num_pages, 'total' => (int) $query->found_posts ) ) );
	}

	/** City-scoped queue for moderators. */
	public static function moderation_queue( $request ) {
		$allowed = self::moderator_cities();
		$city_id = absint( $request->get_param( 'city_id' ) );
		if ( ! current_user_can( 'manage_options' ) ) {
			if ( $city_id && ! in_array( $city_id, $allowed, true ) ) {
				return new WP_Error( 'cc_wrong_city', __( 'ناظر فقط مشارکت‌های شهر خودش را می‌بیند.', 'city-contrib' ), array( 'status' => 403 ) );
			}
			if ( ! $city_id && count( $allowed ) === 1 ) {
				$city_id = reset( $allowed );
			}
			if ( ! $allowed ) {
				return new WP_Error( 'cc_city_required', __( 'برای این ناظر شهری تعیین نشده است.', 'city-contrib' ), array( 'status' => 403 ) );
			}
		}
		$status = sanitize_key( (string) $request->get_param( 'status' ) );
		$status = in_array( $status, array( 'pending', 'approved', 'rejected' ), true ) ? $status : 'pending';
		$type   = sanitize_key( (string) $request->get_param( 'type' ) );
		$page   = max( 1, absint( $request->get_param( 'page' ) ) );
		$meta   = array();
		if ( $city_id ) {
			$meta[] = array( 'key' => '_cc_city_id', 'value' => $city_id, 'compare' => '=', 'type' => 'NUMERIC' );
		} elseif ( ! current_user_can( 'manage_options' ) ) {
			$meta[] = array( 'key' => '_cc_city_id', 'value' => $allowed, 'compare' => 'IN', 'type' => 'NUMERIC' );
		}
		if ( in_array( $type, array( 'introduce', 'correction', 'report', 'tip' ), true ) ) {
			$meta[] = array( 'key' => '_cc_type', 'value' => $type );
		}
		$query = new WP_Query(
			array(
				'post_type'      => self::POST_TYPE,
				'post_status'    => $status,
				'posts_per_page' => 20,
				'paged'          => $page,
				'orderby'        => 'date',
				'order'          => 'ASC',
				'meta_query'     => $meta,
			)
		);
		$items = array_map( static function ( $post ) { return self::serialize_submission( $post, true, true ); }, $query->posts );
		return CC_Helpers::no_store( rest_ensure_response( array( 'items' => $items, 'page' => $page, 'pages' => (int) $query->max_num_pages, 'total' => (int) $query->found_posts ) ) );
	}

	/** Approve/reject a single submission, with optional small text edits. */
	public static function moderate( $request ) {
		$post_id = absint( $request['id'] );
		$post    = get_post( $post_id );
		if ( ! $post || self::POST_TYPE !== $post->post_type ) {
			return new WP_Error( 'cc_submission_not_found', __( 'مشارکت پیدا نشد.', 'city-contrib' ), array( 'status' => 404 ) );
		}
		$city_id = (int) get_post_meta( $post_id, '_cc_city_id', true );
		if ( ! self::can_moderate_city( $city_id ) ) {
			return new WP_Error( 'cc_wrong_city', __( 'ناظر فقط مشارکت‌های شهر خودش را بررسی می‌کند.', 'city-contrib' ), array( 'status' => 403 ) );
		}
		if ( 'pending' !== $post->post_status ) {
			return new WP_Error( 'cc_already_moderated', __( 'این مشارکت قبلاً بررسی شده است.', 'city-contrib' ), array( 'status' => 409 ) );
		}
		$action = sanitize_key( (string) $request->get_param( 'action' ) );
		if ( ! in_array( $action, array( 'approve', 'reject' ), true ) ) {
			return new WP_Error( 'cc_action_invalid', __( 'عملیات بررسی معتبر نیست.', 'city-contrib' ), array( 'status' => 400 ) );
		}
		$edits = $request->get_param( 'edits' );
		if ( is_array( $edits ) && $edits ) {
			self::apply_moderator_edits( $post_id, $edits );
		}
		if ( 'reject' === $action ) {
			$reason = sanitize_key( (string) $request->get_param( 'reason' ) );
			$reasons = self::rejection_reasons();
			if ( ! isset( $reasons[ $reason ] ) ) {
				return new WP_Error( 'cc_reason_invalid', __( 'یکی از دلیل‌های آماده را انتخاب کنید.', 'city-contrib' ), array( 'status' => 400 ) );
			}
			update_post_meta( $post_id, '_cc_rejection_reason', $reason );
			update_post_meta( $post_id, '_cc_moderated_by', get_current_user_id() );
			update_post_meta( $post_id, '_cc_moderated_at', gmdate( 'Y-m-d H:i:s' ) );
			wp_update_post( array( 'ID' => $post_id, 'post_status' => 'rejected' ) );
			do_action( 'cc_submission_rejected', $post_id, $reason, get_current_user_id() );
			return CC_Helpers::no_store( rest_ensure_response( self::serialize_submission( get_post( $post_id ), true, true ) ) );
		}

		$published = self::publish_approved( $post_id );
		if ( is_wp_error( $published ) ) {
			return $published;
		}
		update_post_meta( $post_id, '_cc_moderated_by', get_current_user_id() );
		update_post_meta( $post_id, '_cc_moderated_at', gmdate( 'Y-m-d H:i:s' ) );
		wp_update_post( array( 'ID' => $post_id, 'post_status' => 'approved' ) );
		do_action( 'cc_submission_approved', $post_id, $published, get_current_user_id() );
		return CC_Helpers::no_store( rest_ensure_response( self::serialize_submission( get_post( $post_id ), true, true ) ) );
	}

	/** Batch moderation, reusing all per-item city/status checks. */
	public static function moderate_batch( $request ) {
		$ids = array_slice( array_filter( array_map( 'absint', (array) $request->get_param( 'ids' ) ) ), 0, 50 );
		if ( ! $ids ) {
			return new WP_Error( 'cc_ids_required', __( 'حداقل یک مشارکت را انتخاب کنید.', 'city-contrib' ), array( 'status' => 400 ) );
		}
		$results = array();
		foreach ( $ids as $id ) {
			$single = new WP_REST_Request( 'PATCH' );
			$single->set_param( 'id', $id );
			$single->set_param( 'action', $request->get_param( 'action' ) );
			$single->set_param( 'reason', $request->get_param( 'reason' ) );
			$result = self::moderate( $single );
			$results[] = is_wp_error( $result ) ? array( 'id' => $id, 'ok' => false, 'message' => $result->get_error_message() ) : array( 'id' => $id, 'ok' => true );
		}
		return CC_Helpers::no_store( rest_ensure_response( array( 'items' => $results ) ) );
	}

	/** Prepared rejection reasons. */
	public static function rejection_reasons() {
		return array(
			'duplicate'    => __( 'مورد تکراری است', 'city-contrib' ),
			'incomplete'   => __( 'اطلاعات کافی نیست', 'city-contrib' ),
			'wrong_city'   => __( 'به این شهر مربوط نیست', 'city-contrib' ),
			'advertising'  => __( 'محتوای تبلیغاتی دارد', 'city-contrib' ),
			'unsafe'       => __( 'محتوای نامناسب یا اطلاعات شخصی دارد', 'city-contrib' ),
			'unverifiable' => __( 'قابل راستی‌آزمایی نیست', 'city-contrib' ),
		);
	}

	/** Moderator's assigned city IDs; admins have unrestricted scope. */
	public static function moderator_cities( $user_id = 0 ) {
		$user_id = $user_id ? $user_id : get_current_user_id();
		$ids     = get_user_meta( $user_id, 'cc_moderator_city_ids', true );
		return array_values( array_filter( array_map( 'absint', (array) $ids ) ) );
	}

	/** Scope check. */
	public static function can_moderate_city( $city_id ) {
		return current_user_can( 'manage_options' ) || in_array( (int) $city_id, self::moderator_cities(), true );
	}

	/** Add approved free-form corrections and contributor credit to entity pages. */
	public static function contributor_credit( $content ) {
		if ( ! is_singular() || ! in_the_loop() || ! is_main_query() ) {
			return $content;
		}
		$post_id = get_the_ID();
		$append  = '';
		$notes   = (array) get_post_meta( $post_id, 'cc_approved_notes', true );
		if ( $notes ) {
			$append .= '<section class="cc-approved-notes"><h2>' . esc_html__( 'اصلاحات تأییدشده مردم', 'city-contrib' ) . '</h2><ul>';
			foreach ( $notes as $note ) {
				if ( ! empty( $note['text'] ) ) {
					$append .= '<li>' . esc_html( $note['text'] ) . '</li>';
				}
			}
			$append .= '</ul></section>';
		}
		$user_id = (int) get_post_meta( $post_id, 'cc_contributor_user_id', true );
		if ( $user_id ) {
			$credit  = sprintf( __( 'این اطلاعات را %s به شهر اضافه کرده است.', 'city-contrib' ), CC_Helpers::user_alias( $user_id ) );
			$append .= '<p class="cc-contributor-credit">' . esc_html( $credit ) . '</p>';
		}
		return $content . $append;
	}

	/** Validate and sanitize type-specific payload. */
	private static function sanitize_payload( $type, $params, $city_id ) {
		$payload = array();
		if ( 'introduce' === $type ) {
			$subtype = sanitize_key( $params['subtype'] ?? '' );
			if ( ! in_array( $subtype, array( 'place', 'food', 'souvenir' ), true ) ) {
				return new WP_Error( 'cc_subtype', __( 'دسته معرفی را انتخاب کنید.', 'city-contrib' ), array( 'status' => 400 ) );
			}
			$name        = mb_substr( trim( sanitize_text_field( $params['name'] ?? '' ) ), 0, 100 );
			$description = mb_substr( trim( sanitize_textarea_field( $params['description'] ?? '' ) ), 0, 3000 );
			$address     = mb_substr( trim( sanitize_text_field( $params['address'] ?? '' ) ), 0, 300 );
			$lat         = isset( $params['lat'] ) && '' !== $params['lat'] ? (float) $params['lat'] : null;
			$lng         = isset( $params['lng'] ) && '' !== $params['lng'] ? (float) $params['lng'] : null;
			if ( mb_strlen( $name ) < 2 || mb_strlen( $description ) < 40 ) {
				return new WP_Error( 'cc_introduce_short', __( 'نام و توضیح دست‌کم ۴۰ کاراکتری لازم است.', 'city-contrib' ), array( 'status' => 400 ) );
			}
			if ( '' === $address && ( null === $lat || null === $lng ) ) {
				return new WP_Error( 'cc_location_required', __( 'نشانی یا مختصات روی نقشه لازم است.', 'city-contrib' ), array( 'status' => 400 ) );
			}
			if ( ( null !== $lat && ( $lat < -90 || $lat > 90 ) ) || ( null !== $lng && ( $lng < -180 || $lng > 180 ) ) ) {
				return new WP_Error( 'cc_coordinates', __( 'مختصات جغرافیایی معتبر نیست.', 'city-contrib' ), array( 'status' => 400 ) );
			}
			$payload = array( 'subtype' => $subtype, 'name' => $name, 'category' => mb_substr( sanitize_text_field( $params['category'] ?? '' ), 0, 80 ), 'description' => $description, 'address' => $address, 'lat' => $lat, 'lng' => $lng );
		} elseif ( 'correction' === $type ) {
			$sections = array( 'description', 'access_air', 'access_rail', 'access_road', 'map', 'facts', 'other' );
			$section  = sanitize_key( $params['section'] ?? '' );
			$text     = mb_substr( trim( sanitize_textarea_field( $params['corrected_text'] ?? '' ) ), 0, 3000 );
			$reason   = mb_substr( trim( sanitize_textarea_field( $params['reason'] ?? '' ) ), 0, 500 );
			if ( ! in_array( $section, $sections, true ) || mb_strlen( $text ) < 5 || mb_strlen( $reason ) < 3 ) {
				return new WP_Error( 'cc_correction_fields', __( 'بخش، متن اصلاح‌شده و دلیل اصلاح را کامل کنید.', 'city-contrib' ), array( 'status' => 400 ) );
			}
			$payload = array( 'section' => $section, 'corrected_text' => $text, 'reason' => $reason, 'target_id' => self::valid_target( absint( $params['target_id'] ?? $city_id ), $city_id ) );
		} elseif ( 'report' === $type ) {
			$kind = sanitize_key( $params['report_kind'] ?? 'error' );
			if ( ! in_array( $kind, array( 'closed', 'error' ), true ) ) {
				$kind = 'error';
			}
			$payload = array( 'report_kind' => $kind, 'description' => mb_substr( trim( sanitize_textarea_field( $params['description'] ?? '' ) ), 0, 800 ), 'target_id' => self::valid_target( absint( $params['target_id'] ?? $city_id ), $city_id ) );
		} else {
			$tip = mb_substr( trim( sanitize_textarea_field( $params['tip'] ?? '' ) ), 0, 280 );
			if ( mb_strlen( $tip ) < 3 ) {
				return new WP_Error( 'cc_tip_short', __( 'نکته محلی را بنویسید.', 'city-contrib' ), array( 'status' => 400 ) );
			}
			$payload = array( 'tip' => $tip );
		}
		return $payload;
	}

	/** Ensure correction/report target belongs to this city. */
	private static function valid_target( $target_id, $city_id ) {
		if ( $target_id === $city_id ) {
			return $city_id;
		}
		$target_city = (int) get_post_meta( $target_id, 'sa_city_id', true );
		return $target_city === $city_id ? $target_id : $city_id;
	}

	/** Generic promotion detector. */
	private static function contains_promotion( $text ) {
		return (bool) preg_match( '/(?:https?:\/\/|www\.|t\.me\/|@\w{4,}|(?:\+?98|0)?9\d{9}|\d{8,})/iu', (string) $text );
	}

	/** Daily anti-spam cap. */
	private static function submission_limit( $user_id ) {
		$user = get_userdata( $user_id );
		$age  = $user ? time() - strtotime( $user->user_registered . ' UTC' ) : 0;
		$cap  = $age < ( (int) CC_Config::get( 'contrib_new_user_days' ) * DAY_IN_SECONDS ) ? (int) CC_Config::get( 'contrib_new_user_daily_limit' ) : (int) CC_Config::get( 'contrib_daily_limit' );
		$query = new WP_Query(
			array(
				'post_type'      => self::POST_TYPE,
				'post_status'    => array( 'pending', 'approved', 'rejected' ),
				'author'         => $user_id,
				'posts_per_page' => 1,
				'fields'         => 'ids',
				'date_query'     => array( array( 'after' => '24 hours ago' ) ),
			)
		);
		return $query->found_posts >= $cap ? new WP_Error( 'cc_submission_limit', __( 'سقف ارسال روزانه شما پر شده است؛ فردا دوباره تلاش کنید.', 'city-contrib' ), array( 'status' => 429 ) ) : true;
	}

	/** Duplicate title and <100m proximity detection. */
	private static function find_duplicate( $city_id, $payload ) {
		$query = new WP_Query(
			array(
				'post_type'      => self::POST_TYPE,
				'post_status'    => array( 'pending', 'approved' ),
				'posts_per_page' => 100,
				'fields'         => 'ids',
				'meta_query'     => array(
					array( 'key' => '_cc_city_id', 'value' => $city_id, 'type' => 'NUMERIC' ),
					array( 'key' => '_cc_type', 'value' => 'introduce' ),
				),
			)
		);
		foreach ( $query->posts as $id ) {
			$old = json_decode( (string) get_post_meta( $id, '_cc_payload', true ), true );
			if ( ! is_array( $old ) ) {
				continue;
			}
			$similar = CC_Helpers::similarity( $payload['name'], $old['name'] ?? '' );
			if ( $similar >= 0.92 && ( null === $payload['lat'] || ! isset( $old['lat'] ) || null === $old['lat'] ) ) {
				return (int) $id;
			}
			if ( $similar >= 0.75 && null !== $payload['lat'] && isset( $old['lat'], $old['lng'] ) && null !== $old['lat'] && CC_Helpers::distance_metres( $payload['lat'], $payload['lng'], $old['lat'], $old['lng'] ) < 100 ) {
				return (int) $id;
			}
		}
		$target_type = 'place' === $payload['subtype'] ? 'attraction' : ( 'food' === $payload['subtype'] ? 'local_food' : 'souvenir' );
		$existing = get_posts( array( 'post_type' => $target_type, 'post_status' => 'publish', 'posts_per_page' => 100, 'meta_key' => 'sa_city_id', 'meta_value' => $city_id ) );
		foreach ( $existing as $post ) {
			if ( CC_Helpers::similarity( $payload['name'], $post->post_title ) >= 0.92 ) {
				return (int) $post->ID;
			}
		}
		return 0;
	}

	/** Publish approved introduction or apply safe city metadata. */
	private static function publish_approved( $submission_id ) {
		$type    = get_post_meta( $submission_id, '_cc_type', true );
		$payload = json_decode( (string) get_post_meta( $submission_id, '_cc_payload', true ), true );
		$city_id = (int) get_post_meta( $submission_id, '_cc_city_id', true );
		$user_id = (int) get_post_meta( $submission_id, '_cc_user_id', true );
		if ( ! is_array( $payload ) || ! CC_Helpers::is_city( $city_id ) ) {
			return new WP_Error( 'cc_submission_data', __( 'داده مشارکت ناقص است.', 'city-contrib' ), array( 'status' => 500 ) );
		}
		$published_id = 0;
		if ( 'introduce' === $type ) {
			$post_type = 'place' === $payload['subtype'] ? 'attraction' : ( 'food' === $payload['subtype'] ? 'local_food' : 'souvenir' );
			if ( ! post_type_exists( $post_type ) ) {
				// The approved submission remains publishable in the city contribution feed.
				return 0;
			}
			$published_id = wp_insert_post(
				array(
					'post_type'    => $post_type,
					'post_status'  => 'publish',
					'post_title'   => $payload['name'],
					'post_content' => wpautop( esc_html( $payload['description'] ) ),
					'post_excerpt' => wp_trim_words( $payload['description'], 28, '…' ),
					'post_author'  => $user_id,
				),
				true
			);
			if ( is_wp_error( $published_id ) ) {
				return new WP_Error( 'cc_publish_failed', __( 'ساخت صفحه مقصد انجام نشد.', 'city-contrib' ), array( 'status' => 500 ) );
			}
			update_post_meta( $published_id, 'sa_city_id', $city_id );
			$province_id = (int) get_post_meta( $city_id, 'sa_province_id', true );
			if ( $province_id ) {
				update_post_meta( $published_id, 'sa_province_id', $province_id );
			}
			if ( ! empty( $payload['address'] ) ) {
				update_post_meta( $published_id, 'sa_address', $payload['address'] );
				if ( 'souvenir' === $post_type ) {
					update_post_meta( $published_id, 'sa_purchase_location', $payload['address'] );
				}
			}
			if ( null !== $payload['lat'] ) {
				update_post_meta( $published_id, 'sa_latitude', $payload['lat'] );
				update_post_meta( $published_id, 'sa_longitude', $payload['lng'] );
			}
			update_post_meta( $published_id, 'sa_seo_title', $payload['name'] . ' | ' . get_the_title( $city_id ) );
			update_post_meta( $published_id, 'sa_seo_description', wp_trim_words( $payload['description'], 28, '…' ) );
			update_post_meta( $published_id, 'sa_focus_keyword', $payload['name'] );
			update_post_meta( $published_id, 'cc_contributor_user_id', $user_id );
			update_post_meta( $published_id, 'cc_source_submission_id', $submission_id );
			$attachments = (array) get_post_meta( $submission_id, '_cc_attachment_ids', true );
			if ( $attachments ) {
				set_post_thumbnail( $published_id, (int) reset( $attachments ) );
				foreach ( $attachments as $attachment_id ) {
					wp_update_post( array( 'ID' => (int) $attachment_id, 'post_parent' => $published_id ) );
				}
			}
			if ( taxonomy_exists( 'province_tax' ) ) {
				$terms = wp_get_object_terms( $city_id, 'province_tax', array( 'fields' => 'ids' ) );
				if ( ! is_wp_error( $terms ) && $terms ) {
					wp_set_object_terms( $published_id, $terms, 'province_tax' );
				}
			}
			update_post_meta( $submission_id, '_cc_published_post_id', $published_id );
		} elseif ( 'correction' === $type ) {
			$target = (int) $payload['target_id'];
			$map = array( 'access_air' => 'sa_access_air', 'access_rail' => 'sa_access_rail', 'access_road' => 'sa_access_road', 'map' => 'sa_google_map_url' );
			if ( isset( $map[ $payload['section'] ] ) ) {
				$value = 'map' === $payload['section'] ? esc_url_raw( $payload['corrected_text'] ) : $payload['corrected_text'];
				update_post_meta( $target, $map[ $payload['section'] ], $value );
			} elseif ( 'description' === $payload['section'] ) {
				wp_update_post( array( 'ID' => $target, 'post_excerpt' => $payload['corrected_text'] ) );
			} else {
				$notes   = (array) get_post_meta( $target, 'cc_approved_notes', true );
				$notes[] = array( 'text' => $payload['corrected_text'], 'submission_id' => $submission_id, 'created_at' => gmdate( 'Y-m-d H:i:s' ) );
				update_post_meta( $target, 'cc_approved_notes', array_slice( $notes, -20 ) );
			}
			$published_id = $target;
			update_post_meta( $submission_id, '_cc_published_post_id', $published_id );
		} elseif ( 'report' === $type ) {
			$target = (int) $payload['target_id'];
			update_post_meta( $target, 'cc_last_verified_report', array( 'kind' => $payload['report_kind'], 'submission_id' => $submission_id, 'at' => gmdate( 'Y-m-d H:i:s' ) ) );
			$published_id = $target;
		}
		return (int) $published_id;
	}

	/** Moderator may correct only known text payload fields. */
	private static function apply_moderator_edits( $post_id, $edits ) {
		$payload = json_decode( (string) get_post_meta( $post_id, '_cc_payload', true ), true );
		if ( ! is_array( $payload ) ) {
			return;
		}
		$allowed = array( 'name', 'category', 'description', 'address', 'corrected_text', 'reason', 'tip' );
		foreach ( $allowed as $key ) {
			if ( isset( $edits[ $key ] ) && array_key_exists( $key, $payload ) ) {
				$payload[ $key ] = mb_substr( trim( sanitize_textarea_field( $edits[ $key ] ) ), 0, 'tip' === $key ? 280 : 3000 );
			}
		}
		update_post_meta( $post_id, '_cc_payload', wp_json_encode( $payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES ) );
	}

	/** Serialize without exposing phone/IP. */
	private static function serialize_submission( $post, $private = false, $moderator = false ) {
		$payload = json_decode( (string) get_post_meta( $post->ID, '_cc_payload', true ), true );
		$type    = get_post_meta( $post->ID, '_cc_type', true );
		$user_id = (int) get_post_meta( $post->ID, '_cc_user_id', true );
		$city_id = (int) get_post_meta( $post->ID, '_cc_city_id', true );
		$ids     = array_map( 'absint', (array) get_post_meta( $post->ID, '_cc_attachment_ids', true ) );
		$item = array(
			'id'         => $post->ID,
			'type'       => $type,
			'status'     => $post->post_status,
			'title'      => $post->post_title,
			'city_id'    => $city_id,
			'city_name'  => get_the_title( $city_id ),
			'alias'      => CC_Helpers::user_alias( $user_id ),
			'payload'    => $payload,
			'images'     => array_values( array_filter( array_map( static function ( $id ) { return wp_get_attachment_image_url( $id, 'medium' ); }, $ids ) ) ),
			'created_at' => get_post_time( DATE_ATOM, true, $post ),
			'published_url' => ( $target = (int) get_post_meta( $post->ID, '_cc_published_post_id', true ) ) ? get_permalink( $target ) : '',
		);
		if ( $private ) {
			$reason = get_post_meta( $post->ID, '_cc_rejection_reason', true );
			$item['rejection_reason'] = $reason;
			$item['rejection_label']  = $reason && isset( self::rejection_reasons()[ $reason ] ) ? self::rejection_reasons()[ $reason ] : '';
		}
		if ( $moderator ) {
			$item['user_id'] = $user_id;
		}
		return $item;
	}

	/** Human title per submission type. */
	private static function submission_title( $type, $payload ) {
		if ( 'introduce' === $type ) {
			return $payload['name'];
		}
		if ( 'tip' === $type ) {
			return wp_trim_words( $payload['tip'], 8, '…' );
		}
		return 'correction' === $type ? __( 'پیشنهاد اصلاح', 'city-contrib' ) : __( 'گزارش خطا یا تعطیلی', 'city-contrib' );
	}
}
