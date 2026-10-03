<?php
if (!defined('ABSPATH')) exit;
class CC_UI {
 public static function fa_num($n){return function_exists('sa_fa_digits')?sa_fa_digits((string)$n):number_format_i18n($n);}
 public static function stars_html($avg,$id=''){$full=max(0,min(7,(int)round((float)$avg)));if($avg<=0)return '<span class="cc-stars cc-stars--empty" aria-hidden="true">☆☆☆☆☆☆☆</span>';return '<span class="cc-stars" aria-hidden="true">'.str_repeat('★',$full).str_repeat('☆',7-$full).'</span>';}
 public static function viewer_key(){if(is_user_logged_in())return 'u'.get_current_user_id();$tok=isset($_COOKIE['cc_voter'])?preg_replace('/[^a-f0-9]/i','',wp_unslash($_COOKIE['cc_voter'])):'';if(strlen($tok)<16)return '';return 'c'.substr(hash('sha256',strtolower($tok).wp_salt('nonce')),0,40);}
 public static function rating_block(){
  if(!is_singular('city')||!class_exists('CC_Rating'))return;
  $id=get_the_ID();$d=CC_Rating::get($id,self::viewer_key());
  $rank_txt=$d['rank']>0?sprintf('رتبهٔ %s از %s شهرستان',self::fa_num($d['rank']),self::fa_num($d['total'])):'';
  echo '<section class="cc-block cc-rating" id="cc-rating" data-cc-rating data-city="'.esc_attr($id).'" aria-label="امتیاز کاربران به این شهر">';
  echo '<h2 class="cc-block__title">امتیاز کاربران به '.esc_html(get_the_title()).'</h2>';
  echo '<div class="cc-rating__row">';
  echo '<div class="cc-rating__stars" role="group" aria-label="از یک تا هفت ستاره بدهید">';
  for($i=1;$i<=7;$i++)echo '<button type="button" data-cc-star="'.$i.'" aria-label="امتیاز '.$i.' از ۷"'.($d['user_rating']>0&&$i<=$d['user_rating']?' class="is-on"':'').'>★</button>';
  echo '</div>';
  echo '<div class="cc-rating__summary">';
  if($d['count']>0){echo '<p class="cc-rating__avg">'.self::stars_html($d['average']).' <b>'.esc_html(self::fa_num(number_format($d['average'],1))).'</b> از ۷ <span>· '.esc_html(self::fa_num($d['count'])).' رأی</span></p>';if($rank_txt)echo '<p class="cc-rating__rank">🏆 '.esc_html($rank_txt).'</p>';}
  else echo '<p class="cc-rating__avg cc-rating__avg--empty">هنوز رأیی ثبت نشده؛ اولین نفر باشید.</p>';
  echo '<p class="cc-rating__status" data-cc-status role="status">'.($d['user_rating']>0?($d['locked']?'رأی شما ثبت شده است؛ تغییر آن از فردا ممکن است.':'می‌توانید رأی خود را تغییر دهید. — ستاره‌ها را لمس کنید'):'بدون ثبت‌نام رأی بدهید؛ هر نفر یک بار، قابل تغییر پس از یک روز.').'</p>';
  echo '</div></div></section>';
 }
 public static function contrib_block(){
  if(!is_singular('city'))return;
  $id=get_the_ID();
  echo '<section class="cc-block cc-contrib" id="cc-contrib" data-cc-contrib>';
  echo '<h2 class="cc-block__title">در تکمیل اطلاعات این شهر مشارکت کنید</h2>';
  echo '<p class="cc-contrib__hint">اطلاعات شما پس از بررسی ناظر منتشر می‌شود.</p>';
  echo '<button type="button" class="cc-btn" data-cc-open>＋ مشارکت می‌کنم</button>';
  echo '<form hidden data-cc-form><input type="hidden" name="city_id" value="'.esc_attr($id).'">';
  echo '<label>نوع مشارکت<select name="type"><option value="place">معرفی مکان یا غذا</option><option value="correction">پیشنهاد اصلاح</option><option value="report">گزارش خطا یا تعطیلی</option><option value="tip">نکته محلی</option></select></label>';
  echo '<label>توضیح<textarea name="text" minlength="30" maxlength="2500" required placeholder="حداقل ۳۰ نویسه…"></textarea></label>';
  echo '<label>تصویر (اختیاری، حداکثر ۵ مگابایت)<input type="file" name="image" accept="image/jpeg,image/png,image/webp"></label>';
  echo '<input class="cc-hp" name="website" tabindex="-1" autocomplete="off">';
  echo '<button type="submit" class="cc-btn cc-btn--primary">ارسال برای بررسی</button> <button type="button" class="cc-btn cc-btn--ghost" data-cc-close>انصراف</button>';
  echo '<p data-cc-message role="status"></p></form>';
  $url=get_permalink();$text='شهر من رو ببین و امتیاز بده: '.get_permalink();
  echo '<div class="cc-share" data-url="'.esc_attr($url).'" data-text="'.esc_attr($text).'"><span class="cc-share__label">این شهر را با دوستان خود به اشتراک بگذارید:</span><button type="button" data-cc-share>ارسال برای دوستان</button><button type="button" data-cc-copy>کپی لینک</button><a href="https://t.me/share/url?url='.rawurlencode($url).'&text='.rawurlencode($text).'" target="_blank" rel="noopener">تلگرام</a><a href="https://wa.me/?text='.rawurlencode($text).'" target="_blank" rel="noopener">واتساپ</a></div>';
  echo '</section>';
 }
 public static function top_cities_block($limit=7){
  $top=CC_Rating::top((int)$limit);if(empty($top))return;
  echo '<section class="sa-sec sa-topcities"><div class="sa-wrap">';
  echo '<div class="sa-head"><h2>۷ شهر برتر از نگاه مردم</h2><span class="sa-topcities__note">بر اساس امتیاز ۱ تا ۷ ستارهٔ خوانندگان، بدون نیاز به ثبت‌نام</span></div>';
  echo '<div class="cc-topcards">';
  foreach($top as $c){
   echo '<a class="cc-topcard" href="'.esc_url($c['url']).'">';
   echo '<span class="cc-topcard__rank">رتبهٔ '.esc_html(self::fa_num($c['rank'])).'</span>';
   echo '<b class="cc-topcard__name">'.esc_html($c['title']).'</b>';
   if($c['province'])echo '<em class="cc-topcard__prov">استان '.esc_html($c['province']).' · '.esc_html(self::fa_num($c['siblings'])).' شهرستان هم‌استان</em>';
   echo '<span class="cc-topcard__stars">'.self::stars_html($c['avg']).' <b>'.esc_html(self::fa_num(number_format($c['avg'],1))).'</b></span>';
   echo '<span class="cc-topcard__votes">'.esc_html(self::fa_num($c['count'])).' رأی</span>';
   echo '</a>';
  }
  echo '</div></div></section>';
 }
}
