Bash
====


```sh
#!/bin/bash

# | Script Path
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_PATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# | Script Path Folder
SCRIPT_DIR=`basename $SCRIPT_PATH`

# | Path from excute
PWD="$(pwd)"

# | Path from excute
PWD_FOLDER=${PWD##*/}
```

## Colors

```sh
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
```

## Insert text in file

```sh
# At the end
$ echo "TEXT_TO_INSERT" >> ./myfile.txt
$ sudo sh -c "TEXT_TO_INSERT' >> ./myfile.txt"

# Replace all
$ echo "TEXT_TO_INSERT" > ./myfile.txt
$ sudo sh -c "TEXT_TO_INSERT' > ./myfile.txt"


#
cat >> PATH/TO/FILE <<'endmsg'
{
"apps": [{
"name": "rocket.chat",
"script": "/opt/rocket.chat/bundle/main.js",
"out_file": "/opt/rocket.chat/logs/app.log",
"error_file": "/opt/rocket.chat/logs/err.log",
"port": "80",
"env": {
"MONGO_URL": "mongodb://localhost:27017/rocketchat",
"MONGO_OPLOG_URL": "mongodb://localhost:27017/local",
"ROOT_URL": "http://localhost.com:80",
"PORT": "80"
}
}]
}
endmsg
```

## Find and replace in file

```sh
find "/FOLDER_PATH/" -name "FILE.php" -exec sed -ie "s/SEARCH/REPLACE/g" "{}" \;
```

## Replace in file

```bash
sed -i "s/SEARCH/REPLACE/" ./myfile.txt
```

## Count file with jquery

```sh
ack -l -r '(<script)(.*?)(jquery)(.*?)(</script>)' . | wc -l
```


## Count php files

```sh
ack -f --php | wc -l
```


## Show lines with the word 'jquery'

```sh
ack 'jquery'
```


## Show lines with the word 'jquery' in php files

```sh
ack --php 'jquery'
```

## List php files


```sh
ack -f --php
```


## Count number of lines for each file and total

```sh
find . -name '*.php' | xargs wc -l
```


## Loop

```sh
find . -name '*.php' |   while read file; do
[code ...]
done
```

```sh
find . -name '*.php' |   while read file; do; awk  '/jquery/ { print $0}' $file; done
```


## Check if git status [gitstatus]

```sh
function func_all () {
cd $2
echo -e "# | :::::: Repo: $1"
if [ -n "$(git status --porcelain)" ]; then
git status
else
echo -e "${green}CLEAN${RS}";
git branch
echo ""
fi
}
```


## If command output contains

```sh
if [[ $(git remote -v ) != *gober* ]]; then
echo -e "${red}Branch Incorrecta ${RS}"
git remote -v
fi
```

## Exit presing ENTER

```sh
function fun_salir () {
echo "Presione ENTER para salir."
read x
exit
}
```


##  Ask Yes or No

```sh
confirm () {
# call with a prompt string or use a default
read -r -p "${1:-Esta Seguro? [s/N]} " response
case $response in
  [sS])
      echo "SI"
      ;;
  *)
      exit
      ;;
esac
}

```


## Insert Text in file

```sh
cat >> ${HOME}/.zshrc <<'endmsg'
!*.php
!*.html
!*.js
!*.css

!*.png
!*.jpg
endmsg
```



## Execute command for each file in array

```sh
#!/bin/bash
array=(
"./informes/general/con_cumplimientoe.php"
"./scripts/php/seguridad3.php"
"./scripts/php/seguridadmain.php"
)

for ix in ${!array[*]};
do
# awk '$0 ~ str{print NR-1 FS b}{b=$0}' str="conexion.php" "${array[$ix]}"
head -15 "${array[$ix]}"    >> cabeceras.txt
done
```


## Grep text in multiple files and format the output

```sh
#!/bin/bash
grep -rn 'jquery' . | awk -F: '{print "Line: "$2 "  -  " $1 }'

grep -rn 'jquery' . | awk -F: '{print "Line number: "$2 "  -  " $1}'

grep -rn 'jquery' . | awk -F: '{print "Line: "$2 "  -  " $1 "\n" $3$4 "\n\n\n"}'
```


## List all files and exclude extensions

```sh
find . -name '*.*' \
-not -name "*.php" \
-not -name "*.png" \
-not -name "*.gif" \
-not -name "*.less" \
-not -name "*.css" \
-not -name "*.js" \
-not -name "*.json" \
-not -name "*.pdf" \
-not -name "*.PDF" \
-not -name "*.scss" \
-not -name "*.html" \
-not -name "*.TXT" \
-not -name "*.txt" \
-not -name "*.ttf" \
-not -name "*.woff" \
-not -name "*.eot" \
-not -name "*.otf" \
-not -name "*.svg" \
-not -name "*.md" \
-not -name "*.jpg"
```


## Get current directory name without full path

```sh
result=${PWD##*/}          # to assign to a variable

printf '%s\n' "${PWD##*/}" # to print to stdout
                       # ...more robust than echo for unusual names
                       #    (consider a directory named -e or -n)

printf '%q\n' "${PWD##*/}" # to print to stdout, quoted for use as shell input
                     # ...useful to make hidden characters readable.
```


## Delete text beetwen 2 words

```sh
func_delete_beetwen () {
sed -e "/${1}/,/${2}/d" $3 > $3_tmp
cp $3_tmp $3
rm $3_tmp
}

WORD1='# |::::::::::::::::::>>>antigen' # |<=== Config This
WORD2='# |::::::::::::::::::<<<antigen' # |<=== Config This
FILEDEL=".zshrc"

func_delete_beetwen "$WORD1" "$WORD2" "$FILEDEL"
```


## Echo message

```sh
function_title () {
echo "# | ::::::::::::::::::::::::::::::::::: | #"
echo "# | $1"
echo "# | ::::::::::::::::::::::::::::::::::: | #"
}
```


## Script to add a user to Linux system

```sh
if [ $(id -u) -eq 0 ]; then
# read -p "Enter username : " username
username="mmm"
# read -s -p "Enter password : " password
password="mmm"
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
echo "$username exists!"
exit 1
else
pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
useradd -m -p $pass $username
## echo "Failed to add a user!"
fi
else
echo "Only root may add a user to the system"
exit 2
fi
```


## associative array

```sh
declare -A MYMAP=( [foo a]=bar [baz b]=quux )
echo "${!MYMAP[@]}"  # Print all keys - quoted, but quotes removed by echo
```


## Loop through all keys in an associative array

```sh
for K in "${!MYMAP[@]}"; do echo $K; done
```


## Count file with jquery

```sh
ack -l -r '(<script)(.*?)(jquery)(.*?)(</script>)' . | wc -l
ack -l --php '../scripts/js/jquery-1.9.1.js' | wc -l
```


## Count php files

```sh
ack -f --php | wc -l
```


## Show lines with the word 'jquery'

```sh
ack 'jquery'
```


## Show lines with the word 'jquery' in php files

```sh
ack --php 'jquery'
```


## List php files

```sh
ack -f --php
```


## Count number of lines for each file and total

```sh
find . -name '*.php' | xargs wc -l
```


## Loop

```sh
find . -name '*.php' |   while read file; do
[code ...]
done

find . -name '*.php' |   while read file; do; awk  '/jquery/ { print $0}' $file; done
```


## View encoding in php files

```sh
find . -name '*.php' |   while read file; do; file -bi  $file; done
```


## Remove BOM carachters

```sh
find . -name '*.php' |   while read file; do; sed -i 's/\xEF\xBB\xBF//g' $file ; done
```


## Check if command exist or app

```sh
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -eq 0 ]; then #...
```

## View Folder size

```sh
$ du -hs .
$ du * | sort -n

$ du -h [FOLDER]
$ du -hc [FOLDER]
$ du -hs [FOLDER]
$ du -hs .
$ du -hs *
$ du -hs . --exclude="*.txt"

# Find 10 largest files/directories
$ find . -type f -exec du -Sh {} + | sort -rh | head -n 15
$ find . -printf '%s %p\n'| sort -nr | head -15
$ du -hsx * | sort -rh | head -15

# Find the biggest files or directories
$ du -Sh | sort -rh | head -n 15
```

## Make the "tree" command pretty and useful by default**

```sh
alias tree="tree -CAFa -I 'CVS|*.*.package|.svn|.git' --dirsfirst"
```


## Users

- **Show users - home**

```sh
$ cat /etc/passwd | grep "/home" |cut -d: -f1
```

- **Show users all and uid**

```sh
$ awk -F":" '{ print "User: " $1 "\t\tuid:" $3 }' /etc/passwd
```

- **Show users all**

```sh
$ cat /etc/passwd | cut -d ":" -f1
```

## wget

```sh
$ wget -r -l1 --no-parent -nH -nd -P/tmp -A".gif,.jpg,.png" http://example.com/images
```

## Get External IP**

```sh
$ curl http://ipecho.net/plain

$ lynx --dump http://ipecho.net/plain

$ curl http://whatismyip.org/
```

## Get Internal IP**

```sh
$ /sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'
```

## Todos los paquetes instaldados**

```sh
$ dpkg --get-selections >> paquetes-instalados.txt

$ grep install /var/log/dpkg.log >> paquetes-instalados.txt
```

## Rsync

```sh
$ rsync -Aax owncloud/ owncloud-`date +"%Y%m%d"`-backup/

$ rsync -Aaxzv --progress estampillas/ estampillas-`date +"%Y%m%d"`-backup/

$ rsync -Aaxzv  vm28:/var/www/html/estampillas /home/uu/Documents
```

##  Delete all and just keep the 3 recent backups

```bash
cd "${FOLDER_BACKUP}"  && (ls -t | head -n 3;ls) | sort | uniq -u | sed -e 's,.*,"&",g' | xargs rm
```


## Create Folders from Array

```bash
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
PROFILE=( $(find $SCRIPT_PATH -maxdepth 1 -type d -printf '%P\n') )

for ix in ${!PROFILE[*]}; do
cd profiles
if [ ! -d "${PROFILE[$ix]}" ]; then
  mkdir "${PROFILE[$ix]}"
  echo "Folder ${PROFILE[$ix]} created"
fi
cd ..
done
```

## Bash command to a variable

```bash
pwd=`pwd`
# or
pwd=$(pwd)
```


## Finding Lines Containing Certain Words

```bash
^.*\b(SEARCH1|SEARCH2|SEARCH3)\b.*$
```

## Search and Replace

```bash
ack -l 'pattern' | xargs perl -pi -E 's/pattern/replacement/g'
```

## Combinar

```bash
ack -l '^.*\b(SEARCH1|SEARCH2|SEARCH3)\b.*$' | xargs perl -pi -E 's/^.*\b(SEARCH1|SEARCH2|SEARCH3)\b.*$/REPLACE/g'
```

## Intalar ack

```bash
sudo apt-get install ack

OR

curl http://betterthangrep.com/ack-standalone > ~/bin/ack && chmod 0755 !#:3
```

## Uso (cuando es expresion regular la busqueda deber ir en comillas simples)

```bash
ack SEARCH
ack 'SEARCH'
```

### Cron

```bash
# Pull and log
*/3 * * * *   /root/crons/prototiposena.sh  >> ~/crons/logs/prototiposena.log 2>&1
*/3 * * * *   /root/crons/time_stamp.sh  >> ~/crons/logs/git_log_prototiposena.log1 2>&1


*/3 * * * *   /root/crons/prototiposena_prueba.sh  >> ~/crons/logs/prototiposena_prueba.log 2>&1
*/3 * * * *   /root/crons/time_stamp.sh  >> ~/crons/logs/git_log_prototiposena.log2 2>&1
```


### TimeStamp

```bash
#!/bin/bash

printf "\n"; \
echo ":::::::::::::::::::::::::"; \
NOW=$(date +"%Y-%m-%d [%H:%M:%S]"); \
echo ${NOW}; \
echo ":::::::::::::::::::::::::"; \
printf "\n";
```
