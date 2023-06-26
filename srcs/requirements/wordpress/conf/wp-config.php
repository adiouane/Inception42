
<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');
define('DB_USER', 'adiouane');
define('DB_PASSWORD', 'adiouane123');
define('DB_HOST', 'mariadb');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '5Aj5 #{;taB7U]D8heZ6&f3$oYVD%MA[1qyfFwf.NQ-!3|H/(Uc5o {(-O U>[V/');
define('SECURE_AUTH_KEY',  'wfl6RWk_>f^PddJq1EfI!#xXBu~<>DijT5e[l~m JaGgkCpz%$IcZy)(Zdm~#tJq');
define('LOGGED_IN_KEY',    'Kp14x)g/%J~yUPu`yl#cVrG6O{&R<oY6gSMF%*))V$?F_-N/O9{uM+N_I)$_|,[W');
define('NONCE_KEY',        'K(o|CRW1*p2,_^6RCAi)(d:$1(C^oF:g7L2_wOo)?Oj%eP+O^5tzhmLW2(FT&iv1');
define('AUTH_SALT',        '$wd5%x0^!)qA@]AFahp6[[sk@uzy~&?0Tti|,_g0(dM|JdfQO|r1TzWTePSp#@iZ');
define('SECURE_AUTH_SALT', 'lS]Rqn)Sx +)1| h^~QZX=l?ke?w_-#0F+;/S3H_8<+J8~o8pG0)L*pD=>V7kWB|');
define('LOGGED_IN_SALT',   'Y5/,CXs|j?/|3dUsj2$cBZY_GycYoQ(A,Q;M}+O2TO$] 8w9},2ymKyN0<d?|j/^');
define('NONCE_SALT',       '@%/aut2y|dwn-2-^]18*P|)ssui  Y@(uLsJd9w-pMk_Ss%qk%n;r.KuokA(+Vk~');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
