<?php
/**
 * Minimal settings, moderation and suspicious-rating dashboards.
 *
 * @package City_Contrib
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class CC_Admin {
	/** Attach admin hooks. */
	public static function hooks() {
		add_action( 'admin_menu', array( __CLASS__, 'menu' ) );
		add_action( 'admin_enqueue_scripts', array( __CLASS__, 'assets' ) );
		add_action( 'show_user_profile', array( __CLASS__, 'user_cities' ) );
		add_action( 'edit_user_profile', array( __CLASS__, 'user_cities' ) );
		add_action( 'personal_options_update', array( __CLASS__, 'save_user_cities' ) );
		add_action( 'edit_user_profile_update', array( __CLASS__, 'save_user_cities' ) );
		add_filter( 'plugin_action_links_' . plugin_basename( CC_FILE ), array( __CLASS__, 'action_links' ) );
	}

	/** Menus, scoped for city moderators. */
	public static function menu() {
		if ( current_user_can( 'manage_options' ) ) {
			add_menu_page( __( 'شهر من', 'city-contrib' ), __( 'شهر من', 'city-contrib' ), 'manage_options', 'city-contrib', array( __CLASS__, 'settings_page' ), 'dashicons-location-alt', 27 );
			add_submenu_page( 'city-contrib', __( 'تنظیمات', 'city-contrib' ), __( 'تنظیمات', 'city-contrib' ), 'manage_options', 'city-contrib', array( __CLASS__, 'settings_page' ) );
			if ( CC_Config::enabled( 'contrib' ) ) {
				add_submenu_page( 'city-contrib', __( 'صف مشارکت‌ها', 'city-contrib' ), __( 'صف مشارکت‌ها', 'city-contrib' ), 'cc_moderate_city', 'cc-moderation', array( __CLASS__, 'moderation_page' ) );
			}
			if ( CC_Config::enabled( 'rating' ) ) {
				add_submenu_page( 'city-contrib', __( 'آرای مشکوک', 'city-contrib' ), __( 'آرای مشکوک', 'city-contrib' ), 'manage_options', 'cc-ratings', array( __CLASS__, 'ratings_page' ) );
			}
		} elseif ( current_user_can( 'cc_moderate_city' ) && CC_Config::enabled( 'contrib' ) ) {
			add_menu_page( __( 'صف مشارکت شهر', 'city-contrib' ), __( 'مشارکت شهر', 'city-contrib' ), 'cc_moderate_city', 'cc-moderation', array( __CLASS__, 'moderation_page' ), 'dashicons-yes-alt', 27 );
		}
	}

	/** Admin-only assets. */
	public static function assets( $hook ) {
		if ( false === strpos( $hook, 'cc-moderation' ) && false === strpos( $hook, 'cc-ratings' ) && false === strpos( $hook, 'city-contrib' ) ) {
			return;
		}
		wp_enqueue_style( 'cc-admin', CC_URL . 'assets/css/admin.css', array(), CC_VERSION );
		if ( false !== strpos( $hook, 'cc-moderation' ) || false !== strpos( $hook, 'cc-ratings' ) ) {
			wp_enqueue_script( 'cc-admin', CC_URL . 'assets/js/admin.js', array(), CC_VERSION, true );
			wp_localize_script(
				'cc-admin',
				'CC_ADMIN',
				array(
					'rest'    => esc_url_raw( rest_url( CC_REST::NAMESPACE . '/' ) ),
					'nonce'   => wp_create_nonce( 'wp_rest' ),
					'reasons' => CC_Contrib::rejection_reasons(),
					'i18n'    => array(
						'loading'       => __( 'در حال بارگذاری…', 'city-contrib' ),
						'empty'         => __( 'موردی در این صف نیست.', 'city-contrib' ),
						'error'         => __( 'خطایی رخ داد.', 'city-contrib' ),
						'approve'       => __( 'تأیید', 'city-contrib' ),
						'reject'        => __( 'رد', 'city-contrib' ),
						'confirmDelete' => __( 'این رأی حذف و مجموع شهر دوباره محاسبه شود؟', 'city-contrib' ),
					),
					'fields'  => array(
						'name'           => __( 'نام', 'city-contrib' ),
						'category'       => __( 'دسته', 'city-contrib' ),
						'description'    => __( 'توضیح', 'city-contrib' ),
						'address'        => __( 'نشانی', 'city-contrib' ),
						'corrected_text' => __( 'متن اصلاح‌شده', 'city-contrib' ),
						'reason'         => __( 'دلیل', 'city-contrib' ),
						'tip'            => __( 'نکته محلی', 'city-contrib' ),
					),
				)
			);
		}
	}

	/** Settings plus daily overview. */
	public static function settings_page() {
		if ( ! current_user_can( 'manage_options' ) ) {
			wp_die( esc_html__( 'دسترسی ندارید.', 'city-contrib' ) );
		}
		if ( isset( $_POST['cc_save_settings'] ) ) {
			check_admin_referer( 'cc_save_settings' );
			$current = (array) get_option( CC_Config::OPTION_KEY, array() );
			$values  = array(
				'module_auth'          => isset( $_POST['module_auth'] ) ? 1 : 0,
				'module_share'         => isset( $_POST['module_share'] ) ? 1 : 0,
				'module_rating'        => isset( $_POST['module_rating'] ) ? 1 : 0,
				'module_contrib'       => isset( $_POST['module_contrib'] ) ? 1 : 0,
				'otp_provider'         => in_array( $_POST['otp_provider'] ?? '', array( 'debug', 'webhook' ), true ) ? sanitize_key( $_POST['otp_provider'] ) : 'debug',
				'otp_webhook_url'      => esc_url_raw( wp_unslash( $_POST['otp_webhook_url'] ?? '' ) ),
				'otp_message_template' => sanitize_textarea_field( wp_unslash( $_POST['otp_message_template'] ?? '' ) ),
				'otp_hourly_limit'     => min( 10, max( 1, absint( $_POST['otp_hourly_limit'] ?? 3 ) ) ),
				'rating_daily_limit'   => min( 100, max( 1, absint( $_POST['rating_daily_limit'] ?? 20 ) ) ),
				'contrib_new_user_daily_limit' => min( 20, max( 1, absint( $_POST['contrib_new_user_daily_limit'] ?? 5 ) ) ),
			);
			$token = sanitize_text_field( wp_unslash( $_POST['otp_webhook_token'] ?? '' ) );
			$values['otp_webhook_token'] = '' !== $token ? $token : ( $current['otp_webhook_token'] ?? '' );
			update_option( CC_Config::OPTION_KEY, array_merge( CC_Config::defaults(), $current, $values ), false );
			echo '<div class="notice notice-success"><p>' . esc_html__( 'تنظیمات ذخیره شد.', 'city-contrib' ) . '</p></div>';
		}
		$settings = wp_parse_args( (array) get_option( CC_Config::OPTION_KEY, array() ), CC_Config::defaults() );
		$stats    = self::daily_stats();
		$gaps     = self::city_gaps();
		?>
		<div class="wrap cc-admin-wrap"><h1><?php esc_html_e( 'شهر من + مشارکت مردمی', 'city-contrib' ); ?></h1>
			<div class="cc-admin-stats">
				<div><strong><?php echo esc_html( CC_Helpers::fa_number( $stats['users'] ) ); ?></strong><span><?php esc_html_e( 'کاربر تازه امروز', 'city-contrib' ); ?></span></div>
				<div><strong><?php echo esc_html( CC_Helpers::fa_number( $stats['ratings'] ) ); ?></strong><span><?php esc_html_e( 'رأی امروز', 'city-contrib' ); ?></span></div>
				<div><strong><?php echo esc_html( CC_Helpers::fa_number( $stats['submissions'] ) ); ?></strong><span><?php esc_html_e( 'مشارکت امروز', 'city-contrib' ); ?></span></div>
				<div><strong><?php echo esc_html( CC_Helpers::fa_number( $stats['pending'] ) ); ?></strong><span><?php esc_html_e( 'در انتظار بررسی', 'city-contrib' ); ?></span></div>
			</div>
			<div class="cc-admin-gaps">
				<details><summary><?php echo esc_html( sprintf( __( 'شهرهای بدون رأی (%s)', 'city-contrib' ), CC_Helpers::fa_number( count( $gaps['no_votes'] ) ) ) ); ?></summary><p><?php echo esc_html( implode( '، ', array_slice( $gaps['no_votes'], 0, 30 ) ) ?: __( 'موردی نیست.', 'city-contrib' ) ); ?></p></details>
				<details><summary><?php echo esc_html( sprintf( __( 'شهرهای بدون ناظر (%s)', 'city-contrib' ), CC_Helpers::fa_number( count( $gaps['no_moderator'] ) ) ) ); ?></summary><p><?php echo esc_html( implode( '، ', array_slice( $gaps['no_moderator'], 0, 30 ) ) ?: __( 'موردی نیست.', 'city-contrib' ) ); ?></p></details>
			</div>
			<form method="post" class="cc-settings-form">
				<?php wp_nonce_field( 'cc_save_settings' ); ?>
				<h2><?php esc_html_e( 'ماژول‌ها', 'city-contrib' ); ?></h2>
				<?php foreach ( array( 'auth' => __( 'ورود پیامکی', 'city-contrib' ), 'share' => __( 'اشتراک‌گذاری', 'city-contrib' ), 'rating' => __( 'امتیاز شهر', 'city-contrib' ), 'contrib' => __( 'مشارکت مردمی', 'city-contrib' ) ) as $key => $label ) : ?>
					<label><input type="checkbox" name="module_<?php echo esc_attr( $key ); ?>" <?php checked( ! empty( $settings[ 'module_' . $key ] ) ); ?>> <?php echo esc_html( $label ); ?></label>
				<?php endforeach; ?>
				<h2><?php esc_html_e( 'پیامک OTP', 'city-contrib' ); ?></h2>
				<label><?php esc_html_e( 'ارائه‌دهنده', 'city-contrib' ); ?><select name="otp_provider"><option value="debug" <?php selected( $settings['otp_provider'], 'debug' ); ?>><?php esc_html_e( 'آزمایشی (فقط WP_DEBUG)', 'city-contrib' ); ?></option><option value="webhook" <?php selected( $settings['otp_provider'], 'webhook' ); ?>><?php esc_html_e( 'وب‌هوک JSON', 'city-contrib' ); ?></option></select></label>
				<label><?php esc_html_e( 'نشانی HTTPS وب‌هوک', 'city-contrib' ); ?><input type="url" name="otp_webhook_url" dir="ltr" value="<?php echo esc_attr( $settings['otp_webhook_url'] ); ?>" placeholder="https://sms.example/api/send"></label>
				<label><?php esc_html_e( 'توکن Bearer', 'city-contrib' ); ?><input type="password" name="otp_webhook_token" dir="ltr" value="" placeholder="<?php echo $settings['otp_webhook_token'] ? esc_attr__( 'برای نگه‌داشتن توکن خالی بگذارید', 'city-contrib' ) : ''; ?>"></label>
				<label><?php esc_html_e( 'متن پیام ({code} جایگزین می‌شود)', 'city-contrib' ); ?><textarea name="otp_message_template" rows="3"><?php echo esc_textarea( $settings['otp_message_template'] ); ?></textarea></label>
				<h2><?php esc_html_e( 'سقف‌ها', 'city-contrib' ); ?></h2>
				<label><?php esc_html_e( 'درخواست کد در ساعت', 'city-contrib' ); ?><input type="number" min="1" max="10" name="otp_hourly_limit" value="<?php echo esc_attr( $settings['otp_hourly_limit'] ); ?>"></label>
				<label><?php esc_html_e( 'رأی روزانه هر کاربر', 'city-contrib' ); ?><input type="number" min="1" max="100" name="rating_daily_limit" value="<?php echo esc_attr( $settings['rating_daily_limit'] ); ?>"></label>
				<label><?php esc_html_e( 'مشارکت روزانه کاربر تازه', 'city-contrib' ); ?><input type="number" min="1" max="20" name="contrib_new_user_daily_limit" value="<?php echo esc_attr( $settings['contrib_new_user_daily_limit'] ); ?>"></label>
				<p><button class="button button-primary" name="cc_save_settings" value="1"><?php esc_html_e( 'ذخیره تنظیمات', 'city-contrib' ); ?></button></p>
			</form>
		</div>
		<?php
	}

	/** REST-driven moderator page. */
	public static function moderation_page() {
		if ( ! current_user_can( 'cc_moderate_city' ) && ! current_user_can( 'manage_options' ) ) {
			wp_die( esc_html__( 'دسترسی ندارید.', 'city-contrib' ) );
		}
		$cities = current_user_can( 'manage_options' ) ? get_posts( array( 'post_type' => 'city', 'post_status' => 'publish', 'posts_per_page' => -1, 'orderby' => 'title', 'order' => 'ASC' ) ) : array_map( 'get_post', CC_Contrib::moderator_cities() );
		?>
		<div class="wrap cc-admin-wrap" id="cc-moderation-app"><h1><?php esc_html_e( 'صف بررسی مشارکت‌ها', 'city-contrib' ); ?></h1>
			<div class="cc-admin-filters">
				<select data-filter="city_id"><option value=""><?php esc_html_e( 'همه شهرهای مجاز', 'city-contrib' ); ?></option><?php foreach ( array_filter( $cities ) as $city ) : ?><option value="<?php echo esc_attr( $city->ID ); ?>"><?php echo esc_html( $city->post_title ); ?></option><?php endforeach; ?></select>
				<select data-filter="status"><option value="pending"><?php esc_html_e( 'در انتظار', 'city-contrib' ); ?></option><option value="approved"><?php esc_html_e( 'تأییدشده', 'city-contrib' ); ?></option><option value="rejected"><?php esc_html_e( 'ردشده', 'city-contrib' ); ?></option></select>
				<select data-filter="type"><option value=""><?php esc_html_e( 'همه نوع‌ها', 'city-contrib' ); ?></option><option value="introduce"><?php esc_html_e( 'معرفی', 'city-contrib' ); ?></option><option value="correction"><?php esc_html_e( 'اصلاح', 'city-contrib' ); ?></option><option value="report"><?php esc_html_e( 'گزارش', 'city-contrib' ); ?></option><option value="tip"><?php esc_html_e( 'نکته', 'city-contrib' ); ?></option></select>
				<button class="button" data-load><?php esc_html_e( 'اعمال فیلتر', 'city-contrib' ); ?></button>
			</div>
			<div class="cc-batch"><button class="button button-primary" data-batch="approve"><?php esc_html_e( 'تأیید انتخاب‌ها', 'city-contrib' ); ?></button><select data-reason><?php foreach ( CC_Contrib::rejection_reasons() as $key => $label ) : ?><option value="<?php echo esc_attr( $key ); ?>"><?php echo esc_html( $label ); ?></option><?php endforeach; ?></select><button class="button" data-batch="reject"><?php esc_html_e( 'رد انتخاب‌ها', 'city-contrib' ); ?></button></div>
			<div class="cc-admin-list" aria-live="polite"></div>
		</div>
		<?php
	}

	/** Suspicious votes; deletion is REST-only and audited. */
	public static function ratings_page() {
		global $wpdb;
		$table = CC_Config::ratings_table();
		$rows  = $wpdb->get_results( "SELECT * FROM {$table} WHERE is_suspicious = 1 ORDER BY created_at DESC LIMIT 100", ARRAY_A ); // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared
		?>
		<div class="wrap cc-admin-wrap" id="cc-ratings-app"><h1><?php esc_html_e( 'آرای مشکوک', 'city-contrib' ); ?></h1><p><?php esc_html_e( 'حذف فقط با دلیل انجام می‌شود، در لاگ می‌ماند و مجموع شهر در همان تراکنش دوباره محاسبه می‌شود.', 'city-contrib' ); ?></p>
			<table class="widefat striped"><thead><tr><th><?php esc_html_e( 'شهر', 'city-contrib' ); ?></th><th><?php esc_html_e( 'امتیاز', 'city-contrib' ); ?></th><th><?php esc_html_e( 'کاربر', 'city-contrib' ); ?></th><th><?php esc_html_e( 'زمان', 'city-contrib' ); ?></th><th><?php esc_html_e( 'عملیات', 'city-contrib' ); ?></th></tr></thead><tbody>
			<?php if ( ! $rows ) : ?><tr><td colspan="5"><?php esc_html_e( 'رأی مشکوکی ثبت نشده است.', 'city-contrib' ); ?></td></tr><?php endif; ?>
			<?php foreach ( $rows as $row ) : ?><tr data-rating-row="<?php echo esc_attr( $row['id'] ); ?>"><td><?php echo esc_html( get_the_title( $row['city_id'] ) ); ?></td><td><?php echo esc_html( CC_Helpers::fa_number( $row['stars'] ) ); ?></td><td><?php echo esc_html( CC_Helpers::fa_number( $row['user_id'] ) ); ?></td><td><?php echo esc_html( CC_Helpers::jalali_date( $row['created_at'] ) ); ?></td><td><input type="text" data-delete-reason placeholder="<?php esc_attr_e( 'دلیل حذف', 'city-contrib' ); ?>"><button class="button" data-delete-rating="<?php echo esc_attr( $row['id'] ); ?>"><?php esc_html_e( 'حذف رأی', 'city-contrib' ); ?></button></td></tr><?php endforeach; ?>
			</tbody></table></div>
		<?php
	}

	/** Moderator city assignment on user profile. */
	public static function user_cities( $user ) {
		if ( ! current_user_can( 'manage_options' ) ) { return; }
		$selected = CC_Contrib::moderator_cities( $user->ID );
		$cities   = get_posts( array( 'post_type' => 'city', 'post_status' => 'publish', 'posts_per_page' => -1, 'orderby' => 'title', 'order' => 'ASC' ) );
		wp_nonce_field( 'cc_user_cities_' . $user->ID, 'cc_user_cities_nonce' );
		echo '<h2>' . esc_html__( 'نظارت شهر من', 'city-contrib' ) . '</h2><table class="form-table"><tr><th><label for="cc_moderator_city_ids">' . esc_html__( 'شهرهای مجاز', 'city-contrib' ) . '</label></th><td><select id="cc_moderator_city_ids" name="cc_moderator_city_ids[]" multiple size="8" style="min-width:280px">';
		foreach ( $cities as $city ) { echo '<option value="' . esc_attr( $city->ID ) . '" ' . selected( in_array( $city->ID, $selected, true ), true, false ) . '>' . esc_html( $city->post_title ) . '</option>'; }
		echo '</select><p class="description">' . esc_html__( 'نقش کاربر را «ناظر شهر» بگذارید؛ ناظر فقط همین شهرها را در REST و پیشخوان می‌بیند.', 'city-contrib' ) . '</p></td></tr></table>';
	}

	/** Save moderator city assignment. */
	public static function save_user_cities( $user_id ) {
		if ( ! current_user_can( 'manage_options' ) || ! isset( $_POST['cc_user_cities_nonce'] ) || ! wp_verify_nonce( sanitize_key( $_POST['cc_user_cities_nonce'] ), 'cc_user_cities_' . $user_id ) ) { return; }
		$ids = isset( $_POST['cc_moderator_city_ids'] ) ? array_values( array_filter( array_map( 'absint', (array) $_POST['cc_moderator_city_ids'] ) ) ) : array();
		update_user_meta( $user_id, 'cc_moderator_city_ids', $ids );
	}

	/** Settings shortcut. */
	public static function action_links( $links ) {
		array_unshift( $links, '<a href="' . esc_url( admin_url( 'admin.php?page=city-contrib' ) ) . '">' . esc_html__( 'تنظیمات', 'city-contrib' ) . '</a>' );
		return $links;
	}

	/** Cities that still need a first vote or an assigned moderator. */
	private static function city_gaps() {
		$cities     = get_posts( array( 'post_type' => 'city', 'post_status' => 'publish', 'posts_per_page' => -1, 'orderby' => 'title', 'order' => 'ASC' ) );
		$moderators = get_users( array( 'role' => 'cc_city_moderator', 'fields' => 'ids' ) );
		$assigned   = array();
		foreach ( $moderators as $user_id ) {
			$assigned = array_merge( $assigned, CC_Contrib::moderator_cities( $user_id ) );
		}
		$assigned = array_unique( array_map( 'absint', $assigned ) );
		$gaps     = array( 'no_votes' => array(), 'no_moderator' => array() );
		foreach ( $cities as $city ) {
			if ( (int) get_post_meta( $city->ID, 'cc_rating_count', true ) < 1 ) {
				$gaps['no_votes'][] = $city->post_title;
			}
			if ( ! in_array( $city->ID, $assigned, true ) ) {
				$gaps['no_moderator'][] = $city->post_title;
			}
		}
		return $gaps;
	}

	/** Daily totals. */
	private static function daily_stats() {
		global $wpdb;
		$today = gmdate( 'Y-m-d 00:00:00' );
		return array(
			'users'       => (int) $wpdb->get_var( $wpdb->prepare( "SELECT COUNT(*) FROM {$wpdb->users} WHERE user_registered >= %s", $today ) ),
			'ratings'     => (int) $wpdb->get_var( $wpdb->prepare( 'SELECT COUNT(*) FROM ' . CC_Config::ratings_table() . ' WHERE created_at >= %s', $today ) ), // phpcs:ignore WordPress.DB.PreparedSQL.NotPrepared
			'submissions' => (int) $wpdb->get_var( $wpdb->prepare( "SELECT COUNT(*) FROM {$wpdb->posts} WHERE post_type = %s AND post_date_gmt >= %s", CC_Contrib::POST_TYPE, $today ) ),
			'pending'     => (int) wp_count_posts( CC_Contrib::POST_TYPE )->pending,
		);
	}
}
