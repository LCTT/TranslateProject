[#]: subject: (Linux package management with apt)
[#]: via: (https://opensource.com/article/21/6/apt-linux)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)
[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Linux package management with apt
======
Learn how to install packages on Debian-based Linux distros with the apt
command, then download our cheat sheet to keep the right command at your
fingertips.
![bash logo on green background][1]

On Linux, [package managers][2] help you handle updates, uninstalls, troubleshooting, and more for the software on your computer. Seth Kenlon [wrote about `dnf`][3], the command-line package management tool for installing software in RHEL, CentOS, Fedora, Mageia, OpenMandriva, and other Linux distros.

Debian and Debian-based distros such as MX Linux, Deepin, Ubuntu—and distros based on Ubuntu, such as Linux Mint and Pop!_OS—have `apt`, a "similar but different" tool. In this article, I'll follow Seth's examples—but with `apt`—to show you how to use it.

Before I start, I want to mention four `apt`-related tools for installing software:

  * [Synaptic][4] is a GTK+ based graphical user interface (GUI) front end for `apt`.
  * [Aptitude][5] is an Ncurses-based full-screen command-line front end for `apt`.
  * There are `apt-get`, `apt-cache`, and other predecessors of `apt`.
  * [Dpkg][6] is the "behind the scenes" package manager `apt` uses to do the heavy lifting.



There are other packaging systems, such as [Flatpak][7] and [Snap][8], that you might run into on Debian and Debian-based systems, but I'm not going to discuss them here. There are also application "stores," such as [GNOME Software][9], that overlap with `apt` and other packaging technologies; again, I'm not going to discuss them here. Finally, there are other Linux distros such as [Arch][10] and [Gentoo][11] that use neither `dnf` nor `apt`, and I'm not going to discuss those here either!

With all the things I'm not going to discuss here, you may be wondering what tiny subset of software `apt` handles. Well, on my Ubuntu 20.04, `apt` gives me access to 69,371 packages, from the `0ad` real-time strategy game of ancient warfare to the `zzuf` transparent application fuzzer. Not bad at all.

### Finding software with apt

The first step in using a package manager such as `apt` is finding a software package of interest. Seth's `dnf` article used the [Cockpit][12] server management application as an example, so I will, too:


```
$ apt search cockpit
Sorting... Done
Full Text Search... Done
389-ds/hirsute,hirsute 1.4.4.11-1 all
  389 Directory Server suite - metapackage

cockpit/hirsute,hirsute 238-1 all
  Web Console for Linux servers

...
$
```

The second package above is the one you're after (it's the line beginning with `cockpit/hirsute`). If you decide you want to install it, enter:


```
`$ sudo apt install cockpit`
```

`apt` will take care of installing Cockpit and all the bits and pieces, or _dependencies_, needed to make it work. Sometimes that's all that's needed; sometimes it's not. It's possible that having a bit more information could be useful in deciding whether you really want to install this application.

### Package metadata

To find out more about a package, use the `apt show` command:


```
$ apt show cockpit
Package: cockpit
Version: 238-1
Priority: optional
Section: universe/admin
Origin: Ubuntu
Maintainer: Ubuntu Developers &lt;[ubuntu-devel-discuss@lists.ubuntu.com][13]&gt;
Original-Maintainer: Utopia Maintenance Team &lt;[pkg-utopia-maintainers@lists.alioth.debian.org][14]&gt;
Bugs: <https://bugs.launchpad.net/ubuntu/+filebug>
Installed-Size: 88.1 kB
Depends: cockpit-bridge (&gt;= 238-1), cockpit-ws (&gt;= 238-1), cockpit-system (&gt;= 238-1)
Recommends: cockpit-storaged (&gt;= 238-1), cockpit-networkmanager (&gt;= 238-1), cockpit-packagekit (&gt;= 238-1)
Suggests: cockpit-doc (&gt;= 238-1), cockpit-pcp (&gt;= 238-1), cockpit-machines (&gt;= 238-1), xdg-utils
Homepage: <https://cockpit-project.org/>
Download-Size: 21.3 kB
APT-Sources: <http://ca.archive.ubuntu.com/ubuntu> hirsute/universe amd64 Packages
Description: Web Console for Linux servers
 The Cockpit Web Console enables users to administer GNU/Linux servers using a
 web browser.
 .
 It offers network configuration, log inspection, diagnostic reports, SELinux
 troubleshooting, interactive command-line sessions, and more.

$
```

In particular, notice the `Description` field, which tells you more about the application. The `Depends` field says what else must be installed, and `Recommends` shows what other—if any—cooperating components are suggested alongside it. The `Homepage` field offers a URL in case you need more info.

### What package provides a file?

Sometimes you don't know the package name, but you know a file that must be in a package. Seth offers as an example the `qmake-qt5` utility. Using `apt search` doesn't find it:


```
$ apt search qmake-qt5
Sorting... Done
Full Text Search... Done
$
```

However, a related command, `apt-file` will explore inside packages:


```
$ apt-file search qmake-qt5
qt5-qmake-bin: /usr/share/man/man1/qmake-qt5.1.gz
$
```

This turns up a man page for `qmake-qt5` that is part of a package called `qt5-qmake-bin`. Note that this package name reverses the `qmake` and `qt5` parts.

### What files are included in a package?

That handy `apt-file` command also tells which files are included in a given package. For example:


```
$ apt-file list cockpit
cockpit: /usr/share/doc/cockpit/TODO.Debian
cockpit: /usr/share/doc/cockpit/changelog.Debian.gz
cockpit: /usr/share/doc/cockpit/copyright
cockpit: /usr/share/man/man1/cockpit.1.gz
cockpit: /usr/share/metainfo/cockpit.appdata.xml
cockpit: /usr/share/pixmaps/cockpit.png
$
```

Note that this is distinct from the info provided by the `apt show` command, which lists the package's dependencies (other packages that must be installed).

### Removing an application

You can also remove packages with `apt`. For example, to remove the `apt-file` application:


```
`$ sudo apt purge apt-file`
```

Note that a superuser must run `apt` to install or remove applications.

Removing a package doesn't automatically remove all the dependencies that `apt` installs along the way. However, it's easy to carry out that little bit of tidying:


```
`$ sudo apt autoremove`
```

### Getting to know apt

As Seth wrote, "the more you know about how your package manager works, the easier it is for you to install and query applications when necessary."

Even if you're not a regular `apt` user, knowing it can be useful when you need to work at the command line while installing or removing packages (for example, on a remote server or when following a how-to published by some helpful soul). You may also need to know a bit about Dkpg (mentioned above); for example, some software creators provide a bare `.pkg` file.

I find the Synaptic package manager to be a really useful tool on my desktop, but I also use `apt` on a handful of servers that I maintain for various purposes.

**[Download our `apt` cheat sheet][15]** to get used to the command and try some new tricks with it. Once you do, you might find it hard to use anything else.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/apt-linux

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/21/2/linux-package-management
[3]: https://opensource.com/article/21/5/dnf
[4]: https://www.nongnu.org/synaptic/
[5]: https://wiki.debian.org/Aptitude
[6]: https://wiki.debian.org/Teams/Dpkg
[7]: https://flatpak.org/
[8]: https://snapcraft.io/
[9]: https://wiki.gnome.org/Apps/Software
[10]: https://archlinux.org/
[11]: https://www.gentoo.org/
[12]: https://opensource.com/article/20/11/cockpit-server-management
[13]: mailto:ubuntu-devel-discuss@lists.ubuntu.com
[14]: mailto:pkg-utopia-maintainers@lists.alioth.debian.org
[15]: https://opensource.com/downloads/apt-cheat-sheet
