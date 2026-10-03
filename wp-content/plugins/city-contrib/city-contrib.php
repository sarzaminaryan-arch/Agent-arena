<?php
/**
 * Plugin Name: شهر من — مشارکت مردمی
 * Plugin URI: https://sar-zamin.ir/
 * Description: ورود پیامکی، امتیاز ۱ تا ۷، اشتراک‌گذاری و صف مشارکت مردمی برای صفحه‌های شهر.
 * Version: 1.0.0
 * Requires at least: 6.5
 * Requires PHP: 8.1
 * Author: Sarzamin Aryan
 * Text Domain: city-contrib
 * Domain Path: /languages
 * Update URI: false
 *
 * @package City_Contrib
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

define( 'CC_VERSION', '1.0.0' );
define( 'CC_DB_VERSION', '1.0.0' );
define( 'CC_FILE', __FILE__ );
define( 'CC_DIR', plugin_dir_path( __FILE__ ) );
define( 'CC_URL', plugin_dir_url( __FILE__ ) );

$cc_files = array(
	'includes/class-cc-config.php',
	'includes/class-cc-helpers.php',
	'includes/class-cc-activator.php',
	'includes/class-cc-rest.php',
	'includes/sms/interface-cc-sms-provider.php',
	'includes/sms/class-cc-sms-debug-provider.php',
	'includes/sms/class-cc-sms-webhook-provider.php',
	'includes/modules/class-cc-auth.php',
	'includes/modules/class-cc-rating.php',
	'includes/modules/class-cc-share.php',
	'includes/modules/class-cc-images.php',
	'includes/modules/class-cc-contrib.php',
	'includes/modules/class-cc-frontend.php',
	'includes/modules/class-cc-admin.php',
	'includes/class-cc-plugin.php',
);

foreach ( $cc_files as $cc_file ) {
	require_once CC_DIR . $cc_file;
}
unset( $cc_files, $cc_file );

register_activation_hook( __FILE__, array( 'CC_Activator', 'activate' ) );
register_deactivation_hook( __FILE__, array( 'CC_Activator', 'deactivate' ) );

CC_Plugin::instance()->boot();
