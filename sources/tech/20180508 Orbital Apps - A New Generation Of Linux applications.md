translating---geekpi

Orbital Apps – A New Generation Of Linux applications
======

![](https://www.ostechnix.com/wp-content/uploads/2016/05/orbital-apps-720x340.jpg)

Today, we are going to learn about **Orbital Apps** or **ORB** ( **O** pen **R** unnable **B** undle) **apps** , a collection of free, cross-platform, open source applications. All ORB apps are portable. You can either install them on your Linux system or on your USB drive, so that you you can use the same app on any system. There is no need of root privileges, and there are no dependencies. All required dependencies are included in the apps. Just copy the ORB apps to your USB drive and plug it on any Linux system, and start using them in no time. All settings and configurations, and data of the apps will be stored on the USB drive. Since there is no need to install the apps on the local drive, we can run the apps either in online or offline computers. That means we don’t need Internet to download any dependencies.

ORB apps are compressed up to 60% smaller, so we can store and use them even from the small sized USB drives. All ORB apps are signed with PGP/RSA and distributed via TLS 1.2. All Applications are packaged without any modifications, they are not even re-compiled. Here is the list of currently available portable ORB applications.

  * abiword
  * audacious
  * audacity
  * darktable
  * deluge
  * filezilla
  * firefox
  * gimp
  * gnome-mplayer
  * hexchat
  * inkscape
  * isomaster
  * kodi
  * libreoffice
  * qbittorrent
  * sound-juicer
  * thunderbird
  * tomahawk
  * uget
  * vlc
  * And more yet to come.



Orb is open source, so If you’re a developer, feel free to collaborate and add more applications.

### Download and use portable ORB apps

As I mentioned already, we don’t need to install portable ORB apps. However, ORB team strongly recommends you to use **ORB launcher** to get better experience. ORB launcher is a small installer file (less than 5MB) that will help you to launch the ORB apps with better and smoother experience.

Let us install ORB launcher first. To do so, [**download the ORB launcher**][1]. You can manually download ORB launcher ISO and mount it on your file manager. Or run any one of the following command in Terminal to install it:
```
$ wget -O - https://www.orbital-apps.com/orb.sh | bash

```

If you don’t have wget, run:
```
$ curl https://www.orbital-apps.com/orb.sh | bash

```

Enter the root user password when it asked.

That’s it. Orbit launcher is installed and ready to use.

Now, go to the [**ORB portable apps download page**][2], and download the apps of your choice. For the purpose of this tutorial, I am going to download Firefox application.

Once you downloaded the package, go to the download location and double click ORB app to launch it. Click Yes to confirm.

![][4]

Firefox ORB application in action!

![][5]

Similarly, you can download and run any applications instantly.

If you don’t want to use ORB launcher, make the downloaded .orb installer file as executable and double click it to install. However, ORB launcher is recommended and it gives you easier and smoother experience while using orb apps.

As far as I tested ORB apps, they worked just fine out of the box. Hope this helps. And, that’s all for now. Have a good day!

Cheers!!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/orbitalapps-new-generation-ubuntu-linux-applications/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.orbital-apps.com/documentation/orb-launcher-all-installers
[2]:https://www.orbital-apps.com/download/portable_apps_linux/
[3]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]:http://www.ostechnix.com/wp-content/uploads/2016/05/orbital-apps-1-2.png
[5]:http://www.ostechnix.com/wp-content/uploads/2016/05/orbital-apps-2.png
