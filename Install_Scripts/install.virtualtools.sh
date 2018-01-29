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


# - **VirtualBox**
function_message_title '- **VirtualBox**'
sudo apt-get install -y virtualbox-4.3
wait


# - **Puppet**
function_message_title '- **Puppet**'
sudo apt-get install -y puppet puppet-common
wait


# - **Docker**
#function_message_title '- **Docker**'
#sudo apt-get install -y docker.io
#wait


# - **Vagrant**
function_message_title '- **Vagrant**'
sudo apt-get install -y vagrant
wait
