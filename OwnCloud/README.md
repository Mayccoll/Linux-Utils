# Owncloud


/home/digital/Apps/Owncloud/apps/owncloud/htdocs/config



## Owncloud - Bitnami

### Change URL

> INSTALLDIR/apps/owncloud/conf/httpd-prefix.conf

```bash
  +++
  DocumentRoot "/INSTALLDIR/apps/owncloud/htdocs"
  # Alias /owncloud/ "/INSTALLDIR/apps/owncloud/htdocs/"
  # Alias /owncloud "/INSTALLDIR/apps/owncloud/htdocs"
```

### Add trusted domains

> /INSTALLDIR/apps/owncloud/htdocs/config/config.php

```php
'trusted_domains' =>
  array (
    0 => '127.0.1.1:50000',
    1 => '127.0.1.1:51000',
    2 => '192.168.xxx.xxx',
    3 => '190.25.xxx.xxx',
  ),
```

### How to add files (ftp/ssh/scp)

```bash
  $
  cd /INSTALLDIR/Owncloud
  ./use_owncloud
  cd /INSTALLDIR/apps/owncloud/htdocs
  php console.php files:scan <user_id> #For rescanning a users file
  php console.php files:scan --all #For rescanning the files of all users
```

------

# NextCloud

### Scan and Add files

```bash
$ cd /var/www/nextcloud
$ sudo su -s /bin/bash www-data
$ ./occ files:scan USER
```
