<?php
class CC_Admin { public static function init(){add_action('admin_menu',function(){add_options_page('مشارکت مردمی','مشارکت مردمی','manage_options','city-contrib',array(__CLASS__,'page'));});} public static function page(){echo '<div class="wrap"><h1>مشارکت مردمی شهر من</h1><p>تنظیمات نسخه پایه افزونه city-contrib. مدیریت مشارکت‌ها از منوی مشارکت‌ها انجام می‌شود.</p></div>';}}
