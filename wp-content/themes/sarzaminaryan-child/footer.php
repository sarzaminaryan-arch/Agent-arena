<?php
/**
 * Footer — Sarzamin Aryan Child (v2.7.0, Module 4: minimal two-column footer).
 *
 * Two columns only:
 *   1) small logo + short site intro (+ optional social chips);
 *   2) «ارتباط با ما» — contact menu/e-mail with the site pages merged under it,
 *      next to the compact “explore” links.
 *
 * The standalone «برگه‌های سایت» column was removed in v2.7.0 because it merely
 * repeated the contact column; its links now live inside that column.
 *
 * @package Sarzaminaryan_Child
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

$sa_logo_url = SA_CHILD_URI . 'assets/img/logo.webp';
if ( has_custom_logo() ) {
	$sa_logo_id = (int) get_theme_mod( 'custom_logo' );
	$sa_logo    = wp_get_attachment_image_src( $sa_logo_id, 'full' );
	if ( $sa_logo ) {
		$sa_logo_url = $sa_logo[0];
	}
}
$sa_slogan = get_theme_mod( 'sa_home_slogan', 'چو ایران نباشد، تن من مباد' );

/**
 * Link to one of the seeded pages (about/contact/privacy/policy/…), falling back
 * to a pretty URL so the link exists even before the page is created.
 *
 * @param string $slug Page slug.
 * @return string URL.
 */
function sa_seeded_page_link( $slug ) {
	$sa_ids = get_option( 'sa_default_pages', array() );
	if ( ! empty( $sa_ids[ $slug ] ) && get_post( $sa_ids[ $slug ] ) ) {
		return get_permalink( (int) $sa_ids[ $slug ] );
	}
	$sa_page = get_page_by_path( $slug );
	if ( $sa_page instanceof WP_Post && 'publish' === $sa_page->post_status ) {
		return get_permalink( $sa_page );
	}
	// v2.3.0 — قبلاً اینجا یک نشانی حدسی برمی‌گشت، حتی وقتی برگه وجود نداشت؛
	// یعنی فوتر هر صفحه‌ی سایت به یک ۴۰۴ لینک می‌داد. حالا لینک ساخته نمی‌شود.
	return '';
}

/* ---- لینک‌های کاربردی: کاوش + برگه‌ها، در یک ستون ادغام‌شده (v2.7.0) ---- */
$sa_explore_links = array();
foreach ( sa_nav_entity_types() as $sa_type ) {
	$sa_explore_links[] = array(
		'url'   => sa_archive_url( $sa_type ),
		'label' => sa_entity_label( $sa_type, true ),
	);
}

$sa_page_links = array(
	array(
		'url'   => home_url( '/' ),
		'label' => 'صفحه اصلی',
	),
);
foreach ( array(
	'about'   => 'درباره ما',
	'contact' => 'تماس با ما',
	'privacy' => 'حریم خصوصی',
	'policy'  => 'سیاست تحریریه',
) as $sa_slug => $sa_label ) {
	$sa_url = sa_seeded_page_link( $sa_slug );
	if ( ! $sa_url ) {
		continue; // برگه ساخته نشده — لینک مرده نمی‌سازیم.
	}
	$sa_page_links[] = array(
		'url'   => $sa_url,
		'label' => $sa_label,
	);
}

$sa_contact_email = get_theme_mod( 'sa_contact_email', '' );
?>

<footer id="colophon" class="site-footer sa-hf-foot sa-hf-foot--mini">
	<div class="container">

		<div class="sa-hf-foot__grid">

			<div class="sa-hf-foot__col sa-hf-foot__brand">
				<a class="sa-hf-brand sa-hf-brand--foot" href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home">
					<span class="sa-hf-logo"><img src="<?php echo esc_url( $sa_logo_url ); ?>" width="40" height="40" alt="<?php echo esc_attr( get_bloginfo( 'name' ) ); ?>" loading="lazy" decoding="async"></span>
					<span class="sa-hf-text">
						<span class="site-title"><?php bloginfo( 'name' ); ?></span>
						<span class="sa-hf-slogan"><?php echo esc_html( $sa_slogan ); ?></span>
					</span>
				</a>
				<?php if ( is_active_sidebar( 'footer-1' ) ) : ?>
					<?php dynamic_sidebar( 'footer-1' ); ?>
				<?php else : ?>
					<p class="sa-footer__about"><?php echo esc_html( get_theme_mod( 'sa_footer_about', 'سرزمین آریان دانشنامه‌ی سفر ایران است؛ اطلاعات دقیق درباره‌ی استان‌ها، شهرها، جاذبه‌ها، مسیرهای سفر، غذاها و سوغات.' ) ); ?></p>
					<?php $sa_socials = sa_social_links(); ?>
					<?php if ( $sa_socials ) : ?>
						<ul class="sa-social" aria-label="شبکه‌های اجتماعی">
							<?php foreach ( $sa_socials as $sa_slug => $sa_net ) : ?>
								<li><a class="sa-social__link sa-social__link--<?php echo esc_attr( $sa_slug ); ?>" href="<?php echo esc_url( $sa_net['url'] ); ?>" target="_blank" rel="noopener me"><?php echo esc_html( $sa_net['label'] ); ?></a></li>
							<?php endforeach; ?>
						</ul>
					<?php endif; ?>
				<?php endif; ?>
			</div>

			<div class="sa-hf-foot__col sa-hf-foot__links-col">
				<?php if ( is_active_sidebar( 'footer-2' ) ) : ?>
					<?php dynamic_sidebar( 'footer-2' ); ?>
				<?php elseif ( is_active_sidebar( 'footer-3' ) ) : ?>
					<?php dynamic_sidebar( 'footer-3' ); ?>
				<?php else : ?>
					<h2 class="widget-title">ارتباط با ما</h2>
					<?php if ( has_nav_menu( 'footer' ) ) : ?>
						<nav class="footer-navigation" aria-label="منوی پابرگ">
							<?php wp_nav_menu( array( 'theme_location' => 'footer', 'menu_id' => 'footer-menu', 'container' => false, 'depth' => 1, 'menu_class' => 'sa-hf-foot__links' ) ); ?>
						</nav>
					<?php endif; ?>

					<ul class="sa-hf-foot__links sa-hf-foot__links--inline">
						<?php foreach ( $sa_page_links as $sa_link ) : ?>
							<li><a href="<?php echo esc_url( $sa_link['url'] ); ?>"><?php echo esc_html( $sa_link['label'] ); ?></a></li>
						<?php endforeach; ?>
						<?php foreach ( $sa_explore_links as $sa_link ) : ?>
							<li><a href="<?php echo esc_url( $sa_link['url'] ); ?>"><?php echo esc_html( $sa_link['label'] ); ?></a></li>
						<?php endforeach; ?>
					</ul>

					<?php if ( $sa_contact_email ) : ?>
						<p class="sa-footer__contact"><a href="mailto:<?php echo esc_attr( antispambot( $sa_contact_email ) ); ?>"><?php echo esc_html( antispambot( $sa_contact_email ) ); ?></a></p>
					<?php else : ?>
						<p class="sa-footer__contact">پیشنهاد و همکاری؟ از برگه‌ی «تماس با ما» با ما در ارتباط باشید.</p>
					<?php endif; ?>
				<?php endif; ?>
			</div>

		</div>

		<div class="sa-hf-foot__bottom">
			<p class="sa-footer__copyright">
				<?php
				$sa_copy = get_theme_mod( 'sa_footer_copyright', '' );
				if ( $sa_copy ) {
					echo esc_html( $sa_copy );
				} else {
					printf( '© %s %s — تمامی حقوق محفوظ است.', esc_html( sa_jalali_year() ), esc_html( get_bloginfo( 'name' ) ) );
				}
				?>
			</p>
			<?php if ( get_theme_mod( 'sa_footer_credit', true ) ) : ?>
				<p class="sa-footer__credit">طراحی و توسعه: محمدرضا لک</p>
			<?php endif; ?>
		</div>

	</div>
</footer>

<?php wp_footer(); ?>

</body>
</html>
