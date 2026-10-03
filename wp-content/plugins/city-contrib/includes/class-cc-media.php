<?php
if (!defined('ABSPATH')) exit;

class CC_Media {
 public static function handle($file){
  if(empty($file) || (isset($file['error']) && (int) $file['error'] === UPLOAD_ERR_NO_FILE)) return 0;
  if(!isset($file['error'], $file['size'], $file['tmp_name']) || (int) $file['error'] !== UPLOAD_ERR_OK || (int) $file['size'] > 5 * 1024 * 1024){
   return new WP_Error('invalid_image', 'تصویر باید JPG، PNG یا WebP و حداکثر ۵ مگابایت باشد', array('status' => 400));
  }

  $mime = wp_get_image_mime($file['tmp_name']);
  if(!in_array($mime, array('image/jpeg','image/png','image/webp'), true)){
   return new WP_Error('invalid_mime', 'نوع واقعی تصویر مجاز نیست', array('status' => 400));
  }

  require_once ABSPATH.'wp-admin/includes/file.php';
  require_once ABSPATH.'wp-admin/includes/image.php';

  $upload = wp_handle_upload($file, array(
   'test_form' => false,
   'mimes' => array('jpg' => 'image/jpeg', 'jpeg' => 'image/jpeg', 'png' => 'image/png', 'webp' => 'image/webp'),
  ));

  if(isset($upload['error'])) return new WP_Error('upload_failed', $upload['error'], array('status' => 400));

  $file_path = $upload['file'];
  $file_url = $upload['url'];
  $file_mime = $upload['type'];

  $editor = wp_get_image_editor($file_path);
  if(!is_wp_error($editor)){
   $editor->resize(1600, 1600, false);

   $webp_path = preg_replace('/\.(jpe?g|png|webp)$/i', '.webp', $file_path);
   $saved = $editor->save($webp_path, 'image/webp');

   if(!is_wp_error($saved) && !empty($saved['path'])){
    if($saved['path'] !== $file_path && file_exists($file_path)) @unlink($file_path);
    $file_path = $saved['path'];
    $file_url = preg_replace('/\.[^.]+$/', '.webp', $file_url);
    $file_mime = 'image/webp';
   } else {
    $saved_original = $editor->save($file_path);
    if(!is_wp_error($saved_original) && !empty($saved_original['path'])){
     $file_path = $saved_original['path'];
     $file_mime = $saved_original['mime-type'] ?? $file_mime;
    }
   }
  }

  $id = wp_insert_attachment(array(
   'post_mime_type' => $file_mime,
   'post_title' => sanitize_file_name(pathinfo($file_path, PATHINFO_FILENAME)),
   'post_status' => 'inherit',
   'guid' => $file_url,
  ), $file_path);

  if(is_wp_error($id)) return $id;

  wp_update_attachment_metadata($id, wp_generate_attachment_metadata($id, $file_path));
  return (int) $id;
 }
}
