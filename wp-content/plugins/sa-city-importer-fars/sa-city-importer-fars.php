<?php
/**
 * Plugin Name: سرزمین آریان — درون‌ریز شهرستان‌های استان فارس
 * Plugin URI:  https://github.com/sarzaminaryan-arch/S.A.1
 * Description: درون‌ریز کامل ۳۷ شهرستان استان فارس (آباده، ارسنجان، استهبان، اقلید، اوز، بختگان، بوانات، بیضا، جهرم، جویم، خرامه، خرم‌بید، خفر، خنج، داراب، رستم، زرقان، زرین‌دشت، سروستان، سرچهان، سپیدان، شیراز، فراشبند، فسا، فیروزآباد، قیر و کارزین، لارستان، لامرد، مرودشت، ممسنی، مهر، نی‌ریز، پاسارگاد، چنارشاهیجان، کازرون، کوار، گراش) — مقاله‌های استاندارد ساختار ۱۴بخشی، جدول‌ها، پرسش‌های متداول (FAQ ≥ ۱۰)، منابع (≥ ۵ با لینک نقشه)، فیلدهای مدل داده (sa_cty_*، sa_city_*، sa_google_map_url)، سئو رنک‌مث، ارتباط با برگهٔ مادر استان و طبقه‌بندی استان. این بسته تصویر شاخص همراه ندارد تا تصاویر شاخص موجودِ پیش‌نویس‌ها دست‌نخورده بماند. همه‌چیز پیش‌نویس می‌ماند؛ هیچ‌چیز منتشر نمی‌شود.
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

define( 'SA_CI_FARS_VERSION', '1.0.0' );
define( 'SA_CI_FARS_VERSION_FILE', __FILE__ );

require_once __DIR__ . '/includes/class-sa-city-importer.php';

/**
 * Register this plugin's data batch with the city importer core.
 */
function sa_ci_fars_register() {
	SA_City_Fars_Importer::instance()->register_batch(
		array(
			'id'          => 'fars',
			'dir'         => __DIR__ . '/data',
			'plugin_file' => __FILE__,
			'version'     => SA_CI_FARS_VERSION,
		)
	);
}
add_action( 'plugins_loaded', 'sa_ci_fars_register', 20 );

/**
 * Slug aliases for hand-made Fars drafts so the importer upgrades them in
 * place instead of creating a second draft. Canonical slugs follow the theme's
 * official county list (sarzaminaryan-child/data/counties.php).
 *
 * @param array  $aliases Aliases collected so far.
 * @param string $slug    Canonical package slug.
 * @return array
 */
function sa_ci_fars_slug_aliases( $aliases, $slug ) {
	$map = array(
		'abadeh'          => array( 'abadeh-county', 'abade-city-county' ),
		'arsanjan'        => array( 'arsanjan-county' ),
		'estahban'        => array( 'estahban-county', 'estahbanat' ),
		'eqlid'           => array( 'eqlid-county', 'eghlid', 'iqlid' ),
		'evaz'            => array( 'evaz-county', 'owaz' ),
		'bakhtegan'       => array( 'bakhtegan-county', 'abade-tashk-county' ),
		'bavanat'         => array( 'bavanat-county', 'surian' ),
		'beyza'           => array( 'beyza-county', 'bayza' ),
		'jahrom'          => array( 'jahrom-county', 'jahrom-city-county' ),
		'jooyom'          => array( 'jooyom-county', 'juyom', 'juyum' ),
		'kharameh'        => array( 'kharameh-county', 'kharrameh' ),
		'khorrambid'      => array( 'khorrambid-county', 'khoram-bid', 'safashahr-county' ),
		'khafr'           => array( 'khafr-county', 'khafar', 'bab-anar-county' ),
		'khonj'           => array( 'khonj-county', 'khonj-city-county' ),
		'darab'          => array( 'darab-county', 'darab-city-county' ),
		'rostam'          => array( 'rostam-county', 'masiri-county' ),
		'zarghan'         => array( 'zarghan-county', 'zarkan' ),
		'zarrin-dasht'    => array( 'zarrindasht', 'zarrin-dasht-county', 'hajiabad-zarrindasht-county' ),
		'sarvestan'       => array( 'sarvestan-county', 'sarvestan-fars' ),
		'sarchahan'       => array( 'sarchahan-county', 'korei-county', 'kore-i' ),
		'sepidan'         => array( 'sepidan-county', 'ardakan-fars-county', 'ardakan-county' ),
		'shiraz'          => array( 'shiraz-county', 'shiraz-city-county' ),
		'farashband'      => array( 'farashband-county', 'farashband-city-county' ),
		'fasa'            => array( 'fasa-county', 'fasa-city-county' ),
		'firuzabad'       => array( 'firuzabad-county', 'firouzabad', 'firuzabad-fars' ),
		'qir-va-karzin'   => array( 'qir-va-karzin-county', 'qir-karzin', 'qir-county', 'karzin-county' ),
		'larestan'        => array( 'larestan-county', 'lar-county', 'lar-city-county' ),
		'lamerd'          => array( 'lamerd-county', 'lamerd-city-county' ),
		'marvdasht'       => array( 'marvdasht-county', 'marv-dasht', 'marvdasht-city-county' ),
		'mamasani'        => array( 'mamasani-county', 'noorabad-mamasani-county', 'nurabad-mamasani' ),
		'mehr'            => array( 'mehr-county', 'mohr', 'mohr-fars', 'mehr-fars-county' ),
		'neyriz'          => array( 'neyriz-county', 'neyriz-city-county', 'neiriz' ),
		'pasargad'        => array( 'pasargad-county', 'saadatshahr-county' ),
		'chenar-shahijan' => array( 'kuh-chenar', 'kuhchenar', 'kohchenar', 'chenar-shahijan-county', 'qaemiyeh-county' ),
		'kazerun'         => array( 'kazerun-county', 'kazerun-city-county' ),
		'kavar'           => array( 'kavar-county', 'qabad-county' ),
		'gerash'          => array( 'gerash-county', 'girash', 'gerash-city-county' ),
	);
	return isset( $map[ $slug ] ) ? array_merge( (array) $aliases, $map[ $slug ] ) : (array) $aliases;
}
add_filter( 'sa_city_import_slug_aliases', 'sa_ci_fars_slug_aliases', 10, 2 );
