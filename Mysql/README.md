MySQL
=====

#### Login

```bash
    $ mysql -u root -p
    $ mysql -u [USER] -p
```

#### Basics

```sql
    mysql> CREATE DATABASE [NAME];

    mysql> DROP DATABASE [NAME];

    mysql> USE [DATABASE];

    mysql> SHOW tables;
```


#### Privileges

```sql
    mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';

    mysql> GRANT ALL PRIVILEGES ON MY_DATABASE . * TO 'admin'@'localhost';

    mysql> GRANT [type of permission] ON [database name] . [table name] TO ‘[username]’@'localhost';

    mysql> FLUSH PRIVILEGES;
```

#### Backup database

```sh
  $ mysqldump -u aplicativos -p -h 192.168.100.3 --single-transaction --max_allowed_packet=512MB --where="true LIMIT 100"  DB4505 > dummy.003.100_DB4505.sql
```


#### Create User

```sql
    mysql> CREATE USER '[newuser]'@'localhost' IDENTIFIED BY '[password]';
```

#### Insert database

```bash
    $ mysql -p -u username DATABASE_NAME < file.sql
```

#### Show Users

```sql
    -- Show users
    SELECT User FROM mysql.user;
    -- Show users and host
    SELECT user,host FROM mysql.user;
```

#### Show Users

```sql
    SELECT CONCAT(QUOTE(user),'@',QUOTE(host)) UserAccount FROM mysql.user;
```

#### Show Users Privileges

```sql
    SHOW GRANTS FOR '[user]'@'localhost';
    SHOW GRANTS FOR 'root'@'localhost';
```

#### Show Users

```sql
    SHOW [FULL] TABLES [{FROM | IN} db_name]
```

#### Show databases

```sql
    SHOW DATABASES;
```

#### Show what database is selected

```sql
    SELECT DATABASE();
```

#### Show tables in selected database

```sql
    SHOW TABLES;
```

#### Show table description

```sql
    DESCRIBE [database];
```

#### Show tables in some table

```sql
    SHOW TABLES FROM [sometable]
```


#### Aceess external

```bash
    $ sudo vim /etc/mysql/my.cnf
```

- comment:

```
    # skip-external-lockin
    # bind-address           = 127.0.0.1
```

- restart mysql 

```bash
    $ sudo service mysql restart 
```

- Enter mysql

```bash
    $ mysql -u root -p
```

```sql
    mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'admin123' WITH GRANT OPTION;
    mysql> FLUSH PRIVILEGES;
```

### First change the mysql root password

```sql
    mysql > update user set password=password('pass') where user='root';

    mysql > FLUSH PRIVILEGES;
```

### Change Password

```bash
    $ mysqladmin -u root -p'oldpassword' password newpass
```

### Reset password

```bash
    $ 
    sudo /etc/init.d/mysql stop
    sudo mysqld_safe --skip-grant-tables &
    mysql -u root
```

```sql
    mysql> 
    use mysql;
    update user set password=PASSWORD("admin123") where User='root';
    flush privileges;
    quit
```

```bash
    $ 
    sudo /etc/init.d/mysql stop
    sudo /etc/init.d/mysql start
```

- **Another Way** (DANGER)

```bash
    $ 
    sudo apt-get --purge remove -y mysql-server mysql-common mysql-client
    sudo apt-get install -y mysql-server mysql-common mysql-client
    mysqladmin -u root password admin123
    sudo /etc/init.d/mysql restart
    mysql -u root -p
```

#### Remove mysql (DANGER)

```bash
    $ 
    sudo apt-get -y remove --purge mysql-server mysql-client mysql-common && \
    sudo apt-get -y autoremove && \
    sudo apt-get -y autoclean && \
    sudo rm -rf /var/lib/mysql/mysql
```
