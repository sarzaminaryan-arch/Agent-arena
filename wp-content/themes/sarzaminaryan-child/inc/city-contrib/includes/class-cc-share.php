<?php
if (!defined('ABSPATH')) exit;
class CC_Share {
 public static function init(){add_action('wp_footer',array(__CLASS__,'button'));}
 /* متاتگ‌های OG و توییتر صفحات شهر توسط ماژول سئوی خود قالب (inc/seo.php) چاپ می‌شوند؛ چاپ جداگانه در اینجا باعث تکرار تگ‌ها می‌شد و حذف شد. */
 public static function button(){if(!is_singular('city'))return; $url=esc_url(get_permalink()); $text=rawurlencode('شهر من رو ببین و امتیاز بده: '.get_permalink()); echo '<div class="cc-share" data-url="'.esc_attr($url).'" data-text="'.esc_attr('شهر من رو ببین و امتیاز بده: '.get_permalink()).'"><button type="button" data-cc-share>ارسال برای دوستان</button><button type="button" data-cc-copy>کپی لینک</button><a href="https://t.me/share/url?url='.rawurlencode($url).'&text='.$text.'" target="_blank" rel="noopener">تلگرام</a><a href="https://wa.me/?text='.$text.'" target="_blank" rel="noopener">واتساپ</a></div>';}
}
