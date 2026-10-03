<?php
/**
 * Cache-safe, mobile-first city UI shell. User data arrives over REST.
 *
 * @package City_Contrib
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class CC_Frontend {
	/** @var bool */
	private static $rendered = false;

	/** Attach city-only assets and portable fallback. */
	public static function hooks() {
		add_action( 'wp_enqueue_scripts', array( __CLASS__, 'assets' ), 30 );
		add_action( 'cc_city_engagement', array( __CLASS__, 'render' ) );
		add_filter( 'the_content', array( __CLASS__, 'content_fallback' ), 4 );
	}

	/** Load no-jQuery assets only where needed. */
	public static function assets() {
		if ( ! is_singular( 'city' ) ) {
			return;
		}
		wp_enqueue_style( 'city-contrib', CC_URL . 'assets/css/city-contrib.css', array(), CC_VERSION );
		wp_enqueue_script( 'city-contrib', CC_URL . 'assets/js/city-contrib.js', array(), CC_VERSION, array( 'in_footer' => true, 'strategy' => 'defer' ) );
		wp_localize_script(
			'city-contrib',
			'CC_DATA',
			array(
				'rest'      => esc_url_raw( rest_url( CC_REST::NAMESPACE . '/' ) ),
				'loginUrl'  => esc_url_raw( wp_login_url( get_permalink() ) ),
				'modules'   => array(
					'auth'    => CC_Config::enabled( 'auth' ),
					'share'   => CC_Config::enabled( 'share' ),
					'rating'  => CC_Config::enabled( 'rating' ),
					'contrib' => CC_Config::enabled( 'contrib' ),
				),
				'i18n' => array(
					'loading'           => __( 'در حال بارگذاری…', 'city-contrib' ),
					'networkError'      => __( 'ارتباط برقرار نشد. پیش‌نویس شما روی گوشی ماند.', 'city-contrib' ),
					'notEnough'         => __( 'هنوز امتیاز کافی ثبت نشده، اولین نفرات باشید.', 'city-contrib' ),
					'votes'             => __( 'رأی', 'city-contrib' ),
					'yourRating'        => __( 'امتیاز شما: %s ستاره', 'city-contrib' ),
					'finalRating'       => __( 'امتیاز نهایی %s ستاره؟ بعد از ثبت قابل تغییر نیست.', 'city-contrib' ),
					'saved'             => __( 'با موفقیت ثبت شد.', 'city-contrib' ),
					'queued'            => __( 'این درخواست ذخیره شد و با وصل‌شدن اینترنت خودکار فرستاده می‌شود.', 'city-contrib' ),
					'copied'            => __( 'لینک کپی شد.', 'city-contrib' ),
					'copyFailed'        => __( 'کپی خودکار نشد؛ لینک را دستی کپی کنید.', 'city-contrib' ),
					'otpSent'           => __( 'کد ارسال شد؛ تا دو دقیقه واردش کنید.', 'city-contrib' ),
					'locationSaved'     => __( 'موقعیت فعلی ثبت شد.', 'city-contrib' ),
					'locationFailed'    => __( 'دسترسی به موقعیت ممکن نشد؛ نشانی را بنویسید.', 'city-contrib' ),
					'emptyContributions'=> __( 'هنوز نکته‌ای منتشر نشده؛ شما اولین نفر باشید.', 'city-contrib' ),
					'emptyMine'         => __( 'هنوز مشارکتی نفرستاده‌اید.', 'city-contrib' ),
					'statusPending'     => __( 'در انتظار تأیید', 'city-contrib' ),
					'statusApproved'    => __( 'تأییدشده', 'city-contrib' ),
					'statusRejected'    => __( 'ردشده', 'city-contrib' ),
					'filesNotQueued'    => __( 'عکس‌ها برای امنیت در مرورگر ذخیره نمی‌شوند؛ پس از اتصال دوباره آن‌ها را انتخاب کنید.', 'city-contrib' ),
					'photoCount'        => __( 'یک تا سه عکس انتخاب کنید.', 'city-contrib' ),
					'photoSize'         => __( 'حجم هر عکس باید کمتر از ۵ مگابایت باشد.', 'city-contrib' ),
					'addedBy'           => __( 'افزوده‌شده توسط %s', 'city-contrib' ),
					'shareMessage'      => __( 'شهر من رو ببین و امتیاز بده:', 'city-contrib' ),
				),
			)
		);
	}

	/** Theme-independent fallback if cc_city_engagement is not called. */
	public static function content_fallback( $content ) {
		if ( ! self::$rendered && is_singular( 'city' ) && in_the_loop() && is_main_query() ) {
			ob_start();
			self::render( get_the_ID() );
			return ob_get_clean() . $content;
		}
		return $content;
	}

	/** Render a static shell with no user nonce/state, safe for full-page caches. */
	public static function render( $city_id = 0 ) {
		$city_id = $city_id ? absint( $city_id ) : get_queried_object_id();
		if ( self::$rendered || ! CC_Helpers::is_city( $city_id ) ) {
			return;
		}
		self::$rendered = true;
		$city_name      = get_the_title( $city_id );
		$city_url       = get_permalink( $city_id );
		$completion     = self::completion( $city_id );
		$rating_enabled = CC_Config::enabled( 'rating' );
		$share_enabled  = CC_Config::enabled( 'share' );
		$contrib_enabled = CC_Config::enabled( 'contrib' );
		?>
		<section id="cc-city-app" class="cc-app" dir="rtl" data-city-id="<?php echo esc_attr( (string) $city_id ); ?>" data-city-name="<?php echo esc_attr( $city_name ); ?>" data-city-url="<?php echo esc_url( $city_url ); ?>">
			<div class="cc-topbar" aria-busy="true" <?php hidden( ! $rating_enabled && ! $share_enabled ); ?>>
				<div class="cc-rating" aria-live="polite" <?php hidden( ! $rating_enabled ); ?>>
					<div class="cc-stars" role="radiogroup" aria-label="<?php esc_attr_e( 'امتیاز شهر از هفت ستاره', 'city-contrib' ); ?>">
						<?php for ( $cc_i = 1; $cc_i <= 7; $cc_i++ ) : ?>
							<button type="button" class="cc-star" role="radio" aria-checked="false" data-stars="<?php echo esc_attr( (string) $cc_i ); ?>" aria-label="<?php echo esc_attr( sprintf( __( 'امتیاز %s از ۷', 'city-contrib' ), CC_Helpers::fa_number( $cc_i ) ) ); ?>">☆</button>
						<?php endfor; ?>
					</div>
					<p class="cc-rating__summary cc-skeleton"><?php esc_html_e( 'در حال دریافت امتیاز…', 'city-contrib' ); ?></p>
					<button type="button" class="cc-rating__distribution" aria-expanded="false" hidden><?php esc_html_e( 'نمایش توزیع رأی‌ها', 'city-contrib' ); ?></button>
					<div class="cc-distribution" hidden></div>
				</div>
				<button type="button" class="cc-share cc-button cc-button--light" <?php hidden( ! $share_enabled ); ?>>
					<span aria-hidden="true">↗</span> <?php esc_html_e( 'ارسال برای دوستان', 'city-contrib' ); ?>
				</button>
			</div>

			<div class="cc-completion" <?php hidden( ! $contrib_enabled ); ?>>
				<div class="cc-completion__text"><strong><?php echo esc_html( sprintf( __( 'اطلاعات این شهر %s٪ کامل است', 'city-contrib' ), CC_Helpers::fa_number( $completion ) ) ); ?></strong><button type="button" class="cc-open-contrib cc-link-button"><?php esc_html_e( 'بخش‌های خالی را کامل کنید', 'city-contrib' ); ?></button></div>
				<div class="cc-progress" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="<?php echo esc_attr( (string) $completion ); ?>"><span style="width:<?php echo esc_attr( (string) $completion ); ?>%"></span></div>
			</div>

			<section class="cc-community" aria-labelledby="cc-community-title" <?php hidden( ! $contrib_enabled ); ?>>
				<div class="cc-section-head"><h2 id="cc-community-title"><?php esc_html_e( 'نکته‌ها و افزوده‌های مردم', 'city-contrib' ); ?></h2><button type="button" class="cc-my-submissions cc-link-button"><?php esc_html_e( 'مشارکت‌های من', 'city-contrib' ); ?></button></div>
				<div class="cc-community__items" aria-live="polite"><div class="cc-card cc-skeleton"><?php esc_html_e( 'در حال بارگذاری…', 'city-contrib' ); ?></div></div>
			</section>

			<button type="button" class="cc-fab cc-open-contrib" aria-haspopup="dialog" <?php hidden( ! $contrib_enabled ); ?>><span aria-hidden="true">＋</span><?php esc_html_e( 'مشارکت', 'city-contrib' ); ?></button>
			<div class="cc-toast" role="status" aria-live="polite" hidden></div>

			<dialog class="cc-dialog cc-auth-dialog" aria-labelledby="cc-auth-title">
				<form class="cc-sheet cc-auth-form" method="dialog">
					<div class="cc-sheet__head"><h2 id="cc-auth-title"><?php esc_html_e( 'ورود سریع با موبایل', 'city-contrib' ); ?></h2><button type="button" class="cc-close" aria-label="<?php esc_attr_e( 'بستن', 'city-contrib' ); ?>">×</button></div>
					<div class="cc-auth-phone">
						<label><?php esc_html_e( 'شماره موبایل', 'city-contrib' ); ?><input name="mobile" type="tel" inputmode="tel" autocomplete="tel" placeholder="۰۹۱۲۱۲۳۴۵۶۷" required></label>
						<button type="button" class="cc-button cc-request-otp"><?php esc_html_e( 'دریافت کد', 'city-contrib' ); ?></button>
					</div>
					<div class="cc-auth-code" hidden>
						<label><?php esc_html_e( 'کد پنج‌رقمی', 'city-contrib' ); ?><input name="code" type="text" inputmode="numeric" autocomplete="one-time-code" maxlength="5"></label>
						<label><?php esc_html_e( 'نام مستعار (اختیاری)', 'city-contrib' ); ?><input name="alias" type="text" maxlength="40" autocomplete="nickname"></label>
						<label class="cc-check"><input name="terms" type="checkbox" value="1"> <span><?php esc_html_e( 'قوانین مشارکت را می‌پذیرم؛ محتوا تبلیغاتی، توهین‌آمیز، سیاسی یا حاوی اطلاعات شخصی نیست و اجازه نمایش آن را می‌دهم.', 'city-contrib' ); ?></span></label>
						<button type="submit" class="cc-button"><?php esc_html_e( 'تأیید و ورود', 'city-contrib' ); ?></button>
					</div>
					<p class="cc-form-status" role="status"></p>
				</form>
			</dialog>

			<dialog class="cc-dialog cc-confirm-dialog" aria-labelledby="cc-confirm-title">
				<div class="cc-sheet cc-sheet--small">
					<h2 id="cc-confirm-title"><?php esc_html_e( 'ثبت امتیاز نهایی', 'city-contrib' ); ?></h2>
					<p class="cc-confirm-text"></p>
					<div class="cc-actions"><button type="button" class="cc-button cc-confirm-rating"><?php esc_html_e( 'ثبت امتیاز', 'city-contrib' ); ?></button><button type="button" class="cc-button cc-button--light cc-close"><?php esc_html_e( 'انصراف', 'city-contrib' ); ?></button></div>
				</div>
			</dialog>

			<dialog class="cc-dialog cc-share-dialog" aria-labelledby="cc-share-title">
				<div class="cc-sheet">
					<div class="cc-sheet__head"><h2 id="cc-share-title"><?php esc_html_e( 'ارسال برای دوستان', 'city-contrib' ); ?></h2><button type="button" class="cc-close" aria-label="<?php esc_attr_e( 'بستن', 'city-contrib' ); ?>">×</button></div>
					<p><?php esc_html_e( 'شهر من رو ببین و امتیاز بده:', 'city-contrib' ); ?></p>
					<div class="cc-share-grid">
						<button type="button" data-share="copy"><?php esc_html_e( 'کپی لینک', 'city-contrib' ); ?></button>
						<a data-share="telegram" target="_blank" rel="noopener"><?php esc_html_e( 'تلگرام', 'city-contrib' ); ?></a>
						<a data-share="whatsapp" target="_blank" rel="noopener"><?php esc_html_e( 'واتساپ', 'city-contrib' ); ?></a>
						<a data-share="eitaa" target="_blank" rel="noopener"><?php esc_html_e( 'ایتا', 'city-contrib' ); ?></a>
						<a data-share="bale" target="_blank" rel="noopener"><?php esc_html_e( 'بله', 'city-contrib' ); ?></a>
						<a data-share="rubika" target="_blank" rel="noopener"><?php esc_html_e( 'روبیکا', 'city-contrib' ); ?></a>
						<a data-share="sms"><?php esc_html_e( 'پیامک', 'city-contrib' ); ?></a>
					</div>
					<input class="cc-share-url" type="text" readonly value="<?php echo esc_url( $city_url ); ?>" aria-label="<?php esc_attr_e( 'لینک شهر', 'city-contrib' ); ?>">
				</div>
			</dialog>

			<dialog class="cc-dialog cc-contrib-dialog" aria-labelledby="cc-contrib-title">
				<form class="cc-sheet cc-contrib-form">
					<div class="cc-sheet__head"><h2 id="cc-contrib-title"><?php echo esc_html( sprintf( __( 'مشارکت در تکمیل %s', 'city-contrib' ), $city_name ) ); ?></h2><button type="button" class="cc-close" aria-label="<?php esc_attr_e( 'بستن', 'city-contrib' ); ?>">×</button></div>
					<label><?php esc_html_e( 'نوع مشارکت', 'city-contrib' ); ?>
						<select name="type">
							<option value="introduce"><?php esc_html_e( 'معرفی مکان یا غذا و سوغات', 'city-contrib' ); ?></option>
							<option value="correction"><?php esc_html_e( 'پیشنهاد اصلاح اطلاعات', 'city-contrib' ); ?></option>
							<option value="report"><?php esc_html_e( 'گزارش تعطیلی یا خطا', 'city-contrib' ); ?></option>
							<option value="tip"><?php esc_html_e( 'نکته کوتاه محلی', 'city-contrib' ); ?></option>
						</select>
					</label>
					<div class="cc-fields" data-fields="introduce">
						<label><?php esc_html_e( 'دسته', 'city-contrib' ); ?><select name="subtype"><option value="place"><?php esc_html_e( 'مکان و جاذبه', 'city-contrib' ); ?></option><option value="food"><?php esc_html_e( 'غذای محلی', 'city-contrib' ); ?></option><option value="souvenir"><?php esc_html_e( 'سوغات', 'city-contrib' ); ?></option></select></label>
						<label><?php esc_html_e( 'نام', 'city-contrib' ); ?><input name="name" type="text" maxlength="100"></label>
						<label><?php esc_html_e( 'دسته دقیق‌تر (اختیاری)', 'city-contrib' ); ?><input name="category" type="text" maxlength="80" placeholder="مثلاً رستوران سنتی"></label>
						<label><?php esc_html_e( 'توضیح (حداقل ۴۰ کاراکتر)', 'city-contrib' ); ?><textarea name="description" rows="4" maxlength="3000"></textarea></label>
						<label><?php esc_html_e( 'نشانی', 'city-contrib' ); ?><input name="address" type="text" maxlength="300"></label>
						<div class="cc-coords"><button type="button" class="cc-button cc-button--light cc-geolocate"><?php esc_html_e( 'استفاده از موقعیت فعلی', 'city-contrib' ); ?></button><input name="lat" type="hidden"><input name="lng" type="hidden"><span class="cc-coords-status"></span></div>
						<label><?php esc_html_e( '۱ تا ۳ عکس (هرکدام حداکثر ۵MB)', 'city-contrib' ); ?><input name="photos[]" type="file" accept="image/jpeg,image/png,image/webp" multiple></label>
					</div>
					<div class="cc-fields" data-fields="correction" hidden>
						<label><?php esc_html_e( 'کدام بخش؟', 'city-contrib' ); ?><select name="section"><option value="description"><?php esc_html_e( 'معرفی کوتاه', 'city-contrib' ); ?></option><option value="access_air"><?php esc_html_e( 'دسترسی هوایی', 'city-contrib' ); ?></option><option value="access_rail"><?php esc_html_e( 'دسترسی ریلی', 'city-contrib' ); ?></option><option value="access_road"><?php esc_html_e( 'دسترسی جاده‌ای', 'city-contrib' ); ?></option><option value="map"><?php esc_html_e( 'نقشه', 'city-contrib' ); ?></option><option value="facts"><?php esc_html_e( 'اطلاعات کلیدی', 'city-contrib' ); ?></option><option value="other"><?php esc_html_e( 'بخش دیگر', 'city-contrib' ); ?></option></select></label>
						<label><?php esc_html_e( 'متن درست', 'city-contrib' ); ?><textarea name="corrected_text" rows="4" maxlength="3000"></textarea></label>
						<label><?php esc_html_e( 'دلیل اصلاح', 'city-contrib' ); ?><textarea name="reason" rows="2" maxlength="500"></textarea></label>
					</div>
					<div class="cc-fields" data-fields="report" hidden>
						<label><?php esc_html_e( 'نوع گزارش', 'city-contrib' ); ?><select name="report_kind"><option value="closed"><?php esc_html_e( 'تعطیل شده است', 'city-contrib' ); ?></option><option value="error"><?php esc_html_e( 'اطلاعات خطا دارد', 'city-contrib' ); ?></option></select></label>
						<label><?php esc_html_e( 'توضیح اختیاری', 'city-contrib' ); ?><textarea name="description" rows="3" maxlength="800"></textarea></label>
					</div>
					<div class="cc-fields" data-fields="tip" hidden>
						<label><?php esc_html_e( 'نکته محلی (حداکثر ۲۸۰ کاراکتر)', 'city-contrib' ); ?><textarea name="tip" rows="4" maxlength="280"></textarea></label>
					</div>
					<label class="cc-honeypot" aria-hidden="true">Website<input name="website" tabindex="-1" autocomplete="off"></label>
					<input name="target_id" type="hidden" value="<?php echo esc_attr( (string) $city_id ); ?>">
					<p class="cc-form-note"><?php esc_html_e( 'همه مشارکت‌ها پیش از انتشار توسط ناظر بررسی می‌شوند. عکس ارسالی باید متعلق به شما باشد.', 'city-contrib' ); ?></p>
					<button type="submit" class="cc-button"><?php esc_html_e( 'ارسال برای بررسی', 'city-contrib' ); ?></button>
					<p class="cc-form-status" role="status"></p>
				</form>
			</dialog>

			<dialog class="cc-dialog cc-mine-dialog" aria-labelledby="cc-mine-title">
				<div class="cc-sheet"><div class="cc-sheet__head"><h2 id="cc-mine-title"><?php esc_html_e( 'مشارکت‌های من', 'city-contrib' ); ?></h2><button type="button" class="cc-close" aria-label="<?php esc_attr_e( 'بستن', 'city-contrib' ); ?>">×</button></div><div class="cc-mine-list"></div></div>
			</dialog>
		</section>
		<?php
	}

	/** Simple transparent completeness score, intentionally cheap and filterable. */
	private static function completion( $city_id ) {
		$checks = array(
			has_post_thumbnail( $city_id ),
			mb_strlen( wp_strip_all_tags( get_post_field( 'post_content', $city_id ) ) ) >= 600,
			(bool) get_the_excerpt( $city_id ),
			(bool) get_post_meta( $city_id, 'sa_city_population', true ),
			(bool) get_post_meta( $city_id, 'sa_city_latitude', true ),
			(bool) get_post_meta( $city_id, 'sa_access_road', true ),
			(bool) get_post_meta( $city_id, 'sa_google_map_url', true ),
			(bool) get_posts( array( 'post_type' => 'attraction', 'post_status' => 'publish', 'posts_per_page' => 1, 'fields' => 'ids', 'meta_key' => 'sa_city_id', 'meta_value' => $city_id ) ),
		);
		$score = (int) round( count( array_filter( $checks ) ) / count( $checks ) * 100 );
		return (int) apply_filters( 'cc_city_completion', $score, $city_id, $checks );
	}
}
