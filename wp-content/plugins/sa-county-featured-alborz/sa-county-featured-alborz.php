<?php
/**
 * Plugin Name: سرزمین آریان — تصویر شاخص شهرستان‌های استان البرز
 * Plugin URI:  https://github.com/sarzaminaryan-arch/S.A.1
 * Description: جایگزینی تصویر شاخص ۷ شهرستان استان البرز (کرج، فردیس، ساوجبلاغ، نظرآباد، چهارباغ، اشتهارد، طالقان) با تصاویر شب‌نمای وب‌پی همراه افزونه. تصویر قبلی صفحه با نسخه‌ی جدید جایگزین می‌شود (شناسه‌ی sha1 برای جلوگیری از بارگذاری تکراری). فقط تصویر شاخص عوض می‌شود؛ متن و وضعیت نوشته‌ها دست نمی‌خورد.
 * Version:     1.0.0
 * Requires at least: 6.0
 * Requires PHP: 7.4
 * Author:      سرزمین آریان
 * Author URI:  https://sarzaminaryan.ir
 * License:     GPLv2 or later
 * License URI: http://www.gnu.org/licenses/gpl-2.0.html
 * Text Domain: sa-province-importer
 *
 * @package Sarzaminaryan_County_Featured
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

if ( ! class_exists( 'SA_County_Featured_Alborz' ) ) {

	/**
	 * Replaces featured images of Alborz county pages with bundled night-view webp files.
	 */
	class SA_County_Featured_Alborz {

		const CPT     = 'city';
		const VERSION = '1.0.0';
		const NONCE   = 'sa_county_featured_alborz';

		/**
		 * County slug (as created on the site) => candidate slugs + Persian title + alt text.
		 *
		 * @var array
		 */
		private $counties = array(
			'karaj'      => array(
				'slugs' => array( 'karaj' ),
				'title' => 'کرج',
				'alt'   => 'نمای هوایی شبانه از کلان‌شهر کرج با چراغ‌های روشن و رشته‌کوه برفی البرز؛ تصویر شاخص شهرستان کرج',
			),
			'ferdows'    => array(
				'slugs' => array( 'ferdows', 'fardis' ),
				'title' => 'فردیس',
				'alt'   => 'نمای هوایی شبانه از شهر پرجمعیت فردیس با بلوار نورانی و کوه‌های البرز؛ تصویر شاخص شهرستان فردیس',
			),
			'sojablogh'  => array(
				'slugs' => array( 'sojablogh', 'savojbolagh' ),
				'title' => 'ساوجبلاغ',
				'alt'   => 'نمای هوایی شبانه از درهٔ کردان و چراغ‌های هشتگرد در ساوجبلاغ زیر ماه؛ تصویر شاخص شهرستان ساوجبلاغ',
			),
			'nazarabad'  => array(
				'slugs' => array( 'nazarabad' ),
				'title' => 'نظرآباد',
				'alt'   => 'نمای هوایی شبانه از شهر نظرآباد و تپهٔ باستانی ازبکی با نورپردازی طلایی؛ تصویر شاخص شهرستان نظرآباد',
			),
			'chaharbagh' => array(
				'slugs' => array( 'chaharbagh' ),
				'title' => 'چهارباغ',
				'alt'   => 'نمای هوایی شبانه از شهر چهارباغ میان باغ‌ها در دامنهٔ البرز؛ تصویر شاخص شهرستان چهارباغ',
			),
			'eshtehard'  => array(
				'slugs' => array( 'eshtehard' ),
				'title' => 'اشتهارد',
				'alt'   => 'نمای هوایی شبانه از شهر اشتهارد در دامنهٔ کویر زیر کهکشان راه شیری؛ تصویر شاخص شهرستان اشتهارد',
			),
			'talqan'     => array(
				'slugs' => array( 'talqan', 'taleqan' ),
				'title' => 'طالقان',
				'alt'   => 'نمای هوایی شبانه از دریاچهٔ سد طالقان با بازتاب ماه و چراغ روستاهای ییلاقی؛ تصویر شاخص شهرستان طالقان',
			),
		);

		/**
		 * Boot.
		 */
		public static function init() {
			static $instance = null;
			if ( null === $instance ) {
				$instance = new self();
				add_action( 'admin_menu', array( $instance, 'admin_menu' ) );
				add_action( 'admin_post_' . self::NONCE, array( $instance, 'handle_form' ) );
				if ( defined( 'WP_CLI' ) && WP_CLI ) {
					WP_CLI::add_command( 'sa-county-featured-alborz', array( $instance, 'cli' ) );
				}
			}
			return $instance;
		}

		/**
		 * Find the county post by candidate slugs.
		 *
		 * @param array $slugs Candidate slugs.
		 * @return WP_Post|null
		 */
		private function find_post( $slugs ) {
			foreach ( $slugs as $slug ) {
				$q = get_posts(
					array(
						'post_type'      => self::CPT,
						'name'           => sanitize_title( $slug ),
						'post_status'    => array( 'publish', 'draft', 'pending', 'future', 'private' ),
						'posts_per_page' => 1,
					)
				);
				if ( $q ) {
					return $q[0];
				}
			}
			return null;
		}

		/**
		 * Replace the featured image of one county.
		 *
		 * @param string $key County key.
		 * @return array {action, message}
		 */
		public function apply_one( $key ) {
			if ( ! isset( $this->counties[ $key ] ) ) {
				return array( 'action' => 'error', 'message' => 'شهرستان ناشناخته' );
			}
			$c    = $this->counties[ $key ];
			$post = $this->find_post( $c['slugs'] );
			if ( ! $post ) {
				return array( 'action' => 'missing', 'message' => 'صفحهٔ شهرستان پیدا نشد (اسلاگ‌ها: ' . implode( '، ', $c['slugs'] ) . ')' );
			}
			$file = __DIR__ . '/assets/counties/' . $key . '.webp';
			if ( ! file_exists( $file ) ) {
				return array( 'action' => 'error', 'message' => 'فایل تصویر در افزونه موجود نیست' );
			}
			$bits = file_get_contents( $file ); // phpcs:ignore WordPress.WP.AlternativeFunctions.file_get_contents_file_get_contents
			if ( false === $bits ) {
				return array( 'action' => 'error', 'message' => 'خواندن فایل ناموفق بود' );
			}
			$sha1     = sha1( $bits );
			$thumb_id = (int) get_post_thumbnail_id( $post->ID );
			if ( $thumb_id && get_post_meta( $thumb_id, '_sa_featured_sha1', true ) === $sha1 ) {
				return array( 'action' => 'kept', 'message' => 'همین تصویر از قبل تنظیم است (sha1 یکسان)' );
			}
			if ( ! function_exists( 'wp_generate_attachment_metadata' ) ) {
				require_once ABSPATH . 'wp-admin/includes/image.php';
			}
			if ( ! function_exists( 'wp_handle_upload' ) ) {
				require_once ABSPATH . 'wp-admin/includes/file.php';
			}
			$upload = wp_upload_bits( $key . '.webp', null, $bits );
			if ( ! empty( $upload['error'] ) ) {
				return array( 'action' => 'error', 'message' => 'بارگذاری ناموفق: ' . $upload['error'] );
			}
			$filetype = wp_check_filetype( $upload['file'] );
			$att_id   = wp_insert_attachment(
				array(
					'post_mime_type' => empty( $filetype['type'] ) ? 'image/webp' : $filetype['type'],
					'post_title'     => sanitize_text_field( 'شهرستان ' . $c['title'] . ' — نمای شبانه' ),
					'post_excerpt'   => sanitize_text_field( $c['alt'] ),
					'post_status'    => 'inherit',
				),
				$upload['file'],
				$post->ID
			);
			if ( is_wp_error( $att_id ) || ! $att_id ) {
				return array( 'action' => 'error', 'message' => 'ساخت پیوست ناموفق بود' );
			}
			wp_update_attachment_metadata( $att_id, wp_generate_attachment_metadata( $att_id, $upload['file'] ) );
			update_post_meta( $att_id, '_wp_attachment_image_alt', sanitize_text_field( $c['alt'] ) );
			update_post_meta( $att_id, '_sa_featured_sha1', $sha1 );
			update_post_meta( $att_id, '_sa_featured_source', 'sa-county-featured-alborz/assets/counties/' . $key . '.webp' );
			set_post_thumbnail( $post->ID, (int) $att_id );
			update_post_meta( $post->ID, '_sa_import_featured_sha1', $sha1 );
			return array(
				'action'  => $thumb_id ? 'replaced' : 'set',
				'message' => $thumb_id ? 'تصویر قبلی با نسخه‌ی شب‌نما جایگزین شد' : 'تصویر شاخص تنظیم شد',
			);
		}

		/**
		 * Apply all (or selected) counties.
		 *
		 * @param array $keys County keys (empty = all).
		 * @return array
		 */
		public function apply( $keys = array() ) {
			$results = array();
			foreach ( array_keys( $this->counties ) as $key ) {
				if ( $keys && ! in_array( $key, $keys, true ) ) {
					continue;
				}
				$results[ $key ] = $this->apply_one( $key );
			}
			return $results;
		}

		/**
		 * Admin menu.
		 */
		public function admin_menu() {
			add_management_page(
				'تصویر شاخص شهرستان‌های البرز',
				'تصویر شاخص البرز',
				'manage_options',
				'sa-county-featured-alborz',
				array( $this, 'render_page' )
			);
		}

		/**
		 * Handle form submit.
		 */
		public function handle_form() {
			if ( ! current_user_can( 'manage_options' ) || ! check_admin_referer( self::NONCE ) ) {
				wp_die( 'دسترسی مجاز نیست.' );
			}
			$keys    = isset( $_POST['counties'] ) ? array_map( 'sanitize_key', (array) $_POST['counties'] ) : array();
			$results = $this->apply( $keys );
			set_transient( 'sa_cf_alborz_results', $results, 300 );
			wp_safe_redirect( admin_url( 'tools.php?page=sa-county-featured-alborz&done=1' ) );
			exit;
		}

		/**
		 * Render admin page.
		 */
		public function render_page() {
			$results = get_transient( 'sa_cf_alborz_results' );
			if ( isset( $_GET['done'] ) && $results ) { // phpcs:ignore WordPress.Security.NonceVerification.Recommended
				delete_transient( 'sa_cf_alborz_results' );
				echo '<div class="notice notice-success"><ul>';
				foreach ( $results as $key => $r ) {
					echo '<li><strong>' . esc_html( $this->counties[ $key ]['title'] ) . ':</strong> ' . esc_html( $r['action'] ) . ' — ' . esc_html( $r['message'] ) . '</li>';
				}
				echo '</ul></div>';
			}
			echo '<div class="wrap" dir="rtl"><h1>تصویر شاخص شهرستان‌های استان البرز (نسخه‌ی شب‌نما)</h1>';
			echo '<p>برای هر شهرستان انتخاب‌شده، تصویر وب‌پی همراه افزونه در کتابخانه‌ی رسانه بارگذاری و <strong>جایگزین تصویر شاخص فعلی</strong> همان صفحه می‌شود. متن و وضعیت نوشته‌ها تغییر نمی‌کند.</p>';
			echo '<form method="post" action="' . esc_url( admin_url( 'admin-post.php' ) ) . '">';
			echo '<input type="hidden" name="action" value="' . esc_attr( self::NONCE ) . '" />';
			wp_nonce_field( self::NONCE );
			echo '<table class="widefat striped" style="max-width:640px"><thead><tr><th></th><th>شهرستان</th><th>وضعیت صفحه</th></tr></thead><tbody>';
			foreach ( $this->counties as $key => $c ) {
				$post  = $this->find_post( $c['slugs'] );
				$state = $post ? ( get_post_thumbnail_id( $post->ID ) ? 'دارای تصویر شاخص (جایگزین می‌شود)' : 'بدون تصویر شاخص' ) : 'صفحه پیدا نشد';
				echo '<tr><td><input type="checkbox" name="counties[]" value="' . esc_attr( $key ) . '" checked /></td><td>' . esc_html( $c['title'] ) . '</td><td>' . esc_html( $state ) . '</td></tr>';
			}
			echo '</tbody></table><p><button type="submit" class="button button-primary">جایگزینی تصویر شاخص انتخاب‌شده‌ها</button></p></form></div>';
		}

		/**
		 * WP-CLI: wp sa-county-featured-alborz [--slugs=karaj,talqan]
		 *
		 * @param array $args       Positional args.
		 * @param array $assoc_args Assoc args.
		 */
		public function cli( $args, $assoc_args ) {
			$keys    = ! empty( $assoc_args['slugs'] ) ? array_map( 'trim', explode( ',', $assoc_args['slugs'] ) ) : array();
			$results = $this->apply( $keys );
			foreach ( $results as $key => $r ) {
				WP_CLI::log( sprintf( '%-12s %-9s %s', $key, $r['action'], $r['message'] ) );
			}
			WP_CLI::success( 'انجام شد.' );
		}
	}

	add_action( 'plugins_loaded', array( 'SA_County_Featured_Alborz', 'init' ), 20 );
}
