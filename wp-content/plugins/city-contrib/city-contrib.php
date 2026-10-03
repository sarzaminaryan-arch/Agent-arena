<?php
/**
 * Plugin Name: مشارکت مردمی شهر من
 * Description: امتیازدهی و مشارکت مردمی سبک برای صفحات شهر.
 * Version: 0.2.0
 * Requires PHP: 7.4
 * Text Domain: city-contrib
 */
if (!defined('ABSPATH')) exit;
define('CC_VERSION','0.2.0'); define('CC_FILE',__FILE__); define('CC_DIR',plugin_dir_path(__FILE__)); define('CC_URL',plugin_dir_url(__FILE__));
require_once CC_DIR.'includes/class-cc-plugin.php';
register_activation_hook(__FILE__, array('CC_Plugin','activate'));
register_deactivation_hook(__FILE__, array('CC_Plugin','deactivate'));
add_action('plugins_loaded', array('CC_Plugin','boot'));
