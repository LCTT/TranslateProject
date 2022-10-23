[#]: subject: "How to find GNOME Shell version from the Terminal"
[#]: via: "https://www.debugpoint.com/find-gnome-version/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to find GNOME Shell version from the Terminal
======

**Here’s a quick guide on finding the GNOME desktop (or Shell) version via the command line and GUI.**

### Find GNOME Shell Version

You need to find the GNOME version number you are running for many use cases. For example, if you are a developer, you might want to find out compatible packages and ensure that all the dependencies are met.

So, to do that, here’s how you can find the GNOME version number.

Firstly, open a terminal. And run the following command.

```
gnome-shell --version
```

![version via terminal][1]

It will give you the GNOME shell version number currently running in your system.

Similarly, if you are using the desktop environment, then open Settings. Then click on the About tab.

Here you can see the GNOME Version at the bottom.

![version via settings window][2]

### Usage Notes

There might be situations where you use a different desktop environment (such as MATE or Xfce), which also uses GNOME components and packages.

Those desktop environments don’t use the gnome-shell package, of course. So, if you want to find out the GNOME packages and their version used in those specific cases, you can see the contents of this file below. This is for Ubuntu and Debian-based distros only.

```
/var/lib/apt/extended_states
```

For example, the file contains a below GNOME package.

Now that you know the package name, you can further find out its version installed in your system using the below command. Similar DNF command you can find in [this guide][3] for RPM-based distros.

```
apt show gnome-weather
```

**Sample output:**

```
debugpoint@debugpoint-mate:~$ apt show gnome-weather
Package: gnome-weather
Version: 43.0-1
Priority: optional
Section: universe/gnome
Origin: Ubuntu
Maintainer: Ubuntu Developers [ubuntu-devel-discuss@lists.ubuntu.com][4]
Original-Maintainer: Debian GNOME Maintainers [pkg-gnome-maintainers@lists.alioth.debian.org][5]
```

### Wrapping Up

This guide teaches you how to find the version of GNOME and some additional methods.

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/find-gnome-version/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/10/version-via-terminal.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2022/10/version-via-settings-window.jpg
[3]: https://www.debugpoint.com/dnf-commands-examples/
[4]: https://www.debugpoint.commailto:ubuntu-devel-discuss@lists.ubuntu.com
[5]: https://www.debugpoint.commailto:pkg-gnome-maintainers@lists.alioth.debian.org
