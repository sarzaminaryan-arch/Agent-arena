<?php
if (!defined('ABSPATH')) exit;

class CC_Gamification {
 public static function init(){}

 public static function points_table(){
  global $wpdb;
  return $wpdb->prefix.'cc_points_log';
 }

 public static function badges_table(){
  global $wpdb;
  return $wpdb->prefix.'cc_badges_users';
 }

 public static function point_rules(){
  return array(
   'place' => 20,
   'food' => 20,
   'correction' => 8,
   'report' => 5,
   'tip' => 3,
  );
 }

 public static function type_labels(){
  return array(
   'place' => 'معرفی مکان یا غذا',
   'food' => 'معرفی غذا',
   'correction' => 'پیشنهاد اصلاح',
   'report' => 'گزارش خطا یا تعطیلی',
   'tip' => 'نکته محلی',
  );
 }

 public static function status_labels(){
  return array(
   'pending' => 'در انتظار بررسی',
   'publish' => 'تأیید و منتشر شده',
   'rejected' => 'رد شده',
   'needs_edit' => 'نیازمند اصلاح',
   'draft' => 'پیش‌نویس',
  );
 }

 public static function badges(){
  return array(
   'first_contribution' => array(
    'label' => 'اولین مشارکت',
    'description' => 'اولین مشارکت تأییدشده شما ثبت شد.',
    'threshold' => 1,
    'type' => 'count',
   ),
   'active_local' => array(
    'label' => 'ساکن فعال',
    'description' => 'با رسیدن به ۱۰۰ امتیاز دریافت می‌شود.',
    'threshold' => 100,
    'type' => 'points',
   ),
   'local_guide' => array(
    'label' => 'راهنمای محلی',
    'description' => 'با رسیدن به ۴۰۰ امتیاز دریافت می‌شود.',
    'threshold' => 400,
    'type' => 'points',
   ),
   'city_ambassador' => array(
    'label' => 'سفیر شهر',
    'description' => 'با رسیدن به ۱۰۰۰ امتیاز دریافت می‌شود.',
    'threshold' => 1000,
    'type' => 'points',
   ),
  );
 }

 public static function award($user, $points, $reason, $submission = 0){
  global $wpdb;
  $user = absint($user);
  $points = (int) $points;
  $submission = absint($submission);
  $reason = sanitize_text_field($reason);

  if(!$user || !$points) return false;

  if($submission){
   $exists = $wpdb->get_var($wpdb->prepare(
    'SELECT id FROM '.self::points_table().' WHERE submission_id=%d AND reason=%s LIMIT 1',
    $submission,
    $reason
   ));
   if($exists) return false;
  }

  $inserted = $wpdb->insert(self::points_table(), array(
   'user_id' => $user,
   'points' => $points,
   'reason' => $reason,
   'submission_id' => $submission,
   'created_at' => current_time('mysql'),
  ), array('%d','%d','%s','%d','%s'));

  return (bool) $inserted;
 }

 public static function award_badges($user){
  global $wpdb;
  $user = absint($user);
  if(!$user) return array();

  $total = self::total($user);
  $count = (int) $wpdb->get_var($wpdb->prepare(
   'SELECT COUNT(*) FROM '.self::points_table().' WHERE user_id=%d AND submission_id>0',
   $user
  ));

  $rules = array(
   'first_contribution' => ($count >= 1),
   'active_local' => ($total >= 100),
   'local_guide' => ($total >= 400),
   'city_ambassador' => ($total >= 1000),
  );

  $awarded = array();
  foreach($rules as $key => $ok){
   if(!$ok) continue;
   $exists = $wpdb->get_var($wpdb->prepare(
    'SELECT id FROM '.self::badges_table().' WHERE user_id=%d AND badge_key=%s LIMIT 1',
    $user,
    $key
   ));
   if($exists) continue;

   $done = $wpdb->insert(self::badges_table(), array(
    'user_id' => $user,
    'badge_key' => $key,
    'awarded_at' => current_time('mysql'),
   ), array('%d','%s','%s'));

   if($done) $awarded[] = $key;
  }

  return $awarded;
 }

 public static function total($user){
  global $wpdb;
  return (int) $wpdb->get_var($wpdb->prepare(
   'SELECT COALESCE(SUM(points),0) FROM '.self::points_table().' WHERE user_id=%d',
   absint($user)
  ));
 }

 public static function level($n){
  $n = (int) $n;
  return $n >= 1000 ? 'سفیر شهر' : ($n >= 400 ? 'راهنمای محلی' : ($n >= 100 ? 'ساکن فعال' : 'تازه‌وارد'));
 }

 public static function next_level($n){
  $n = (int) $n;
  if($n < 100) return array('label' => 'ساکن فعال', 'points' => 100, 'remaining' => 100 - $n);
  if($n < 400) return array('label' => 'راهنمای محلی', 'points' => 400, 'remaining' => 400 - $n);
  if($n < 1000) return array('label' => 'سفیر شهر', 'points' => 1000, 'remaining' => 1000 - $n);
  return array('label' => 'بالاترین سطح فعلی', 'points' => $n, 'remaining' => 0);
 }

 public static function user_badges($user){
  global $wpdb;
  $definitions = self::badges();
  $rows = $wpdb->get_results($wpdb->prepare(
   'SELECT badge_key, awarded_at FROM '.self::badges_table().' WHERE user_id=%d ORDER BY awarded_at ASC',
   absint($user)
  ));

  return array_map(function($row) use ($definitions){
   $key = $row->badge_key;
   $def = isset($definitions[$key]) ? $definitions[$key] : array('label' => $key, 'description' => '', 'threshold' => 0, 'type' => 'custom');
   return array(
    'key' => $key,
    'label' => $def['label'],
    'description' => $def['description'],
    'awarded_at' => mysql_to_rfc3339($row->awarded_at),
   );
  }, $rows ?: array());
 }

 public static function submission_counts($user){
  $statuses = array_keys(self::status_labels());
  $counts = array_fill_keys($statuses, 0);
  $posts = get_posts(array(
   'post_type' => 'cc_submission',
   'post_status' => array('pending','publish','rejected','needs_edit','draft'),
   'author' => absint($user),
   'posts_per_page' => -1,
   'fields' => 'ids',
  ));

  foreach($posts as $id){
   $status = get_post_status($id);
   if(!isset($counts[$status])) $counts[$status] = 0;
   $counts[$status]++;
  }

  return $counts;
 }

 public static function profile($user){
  $user = absint($user);
  $wp_user = get_user_by('id', $user);
  if(!$wp_user) return null;

  $points = self::total($user);
  return array(
   'user_id' => $user,
   'name' => $wp_user->display_name,
   'points' => $points,
   'level' => self::level($points),
   'next_level' => self::next_level($points),
   'badges' => self::user_badges($user),
   'counts' => self::submission_counts($user),
  );
 }

 public static function leaderboard($city = 0, $limit = 20){
  global $wpdb;
  $city = absint($city);
  $limit = min(100, max(1, absint($limit)));
  $points_table = self::points_table();

  if($city){
   $sql = $wpdb->prepare(
    "SELECT p.user_id, SUM(p.points) total
     FROM {$points_table} p
     INNER JOIN {$wpdb->postmeta} pm ON pm.post_id = p.submission_id AND pm.meta_key = 'cc_city_id'
     WHERE CAST(pm.meta_value AS UNSIGNED) = %d
     GROUP BY p.user_id
     ORDER BY total DESC
     LIMIT %d",
    $city,
    $limit
   );
  } else {
   $sql = $wpdb->prepare(
    "SELECT p.user_id, SUM(p.points) total
     FROM {$points_table} p
     GROUP BY p.user_id
     ORDER BY total DESC
     LIMIT %d",
    $limit
   );
  }

  $rows = $wpdb->get_results($sql);
  return array_map(function($r){
   $u = get_user_by('id', $r->user_id);
   $points = (int) $r->total;
   return array(
    'user_id' => (int) $r->user_id,
    'name' => $u ? $u->display_name : 'کاربر',
    'points' => $points,
    'level' => self::level($points),
    'badges_count' => count(self::user_badges((int) $r->user_id)),
   );
  }, $rows ?: array());
 }
}
