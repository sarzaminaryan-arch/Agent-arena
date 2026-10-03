<?php
if (!defined('ABSPATH')) exit;
class CC_Roles {
 public static function init(){add_action('init',array(__CLASS__,'ensure'));add_action('show_user_profile',array(__CLASS__,'field'));add_action('edit_user_profile',array(__CLASS__,'field'));add_action('personal_options_update',array(__CLASS__,'save'));add_action('edit_user_profile_update',array(__CLASS__,'save'));}
 public static function ensure(){if(!get_role('cc_city_moderator'))add_role('cc_city_moderator','ناظر شهر',array('read'=>true,'edit_posts'=>true,'edit_cc_submissions'=>true));}
 public static function field($user){if(!current_user_can('manage_options'))return;echo '<h2>تنظیمات ناظر شهر</h2><table class="form-table"><tr><th><label for="cc_moderator_city">شناسه شهر تحت نظارت</label></th><td><input name="cc_moderator_city" id="cc_moderator_city" type="number" value="'.esc_attr(get_user_meta($user->ID,'cc_moderator_city',true)).'" class="regular-text"><p class="description">شناسه پست CPT شهر را وارد کنید.</p></td></tr></table>';}
 public static function save($id){if(!current_user_can('manage_options')||!isset($_POST['cc_moderator_city']))return;update_user_meta($id,'cc_moderator_city',absint($_POST['cc_moderator_city']));}
 public static function can_review($id){if(current_user_can('manage_options'))return true;if(!current_user_can('edit_cc_submissions'))return false;return (int)get_user_meta(get_current_user_id(),'cc_moderator_city',true)===(int)get_post_meta($id,'cc_city_id',true);}
}
