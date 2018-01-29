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
sudo apt update
wait


# - **pyrenamer**
# Rename Files
function_message_title '- **pyrenamer**'
sudo apt-get install -y pyrenamer
wait


# - **DaemonFSk**
# DaemonFS is a real time file watcher.
function_message_title '- **DaemonFSk**'
sudo apt-get install -y daemonfs
wait


# - **Gufw**
# Firewall
function_message_title '- **Gufw**'
sudo apt-get install -y  gufw
wait


# - **Viewnior**
# Image viewer
function_message_title '- **Viewnior**'
URL='https://launchpad.net/~gilir/+archive/lubuntu/+files/viewnior_1.3.0-0ubuntu1%7Eppa1_amd64.deb'
FILE=`mktemp`
wget "$URL" -qO $FILE
sudo dpkg -i $FILE
rm $FILE
wait


# - **Nemo Rabbitvcs**
function_message_title '- **Install Nemo Rabbitvcs**'
sudo apt-get install -y nemo-rabbitvcs
wait


function_check_intall pyrenamer
function_check_intall daemonfs
function_check_intall gufw
function_check_intall viewnior
