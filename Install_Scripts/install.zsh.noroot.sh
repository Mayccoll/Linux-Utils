#!/bin/bash

# - colors
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


SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function_message_title () {
  echo -e "${CYAN}"
  echo -e "# | ::::::::::::::::::::::::::::::::::::::::::::: | #"
  echo -e "# |      ${RS} $1 ${CYAN}"
  echo -e "# | ::::::::::::::::::::::::::::::::::::::::::::: | #"
  echo -e "${RS}"
}

function_message_red () {
  echo -e "${RED}"
  echo -e "# | ::::::::::::::::::::::::::::::::::::::::::::: | #"
  echo -e "# |      ${RS} $1 ${RED}"
  echo -e "# | ::::::::::::::::::::::::::::::::::::::::::::: | #"
  echo -e "${RS}"
}


# - Set zsh
# ==============================================
cat >> $HOME/.bash_profile << "EOF"
# |::::::::::::::::::>>>proftv
export SHELL=/bin/zsh
exec /bin/zsh -l
# |::::::::::::::::::<<<proftv
EOF


# - Install git if not present
# ==============================================
git --version
CHECK=$?
if [ $CHECK -ne 0 ]; then
    function_message_red 'Git is not installed'
    exit
fi


# Install Oh-My-ZSH
# ==============================================


function_message_title 'Installing Oh-My-Zsh'
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc



# Delete text beetwen 2 words
# ==============================================
FILEDEL="${HOME}/.zshrc"
WORD1='# |::::::::::::::::::>>>oh-my-zsh' # |<=== Config This
WORD2='# |::::::::::::::::::<<<oh-my-zsh' # |<=== Config This

sed -e "/${WORD1}/,/${WORD2}/d"  "${FILEDEL}" > "${FILEDEL}_tmp"
cp "${FILEDEL}_tmp" "${FILEDEL}"
rm "${FILEDEL}_tmp"


# Install Oh-My-ZSH - Add
# ==============================================
cat >> $HOME/.zshrc << "EOF"

# |::::::::::::::::::>>>oh-my-zsh
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# define where custom plugins live:
ZSH_CUSTOM=~/.oh-my-zsh/custom/
# Auto Update Enable
DISABLE_UPDATE_PROMPT=true

ZSH_THEME="robbyrussell"

plugins=(git archlinux django sublime themes python pip node npm history-substring-search zsh-syntax-highlighting vagrant)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"


# |::::::::::::::::::>>>oh-my-zsh
EOF


# Syntax highlighting
# ==============================================
function_message_title 'Syntax Highlighting'
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git


# Install antigen
# ==============================================
function_message_title 'Installing Antigen'
cd ~ && git clone git://github.com/zsh-users/antigen.git .antigen


# Delete text beetwen 2 words
# ==============================================
FILEDEL="${HOME}/.zshrc"
WORD1='# |::::::::::::::::::>>>antigen' # |<=== Config This
WORD2='# |::::::::::::::::::<<<antigen' # |<=== Config This

sed -e "/${WORD1}/,/${WORD2}/d"  "${FILEDEL}" > "${FILEDEL}_tmp"
cp "${FILEDEL}_tmp" "${FILEDEL}"
rm "${FILEDEL}_tmp"


# Install antigen - Add
# ==============================================
cat >> $HOME/.zshrc << "EOF"

# |::::::::::::::::::>>>antigen

#
# | Load Antigen
#
source $HOME/.antigen/antigen.zsh

#
# | Load various lib files
#
antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundle command-not-found
antigen bundle fabric
antigen bundle heroku
antigen bundle kennethreitz/autoenv
antigen bundle lein
antigen bundle pip
antigen bundle rake
antigen bundle rvm
antigen bundle sprunge
antigen bundle vundle
antigen bundle bundler
antigen bundle node
antigen bundle npm
antigen bundle python
antigen bundle history
antigen bundle rsync
antigen-bundle vagrant
antigen bundle git

antigen-bundle arialdomartini/oh-my-git

antigen-bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src
antigen-bundle zsh-users/zsh-history-substring-search

#
# 1 Antigen Theme
#
antigen theme Mayccoll/oh-my-git-themes remol

antigen-apply
# |::::::::::::::::::<<<antigen
EOF


# ------------------------------------------------------
# || no root
#

#    cat <<-EOF >> $HOME/.bash_profile
#    # |::::::::::::::::::>>>proftv
#    export SHELL=/bin/zsh
#    exec /bin/zsh -l
#    # |::::::::::::::::::<<<proftv
#    EOF
