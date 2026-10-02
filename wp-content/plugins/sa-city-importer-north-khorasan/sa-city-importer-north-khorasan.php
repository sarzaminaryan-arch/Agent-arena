<?php
/**
 * Plugin Name: سرزمین آریان — درون‌ریز شهرستان‌های خراسان شمالی
 * Plugin URI:  https://github.com/sarzaminaryan-arch/Agent-arena
 * Description: درون‌ریز هفت مقالهٔ شهرستان‌های خراسان شمالی به‌صورت پیش‌نویس، همراه با متن، FAQ، منابع، سئو و تصویر شاخص. هیچ نوشته‌ای منتشر نمی‌شود.
 * Version:     1.0.0
 * Requires at least: 6.0
 * Requires PHP: 7.4
 * Author:      سرزمین آریان
 * Author URI:  https://sarzaminaryan.ir
 * License:     GPLv2 or later
 * License URI: http://www.gnu.org/licenses/gpl-2.0.html
 * Text Domain: sa-city-importer
 *
 * @package Sarzaminaryan_City_Importer
 */
if ( ! defined( 'ABSPATH' ) ) { exit; }
define( 'SA_CI_NORTH_KHORASAN_VERSION', '1.0.0' );
define( 'SA_CI_NORTH_KHORASAN_FILE', __FILE__ );
require_once __DIR__ . '/includes/class-sa-city-importer.php';
function sa_ci_north_khorasan_register() {
	SA_City_Province_Importer::instance()->register_batch(
		array(
			'id'          => 'north-khorasan',
			'dir'         => __DIR__ . '/data',
			'plugin_file' => __FILE__,
			'version'     => SA_CI_NORTH_KHORASAN_VERSION,
		)
	);
}
add_action( 'plugins_loaded', 'sa_ci_north_khorasan_register', 20 );
