<?php
/**
 * Plugin Name: سرزمین آریان — درون‌ریز شهرستان‌های استان مازندران
 * Plugin URI:  https://github.com/sarzaminaryan-arch/S.A.1
 * Description: درون‌ریز کامل ۲۲ شهرستان استان مازندران (آمل، بابل، بابلسر، بهشهر، تنکابن، جویبار، رامسر، ساری، سوادکوه، سوادکوه شمالی، سیمرغ، عباس‌آباد، فریدونکنار، قائم‌شهر، محمودآباد، میاندورود، نور، نوشهر، نکا، چالوس، کلاردشت، گلوگاه) — مقاله‌های استاندارد ساختار ۱۴بخشی، جدول‌ها، پرسش‌های متداول (FAQ ≥ ۱۰)، منابع (≥ ۵ با لینک نقشه)، فیلدهای مدل داده (sa_cty_*، sa_city_*، sa_google_map_url)، سئو رنک‌مث، ارتباط با برگهٔ مادر استان و طبقه‌بندی استان. برای هر شهرستان تصویر شاخص سینمایی وب‌پی همراه است؛ تصویر شاخص پیش‌نویس‌های موجود به‌صورت پیش‌فرض دست‌نخورده می‌ماند. همه‌چیز پیش‌نویس می‌ماند؛ هیچ‌چیز منتشر نمی‌شود.
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

define( 'SA_CI_MAZANDARAN_VERSION', '1.0.0' );
define( 'SA_CI_MAZANDARAN_VERSION_FILE', __FILE__ );

require_once __DIR__ . '/includes/class-sa-city-importer.php';

/**
 * Register this plugin's data batch with the city importer core.
 */
function sa_ci_mazandaran_register() {
	SA_City_Mazandaran_Importer::instance()->register_batch(
		array(
			'id'          => 'mazandaran',
			'dir'         => __DIR__ . '/data',
			'plugin_file' => __FILE__,
			'version'     => SA_CI_MAZANDARAN_VERSION,
		)
	);
}
add_action( 'plugins_loaded', 'sa_ci_mazandaran_register', 20 );

/**
 * Slug aliases for hand-made Lorestan drafts so the importer upgrades them in
 * place instead of creating a second draft. Canonical slugs follow the theme's
 * official county list (sarzaminaryan-child/data/counties.php).
 *
 * @param array  $aliases Aliases collected so far.
 * @param string $slug    Canonical package slug.
 * @return array
 */
function sa_ci_mazandaran_slug_aliases( $aliases, $slug ) {
	$map = array(
		'amol'              => array( 'amol-county', 'amol-city', 'amol-shahrestan' ),
		'babol'             => array( 'babol-county', 'babol-city', 'barforoush' ),
		'babolsar'          => array( 'babolsar-county', 'babolsar-city', 'mashhadsar' ),
		'behshahr'          => array( 'behshahr-county', 'behshahr-city', 'ashraf', 'ashrafolbelad' ),
		'tonekabon'         => array( 'tonekabon-county', 'tonekabon-city', 'shahsavar', 'tonekabon-shahsavar' ),
		'joybar'            => array( 'joybar-county', 'joybar-city', 'jouybar' ),
		'ramsar'            => array( 'ramsar-county', 'ramsar-city' ),
		'sari'              => array( 'sari-county', 'sari-city', 'sary', 'sarvieh' ),
		'savadkuh'          => array( 'savadkuh-county', 'savad-kuh', 'pol-e-sefid' ),
		'savadkuh-shomali'  => array( 'savadkuh-shomali-county', 'shomali-savadkuh', 'shirgah' ),
		'simorgh'           => array( 'simorgh-county', 'simorgh-mazandaran', 'kiakola' ),
		'abbasabad'         => array( 'abbasabad-county', 'abbasabad-mazandaran', 'abbas-abad' ),
		'freydunkenar'      => array( 'freydunkenar-county', 'fereydunkenar', 'fereydun-kenar' ),
		'qaemshahr'         => array( 'qaemshahr-county', 'qaemshahr-city', 'qaem-shahr', 'shahi' ),
		'mahmudabad'        => array( 'mahmudabad-county', 'mahmudabad-mazandaran', 'mahmoodabad' ),
		'miandorud'         => array( 'miandorud-county', 'mian-dorud', 'sorkhrud' ),
		'nur'               => array( 'nur-county', 'nur-mazandaran', 'noor', 'baladeh' ),
		'nowshahr'          => array( 'nowshahr-county', 'nowshahr-city', 'now-shahr', 'noushahr' ),
		'neka'              => array( 'neka-county', 'neka-city' ),
		'chalus'            => array( 'chalus-county', 'chalus-city', 'chaloos' ),
		'kelardasht'        => array( 'kelardasht-county', 'kelar-dasht', 'hasankeif' ),
		'gologah'           => array( 'gologah-county', 'galugah', 'goloogah' ),
	);
	return isset( $map[ $slug ] ) ? array_merge( (array) $aliases, $map[ $slug ] ) : (array) $aliases;
}
add_filter( 'sa_city_import_slug_aliases', 'sa_ci_mazandaran_slug_aliases', 10, 2 );
