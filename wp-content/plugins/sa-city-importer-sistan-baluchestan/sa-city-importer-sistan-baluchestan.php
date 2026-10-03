<?php
/**
 * Plugin Name: سرزمین آریان — درون‌ریز شهرستان‌های استان سیستان و بلوچستان
 * Plugin URI:  https://github.com/sarzaminaryan-arch/S.A.1
 * Description: درون‌ریز کامل ۲۶ شهرستان استان سیستان و بلوچستان (ایرانشهر، بمپور، تفتان، خاش، دشتیاری، دلگان، راسک، زابل، زاهدان، زرآباد، زهک، سراوان، سرباز، سیب و سوران، فنوج، قصرقند، لاشار، مهرستان، میرجاوه، نیمروز، نیک‌شهر، هامون، هیرمند، چابهار، کنارک، گلشن) — مقاله‌های استاندارد ساختار ۱۴بخشی، جدول‌ها، پرسش‌های متداول (FAQ ≥ ۱۰)، منابع (≥ ۵ با لینک نقشه)، فیلدهای مدل داده (sa_cty_*، sa_city_*، sa_google_map_url)، سئو رنک‌مث، ارتباط با برگهٔ مادر استان و طبقه‌بندی استان. این بسته تصویر شاخص همراه ندارد تا تصاویر شاخص موجودِ پیش‌نویس‌ها دست‌نخورده بماند. همه‌چیز پیش‌نویس می‌ماند؛ هیچ‌چیز منتشر نمی‌شود.
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

define( 'SA_CI_SISTAN_VERSION', '1.0.0' );
define( 'SA_CI_SISTAN_VERSION_FILE', __FILE__ );

require_once __DIR__ . '/includes/class-sa-city-importer.php';

/**
 * Register this plugin's data batch with the city importer core.
 */
function sa_ci_sistan_register() {
	SA_City_Sistan_Baluchestan_Importer::instance()->register_batch(
		array(
			'id'          => 'sistan-baluchestan',
			'dir'         => __DIR__ . '/data',
			'plugin_file' => __FILE__,
			'version'     => SA_CI_SISTAN_VERSION,
		)
	);
}
add_action( 'plugins_loaded', 'sa_ci_sistan_register', 20 );

/**
 * Slug aliases for hand-made Sistan-Baluchestan drafts so the importer
 * upgrades them in place instead of creating a second draft. Canonical slugs
 * follow the theme's official county list
 * (sarzaminaryan-child/data/counties.php).
 *
 * @param array  $aliases Aliases collected so far.
 * @param string $slug    Canonical package slug.
 * @return array
 */
function sa_ci_sistan_slug_aliases( $aliases, $slug ) {
	$map = array(
		'iranshahr'    => array( 'iranshahr-county', 'iran-shahr' ),
		'bampur'       => array( 'bampur-county', 'bampour' ),
		'taftan'       => array( 'taftan-county', 'nokabad', 'nok-abad' ),
		'khash'        => array( 'khash-county', 'khaash' ),
		'dashtiari'    => array( 'dashtiari-county', 'dashtyari', 'negur' ),
		'dalgan'       => array( 'dalgan-county', 'delgan', 'galmurti' ),
		'rask'         => array( 'rask-county', 'rasak' ),
		'zabol'        => array( 'zabol-county', 'zabol-city-county' ),
		'zahedan'      => array( 'zahedan-county', 'zahedan-city-county', 'zahdan' ),
		'zarabad'      => array( 'zarabad-county', 'zar-abad' ),
		'zehak'        => array( 'zehak-county', 'zahak' ),
		'saravan'      => array( 'saravan-county', 'saravan-city-county' ),
		'sarbaz'       => array( 'sarbaz-county', 'sar-baz' ),
		'sib-va-suran' => array( 'sib-o-suran', 'sib-o-soran', 'sib-suran', 'sib-va-suran-county', 'suran' ),
		'fanuj'        => array( 'fanuj-county', 'panuch', 'fanoj' ),
		'qasr-e-qand'  => array( 'qasrghand', 'qasr-qand', 'ghasreghand', 'ghasr-e-qand', 'qasr-e-qand-county' ),
		'lashar'       => array( 'lashar-county', 'espakeh', 'lashaar' ),
		'mehrestan'    => array( 'mehrestan-county', 'magas', 'mehrestan-city' ),
		'mirjaveh'     => array( 'mirjaveh-county', 'mir-javeh', 'mirjave' ),
		'nimruz'       => array( 'nimruz-county', 'nimrouz', 'poshtab', 'adimi' ),
		'nik-shahr'    => array( 'nikshahr', 'nikshahr-county', 'nik-shahr-county', 'nikshar' ),
		'hamun'        => array( 'hamoon', 'hamoon-county', 'hamun-county', 'mohammadabad-hamun' ),
		'hirmand'      => array( 'hirmand-county', 'miyankongi', 'miankangi', 'dust-mohammad' ),
		'chabahar'     => array( 'chabahar-county', 'chahbahar', 'cha-bahar', 'chabahar-city-county' ),
		'konarak'      => array( 'konarak-county', 'kenerak', 'konarak-city-county' ),
		'golshan'      => array( 'golshan-county', 'jalegh', 'jaleq', 'jaleq-golshan' ),
	);
	return isset( $map[ $slug ] ) ? array_merge( (array) $aliases, $map[ $slug ] ) : (array) $aliases;
}
add_filter( 'sa_city_import_slug_aliases', 'sa_ci_sistan_slug_aliases', 10, 2 );
