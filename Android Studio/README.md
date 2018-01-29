# Android Studio



## Install Pre

```bash
$
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
sudo apt-get install lib64stdc++6:i386
cd $ANDROID_HOME/emulator/lib64/libstdc++
mv libstdc++.so.6 libstdc++.so.6.bak
ln -s /usr/lib64/libstdc++.so.6 $ANDROID_HOME/emulator/lib64/libstdc++


# |
# | ::::::: VM acceleration
# |
sudo apt-get install cpu-checker
kvm-ok
```

## Set environment variable

- **Add the following lines to your $HOME/.bash_profile config file:**

```bash
# |::::::::::::: Android ::::::::::::::>>>
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
# |::::::::::::: Android ::::::::::::::<<<
```


# ## Error  Register App

- Delete Emulator and run:

```bash
adb kill-server && adb start-server
```
