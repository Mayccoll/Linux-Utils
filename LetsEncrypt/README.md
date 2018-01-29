# Let's Encrypt

## Install

Ubuntu 14.04

```
wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto
sudo mv certbot-auto /usr/bin/certbot
```

https://letsencrypt.org/

### Generate

```bash
./letsencrypt-auto certonly --webroot --text --agree-tos --renew-by-default \
    --rsa-key-size 4096 \
    --email EMAIL@EMAIL.COM \
    -w /PATH/www/ \
    -d DOMAIN.COM
```

### cPanel Install


```bash
# Certificate (CRT) is cert.pem
cat /etc/letsencrypt/live/DOMAIN.COM/cert.pem

# Private Key is privkey.pem
cat /etc/letsencrypt/live/DOMAIN.COM/privkey.pem

# Certificate Authority Bundle: (CABUNDLE) or CA is chain.pem
cat /etc/letsencrypt/live/DOMAIN.COM/chain.pem
```

### .htaccess

Option 1

```bash
# BEGIN Force SSL
# This should be the first rule before other rules
<IfModule mod_rewrite.c>
    RewriteEngine On

    RewriteCond %{HTTPS} !=on
    RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L]
</IfModule>
# END Force SSL
```

Option 2

```bash
# BEGIN Force SSL and non-www
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteCond %{HTTP_HOST} ^(?:www\.)?(.*)$ [NC]
RewriteRule (.*) https://%1%{REQUEST_URI} [L,R=301]
# END Force SSL
```
