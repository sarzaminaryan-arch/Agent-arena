<?php
if (!defined('ABSPATH')) exit;

class CC_Roles {
 public static function init(){
  add_action('init', array(__CLASS__, 'ensure'));
  add_action('pre_get_posts', array(__CLASS__, 'scope_admin_list'));
  add_action('show_user_profile', array(__CLASS__, 'field'));
  add_action('edit_user_profile', array(__CLASS__, 'field'));
  add_action('personal_options_update', array(__CLASS__, 'save'));
  add_action('edit_user_profile_update', array(__CLASS__, 'save'));
 }

 public static function moderator_caps(){
  return array(
   'read',
   'upload_files',
   'edit_cc_submission',
   'read_cc_submission',
   'edit_cc_submissions',
   'edit_others_cc_submissions',
   'publish_cc_submissions',
   'read_private_cc_submissions',
   'edit_private_cc_submissions',
   'edit_published_cc_submissions',
  );
 }

 public static function admin_caps(){
  return array_merge(self::moderator_caps(), array(
   'delete_cc_submission',
   'delete_cc_submissions',
   'delete_private_cc_submissions',
   'delete_published_cc_submissions',
   'delete_others_cc_submissions',
  ));
 }

 private static function grant_caps($role, $caps){
  if(!$role) return;
  foreach($caps as $cap) $role->add_cap($cap);
 }

 public static function ensure(){
  $role = get_role('cc_city_moderator');
  if(!$role) $role = add_role('cc_city_moderator', 'ناظر شهر', array('read' => true));
  if($role){
   $role->remove_cap('edit_posts');
   $role->remove_cap('delete_posts');
   self::grant_caps($role, self::moderator_caps());
  }
  self::grant_caps(get_role('administrator'), self::admin_caps());
 }

 public static function field($user){
  if(!current_user_can('manage_options')) return;
  echo '<h2>تنظیمات ناظر شهر</h2><table class="form-table"><tr><th><label for="cc_moderator_city">شناسه شهر تحت نظارت</label></th><td><input name="cc_moderator_city" id="cc_moderator_city" type="number" value="'.esc_attr(get_user_meta($user->ID, 'cc_moderator_city', true)).'" class="regular-text"><p class="description">شناسه پست CPT شهر را وارد کنید. ناظر فقط مشارکت‌های همین شهر را در صف بررسی می‌بیند.</p></td></tr></table>';
 }

 public static function save($id){
  if(!current_user_can('manage_options') || !isset($_POST['cc_moderator_city'])) return;
  update_user_meta($id, 'cc_moderator_city', absint($_POST['cc_moderator_city']));
 }

 public static function scope_admin_list($q){
  if(!is_admin() || !$q->is_main_query()) return;
  $post_type = $q->get('post_type');
  $is_submission = $post_type === 'cc_submission' || (is_array($post_type) && in_array('cc_submission', $post_type, true));
  if(!$is_submission || current_user_can('manage_options')) return;

  if(!current_user_can('edit_cc_submissions')){
   $q->set('post__in', array(0));
   return;
  }

  $city = (int) get_user_meta(get_current_user_id(), 'cc_moderator_city', true);
  if(!$city){
   $q->set('post__in', array(0));
   return;
  }

  $meta_query = (array) $q->get('meta_query');
  $meta_query[] = array('key' => 'cc_city_id', 'value' => $city, 'compare' => '=');
  $q->set('meta_query', $meta_query);
 }

 public static function can_review($id){
  if(current_user_can('manage_options')) return true;
  if(!current_user_can('edit_cc_submissions')) return false;
  return (int) get_user_meta(get_current_user_id(), 'cc_moderator_city', true) === (int) get_post_meta($id, 'cc_city_id', true);
 }
}
