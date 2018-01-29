# Apache

## Install

```bash
sudo apt install -y apache2
sudo a2enmod rewrite
sudo a2enmod proxy
sudo a2enmod proxy_http

sudo apt install -y libapache2-mod-php7.0
/etc/init.d/apache2 restart
```

## Remove

```bash
sudo service apache2 stop
sudo apt --purge remove apache2
sudo apt autoremove
```

### Test your configuration file for syntax

```bash
apache2ctl configtest
```

## Create Sub Domain

```bash
$ vim /etc/apache2/sites-available/SUB_DOMAIN.DOMAIN.com.conf
```

```bash
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/SUB_DOMAIN
    ServerName www.SUB_DOMAIN.DOMAIN.com
    ServerAlias SUB_DOMAIN.DOMAIN.com

    <Directory /var/www/html/SUB_DOMAIN/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

```bash
$ a2ensite SUB_DOMAIN.DOMAIN.com

$ /etc/init.d/apache2 restart
```

--------------------------------------------------------------------------------
### Apache folder pass

- http://www.htaccesstools.com/htpasswd-generator/

- http://www.htpasswdgenerator.net/


> .htaccess

+++
```bash
AuthName "intranet"
    AuthType Basic
    AuthUserFile PATH/intranet/.htpasswds
    Require valid-user
```

> .htpasswds

+++

```bash
USERLOGIN:$apr1$oxwfvojdrWgKVX4gqBRBRLsmSojCo71
```
--------------------------------------------------------------------------------

# Virtual Host

```bash
a2enmod proxy
a2enmod proxy_http
```


## Map Domain

```xml
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /media/disk2/data/digitalactive/files/www/digitalactive.info
    ServerName digitalactive.info
    ServerAlias www.digitalactive.info

    <Directory /media/disk2/data/digitalactive/files/www/digitalactive.info/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

## Map Subdomain to VM

```xml
<VirtualHost *:80>
    ServerName git.digitalactive.info
    ProxyPreserveHost On
    ProxyRequests Off
    <Proxy *>
        Order deny,allow
        Allow from all
    </Proxy>
    ProxyErrorOverride On
    ProxyPass / http://192.168.0.95/
    ProxyPassReverse / http://192.168.0.95/
    <Location />
        Order allow,deny
        Allow from all
    </Location>
</VirtualHost>
```

## Map to port

```xml
Listen 50000
<VirtualHost *:50000>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/nextcloud

    <Directory /var/www/nextcloud/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

     <IfModule mod_dav.c>
        Dav off
    </IfModule>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    SetEnv HOME /var/www/nextcloud
    SetEnv HTTP_HOME /var/www/nextcloud
</VirtualHost>
```

## Map x port  to 80

```xml
<VirtualHost *:80>
    ServerName cloud.digitalactive.info
    ProxyPreserveHost On
    ProxyRequests Off
    <Proxy *>
        Order deny,allow
        Allow from all
    </Proxy>
    ProxyErrorOverride On
    ProxyPass / http://127.0.0.1:50000/
    ProxyPassReverse / http://127.0.0.1:50000/
    <Location />
        Order allow,deny
        Allow from all
    </Location>
</VirtualHost>

```
