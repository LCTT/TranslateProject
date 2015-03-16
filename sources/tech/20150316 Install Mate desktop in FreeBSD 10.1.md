Install Mate desktop in FreeBSD 10.1
================================================================================
![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/03/FreeBSD-790x494.jpg)

FreeBSD is fully text mode system, however some times new users might want to use GUI desktop environment. This tutorial will help you to install Mate Desktop in Freebsd 10.1.

Here is my test system details:

    root@Freebsd-unixmen:~ # uname -a
    FreeBSD Freebsd-unixmen 10.1-RELEASE FreeBSD 10.1-RELEASE #0 r274401: Tue Nov 11 21:02:49 UTC 2014     root@releng1.nyi.freebsd.org:/usr/obj/usr/src/sys/GENERIC  amd64
    root@Freebsd-unixmen:~

To start installing Mate desktop in FreeBSD 10.1, the following steps can be used.

    pkg install xf86-video-fbdev mate-desktop mate xorg

### Add the following lines to /etc/rc.conf ###

    moused_enable="YES"
    dbus_enable="YES"
    hald_enable="YES"

### Test the installation. ###

    xinit mate-session

![](http://www.unixmen.com/wp-content/uploads/2015/03/snapshot2.png)

Mate doesn’t have a display manager of its own. Hence we can use any other display managers like XDM, GDM, slim etc to use the login manager. Here let’s see how to configure Slim DM with Mate desktop.

### Install Slim ###

    pkg install slim

Add the following line to **/etc/rc.conf**:

    slim_enable="YES"

Add the following line to .xinitrc file in the user’s home directory

    exec mate-session

Reboot the machine. Now the machine will boot into Slim login where you can login to Mate session.

![](http://www.unixmen.com/wp-content/uploads/2015/03/snapshot3.png)

![](http://www.unixmen.com/wp-content/uploads/2015/03/snapshot4.png)

That’s it. Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-mate-desktop-freebsd-10-1/

作者：[M.el Khamlichi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/pirat9/