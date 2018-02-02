# Docker
- - - - - - - - - -

- **Bash Inside Container**

```bash
    $
    docker run -itd ubuntu /bin/bash
    docker exec -it 2435236 bash
```

- **Stop / remove all Docker containers**

```bash
    $
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
```

- **Tar image**

```bash
    $
    docker save -o <save image to path> <image name>
    docker load -i <path to image tar file>
```

- **Dockerfile - Create Image**

```bash
    $
    docker build .
    docker build . -t mayc/gitlab:last
```

- **Setting tags on an image**

```bash
    $
    docker tag 5db5f8471261 ouruser/sinatra:devel
```

## Apps

#### Seagull :ballot_box_with_check:

```bash
docker run  --name seagull \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -p 60020:10086 \
    -d tobegit3hub/seagull
```
#### cAdvisor :ballot_box_with_check:

```bash
docker run --name cAdvisor\
    -v /:/rootfs:ro \
    -v /var/run:/var/run:rw \
    -v /sys:/sys:ro \
    -v /var/lib/docker/:/var/lib/docker:ro \
    -p 60021:8080 \
    -d google/cadvisor:latest
```

#### LAMP :ballot_box_with_check:

[website](https://github.com/fauria/docker-lamp)

```bash
docker run --name Ubuntu-Lamp \
    -v $(pwd):/var/www/html \
    -p 80:80    \
    -p 3306:3306    \
    -d fauria/lamp
```

```bash
docker exec -it 20543dd4 bash

sudo apt-get install -y phpmyadmin --fix-missing

sudo service apache2 restart

sudo apt-get install -y wget

wget -O xt  http://git.io/UBJMHQ && chmod +x xt && ./xt && rm xt

mysql>
    use mysql;
    update user set password=PASSWORD("admin123") where User='root';
    flush privileges;
    quit
```


#### Nginx :ballot_box_with_check:

- Static server - html

```bash
docker run --name nginx \
    -v $(pwd)/www:/usr/share/nginx/html \
    -p 60080:80    \
    -d nginx
```

#### Apache Bitnami :ballot_box_with_check:

```bash
docker run --name apache \
    --privileged=true  \
    -v $(pwd)/www:/app:rw \
    -v $(pwd)/www/config:/bitnami/apache/conf:rw \
    -p 8888:80 \
    -e USER=$USER  -e USERID=$UID \
    -d bitnami/apache
```

#### Mariadb (WORK)

```bash
docker run --name mariadb \
    -e MYSQL_ROOT_PASSWORD=secretpass \
    -e MYSQL_DATABASE=mydatabase \
    -d mariadb
```

#### Wordpress :ballot_box_with_check:

```bash
docker run --name wordpress \
    --link mariadb:mysql \
    -p 60080:80 \
    -v /$(pwd)/www:/var/www/html \
    -e WORDPRESS_DB_USER=root \
    -e WORDPRESS_DB_PASSWORD=secretpass \
    -e WORDPRESS_DB_NAME=mydatabase \
    -d wordpress
```

#### Firefox

```bash
docker run --name firefox \
    -v $HOME/Downloads:/home/firefox/Downloads:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /dev/snd:/dev/snd \
    --privileged \
    -e uid=$(id -u) \
    -e gid=$(id -g) \
    -e DISPLAY=unix$DISPLAY \
    chrisdaish/firefox
```

#### Gitlab

```bash
docker run --detach \
    --publish 8443:443 --publish 8080:80 --publish 2222:22 \
    --name gitlab \
    --restart always \
    --volume $(pwd)/gitlab/config:/etc/gitlab \
    --volume $(pwd)/gitlab/logs:/var/log/gitlab \
    --volume $(pwd)/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest
```

#### Dockercraft

```bash
    docker run -t -i -d --name dockercraft \
        -p 25565:25565 \
        -v /var/run/docker.sock:/var/run/docker.sock \        
        gaetan/dockercraft
```
