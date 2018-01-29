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


function_message_title '- **Installing Salt**'

sudo apt-get install -y python-software-properties

sudo add-apt-repository -y ppa:saltstack/salt

sudo apt-get update

sudo apt-get install -y salt-master

sudo apt-get install -y salt-minion

sudo apt-get install -y salt-syndic


# || Localhost

# 1. $ vim /etc/salt/minion
# 2. uncomment:
#        #master: salt
#    change to:
#         master: localhost
# 3. $ service salt-minion restart
# 4. $ salt-key -L
# 5. $ salt-key -a 'YOURHOSTNAME'
# 6. $ salt '*' test.ping
