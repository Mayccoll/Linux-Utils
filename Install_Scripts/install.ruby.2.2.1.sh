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
wait

# - **Ruby**
function_message_title '- **Install Ruby 2.2.1**'
sudo apt-get remove --purge -y ruby
cd
wget http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.1.tar.gz
tar -xzvf ruby-2.2.1.tar.gz
cd ruby-2.2.1/
./configure
make
sudo make install
ruby -v
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

ruby --version
