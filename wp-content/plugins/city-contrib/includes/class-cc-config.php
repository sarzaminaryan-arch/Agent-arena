<?php
/**
 * Central defaults and settings. Every limit is filterable for future phases.
 *
 * @package City_Contrib
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class CC_Config {
	const OPTION_KEY = 'cc_settings';

	/**
	 * Default settings.
	 *
	 * @return array<string,mixed>
	 */
	public static function defaults() {
		$defaults = array(
			'module_auth'                 => 1,
			'module_share'                => 1,
			'module_rating'               => 1,
			'module_contrib'              => 1,
			'otp_provider'                => 'debug',
			'otp_webhook_url'             => '',
			'otp_webhook_token'           => '',
			'otp_message_template'        => "کد ورود شما: {code}\nاین کد تا ۲ دقیقه معتبر است.",
			'otp_length'                  => 5,
			'otp_ttl'                     => 120,
			'otp_hourly_limit'            => 3,
			'auth_remember_days'          => 90,
			'rating_max_stars'            => 7,
			'rating_daily_limit'          => 20,
			'rating_new_user_limit'       => 3,
			'rating_new_user_minutes'     => 10,
			'rating_public_cache_seconds' => 60,
			'contrib_new_user_daily_limit'=> 5,
			'contrib_daily_limit'         => 20,
			'contrib_new_user_days'       => 7,
			'upload_max_bytes'            => 5 * MB_IN_BYTES,
			'upload_max_files'            => 3,
			'upload_max_dimension'        => 2000,
			'upload_webp_quality'          => 80,
		);

		return (array) apply_filters( 'cc_config_defaults', $defaults );
	}

	/**
	 * Read one setting.
	 *
	 * @param string $key     Setting key.
	 * @param mixed  $fallback Optional fallback.
	 * @return mixed
	 */
	public static function get( $key, $fallback = null ) {
		$values = wp_parse_args( (array) get_option( self::OPTION_KEY, array() ), self::defaults() );
		return array_key_exists( $key, $values ) ? $values[ $key ] : $fallback;
	}

	/**
	 * Whether a module is enabled.
	 *
	 * @param string $module Module name.
	 * @return bool
	 */
	public static function enabled( $module ) {
		return (bool) self::get( 'module_' . sanitize_key( $module ), true );
	}

	/**
	 * Return the ratings table name.
	 *
	 * @return string
	 */
	public static function ratings_table() {
		global $wpdb;
		return $wpdb->prefix . 'cc_ratings';
	}

	/**
	 * Return the rating audit table name.
	 *
	 * @return string
	 */
	public static function audit_table() {
		global $wpdb;
		return $wpdb->prefix . 'cc_rating_audit';
	}
}
