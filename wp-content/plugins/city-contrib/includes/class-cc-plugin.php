<?php
if (!defined('ABSPATH')) exit;

final class CC_Plugin {
 public static function boot(){
  require_once CC_DIR.'includes/class-cc-db.php';
  require_once CC_DIR.'includes/class-cc-auth.php';
  require_once CC_DIR.'includes/class-cc-rating.php';
  require_once CC_DIR.'includes/class-cc-contrib.php';
  require_once CC_DIR.'includes/class-cc-rest.php';
  require_once CC_DIR.'includes/class-cc-share.php';
  require_once CC_DIR.'includes/class-cc-otp.php';
  require_once CC_DIR.'includes/class-cc-admin.php';
  require_once CC_DIR.'includes/class-cc-profile.php';
  require_once CC_DIR.'includes/class-cc-media.php';
  require_once CC_DIR.'includes/class-cc-moderation.php';
  require_once CC_DIR.'includes/class-cc-roles.php';
  require_once CC_DIR.'includes/class-cc-gamification.php';

  CC_DB::init();
  CC_Gamification::init();
  CC_Roles::init();
  CC_Moderation::init();
  CC_Profile::init();
  CC_Share::init();
  CC_OTP::init();
  CC_Contrib::init();
  CC_Auth::init();
  CC_Rating::init();
  CC_REST::init();
  CC_Admin::init();

  add_action('init', array(__CLASS__, 'register_statuses'), 4);
  add_action('wp_enqueue_scripts', array(__CLASS__, 'register_assets'), 5);
  add_action('wp_enqueue_scripts', array(__CLASS__, 'city_assets'));
  add_filter('the_content', array(__CLASS__, 'city_widget'), 20);
 }

 public static function activate(){
  require_once CC_DIR.'includes/class-cc-db.php';
  require_once CC_DIR.'includes/class-cc-roles.php';
  CC_DB::install();
  CC_Roles::ensure();
  self::register_statuses();
  if(!post_type_exists('cc_submission')) self::register_submission();
  flush_rewrite_rules();
 }

 public static function deactivate(){
  flush_rewrite_rules();
 }

 public static function register_statuses(){
  register_post_status('rejected', array(
   'label' => _x('رد شده', 'cc submission status', 'city-contrib'),
   'public' => false,
   'internal' => false,
   'protected' => true,
   'private' => false,
   'exclude_from_search' => true,
   'show_in_admin_all_list' => true,
   'show_in_admin_status_list' => true,
   'label_count' => _n_noop('رد شده <span class="count">(%s)</span>', 'رد شده <span class="count">(%s)</span>', 'city-contrib'),
  ));

  register_post_status('needs_edit', array(
   'label' => _x('نیازمند اصلاح', 'cc submission status', 'city-contrib'),
   'public' => false,
   'internal' => false,
   'protected' => true,
   'private' => false,
   'exclude_from_search' => true,
   'show_in_admin_all_list' => true,
   'show_in_admin_status_list' => true,
   'label_count' => _n_noop('نیازمند اصلاح <span class="count">(%s)</span>', 'نیازمند اصلاح <span class="count">(%s)</span>', 'city-contrib'),
  ));
 }

 public static function register_submission(){
  self::register_statuses();
  register_post_type('cc_submission', array(
   'labels' => array(
    'name' => __('مشارکت‌ها', 'city-contrib'),
    'singular_name' => __('مشارکت', 'city-contrib'),
    'add_new_item' => __('افزودن مشارکت', 'city-contrib'),
    'edit_item' => __('بررسی مشارکت', 'city-contrib'),
   ),
   'public' => false,
   'show_ui' => true,
   'show_in_menu' => true,
   'supports' => array('title','author','editor'),
   'capability_type' => array('cc_submission', 'cc_submissions'),
   'map_meta_cap' => true,
   'capabilities' => array(
    'edit_post' => 'edit_cc_submission',
    'read_post' => 'read_cc_submission',
    'delete_post' => 'delete_cc_submission',
    'edit_posts' => 'edit_cc_submissions',
    'edit_others_posts' => 'edit_others_cc_submissions',
    'publish_posts' => 'publish_cc_submissions',
    'read_private_posts' => 'read_private_cc_submissions',
    'delete_posts' => 'delete_cc_submissions',
    'delete_private_posts' => 'delete_private_cc_submissions',
    'delete_published_posts' => 'delete_published_cc_submissions',
    'delete_others_posts' => 'delete_others_cc_submissions',
    'edit_private_posts' => 'edit_private_cc_submissions',
    'edit_published_posts' => 'edit_published_cc_submissions',
   ),
   'show_in_rest' => false,
  ));
 }

 public static function register_assets(){
  wp_register_style('cc-style', CC_URL.'assets/css/city-contrib.css', array(), CC_VERSION);
  wp_register_script('cc-script', CC_URL.'assets/js/city-contrib.js', array(), CC_VERSION, true);
  wp_localize_script('cc-script', 'CC_CONFIG', array(
   'api' => esc_url_raw(rest_url()),
   'nonce' => wp_create_nonce('wp_rest'),
   'logged' => is_user_logged_in(),
  ));
 }

 public static function enqueue_assets(){
  if(!wp_style_is('cc-style', 'registered') || !wp_script_is('cc-script', 'registered')) self::register_assets();
  wp_enqueue_style('cc-style');
  wp_enqueue_script('cc-script');
 }

 public static function city_assets(){
  if(is_singular('city')) self::enqueue_assets();
 }

 public static function city_widget($content){
  if(!is_singular('city') || !in_the_loop() || !is_main_query()) return $content;
  $buttons = '';
  for($i=1;$i<=7;$i++) $buttons .= '<button type="button" data-cc-star="'.$i.'" aria-label="امتیاز '.$i.' از ۷">★</button>';
  $box = '<section class="sa-cc-rating" data-cc-rating data-city="'.esc_attr(get_the_ID()).'" aria-label="امتیاز کاربران"><div class="sa-cc-rating__stars">'.$buttons.'</div><span class="sa-cc-rating__summary" data-cc-average>در حال دریافت امتیاز…</span></section>';
  return $box.$content;
 }
}
