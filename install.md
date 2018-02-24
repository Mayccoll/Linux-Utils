# Install

**Install more nice stuffs**

- [Exa](https://github.com/ogham/exa)
- [Haroopad](http://pad.haroopress.com/)
- [Koala](http://koala-app.com/)
- [Pac](http://sourceforge.net/projects/pacmanager/files/)
- [Pleeease](http://pleeease.io/)
- [Screamingfrog](https://www.screamingfrog.co.uk/seo-spider/)
- [Sublime text](http://www.sublimetext.com/3)
- [Timeshift](http://www.teejeetech.in/p/timeshift.html)
- [Ocenaudio](http://www.ocenaudio.com)
- [VPN Client](https://fruho.com)
- [Nitro Task](http://nitrotasks.com/)

## Brackets [Website](http://brackets.io/)

```bash
sudo add-apt-repository -y ppa:webupd8team/brackets && \
sudo apt-get update && \
sudo apt-get -y install brackets
```

##### System Info

https://github.com/dylanaraps/neofetch

```bash
$
sudo add-apt-repository -y ppa:dawidd0811/neofetch && \
sudo apt update && \
sudo apt install -y neofetch
```

## Ack

```bash
sudo apt-get install ack

# OR

curl http://betterthangrep.com/ack-standalone > ~/bin/ack && chmod 0755 !#:3
```

### Use:


#### Uso (cuando es expresion regular la busqueda deber ir en comillas simples)

```bash
ack SEARCH
ack 'SEARCH'
```

#### ack - Regex - Finding Lines Containing Certain Words

```bash
^.*\b(SEARCH1|SEARCH2|SEARCH3)\b.*$
```

#### ack - Search and Replace

```bash
ack -l 'pattern' | xargs perl -pi -E 's/pattern/replacement/g'
```

#### ack - Combinar

```bash
ack -l '^.*\b(SEARCH1|SEARCH2|SEARCH3)\b.*$' | xargs perl -pi -E 's/^.*\b(SEARCH1|SEARCH2|SEARCH3)\b.*$/REPLACE/g'
```


## Gimp 2.9

```bash
$ sudo add-apt-repository ppa:otto-kesselgulasch/gimp-edge
```

## Install Gimp Theme photoshop

https://github.com/doctormo/GimpPs

## Install last version of gThump

```bash
$ sudo add-apt-repository -y ppa:webupd8team/gthumb
```

## Salt

```bash
$ sudo apt install -y python-software-properties
$ sudo add-apt-repository -y ppa:saltstack/salt
$ sudo apt update
$ sudo apt install -y salt-master
$ sudo apt install -y salt-minion
$ sudo apt install -y salt-syndic
```

## Install Docker

```bash
# install docker
curl -sSL https://get.docker.com/ | sudo sh

# add my user to docker group
sudo gpasswd -a ${USER} docker

# restart docker
sudo service docker restart

# tell the current terminal about the new docker group changes
newgrp docker

# Install Docker Compose
sudo apt install python-pip
sudo pip install docker-compose
```

## Install Go For It!

```bash
$
sudo add-apt-repository -y ppa:mank319/go-for-it && \
sudo apt update && \
sudo apt install -y go-for-it
```

## Install Krita

```bash
$
sudo add-apt-repository -y ppa:dimula73/krita && \
sudo apt update && \
sudo apt install -y krita-2.9 krita-2.9-dbg
```

## Install inotify

monitor events

https://github.com/rvoicilas/inotify-tools

```bash
$ sudo apt install -y inotify-tools
```

## Install vlc

```bash
$
sudo add-apt-repository -y ppa:videolan/master-daily && \
sudo apt update && \
sudo apt install -y vlc
```

## wkhtmltopdf

Convert html to pdf

```bash
$ sudo apt install -y  wkhtmltopdf

### Use Ex:
$ wkhtmltopdf http://google.com google.pdf
```

## pandoc

Universal document converter

``` bash
$ sudo apt install -y pandoc texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended

## Use Ex:
$
pandoc -f markdown -t html README.md >> README.html
$
pandoc latex.md -o latex.pdf

```


## Sigil

EPUB ebook Editor

https://sigil-ebook.com/

```bash
$
sudo add-apt-repository -y ppa:sunab/sigil-git && \
sudo apt update && \
sudo apt install -y sigil
```


## Java

```bash
$
sudo add-apt-repository -y ppa:webupd8team/java && \
sudo apt update && \
sudo apt install -y oracle-java8-installer
```


## Steam

```bash
$
wget -c media.steampowered.com/client/installer/steam.deb
sudo dpkg -i steam.deb
sudo apt install -f
```


## Calibre

```bash
$ sudo apt install -y calibre
```


## XBMC

```bash
$
sudo add-apt-repository -y ppa:team-xbmc/ppa && \
sudo apt update && \
sudo apt -y install xbmc
```


## php 7

```bash
$ sudo apt install -y \
                php7.0 \
                php7.0-fpm \
                php7.0-mysql \
                php7.0-sqlite3 \
                php7.0-mcrypt \
                php7.0-mbstring \
                php7.0-xml \
                php7.0-curl \
                mcrypt
```


## Mysql

```bash
$ sudo apt install -y \
                mysql-server \
                mysql-client \
                libmysqlclient-dev \
                libmysqld-dev
```


## Postgresql

```bash
$ sudo apt install -y postgresql \
            postgresql-client \
            postgresql-contrib
```


## qshutdown

```bash
$ sudo apt install -y qshutdown
```

## imagemagick

```bash
$ sudo apt install -y imagemagick
```

## Bless Hex Editor

```bash
$ sudo apt install -y bless
```

## Luckybackup

```bash
$ sudo apt install -y luckybackup
```

## Wine

```bash
$ sudo apt install -y wine
```

## Zentyal

```bash
$
sudo add-apt-repository "deb http://archive.zentyal.org/zentyal 4.1 main"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 10E239FF
wget -q http://keys.zentyal.org/zentyal-4.1-archive.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install zentyal
#
# https://SERVER IP
# https://SERVER IP:8443
```


## Trickle

Config Bandwidth

```bash
$ sudo apt install -y trickle
```

## Composer, Laravel, Artisan

```bash
$
sudo apt-get install php5-cli
curl -sS https://getcomposer.org/installer | php

sudo mv composer.phar /usr/local/bin/composer

composer global require "laravel/installer=~1.1"

echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ${HOME}/.zshrc

echo 'alias artisan="php artisan"' >> ${HOME}/.zshrc

cat >> ${HOME}/.zshrc <<'endmsg'
# | ::::::: Artisan php :::::::::::::::::::::::::::::::::::::::::::::::::::: >>>
alias artisan="php artisan"
# | ::::::: Artisan php :::::::::::::::::::::::::::::::::::::::::::::::::::: <<<
endmsg
```

## Megadown

```bash
$
sudo apt install -y pv
sudo apt install-y php5-cli
git clone https://github.com/tonikelope/megadown.git
cd megadown
sudo chmod +x megadown
```

## Megatools

https://github.com/megous/megatools

https://packages.debian.org/sid/amd64/megatools/download


## Xtreme Download Manager

```bash
sudo add-apt-repository -y ppa:noobslab/apps && /
sudo apt update && /
sudo apt install -y xdman
```

## Linux Brew*

- Pre:

```bash
sudo apt install -y build-essential \
                        curl \
                        git \
                        m4 \
                        ruby \
                        texinfo \
                        libbz2-dev \
                        libcurl4-openssl-dev \
                        libexpat-dev \
                        libncurses-dev \
                        zlib1g-dev
```

- Install:

```bash
git clone https://github.com/Homebrew/linuxbrew.git ~/.linuxbrew
```

- Add to .zshrc

```bash
# |::::::::::::: Linux Brew ::::::::::::::>>>
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
# |::::::::::::: Linux Brew ::::::::::::::<<<
```

## Nasc - Math

Do maths like a normal person

```bash
$
sudo apt-add-repository -y ppa:nasc-team/daily && \
sudo apt update && \
sudo apt install -y nasc
```

-------------------------------------------------------------------------------


## Themes and Icons


## Cairo-Dock

```bash
$
sudo add-apt-repository -y ppa:cairo-dock-team/ppa && \
sudo apt update && \
sudo apt-get install -y cairo-dock cairo-dock-plug-ins
```

## Libra

```bash
$
sudo add-apt-repository -y ppa:noobslab/themes && \
sudo apt update && \
sudo apt install -y libra-theme
```

## vertex

```bash
$
sudo add-apt-repository -y ppa:noobslab/themes && \
sudo apt update && \
sudo apt install -y vertex-theme
```

## Flattastic

```bash
$
sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
sudo apt-get install flattastic-suite
```

## Ambiance ¬ Radiante

```bash
$
sudo add-apt-repository -y ppa:ravefinity-project/ppa
sudo apt-get update
sudo apt-get install -y radiance-colors ambiance-colors
```

## iOS 7

```bash
$
sudo add-apt-repository ppa:noobslab/icons
sudo apt update
sudo apt install ieos7-icons
```

## Faience

```bash
$
### http://tiheum.deviantart.com/art/Faience-icon-theme-255099649

sudo add-apt-repository ppa:tiheum/equinox
sudo apt update
sudo apt install faience-theme faience-icon-theme
```

## Compass Icons

```bash
$
sudo ppa:noobslab/nitrux-os
sudo apt update
sudo apt install compass-icons
```

## Pacifica Icons

```bash
$
sudo add-apt-repository ppa:fsvh/pacifica-icon-theme
sudo apt update
sudo apt install pacifica-icon-theme
```

## Nitrux Icons

```bash
$
sudo add-apt-repository ppa:upubuntu-com/nitrux
sudo apt update
sudo apt install nitruxos
```

## Faience

>>>    /usr/share/icons

``` bash
### http://tiheum.deviantart.com/art/Faience-icon-theme-255099649

$
sudo add-apt-repository ppa:tiheum/equinox
sudo apt update
sudo apt install faience-theme faience-icon-theme

```



-------------------------------------------------------------------------------


## Linux Desktop

``` bash
$
sudo add-apt-repository -y ppa:gnome3-team/gnome3-staging && \
sudo add-apt-repository -y ppa:gnome3-team/gnome3 && \
sudo apt-get update && \
sudo apt-get install -y gnome
```
