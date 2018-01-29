# Syncthing



```bash
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -

# Add the "release" channel to your APT sources:
echo "deb http://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update and install syncthing:
sudo apt-get update
sudo apt-get install syncthing
```

vim ~/.config/syncthing/config.xml

+++
```xml
---
<address>127.0.0.1:8080</address>
+++
<address>0.0.0.0:8080</address>
```

```bash
$ sudo systemctl enable syncthing@$USER.service
$ sudo systemctl start syncthing@$USER.servic
```
