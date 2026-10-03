<?php
/**
 * Plugin Name: سرزمین آریان — درون‌ریز شهرستان‌های استان زنجان
 * Plugin URI:  https://github.com/sarzaminaryan-arch/S.A.1
 * Description: درون‌ریز کامل ۸ شهرستان استان زنجان (زنجان، ابهر، خدابنده، طارم، ایجرود، سلطانیه، ماه‌نشان، خرمدره) — مقاله‌های استاندارد ساختار ۱۴بخشی، جدول‌ها، پرسش‌های متداول (FAQ ≥ ۱۰)، منابع (≥ ۵ با لینک نقشه)، فیلدهای مدل داده (sa_cty_*، sa_city_*، sa_google_map_url)، سئو رنک‌مث، ارتباط با برگهٔ مادر استان، طبقه‌بندی استان و تصویر شاخص وب‌پی همراه هر صفحه. همه‌چیز پیش‌نویس می‌ماند؛ هیچ‌چیز منتشر نمی‌شود.
 * Version:     1.0.0
 * Requires at least: 6.0
 * Requires PHP: 7.4
 * Author:      سرزمین آریان
 * Author URI:  https://sarzaminaryan.ir
 * License:     GPLv2 or later
 * License URI: http://www.gnu.org/licenses/gpl-2.0.html
 * Text Domain: sa-province-importer
 *
 * @package Sarzaminaryan_City_Importer
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

define( 'SA_CI_ZANJAN_VERSION', '1.0.0' );
define( 'SA_CI_ZANJAN_VERSION_FILE', __FILE__ );

require_once __DIR__ . '/includes/class-sa-city-importer.php';

/**
 * Register this plugin's data batch with the city importer core.
 */
function sa_ci_zanjan_register() {
	SA_City_Zanjan_Importer::instance()->register_batch(
		array(
			'id'          => 'zanjan',
			'dir'         => __DIR__ . '/data',
			'plugin_file' => __FILE__,
			'version'     => SA_CI_ZANJAN_VERSION,
		)
	);
}
add_action( 'plugins_loaded', 'sa_ci_zanjan_register', 20 );

/**
 * Slug aliases for hand-made Zanjan drafts so the importer upgrades them in
 * place instead of creating a second draft. Canonical slugs follow the theme's
 * official county list (sarzaminaryan-child/data/counties.php).
 *
 * @param array  $aliases Aliases collected so far.
 * @param string $slug    Canonical package slug.
 * @return array
 */
function sa_ci_zanjan_slug_aliases( $aliases, $slug ) {
	$map = array(
		'zanjan-city' => array( 'zanjan', 'zanjan-city-county', 'shahrestan-zanjan' ),
		'abhar'       => array( 'abhar-city-county', 'abhar-county' ),
		'khodabandeh' => array( 'khodabandeh-city-county', 'qeydar', 'qeydar-county' ),
		'tarom'       => array( 'tarom-city-county', 'tarom-olya' ),
		'ejrud'       => array( 'ejrud-county', 'ijrud', 'abbar', 'ab-bar', 'abbar-county', 'zarrinabad' ),
		'soltaniyeh'  => array( 'soltaniyeh-city-county', 'soltanieh', 'sultaniyeh' ),
		'mahneshan'   => array( 'mahneshan-city-county', 'mah-neshan', 'maneshan' ),
		'kharadere'   => array( 'khoramdarreh', 'khorramdarreh', 'khorramdarreh-city-county', 'khoramdarreh-county' ),
	);
	return isset( $map[ $slug ] ) ? array_merge( (array) $aliases, $map[ $slug ] ) : (array) $aliases;
}
add_filter( 'sa_city_import_slug_aliases', 'sa_ci_zanjan_slug_aliases', 10, 2 );
