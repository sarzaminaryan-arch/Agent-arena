<?php
if (!defined('ABSPATH')) exit;

class CC_Contrib {
 public static function init(){
  add_action('wp_footer', array(__CLASS__, 'widget'));
 }

 public static function widget(){
  if(!is_singular('city')) return;
  $id = get_the_ID();
  ?>
  <section class="cc-contrib" data-cc-contrib>
   <h2>در تکمیل اطلاعات این شهر مشارکت کنید</h2>
   <p>اطلاعات شما پس از بررسی ناظر منتشر می‌شود.</p>
   <button type="button" data-cc-open>+ مشارکت</button>
   <form hidden data-cc-form>
    <input type="hidden" name="city_id" value="<?php echo esc_attr($id); ?>">
    <label>نوع مشارکت
     <select name="type">
      <option value="place">معرفی مکان یا غذا</option>
      <option value="correction">پیشنهاد اصلاح</option>
      <option value="report">گزارش خطا یا تعطیلی</option>
      <option value="tip">نکته محلی</option>
     </select>
    </label>
    <label>توضیح
     <textarea name="text" minlength="30" maxlength="2500" required></textarea>
    </label>
    <label>تصویر (اختیاری، حداکثر ۵MB)
     <input type="file" name="image" accept="image/jpeg,image/png,image/webp">
    </label>
    <input class="cc-hp" name="website" tabindex="-1" autocomplete="off">
    <button type="submit">ارسال برای بررسی</button>
    <button type="button" data-cc-close>انصراف</button>
    <p data-cc-message role="status"></p>
   </form>
  </section>
  <?php
 }
}
