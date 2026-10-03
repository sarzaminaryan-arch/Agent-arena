<?php
/** SMS provider contract. */
interface CC_SMS_Provider {
	/**
	 * Send one OTP.
	 *
	 * @param string $mobile E.164 digits without plus.
	 * @param string $code   OTP.
	 * @return true|WP_Error
	 */
	public function send( $mobile, $code );
}
