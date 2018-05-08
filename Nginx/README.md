#### Confing php.ini

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
