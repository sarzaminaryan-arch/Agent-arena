<?php
if (!defined('ABSPATH')) exit;
class CC_Share {
 public static function init(){add_action('wp_head',array(__CLASS__,'og'),5); add_action('wp_footer',array(__CLASS__,'button'));}
 public static function og(){if(!is_singular('city'))return; $title=get_the_title().'؛ امتیاز کاربران | '.get_bloginfo('name'); $desc=wp_trim_words(wp_strip_all_tags(get_the_content()),24); $image=get_the_post_thumbnail_url(get_the_ID(),'large'); foreach(array('og:title'=>$title,'og:description'=>$desc,'og:url'=>get_permalink(),'og:type'=>'article','og:image'=>$image,'twitter:card'=>'summary_large_image','twitter:title'=>$title,'twitter:description'=>$desc,'twitter:image'=>$image) as $p=>$v) if($v) echo '<meta property="'.esc_attr($p).'" content="'.esc_attr($v).'">\n';}
 public static function button(){if(!is_singular('city'))return; $url=esc_url(get_permalink()); $text=rawurlencode('شهر من رو ببین و امتیاز بده: '.get_permalink()); echo '<div class="cc-share" data-url="'.esc_attr($url).'" data-text="'.esc_attr('شهر من رو ببین و امتیاز بده: '.get_permalink()).'"><button type="button" data-cc-share>ارسال برای دوستان</button><button type="button" data-cc-copy>کپی لینک</button><a href="https://t.me/share/url?url='.rawurlencode($url).'&text='.$text.'" target="_blank" rel="noopener">تلگرام</a><a href="https://wa.me/?text='.$text.'" target="_blank" rel="noopener">واتساپ</a></div>';}
}
