<?php
/** Development provider: writes only to the PHP error log. */
final class CC_SMS_Debug_Provider implements CC_SMS_Provider {
	public function send( $mobile, $code ) {
		if ( defined( 'WP_DEBUG' ) && WP_DEBUG ) {
			error_log( sprintf( 'City Contrib OTP for %s: %s', $mobile, $code ) ); // phpcs:ignore WordPress.PHP.DevelopmentFunctions.error_log_error_log
			return true;
		}
		return new WP_Error( 'cc_sms_not_configured', __( 'ارسال پیامک هنوز تنظیم نشده است. مدیر سایت باید ارائه‌دهنده پیامک را فعال کند.', 'city-contrib' ) );
	}
}
