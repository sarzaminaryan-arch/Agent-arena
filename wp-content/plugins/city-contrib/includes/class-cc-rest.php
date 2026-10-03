<?php
/**
 * REST permission and error helpers.
 *
 * @package City_Contrib
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class CC_REST {
	const NAMESPACE = 'cc/v1';

	/**
	 * Require a logged-in cookie plus a fresh REST nonce.
	 *
	 * @param WP_REST_Request $request Request.
	 * @return true|WP_Error
	 */
	public static function logged_in( $request ) {
		CC_Auth::restore_cookie_user();
		if ( ! is_user_logged_in() ) {
			return new WP_Error( 'cc_auth_required', __( 'برای انجام این کار ابتدا با موبایل وارد شوید.', 'city-contrib' ), array( 'status' => 401 ) );
		}
		$nonce = $request->get_header( 'X-WP-Nonce' );
		if ( ! $nonce || ! wp_verify_nonce( $nonce, 'wp_rest' ) ) {
			return new WP_Error( 'cc_bad_nonce', __( 'نشست شما تازه نیست؛ صفحه را دوباره بارگذاری کنید.', 'city-contrib' ), array( 'status' => 403 ) );
		}
		return true;
	}

	/** Moderator permission. */
	public static function moderator( $request ) {
		$auth = self::logged_in( $request );
		if ( true !== $auth ) {
			return $auth;
		}
		if ( ! current_user_can( 'cc_moderate_city' ) && ! current_user_can( 'manage_options' ) ) {
			return new WP_Error( 'cc_forbidden', __( 'دسترسی ناظر شهر لازم است.', 'city-contrib' ), array( 'status' => 403 ) );
		}
		return true;
	}

	/** Administrator permission. */
	public static function administrator( $request ) {
		$auth = self::logged_in( $request );
		if ( true !== $auth ) {
			return $auth;
		}
		return current_user_can( 'manage_options' ) ? true : new WP_Error( 'cc_forbidden', __( 'دسترسی مدیر لازم است.', 'city-contrib' ), array( 'status' => 403 ) );
	}
}
