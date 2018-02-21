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


SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function_message_title () {
  echo -e "${CYAN}"
  echo -e "# | ::::::::::::::::::::::::::::::::::::::::::::: | #"
  echo -e "# |      ${RS} $1 ${CYAN}"
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



# - **Install Stars**
# ==============================================

function_message_title '- Install Stars -'

read -r -p "Do you want to continue [Y/n]? " response

case "$response" in
    [yY][eE][sS]|[yY])

FILE_ZSH="${HOME}/.zshrc"
XXXXXBEGIN='# |::::::::::::: stars ::::::::::::::>>>' # |<=== Config This
XXXXXXXEND='# |::::::::::::: stars ::::::::::::::<<<' # |<=== Config This
function_delete_beetwen "\${XXXXXBEGIN}" "\${XXXXXXXEND}" "\${FILE_ZSH}"
echo "${XXXXXBEGIN}" >> $FILE_ZSH
wget -qO- https://raw.githubusercontent.com/Mayccoll/Linux-Utils/master/Install_Files/stars.zshrc >> $FILE_ZSH
echo "${XXXXXXXEND}" >> $FILE_ZSH


    ;;
    *)
    echo "exit"
    ;;
esac
