
# Install Android studio

[Android Studio](https://developer.android.co)

[Ubuntu Make](https://github.com/ubuntu/ubuntu-make)

--------------------------------------------------------------------------------

## Install via Ubuntu Make

```bash
sudo add-apt-repository -y ppa:lyzardking/ubuntu-make && \
sudo apt-get update && \
sudo apt -y install ubuntu-make

umake android --accept-license
```

## Add Android Studio Command line and Path

```bash
$ sudo ln -s "${HOME}/.local/share/umake/android/android-studio/bin/studio.sh" "/usr/bin/android-studio"
```

- Add ```vim ~/.zshrc``` (change ANDROID_HOME path to SDK on your machine)

+++
```bash
cat >> ${HOME}/.zshrc <<'endmsg'
# |::::::::::::: Android-SDK ::::::::::::::>>>
export ANDROID_HOME=/media/o/Tera/Apps/android-studio-sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
# |::::::::::::: Android-SDK ::::::::::::::<<<
endmsg
```

## Create Desktop Entry

Open: Android Studio

Wellcome to Android Studio -> Configure -> Create Desktop Entry

or

Android Studio -> Tools -> Create Desktop Entry

--------------------------------------------------------------------------------

## Configuring VM acceleration on Linux

[VM acceleration](https://developer.android.com/studio/run/emulator-acceleration.html?utm_source=android-studio#vm-linux)

```bash
$ sudo apt-get install -y cpu-checker

$ egrep -c '(vmx|svm)' /proc/cpuinfo
8

$ kvm-ok
INFO: /dev/kvm exists
KVM acceleration can be used

$ sudo apt-get install -y \
    qemu-kvm \
    libvirt-bin \
    ubuntu-vm-builder \
    bridge-utils \
    ia32-libs-multiarch
```

--------------------------------------------------------------------------------

## Increase the number of inotify watches

```bash
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```

--------------------------------------------------------------------------------


## Error Register App

- Delete Emulator and run:

```bash
adb kill-server && adb start-server
```
