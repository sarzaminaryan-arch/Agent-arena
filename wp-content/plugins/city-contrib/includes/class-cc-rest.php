<?php
if (!defined('ABSPATH')) exit;

class CC_REST {
 public static function init(){
  add_action('rest_api_init', array(__CLASS__, 'routes'));
 }

 public static function auth(){
  return is_user_logged_in() && wp_verify_nonce($_SERVER['HTTP_X_WP_NONCE'] ?? '', 'wp_rest');
 }

 public static function routes(){
  register_rest_route('cc/v1', '/cities/(?P<id>\d+)/rating', array(
   'methods' => 'GET',
   'callback' => array(__CLASS__, 'get_rating'),
   'permission_callback' => '__return_true',
  ));

  register_rest_route('cc/v1', '/cities/(?P<id>\d+)/rating', array(
   'methods' => 'POST',
   'callback' => array(__CLASS__, 'post_rating'),
   'permission_callback' => array(__CLASS__, 'auth'),
  ));

  register_rest_route('cc/v1', '/submissions', array(
   'methods' => 'POST',
   'callback' => array(__CLASS__, 'submission'),
   'permission_callback' => array(__CLASS__, 'auth'),
  ));

  register_rest_route('cc/v1', '/submissions/(?P<id>\d+)/resubmit', array(
   'methods' => 'POST',
   'callback' => array(__CLASS__, 'resubmit'),
   'permission_callback' => array(__CLASS__, 'auth'),
  ));

  register_rest_route('cc/v1', '/my-submissions', array(
   'methods' => 'GET',
   'callback' => array(__CLASS__, 'my_submissions'),
   'permission_callback' => array(__CLASS__, 'auth'),
  ));

  register_rest_route('cc/v1', '/me', array(
   'methods' => 'GET',
   'callback' => array(__CLASS__, 'me'),
   'permission_callback' => array(__CLASS__, 'auth'),
  ));

  register_rest_route('cc/v1', '/badges', array(
   'methods' => 'GET',
   'callback' => array(__CLASS__, 'badges'),
   'permission_callback' => '__return_true',
  ));

  register_rest_route('cc/v1', '/leaderboard', array(
   'methods' => 'GET',
   'callback' => array(__CLASS__, 'leaderboard'),
   'permission_callback' => '__return_true',
  ));
 }

 public static function get_rating($r){
  $id = absint($r['id']);
  if(get_post_type($id) !== 'city') return new WP_Error('invalid_city', 'شهر معتبر نیست', array('status' => 404));
  return CC_Rating::get($id);
 }

 public static function post_rating($r){
  global $wpdb;
  $id = absint($r['id']);
  $stars = filter_var($r->get_param('stars'), FILTER_VALIDATE_INT);

  if(get_post_type($id) !== 'city') return new WP_Error('invalid_city', 'شهر معتبر نیست', array('status' => 404));
  if($stars < 1 || $stars > 7) return new WP_Error('invalid_stars', 'امتیاز باید بین ۱ تا ۷ باشد', array('status' => 400));

  $t = CC_DB::table();
  $exists = $wpdb->get_var($wpdb->prepare("SELECT id FROM $t WHERE user_id=%d AND city_id=%d", get_current_user_id(), $id));
  if($exists) return new WP_Error('already_rated', 'شما قبلاً به این شهر امتیاز داده‌اید', array('status' => 409));

  $daily_key = 'cc_daily_rating_'.get_current_user_id();
  if((int) get_transient($daily_key) >= 20) return new WP_Error('daily_limit', 'سقف روزانه امتیازدهی تکمیل شده است', array('status' => 429));

  $ok = $wpdb->insert($t, array(
   'user_id' => get_current_user_id(),
   'city_id' => $id,
   'stars' => $stars,
   'created_at' => current_time('mysql'),
  ), array('%d','%d','%d','%s'));

  if(!$ok){
   if(false !== stripos($wpdb->last_error, 'duplicate')) return new WP_Error('already_rated', 'شما قبلاً به این شهر امتیاز داده‌اید', array('status' => 409));
   return new WP_Error('db_error', 'ثبت امتیاز انجام نشد', array('status' => 500));
  }

  set_transient($daily_key, (int) get_transient($daily_key) + 1, DAY_IN_SECONDS);
  CC_DB::recalc($id);
  return CC_Rating::get($id);
 }

 public static function submission($r){
  $city = absint($r->get_param('city_id'));
  $type = sanitize_key($r->get_param('type'));
  $text = sanitize_textarea_field($r->get_param('text'));
  $allowed_types = array_keys(CC_Gamification::type_labels());

  if(get_post_type($city) !== 'city') return new WP_Error('invalid_city', 'شهر معتبر نیست', array('status' => 404));
  if(!in_array($type, $allowed_types, true)) return new WP_Error('invalid_type', 'نوع مشارکت معتبر نیست', array('status' => 400));
  if($r->get_param('website')) return new WP_Error('spam', 'ارسال نامعتبر است', array('status' => 400));
  if(mb_strlen($text) < 30 || mb_strlen($text) > 2500) return new WP_Error('invalid_text', 'متن باید بین ۳۰ تا ۲۵۰۰ نویسه باشد', array('status' => 400));

  $key = 'cc_submissions_'.get_current_user_id();
  $n = (int) get_transient($key);
  if($n >= 5) return new WP_Error('daily_limit', 'سقف روزانه مشارکت شما تکمیل شده است', array('status' => 429));

  $files = $r->get_file_params();
  $image = CC_Media::handle($files['image'] ?? array());
  if(is_wp_error($image)) return $image;

  $p = wp_insert_post(array(
   'post_type' => 'cc_submission',
   'post_status' => 'pending',
   'post_title' => wp_trim_words($text, 8),
   'post_content' => $text,
   'post_author' => get_current_user_id(),
   'meta_input' => array(
    'cc_city_id' => $city,
    'cc_type' => $type,
    'cc_image_id' => is_int($image) ? $image : 0,
    'cc_ip_hash' => hash('sha256', ($_SERVER['REMOTE_ADDR'] ?? '').wp_salt('auth')),
   ),
  ), true);

  if(is_wp_error($p)) return $p;
  if(is_int($image) && $image) wp_update_post(array('ID' => $image, 'post_parent' => $p));

  set_transient($key, $n + 1, DAY_IN_SECONDS);
  return array('success' => true, 'message' => 'مشارکت شما برای بررسی ارسال شد.', 'id' => (int) $p);
 }

 public static function resubmit($r){
  $id = absint($r['id']);
  $p = get_post($id);
  if(!$p || $p->post_type !== 'cc_submission' || (int) $p->post_author !== get_current_user_id()) return new WP_Error('forbidden', 'این مشارکت متعلق به شما نیست', array('status' => 403));
  if($p->post_status !== 'needs_edit') return new WP_Error('invalid_status', 'این مشارکت نیاز به اصلاح ندارد', array('status' => 400));

  $text = sanitize_textarea_field($r->get_param('text'));
  if(mb_strlen($text) < 30 || mb_strlen($text) > 2500) return new WP_Error('invalid_text', 'متن باید بین ۳۰ تا ۲۵۰۰ نویسه باشد', array('status' => 400));

  $ok = wp_update_post(array('ID' => $id, 'post_content' => $text, 'post_status' => 'pending'), true);
  if(is_wp_error($ok)) return $ok;

  update_post_meta($id, 'cc_resubmitted_at', current_time('mysql'));
  return array('success' => true, 'message' => 'نسخه اصلاح‌شده برای بررسی ارسال شد.');
 }

 public static function my_submissions(){
  $q = new WP_Query(array(
   'post_type' => 'cc_submission',
   'author' => get_current_user_id(),
   'post_status' => array('pending','publish','rejected','needs_edit'),
   'posts_per_page' => 50,
   'orderby' => 'date',
   'order' => 'DESC',
  ));

  $out = array();
  $type_labels = CC_Gamification::type_labels();
  $status_labels = CC_Gamification::status_labels();

  foreach($q->posts as $p){
   $city_id = (int) get_post_meta($p->ID, 'cc_city_id', true);
   $type = get_post_meta($p->ID, 'cc_type', true);
   $image = (int) get_post_meta($p->ID, 'cc_image_id', true);
   $out[] = array(
    'id' => $p->ID,
    'city_id' => $city_id,
    'city' => get_the_title($city_id),
    'type' => $type,
    'type_label' => $type_labels[$type] ?? $type,
    'status' => $p->post_status,
    'status_label' => $status_labels[$p->post_status] ?? $p->post_status,
    'note' => get_post_meta($p->ID, 'cc_review_note', true),
    'date' => get_post_time('c', true, $p),
    'excerpt' => wp_trim_words(wp_strip_all_tags($p->post_content), 18),
    'image' => $image ? wp_get_attachment_image_url($image, 'thumbnail') : '',
   );
  }

  return $out;
 }

 public static function me(){
  $profile = CC_Gamification::profile(get_current_user_id());
  if(!$profile) return new WP_Error('not_found', 'کاربر پیدا نشد', array('status' => 404));
  return $profile;
 }

 public static function badges(){
  return CC_Gamification::badges();
 }

 public static function leaderboard($r){
  return CC_Gamification::leaderboard(absint($r->get_param('city_id')), absint($r->get_param('limit')) ?: 20);
 }
}
