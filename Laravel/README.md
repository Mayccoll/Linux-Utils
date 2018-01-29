# Laravel Homestead

```bash
sudo apt install -y \
                php7.0 \
                php7.0-fpm \
                php7.0-mysql \
                php7.0-sqlite3 \
                php7.0-mcrypt \
                php7.0-mbstring \
                php7.0-xml \
                php7.0-curl \
										php7.0-zip \
                mcrypt

curl -sS https://getcomposer.org/installer | php

sudo mv composer.phar /usr/bin/composer

composer global require "laravel/installer=~1.1"

echo 'export PATH="$PATH:$HOME/.config/composer/vendor/bin"' >> ${HOME}/.zshrc

echo 'alias artisan="php artisan"' >> ${HOME}/.zshrc
```

```bash
$ vagrant box add laravel/homestead

$ composer global require "laravel/installer"
```


###  Create Project

```bash
$ mkdir PROJECT

$ cd PROJECT

$ composer create-project laravel/laravel

$ composer require laravel/homestead

$ php vendor/bin/homestead make
```
