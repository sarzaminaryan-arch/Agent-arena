<?php
/**
 * Database migrations and roles.
 *
 * @package City_Contrib
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class CC_Activator {
	/** Activate and migrate. */
	public static function activate() {
		self::migrate();
		self::roles();
		update_option( 'cc_flush_rewrite', 1, false );
	}

	/** Deactivate scheduled work, preserving all data. */
	public static function deactivate() {
		wp_clear_scheduled_hook( 'cc_daily_maintenance' );
	}

	/** Create/update tables using dbDelta. */
	public static function migrate() {
		global $wpdb;
		require_once ABSPATH . 'wp-admin/includes/upgrade.php';
		$charset = $wpdb->get_charset_collate();
		$ratings = CC_Config::ratings_table();
		$audit   = CC_Config::audit_table();

		$sql_ratings = "CREATE TABLE {$ratings} (
			id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
			user_id bigint(20) unsigned NOT NULL,
			city_id bigint(20) unsigned NOT NULL,
			stars tinyint(3) unsigned NOT NULL,
			ip_hash char(64) NOT NULL DEFAULT '',
			is_suspicious tinyint(1) unsigned NOT NULL DEFAULT 0,
			created_at datetime NOT NULL,
			PRIMARY KEY  (id),
			UNIQUE KEY user_city (user_id,city_id),
			KEY city_id (city_id),
			KEY user_created (user_id,created_at),
			KEY suspicious (is_suspicious,created_at)
		) ENGINE=InnoDB {$charset};";

		$sql_audit = "CREATE TABLE {$audit} (
			id bigint(20) unsigned NOT NULL AUTO_INCREMENT,
			rating_id bigint(20) unsigned NOT NULL,
			city_id bigint(20) unsigned NOT NULL,
			user_id bigint(20) unsigned NOT NULL,
			stars tinyint(3) unsigned NOT NULL,
			action varchar(20) NOT NULL,
			admin_user_id bigint(20) unsigned NOT NULL,
			reason varchar(255) NOT NULL DEFAULT '',
			created_at datetime NOT NULL,
			PRIMARY KEY  (id),
			KEY rating_id (rating_id),
			KEY city_id (city_id),
			KEY admin_user_id (admin_user_id)
		) ENGINE=InnoDB {$charset};";

		dbDelta( $sql_ratings );
		dbDelta( $sql_audit );
		// Aggregates rely on row locks and rollback; never permit a non-transactional engine.
		$wpdb->query( "ALTER TABLE {$ratings} ENGINE=InnoDB" ); // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared
		$wpdb->query( "ALTER TABLE {$audit} ENGINE=InnoDB" ); // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared
		update_option( 'cc_db_version', CC_DB_VERSION, false );
	}

	/** Register moderator role/capabilities. */
	public static function roles() {
		add_role(
			'cc_city_moderator',
			__( 'ناظر شهر', 'city-contrib' ),
			array(
				'read'             => true,
				'cc_moderate_city' => true,
			)
		);
		$admin = get_role( 'administrator' );
		if ( $admin ) {
			$admin->add_cap( 'cc_moderate_city' );
		}
	}
}
