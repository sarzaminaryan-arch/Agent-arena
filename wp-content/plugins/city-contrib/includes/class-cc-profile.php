<?php
if (!defined('ABSPATH')) exit;
class CC_Profile {
 public static function init(){add_shortcode('cc_my_submissions',array(__CLASS__,'shortcode'));add_action('wp_enqueue_scripts',array(__CLASS__,'assets'));}
 public static function assets(){if(is_page()&&has_shortcode(get_post_field('post_content',get_queried_object_id()),'cc_my_submissions'))wp_enqueue_script('cc-script');}
 public static function shortcode(){if(!is_user_logged_in())return '<p class="cc-notice">برای دیدن مشارکت‌های خود ابتدا وارد شوید.</p>';return '<section class="cc-my-submissions" data-cc-my><h2>مشارکت‌های من</h2><div data-cc-my-list>در حال دریافت…</div></section>';}
}
