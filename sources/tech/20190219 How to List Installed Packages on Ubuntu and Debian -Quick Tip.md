[#]: collector: (lujun9972)
[#]: translator: ( guevaraya)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to List Installed Packages on Ubuntu and Debian [Quick Tip])
[#]: via: (https://itsfoss.com/list-installed-packages-ubuntu)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to List Installed Packages on Ubuntu and Debian [Quick Tip]
======

So you [installed Ubuntu and started using][1] it extensively. Somewhere down the line, you are bound to lose the track of the software that you had installed over the time.

That’s perfectly normal. No one expects you to remember all the packages installed on your system. But the question arises, how to know what packages have been installed? How to see the installed packages?

### List installed packages in Ubuntu and Debian

![List installed Packages][2]

If you use [apt command][3] extensively, you would probably expect a command like apt list installed packages. You are not entirely wrong here.

While [apt-get command][4] doesn’t have a straightforward option like apt-get list installed packages, apt has a command for this.

```
apt list --installed
```

This will list all the packages that have been installed using apt. It will also list the packages that were installed as a dependency. Which means that not only you’ll have the applications you installed, you’ll also have a huge list of libraries and other packages that you didn’t install directly.

![List installed packages in Ubuntu with apt command][5]Listing installed packages with apt command

Since the list of installed packages is a huge one, it would be a better idea to use grep and filter the output for a certain package.

```
apt list --installed | grep program_name
```

Note that the above method also lists the [applications installed with .deb files][6]. That’s cool, isn’t it?

If you have read my [apt vs apt-get comparison][7] article, you probably already know that both apt and apt-get basically use [dpkg][8]. This means you can use dpkg command to list all the installed packages in Debian.

```
dpkg-query -l
```

You can filter the output with grep again to search for a specific package.

![Listing installed packages with dpkg command][9]![Listing installed packages with dpkg command][9]Listing installed packages with dpkg

So far, you have dealt with applications installed with Debian’s package manager. What about Snap and Flatpak applications? How to list them because they are not accessible with apt and dpkg?

To show all the [Snap packages][10] installed on your system, use this command:

```
snap list
```

Snap list also indicates which applications are from a verified publisher with a green tick.

![List installed packages with snap][11]Listing installed Snap packages

To list all the [Flatpak packages][12] installed on your system, use this:

```
flatpak list
```

Let me summarize it for you.

Summary

To list packages using apt command:

**apt** **list –installed**

To list packages using dpkg command:

**dpkg-query -l**

To list Snap packages installed on your system:

**snap list**

To list Flatpak packages installed on your system:

**flatpak list**

### List the recently installed packages

So far you saw the list of installed packages in alphabetical order. What if you want to see the packages that have been installed recently?

Thankfully, a Linux system keeps a log of everything that happens in your system. You can refer to the logs to see the recently installed packages.

There are a couple of ways to do this. You can either use the dpkg command’s log or the apt command’s log.

You’ll have to use grep command to filter the result to list the installed packages only.

```
grep " install " /var/log/dpkg.log
```

This will list all the packages including the dependencies that were installed recently on your system along with the time of installation.

```
2019-02-12 12:41:42 install ubuntu-make:all 16.11.1ubuntu1
2019-02-13 21:03:02 install xdg-desktop-portal:amd64 0.11-1
2019-02-13 21:03:02 install libostree-1-1:amd64 2018.8-0ubuntu0.1
2019-02-13 21:03:02 install flatpak:amd64 1.0.6-0ubuntu0.1
2019-02-13 21:03:02 install xdg-desktop-portal-gtk:amd64 0.11-1
2019-02-14 11:49:10 install qml-module-qtquick-window2:amd64 5.9.5-0ubuntu1.1
2019-02-14 11:49:10 install qml-module-qtquick2:amd64 5.9.5-0ubuntu1.1
2019-02-14 11:49:10 install qml-module-qtgraphicaleffects:amd64 5.9.5-0ubuntu1
```

You can also use the history of apt command. This will show only the programs that you installed using apt command. It won’t show the dependencies installed with it, though the details are present in the logs. Sometimes, you just want to see that, right?

```
grep " install " /var/log/apt/history.log
```

The output should be something like this:

```
Commandline: apt install pinta
Commandline: apt install pinta
Commandline: apt install tmux
Commandline: apt install terminator
Commandline: apt install moreutils
Commandline: apt install ubuntu-make
Commandline: apt install flatpak
Commandline: apt install cool-retro-term
Commandline: apt install ubuntu-software
```

![List recently installed packages][13]Listing recently installed packages

The history log of apt is quite useful because it shows the time when the apt command was run, the user who ran the command and the packages that were installed by a command.

### Bonus Tip: Show installed applications in Software Center

If you are not comfortable with the terminal and the commands, you still has a way to see the applications installed on your system.

You can open the Software Center and click on the Installed tab. You’ll see the list of applications that have been installed on your system.

![List Installed Software in Ubuntu Software Center][14]Showing installed applications in Software Center

It won’t show the libraries and other command line stuff though but perhaps you don’t want to see that as you are more GUI centric. Otherwise, you can always use the Synaptic Package Manager.

**That’s it**

I hope this quick little tutorial helped you to see the list of installed packages on Ubuntu and Debian based distributions.

If you have questions or suggestions to improve this article, please leave a comment below.


--------------------------------------------------------------------------------

via: https://itsfoss.com/list-installed-packages-ubuntu

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/getting-started-with-ubuntu/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/list-installed-packages.png?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/apt-command-guide/
[4]: https://itsfoss.com/apt-get-linux-guide/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/list-installed-packages-in-ubuntu-with-apt.png?resize=800%2C407&ssl=1
[6]: https://itsfoss.com/install-deb-files-ubuntu/
[7]: https://itsfoss.com/apt-vs-apt-get-difference/
[8]: https://wiki.debian.org/dpkg
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/list-installed-packages-with-dpkg.png?ssl=1
[10]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/list-installed-snap-packages.png?ssl=1
[12]: https://itsfoss.com/flatpak-guide/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/apt-list-recently-installed-packages.png?resize=800%2C187&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/installed-software-ubuntu.png?ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/list-installed-packages.png?fit=800%2C450&ssl=1
