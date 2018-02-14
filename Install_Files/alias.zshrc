alias sudo='sudo '

alias ll='ls -Xalh --color=auto --group-directories-first'
alias la='ls -A --color=auto --group-directories-first'
alias l='ls -CF --color=auto --group-directories-first'
alias cc='clear'
alias c='clear'
alias ..='cd ..'

alias svim="sudo vim"       # Run vim as super user
alias ping='ping -c 5'      # Pings with 5 packets, not unlimited

# curl for useragents
alias iecurl="curl -H \"User-Agent: Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)\""
alias ffcurl="curl -H \"User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.8) Gecko/2009032609 Firefox/3.0.0 (.NET CLR 3.5.30729)\""

oo-extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)        tar xjf $1        ;;
            *.tar.gz)         tar xzf $1        ;;
            *.bz2)            bunzip2 $1        ;;
            *.rar)            unrar x $1        ;;
            *.gz)             gunzip $1         ;;
            *.tar)            tar xf $1         ;;
            *.tbz2)           tar xjf $1        ;;
            *.tgz)            tar xzf $1        ;;
            *.zip)            unzip $1          ;;
            *.Z)              uncompress $1     ;;
            *)                echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

alias oo-untar_file="tar -xzvf $1"

# untar on the same folder
oo-untar-here_file () {
    tar --strip-components=1 -zxvf "$1"
}

oo-ifconfig () {
    ip addr | sed -r ':a;N;$!ba;s/\n\s/ /g' \
        | sed -r -n -e 's/^([0-9]+):\s(\w+).*(link\/(\w+))\s[a-f0-9:.]{,17}\sbrd\s[a-f0-9:.]{,17}\s*(inet\s([0-9]{1,3}(\.[0-9]{1,3}){3})).*/- \2 \x1b[1;32m \6 \x1b[0m \4/p' -e 's/^([0-9]+):\s(\w+).*(link\/(\w+))\s[a-f0-9:.]{,17}\sbrd\s[a-f0-9:.]{,17}.*/- \2 \x1b[1m 0.0.0.0 \x1b[0m \4/p'
}

alias oo-rsync-local='rsync -vharP '
alias oo-rsync-local-rm-source='rsync -vharP --remove-source-files '
alias oo-rsync-remote='rsync -vharPz '

alias oo-rsync-help='echo "\e[0;33mRemote:\e[0m rsync -vharPz SOURCE DESTINATION \n\e[0;33mLocal:\e[0m  rsync -vharP SOURCE DESTINATION"'

alias oo-ip='ip addr list | grep eth0$'

alias oo-ram-free="echo ' echo 3 > /proc/sys/vm/drop_caches'"

alias oo-users="cat /etc/passwd | grep /home | cut -d: -f1"

alias oo-ssh="cat ~/.ssh/config"

#wget limit
oo-wget_limit_url () {
    wget --limit-rate="$1"k "$2"
}

oo-mkdir_cd () {
    mkdir "$1" && cd "$1"
}

oo-ssh-keygen_comm () {
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/"$1" -C "$1"
}

oo-lamp-config-files () {
    mysql --help | grep -A1 'Default options'
    php -i | grep "Loaded Configuration File"
    apache2ctl -V | grep SERVER_CONFIG_FILE
}

# |
# | Alias Git
# |:::::::::::::::::::::::::::::::::::::::::::::::::|

clone () {
    url=$1;
    reponame=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//');
    git clone $url $reponame;
    cd $reponame;
}
oo-git () {
    echo ""
    echo "git--i             = git status &&  echo '\\\n' && git ls-files -v | grep '^[[:lower:]]'"
    echo "git--l             = git log --graph --pretty=oneline --abbrev-commit"
    echo "git--ll            = git log --pretty=oneline --abbrev=9 -15"
    echo "git--log           = git log --pretty=oneline --abbrev-commit"
    echo "git--log-cant-user = git shortlog -s -n"
    echo "git--unpush        = git log origin/master..HEAD --oneline"
    echo "git--unpull        = git log HEAD..origin/master --oneline"
    echo "git--lme           = git log --merges --oneline -20"
    echo "git--lstat         = git log --pretty=format:'%h - %ar - %an, : %s' -30"
    echo "git--count-b-ups   = git log HEAD..upstream/master --oneline | wc -l "
}

oo-git-i-help () {
    echo "git update-index --assume-unchanged <filename>"
    echo ""
    echo "git update-index --no-assume-unchanged <filename>"
}

alias git--i="git status &&  echo '\n' && git ls-files -v | grep '^[[:lower:]]'"
alias git--l="git log --graph --pretty=oneline --abbrev-commit --abbrev=9"
alias git--ll="git log --pretty=oneline --abbrev=9 -15"
alias git--log="git log --pretty=oneline --abbrev-commit --abbrev=9 $1"
alias git--log-cant-user="git shortlog -s -n"
alias git--unpush="git log origin/master..HEAD --oneline"
alias git--unpull="git log HEAD..origin/master --oneline"
alias git--unpull-upstream="git log HEAD..upstream/master --oneline"
alias git--lme="git log --merges --oneline -20"
alias git--lstat="git log --pretty=format:'%Cred%h%Creset - %Cgreen%ar %Creset- %an, : %s %C(yellow)%d' -30"
alias oo-count-b-ups="echo -e ' Behine upstream \e[0;31m' && git log HEAD..upstream/master --oneline | wc -l && echo -e '\e[0m Commits'"




# |
# | Print all colors in console
# |:::::::::::::::::::::::::::::::::::::::::::::::::|

oo-colors () {

    echo "# Reset color"
    echo -e "\e[0m ***** AaBbCs *** \[\\\e[0m\] *** \\\e[0m \\e[0m ---> rs"

    echo ""
    echo "# Regularcolors"

    #black
    echo -e "\e[0;30m ***** AaBbCs *** \[\\\e[0;30m\] *** \\\e[0;30m \\e[0m ---> black"
    #red
    echo -e "\e[0;31m ***** AaBbCs *** \[\\\e[0;31m\] *** \\\e[0;31m \\e[0m ---> red"
    #green
    echo -e "\e[0;32m ***** AaBbCs *** \[\\\e[0;32m\] *** \\\e[0;32m \\e[0m ---> green"
    #yellow
    echo -e "\e[0;33m ***** AaBbCs *** \[\\\e[0;33m\] *** \\\e[0;33m \\e[0m ---> yellow"
    #blue
    echo -e "\e[0;34m ***** AaBbCs *** \[\\\e[0;34m\] *** \\\e[0;34m \\e[0m ---> blue"
    #purple
    echo -e "\e[0;35m ***** AaBbCs *** \[\\\e[0;35m\] *** \\\e[0;35m \\e[0m ---> purple"
    #cyan
    echo -e "\e[0;36m ***** AaBbCs *** \[\\\e[0;36m\] *** \\\e[0;36m \\e[0m ---> cyan"
    #white
    echo -e "\e[0;37m ***** AaBbCs *** \[\\\e[0;37m\] *** \\\e[0;37m \\e[0m ---> white"

    echo ""
    echo "# Bold"

    #black
    echo -e "\e[1;30m ***** AaBbCs *** \[\\\e[1;30m\] *** \\\e[1;30m \\e[0m ---> bblack"
    #red
    echo -e "\e[1;31m ***** AaBbCs *** \[\\\e[1;31m\] *** \\\e[1;31m \\e[0m ---> bred"
    #green
    echo -e "\e[1;32m ***** AaBbCs *** \[\\\e[1;32m\] *** \\\e[1;32m \\e[0m ---> bgreen"
    #yellow
    echo -e "\e[1;33m ***** AaBbCs *** \[\\\e[1;33m\] *** \\\e[1;33m \\e[0m ---> byellow"
    #blue
    echo -e "\e[1;34m ***** AaBbCs *** \[\\\e[1;34m\] *** \\\e[1;34m \\e[0m ---> bblue"
    #purple
    echo -e "\e[1;35m ***** AaBbCs *** \[\\\e[1;35m\] *** \\\e[1;35m \\e[0m ---> bpurple"
    #cyan
    echo -e "\e[1;36m ***** AaBbCs *** \[\\\e[1;36m\] *** \\\e[1;36m \\e[0m ---> bcyan"
    #white
    echo -e "\e[1;37m ***** AaBbCs *** \[\\\e[1;37m\] *** \\\e[1;37m \\e[0m ---> bwhite"

    echo ""
    echo "# Underline"

    #black
    echo -e "\e[4;30m ***** AaBbCs *** \[\\\e[4;30m\] *** \\\e[4;30m \\e[0m ---> ublack"
    #red
    echo -e "\e[4;31m ***** AaBbCs *** \[\\\e[4;31m\] *** \\\e[4;31m \\e[0m ---> ured"
    #green
    echo -e "\e[4;32m ***** AaBbCs *** \[\\\e[4;32m\] *** \\\e[4;32m \\e[0m ---> ugreen"
    #yellow
    echo -e "\e[4;33m ***** AaBbCs *** \[\\\e[4;33m\] *** \\\e[4;33m \\e[0m ---> uyellow"
    #blue
    echo -e "\e[4;34m ***** AaBbCs *** \[\\\e[4;34m\] *** \\\e[4;34m \\e[0m ---> ublue"
    #purple
    echo -e "\e[4;35m ***** AaBbCs *** \[\\\e[4;35m\] *** \\\e[4;35m \\e[0m ---> upurple"
    #cyan
    echo -e "\e[4;36m ***** AaBbCs *** \[\\\e[4;36m\] *** \\\e[4;36m \\e[0m ---> ucyan"
    #white
    echo -e "\e[4;37m ***** AaBbCs *** \[\\\e[4;37m\] *** \\\e[4;37m \\e[0m ---> uwhite"

    echo ""
    echo "# Background"

    #black
    echo -e "\e[40m ***** AaBbCs *** \[\\\e[40m\] *** \\\e[40m \\e[0m ---> on_black"
    #red
    echo -e "\e[41m ***** AaBbCs *** \[\\\e[41m\] *** \\\e[41m \\e[0m ---> on_red"
    #green
    echo -e "\e[42m ***** AaBbCs *** \[\\\e[42m\] *** \\\e[42m \\e[0m ---> on_green"
    #yellow
    echo -e "\e[43m ***** AaBbCs *** \[\\\e[43m\] *** \\\e[43m \\e[0m ---> on_yellow"
    #blue
    echo -e "\e[44m ***** AaBbCs *** \[\\\e[44m\] *** \\\e[44m \\e[0m ---> on_blue"
    #purple
    echo -e "\e[45m ***** AaBbCs *** \[\\\e[45m\] *** \\\e[45m \\e[0m ---> on_purple"
    #cyan
    echo -e "\e[46m ***** AaBbCs *** \[\\\e[46m\] *** \\\e[46m \\e[0m ---> on_cyan"
    #white
    echo -e "\e[47m ***** AaBbCs *** \[\\\e[47m\] *** \\\e[47m \\e[0m ---> on_white"

    echo ""
    echo "# Highintensity"

    #black
    echo -e "\e[0;90m ***** AaBbCs *** \[\\\e[0;90m\] *** \\\e[0;90m \\e[0m ---> iblack"
    #red
    echo -e "\e[0;91m ***** AaBbCs *** \[\\\e[0;91m\] *** \\\e[0;91m \\e[0m ---> ired"
    #green
    echo -e "\e[0;92m ***** AaBbCs *** \[\\\e[0;92m\] *** \\\e[0;92m \\e[0m ---> igreen"
    #yellow
    echo -e "\e[0;93m ***** AaBbCs *** \[\\\e[0;93m\] *** \\\e[0;93m \\e[0m ---> iyellow"
    #blue
    echo -e "\e[0;94m ***** AaBbCs *** \[\\\e[0;94m\] *** \\\e[0;94m \\e[0m ---> iblue"
    #purple
    echo -e "\e[0;95m ***** AaBbCs *** \[\\\e[0;95m\] *** \\\e[0;95m \\e[0m ---> ipurple"
    #cyan
    echo -e "\e[0;96m ***** AaBbCs *** \[\\\e[0;96m\] *** \\\e[0;96m \\e[0m ---> icyan"
    #white
    echo -e "\e[0;97m ***** AaBbCs *** \[\\\e[0;97m\] *** \\\e[0;97m \\e[0m ---> iwhite"

    echo ""
    echo "# Boldhighintensity"

    #black
    echo -e "\e[1;90m ***** AaBbCs *** \[\\\e[1;90m\] *** \\\e[1;90m \\e[0m ---> biblack"
    #red
    echo -e "\e[1;91m ***** AaBbCs *** \[\\\e[1;91m\] *** \\\e[1;91m \\e[0m ---> bired"
    #green
    echo -e "\e[1;92m ***** AaBbCs *** \[\\\e[1;92m\] *** \\\e[1;92m \\e[0m ---> bigreen"
    #yellow
    echo -e "\e[1;93m ***** AaBbCs *** \[\\\e[1;93m\] *** \\\e[1;93m \\e[0m ---> biyellow"
    #blue
    echo -e "\e[1;94m ***** AaBbCs *** \[\\\e[1;94m\] *** \\\e[1;94m \\e[0m ---> biblue"
    #purple
    echo -e "\e[1;95m ***** AaBbCs *** \[\\\e[1;95m\] *** \\\e[1;95m \\e[0m ---> bipurple"
    #cyan
    echo -e "\e[1;96m ***** AaBbCs *** \[\\\e[1;96m\] *** \\\e[1;96m \\e[0m ---> bicyan"
    #white
    echo -e "\e[1;97m ***** AaBbCs *** \[\\\e[1;97m\] *** \\\e[1;97m \\e[0m ---> biwhite"

    echo ""
    echo "# Highintensitybackgrounds"

    #black
    echo -e "\e[0;100m ***** AaBbCs *** \[\\\e[0;100m\] *** \\\e[0;100m \\e[0m ---> on_iblack"
    #red
    echo -e "\e[0;101m ***** AaBbCs *** \[\\\e[0;101m\] *** \\\e[0;101m \\e[0m ---> on_ired"
    #green
    echo -e "\e[0;102m ***** AaBbCs *** \[\\\e[0;102m\] *** \\\e[0;102m \\e[0m ---> on_igreen"
    #yellow
    echo -e "\e[0;103m ***** AaBbCs *** \[\\\e[0;103m\] *** \\\e[0;103m \\e[0m ---> on_iyellow"
    #blue
    echo -e "\e[0;104m ***** AaBbCs *** \[\\\e[0;104m\] *** \\\e[0;104m \\e[0m ---> on_iblue"
    #purple
    echo -e "\e[0;105m ***** AaBbCs *** \[\\\e[0;105m\] *** \\\e[0;105m \\e[0m ---> on_ipurple"
    #cyan
    echo -e "\e[0;106m ***** AaBbCs *** \[\\\e[0;106m\] *** \\\e[0;106m \\e[0m ---> on_icyan"
    #white
    echo -e "\e[0;107m ***** AaBbCs *** \[\\\e[0;107m\] *** \\\e[0;107m \\e[0m ---> on_iwhite"

}

color () {
    # echo ""
    #black
    echo -e "\e[0;30m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 01 0;30m"
    #red
    echo -e "\e[0;31m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 02 0;31m"
    #green
    echo -e "\e[0;32m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 03 0;32m"
    #yellow
    echo -e "\e[0;33m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 04 0;33m"
    #blue
    echo -e "\e[0;34m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 05 0;34m"
    #purple
    echo -e "\e[0;35m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 06 0;35m"
    #cyan
    echo -e "\e[0;36m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 07 0;36m"
    #white
    echo -e "\e[0;37m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 08 0;37m"
    echo ""
    #black
    echo -e "\e[1;30m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 09 1;30m"
    #red
    echo -e "\e[1;31m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 10 1;31m"
    #green
    echo -e "\e[1;32m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 11 1;32m"
    #yellow
    echo -e "\e[1;33m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 12 1;33m"
    #blue
    echo -e "\e[1;34m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 13 1;34m"
    #purple
    echo -e "\e[1;35m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 14 1;35m"
    #cyan
    echo -e "\e[1;36m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 15 1;36m"
    #white
    echo -e "\e[1;37m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 16 1;37m"
    echo ""
    echo -e "\e[0;30m█████\\e[0m\e[0;31m█████\\e[0m\e[0;32m█████\\e[0m\e[0;33m█████\\e[0m\e[0;34m█████\\e[0m\e[0;35m█████\\e[0m\e[0;36m█████\\e[0m\e[0;37m█████\\e[0m"
    echo -e "\e[0m\e[1;30m█████\\e[0m\e[1;31m█████\\e[0m\e[1;32m█████\\e[0m\e[1;33m█████\\e[0m\e[1;34m█████\\e[0m\e[1;35m█████\\e[0m\e[1;36m█████\\e[0m\e[1;37m█████\\e[0m"
}

# |::::::::::::: alias ::::::::::::::<<<
PATH="$HOME/.local/bin:$PATH"

# |::::::::::::: Disable Ansible Cow ::::::::::::::<<<
export ANSIBLE_NOCOWS=1
