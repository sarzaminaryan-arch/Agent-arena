<?php
/**
 * Bulk import of county data (the output of content-templates/tools/geo/export_meta.py).
 *
 * Two doors, same engine:
 *   • پیشخان: شهرها ← پوشش ۴۸۳ شهرستان ← زبانهٔ «ورود انبوه داده» (برای میزبانی cPanel بدون SSH)
 *   • WP-CLI: wp sa-county import <file.json> [--force] [--dry-run]
 *
 * Payload shape: { "<county-slug>": { "sa_cty_center": "…", "sa_cty_population": 51000, … } }
 * Safety: only known meta keys are written, only to posts whose slug is in the official
 * registry, and by default only into EMPTY fields — a human edit is never overwritten
 * unless --force / «بازنویسی» is chosen.
 *
 * @package Sarzaminaryan_Child
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/**
 * Meta keys this importer is allowed to write.
 *
 * @return string[]
 */
function sa_county_import_keys() {
	$keys = array( 'sa_city_latitude', 'sa_city_longitude', 'sa_city_elevation' );
	foreach ( sa_county_schema() as $f ) {
		$keys[] = $f['key'];
	}
	return $keys;
}

/**
 * Apply a payload.
 *
 * @param array $payload  slug => array( meta_key => value ).
 * @param bool  $force    Overwrite non-empty fields.
 * @param bool  $dry_run  Report only.
 * @return array Report: rows (per county) + totals.
 */
function sa_county_import_apply( $payload, $force = false, $dry_run = false ) {
	$allowed = array_flip( sa_county_import_keys() );
	$report  = array(
		'rows'    => array(),
		'written' => 0,
		'skipped' => 0,
		'missing' => array(),
		'unknown' => array(),
	);

	foreach ( (array) $payload as $slug => $fields ) {
		$slug = sanitize_title( $slug );
		if ( ! sa_county( $slug ) ) {
			$report['unknown'][] = $slug;
			continue;
		}
		$post = get_page_by_path( $slug, OBJECT, 'city' );
		if ( ! $post ) {
			$report['missing'][] = $slug;
			continue;
		}
		$written = array();
		$skipped = array();
		foreach ( (array) $fields as $key => $value ) {
			if ( ! isset( $allowed[ $key ] ) ) {
				continue;
			}
			$current = get_post_meta( $post->ID, $key, true );
			if ( '' !== (string) $current && ! $force ) {
				$skipped[] = $key;
				continue;
			}
			$value = is_array( $value ) ? implode( "\n", array_map( 'strval', $value ) ) : (string) $value;
			$value = ( false !== strpos( $value, "\n" ) ) ? sanitize_textarea_field( $value ) : sanitize_text_field( $value );
			if ( '' === trim( $value ) ) {
				continue;
			}
			if ( ! $dry_run ) {
				update_post_meta( $post->ID, $key, $value );
			}
			$written[] = $key;
		}
		$report['written'] += count( $written );
		$report['skipped'] += count( $skipped );
		$report['rows'][]   = array(
			'slug'    => $slug,
			'post_id' => $post->ID,
			'written' => $written,
			'skipped' => $skipped,
		);
	}
	return $report;
}

/**
 * Admin screen section (called from the coverage page).
 */
function sa_county_import_screen() {
	if ( ! current_user_can( 'publish_posts' ) ) {
		return;
	}
	$report = null;
	$force  = false;
	$dry    = false;
	if ( isset( $_POST['sa_county_payload'] ) && check_admin_referer( 'sa_county_import' ) ) {
		$raw     = (string) wp_unslash( $_POST['sa_county_payload'] ); // phpcs:ignore WordPress.Security.ValidatedSanitizedInput.InputNotSanitized
		$force   = ! empty( $_POST['sa_county_force'] );
		$dry     = ! empty( $_POST['sa_county_dry'] );
		$payload = json_decode( $raw, true );
		if ( ! is_array( $payload ) ) {
			echo '<div class="notice notice-error"><p>JSON معتبر نیست: ' . esc_html( json_last_error_msg() ) . '</p></div>';
		} else {
			$report = sa_county_import_apply( $payload, $force, $dry );
		}
	}
	?>
	<h2 id="import">ورود انبوه داده</h2>
	<p class="description">
		خروجی <code>content/data/export/&lt;province&gt;.meta.json</code> را این‌جا بچسبانید.
		به‌صورت پیش‌فرض فقط خانه‌های <strong>خالی</strong> پر می‌شوند؛ هر چیزی که دست انسان نوشته دست‌نخورده می‌ماند.
	</p>
	<form method="post">
		<?php wp_nonce_field( 'sa_county_import' ); ?>
		<textarea name="sa_county_payload" rows="10" class="widefat" dir="ltr" placeholder='{"dena":{"sa_cty_center":"سی‌سخت","sa_cty_population":"51000"}}'></textarea>
		<p>
			<label><input type="checkbox" name="sa_county_dry" value="1" checked> فقط پیش‌نمایش (چیزی ذخیره نشود)</label>
			&nbsp;&nbsp;
			<label><input type="checkbox" name="sa_county_force" value="1"> بازنویسی خانه‌های پرشده</label>
		</p>
		<p><button class="button button-primary">اعمال</button></p>
	</form>
	<?php
	if ( $report ) {
		echo '<div class="notice notice-' . ( $dry ? 'info' : 'success' ) . '"><p>';
		printf(
			esc_html( '%1$s خانه %2$s · %3$s خانه رد شد (پر بود) · %4$s شهرستان بدون نوشته · %5$s نامک ناشناخته' ),
			esc_html( sa_fa_digits( $report['written'] ) ),
			esc_html( $dry ? 'آمادهٔ نوشتن' : 'نوشته شد' ),
			esc_html( sa_fa_digits( $report['skipped'] ) ),
			esc_html( sa_fa_digits( count( $report['missing'] ) ) ),
			esc_html( sa_fa_digits( count( $report['unknown'] ) ) )
		);
		echo '</p></div>';
		if ( $report['missing'] ) {
			echo '<p><strong>نوشته ندارند:</strong> ' . esc_html( implode( '، ', $report['missing'] ) ) . ' — با دکمهٔ «ساخت پیش‌نویس‌های جاافتاده» بسازید.</p>';
		}
		if ( $report['unknown'] ) {
			echo '<p><strong>نامک ناشناخته:</strong> ' . esc_html( implode( '، ', $report['unknown'] ) ) . '</p>';
		}
		echo '<table class="widefat striped"><thead><tr><th>شهرستان</th><th>نوشته‌شده</th><th>رد‌شده</th></tr></thead><tbody>';
		foreach ( $report['rows'] as $row ) {
			echo '<tr><td><a href="' . esc_url( (string) get_edit_post_link( $row['post_id'] ) ) . '">' . esc_html( $row['slug'] ) . '</a></td>';
			echo '<td>' . esc_html( implode( '، ', $row['written'] ) ) . '</td>';
			echo '<td>' . esc_html( implode( '، ', $row['skipped'] ) ) . '</td></tr>';
		}
		echo '</tbody></table>';
	}
}

/**
 * WP-CLI: wp sa-county import <file> [--force] [--dry-run]
 *
 * @param array $args       Positional args.
 * @param array $assoc_args Flags.
 */
function sa_county_cli_import( $args, $assoc_args ) {
	$file = isset( $args[0] ) ? $args[0] : '';
	if ( ! $file || ! is_readable( $file ) ) {
		WP_CLI::error( 'فایل خوانده نشد: ' . $file );
	}
	$payload = json_decode( (string) file_get_contents( $file ), true ); // phpcs:ignore WordPress.WP.AlternativeFunctions
	if ( ! is_array( $payload ) ) {
		WP_CLI::error( 'JSON نامعتبر: ' . json_last_error_msg() );
	}
	$report = sa_county_import_apply(
		$payload,
		! empty( $assoc_args['force'] ),
		! empty( $assoc_args['dry-run'] )
	);
	foreach ( $report['rows'] as $row ) {
		WP_CLI::log( sprintf( '%-24s +%d  ~%d', $row['slug'], count( $row['written'] ), count( $row['skipped'] ) ) );
	}
	WP_CLI::success(
		sprintf(
			'%d field(s) written, %d skipped, %d county post(s) missing, %d unknown slug(s).',
			$report['written'],
			$report['skipped'],
			count( $report['missing'] ),
			count( $report['unknown'] )
		)
	);
}

if ( defined( 'WP_CLI' ) && WP_CLI ) {
	WP_CLI::add_command( 'sa-county import', 'sa_county_cli_import' );
}
