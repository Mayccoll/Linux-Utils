
mysql-server
mysql-client
php5
php5-fpm
php5-mysql
phpmyadmin
libapache2-mod-auth-mysql


sudo apt-get install mysql-server mysql-client php5 php5-fpm php5-mysql phpmyadmin libapache2-mod-auth-mysql


#### Confing php.ini


> php.ini

> /etc/php5/fpm/php.ini

```bash
---
max_execution_time = 30
+++
max_execution_time = 180

--- 
memory_limit = 128M
+++
memory_limit = 512M

---
upload_max_filesize = 2M
+++
upload_max_filesize = 128M

---
post_max_size = 8M
+++
post_max_size = 256M

---
realpath_cache_size = 16k
+++
realpath_cache_size = 24M
```



####  Default

```bash
# You may add here your
# server {
#   ...
# }
# statements for each of your virtual hosts to this file

##
# You should look at the following URL's in order to grasp a solid understanding
# of Nginx configuration files in order to fully unleash the power of Nginx.
# http://wiki.nginx.org/Pitfalls
# http://wiki.nginx.org/QuickStart
# http://wiki.nginx.org/Configuration
#
# Generally, you will want to move this file somewhere, and start with a clean
# file but keep this around for reference. Or just disable in sites-enabled.
#
# Please see /usr/share/doc/nginx-doc/examples/ for more detailed examples.
##

server {
    #listen   80; ## listen for ipv4; this line is default and implied
    #listen   [::]:80 default_server ipv6only=on; ## listen for ipv6

    client_max_body_size 128M;

    root /usr/share/nginx/www;
    index index.html index.htm;

    # Make site accessible from http://localhost/
    server_name 15.185.175.186;

    location / {
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404.
        try_files $uri $uri/ /index.html;
        # Uncomment to enable naxsi on this location
        # include /etc/nginx/naxsi.rules
    }

    location /doc/ {
        alias /usr/share/doc/;
        autoindex on;
        allow 127.0.0.1;
        allow ::1;
        deny all;
    }

    # Only for nginx-naxsi used with nginx-naxsi-ui : process denied requests
    #location /RequestDenied {
    #   proxy_pass http://127.0.0.1:8080;
    #}

    #error_page 404 /404.html;

    # redirect server error pages to the static page /50x.html
    #
    #error_page 500 502 503 504 /50x.html;
    #location = /50x.html {
    #   root /usr/share/nginx/www;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ .php$ {
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_index  index.php;
        include        fastcgi_params;
        fastcgi_param PHP_VALUE "upload_max_filesize = 128M \n post_max_size=256M \n max_execution_time = 180 \n memory_limit = 512M \n realpath_cache_size = 24M";
    }

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #   deny all;
    #}

    location /phpmyadmin {
        root /usr/share/;
        index index.php index.html index.htm;

        location ~ ^/phpmyadmin/(.+\.php)$ {
            try_files $uri =404;
            fastcgi_pass   unix:/var/run/php5-fpm.sock;
            include fastcgi_params;
            fastcgi_param PHP_VALUE "upload_max_filesize = 128M \n post_max_size=256M \n max_execution_time = 180 \n memory_limit = 512M \n realpath_cache_size = 24M";
        }
    }
}


# another virtual host using mix of IP-, name-, and port-based configuration
#
#server {
#   listen 8000;
#   listen somename:8080;
#   server_name somename alias another.alias;
#   root html;
#   index index.html index.htm;
#
#   location / {
#       try_files $uri $uri/ =404;
#   }
#}


# HTTPS server
#
#server {
#   listen 443;
#   server_name localhost;
#
#   root html;
#   index index.html index.htm;
#
#   ssl on;
#   ssl_certificate cert.pem;
#   ssl_certificate_key cert.key;
#
#   ssl_session_timeout 5m;
#
#   ssl_protocols SSLv3 TLSv1;
#   ssl_ciphers ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv3:+EXP;
#   ssl_prefer_server_ciphers on;
#
#   location / {
#       try_files $uri $uri/ =404;
#   }
#}

```

### Sub-domain

```bash
server {
        listen   80;

        root /home/migueldavidq/www/desarrollo;
        index index.php index.html index.htm;

        server_name desarrollo.mozillacolombia.org;

        error_page 404 /404.html;

        error_page 500 502 503 504 /50x.html;

        location / {
            try_files $uri $uri/ /index.php?q=$uri&$args;
        }

        location = /50x.html {
            root /home/migueldavidq/www/desarrollo;
        }

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        location ~ \.php$ {
            try_files $uri =404;
            #fastcgi_pass 127.0.0.1:9000;
            # With php5-fpm:
            fastcgi_pass unix:/var/run/php5-fpm.sock;
            fastcgi_index index.php;
            include fastcgi_params;
        }

}
```
