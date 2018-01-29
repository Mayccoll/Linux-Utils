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


# - **shutter**
function_message_title '- **Install Shutter**'
sudo apt-get install -y libgoo-canvas-perl
sudo apt-get install -y shutter
sudo apt-get -f install -y
wait


# - **gpick**
function_message_title '- **Install gpick**'
sudo apt-get install -y gpick
wait


function_check_intall shutter
function_check_intall gpick
