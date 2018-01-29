# VPN

### Reference

- https://medium.com/pritunl-tutorials/pritunl-tutorial-ed50a5d2a4eb#.anfzk5cwl
- https://www.linode.com/docs/networking/vpn/pritunl-vpn-ubuntu
- https://pritunl.com/
- https://client.pritunl.com/
- https://github.com/Nyr/openvpn-install

#### Option 1

- [Install openVpn Server](#install-openVpn-server)
- [Install Pritunl Client](#install-pritunl-client)

#### Option 2

- [Install Pritunl Server](#install-pritunl-server)
- [Install Pritunl Client](#install-pritunl-client)

------

# Install Pritunl Server

- **Create bash script and execute**

Ubuntu 16.04 

```bash
#!/bin/bash
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
echo "deb http://repo.pritunl.com/stable/apt xenial main" > /etc/apt/sources.list.d/pritunl.list
tee -a /etc/yum.repos.d/mongodb-org-3.2.repo << EOF
[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target
EOF
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 42F3E95A2C4F08279C4960ADD68FA50FEA312927
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
apt-get --assume-yes update
apt-get --assume-yes upgrade
apt-get --assume-yes install pritunl mongodb-org
systemctl start pritunl mongod
systemctl enable pritunl mongod
```

- **Go to Web GUI**

 https://SERVER_IP/

- **Print and Enter the Key**

 ```bash
 $ pritunl setup-key
 ```
- **Access Printunl**

 username: ```pritunl```

 password: ```pritunl```

- **Change User and Password**
- **Add Organization**
- **Add User**
- **Add Server**
- **Attach Organization**
- **Go to user**
- **Download config file**
- **Install Pritunl Client** [:arrow_right: :link:](#install-pritunl-client)

- **Open Port**

```bash
$ ufw allow 19731
```

------


# Install OpenVpn Server (Recommended)

https://github.com/Nyr/openvpn-install

- **Install openVpn**

```
    $ wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh
```

- **Download config file**

```
    $ scp SERVER:/root/client.ovpn .
```

- **Install Pritunl Client** [:arrow_right: :link:](#install-pritunl-client)

-----

# Install Pritunl Client

https://pritunl.com/

```bash
sudo tee -a /etc/apt/sources.list.d/pritunl.list << EOF
deb http://repo.pritunl.com/stable/apt xenial main
EOF

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A && \
sudo apt-get update && \
sudo apt-get install pritunl-client-gtk
```

- **Import File to client**
- **Connect**
