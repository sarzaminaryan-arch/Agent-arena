<?php
/** Generic JSON webhook SMS provider. */
final class CC_SMS_Webhook_Provider implements CC_SMS_Provider {
	public function send( $mobile, $code ) {
		$url = esc_url_raw( (string) CC_Config::get( 'otp_webhook_url' ) );
		if ( ! $url || 'https' !== wp_parse_url( $url, PHP_URL_SCHEME ) ) {
			return new WP_Error( 'cc_sms_config', __( 'نشانی HTTPS وب‌هوک پیامک معتبر نیست.', 'city-contrib' ) );
		}
		$template = (string) CC_Config::get( 'otp_message_template' );
		$message  = str_replace( '{code}', $code, $template );
		$headers  = array( 'Content-Type' => 'application/json; charset=utf-8' );
		$token    = (string) CC_Config::get( 'otp_webhook_token' );
		if ( $token ) {
			$headers['Authorization'] = 'Bearer ' . $token;
		}
		$response = wp_safe_remote_post(
			$url,
			array(
				'timeout'     => 8,
				'redirection' => 0,
				'headers'     => $headers,
				'body'        => wp_json_encode( array( 'mobile' => $mobile, 'code' => $code, 'message' => $message ) ),
			)
		);
		if ( is_wp_error( $response ) ) {
			return new WP_Error( 'cc_sms_failed', __( 'ارتباط با سرویس پیامک برقرار نشد.', 'city-contrib' ) );
		}
		$code_http = wp_remote_retrieve_response_code( $response );
		if ( $code_http < 200 || $code_http >= 300 ) {
			return new WP_Error( 'cc_sms_failed', __( 'سرویس پیامک ارسال را نپذیرفت.', 'city-contrib' ) );
		}
		return true;
	}
}
