#!/bin/bash

MYSQL_PASS="admin123"

RAN2=$(( $RANDOM % 100 ))
RAN3=$(( ( $RANDOM % 1000 )  + 100 ))

WWW_PORT=600$RAN2
MYSQL_PORT=$(($WWW_PORT+1))

script_path=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


mkdir -p "${script_path}"/www
touch "${script_path}"/www/index.php

cat << "EOF" > $script_path/www/index.php
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Docker</title>
        <style>
            h1 {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>Inside Docker</h1>
        <?php phpinfo(); ?>
    </body>
</html>
EOF

docker run --name lamp-$RAN3 \
    -v $script_path/www:/var/www/html \
    -p $WWW_PORT:80    \
    -p $MYSQL_PORT:3306    \
    -e MYSQL_PASS="${MYSQL_PASS}" \
    -d tutum/lamp

echo -e "
========================================================================
Navegate to:

    http://127.0.0.1:${WWW_PORT}

========================================================================
You can connect to this MySQL Server using:

    mysql -uadmin -p${MYSQL_PASS} -P${MYSQL_PORT} -h127.0.0.1

========================================================================
"
