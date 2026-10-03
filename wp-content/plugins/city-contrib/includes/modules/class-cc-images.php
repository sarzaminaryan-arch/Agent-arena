<?php
/**
 * Safe image validation, EXIF stripping and WebP conversion.
 *
 * @package City_Contrib
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class CC_Images {
	/**
	 * Process multipart photos and attach them to a submission.
	 *
	 * @param array $file_param REST file parameter.
	 * @param int   $parent_id  Submission ID.
	 * @return int[]|WP_Error
	 */
	public static function process( $file_param, $parent_id ) {
		$files = self::flatten( $file_param );
		if ( count( $files ) > (int) CC_Config::get( 'upload_max_files' ) ) {
			return new WP_Error( 'cc_too_many_images', __( 'حداکثر سه عکس می‌توانید بفرستید.', 'city-contrib' ), array( 'status' => 400 ) );
		}
		$ids = array();
		foreach ( $files as $file ) {
			$result = self::one( $file, $parent_id );
			if ( is_wp_error( $result ) ) {
				foreach ( $ids as $id ) {
					wp_delete_attachment( $id, true );
				}
				return $result;
			}
			$ids[] = $result;
		}
		return $ids;
	}

	/** Flatten PHP's multiple-file shape. */
	private static function flatten( $value ) {
		if ( empty( $value ) || ! is_array( $value ) || empty( $value['name'] ) ) {
			return array();
		}
		if ( ! is_array( $value['name'] ) ) {
			return array( $value );
		}
		$out = array();
		foreach ( $value['name'] as $i => $name ) {
			if ( UPLOAD_ERR_NO_FILE === (int) $value['error'][ $i ] ) {
				continue;
			}
			$out[] = array(
				'name'     => $name,
				'type'     => $value['type'][ $i ],
				'tmp_name' => $value['tmp_name'][ $i ],
				'error'    => $value['error'][ $i ],
				'size'     => $value['size'][ $i ],
			);
		}
		return $out;
	}

	/** Validate/re-encode one image and create attachment. */
	private static function one( $file, $parent_id ) {
		if ( UPLOAD_ERR_OK !== (int) $file['error'] || ! is_uploaded_file( $file['tmp_name'] ) ) {
			return new WP_Error( 'cc_upload_failed', __( 'بارگذاری یکی از عکس‌ها کامل نشد.', 'city-contrib' ), array( 'status' => 400 ) );
		}
		if ( (int) $file['size'] > (int) CC_Config::get( 'upload_max_bytes' ) ) {
			return new WP_Error( 'cc_image_too_large', __( 'حجم هر عکس پیش از فشرده‌سازی باید کمتر از ۵ مگابایت باشد.', 'city-contrib' ), array( 'status' => 413 ) );
		}
		$info = @getimagesize( $file['tmp_name'] ); // phpcs:ignore WordPress.PHP.NoSilencedErrors.Discouraged
		$mime = is_array( $info ) && ! empty( $info['mime'] ) ? $info['mime'] : '';
		if ( ! in_array( $mime, array( 'image/jpeg', 'image/png', 'image/webp' ), true ) ) {
			return new WP_Error( 'cc_image_type', __( 'فقط عکس واقعی JPG، PNG یا WebP پذیرفته می‌شود.', 'city-contrib' ), array( 'status' => 415 ) );
		}

		require_once ABSPATH . 'wp-admin/includes/image.php';
		require_once ABSPATH . 'wp-admin/includes/file.php';
		require_once ABSPATH . 'wp-admin/includes/media.php';
		$editor = wp_get_image_editor( $file['tmp_name'] );
		if ( is_wp_error( $editor ) || ! wp_image_editor_supports( array( 'mime_type' => 'image/webp' ) ) ) {
			return new WP_Error( 'cc_webp_unsupported', __( 'سرور امکان تبدیل امن عکس به WebP را ندارد.', 'city-contrib' ), array( 'status' => 500 ) );
		}
		$size = $editor->get_size();
		$max  = (int) CC_Config::get( 'upload_max_dimension' );
		if ( ! empty( $size['width'] ) && ( $size['width'] > $max || $size['height'] > $max ) ) {
			$editor->resize( $max, $max, false );
		}
		$editor->set_quality( (int) CC_Config::get( 'upload_webp_quality' ) );
		$temp = wp_tempnam( 'cc-photo.webp' );
		if ( ! $temp ) {
			return new WP_Error( 'cc_image_temp', __( 'فضای موقت برای پردازش عکس در دسترس نیست.', 'city-contrib' ), array( 'status' => 500 ) );
		}
		$webp = preg_replace( '/\.[^.]+$/', '', $temp ) . '.webp';
		@unlink( $temp ); // phpcs:ignore WordPress.PHP.NoSilencedErrors.Discouraged
		$saved = $editor->save( $webp, 'image/webp' );
		if ( is_wp_error( $saved ) || empty( $saved['path'] ) || 'image/webp' !== ( $saved['mime-type'] ?? '' ) ) {
			@unlink( $webp ); // phpcs:ignore WordPress.PHP.NoSilencedErrors.Discouraged
			return new WP_Error( 'cc_image_convert', __( 'تبدیل عکس به WebP انجام نشد.', 'city-contrib' ), array( 'status' => 500 ) );
		}

		$sideload = array(
			'name'     => 'city-contribution-' . wp_generate_password( 8, false, false ) . '.webp',
			'tmp_name' => $saved['path'],
			'type'     => 'image/webp',
			'error'    => 0,
			'size'     => filesize( $saved['path'] ),
		);
		$attachment_id = media_handle_sideload( $sideload, $parent_id, __( 'عکس مشارکت مردمی', 'city-contrib' ) );
		if ( is_wp_error( $attachment_id ) ) {
			@unlink( $saved['path'] ); // phpcs:ignore WordPress.PHP.NoSilencedErrors.Discouraged
			return new WP_Error( 'cc_image_store', __( 'ذخیره عکس انجام نشد.', 'city-contrib' ), array( 'status' => 500 ) );
		}
		update_post_meta( $attachment_id, '_cc_submission_id', $parent_id );
		return (int) $attachment_id;
	}
}
