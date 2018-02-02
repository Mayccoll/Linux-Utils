# Lamp

## Find config files

### MySQL

```bash
$ mysql --help | grep -A1 'Default options'
OR
$ mysqladmin --help | grep -A1 'Default options'
```

### PHP

```bash
$ php -i | grep "Loaded Configuration File"
$ php -i | grep "php.ini"
$ php -i | grep "memory"
```

### Apache

```bash
# ······· On CentOS/RHEL/Fedora ·······
$ apachectl -V | grep SERVER_CONFIG_FILE

# ······· On Debian/Ubuntu/Linux Mint ·······
$ apache2ctl -V | grep SERVER_CONFIG_FILE
```

## Config ini file

> php.ini

```bash
---
max_execution_time = 30
+++
max_execution_time = 300

---
memory_limit = 128M
+++
memory_limit = 512M

---
upload_max_filesize = 2M
+++
upload_max_filesize = 256M

---
post_max_size = 8M
+++
post_max_size = 256M

---
realpath_cache_size = 16k
+++
realpath_cache_size = 24M

---
realpath_cache_ttl = 120
+++
realpath_cache_ttl = 36000
```
