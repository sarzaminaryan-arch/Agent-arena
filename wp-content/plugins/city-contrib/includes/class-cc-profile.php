<?php
if (!defined('ABSPATH')) exit;

class CC_Profile {
 public static function init(){
  add_shortcode('cc_my_submissions', array(__CLASS__, 'my_submissions_shortcode'));
  add_shortcode('cc_contributor_profile', array(__CLASS__, 'profile_shortcode'));
  add_shortcode('cc_leaderboard', array(__CLASS__, 'leaderboard_shortcode'));
  add_action('wp_enqueue_scripts', array(__CLASS__, 'assets'));
 }

 public static function assets(){
  if(!is_singular()) return;
  $content = (string) get_post_field('post_content', get_queried_object_id());
  if(self::contains_shortcode($content)) CC_Plugin::enqueue_assets();
 }

 private static function contains_shortcode($content){
  return has_shortcode($content, 'cc_my_submissions') || has_shortcode($content, 'cc_contributor_profile') || has_shortcode($content, 'cc_leaderboard');
 }

 private static function login_notice(){
  return '<p class="cc-notice">برای دیدن این بخش ابتدا وارد شوید. <button type="button" data-cc-login>ورود سریع</button></p>';
 }

 public static function my_submissions_shortcode(){
  CC_Plugin::enqueue_assets();
  if(!is_user_logged_in()) return self::login_notice();
  return '<section class="cc-my-submissions" data-cc-my><h2>مشارکت‌های من</h2><div data-cc-my-list>در حال دریافت…</div></section>';
 }

 public static function profile_shortcode(){
  CC_Plugin::enqueue_assets();
  if(!is_user_logged_in()) return self::login_notice();

  $profile = CC_Gamification::profile(get_current_user_id());
  if(!$profile) return '<p class="cc-notice">نمایه کاربری پیدا نشد.</p>';

  $counts = $profile['counts'];
  $badges = $profile['badges'];
  $next = $profile['next_level'];

  ob_start();
  ?>
  <section class="cc-profile" dir="rtl" data-cc-profile-static>
   <header class="cc-profile__header">
    <h2><?php echo esc_html($profile['name']); ?></h2>
    <span class="cc-profile__level"><?php echo esc_html($profile['level']); ?></span>
   </header>
   <div class="cc-profile__stats">
    <div><strong><?php echo esc_html(number_format_i18n($profile['points'])); ?></strong><span>امتیاز</span></div>
    <div><strong><?php echo esc_html(number_format_i18n($counts['publish'] ?? 0)); ?></strong><span>مشارکت تأییدشده</span></div>
    <div><strong><?php echo esc_html(number_format_i18n(count($badges))); ?></strong><span>نشان</span></div>
   </div>
   <?php if(!empty($next['remaining'])): ?>
    <p class="cc-profile__next"><?php echo esc_html(number_format_i18n($next['remaining'])); ?> امتیاز تا سطح «<?php echo esc_html($next['label']); ?>» باقی مانده است.</p>
   <?php else: ?>
    <p class="cc-profile__next">شما به بالاترین سطح فعلی رسیده‌اید.</p>
   <?php endif; ?>
   <div class="cc-profile__counts" aria-label="وضعیت مشارکت‌ها">
    <span>در انتظار بررسی: <?php echo esc_html(number_format_i18n($counts['pending'] ?? 0)); ?></span>
    <span>نیازمند اصلاح: <?php echo esc_html(number_format_i18n($counts['needs_edit'] ?? 0)); ?></span>
    <span>رد شده: <?php echo esc_html(number_format_i18n($counts['rejected'] ?? 0)); ?></span>
   </div>
   <h3>نشان‌های من</h3>
   <?php if($badges): ?>
    <ul class="cc-badges">
     <?php foreach($badges as $badge): ?>
      <li><strong><?php echo esc_html($badge['label']); ?></strong><small><?php echo esc_html($badge['description']); ?></small></li>
     <?php endforeach; ?>
    </ul>
   <?php else: ?>
    <p class="cc-profile__empty">هنوز نشانی دریافت نکرده‌اید؛ با تأیید اولین مشارکت، اولین نشان فعال می‌شود.</p>
   <?php endif; ?>
  </section>
  <?php
  return ob_get_clean();
 }

 public static function leaderboard_shortcode($atts){
  CC_Plugin::enqueue_assets();
  $atts = shortcode_atts(array(
   'city_id' => '',
   'limit' => 20,
   'title' => 'جدول برترین مشارکت‌کنندگان',
  ), $atts, 'cc_leaderboard');

  $city_id = 0;
  if($atts['city_id'] === 'current' && is_singular('city')) $city_id = get_the_ID();
  elseif($atts['city_id'] !== '') $city_id = absint($atts['city_id']);

  $rows = CC_Gamification::leaderboard($city_id, absint($atts['limit']) ?: 20);

  ob_start();
  ?>
  <section class="cc-leaderboard" dir="rtl" data-city="<?php echo esc_attr($city_id); ?>">
   <h2><?php echo esc_html($atts['title']); ?></h2>
   <?php if($rows): ?>
    <ol>
     <?php foreach($rows as $index => $row): ?>
      <li>
       <span class="cc-leaderboard__rank"><?php echo esc_html(number_format_i18n($index + 1)); ?></span>
       <strong><?php echo esc_html($row['name']); ?></strong>
       <span><?php echo esc_html($row['level']); ?></span>
       <b><?php echo esc_html(number_format_i18n($row['points'])); ?> امتیاز</b>
      </li>
     <?php endforeach; ?>
    </ol>
   <?php else: ?>
    <p class="cc-profile__empty">هنوز امتیازی برای نمایش ثبت نشده است.</p>
   <?php endif; ?>
  </section>
  <?php
  return ob_get_clean();
 }
}
