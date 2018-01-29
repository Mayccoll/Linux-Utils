<?php

/**
 * Wordpress DB migration
 * |*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*
 * | FIle:                 wp_migrate.php
 * | Date of creation:     18/Jul/2014
 * |
 * |
 * |
 * | @author             Miguel D. Quintero
 * | @version            1.0
 * | @link               http://www.lenet.com.co
 * |
 * | Revision:
 * |
 * |
 * |        @**##<==={...{{{(@@**##<====>##**@@)}}}...}===>##**@
 * |        @@**##<==={...{{{(@@**##<==>##**@@)}}}...}===>##**@@
 * |        (@@**##<==={...{{{(@@**##<>##**@@)}}}...}===>##**@@)
 * |        {(@@**##<==={...{{{(@@**####**@@)}}}...}===>##**@@)}
 * |        {{(@@**##<==={...{{{(@@**##**@@)}}}...}===>##**@@)}}
 * |        {{{(@@**##<==={...{{{(@@****@@)}}}...}===>##**@@)}}}
 * |        .{{{(@@**##<==={...{{{(@@**@@)}}}...}===>##**@@)}}}.
 * |        ..{{{(@@**##<==={...{{{(@@@@)}}}...}===>##**@@)}}}..
 * |        ...{{{(@@**##<==={...{{{(@@)}}}...}===>##**@@)}}}...
 * |        {...{{{(@@**##<==={...{{{()}}}...}===>##**@@)}}}...}
 * |        ={...{{{(@@**##<==={...{{()}}...}===>##**@@)}}}...}=
 * |        =={...{{{(@@**##<==={...{()}...}===>##**@@)}}}...}==
 * |        ==={...{{{(@@**##<==={...()...}===>##**@@)}}}...}===
 * |       <==={...{{{(@@**##<==={......}===>##**@@)}}}...}===>
 * |        #<==={...{{{(@@**##<==={....}===>##**@@)}}}...}===>#
 * |        ##<==={...{{{(@@**##<==={..}===>##**@@)}}}...}===>##
 * |        *##<==={...{{{(@@**##<==={}===>##**@@)}}}...}===>##*
 * |*=*=*=*=*=*=*=°´°+,¸¸,+m(ò_ó)m+ ★o★ +m(ò_ó)m+,¸¸,+°´°*=*=*=*=*=*=*=*
 */

/**
 * | Config This ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 * |
*/
$dbData = array(
    'master'    => array(
        'host'  => '127.0.0.1',
        'port'  => '3307',
        'db'    => 'portalsst',
        'user'  => 'root',
        'pass'  => 'admin123',
        'url'   => 'http://localhost:8081/portalsst' // <- No Trailing Slash - Origin URL
    ),
    'stage'     => array(
        'host'  => '127.0.0.1',
        'port'  => '3307',
        'db'    => 'test1',
        'user'  => 'root',
        'pass'  => 'admin123',
        'url'   => 'http://nuevaurl:8081/portalsst' // <- No Trailing Slash - Target URL
    ),
    'dev'       => array(
        'host'  => '127.0.0.1',
        'port'  => '3307',
        'db'    => 'test2',
        'user'  => 'root',
        'pass'  => 'admin123',
        'url'   => 'http://xxxxxxxxxxxx/portalsst' // <- No Trailing Slash - Target URL
    )
);
/**
 * | ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
*/


$sqlOriginal = 'master'; // File name for backup 'master'

tryConnections($dbData); // Try connection
    echo "Correct connection in all databases...<br>";
    echo "Export DB 'master'...<br>";

backupDb($dbData, 'master'); // Export db 'master'
    echo "Importando DB a 'stage'...<br>";

replaceUrl($dbData, 'master', 'stage'); // Change the url
    echo "Replace Url'...<br>";

emptyDb($dbData, 'stage');
importDb($dbData, 'stage');
    echo "Importando DB a 'dev'...<br>";

replaceUrl($dbData, 'stage', 'dev'); // Change the url
    echo "Replace Url'...<br>";

emptyDb($dbData, 'dev');
importDb($dbData, 'dev');
    echo "Elimando archivo SQL original...<br>";

unlink($sqlOriginal.'.sql');
    echo "Done!...<br>";

function tryConnections($dbData){
    foreach ($dbData as $key => $data) {
        try {
             $dbh = new PDO('mysql:host=' . $data['host'] . ';port=' . $data['port'] . ';dbname='.$data['db'], $data['user'], $data['pass']);
             echo "SUCCESS - DB:" . $key . "<br>";
        } catch (PDOException $e) {
            print "ERROR!!! - DB:$key : " . $e->getMessage() . "\n";
            die();
        }
    }
}

function backupDb($dbData, $db){
    global $sqlOriginal;
    $dbData = $dbData[$db];
    exec('mysqldump --opt -h \''.$dbData['host'].'\' -P \''.$dbData['port'].'\' --password=\''.$dbData['pass'].'\' --user='.$dbData['user'].' '.$dbData['db'].' > '.$sqlOriginal.'.sql');
}

function importDb($dbData, $db){
    global $sqlOriginal;
    $dbData = $dbData[$db];
    exec('mysql -h \''.$dbData['host'].'\' -P \''.$dbData['port'].'\' --password=\''.$dbData['pass'].'\' --user='.$dbData['user'].' '.$dbData['db'].' < '.$sqlOriginal.'.sql');
}

function emptyDb($dbData, $db){
    global $sqlOriginal;
    $dbData = $dbData[$db];
    exec('mysql -h \''.$dbData['host'].'\' -P \''.$dbData['port'].'\' --password=\''.$dbData['pass'].'\' --user='.$dbData['user'].' -e \'drop database '.$dbData['db'].'\';');
    exec('mysql -h \''.$dbData['host'].'\' -P \''.$dbData['port'].'\' --password=\''.$dbData['pass'].'\' --user='.$dbData['user'].' -e \'create database '.$dbData['db'].'\';');
}

function replaceUrl ($dbData, $db_from, $db_to) {
    global $sqlOriginal;
    $dbData_from = $dbData[$db_from];
    $dbData_to = $dbData[$db_to];

    $path_to_file = $sqlOriginal.'.sql';

    $file_contents = file_get_contents($path_to_file);
    $file_contents = str_replace( $dbData_from['url'], $dbData_to['url'], $file_contents);
    file_put_contents($path_to_file, $file_contents);
}
