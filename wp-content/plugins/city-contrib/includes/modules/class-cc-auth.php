<?php
/**
 * Passwordless mobile authentication.
 *
 * @package City_Contrib
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class CC_Auth {
	const OTP_PREFIX = 'cc_otp_';

	/** Attach routes and privacy actions. */
	public static function hooks() {
		add_action( 'rest_api_init', array( __CLASS__, 'routes' ) );
	}

	/** Register auth routes. */
	public static function routes() {
		register_rest_route(
			CC_REST::NAMESPACE,
			'/session',
			array(
				'methods'             => WP_REST_Server::READABLE,
				'callback'            => array( __CLASS__, 'session' ),
				'permission_callback' => '__return_true',
			)
		);
		if ( CC_Config::enabled( 'auth' ) ) {
			register_rest_route(
				CC_REST::NAMESPACE,
				'/auth/request-otp',
				array(
					'methods'             => WP_REST_Server::CREATABLE,
					'callback'            => array( __CLASS__, 'request_otp' ),
					'permission_callback' => '__return_true',
					'args'                => array(
						'mobile' => array( 'required' => true, 'type' => 'string' ),
						'nonce'  => array( 'required' => true, 'type' => 'string' ),
					),
				)
			);
			register_rest_route(
				CC_REST::NAMESPACE,
				'/auth/verify-otp',
				array(
					'methods'             => WP_REST_Server::CREATABLE,
					'callback'            => array( __CLASS__, 'verify_otp' ),
					'permission_callback' => '__return_true',
					'args'                => array(
						'mobile'         => array( 'required' => true, 'type' => 'string' ),
						'code'           => array( 'required' => true, 'type' => 'string' ),
						'nonce'          => array( 'required' => true, 'type' => 'string' ),
						'accepted_terms' => array( 'type' => 'boolean' ),
						'alias'          => array( 'type' => 'string' ),
						'city_id'        => array( 'type' => 'integer' ),
					),
				)
			);
		}
		register_rest_route(
			CC_REST::NAMESPACE,
			'/auth/logout',
			array(
				'methods'             => WP_REST_Server::CREATABLE,
				'callback'            => array( __CLASS__, 'logout' ),
				'permission_callback' => array( 'CC_REST', 'logged_in' ),
			)
		);
		register_rest_route(
			CC_REST::NAMESPACE,
			'/me/account',
			array(
				'methods'             => WP_REST_Server::DELETABLE,
				'callback'            => array( __CLASS__, 'delete_account' ),
				'permission_callback' => array( 'CC_REST', 'logged_in' ),
			)
		);
	}

	/**
	 * Cookie authentication normally requires a nonce in REST. The session route
	 * deliberately validates the signed logged-in cookie first, then issues that
	 * nonce dynamically so full-page caches never contain user state.
	 *
	 * @return int User ID or zero.
	 */
	public static function restore_cookie_user() {
		if ( get_current_user_id() ) {
			return get_current_user_id();
		}
		$user_id = wp_validate_auth_cookie( '', 'logged_in' );
		if ( $user_id ) {
			wp_set_current_user( $user_id );
			return (int) $user_id;
		}
		return 0;
	}

	/** Dynamic cache-safe session state. */
	public static function session() {
		$user_id  = self::restore_cookie_user();
		$response = rest_ensure_response(
			array(
				'logged_in'   => (bool) $user_id,
				'user'        => $user_id ? array(
					'id'        => $user_id,
					'alias'     => CC_Helpers::user_alias( $user_id ),
					'home_city' => (int) get_user_meta( $user_id, 'cc_home_city', true ),
				) : null,
				'nonce'       => $user_id ? wp_create_nonce( 'wp_rest' ) : '',
				'public_nonce'=> wp_create_nonce( 'cc_public' ),
			)
		);
		return CC_Helpers::no_store( $response );
	}

	/** Send OTP after rate limiting. */
	public static function request_otp( $request ) {
		if ( ! wp_verify_nonce( sanitize_text_field( $request['nonce'] ), 'cc_public' ) ) {
			return new WP_Error( 'cc_bad_nonce', __( 'درخواست نامعتبر است؛ دوباره تلاش کنید.', 'city-contrib' ), array( 'status' => 403 ) );
		}
		$mobile = self::normalize_mobile( $request['mobile'] );
		if ( is_wp_error( $mobile ) ) {
			return $mobile;
		}
		$phone_key = 'cc_otp_phone_' . hash_hmac( 'sha256', $mobile, wp_salt( 'nonce' ) );
		$ip_key    = 'cc_otp_ip_' . CC_Helpers::ip_hash();
		$limit     = (int) CC_Config::get( 'otp_hourly_limit' );
		if ( ! self::consume_limit( $phone_key, $limit, HOUR_IN_SECONDS ) || ! self::consume_limit( $ip_key, $limit, HOUR_IN_SECONDS ) ) {
			return new WP_Error( 'cc_otp_rate', __( 'در هر ساعت فقط سه کد می‌توانید بگیرید. کمی بعد دوباره تلاش کنید.', 'city-contrib' ), array( 'status' => 429 ) );
		}

		$length = (int) CC_Config::get( 'otp_length' );
		$code   = (string) random_int( 10 ** ( $length - 1 ), ( 10 ** $length ) - 1 );
		$key    = self::OTP_PREFIX . hash_hmac( 'sha256', $mobile, wp_salt( 'nonce' ) );
		set_transient(
			$key,
			array(
				'hash'     => wp_hash_password( $code ),
				'attempts' => 0,
				'issued'   => time(),
			),
			(int) CC_Config::get( 'otp_ttl' )
		);

		$provider = self::provider();
		$sent     = $provider->send( $mobile, $code );
		if ( is_wp_error( $sent ) ) {
			delete_transient( $key );
			return $sent;
		}

		$data = array(
			'ok'         => true,
			'expires_in' => (int) CC_Config::get( 'otp_ttl' ),
			'message'    => __( 'کد پنج‌رقمی ارسال شد.', 'city-contrib' ),
		);
		if ( 'debug' === CC_Config::get( 'otp_provider' ) && defined( 'WP_DEBUG' ) && WP_DEBUG && current_user_can( 'manage_options' ) ) {
			$data['debug_code'] = $code;
		}
		return CC_Helpers::no_store( rest_ensure_response( $data ) );
	}

	/** Verify OTP and create or log in the unique mobile account. */
	public static function verify_otp( $request ) {
		if ( ! wp_verify_nonce( sanitize_text_field( $request['nonce'] ), 'cc_public' ) ) {
			return new WP_Error( 'cc_bad_nonce', __( 'درخواست نامعتبر است؛ دوباره تلاش کنید.', 'city-contrib' ), array( 'status' => 403 ) );
		}
		$mobile = self::normalize_mobile( $request['mobile'] );
		if ( is_wp_error( $mobile ) ) {
			return $mobile;
		}
		$key  = self::OTP_PREFIX . hash_hmac( 'sha256', $mobile, wp_salt( 'nonce' ) );
		$data = get_transient( $key );
		$code = preg_replace( '/\D+/', '', self::latin_digits( (string) $request['code'] ) );
		if ( ! is_array( $data ) || empty( $data['hash'] ) ) {
			return new WP_Error( 'cc_otp_expired', __( 'کد منقضی شده است؛ کد تازه بگیرید.', 'city-contrib' ), array( 'status' => 410 ) );
		}
		$data['attempts'] = isset( $data['attempts'] ) ? (int) $data['attempts'] + 1 : 1;
		if ( $data['attempts'] > 5 ) {
			delete_transient( $key );
			return new WP_Error( 'cc_otp_attempts', __( 'تعداد تلاش‌ها زیاد بود؛ کد تازه بگیرید.', 'city-contrib' ), array( 'status' => 429 ) );
		}
		set_transient( $key, $data, max( 1, (int) CC_Config::get( 'otp_ttl' ) - ( time() - (int) $data['issued'] ) ) );
		if ( ! wp_check_password( $code, $data['hash'] ) ) {
			return new WP_Error( 'cc_otp_wrong', __( 'کد واردشده درست نیست.', 'city-contrib' ), array( 'status' => 400 ) );
		}

		// The mobile number itself is never stored; a deterministic keyed hash is the unique login.
		$login  = 'cc_' . substr( hash_hmac( 'sha256', $mobile, wp_salt( 'auth' ) ), 0, 40 );
		$user   = get_user_by( 'login', $login );
		$is_new = ! $user;
		if ( $is_new ) {
			if ( ! rest_sanitize_boolean( $request['accepted_terms'] ) ) {
				// Keep the valid code alive so accepting the rules does not require a second SMS.
				return new WP_Error( 'cc_terms_required', __( 'برای ساخت حساب باید قوانین مشارکت را بپذیرید.', 'city-contrib' ), array( 'status' => 400 ) );
			}
			$alias   = self::sanitize_alias( $request['alias'] );
			$user_id = wp_insert_user(
				array(
					'user_login'   => $login,
					'user_pass'    => wp_generate_password( 48, true, true ),
					'nickname'     => $alias,
					'display_name' => $alias,
					'role'         => 'subscriber',
				)
			);
			if ( is_wp_error( $user_id ) ) {
				return new WP_Error( 'cc_user_create', __( 'ساخت حساب انجام نشد؛ دوباره تلاش کنید.', 'city-contrib' ), array( 'status' => 500 ) );
			}
			update_user_meta( $user_id, 'cc_mobile_hash', hash_hmac( 'sha256', $mobile, wp_salt( 'auth' ) ) );
			update_user_meta( $user_id, 'cc_mobile_verified', gmdate( 'Y-m-d H:i:s' ) );
			update_user_meta( $user_id, 'cc_terms_accepted', gmdate( 'Y-m-d H:i:s' ) );
			update_user_meta( $user_id, 'cc_public_alias', $alias );
			$city_id = absint( $request['city_id'] );
			if ( CC_Helpers::is_city( $city_id ) ) {
				update_user_meta( $user_id, 'cc_home_city', $city_id );
				update_user_meta( $user_id, 'cc_home_city_changed', gmdate( 'Y-m-d H:i:s' ) );
			}
			$user = get_userdata( $user_id );
		}
		delete_transient( $key );

		wp_set_current_user( $user->ID );
		wp_set_auth_cookie( $user->ID, true, is_ssl() );
		do_action( 'wp_login', $user->user_login, $user );
		do_action( 'cc_user_otp_login', $user->ID, $is_new );

		return CC_Helpers::no_store(
			rest_ensure_response(
				array(
					'ok'        => true,
					'is_new'    => $is_new,
					'user'      => array( 'id' => $user->ID, 'alias' => CC_Helpers::user_alias( $user->ID ) ),
					'nonce'     => wp_create_nonce( 'wp_rest' ),
					'message'   => __( 'با موفقیت وارد شدید.', 'city-contrib' ),
				)
			)
		);
	}

	/** Log out. */
	public static function logout() {
		wp_logout();
		return CC_Helpers::no_store( rest_ensure_response( array( 'ok' => true ) ) );
	}

	/** Delete account while preserving orphaned, anonymous aggregate ratings. */
	public static function delete_account( $request ) {
		if ( 'DELETE' !== strtoupper( (string) $request->get_param( 'confirm' ) ) ) {
			return new WP_Error( 'cc_confirm_delete', __( 'برای تأیید حذف، عبارت DELETE را بفرستید.', 'city-contrib' ), array( 'status' => 400 ) );
		}
		$user_id = get_current_user_id();
		global $wpdb;
		// Keep approved community content and its attachments, but sever the author relation.
		$authored = $wpdb->get_col( $wpdb->prepare( "SELECT ID FROM {$wpdb->posts} WHERE post_author = %d", $user_id ) );
		$wpdb->update( $wpdb->posts, array( 'post_author' => 0 ), array( 'post_author' => $user_id ), array( '%d' ), array( '%d' ) );
		foreach ( $authored as $post_id ) {
			clean_post_cache( $post_id );
		}
		$wpdb->update( $wpdb->postmeta, array( 'meta_value' => '0' ), array( 'meta_key' => '_cc_user_id', 'meta_value' => (string) $user_id ), array( '%s' ), array( '%s', '%s' ) );
		$wpdb->update( $wpdb->postmeta, array( 'meta_value' => '0' ), array( 'meta_key' => 'cc_contributor_user_id', 'meta_value' => (string) $user_id ), array( '%s' ), array( '%s', '%s' ) );
		require_once ABSPATH . 'wp-admin/includes/user.php';
		wp_logout();
		wp_delete_user( $user_id );
		return CC_Helpers::no_store( rest_ensure_response( array( 'ok' => true, 'message' => __( 'حساب شما حذف شد و رأی‌ها فقط به‌صورت بی‌نام در مجموع باقی ماندند.', 'city-contrib' ) ) ) );
	}

	/** Normalize Iranian mobiles to 98xxxxxxxxxx. */
	public static function normalize_mobile( $mobile ) {
		$mobile = preg_replace( '/\D+/', '', self::latin_digits( (string) $mobile ) );
		if ( 0 === strpos( $mobile, '0098' ) ) {
			$mobile = substr( $mobile, 2 );
		} elseif ( 0 === strpos( $mobile, '09' ) ) {
			$mobile = '98' . substr( $mobile, 1 );
		} elseif ( 0 === strpos( $mobile, '9' ) && 10 === strlen( $mobile ) ) {
			$mobile = '98' . $mobile;
		}
		if ( ! preg_match( '/^989\d{9}$/', $mobile ) ) {
			return new WP_Error( 'cc_mobile_invalid', __( 'شماره موبایل ایران را با ۰۹ وارد کنید.', 'city-contrib' ), array( 'status' => 400 ) );
		}
		return $mobile;
	}

	/** Convert Persian/Arabic digits to Latin. */
	private static function latin_digits( $value ) {
		return strtr( $value, array( '۰'=>'0','۱'=>'1','۲'=>'2','۳'=>'3','۴'=>'4','۵'=>'5','۶'=>'6','۷'=>'7','۸'=>'8','۹'=>'9','٠'=>'0','١'=>'1','٢'=>'2','٣'=>'3','٤'=>'4','٥'=>'5','٦'=>'6','٧'=>'7','٨'=>'8','٩'=>'9' ) );
	}

	/** Fixed-window transient limiter. */
	private static function consume_limit( $key, $limit, $ttl ) {
		$count = (int) get_transient( $key );
		if ( $count >= $limit ) {
			return false;
		}
		set_transient( $key, $count + 1, $ttl );
		return true;
	}

	/** Obtain replaceable provider. */
	private static function provider() {
		$provider = 'webhook' === CC_Config::get( 'otp_provider' ) ? new CC_SMS_Webhook_Provider() : new CC_SMS_Debug_Provider();
		return apply_filters( 'cc_sms_provider', $provider );
	}

	/** Safe public alias. */
	private static function sanitize_alias( $alias ) {
		$alias = trim( sanitize_text_field( (string) $alias ) );
		if ( '' === $alias || preg_match( '/\d{7,}/u', $alias ) ) {
			return __( 'همشهری', 'city-contrib' );
		}
		return mb_substr( $alias, 0, 40 );
	}
}
