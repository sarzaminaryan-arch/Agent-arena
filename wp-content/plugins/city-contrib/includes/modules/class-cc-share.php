<?php
/**
 * City share metadata. Buttons are rendered by the frontend module.
 *
 * @package City_Contrib
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

final class CC_Share {
	/** Attach metadata hooks. */
	public static function hooks() {
		add_action( 'after_setup_theme', array( __CLASS__, 'image_size' ), 20 );
		add_action( 'wp', array( __CLASS__, 'avoid_theme_duplicate' ) );
		add_action( 'wp_head', array( __CLASS__, 'head' ), 1 );
		add_filter( 'pre_get_document_title', array( __CLASS__, 'document_title' ), 99 );
		foreach ( array( 'wpseo_title', 'wpseo_opengraph_title', 'wpseo_twitter_title', 'rank_math/frontend/title', 'rank_math/opengraph/facebook/title', 'rank_math/opengraph/twitter/title' ) as $filter ) {
			add_filter( $filter, array( __CLASS__, 'filtered_title' ), 99 );
		}
		foreach ( array( 'wpseo_metadesc', 'wpseo_opengraph_desc', 'wpseo_twitter_description', 'rank_math/frontend/description', 'rank_math/opengraph/facebook/description', 'rank_math/opengraph/twitter/description' ) as $filter ) {
			add_filter( $filter, array( __CLASS__, 'filtered_description' ), 99 );
		}
		foreach ( array( 'wpseo_opengraph_image', 'wpseo_twitter_image', 'rank_math/opengraph/facebook/image', 'rank_math/opengraph/twitter/image' ) as $filter ) {
			add_filter( $filter, array( __CLASS__, 'filtered_image' ), 99 );
		}
	}

	/** Register exact social card crop for future uploads. */
	public static function image_size() {
		add_image_size( 'cc-og', 1200, 630, true );
	}

	/** The project theme has its own OG printer; disable it only on city pages. */
	public static function avoid_theme_duplicate() {
		if ( is_singular( 'city' ) && has_action( 'wp_head', 'sa_seo_head' ) ) {
			remove_action( 'wp_head', 'sa_seo_head', 2 );
		}
	}

	/** Rating-aware city title. */
	public static function city_title( $city_id ) {
		$count = (int) get_post_meta( $city_id, 'cc_rating_count', true );
		$avg   = (float) get_post_meta( $city_id, 'cc_rating_avg', true );
		$name  = get_the_title( $city_id );
		if ( $count >= 5 ) {
			return sprintf(
				/* translators: 1: city, 2: average, 3: vote count, 4: site. */
				__( '%1$s؛ امتیاز %2$s از ۷ (%3$s رأی) | %4$s', 'city-contrib' ),
				$name,
				CC_Helpers::fa_number( number_format( $avg, 1, '.', '' ) ),
				CC_Helpers::fa_number( number_format( $count ) ),
				get_bloginfo( 'name' )
			);
		}
		return sprintf(
			/* translators: 1: city, 2: site. */
			__( '%1$s؛ امتیاز مردمی شهر | %2$s', 'city-contrib' ),
			$name,
			get_bloginfo( 'name' )
		);
	}

	/** Filter browser title. */
	public static function document_title( $title ) {
		return is_singular( 'city' ) ? self::city_title( get_queried_object_id() ) : $title;
	}

	/** SEO-plugin title bridge. */
	public static function filtered_title( $title ) {
		return self::document_title( $title );
	}

	/** SEO-plugin description bridge. */
	public static function filtered_description( $description ) {
		if ( ! is_singular( 'city' ) ) {
			return $description;
		}
		$city_id = get_queried_object_id();
		$text    = get_the_excerpt( $city_id );
		return $text ? $text : wp_trim_words( wp_strip_all_tags( get_post_field( 'post_content', $city_id ) ), 28, '…' );
	}

	/** SEO-plugin 1200×630 image bridge. */
	public static function filtered_image( $image ) {
		if ( ! is_singular( 'city' ) || ! has_post_thumbnail( get_queried_object_id() ) ) {
			return $image;
		}
		$source = self::og_image( get_post_thumbnail_id( get_queried_object_id() ) );
		return $source ? $source[0] : $image;
	}

	/**
	 * Ensure existing pre-plugin thumbnails also have the required 1200×630 crop.
	 * The first social crawler may create it once; later requests use metadata only.
	 *
	 * @param int $attachment_id Attachment ID.
	 * @return array|false Image source tuple.
	 */
	private static function og_image( $attachment_id ) {
		$meta = wp_get_attachment_metadata( $attachment_id );
		$meta = is_array( $meta ) ? $meta : array( 'sizes' => array() );
		if ( ! empty( $meta['sizes']['cc-og'] ) ) {
			return wp_get_attachment_image_src( $attachment_id, 'cc-og' );
		}
		$file = get_attached_file( $attachment_id );
		if ( $file && is_readable( $file ) ) {
			require_once ABSPATH . 'wp-admin/includes/image.php';
			$made = image_make_intermediate_size( $file, 1200, 630, true );
			if ( is_array( $made ) && ! empty( $made['file'] ) ) {
				$meta['sizes']['cc-og'] = $made;
				wp_update_attachment_metadata( $attachment_id, $meta );
				return wp_get_attachment_image_src( $attachment_id, 'cc-og' );
			}
		}
		return wp_get_attachment_image_src( $attachment_id, 'full' );
	}

	/** Print Open Graph and Twitter cards for city share links. */
	public static function head() {
		if ( ! is_singular( 'city' ) ) {
			return;
		}
		if ( defined( 'WPSEO_VERSION' ) || defined( 'RANK_MATH_VERSION' ) ) {
			return; // Yoast/Rank Math filters above provide the same city metadata without duplicates.
		}
		$city_id = get_queried_object_id();
		$title   = self::city_title( $city_id );
		$desc    = get_the_excerpt( $city_id );
		if ( ! $desc ) {
			$desc = wp_trim_words( wp_strip_all_tags( get_post_field( 'post_content', $city_id ) ), 28, '…' );
		}
		$url   = get_permalink( $city_id );
		$image = has_post_thumbnail( $city_id ) ? self::og_image( get_post_thumbnail_id( $city_id ) ) : false;
		if ( function_exists( 'sa_seo_canonical' ) ) {
			echo '<link rel="canonical" href="' . esc_url( $url ) . '">' . "\n";
		}
		echo '<meta name="description" content="' . esc_attr( $desc ) . '">' . "\n";
		echo '<meta property="og:locale" content="fa_IR">' . "\n";
		echo '<meta property="og:type" content="place">' . "\n";
		echo '<meta property="og:site_name" content="' . esc_attr( get_bloginfo( 'name' ) ) . '">' . "\n";
		echo '<meta property="og:title" content="' . esc_attr( $title ) . '">' . "\n";
		echo '<meta property="og:description" content="' . esc_attr( $desc ) . '">' . "\n";
		echo '<meta property="og:url" content="' . esc_url( $url ) . '">' . "\n";
		if ( $image ) {
			echo '<meta property="og:image" content="' . esc_url( $image[0] ) . '">' . "\n";
			echo '<meta property="og:image:width" content="' . esc_attr( (string) $image[1] ) . '">' . "\n";
			echo '<meta property="og:image:height" content="' . esc_attr( (string) $image[2] ) . '">' . "\n";
		}
		echo '<meta name="twitter:card" content="' . ( $image ? 'summary_large_image' : 'summary' ) . '">' . "\n";
		echo '<meta name="twitter:title" content="' . esc_attr( $title ) . '">' . "\n";
		echo '<meta name="twitter:description" content="' . esc_attr( $desc ) . '">' . "\n";
		if ( $image ) {
			echo '<meta name="twitter:image" content="' . esc_url( $image[0] ) . '">' . "\n";
		}
	}
}
