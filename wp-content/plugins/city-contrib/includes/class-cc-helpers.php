<?php
/**
 * Shared small helpers.
 *
 * @package City_Contrib
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class CC_Helpers {
	/**
	 * Persian digits and decimal separator for display only.
	 *
	 * @param string|int|float $value Value.
	 * @return string
	 */
	public static function fa_number( $value ) {
		return strtr(
			(string) $value,
			array(
				'0' => '۰', '1' => '۱', '2' => '۲', '3' => '۳', '4' => '۴',
				'5' => '۵', '6' => '۶', '7' => '۷', '8' => '۸', '9' => '۹',
				'.' => '٫', ',' => '٬',
			)
		);
	}

	/**
	 * Display a stored UTC MySQL date as Jalali when the project converter exists.
	 * Machine dates intentionally remain Gregorian in the database.
	 *
	 * @param string $mysql_utc UTC date.
	 * @return string
	 */
	public static function jalali_date( $mysql_utc ) {
		$timestamp = strtotime( (string) $mysql_utc . ' UTC' );
		if ( function_exists( 'sa_jalali_date' ) && $timestamp ) {
			return self::fa_number( sa_jalali_date( 'Y/m/d H:i', $timestamp ) );
		}
		return $timestamp ? self::fa_number( wp_date( 'Y/m/d H:i', $timestamp ) ) : '';
	}

	/**
	 * Hash an IP without retaining the address.
	 *
	 * @return string
	 */
	public static function ip_hash() {
		$ip = '';
		if ( isset( $_SERVER['REMOTE_ADDR'] ) ) {
			$ip = sanitize_text_field( wp_unslash( $_SERVER['REMOTE_ADDR'] ) );
		}
		return hash_hmac( 'sha256', $ip, wp_salt( 'auth' ) );
	}

	/**
	 * Validate a published city.
	 *
	 * @param int $city_id Post ID.
	 * @return bool
	 */
	public static function is_city( $city_id ) {
		return $city_id > 0 && 'city' === get_post_type( $city_id ) && 'publish' === get_post_status( $city_id );
	}

	/**
	 * Set no-store headers on personalized REST responses.
	 *
	 * @param WP_REST_Response $response Response.
	 * @return WP_REST_Response
	 */
	public static function no_store( $response ) {
		$response->header( 'Cache-Control', 'no-store, no-cache, must-revalidate, private' );
		$response->header( 'Vary', 'Cookie, X-WP-Nonce' );
		return $response;
	}

	/**
	 * Normalize Persian text for duplicate checks.
	 *
	 * @param string $text Text.
	 * @return string
	 */
	public static function normalize_text( $text ) {
		$text = mb_strtolower( wp_strip_all_tags( (string) $text ), 'UTF-8' );
		$text = strtr(
			$text,
			array(
				'ي' => 'ی', 'ى' => 'ی', 'ك' => 'ک', 'ۀ' => 'ه', 'ة' => 'ه',
				'ؤ' => 'و', 'أ' => 'ا', 'إ' => 'ا', 'آ' => 'ا', '‌' => ' ',
			)
		);
		$text = preg_replace( '/[^\p{L}\p{N}]+/u', ' ', $text );
		return trim( preg_replace( '/\s+/u', ' ', $text ) );
	}

	/**
	 * Multibyte trigram similarity from 0 to 1.
	 *
	 * @param string $first  First string.
	 * @param string $second Second string.
	 * @return float
	 */
	public static function similarity( $first, $second ) {
		$first  = self::normalize_text( $first );
		$second = self::normalize_text( $second );
		if ( $first === $second ) {
			return 1.0;
		}
		$grams = static function ( $value ) {
			$chars = preg_split( '//u', '  ' . $value . '  ', -1, PREG_SPLIT_NO_EMPTY );
			$out   = array();
			$count = count( $chars );
			for ( $i = 0; $i <= $count - 3; $i++ ) {
				$key         = $chars[ $i ] . $chars[ $i + 1 ] . $chars[ $i + 2 ];
				$out[ $key ] = isset( $out[ $key ] ) ? $out[ $key ] + 1 : 1;
			}
			return $out;
		};
		$a = $grams( $first );
		$b = $grams( $second );
		if ( ! $a || ! $b ) {
			return 0.0;
		}
		$common = 0;
		foreach ( $a as $key => $count ) {
			if ( isset( $b[ $key ] ) ) {
				$common += min( $count, $b[ $key ] );
			}
		}
		return ( 2 * $common ) / ( array_sum( $a ) + array_sum( $b ) );
	}

	/**
	 * Distance in metres.
	 *
	 * @return float
	 */
	public static function distance_metres( $lat1, $lng1, $lat2, $lng2 ) {
		$earth = 6371000;
		$dlat  = deg2rad( (float) $lat2 - (float) $lat1 );
		$dlng  = deg2rad( (float) $lng2 - (float) $lng1 );
		$a     = sin( $dlat / 2 ) ** 2 + cos( deg2rad( (float) $lat1 ) ) * cos( deg2rad( (float) $lat2 ) ) * sin( $dlng / 2 ) ** 2;
		return $earth * 2 * atan2( sqrt( $a ), sqrt( 1 - $a ) );
	}

	/**
	 * Public alias, never a login/mobile number.
	 *
	 * @param int $user_id User ID.
	 * @return string
	 */
	public static function user_alias( $user_id ) {
		$user = get_userdata( $user_id );
		if ( ! $user ) {
			return __( 'همشهری', 'city-contrib' );
		}
		$alias = get_user_meta( $user_id, 'cc_public_alias', true );
		return $alias ? $alias : __( 'همشهری', 'city-contrib' );
	}
}
