<?php
class CC_Admin {
 public static function init(){
  add_action('admin_menu',function(){add_options_page('مشارکت مردمی','مشارکت مردمی','manage_options','city-contrib',array(__CLASS__,'page'));});
  add_action('admin_init',function(){register_setting('cc_settings','cc_sms_endpoint',array('sanitize_callback'=>'esc_url_raw'));register_setting('cc_settings','cc_sms_key',array('sanitize_callback'=>'sanitize_text_field'));register_setting('cc_settings','cc_sms_sender',array('sanitize_callback'=>'sanitize_text_field'));});
  add_filter('manage_cc_submission_posts_columns',function($cols){return array('cb'=>'<input type="checkbox">','title'=>'عنوان','cc_city'=>'شهر','cc_type'=>'نوع','cc_status'=>'وضعیت','date'=>'تاریخ');});
  add_action('manage_cc_submission_posts_custom_column',function($col,$id){if($col==='cc_city'){echo esc_html(get_the_title(get_post_meta($id,'cc_city_id',true)));}elseif($col==='cc_type'){echo esc_html(get_post_meta($id,'cc_type',true));}elseif($col==='cc_status'){echo esc_html(get_post_status($id));}},10,2);
 }
 public static function page(){if(!current_user_can('manage_options'))return;echo '<div class="wrap"><h1>مشارکت مردمی شهر من</h1><form method="post" action="options.php">';settings_fields('cc_settings');echo '<table class="form-table"><tr><th>آدرس API پیامک</th><td><input class="regular-text" name="cc_sms_endpoint" value="'.esc_attr(get_option('cc_sms_endpoint','')).'"></td></tr><tr><th>کلید API</th><td><input class="regular-text" type="password" name="cc_sms_key" value="'.esc_attr(get_option('cc_sms_key','')).'"></td></tr><tr><th>فرستنده</th><td><input class="regular-text" name="cc_sms_sender" value="'.esc_attr(get_option('cc_sms_sender','')).'"></td></tr></table>';submit_button('ذخیره تنظیمات');echo '</form><p>برای بررسی ارسال‌ها از منوی «مشارکت‌ها» استفاده کنید.</p></div>';}
}
