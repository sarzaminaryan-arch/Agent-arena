<?php
/**
 * Plugin Name: سرزمین آریان — درون‌ریز شهرستان‌های استان لرستان
 * Plugin URI:  https://github.com/sarzaminaryan-arch/S.A.1
 * Description: درون‌ریز کامل ۱۲ شهرستان استان لرستان (ازنا، الیگودرز، بروجرد، خرم‌آباد، دلفان، دورود، رومشکان، سلسله، معمولان، پلدختر، چگنی، کوهدشت) — مقاله‌های استاندارد ساختار ۱۴بخشی، جدول‌ها، پرسش‌های متداول (FAQ ≥ ۱۰)، منابع (≥ ۵ با لینک نقشه)، فیلدهای مدل داده (sa_cty_*، sa_city_*، sa_google_map_url)، سئو رنک‌مث، ارتباط با برگهٔ مادر استان و طبقه‌بندی استان. برای هر شهرستان تصویر شاخص سینمایی وب‌پی همراه است؛ تصویر شاخص پیش‌نویس‌های موجود به‌صورت پیش‌فرض دست‌نخورده می‌ماند. همه‌چیز پیش‌نویس می‌ماند؛ هیچ‌چیز منتشر نمی‌شود.
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

define( 'SA_CI_LORESTAN_VERSION', '1.0.0' );
define( 'SA_CI_LORESTAN_VERSION_FILE', __FILE__ );

require_once __DIR__ . '/includes/class-sa-city-importer.php';

/**
 * Register this plugin's data batch with the city importer core.
 */
function sa_ci_lorestan_register() {
	SA_City_Lorestan_Importer::instance()->register_batch(
		array(
			'id'          => 'lorestan',
			'dir'         => __DIR__ . '/data',
			'plugin_file' => __FILE__,
			'version'     => SA_CI_LORESTAN_VERSION,
		)
	);
}
add_action( 'plugins_loaded', 'sa_ci_lorestan_register', 20 );

/**
 * Slug aliases for hand-made Lorestan drafts so the importer upgrades them in
 * place instead of creating a second draft. Canonical slugs follow the theme's
 * official county list (sarzaminaryan-child/data/counties.php).
 *
 * @param array  $aliases Aliases collected so far.
 * @param string $slug    Canonical package slug.
 * @return array
 */
function sa_ci_lorestan_slug_aliases( $aliases, $slug ) {
	$map = array(
		'azna'           => array( 'azna-county', 'azna-shahrestan' ),
		'aligudarz'      => array( 'aligudarz-county', 'aligoodarz', 'aligoodarz-county' ),
		'borujerd'       => array( 'borujerd-county', 'borujerd-city', 'borujerd-city-county' ),
		'khorramabad'    => array( 'khorramabad-county', 'khoramabad', 'khoramabad-county', 'khorramabad-city-county' ),
		'delfan'         => array( 'delfan-county', 'noorabad', 'nurabad', 'noorabad-delfan' ),
		'dorud'          => array( 'dorud-county', 'dorood', 'dorood-county', 'darood' ),
		'rumeshkan'      => array( 'rumeshkan-county', 'rumeshgan', 'romeshkan', 'romeshkan-county' ),
		'selseleh'       => array( 'selseleh-county', 'silsileh', 'aleshtar', 'selseleh-shahrestan' ),
		'mamulan'        => array( 'mamulan-county', 'mamoolan' ),
		'pol-e-dokhtar'  => array( 'poldokhtar', 'pol-dokhtar', 'pol-e-dokhtar-county', 'poldokhtar-county' ),
		'chegeni'        => array( 'chegeni-county', 'chegani', 'dovreh', 'dowreh', 'dowreh-chegeni' ),
		'kuhdasht'       => array( 'kuhdasht-county', 'koohdasht', 'koohdasht-county' ),
	);
	return isset( $map[ $slug ] ) ? array_merge( (array) $aliases, $map[ $slug ] ) : (array) $aliases;
}
add_filter( 'sa_city_import_slug_aliases', 'sa_ci_lorestan_slug_aliases', 10, 2 );
