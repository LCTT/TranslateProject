ORB: NEW GENERATION OF LINUX APPS ARE HERE
=============================================

![](http://itsfoss.com/wp-content/uploads/2016/05/ORB-Apps.jpeg)

We have talked about [installing applications offline in Ubuntu][1] before. And we are going to talk about it once again.

[Orbital Apps][2] has brought us a new type of application package, **ORB**, with portable applications, interactive installer support and offline usage ability.

Portable applications are always handy. Mostly because they can run on-the-fly without needing any administrator privileges, and also it can be carried around on small USB sticks along with all their settings and data. And these interactive installers will be able to allow us to install applications with ease.

### OPEN RUNNABLE BUNDLE (ORB)

ORB is a free & open-source package format and it’s different from the others in numerous ways. Some of the specifications of ORB is followings:

- **Compression**: All the packages are compressed with squashfs making them up-to 60% smaller.
- **Portable Mode**: If a portable ORB application is run from a removable drive, it’ll store its settings and data on that drive.
- **Security**: All ORB packages are signed with PGP/RSA and distributed via TLS 1.2.
- **Offline**: All the dependencies are bundled with the package, so no downloading dependencies anymore.
- **Open package**: ORB packages can be mounted as ISO images.

### VARIETY

ORB applications are now available in two varieties:

- Portable Applications
- SuperDEB

#### 1. PORTABLE ORB APPLICATIONS

Portable ORB Applications is capable of running right away without needing any installation beforehand. That means it’ll need no administrator privileges and no dependencies! You can just download them from the Orbital Apps website and get to work.

And as it supports Portable Mode, you can copy it on a USB stick and carry it around. All its settings and data will be stored with it on that USB stick. Just connect the USB stick with any system running on Ubuntu 16.04 and you’ll be ready to go.

##### AVAILABLE PORTABLE APPLICATIONS

Currently, more than 35 applications are available as portable packages, including some very popular applications like: [Deluge][3], [Firefox][4], [GIMP][5], [Libreoffice][6], [uGet][7] & [VLC][8].

For a full list of available packages, check the [Portable ORB Apps list][9].

##### USING PORTABLE APPLICATION

Follow the steps for using Portable ORB Applications:

- Download your desired package from the Orbital Apps site.
- Move it wherever you want (local drive / USB stick).
- Open the directory where you’ve stored the ORB package.

![](http://itsfoss.com/wp-content/uploads/2016/05/using-portable-orb-app-1-1024x576.jpg)

- Open Properties of the ORB package.

![](http://itsfoss.com/wp-content/uploads/2016/05/using-portable-orb-app-2.jpg)
>Add Execute permission to ORB package

- Add Execute permission from Permissions tab.
- Double-click on it.

Wait for a few seconds as it prepares itself for running. And you’re good to go.

#### 2. SUPERDEB

Another variety of ORB Applications is SuperDEB. SuperDEBs are easy and interactive installers that make the software installation process a lot smoother. If you don’t like to install software from terminal or software centers, SuperDEB is exactly for you.

And the most interesting part is that you won’t need an active internet connection for installing as all the dependencies are bundled with the installer.

##### AVAILABLE SUPERDEBS

More than 60 applications are currently available as SuperDEB. Some of the popular software among them are: [Chromium][10], [Deluge][3], [Firefox][4], [GIMP][5], [Libreoffice][6], [uGet][7] & [VLC][8].

For a full list of available SuperDEBs, check the [SuperDEB list][11].

##### USING SUPERDEB INSTALLER

- Download your desired SuperDEB from Orbital Apps site.
- Add **Execute permission** to it just like before ( Properties > Permissions ).
- Double-click on the SuperDEB installer and follow the interactive instructions:

![](http://itsfoss.com/wp-content/uploads/2016/05/Using-SuperDEB-Installer-1.png)
>Click OK

![](http://itsfoss.com/wp-content/uploads/2016/05/Using-SuperDEB-Installer-2.png)
>Enter your password and proceed

![](http://itsfoss.com/wp-content/uploads/2016/05/Using-SuperDEB-Installer-3.png)
>It’ll start Installing…

![](http://itsfoss.com/wp-content/uploads/2016/05/Using-SuperDEB-Installer-4.png)
>And soon it’ll be done…

- After finishing the installation, you’re good to use it normally.

### ORB APPS COMPATIBILITY

According to Orbital Apps, they are fully compatible with Ubuntu 16.04 [64 bit].

>Reading suggestion: [How To Know If You Have 32 Bit or 64 Bit Computer in Ubuntu][12].

As for other distros compatibility is not guaranteed. But we can say that, it’ll work on any Ubuntu 16.04 flavors (UbuntuMATE, UbuntuGNOME, Lubuntu, Xubuntu etc.) and Ubuntu 16.04 based distros (like upcoming Linux Mint 18). We currently have no information if Orbital Apps is planning on expanding its support for other Ubuntu versions/Linux Distros or not.

If you’re going to use Portable ORB applications often on your system, you can consider installing ORB Launcher. It’s not necessary but is recommended installing to get an improved experience. The shortest method of installing ORB Launcher is opening the terminal and enter the following command:

```
wget -O - https://www.orbital-apps.com/orb.sh | bash
```

You can find the detailed instructions at [official documentation][13].

### WHAT IF I NEED AN APP THAT’S NOT LISTED?

If you need an application as ORB package that is not available right now, you can [contact][14] Orbital Apps. And the good news is, Orbital Apps is working hard and planning on releasing a tool for creating ORB packages. So, hopefully, soon we’ll be able to make ORB packages ourselves!

Just to add, this was about installing apps offline. If you are interested, you should read [how to update or upgrade Ubuntu offline][15].

So, what do you think about Orbital Apps’ Portable Applications and SuperDEB installers? Will you try them?


----------------------------------
via: http://itsfoss.com/orb-linux-apps/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+ItsFoss+%28Its+FOSS%21+An+Open+Source+Blog%29

作者：[Munif Tanjim][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/munif/
[1]: http://itsfoss.com/cube-lets-install-linux-applications-offline/
[2]: https://www.orbital-apps.com/
[3]: https://www.orbital-apps.com/download/portable_apps_linux/deluge
[4]: https://www.orbital-apps.com/download/portable_apps_linux/firefox
[5]: https://www.orbital-apps.com/download/portable_apps_linux/gimp
[6]: https://www.orbital-apps.com/download/portable_apps_linux/libreoffice
[7]: https://www.orbital-apps.com/download/portable_apps_linux/uget
[8]: https://www.orbital-apps.com/download/portable_apps_linux/vlc
[9]: https://www.orbital-apps.com/download/portable_apps_linux/
[10]: https://www.orbital-apps.com/download/superdeb_installers/ubuntu_16.04_64bits/chromium/
[11]: https://www.orbital-apps.com/superdebs/ubuntu_16.04_64bits/
[12]: http://itsfoss.com/32-bit-64-bit-ubuntu/
[13]: https://www.orbital-apps.com/documentation
[14]: https://www.orbital-apps.com/contact
[15]: http://itsfoss.com/upgrade-or-update-ubuntu-offline-without-internet/
