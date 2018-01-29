# Drupal


### Patch

    git apply PATCH_NAME.patch


### Drush

##### Instalar Drush

```bash
    # Hostgator
    clone git repo
    >>> .bashrc
        +++ export  DRUSH_PHP='/opt/php54/bin/php'
        +++ alias   drush='~/drush/drush'
        +++ alias   php='/opt/php54/bin/php'
```

##### Drush Comandos

```bash
    # Update
    drush pm-update -y
    drush updatedb -y

    # Enable and Disable Module
    drush enable content

    # Clear Caches
    drush cc all

    # Run cron
    drush cron

    # Check for updates
    drush upc
    drush updatedb --no

    # Commerce Update
    drush dl commerce_kickstart
    drush updatedb -y
```




##### Crear DB y USER

```bash
    mysql –u root –p

    mysql> CREATE DATABASE databasename;

    mysql> create user some_user@localhost identified by 'some_assword';

    mysql> GRANT ALL PRIVILEGES ON databasename.* TO some_user@hostname IDENTIFIED BY some_assword;

    mysql> FLUSH PRIVILEGES;

    mysql> SHOW databases

    mysql> EXIT



    mysqladmin –u root –p create DB_NAME

    mkdir _FOLDER_

    cd _FOLDER_

    drush dl drupal

    # mv drupal-7.14/* .

    mv drupal-7.14/.htaccess .

    mv drupal-7.14/.gitignore .

    rm drupal-7.14 -r

    mkdir sites/default/files

    mkdir sites/default/files-priv

    cp sites/default/defatult.settings.php sites/default/settings.php

    chmod +w sites/default/setting.php

    chmod +w sites/default/files

    drush site-install standard
        --account-name=_ADMIN_NAME_
        --account-pass=_ADMIN_PASSWORD_
        --account-mail=_ACOUNT_@_MAIL_.com
        --db-url=mysql://_ROOT_:_PASSWORD_@localhost/_BD_NAME_
        --site-name="_SITE_NAME_"
        --site-mail=_EMAIL_@_MAIL_.com
```


##### Install SQLite

```bash
    drush site-install
        --db-url=sqlite:sites/default/files/.db.sqlite.NAME
        --account-name=USER
        --account-pass=PASS
        --site-name="SITENAME"
```

##### Mantenimiento

```bash
    #Activate maintenance mode
    drush vset --always-set site_offline 1
    drush cc all

    #Desactivate maintenance mode
    drush vset --always-set site_offline 0
    drush cc all
```


##### Install Modules

```bash
    # drush dl modulename
    # drush en -y modulename

    drush dl
```




##### Aliases

```bash
# /* NO-REMOTE */
$aliases['local'] = array(
    'uri' => 'http://localhost/PK_drus/',
    'root' => '/home/m/Dropbox/www/PK_drus',
    'variables' => array('mail_system' => array('default-system' => 'DevelMailLog')),
  );

# /* REMOTE */
$aliases['dev'] = array(
  'uri' => 'MYSITE.com',
  'root' => '/DRUPAL/ROOT',

  'remote-host' => 'HOST.com',
  'remote-user' => 'USER',
  'ssh-options' => '-o PasswordAuthentication=yes -p 22',

  'path-aliases' => array(
    '%dump-dir' => '/DUMP/FOLDER',
    '%files' => '/ROOT/sites/default/files',
  ),
);
```

##### Sync

```bash
    // Sincronizar la base de datos
    drush sql-sync @dev.mysite @local.mysite --sanitize

    // Sincronizar los archivos
    drush rsync @dev.mysite:%files/ @local.mysite:%files

    drush rsync @local @remote
```


##### Themes

```bash
    drush dl rubik tao zen

    drush dl rubik tao zen rootcandy omega omega_tools delta mothership

    drush dl rubik tao omega omega_tools delta
```


# ::::::: Omega

```bash
drush help --filter=omega

drush omega-subtheme "Custom Kickstart" --base=omega_kickstart --enable
```


##### Stop Cache CSS or JS

```bash
    drush vset preprocess_css 0 --yes

    drush vset preprocess_js 0 --yes

    drush -y vset preprocess_css 0
```


##### Module list

```bash
drush dl backup_migrate && drush enable backup_migrate

# /* BASIC */
admin_menu
module_filter
backup_migrate

# /* Basics */
block_class
ctools
devel
disable_breadcrumbs
ds
elements
entity
exclude_node_title
footer_sitemap
honeypot
html5_tools
jquery_update
l10n
libraries
media
menu_attributes
panels
pathauto
pathologic
save_edit
submitted_by
token
url
viewfield
views
webform
wysiwyg

# /* Fields */
email
field_collection
field_group
field_reference
viewfield

# /* Media */
media_browser_plus
media_colorbox
media_gallery
media_ted
media_youtube

# /* Imports */
nodeblock
extlink



# /* More */
fancycheckboxes
fontyourface
admin_language
advanced_help
backgroundfield
better_formats
bg_image
blockreference
checklistapi
colorbox
conditional_fields
contact_forms
content_access
context features
countries
countryicons
cpn
date
disable_breadcrumbs
domain
double_field
dynamic_background
emfield
features
field_slideshow
flag
fpa
front
globalredirect
google_analytics
i18n
imageblock
imagefield_focus
imce
imce_wysiwyg
insert_block
invite
languagefield
languageicons
link
linkit
migrate
multiform
multiupload_filefield_widget
multiupload_imagefield_widget
node_embed
node_limit
nodereference_url
office_hours
page_title
panelizer
panels_everywhere
permission_select
plupload
pm_existing_pages
publishcontent
readmorecontrol
redirect
references
requestinvitation
responsive_background
rss_permissions
rules
scheduler
semantic_fields
seo_checklist
serial
simple_field_formatter
simplehtmldom
site_map
special_menu_items
variable
views_slideshow
webform_node_element
wysiwyg_filter
xmlsitemap

# /* Meta Tags */
metatag
metatags_quick

# /* SEO */
alchemy
alchemy_contentanalysis
checklistapi
contentanalysis
contentoptimizer
insight
kwresearch
kwresearch_google
strongarm
wordstream
xmlsitemap
xmlsitemap_node

# /* Foro */
forum_access
chain_menu_access
acl


# /* Omega */
omega
omega_tools
```



##### Update Drush

```bash
    Descargar Drush
    Buscar el directorio de instalacion y remplazar los archivos por los nuevos
```


##### Fix Memory

```bash
    $ drush ev 'print(ini_get("memory_limit"));'
```
