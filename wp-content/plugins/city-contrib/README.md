# city-contrib — فاز ۱ «شهر من + مشارکت مردمی»

افزونه مستقل و سبک وردپرس برای صفحه‌های `city`؛ بدون jQuery و بدون سرویس خارجی در سمت کاربر.

## پیش‌نیاز

- WordPress 6.5+، PHP 8.1+، MySQL 8 یا MariaDB 10.6+
- پیوندهای یکتا فعال؛ نوع نوشته `city` با نشانی `/city/{slug}`. اگر این CPT وجود نداشته باشد افزونه یک نسخه حداقلی از آن ثبت می‌کند.
- پشتیبانی GD یا Imagick از WebP برای عکس‌های مشارکت.
- HTTPS برای کوکی ورود، Clipboard، Web Share و Geolocation.

## نصب

1. پوشه `city-contrib` را در `wp-content/plugins/` قرار دهید و افزونه «شهر من — مشارکت مردمی» را فعال کنید.
2. یک بار «تنظیمات ← پیوندهای یکتا» را ذخیره کنید (فعال‌سازی نیز rewrite را یک بار flush می‌کند).
3. از «شهر من ← تنظیمات»، پیامک و سقف‌ها را تنظیم کنید.
4. برای ناظر: نقش کاربر را «ناظر شهر» کنید و در همان پروفایل، شهرهای مجاز را انتخاب کنید.
5. صفحه شهر منتشرشده را باز کنید. قالب فرزند این مخزن اکشن `cc_city_engagement` را زیر تصویر/عنوان صدا می‌زند؛ روی قالب‌های دیگر افزونه به‌صورت خودکار رابط را ابتدای محتوای شهر می‌گذارد.

## پیامک

### وب‌هوک عمومی (راه سریع)

در تنظیمات، ارائه‌دهنده را «وب‌هوک JSON» انتخاب و یک URL از نوع HTTPS وارد کنید. افزونه این درخواست را می‌فرستد:

```http
POST /your-sms-endpoint
Authorization: Bearer OPTIONAL_TOKEN
Content-Type: application/json

{"mobile":"989121234567","code":"12345","message":"کد ورود شما: 12345"}
```

هر پاسخ HTTP `2xx` موفق محسوب می‌شود. URL با `wp_safe_remote_post` فراخوانی می‌شود و redirect پذیرفته نیست.

### درایور اختصاصی

کلاسی بسازید که `CC_SMS_Provider` را پیاده کند و از فیلتر زیر استفاده کنید:

```php
add_filter( 'cc_sms_provider', function () {
    return new My_Iranian_SMS_Provider();
} );
```

حالت `debug` فقط وقتی `WP_DEBUG=true` است کد را در PHP error log می‌نویسد و برای تولید مناسب نیست.

## دیتابیس و همزمانی رأی

`{prefix}cc_ratings`:

- `UNIQUE KEY (user_id, city_id)` تضمین نهایی «یک رأی برای هر شهر» است.
- ایندکس جدا روی `city_id` و مرکب روی `(user_id, created_at)` وجود دارد.
- قبل از insert، ردیف کاربر و سپس ردیف شهر با `SELECT ... FOR UPDATE` قفل می‌شوند.
- isolation هر تراکنش `READ COMMITTED` است؛ پس insert، محاسبه دقیق `SUM/COUNT` و نوشتن متاهای `cc_rating_sum/count/avg` یک واحد اتمیک‌اند.
- نمایش میانگین فقط از متای شهر انجام می‌شود. جدول فقط هنگام تغییر رأی برای بازسازی متا و برای نمودار توزیع خوانده می‌شود.
- `{prefix}cc_rating_audit` حذف رأی توسط مدیر و دلیل را نگه می‌دارد.

نسخه migration در option با نام `cc_db_version` است و هنگام ارتقا idempotent اجرا می‌شود.

## مشارکت و انتشار

- هر ارسال یک `cc_submission` خصوصی با وضعیت `pending` است.
- وضعیت‌های نهایی دقیقاً `approved` و `rejected` هستند؛ `publish` برای خود submission استفاده نمی‌شود.
- معرفی تأییدشده، در صورت وجود CPT مقصد، به `attraction`، `local_food` یا `souvenir` منتشر می‌شود؛ در هر حال در فید عمومی مشارکت تأییدشده شهر قابل نمایش است.
- اصلاح‌های امن روی متاهای دسترسی/نقشه یا excerpt اعمال می‌شوند؛ اصلاح‌های آزاد به یادداشت تأییدشده تبدیل می‌شوند تا متن اصلی بی‌اجازه بازنویسی نشود.
- گزارش تأییدشده، راستی‌آزمایی لازم را روی مقصد علامت می‌زند و عمومی نمی‌شود.
- عکس ابتدا از نظر اندازه و MIME واقعی بررسی، با GD/Imagick دوباره decode، کوچک، بدون EXIF و به WebP تبدیل می‌شود؛ سپس وارد Media Library می‌شود.

## Endpointها

Base: `/wp-json/cc/v1`

| Method | مسیر | دسترسی | کاربرد |
|---|---|---|---|
| GET | `/session` | عمومی | وضعیت ورود، public nonce و REST nonce؛ `no-store` |
| POST | `/auth/request-otp` | public nonce | درخواست کد؛ محدودیت شماره و IP |
| POST | `/auth/verify-otp` | public nonce | ورود/ثبت‌نام، کوکی ۹۰ روزه |
| POST | `/auth/logout` | ورود + REST nonce | خروج |
| DELETE | `/me/account` | ورود + REST nonce | حذف حساب؛ آرای aggregate بی‌نام می‌مانند |
| GET | `/cities/{id}/rating` | عمومی | میانگین متاکش، تعداد، توزیع، رأی شخصی |
| POST | `/cities/{id}/rating` | ورود + REST nonce | رأی immutable از ۱ تا ۷؛ تکرار = HTTP 409 |
| DELETE | `/admin/ratings/{id}` | مدیر + nonce | حذف audited و بازسازی aggregate |
| GET | `/cities/{id}/submissions` | عمومی | ۱۲ مشارکت تأییدشده در هر صفحه |
| POST | `/cities/{id}/submissions` | ورود + nonce | فرم multipart/JSON چهار نوع مشارکت |
| GET | `/me/submissions` | ورود + nonce | وضعیت، دلیل رد و مقصد منتشرشده |
| GET | `/moderation/submissions` | ناظر همان شهر/مدیر | صف و فیلترها |
| PATCH | `/moderation/submissions/{id}` | ناظر همان شهر/مدیر | ویرایش جزئی، تأیید یا رد |
| POST | `/moderation/submissions/batch` | ناظر همان شهر/مدیر | بررسی دسته‌جمعی تا ۵۰ مورد |

هیچ nonce یا داده کاربری داخل HTML قابل‌کش قرار نمی‌گیرد؛ صفحه پس از لود `/session` را فراخوانی می‌کند.

## تصمیم‌های ساده فاز ۱

- نقشه خارجی اضافه نشده است: برای حفظ حریم خصوصی، حجم و شرط «بدون CDN»، کاربر نشانی می‌نویسد یا با Geolocation مرورگر مختصات فعلی را ثبت می‌کند. رابط endpoint امکان افزودن pin-map در فاز بعد را دارد.
- QR، دعوت `ref`، امتیاز مشارکت، سطح و نشان عمداً پیاده نشده‌اند؛ در فاز ۲ هستند.
- تاریخ machine در DB میلادی/UTC می‌ماند. رابط فاز ۱ تاریخ خام نشان نمی‌دهد؛ قالب موجود نمایش شمسی را بر عهده دارد.
- draft فرم در localStorage است. Tip/Report/Correction بدون فایل در قطع اینترنت queue و با event `online` دوباره ارسال می‌شوند؛ فایل تصویر به دلیل امنیت و محدودیت مرورگر queue نمی‌شود و فقط فیلدها باقی می‌مانند.

## تست

```bash
node --check assets/js/city-contrib.js
node --check assets/js/admin.js
node tests/static-checks.mjs
```

فایل `tests/test-rating-integration.php` برای WordPress PHPUnit نوشته شده و unique constraint، تکرار HTTP 409 و برابری متا با جدول را بررسی می‌کند.
