[#]: subject: "How to Check if Your Linux System Uses systemd"
[#]: via: "https://itsfoss.com/check-if-systemd/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Check if Your Linux System Uses systemd
======

Every mainstream Linux distro including Ubuntu, Fedora, openSUSE, and Arch uses systemd by default.

But there are [many non-systemd distros][1] like Void Linux that uses lightweight runit for better performance or Devuan that uses sysvinit on principal basis.

The problem comes when you are trying to follow some tutorial or documentation and it has commands specific to systemd or some other init service.

And this is where you have to check if your Linux system uses systemd or something else.

One way would to be check the process with PID 1 (after all, an init system is the first process to run on a Linux system).

```

    ps 1

```

But its output could be misleading as often it shows `/sbin/init` which is just a soft link to actual init process.

If you [follow that symbolic link][2], you can get the init system information. There are two ways of doing that:

  * Using the stat command
  * Using the readlink command



So let's start with the first one.

📋

These methods were tested with 6 init systems: Systemd, OpenRC, SysVnint, Busybox, runit, and s6.

### Method 1: Check if systemd is in use with the stat command

Here's how you can use the stat command to find out what init system you are using:

```

    stat /sbin/init

```

If you are using a systemd-powered distro, then it will show you the following output:

![][3]

But if you are using anything else than systemd, it will show the init name unless you are using SysVnit which will only show you `init` instead of `sysvnit`:

![SysVnit only displays "init" instead of sysvnit][4]

### Method 2: Check the init system using the readlink command

Unlike the previous method, when you use the readlink command, it will only print the name of the init system.

So if you want to know if you are using Systemd or not, simply use the following command:

```

    readlink /sbin/init

```

![][5]

If you are using the [OpenRC init service][6], then it will show the following output:

![][7]

But if you are using SysVnit, then, it will show you the following output:

![][8]

### Tiny 'script' I wrote for you

Another way is to check if the `/run/systemd/system` directory exists or not.

Well, the easiest way to find out is to [use an if-else bash command][9] in your terminal which will check if you are running a systemd-powered distro or not:

```

    if [ -d /run/systemd/system ]; then echo "System is running systemd"; else echo "System is not running systemd"; fi

```

![][10]

### More on systemd

Once you know you are using the systemd-powered distro, here's how you can [manage services using the systemctl command][11]:

![][12]

Want to [create a systemd service][13] from scratch? You can do that too:

![][12]

I hope you will find this guide helpful.

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-if-systemd/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/systemd-free-distros/
[2]: https://linuxhandbook.com/follow-symbolic-link/
[3]: https://itsfoss.com/content/images/2023/12/Use-the-stat-command-to-find-if-you-are-using-systemd-or-not.png
[4]: https://itsfoss.com/content/images/2023/12/Check-if-you-are-using-SysVnit-in-Linux-or-not.png
[5]: https://itsfoss.com/content/images/2023/12/Use-the-readlink-command-to-find-if-you-are-using-systemd-or-not-something-else.png
[6]: https://wiki.gentoo.org/wiki/OpenRC/openrc-init
[7]: https://itsfoss.com/content/images/2023/12/find-if-you-are-using-openrc-as-init-system.png
[8]: https://itsfoss.com/content/images/2023/12/How-to-find-out-if-you-are-using-SysVnit-as-init-system-in-Linux.png
[9]: https://itsfoss.com/bash-if-else/
[10]: https://itsfoss.com/content/images/2023/12/A-simple-if-else-statement-to-know-if-you-are-using-systemd-distro-or-not.png
[11]: https://linuxhandbook.com/systemctl-commands/
[12]: https://linuxhandbook.com/content/images/size/w256h256/2021/08/Linux-Handbook-New-Logo.png
[13]: https://linuxhandbook.com/create-systemd-services/
