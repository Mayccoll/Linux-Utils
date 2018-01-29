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

function_check_intall () {
    type -P $1 &>/dev/null && echo -e  "- Installed - ${GREEN} Ok ${RS} - $1" || echo -e  "- Install - ${RED} No ${RS} - $1"
}

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


# - **update**
sudo apt-get update

# - **Progress bar**
function_message_title '- **Progress bar**'
echo 'Dpkg::Progress-Fancy "1";' | sudo tee /etc/apt/apt.conf.d/99progressbar


# - **Extras**
function_message_title '- **Extras**'
sudo apt-get install -y software-properties-common python-software-properties
wait

sudo apt-get -f install -y
wait


# - **Git**
function_message_title '- **Git**'
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git
wait


# - **Curl**
function_message_title '- **Curl**'
sudo apt-get install -y curl
wait


# - **Vim**
function_message_title '- **Vim**'
sudo apt-get install -y vim
wait


# - **Htop**
function_message_title '- **Htop**'
sudo apt-get install -y htop
wait


# - **Tree**
function_message_title '- **Tree**'
sudo apt-get install -y tree
wait


# - **ack**
function_message_title '- **Ack**'
sudo apt-get install -y ack-grep
sudo ln -s /usr/bin/ack-grep /usr/bin/ack
wait

function_check_intall git
function_check_intall curl
function_check_intall vim
function_check_intall htop
function_check_intall tree
