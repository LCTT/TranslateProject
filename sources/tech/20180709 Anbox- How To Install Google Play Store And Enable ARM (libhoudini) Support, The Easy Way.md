Anbox: How To Install Google Play Store And Enable ARM (libhoudini) Support, The Easy Way
======
**[Anbox][1], or Android in a Box, is a free and open source tool that allows running Android applications on Linux.** It works by running the Android runtime environment in an LXC container, recreating the directory structure of Android as a mountable loop image, while using the native Linux kernel to execute applications.

Its key features are security, performance, integration and convergence (scales across different form factors), according to its website.

**Using Anbox, each Android application or game is launched in a separate window, just like system applications** , and they behave more or less like regular windows, showing up in the launcher, can be tiled, etc.

By default, Anbox doesn't ship with the Google Play Store or support for ARM applications. To install applications you must download each app APK and install it manually using adb. Also, installing ARM applications or games doesn't work by default with Anbox - trying to install ARM apps results in the following error being displayed:
```
Failed to install PACKAGE.NAME.apk: Failure [INSTALL_FAILED_NO_MATCHING_ABIS: Failed to extract native libraries, res=-113]

```

You can set up both Google Play Store and support for ARM applications (through libhoudini) manually for Android in a Box, but it's a quite complicated process. **To make it easier to install Google Play Store and Google Play Services on Anbox, and get it to support ARM applications and games (using libhoudini), the folks at[geeks-r-us.de][2] (linked article is in German) have created a [script][3] that automates these tasks.**

Before using this, I'd like to make it clear that not all Android applications and games work in Anbox, even after integrating libhoudini for ARM support. Some Android applications and games may not show up in the Google Play Store at all, while others may be available for installation but will not work. Also, some features may not be available in some applications.

### Install Google Play Store and enable ARM applications / games support on Anbox (Android in a Box)

These instructions will obviously not work if Anbox is not already installed on your Linux desktop. If you haven't already, install Anbox by following the installation instructions found

`anbox.appmgr`

at least once after installing Anbox and before using this script, to avoid running into issues.

1\. Install the required dependencies (`wget` , `lzip` , `unzip` and `squashfs-tools`).

In Debian, Ubuntu or Linux Mint, use this command to install the required dependencies:
```
sudo apt install wget lzip unzip squashfs-tools

```

2\. Download and run the script that automatically downloads and installs Google Play Store (and Google Play Services) and libhoudini (for ARM apps / games support) on your Android in a Box installation.

**Warning: never run a script you didn't write without knowing what it does. Before running this script, check out its [code][4]. **

To download the script, make it executable and run it on your Linux desktop, use these commands in a terminal:
```
wget https://raw.githubusercontent.com/geeks-r-us/anbox-playstore-installer/master/install-playstore.sh
chmod +x install-playstore.sh
sudo ./install-playstore.sh

```

3\. To get Google Play Store to work in Anbox, you need to enable all the permissions for both Google Play Store and Google Play Services

To do this, run Anbox:
```
anbox.appmgr

```

Then go to `Settings > Apps > Google Play Services > Permissions` and enable all available permissions. Do the same for Google Play Store!

You should now be able to login using a Google account into Google Play Store.

Without enabling all permissions for Google Play Store and Google Play Services, you may encounter an issue when trying to login to your Google account, with the following error message: " _Couldn't sign in. There was a problem communicating with Google servers. Try again later_ ", as you can see in this screenshot:

After logging in, you can disable some of the Google Play Store / Google Play Services permissions.

**If you're encountering some connectivity issues when logging in to your Google account on Anbox,** make sure the `anbox-bride.sh` is running:

  * to start it:


```
sudo /snap/anbox/current/bin/anbox-bridge.sh start

```

  * to restart it:


```
sudo /snap/anbox/current/bin/anbox-bridge.sh restart

```

You may also need to install the dnsmasq package if you continue to have connectivity issues with Anbox, according to


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/07/anbox-how-to-install-google-play-store.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://anbox.io/
[2]:https://geeks-r-us.de/2017/08/26/android-apps-auf-dem-linux-desktop/
[3]:https://github.com/geeks-r-us/anbox-playstore-installer/
[4]:https://github.com/geeks-r-us/anbox-playstore-installer/blob/master/install-playstore.sh
[5]:https://docs.anbox.io/userguide/install.html
[6]:https://github.com/anbox/anbox/issues/118#issuecomment-295270113
