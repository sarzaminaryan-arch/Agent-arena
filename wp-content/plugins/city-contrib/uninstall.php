<?php
/**
 * Deliberately preserve ratings, submissions and audit records on uninstall.
 * Data removal must be an explicit administrator operation, never a plugin-list click.
 *
 * @package City_Contrib
 */
if ( ! defined( 'WP_UNINSTALL_PLUGIN' ) ) {
	exit;
}
