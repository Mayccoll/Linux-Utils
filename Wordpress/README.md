# Wordpress

## Rquirments

OS with LTS (Long Term Support).

- Ubuntu 16.04 LTS
- Centos 7
- Debian 8


- PHP 7+ or PHP 5.6
- MariaDB 10.0+ or MySQL 5.6+
- mod_rewrite Apache module
- Suport HTTPS
- Suport GZIP
- SSH Access (Important)
- Cache services avariable

--------------------------------------------------------------------------------

## Download

<http://wordpress.org/latest.tar.gz>

--------------------------------------------------------------------------------

### Security

- **Kill PHP execution.**

wp-content/uploads/.htaccess_

```bash
<Files *.php>
    Deny from All
</Files>
```

--------------------------------------------------------------------------------

## Performance

- `.htaccess`

```bash
### BEGIN php tweaks ###
php_value memory_limit 512M
php_value upload_max_filesize 512M
php_value post_max_size 256M
php_value max_execution_time 300
php_value max_input_time 300
### END php tweaks ###
```

```bash
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>
# END WordPress
```

--------------------------------------------------------------------------------

## Wordmove :turtle:

<https://github.com/welaika/wordmove>

### pre in local

```bash
$ sudo apt install mysql-client
$ sudo apt install mysql-server
```

### install

```bash
$ sudo gem install wordmove
```

### Use

- **Init**

```bash
$ wordmove init
```

- **Pull all**

```bash
$ wordmove pull --all
```

- **Pull Test**

```bash
$ wordmove pull --all -s
```

- **Pull wordpress**

```bash
$ wordmove pull -w
```

- **Pull Database**

```bash
$ wordmove pull -d
```

- **Pull Theme**

```bash
$ wordmove pull -t
```

--------------------------------------------------------------------------------

## Wp-Cli :cat:

<http://wp-cli.org/#install>

### Pre:

```bash
$
sudo apt-get install -y php7.0-cli
```

### Install:

```bash
$
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
        chmod +x wp-cli.phar && \
        sudo mv wp-cli.phar /usr/local/bin/wp
```

### Use:

```bash
$
wp plugin install --activate all-in-one-wp-migration  admin-color-schemes
```

--------------------------------------------------------------------------------

## Permissions :pig:

```bash
$
sudo chown -R www-data:www-data FOLDER/
sudo find FOLDER/ -type d -exec chmod 755 {} \;
sudo find FOLDER/ -type f -exec chmod 644 {} \;
```

--------------------------------------------------------------------------------

## Plugins :monkey:

```bash
wp plugin install admin-menu-editor
```

- accesspress-social-icons
- add-to-any
- admin-color-schemes
- admin-menu-editor
- advanced-menu-widge
- all-in-one-wp-migration
- carousel-without-jetpack
- client-documentation
- custom-content-type-manager
- debug-bar
- disable-comment
- disable-wordpress-updates
- disable-xml-rpc
- duplicate-page
- duracelltomi-google-tag-manager
- easy-social-icon
- featured-video-plus
- flexible-posts-widget
- hc-custom-wp-admin-url
- latest-tweets-widge
- login-customizer
- media-library-assistant
- menu-image
- metronet-tag-manager
- ml-slide
- ms-custom-login
- ns-redirection-and-ga-campaign-link-builder
- open-external-links-in-a-new-window
- osd-remove-all-wp-creds
- p3-profiler
- post-state-tags
- post-types-orde
- post-types-order
- quick-pagepost-redirect-plugin
- really-simple-ssl
- regenerate-thumbnails
- relative-ur
- responsive-add-on
- search-and-replac
- sem-external-links
- seo-ultimate
- server-ip-memory-usage
- server-status-littlebizzy
- simple-basic-contact-form
- simple-history
- simple-responsive-slider
- simple-wp-sitemap
- siteorigin-panels
- sitepress-multilingual-cms
- social-media-feathe
- the-events-calenda
- theme-check
- user-role-editor
- video-list-manage
- webmaster-user-role
- wordfence
- wordpress-seo
- wp-attachment
- wp-db-backup
- wp-fastest-cache
- wp-htaccess-control
- wp-maintenance-mode
- wp-optimize
- wp-security-audit-log
- wpfront-user-role-editoror
- wpml-string-translation
- wps-hide-login
- yop-pol

--------------------------------------------------------------------------------

## Child Theme :bear:

```css
/*
 Theme Name:     Foxy Child Theme
 Theme URI:      http://www.elegantthemes.com/gallery/foxy/
 Description:    Foxy Child Theme
 Author:         Elegant Themes
 Author URI:     http://www.elegantthemes.com
 Template:       Foxy
 Version:        1.0.0
*/

@import url("../css/mystyle.css");

/**
 * ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
 * ·······  Theme customization starts here
 * ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
 */
```
--------------------------------------------------------------------------------

## The Loop

```php
<?php
global $post;
$args = array(
    'posts_per_page'    => 5,
    'category'=> 59
);
$myposts = get_posts( $args );
foreach( $myposts as $post ) : setup_postdata($post);
    the_permalink();
    the_title();
    the_post_thumbnail('full');
    the_title();
endforeach;
```

### The Loop Custom Type

```php
<?php
    $arg = array(
        'post_type'             => 'producto',
        'category'                 => 'hamburguesa',
        'posts_per_page'  => -1
    );
    $loop = new WP_Query( $arg );
?>
<?php while ( $loop->have_posts() ) : $loop->the_post(); ?>

    <h3><?php the_title(); ?></h3>

    <ul>
        <li><?php print_custom_field('product_desc'); ?></li>
        <li><?php print_custom_field('product_price'); ?></li>
    </ul>
    <img src="<?php print_custom_field('product_img:to_image_src'); ?>" /><br />

<?php endwhile; wp_reset_query();
```

### The Loop Custom Type FIELD

```php
<?php
    $arg = array(
        'post_type'       => 'main_page',
        'posts_per_page'  => -1
    );
    $loop = new WP_Query( $arg );
?>
<?php
    while ( $loop->have_posts() ) : $loop->the_post();
        $images = get_custom_field('img_slider_web');
        $i = 1;
        foreach ($images as $img) {
            ?>
            <div class="item<?php if ($i == 1) echo ' active'; ?>">
            <?php
                printf('<img src="%s"/>', $img);
            ?>
            </div>
            <?php
        $i++;
        }
    endwhile; wp_reset_query();
?>
```

### Custom Nav

```php
<?php
/*
 * place in function.php
 * custom menu example @ https://digwp.com/2011/11/html-formatting-custom-menus/
 *
 */

 function wp_custom_menu( $menu_id ) {
     $menu_name = 'menu-home'; // specify custom menu slug
     if (  wp_get_nav_menu_object( $menu_id ) ) {
         $menu         = wp_get_nav_menu_object( $menu_id );
         $menu_items   = wp_get_nav_menu_items($menu->term_id);

         // $menu_list = "\t". '<nav>' ."\n";
         // $menu_list .= "\t\t". '<ul>' ."\n";
         foreach ((array) $menu_items as $key => $menu_item) {
             $title         = $menu_item->title;
             $url           = $menu_item->url;
             $image_size    = $menu_item->image_size;
             $image_menu    = wp_get_attachment_image($menu_item->thumbnail_id, $image_size);

             $menu_list .= '<div class="col-lg-4 col-sm-6">' ."\n";
             $menu_list .= '<a class="hovereffect" href="'. $url .'">' ."\n";
             $menu_list .= $image_menu ."\n";
             $menu_list .= '<div class="overlay"><h2>' . $title . '</h2></div>' ."\n";
             $menu_list .= '</a>' ."\n";
             $menu_list .= '</div>' ."\n";

         }
         // $menu_list .= "\t\t". '</ul>' ."\n";
         // $menu_list .= "\t". '</nav>' ."\n";
     } else {
         // $menu_list = '<!-- no list defined -->';
     }
     echo $menu_list;
 }

/*
 * Use: Menu number.
 */

 if (function_exists(wp_custom_menu(2))) wp_custom_menu(2);
 ?>
```
