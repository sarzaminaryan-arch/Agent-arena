<?php
if (!defined('ABSPATH')) exit;
final class CC_Plugin {
 public static function boot(){
  require_once CC_DIR.'includes/class-cc-db.php'; require_once CC_DIR.'includes/class-cc-auth.php'; require_once CC_DIR.'includes/class-cc-rating.php'; require_once CC_DIR.'includes/class-cc-contrib.php'; require_once CC_DIR.'includes/class-cc-rest.php'; require_once CC_DIR.'includes/class-cc-share.php'; require_once CC_DIR.'includes/class-cc-admin.php';
  CC_DB::init(); CC_Share::init(); CC_Auth::init(); CC_Rating::init(); CC_Contrib::init(); CC_REST::init(); CC_Admin::init();
  add_action('wp_enqueue_scripts',array(__CLASS__,'assets')); add_filter('the_content',array(__CLASS__,'city_widget'),20);
 }
 public static function activate(){ require_once CC_DIR.'includes/class-cc-db.php'; CC_DB::install(); if(!post_type_exists('cc_submission')) self::register_submission(); flush_rewrite_rules(); }
 public static function deactivate(){ flush_rewrite_rules(); }
 public static function register_submission(){ register_post_type('cc_submission',array('labels'=>array('name'=>__('مشارکت‌ها','city-contrib')),'public'=>false,'show_ui'=>true,'supports'=>array('title','author','editor'),'capability_type'=>'post','show_in_rest'=>false)); }
 public static function assets(){ if(is_singular('city')){ wp_enqueue_style('cc-style',CC_URL.'assets/css/city-contrib.css',array(),CC_VERSION); wp_enqueue_script('cc-script',CC_URL.'assets/js/city-contrib.js',array(),CC_VERSION,true); wp_localize_script('cc-script','CC_CONFIG',array('api'=>esc_url_raw(rest_url()),'nonce'=>wp_create_nonce('wp_rest'),'logged'=>is_user_logged_in())); } }
 public static function city_widget($content){ if(!is_singular('city')||!in_the_loop()||!is_main_query())return $content; $buttons=''; for($i=1;$i<=7;$i++)$buttons.='<button type="button" data-cc-star="'.$i.'" aria-label="امتیاز '.$i.' از ۷">★</button>'; $box='<section class="sa-cc-rating" data-cc-rating data-city="'.esc_attr(get_the_ID()).'" aria-label="امتیاز کاربران"><div class="sa-cc-rating__stars">'.$buttons.'</div><span class="sa-cc-rating__summary" data-cc-average>در حال دریافت امتیاز…</span></section>'; return $box.$content; }
}
