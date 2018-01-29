# Rocket.Chat


## Install


#### Install Git

https://github.com/Mayccoll/Linux

#### Install Meteor

```bash
  $
  curl https://install.meteor.com/ | sh
```

#### Fix locales

https://github.com/Mayccoll/Linux/blob/master/commands.md


#### Install Rocket.chat

git clone https://github.com/RocketChat/Rocket.Chat.git
cd Rocket.Chat
meteor




Rocket Chat
-----------

- REF:

https://www.rosehosting.com/blog/install-rocketchat-on-an-ubuntu-14-04-vps/


```bash
sudo apt-get update && sudo apt-get -y upgrade

sudo apt-get install -y software-properties-common \
                        git \
                        nano \
                        curl \
                        build-essential \
                        vim

sudo apt-get install -y nodejs npm

sudo npm install nave -g

sudo nave usemain 0.10.40

sudo npm install pm2 -g

sudo pm2 startup

curl --location https://install.meteor.com | sudo bash -

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

sudo apt-get update && sudo apt-get install --yes mongodb-org
```

```
sudo vim /etc/mongod.conf
```

```
+++
replSet=001-rs
```

```
sudo vim /etc/mongod.conf
```

```
---
bind_ip = 127.0.0.1
+++
bind_ip = 0.0.0.0
```

```
sudo service mongod restart
```

```
sudo mongo
> rs.initiate()

{
  "info2" : "no configuration explicitly specified -- making one",
  "me" : "vps:27017",
  "info" : "Config now saved locally.  Should come online in about a minute.",
  "ok" : 1
}
> exit
```

```
sudo git clone https://github.com/RocketChat/Rocket.Chat.git /opt/rocket.chat

cd /opt/rocket.chat

sudo git checkout $(git describe --tags $(git rev-list --tags --max-count))

sudo meteor build --server "localhost" --directory .

cd /opt/rocket.chat/bundle/programs/server 

sudo npm install

cd  /opt/rocket.chat/bundle/

sudo vim pm2-rocket-chat.json
```

```
+++
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
```

```
sudo mkdir /opt/rocket.chat/logs
sudo pm2 start pm2-rocket-chat.json
sudo pm2 save
```


Update
------

sudo pm2 stop 0