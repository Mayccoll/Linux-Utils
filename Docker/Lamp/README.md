# Docker Lamp

### Justo Run:

```bash
wget https://raw.githubusercontent.com/Mayccoll/Linux-Utils/master/Docker/Lamp/run.sh && \
chmod +x run.sh && \
./run.sh
```


### Install PhpMyAdmin

```bash
docker exec -it 20543dd4 bash

apt-get install -y phpmyadmin --fix-missing

ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf

a2enconf phpmyadmin

service apache2 restart

mysql>
    use mysql;
    update user set password=PASSWORD("admin123") where User='root';
    flush privileges;
    quit
```
