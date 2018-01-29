# Remote


## Install

### **Server Side**

- Server Side - x2goserver

```bash
$
sudo apt-get install -y python-software-properties software-properties-common && \
sudo apt-add-repository -y ppa:x2go/stable && \
sudo apt-get update && \
sudo apt-get install -y x2goserver x2goserver-xsession
```

- Server Side - Desktop GUI

```bash
# Always Compatible and no Workarounds Required
# - LXDE
# - XFCE
# - MATE

# XFCE
sudo apt-get install -y xfce4


# MATE (RECOMMENDED)
sudo apt-add-repository -y ppa:ubuntu-mate-dev/ppa  && \
sudo apt-add-repository -y ppa:ubuntu-mate-dev/trusty-mate  && \
sudo apt-get update && sudo apt-get -y upgrade  && \
sudo apt-get install -y --no-install-recommends ubuntu-mate-core ubuntu-mate-desktop

# Reboot
sudo reboot
```

### Client

```bash
$
sudo apt-add-repository -y ppa:x2go/stable && \
sudo apt-get update && \
sudo apt-get install -y x2goclient
```
