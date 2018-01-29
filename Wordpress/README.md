# Wordpress

## Download

http://wordpress.org/latest.tar.gz


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

- ```.htaccess```

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

https://github.com/welaika/wordmove


##### pre in local

```bash
$ sudo apt install mysql-client
$ sudo apt install mysql-server
```

##### install

```bash
$ sudo gem install wordmove
```

##### Use

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

## :cat: Wp-Cli

http://wp-cli.org/#install

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

## :pig: Permissions

```bash
$
sudo chown -R www-data:www-data FOLDER/
sudo find FOLDER/ -type d -exec chmod 755 {} \;
sudo find FOLDER/ -type f -exec chmod 644 {} \;
```

--------------------------------------------------------------------------------

## :monkey: Plugins


#### Development

-   [debug-bar](https://wordpress.org/plugins/debug-bar/)
-   [theme-check](https://wordpress.org/plugins/theme-check/)


#### Esentials

-   [admin-menu-editor](https://wordpress.org/plugins/admin-menu-editor/)
-   [all-in-one-wp-migration](https://wordpress.org/plugins/all-in-one-wp-migration/)
-   [broken-link-checker](https://wordpress.org/plugins/broken-link-checker/)
-   [client-documentation](https://wordpress.org/plugins/client-documentation/)
-   [disable-xml-rpc](https://wordpress.org/plugins/disable-xml-rpc/)
-   [duplicate-page](https://wordpress.org/plugins/duplicate-page/)
-   [metronet-tag-manager](https://wordpress.org/plugins/metronet-tag-manager/)
-   [flexible-posts-widget](https://wordpress.org/plugins/flexible-posts-widget/)
-   [hc-custom-wp-admin-url](https://wordpress.org/plugins/hc-custom-wp-admin-url/)
-   [media-library-assistant](https://wordpress.org/plugins/media-library-assistant/)
-   [ms-custom-login](https://wordpress.org/plugins/ms-custom-login/)
-   [osd-remove-all-wp-creds](https://wordpress.org/plugins/osd-remove-all-wp-creds/)
-   [post-state-tags](https://wordpress.org/plugins/post-state-tags/)
-   [quick-pagepost-redirect-plugin](https://wordpress.org/plugins/quick-pagepost-redirect-plugin/)
-   [simple-history](https://wordpress.org/plugins/simple-history/)
-   [siteorigin-panels](https://wordpress.org/plugins/siteorigin-panels/)
-   [wordfence](https://wordpress.org/plugins/wordfence/)
-   [wordpress-seo](https://wordpress.org/plugins/wordpress-seo/)
-   [wp-htaccess-control](https://wordpress.org/plugins/wp-htaccess-control/)
-   [wp-security-audit-log](https://wordpress.org/plugins/wp-security-audit-log/)


```bash
wp plugin install \
	admin-menu-editor \
	all-in-one-wp-migration \
	broken-link-checker \
	client-documentation \
	disable-xml-rpc \
	duplicate-page \
	metronet-tag-manager \
	flexible-posts-widget \
	hc-custom-wp-admin-url \
	media-library-assistant \
	ms-custom-login \
	osd-remove-all-wp-creds \
	post-state-tags \
	quick-pagepost-redirect-plugin \
	simple-history \
	wordfence \
	wordpress-seo \
	wp-htaccess-control \
	wp-security-audit-log    
```



#### Basics

- [hc-custom-wp-admin-url](https://wordpress.org/plugins/hc-custom-wp-admin-url)
- [sem-external-links](https://wordpress.org/plugins/sem-external-links)
- [simple-history](https://wordpress.org/plugins/simple-history)
- [user-role-editor](https://wordpress.org/plugins/user-role-editor)
- [webmaster-user-role](https://wordpress.org/plugins/webmaster-user-role)
- [wp-db-backup](https://wordpress.org/plugins/wp-db-backup)
- [wp-optimize](https://wordpress.org/plugins/wp-optimize)
- [wpfront-user-role-editor](https://wordpress.org/plugins/wpfront-user-role-editor)


#### Mpre nice plugins

- [accesspress-social-icons](https://wordpress.org/plugins/accesspress-social-icons)
- [advanced-menu-widget](https://wordpress.org/plugins/advanced-menu-widget)
- [carousel-without-jetpack](https://wordpress.org/plugins/carousel-without-jetpack)
- [disable-wordpress-updates](https://wordpress.org/plugins/disable-wordpress-updates)
- [easy-social-icons](https://wordpress.org/plugins/easy-social-icons)
- [featured-video-plus](https://wordpress.org/plugins/featured-video-plus)
- [flexible-posts-widget](https://wordpress.org/plugins/flexible-posts-widget)
- [latest-tweets-widget](https://wordpress.org/plugins/latest-tweets-widget)
- [ml-slider](https://wordpress.org/plugins/ml-slider)
- [open-external-links-in-a-new-window](https://wordpress.org/plugins/open-external-links-in-a-new-window)
- [post-types-order](https://wordpress.org/plugins/post-types-order)
- [regenerate-thumbnails](https://wordpress.org/plugins/regenerate-thumbnails)
- [relative-url](https://wordpress.org/plugins/relative-url)
- [responsive-add-ons](https://wordpress.org/plugins/responsive-add-ons)
- [search-and-replace](https://wordpress.org/plugins/search-and-replace)
- [simple-basic-contact-form](https://wordpress.org/plugins/simple-basic-contact-form)
- [simple-responsive-slider](https://wordpress.org/plugins/simple-responsive-slider)
- [social-media-feather](https://wordpress.org/plugins/social-media-feather)
- [the-events-calendar](https://wordpress.org/plugins/the-events-calendar)
- [video-list-manager](https://wordpress.org/plugins/video-list-manager)
- [wp-attachments](https://wordpress.org/plugins/wp-attachments)
- [wp-maintenance-mode](https://wordpress.org/plugins/wp-maintenance-mode)
- [yop-poll](https://wordpress.org/plugins/yop-poll)
- [disable-comments](https://wordpress.org/plugins/disable-comments)







--------------------------------------------------------------------------------

## :bear: Child Theme

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


### The Loop

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
		'post_type' 			=> 'producto',
		'category' 				=> 'hamburguesa',
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
