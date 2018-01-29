# |
# | CONFIG
# |:::::::::::::::::::::::::::::::::::::::::::::::::|


machine=red
title_machine="VM"


# |
# | PATH
# |:::::::::::::::::::::::::::::::::::::::::::::::::|

export PATH="~/:~/.bin:/usr/local/bin:$PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting



# |
# | Colors
# |:::::::::::::::::::::::::::::::::::::::::::::::::|

# Reset color
rs="\[\e[0m\]"


#regularcolors

#black
black="\[\e[0;30m\]"
#red
red="\[\e[0;31m\]"
#green
green="\[\e[0;32m\]"
#yellow
yellow="\[\e[0;33m\]"
#blue
blue="\[\e[0;34m\]"
#purple
purple="\[\e[0;35m\]"
#cyan
cyan="\[\e[0;36m\]"
#white
white="\[\e[0;37m\]"




#bold

#black
bblack="\[\e[1;30m\]"
#red
bred="\[\e[1;31m\]"
#green
bgreen="\[\e[1;32m\]"
#yellow
byellow="\[\e[1;33m\]"
#blue
bblue="\[\e[1;34m\]"
#purple
bpurple="\[\e[1;35m\]"
#cyan
bcyan="\[\e[1;36m\]"
#white
bwhite="\[\e[1;37m\]"



#underline

#black
ublack="\[\e[4;30m\]"
#red
ured="\[\e[4;31m\]"
#green
ugreen="\[\e[4;32m\]"
#yellow
uyellow="\[\e[4;33m\]"
#blue
ublue="\[\e[4;34m\]"
#purple
upurple="\[\e[4;35m\]"
#cyan
ucyan="\[\e[4;36m\]"
#white
uwhite="\[\e[4;37m\]"



#background

#black
on_black="\[\e[40m\]"
#red
on_red="\[\e[41m\]"
#green
on_green="\[\e[42m\]"
#yellow
on_yellow="\[\e[43m\]"
#blue
on_blue="\[\e[44m\]"
#purple
on_purple="\[\e[45m\]"
#cyan
on_cyan="\[\e[46m\]"
#white
on_white="\[\e[47m\]"



#highintensity

#black
iblack="\[\e[0;90m\]"
#red
ired="\[\e[0;91m\]"
#green
igreen="\[\e[0;92m\]"
#yellow
iyellow="\[\e[0;93m\]"
#blue
iblue="\[\e[0;94m\]"
#purple
ipurple="\[\e[0;95m\]"
#cyan
icyan="\[\e[0;96m\]"
#white
iwhite="\[\e[0;97m\]"



#boldhighintensity

#black
biblack="\[\e[1;90m\]"
#red
bired="\[\e[1;91m\]"
#green
bigreen="\[\e[1;92m\]"
#yellow
biyellow="\[\e[1;93m\]"
#blue
biblue="\[\e[1;94m\]"
#purple
bipurple="\[\e[1;95m\]"
#cyan
bicyan="\[\e[1;96m\]"
#white
biwhite="\[\e[1;97m\]"


#highintensitybackgrounds
#black
on_iblack="\[\e[0;100m\]"
#red
on_ired="\[\e[0;101m\]"
#green
on_igreen="\[\e[0;102m\]"
#yellow
on_iyellow="\[\e[0;103m\]"
#blue
on_iblue="\[\e[0;104m\]"
#purple
on_ipurple="\[\e[0;105m\]"
#cyan
on_icyan="\[\e[0;106m\]"
#white
on_iwhite="\[\e[0;107m\]"



# |
# | Git Status
# |:::::::::::::::::::::::::::::::::::::::::::::::::|



function git_branch {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
   # echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}


COLOR_RESET="\e[00m"
COLOR_GREEN="\e[1;32m"
COLOR_RED="\e[00;31m"

NO_CHANGES_STRING="nothing to commit, working directory clean"
NO_CHANGES_STRING2="nothing to commit (working directory clean)"
CHANGES_ICON='\x26\x13' #nice x UTF-8
NO_CHANGES_ICON='\x27\x13' #checkmark UTF-8

function iconify {
    iconv -f utf-16be
}

# a nice x icon
function changes_icon {
    get_icon $CHANGES_ICON $COLOR_RED
}

# a checkbox icon
function no_changes_icon {
    get_icon $NO_CHANGES_ICON $COLOR_GREEN
}

# usage: get_icon $CHANGES_ICON $COLOR_RED
function get_icon {
    local MY_ICON=$(echo -ne "$1" | iconify)
    echo -ne "$2$MY_ICON${COLOR_RESET}"
}

function show_git_add {
    if [ -d .git ]; then
        [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && changes_icon || no_changes_icon
    fi;
}

function git_dirt {
    if [ -d .git ]; then
        [[ $(git status 2> /dev/null | tail -n1) != "$NO_CHANGES_STRING" ]] && changes_icon || no_changes_icon
    fi;
}

# |
# | Git unpushed
# |:::::::::::::::::::::::::::::::::::::::::::::::::|


function git_icons_stats {
    git rev-parse --git-dir > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        git_status="$(git status 2> /dev/null)"
        branch_pattern="^# On branch ([^${IFS}]*)"
        detached_branch_pattern="# Not currently on any branch"
        remote_pattern="# Your branch is (.*) of"
        diverge_pattern="# Your branch and (.*) have diverged"
        untracked_pattern="# Untracked files:"
        new_pattern="new file:"
        deleted_pattern="deleted:"
        modife_pattern="modified:"

        # add an else if or two here if you want to get more specific
        # show if we're ahead or behind HEAD
        if [[ ${git_status} =~ ${remote_pattern} ]]; then
            if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
                v_ahead="↑"
            else
                v_behine="↓"
            fi
        fi
        #new files
        if [[ ${git_status} =~ ${new_pattern} ]]; then
            newf="●"
        fi
        #deleted files
        if [[ ${git_status} =~ ${deleted_pattern} ]]; then
            delf="○"
        fi
        #modified files
        if [[ ${git_status} =~ ${modife_pattern} ]]; then
            modif="◑"
        fi
        #untracked files
        if [[ ${git_status} =~ ${untracked_pattern} ]]; then
            untra="□"
        fi
        #diverged branch
        if [[ ${git_status} =~ ${diverge_pattern} ]]; then
            remote="↕"
        fi

        # Count ahead and behine
        curr_branch=$(git rev-parse --abbrev-ref HEAD);

        curr_remote=$(git config branch.$curr_branch.remote);

        curr_merge_branch=$(git config branch.$curr_branch.merge | cut -d / -f 3);

        if [[ "$curr_remote" != "" ]]; then
            v_count=$(git rev-list --left-right --count $curr_branch...$curr_remote/$curr_merge_branch | tr -s '\t' '|');
        fi

        if [[ "$v_count" != "0|0"   ]]; then
            echo -e "${untra} ${modif} ${newf} ${delf} ${v_ahead}${v_count}${v_behine} ${remote} "
        else
            echo -e "${untra} ${modif} ${newf} ${delf} ${remote} "
        fi


    fi
    return
}

# |
# | GIT remotes
# |:::::::::::::::::::::::::::::::::::::::::::::::::|

function remote_git_branch { #returns the current branch; inline usage ex: git pull origin `remote_git_branch`
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* (.*)/1/'
#git describe -contains -all HEAD
}


alias @branch=remote_git_branch # usage ex: git pull origin `@branch`
alias @br=@branch # usage ex: git pull origin `@br`

#———————————————————-
# Git prompt
#———————————————————-
# Git Bash shell command completion simple:
function remote_parse_git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* (.*)/ [1]/'
    #git describe -contains -all HEAD
}
#PS1="u@h:W $(remote_parse_git_branch)$ "

#get current remotes:
function remote_git { # This prints the matching remotes for the current branch name. Short version of show-git-current-remotes()
    #!/bin/sh
    if [[ -n "$(remote_git_branch)" ]] ; then
    originalBranch="$(git rev-parse --abbrev-ref HEAD)"
    remoteMatchesArr=(); #Initiate remoteMatches array
    branches=()
    eval "$(git for-each-ref --shell --format='branches+=(%(refname))' refs/remotes/)" #remote branches.
    for branch in "${branches[@]}";
    do
    branchName="$(basename ${branch})"
    #set remoteName
    oIFS="$IFS";
    IFS='/' read -ra remoteArr <<< "$branch"
    remoteName="${remoteArr[2]}"
    if [[ $branchName == "$originalBranch" ]] ; then #capture the remote name
    remoteMatchesArr=("${remoteMatchesArr[@]}" "$remoteName") #Add remotes to array
    #remotes="$remotes $remoteName";
    fi
    done
    IFS="$oIFS"
    echo ${remoteMatchesArr[@]} | sed 's/ / | /g' #delimit remotes with |
    fi #end if git dir
    unset remoteMathesArr
}




# |
# | Vagrant Box Url
# |:::::::::::::::::::::::::::::::::::::::::::::::::|

function vagrant_box_url {
    if [ $? -gt 0 ];then
          echo ""
    else
        if [ -d .vagrant ] && [ -f Vagrantfile ]; then
            var=`awk '{match($0,/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/); ip = substr($0,RSTART,RLENGTH); print ip}' Vagrantfile`
            var="${var#"${var%%[![:space:]]*}"}"
            var="${var%"${var##*[![:space:]]}"}"
            echo -e "$(tput setaf 2) \n   |##############  Vagrant URL  #################|\n   |           http://$var               |\n   |##############################################|"
        fi;
    fi
}

PROMPT_COMMAND=vagrant_box_url



# |
# | Prompt
# |:::::::::::::::::::::::::::::::::::::::::::::::::|


# | |||||||||||||||||||||
if [ "${machine}" = yellow ]; then

PS1="
 ${rs}${on_iblack}     ::::::: ${title_machine} ::::::::${rs}

 ${iyellow}☆${rs} ${yellow}[\u]  ${ired} \$(git_branch) \$(show_git_add) \$(git_dirt) \$(git_icons_stats) ${ired}\$(remote_git) ${rs}
 ${iyellow}☆${rs} ${iyellow} \w ${rs}
 ${iyellow}☆${rs} ${bwhite}$ ${rs}"

fi

# | |||||||||||||||||||||

if [ "${machine}" = green ]; then

PS1="
 ${rs}${on_iblack}     ::::::: ${title_machine} ::::::::${rs}

 ${igreen}☆${rs} ${green}[\u]  ${ired} \$(git_branch) \$(show_git_add) \$(git_dirt) \$(git_icons_stats) ${ired}\$(remote_git) ${rs}
 ${igreen}☆${rs} ${igreen} \w ${rs}
 ${igreen}☆${rs} ${bwhite}$ ${rs}"

fi

# | |||||||||||||||||||||

if [ "${machine}" = purple ]; then

PS1="
 ${rs}${on_iblack}     ::::::: ${title_machine} ::::::::${rs}

 ${ipurple}☆${rs} ${purple}[\u]  ${ired} \$(git_branch) \$(show_git_add) \$(git_dirt) \$(git_icons_stats) ${ired}\$(remote_git) ${rs}
 ${ipurple}☆${rs} ${ipurple} \w ${rs}
 ${ipurple}☆${rs} ${bwhite}$ ${rs}"

fi

# | |||||||||||||||||||||

if [ "${machine}" = cyan ]; then

PS1="
 ${rs}${on_iblack}     ::::::: ${title_machine} ::::::::${rs}

 ${icyan}☆${rs} ${cyan}[\u]  ${ired} \$(git_branch) \$(show_git_add) \$(git_dirt) \$(git_icons_stats) ${ired}\$(remote_git) ${rs}
 ${icyan}☆${rs} ${icyan} \w ${rs}
 ${icyan}☆${rs} ${bwhite}$ ${rs}"

fi

# | |||||||||||||||||||||

if [ "${machine}" = red ]; then

PS1="
 ${rs}${on_iblack}     ::::::: ${title_machine} ::::::::${rs}

 ${ired}☆${rs} ${red}[\u]  ${ired} \$(git_branch) \$(show_git_add) \$(git_dirt) \$(git_icons_stats) ${ired}\$(remote_git) ${rs}
 ${ired}☆${rs} ${ired} \w ${rs}
 ${ired}☆${rs} ${bwhite}$ ${rs}"

fi

# | |||||||||||||||||||||

if [ `/usr/bin/whoami` = 'o' ]; then # you are root, set red colour prompt

PS1="
 ${iblue}☆${rs} ${blue}[\u]  ${ired} \$(git_branch) \$(show_git_add) \$(git_dirt) \$(git_icons_stats) ${ired}\$(remote_git) ${rs}
 ${iblue} ${rs} ${iblue} \w ${rs}
 ${iblue} ${rs} ${bwhite}$ ${rs}"

fi




# | |||||||||||||||||||||

if [ "${machine}" = "" ]; then

PS1="[\h] @ [\u] $"

fi





# |
# | Alias
# |:::::::::::::::::::::::::::::::::::::::::::::::::|

alias sudo='sudo '

alias ll='ls -Xal --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias ll='ls -gXa --color=auto'
alias cc='clear'
alias ..='cd ..'

alias oo-ip='ip addr list |grep eth0$'

alias oo-ram-free="echo '     echo 3 > /proc/sys/vm/drop_caches'"

alias oo-untar_file="tar -xzvf $1"

alias oo-users="cat /etc/passwd | grep /home | cut -d: -f1"

alias oo-vm="cat ~/.ssh/config"

# untar on the same folder
oo-untar-here_file() {
    tar --strip-components=1 -zxvf "$1"
}

#wget limit
oo-wget_limit_url() {
    wget --limit-rate="$1"k "$2"
}

oo-mkdir_cd() {
    mkdir "$1" && cd "$1"
}

oo-ssh-keygen_comm() {
    ssh-keygen -t rsa -b 2048 -f ~/.ssh/"$1" -C "$1"
}

# alias apt-get
alias oo-install='apt-get install'
alias oo-update='apt-get update'
alias oo-upgrade='apt-get upgrade'

# alias Apache, MySql
alias oo-apache-restart='/etc/init.d/apache2 restart'
alias oo-apache-stop='/etc/init.d/apache2 stop'
alias oo-apache-start='/etc/init.d/apache2 start'

alias oo-apache-vhost='apache2ctl -S'

alias oo-mysql-start='/etc/init.d/mysql start'
alias oo-mysql-stop='/etc/init.d/mysql stop'
alias oo-mysql-restart='/etc/init.d/mysql restart'

#alias oo-nginx-start ='/etc/init.d/nginx start'
#alias oo-nginx-stop ='/etc/init.d/nginx stop'
#alias oo-nginx-restart ='/etc/init.d/nginx restart'



# |
# | Alias Git
# |:::::::::::::::::::::::::::::::::::::::::::::::::|

oo-git () {
    echo ""
    echo "git--ck              = git checkout [BRANCH]"
    echo "git--s               = git status"
    echo "git--b               = git branch [NEW BRANCH]"
    echo "git--bv              = git branch -v"
    echo "git--c               = git commit -m [COMMENT]"
    echo "git--l               = git log --graph --pretty=oneline --abbrev-commit"
    echo "git--ll              = git log --pretty=oneline --abbrev=9 -5"
    echo "git--log             = git log --pretty=oneline --abbrev-commit"
    echo "git---log-cant-user  = git shortlog -s -n"
    echo "git--cl              = git clone [URL] ."
    echo "git--a               = git add ."
    echo "git--unpush          = git log origin/master..HEAD --oneline"
    echo "git--unpull          = git log HEAD..origin/master --oneline"
    echo "git--lme             = git log --merges --oneline -20"
    echo "git--lstat           = git log --pretty=format:'%h - %ar - %an,  : %s' -30"
    echo "git--count-b-ups     = git log HEAD..upstream/master --oneline | wc -l "
}

alias git--ck="git checkout $1"
alias git--s="git status"
alias git--b="git branch $1"
alias git--bv="git branch -v"
alias git--c="git commit -m $1"
alias git--l="git log --graph --pretty=oneline --abbrev-commit --abbrev=9"
alias git--ll="git log --pretty=oneline --abbrev=9 -5"
alias git--log="git log --pretty=oneline --abbrev-commit --abbrev=9 $1"
alias git--log-cant-user="git shortlog -s -n"
alias git--cl="git clone $1 ."
alias git--a="git add ."
alias git--unpush="git log origin/master..HEAD --oneline"
alias git--unpull="git log HEAD..origin/master --oneline"
alias git--unpull-upstream="git log HEAD..upstream/master --oneline"
alias git--lme="git log --merges --oneline -20"
alias git--lstat="git log --pretty=format:'%Cred%h%Creset - %Cgreen%ar %Creset- %an,  : %s %C(yellow)%d' -30"
alias git--count-b-ups="echo -e ' Behine upstream \e[0;31m' && git log HEAD..upstream/master --oneline | wc -l && echo -e '\e[0m Commits'"

 # git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --
 # git log HEAD..upstream/master --oneline | wc -l


# |
# | Alias Drush
# |:::::::::::::::::::::::::::::::::::::::::::::::::|

alias oo-drush-update="drush pm-update -y"
alias oo-drush-update-db="drush updatedb -y"

oo-drush-drupal() {
    drush dl drupal
    mv drupal-*/* .
    mv drupal-*/.htaccess .
    mv drupal-*/.gitignore .
    mkdir sites/default/files
    mkdir sites/default/files-priv
    cp sites/default/default.settings.php sites/default/settings.php
    chmod +w sites/default/settings.php || true
    chmod +w sites/default/files || true
    drush status
}

oo-drush-drupal_dir() {
    mkdir "$1"
    cd "$1"
    drush dl drupal
    mv drupal-*/* .
    mv drupal-*/.htaccess .
    mv drupal-*/.gitignore .
    mkdir sites/default/files
    mkdir sites/default/files-priv
    cp sites/default/default.settings.php sites/default/settings.php
    chmod +w sites/default/settings.php || true
    chmod +w sites/default/files || true
    drush status
}

oo-drush-themes() {
    drush dl rubik
    drush dl tao
    drush dl zen
}

oo-drush-modules-min() {
    drush dl admin_menu -y
    drush dl module_filter -y
    drush dl backup_migrate -y

    drush en admin_menu -y
    drush en module_filter -y
    drush en backup_migrate -y

    drush cron

}

oo-drush-modules-backup() {
    drush dl backup_migrate -y
    drush en backup_migrate -y

    drush cron
}

oo-drush-modules-basics() {
    drush dl block_class -y
    drush dl backup_migrate -y
    drush dl ctools -y
    drush dl devel -y
    drush dl disable_breadcrumbs -y
    drush dl ds -y
    drush dl elements -y
    drush dl entity -y
    drush dl exclude_node_title -y
    drush dl footer_sitemap -y
    drush dl honeypot -y
    drush dl html5_tools -y
    drush dl jquery_update -y
    drush dl l10n -y
    drush dl libraries -y
    drush dl media -y
    drush dl menu_attributes -y
    drush dl module_filter -y
    drush dl panels -y
    drush dl pathauto -y
    drush dl pathologic -y
    drush dl save_edit -y
    drush dl submitted_by -y
    drush dl token -y
    drush dl url -y
    drush dl viewfield -y
    drush dl views -y
    drush dl webform -y
    drush dl wysiwyg -y

    drush en block_class -y
    drush en backup_migrate -y
    drush en ctools -y
    drush en devel -y
    drush en disable_breadcrumbs -y
    drush en ds -y
    drush en elements -y
    drush en entity -y
    drush en exclude_node_title -y
    drush en footer_sitemap -y
    drush en honeypot -y
    drush en html5_tools -y
    drush en jquery_update -y
    drush en l10n -y
    drush en libraries -y
    drush en media -y
    drush en menu_attributes -y
    drush en module_filter -y
    drush en panels -y
    drush en pathauto -y
    drush en pathologic -y
    drush en save_edit -y
    drush en submitted_by -y
    drush en token -y
    drush en url -y
    drush en viewfield -y
    drush en views -y
    drush en webform -y
    drush en wysiwyg -y

    drush cron
}

oo-info-machine () {

let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
let secs=$((${upSeconds}%60))
let mins=$((${upSeconds}/60%60))
let hours=$((${upSeconds}/3600%24))
let days=$((${upSeconds}/86400))
UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`

# get the load averages
read one five fifteen rest < /proc/loadavg

echo "$(tput setaf 2)
Date...............: `date +"%A, %e %B %Y, %r"`
Weather............: `curl -s "http://rss.accuweather.com/rss/liveweather_rss.asp?metric=1&locCode=EUR|UK|UK001|NAILSEA|" | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'`

Kernel release ....: `uname -r`
Kernel version ....: `uname -v`
Processor .........: `uname -p`
Operating system ..: `uname -o`
$(tput setaf 1)
Uptime.............: ${UPTIME}

Load Averages......: ${one}, ${five}, ${fifteen} (1, 5, 15 min)
Running Processes..: `ps ax | wc -l | tr -d " "`
IP Addresses.......: `/sbin/ifconfig eth0 | /bin/grep "inet addr" | /usr/bin/cut -d ":" -f 2 | /usr/bin/cut -d " " -f 1` and `wget -q -O - http://icanhazip.com/ | tail`

Memory.............: `cat /proc/meminfo | grep MemFree | awk {'print $2'}`kB (Free) / `cat /proc/meminfo | grep MemTotal | awk {'print $2'}`kB (Total)
RAM Total .........: `free | grep Mem | awk '{print $2 / 1024 }'` MB
RAM in use ........: `free | grep Mem | awk '{print $3 / 1024 }'` MB
RAM free ..........: `free | grep Mem | awk '{print $4 / 1024 }'` MB
$(tput setaf 3)
`lsb_release -a`

Username...........: `echo "$USER"`
Hostname...........: `uname -n`

$(tput sgr0)"

}





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

