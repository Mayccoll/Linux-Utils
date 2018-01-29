#!/bin/bash
SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Colors
# ==============================================

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


# Functions
# ==============================================

function_message_title () {
  echo -e "${CYAN}"
  echo -e "# | ::::::::::::::::::::::::::::::::::::::::::::: | #"
  echo -e "# |      ${RS} $1 ${CYAN}"
  echo -e "# | ::::::::::::::::::::::::::::::::::::::::::::: | #"
  echo -e "${RS}"
}

function_message_title_red () {
  echo -e "${RED} ››› ${RS} $1 ${RED} ‹‹‹ ${RS}  "
}

function_delete_beetwen () {
  eval XXXXXBEGIN="$1"
  eval XXXXXXXEND="$2"
  eval FILE_ZSH="$3"
  sed -e "/${XXXXXBEGIN}/,/${XXXXXXXEND}/d"  "${FILE_ZSH}" > "${FILE_ZSH}_tmp"
  cp "${FILE_ZSH}_tmp" "${FILE_ZSH}"
  rm "${FILE_ZSH}_tmp"
}


# Update
# ==============================================
function_message_title 'Run Apt-get Update'
sudo apt-get update


# Install
# ==============================================
function_message_title 'Installing ZSH'
zsh --version 2>&1 >/dev/null
CHECK=$?
if [ $CHECK -ne 0 ]; then
    sudo apt-get install -y zsh
else
    function_message_title_red 'zsh already install'
    zsh --version
fi


# Setting ZSH as the default shell (instead of bash)
# ==============================================
w=`which zsh` && h=`whoami` && sudo chsh -s $w $h


# - Install git if not present
# ==============================================
git --version 2>&1 >/dev/null
CHECK=$?
if [ $CHECK -ne 0 ]; then
    function_message_title 'Installing Git'
    sudo apt-get install -y git
else
    function_message_title_red 'Git already install'
    git --version
fi


# Install Oh-My-ZSH
# ==============================================
function_message_title 'Installing Oh-My-Zsh'
curl --version 2>&1 >/dev/null
CHECK=$?
if [ $CHECK -eq 0 ]; then
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash
else
  wget --no-check-certificate http://install.ohmyz.sh -O - | sh
fi


# - Cheack if .zshrc file is exist
# ==============================================
FILE_ZSH_CHECK="${HOME}/.zshrc"
if [[ -s $FILE_ZSH_CHECK ]] ; then
    echo "" > $FILE_ZSH_CHECK
fi


# Insert zshrc in zshrc
# ==============================================
FILE_ZSH="${HOME}/.zshrc"
XXXXXBEGIN='# |::::::::::::: oh-my-zsh ::::::::::::::>>>' # |<=== Config This
XXXXXXXEND='# |::::::::::::: oh-my-zsh ::::::::::::::<<<' # |<=== Config This
function_delete_beetwen "\${XXXXXBEGIN}" "\${XXXXXXXEND}" "\${FILE_ZSH}"

echo "${XXXXXBEGIN}" >> $FILE_ZSH
wget -qO- https://raw.githubusercontent.com/Mayccoll/Linux-Utils/master/Install_Files/zshrc >> $FILE_ZSH
echo "${XXXXXXXEND}" >> $FILE_ZSH


# Install Syntax highlighting
# ==============================================
function_message_title 'Install Syntax highlighting plugin'

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]] ; then
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
else
function_message_title_red 'Syntax highlighting plugin already install'
fi

# Install antigen
# ==============================================
function_message_title 'Installing Antigen'
if [[ ! -d ~/.antigen ]] ; then
cd ~ && git clone https://github.com/zsh-users/antigen.git .antigen
else
function_message_title_red 'Antigen already install'
fi


# Insert antigen in zshrc
# ==============================================
FILE_ZSH="${HOME}/.zshrc"
XXXXXBEGIN='# |::::::::::::: antigen ::::::::::::::>>>' # |<=== Config This
XXXXXXXEND='# |::::::::::::: antigen ::::::::::::::<<<' # |<=== Config This
function_delete_beetwen "\${XXXXXBEGIN}" "\${XXXXXXXEND}" "\${FILE_ZSH}"

echo "${XXXXXBEGIN}" >> $FILE_ZSH
wget -qO- https://raw.githubusercontent.com/Mayccoll/Linux-Utils/master/Install_Files/antigen.zshrc >> $FILE_ZSH
echo "${XXXXXXXEND}" >> $FILE_ZSH


# Install Fonts
# ==============================================
function_message_title 'Installing Fonts'
# Copy the awesome fonts to ~/.fonts
cd /tmp
git clone http://github.com/gabrielelana/awesome-terminal-fonts
cd awesome-terminal-fonts
git checkout patching-strategy
mkdir -p ~/.fonts
cp patched/*.ttf ~/.fonts

# update the font-info cache
sudo fc-cache -fv ~/.fonts


# Install mysql-colorize
# ==============================================
# function_message_title 'Installing Mysql-colorize'
# if [[ ! -d ~/.bash/mysql-colorize ]] ; then
# cd ~ && git clone https://github.com/horosgrisa/mysql-colorize.bash ~/.bash/mysql-colorize
# else
# function_message_title_red 'Mysql-colorize already install'
# fi
#
# FILE_ZSH="${HOME}/.zshrc"
# XXXXXBEGIN='# |::::::::::::: Mysql-colorize ::::::::::::::>>>' # |<=== Config This
# XXXXXXXEND='# |::::::::::::: Mysql-colorize ::::::::::::::<<<' # |<=== Config This
# function_delete_beetwen "\${XXXXXBEGIN}" "\${XXXXXXXEND}" "\${FILE_ZSH}"
#
# cat >> $HOME/.zshrc << "EOF"
# # |::::::::::::: Mysql-colorize ::::::::::::::>>>
# source ~/.bash/mysql-colorize/mysql-colorize.bash
# # |::::::::::::: Mysql-colorize ::::::::::::::<<<
# EOF
