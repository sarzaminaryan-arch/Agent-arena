<?php
if (!defined('ABSPATH')) exit;
class CC_Profile {
 public static function init(){add_shortcode('cc_my_submissions',array(__CLASS__,'shortcode'));add_shortcode('cc_leaderboard',array(__CLASS__,'leaderboard_shortcode'));add_action('wp_enqueue_scripts',array(__CLASS__,'assets'));}
 public static function assets(){if(!is_page())return;$content=(string)get_post_field('post_content',get_queried_object_id());if(has_shortcode($content,'cc_my_submissions')||has_shortcode($content,'cc_leaderboard')){wp_enqueue_style('cc-style',CC_URL.'assets/css/city-contrib.css',array(),CC_VERSION);wp_enqueue_script('cc-script',CC_URL.'assets/js/city-contrib.js',array(),CC_VERSION,true);wp_localize_script('cc-script','CC_CONFIG',array('api'=>esc_url_raw(rest_url()),'nonce'=>wp_create_nonce('wp_rest'),'logged'=>is_user_logged_in()));}}
 public static function leaderboard_shortcode($atts){$atts=shortcode_atts(array('city_id'=>0,'limit'=>10),$atts);return '<section class="cc-leaderboard" data-cc-leaderboard data-city="'.esc_attr(absint($atts['city_id'])).'" data-limit="'.esc_attr(absint($atts['limit'])).'"><h2>برترین مشارکت‌کنندگان</h2><div data-cc-leaderboard-list>در حال دریافت…</div></section>';}
 public static function shortcode(){if(!is_user_logged_in())return '<p class="cc-notice">برای دیدن مشارکت‌های خود ابتدا وارد شوید.</p>';return '<section class="cc-my-submissions" data-cc-my><h2>مشارکت‌های من</h2><div data-cc-my-list>در حال دریافت…</div></section>';}
}
