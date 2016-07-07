INSTALL MATE 1.14 IN UBUNTU MATE 16.04 (XENIAL XERUS) VIA PPA
=================================================================

MATE Desktop 1.14 is now available for Ubuntu MATE 16.04 (Xenial Xerus). According to the release [announcement][1], it took about 2 months to release MATE Desktop 1.14 in a PPA because everything has been well tested, so you shouldn't encounter any issues.

![](https://2.bp.blogspot.com/-v38tLvDAxHg/V1k7beVd5SI/AAAAAAAAX7A/1X72bmQ3ia42ww6kJ_61R-CZ6yrYEBSpgCLcB/s400/mate114-ubuntu1604.png)

**The PPA currently provides MATE 1.14.1 (Ubuntu MATE 16.04 ships with MATE 1.12.x by default), which includes changes such as:**

- client-side decoration apps now render correctly in all themes;
- touchpad configuration now supports edge and two-finger scrolling independently;
- python extensions in Caja can now be managed separately;
- all three window focus modes are selectable;
- MATE Panel now has the ability to change icon sizes for menubar and menu items;
- volume and Brightness OSD can now be enabled/disabled;
- many other improvements and bug fixes.

MATE 1.14 also includes improved support for GTK+3 across the entire desktop, as well as various other GTK+3 tweaks however, the PPA packages are built with GTK+2 "to ensure compatibility with Ubuntu MATE 16.04 and all the 3rd party MATE applets, plugins and extensions", mentions the Ubuntu MATE blog.

A complete MATE 1.14 changelog can be found [HERE][2].

### Upgrade to MATE Desktop 1.14.x in Ubuntu MATE 16.04

To upgrade to the latest MATE Desktop 1.14.x in Ubuntu MATE 16.04 using the official Xenial MATE PPA, open a terminal and use the following commands:

```
sudo apt-add-repository ppa:ubuntu-mate-dev/xenial-mate
sudo apt update
sudo apt dist-upgrade
```

**Note**: mate-netspeed applet will be removed when upgrading. That's because the applet is now part of the mate-applets package, so it's still available.

Once the upgrade finishes, restart your system. That's it!

### How to revert the changes

If you're not satisfied with MATE 1.14, you encountered some bugs, etc., and you want to go back to the MATE version available in the official repositories, you can purge the PPA and downgrade the packages. 

To do this, use the following commands:

```
sudo apt install ppa-purge
sudo ppa-purge ppa:ubuntu-mate-dev/xenial-mate
```

After all the MATE packages are downgraded, restart the system.

via [Ubuntu MATE blog][3]

--------------------------------------------------------------------------------

via: http://www.webupd8.org/2016/06/install-mate-114-in-ubuntu-mate-1604.html

作者：[Andrew][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.webupd8.org/p/about.html
[1]: https://ubuntu-mate.org/blog/mate-desktop-114-for-xenial-xerus/
[2]: http://mate-desktop.com/blog/2016-04-08-mate-1-14-released/
[3]: https://ubuntu-mate.org/blog/mate-desktop-114-for-xenial-xerus/
