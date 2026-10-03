<?php
/**
 * Plugin Name: سرزمین آریان — درون‌ریز شهرستان‌های استان سمنان
 * Plugin URI:  https://github.com/sarzaminaryan-arch/S.A.1
 * Description: درون‌ریز کامل ۸ شهرستان استان سمنان (سمنان، شاهرود، دامغان، گرمسار، مهدی‌شهر، سرخه، میامی، آرادان) — مقاله‌های استاندارد ساختار ۱۴بخشی، جدول‌ها، پرسش‌های متداول (FAQ ≥ ۱۰)، منابع (≥ ۵ با لینک نقشه)، فیلدهای مدل داده (sa_cty_*، sa_city_*، sa_google_map_url)، سئو رنک‌مث، ارتباط با برگهٔ مادر استان و طبقه‌بندی استان. این بسته تصویر شاخص همراه ندارد تا تصاویر شاخص موجودِ پیش‌نویس‌ها دست‌نخورده بماند. همه‌چیز پیش‌نویس می‌ماند؛ هیچ‌چیز منتشر نمی‌شود.
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

define( 'SA_CI_SEMNAN_VERSION', '1.0.0' );
define( 'SA_CI_SEMNAN_VERSION_FILE', __FILE__ );

require_once __DIR__ . '/includes/class-sa-city-importer.php';

/**
 * Register this plugin's data batch with the city importer core.
 */
function sa_ci_semnan_register() {
	SA_City_Semnan_Importer::instance()->register_batch(
		array(
			'id'          => 'semnan',
			'dir'         => __DIR__ . '/data',
			'plugin_file' => __FILE__,
			'version'     => SA_CI_SEMNAN_VERSION,
		)
	);
}
add_action( 'plugins_loaded', 'sa_ci_semnan_register', 20 );

/**
 * Slug aliases for hand-made Semnan drafts so the importer upgrades them in
 * place instead of creating a second draft. Canonical slugs follow the theme's
 * official county list (sarzaminaryan-child/data/counties.php).
 *
 * @param array  $aliases Aliases collected so far.
 * @param string $slug    Canonical package slug.
 * @return array
 */
function sa_ci_semnan_slug_aliases( $aliases, $slug ) {
	$map = array(
		'semnan-city' => array( 'semnan', 'semnan-county', 'shahrestan-semnan' ),
		'shahrud'     => array( 'shahrud-county', 'shahrood', 'shahrud-city-county' ),
		'damghan'     => array( 'damghan-county', 'damghan-city-county' ),
		'garmsar'     => array( 'garmsar-county', 'garmsar-city-county' ),
		'mehdishahr'  => array( 'mehdi-shahr', 'mahdishahr', 'sangsar', 'sang-sar', 'mehdishahr-county' ),
		'sorkheh'     => array( 'sorkheh-county', 'sorkhe' ),
		'meyami'      => array( 'meyami-county', 'miamy' ),
		'aradan'      => array( 'aradan-county' ),
	);
	return isset( $map[ $slug ] ) ? array_merge( (array) $aliases, $map[ $slug ] ) : (array) $aliases;
}
add_filter( 'sa_city_import_slug_aliases', 'sa_ci_semnan_slug_aliases', 10, 2 );
