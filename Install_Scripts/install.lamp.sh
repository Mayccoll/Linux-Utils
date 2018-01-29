#!/bin/bash

# Reset color
RS="\e[0m"
# Basic Colors
BLACK="\e[0;30m"
RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
BLUE="\e[0;34m"
PURPLE="\e[0;35m"
CYAN="\e[0;36m"
WHITE="\e[0;37m"

function_message_title () {
  echo -e "${CYAN}"
  echo -e "# | ::::::::::::::::::::::::::::::::::::::::::::: | #"
  echo -e "# |      ${RS} $1 ${CYAN}"
  echo -e "# | ::::::::::::::::::::::::::::::::::::::::::::: | #"
  echo -e "${RS}"
}

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# - **update**
sudo apt update


# - **Apache2**
function_message_title '- **Installing Apache2**'
sudo apt-get install -y apache2
wait


# - **PHP**
function_message_title '- **Installing PHP**'
sudo apt-get install -y libapache2-mod-php5  php-apc  php-pear  php5  php5-cli  php5-common  php5-curl  php5-dev  php5-fpm  php5-gd  php5-geoip  php5-imagick  php5-imap  php5-intl  php5-mcrypt  php5-memcache  php5-memcached  php5-sqlite  php5-tidy  php5-xdebug
wait


# - **Mysql**
function_message_title '- **Installing MySql**'
sudo apt-get install -y mysql-server php5-mysql
wait

