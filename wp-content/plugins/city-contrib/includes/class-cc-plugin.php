<?php
/**
 * Plugin composition root.
 *
 * @package City_Contrib
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class CC_Plugin {
	/** @var self|null */
	private static $instance;

	/** @return self */
	public static function instance() {
		if ( null === self::$instance ) {
			self::$instance = new self();
		}
		return self::$instance;
	}

	/** Attach modules. */
	public function boot() {
		add_action( 'plugins_loaded', array( $this, 'load_textdomain' ) );
		add_action( 'init', array( $this, 'maybe_upgrade' ), 1 );
		add_action( 'init', array( $this, 'fallback_city_type' ), 20 );
		add_action( 'init', array( $this, 'flush_rewrites' ), 99 );
		add_filter( 'auth_cookie_expiration', array( $this, 'remember_expiration' ), 10, 3 );

		// Session state is shared infrastructure; OTP routes inside the auth module remain toggleable.
		CC_Auth::hooks();
		if ( CC_Config::enabled( 'rating' ) ) {
			CC_Rating::hooks();
		}
		if ( CC_Config::enabled( 'share' ) ) {
			CC_Share::hooks();
		}
		// Keep private submission types/statuses readable even while intake is disabled.
		CC_Contrib::hooks();
		CC_Frontend::hooks();
		CC_Admin::hooks();
	}

	/** Load translations. */
	public function load_textdomain() {
		load_plugin_textdomain( 'city-contrib', false, dirname( plugin_basename( CC_FILE ) ) . '/languages' );
	}

	/** Run idempotent migration after updates. */
	public function maybe_upgrade() {
		if ( CC_DB_VERSION !== get_option( 'cc_db_version' ) ) {
			CC_Activator::migrate();
			CC_Activator::roles();
		}
	}

	/**
	 * Keep the plugin usable on a clean WordPress install, while deferring to the
	 * existing city CPT in this project.
	 */
	public function fallback_city_type() {
		if ( post_type_exists( 'city' ) ) {
			return;
		}
		register_post_type(
			'city',
			array(
				'labels' => array(
					'name'          => __( 'شهرها', 'city-contrib' ),
					'singular_name' => __( 'شهر', 'city-contrib' ),
				),
				'public'       => true,
				'show_in_rest' => true,
				'has_archive'  => 'city',
				'rewrite'      => array( 'slug' => 'city', 'with_front' => false ),
				'supports'     => array( 'title', 'editor', 'excerpt', 'thumbnail', 'revisions', 'author' ),
			)
		);
	}

	/** Flush once, not on every request. */
	public function flush_rewrites() {
		if ( get_option( 'cc_flush_rewrite' ) ) {
			delete_option( 'cc_flush_rewrite' );
			flush_rewrite_rules();
		}
	}

	/**
	 * Remember OTP users for the configured 90 days.
	 *
	 * @param int  $length  Existing length.
	 * @param int  $user_id User ID.
	 * @param bool $remember Remember flag.
	 * @return int
	 */
	public function remember_expiration( $length, $user_id, $remember ) {
		if ( $remember && get_user_meta( $user_id, 'cc_mobile_verified', true ) ) {
			return max( DAY_IN_SECONDS, (int) CC_Config::get( 'auth_remember_days' ) * DAY_IN_SECONDS );
		}
		return $length;
	}
}
