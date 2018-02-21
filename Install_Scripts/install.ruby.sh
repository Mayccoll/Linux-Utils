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
  echo -e "# |  ${RS}$1 ${CYAN}"
  echo -e "# | ::::::::::::::::::::::::::::::::::::::::::::: | #"
  echo -e "${RS}"
}

function_delete_beetwen () {
  eval XXXXXBEGIN="$1"
  eval XXXXXXXEND="$2"
  eval FILE_ZSH="$3"
  sed -e "/${XXXXXBEGIN}/,/${XXXXXXXEND}/d"  "${FILE_ZSH}" > "${FILE_ZSH}_tmp"
  cp "${FILE_ZSH}_tmp" "${FILE_ZSH}"
  rm "${FILE_ZSH}_tmp"
}

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function_message_title 'This script will install Ruby 2.5.0 and rvm'

read -r -p "Do you want to continue [Y/n]? " response

case "$response" in
    [yY][eE][sS]|[yY])

# - **update**
sudo apt update
wait

# - **Ruby**
function_message_title '- **Install Rvm and Ruby 2.5.0**'
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
wait


# Insert ruby rvm path in zshrc
# ==============================================
FILE_ZSH_CHECK="${HOME}/.zshrc"
if [[ -s $FILE_ZSH_CHECK ]] ; then
FILE_ZSH="${HOME}/.zshrc"
XXXXXBEGIN='# |::::::::::::: ruby rvm ::::::::::::::>>>' # |<=== Config This
XXXXXXXEND='# |::::::::::::: ruby rvm ::::::::::::::<<<' # |<=== Config This
function_delete_beetwen "\${XXXXXBEGIN}" "\${XXXXXXXEND}" "\${FILE_ZSH}"

echo "${XXXXXBEGIN}" >> $FILE_ZSH
echo "source ~/.rvm/scripts/rvm" >> $FILE_ZSH
echo "${XXXXXXXEND}" >> $FILE_ZSH
fi

source ~/.rvm/scripts/rvm
wait
rvm install 2.5.0
wait
rvm use 2.5.0
source ~/.rvm/scripts/rvm
source ~/.zshrc

ruby --version

    ;;
    *)
    echo "exit"
    ;;
esac
