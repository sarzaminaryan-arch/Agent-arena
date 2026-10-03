<?php
/**
 * Plugin Name: سرزمین آریان — تصویر شاخص شهرستان‌های استان سیستان و بلوچستان
 * Plugin URI:  https://github.com/sarzaminaryan-arch/S.A.1
 * Description: جایگزینی تصویر شاخص ۲۶ شهرستان استان سیستان و بلوچستان (زاهدان، چابهار، ایرانشهر، سراوان، سرباز، خاش، زابل، نیک‌شهر، کنارک، سیب و سوران، زهک، مهرستان، دلگان، هیرمند، قصرقند، فنوج، نیمروز، میرجاوه، هامون، تفتان، بمپور، راسک، دشتیاری، لاشار، گلشن، زرآباد) با تصاویر هوایی روز وب‌پی همراه افزونه. تصویر قبلی صفحه با نسخه‌ی جدید جایگزین می‌شود (شناسه‌ی sha1 برای جلوگیری از بارگذاری تکراری). فقط تصویر شاخص عوض می‌شود؛ متن و وضعیت نوشته‌ها دست نمی‌خورد.
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

if ( ! class_exists( 'SA_County_Featured_Sistan' ) ) {

	/**
	 * Replaces featured images of Sistan and Baluchestan county pages with bundled daytime aerial webp files.
	 */
	class SA_County_Featured_Sistan {

		const CPT     = 'city';
		const VERSION = '1.0.0';
		const NONCE   = 'sa_county_featured_sistan';

		/**
		 * County key => candidate slugs + Persian title + alt text.
		 *
		 * @var array
		 */
		private $counties = array(
			'zahedan' => array(
				'slugs' => array( 'zahedan' ),
				'title' => 'زاهدان',
				'alt'   => 'نمای هوایی روز از زاهدان و مسجد جامع مکی با گنبدها و مناره‌های فیروزه‌ای؛ تصویر شاخص شهرستان زاهدان',
			),
			'chabahar' => array(
				'slugs' => array( 'chabahar', 'chah-bahar' ),
				'title' => 'چابهار',
				'alt'   => 'نمای هوایی روز از کوه‌های مریخی چابهار و ساحل فیروزه‌ای دریای عمان؛ تصویر شاخص شهرستان چابهار',
			),
			'iranshahr' => array(
				'slugs' => array( 'iranshahr' ),
				'title' => 'ایرانشهر',
				'alt'   => 'نمای هوایی روز از قلعهٔ ناصری ایرانشهر میان نخلستان‌ها؛ تصویر شاخص شهرستان ایرانشهر',
			),
			'saravan' => array(
				'slugs' => array( 'saravan' ),
				'title' => 'سراوان',
				'alt'   => 'نمای هوایی روز از نخلستان‌های سرسبز سراوان و قلعهٔ خشتی میان نخل‌ها؛ تصویر شاخص شهرستان سراوان',
			),
			'sarbaz' => array(
				'slugs' => array( 'sarbaz' ),
				'title' => 'سرباز',
				'alt'   => 'نمای هوایی روز از درهٔ سرسبز رود سرباز، زیستگاه گاندو، میان نخلستان‌ها؛ تصویر شاخص شهرستان سرباز',
			),
			'khash' => array(
				'slugs' => array( 'khash' ),
				'title' => 'خاش',
				'alt'   => 'نمای هوایی روز از شهر خاش در دامنهٔ آتشفشان تفتان؛ تصویر شاخص شهرستان خاش',
			),
			'zabol' => array(
				'slugs' => array( 'zabol' ),
				'title' => 'زابل',
				'alt'   => 'نمای هوایی روز از محوطهٔ باستانی شهر سوختهٔ زابل در دشت سیستان؛ تصویر شاخص شهرستان زابل',
			),
			'nik-shahr' => array(
				'slugs' => array( 'nik-shahr', 'nikshahr' ),
				'title' => 'نیک‌شهر',
				'alt'   => 'نمای هوایی روز از قلعهٔ تاریخی نیک‌شهر بر فراز تپه میان نخلستان‌ها؛ تصویر شاخص شهرستان نیک‌شهر',
			),
			'konarak' => array(
				'slugs' => array( 'konarak' ),
				'title' => 'کنارک',
				'alt'   => 'نمای هوایی روز از خلیج فیروزه‌ای پزم و قایق‌های صیادی کنارک در ساحل مکران؛ تصویر شاخص شهرستان کنارک',
			),
			'sib-va-suran' => array(
				'slugs' => array( 'sib-va-suran', 'sib-and-suran', 'sib-suran', 'seb-va-suran' ),
				'title' => 'سیب و سوران',
				'alt'   => 'نمای هوایی روز از قلعهٔ تاریخی سیب میان نخلستان‌ها؛ تصویر شاخص شهرستان سیب و سوران',
			),
			'zehak' => array(
				'slugs' => array( 'zehak' ),
				'title' => 'زهک',
				'alt'   => 'نمای هوایی روز از دشت سرسبز زهک و کشتزارهای کنار رود هیرمند؛ تصویر شاخص شهرستان زهک',
			),
			'mehrestan' => array(
				'slugs' => array( 'mehrestan', 'zaboli' ),
				'title' => 'مهرستان',
				'alt'   => 'نمای هوایی روز از باغ‌های کوهستانی مهرستان میان کوه‌های بلوچستان؛ تصویر شاخص شهرستان مهرستان',
			),
			'dalgan' => array(
				'slugs' => array( 'dalgan', 'dalagan' ),
				'title' => 'دلگان',
				'alt'   => 'نمای هوایی روز از نخلستان‌های گستردهٔ دلگان پیرامون گلمورتی؛ تصویر شاخص شهرستان دلگان',
			),
			'hirmand' => array(
				'slugs' => array( 'hirmand' ),
				'title' => 'هیرمند',
				'alt'   => 'نمای هوایی روز از رود هیرمند و نیزارها و کشتزارهای سیستان؛ تصویر شاخص شهرستان هیرمند',
			),
			'qasr-e-qand' => array(
				'slugs' => array( 'qasr-e-qand', 'qasr-e-ghand', 'qasre-qand', 'qasr-qand' ),
				'title' => 'قصرقند',
				'alt'   => 'نمای هوایی روز از قلعهٔ کهن قصرقند میان نخلستان‌ها و باغ‌های موز؛ تصویر شاخص شهرستان قصرقند',
			),
			'fanuj' => array(
				'slugs' => array( 'fanuj', 'fannuj' ),
				'title' => 'فنوج',
				'alt'   => 'نمای هوایی روز از فنوج، نخلستان‌ها و کوهستان بلوچستان؛ تصویر شاخص شهرستان فنوج',
			),
			'nimruz' => array(
				'slugs' => array( 'nimruz', 'nimrooz' ),
				'title' => 'نیمروز',
				'alt'   => 'نمای هوایی روز از آسبادهای تاریخی سیستان در دشت نیمروز؛ تصویر شاخص شهرستان نیمروز',
			),
			'mirjaveh' => array(
				'slugs' => array( 'mirjaveh' ),
				'title' => 'میرجاوه',
				'alt'   => 'نمای هوایی روز از میرجاوه، دروازهٔ مرزی شرق ایران میان کوه‌های رنگی؛ تصویر شاخص شهرستان میرجاوه',
			),
			'hamun' => array(
				'slugs' => array( 'hamun', 'hamoon' ),
				'title' => 'هامون',
				'alt'   => 'نمای هوایی روز از کوه خواجه بر کرانهٔ دریاچهٔ هامون؛ تصویر شاخص شهرستان هامون',
			),
			'taftan' => array(
				'slugs' => array( 'taftan' ),
				'title' => 'تفتان',
				'alt'   => 'نمای هوایی روز از قلهٔ آتشفشانی تفتان با چشمه‌های گوگردی؛ تصویر شاخص شهرستان تفتان',
			),
			'bampur' => array(
				'slugs' => array( 'bampur', 'bampour' ),
				'title' => 'بمپور',
				'alt'   => 'نمای هوایی روز از قلعهٔ کهن بمپور بر کرانهٔ رود بمپور؛ تصویر شاخص شهرستان بمپور',
			),
			'rask' => array(
				'slugs' => array( 'rask' ),
				'title' => 'راسک',
				'alt'   => 'نمای هوایی روز از راسک، شهر نخل و رود در بلوچستان؛ تصویر شاخص شهرستان راسک',
			),
			'dashtiari' => array(
				'slugs' => array( 'dashtiari' ),
				'title' => 'دشتیاری',
				'alt'   => 'نمای هوایی روز از رود باهوکلات و شالیزارهای دشتیاری؛ تصویر شاخص شهرستان دشتیاری',
			),
			'lashar' => array(
				'slugs' => array( 'lashar' ),
				'title' => 'لاشار',
				'alt'   => 'نمای هوایی روز از نخلستان‌های اسپکه در درهٔ لاشار؛ تصویر شاخص شهرستان لاشار',
			),
			'golshan' => array(
				'slugs' => array( 'golshan' ),
				'title' => 'گلشن',
				'alt'   => 'نمای هوایی روز از باغ‌های گشت سراوان در شهرستان گلشن؛ تصویر شاخص شهرستان گلشن',
			),
			'zarabad' => array(
				'slugs' => array( 'zarabad' ),
				'title' => 'زرآباد',
				'alt'   => 'نمای هوایی روز از نخلستان‌های ساحلی زرآباد در کرانهٔ مکران؛ تصویر شاخص شهرستان زرآباد',
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
					WP_CLI::add_command( 'sa-county-featured-sistan', array( $instance, 'cli' ) );
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
					'post_title'     => sanitize_text_field( 'شهرستان ' . $c['title'] . ' — نمای هوایی روز' ),
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
			update_post_meta( $att_id, '_sa_featured_source', 'sa-county-featured-sistan/assets/counties/' . $key . '.webp' );
			set_post_thumbnail( $post->ID, (int) $att_id );
			update_post_meta( $post->ID, '_sa_import_featured_sha1', $sha1 );
			return array(
				'action'  => $thumb_id ? 'replaced' : 'set',
				'message' => $thumb_id ? 'تصویر قبلی با نمای هوایی روز جایگزین شد' : 'تصویر شاخص تنظیم شد',
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
				'تصویر شاخص شهرستان‌های سیستان و بلوچستان',
				'تصویر شاخص سیستان',
				'manage_options',
				'sa-county-featured-sistan',
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
			set_transient( 'sa_cf_sistan_results', $results, 300 );
			wp_safe_redirect( admin_url( 'tools.php?page=sa-county-featured-sistan&done=1' ) );
			exit;
		}

		/**
		 * Render admin page.
		 */
		public function render_page() {
			$results = get_transient( 'sa_cf_sistan_results' );
			if ( isset( $_GET['done'] ) && $results ) { // phpcs:ignore WordPress.Security.NonceVerification.Recommended
				delete_transient( 'sa_cf_sistan_results' );
				echo '<div class="notice notice-success"><ul>';
				foreach ( $results as $key => $r ) {
					echo '<li><strong>' . esc_html( $this->counties[ $key ]['title'] ) . ':</strong> ' . esc_html( $r['action'] ) . ' — ' . esc_html( $r['message'] ) . '</li>';
				}
				echo '</ul></div>';
			}
			echo '<div class="wrap" dir="rtl"><h1>تصویر شاخص شهرستان‌های استان سیستان و بلوچستان (نمای هوایی روز)</h1>';
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
		 * WP-CLI: wp sa-county-featured-sistan [--slugs=zahedan,chabahar]
		 *
		 * @param array $args       Positional args.
		 * @param array $assoc_args Assoc args.
		 */
		public function cli( $args, $assoc_args ) {
			$keys    = ! empty( $assoc_args['slugs'] ) ? array_map( 'trim', explode( ',', $assoc_args['slugs'] ) ) : array();
			$results = $this->apply( $keys );
			foreach ( $results as $key => $r ) {
				WP_CLI::log( sprintf( '%-14s %-9s %s', $key, $r['action'], $r['message'] ) );
			}
			WP_CLI::success( 'انجام شد.' );
		}
	}

	add_action( 'plugins_loaded', array( 'SA_County_Featured_Sistan', 'init' ), 20 );
}
