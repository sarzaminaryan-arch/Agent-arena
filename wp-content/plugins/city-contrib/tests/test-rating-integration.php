<?php
/**
 * Run with the WordPress PHPUnit suite after activating city-contrib.
 */
class CC_Rating_Integration_Test extends WP_UnitTestCase {
	public function test_unique_vote_and_cached_meta_match_table() {
		global $wpdb;
		$city = self::factory()->post->create( array( 'post_type' => 'city', 'post_status' => 'publish', 'post_title' => 'Test city' ) );
		$users = self::factory()->user->create_many( 8, array( 'role' => 'subscriber' ) );
		$stars = array( 1, 2, 3, 4, 5, 6, 7, 7 );

		foreach ( $users as $index => $user_id ) {
			wp_set_current_user( $user_id );
			$request = new WP_REST_Request( 'POST' );
			$request->set_param( 'id', $city );
			$request->set_param( 'stars', $stars[ $index ] );
			$result = CC_Rating::post_rating( $request );
			$this->assertNotWPError( $result );
		}

		$table = CC_Config::ratings_table();
		$row = $wpdb->get_row( $wpdb->prepare( "SELECT COUNT(*) count, SUM(stars) total FROM {$table} WHERE city_id = %d", $city ) );
		$this->assertSame( (int) $row->count, (int) get_post_meta( $city, 'cc_rating_count', true ) );
		$this->assertSame( (int) $row->total, (int) get_post_meta( $city, 'cc_rating_sum', true ) );
		$this->assertEqualsWithDelta( $row->total / $row->count, (float) get_post_meta( $city, 'cc_rating_avg', true ), 0.0001 );

		wp_set_current_user( $users[0] );
		$duplicate = new WP_REST_Request( 'POST' );
		$duplicate->set_param( 'id', $city );
		$duplicate->set_param( 'stars', 7 );
		$error = CC_Rating::post_rating( $duplicate );
		$this->assertWPError( $error );
		$this->assertSame( 'cc_rating_exists', $error->get_error_code() );
		$this->assertSame( 409, $error->get_error_data()['status'] );
	}
}
