<?php
/**
 * Plugin Name: سرزمین آریان — درون‌ریز شهرستان‌های استان خوزستان
 * Plugin URI:  https://github.com/sarzaminaryan-arch/Agent-arena
 * Description: درون‌ریز ۲۹ شهرستان خوزستان همراه متن مقاله، FAQ، منابع، داده‌های سئو و تصویر شاخص WEBP؛ همهٔ نوشته‌ها به‌صورت پیش‌نویس وارد می‌شوند.
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

define( 'SA_CI_KHUZESTAN_VERSION', '1.0.0' );
define( 'SA_CI_KHUZESTAN_VERSION_FILE', __FILE__ );

require_once __DIR__ . '/includes/class-sa-city-importer.php';

/** Register the Khuzestan county data batch with the importer core. */
function sa_ci_khuzestan_register() {
	SA_City_Province_Importer::instance()->register_batch(
		array(
			'id'          => 'khuzestan',
			'dir'         => __DIR__ . '/data',
			'plugin_file' => __FILE__,
			'version'     => SA_CI_KHUZESTAN_VERSION,
		)
	);
}
add_action( 'plugins_loaded', 'sa_ci_khuzestan_register', 20 );
