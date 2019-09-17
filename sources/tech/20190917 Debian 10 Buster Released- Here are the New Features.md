[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Debian 10 Buster Released! Here are the New Features)
[#]: via: (https://itsfoss.com/debian-10-buster/)
[#]: author: (Shirish https://itsfoss.com/author/shirish/)

Debian 10 Buster Released! Here are the New Features
======

[Debian 10 Buster][1] has been released. Let’s see what are the new features and how can you download Debian 10 Buster.

### What’s new in Debian 10 Buster Release

Here are a few visual and under the hood changes in the this major release of Debian.

#### New theme and wallpaper

The Debian theme for Buster is called [FuturePrototype][2] and can be seen below:

![Debian Buster FuturePrototype Theme][3]

#### 1\. GNOME Desktop 3.30

The GNOME desktop which was 1.3.22 in Debian Stretch is updated to 1.3.30 in Buster. Some of the new packages included in this GNOME desktop release are gnome-todo, tracker instead of tracker-gui, dependency against gstreamer1.0-packagekit so there is automatic codec installation for playing movies etc. The big move has been all packages being moved from libgtk2+ to libgtk3+ .

#### 2\. Linux Kernel 4.19.0-4

Debian uses LTS Kernel versions so you can expect much better hardware support and long 5 year maintainance and support cycle from Debian. You can [check Linux kernel version][4]:

```
$ uname -r
4.19.0-4-amd64
```

#### 3\. OpenJDK 11.0

For a long time Debian was stuck on OpenJDK 8.0. Now in Debian Buster we have moved to OpenJDK 11.0 and have a team which will take care of new versions.

#### 4\. AppArmor Enabled by Default

In Debian Buster, [AppArmor][5] will be enabled by default. While this is a good thing, care would have to be taken care by system administrators to enable correct policies. This is only the first step and would need fixing probably lot of scripts to be as useful as been envisioned for the user.

#### 5\. Nodejs 10.15.2

For a long time Debian had Nodejs 4.8 in the repo. In this cycle Debian has moved to Nodejs 10.15.2 . In fact, Debian Buster has many javascript libraries such as yarnpkg (an npm alternative) and many others.

Of course, you can [install latest Nodejs in Debian][6] from the project’s repository but it’s good to see newer version in Debian repository.

[][7]

Suggested read  NSA has Open Sourced its Reverse Engineering Tool Ghidra

#### 6\. NFtables replaces iptables

Debian buster provides nftables as a full replacement to iptables which means better and easier syntax, better support for dual-stack ipv4-v6 firewalls and more.

#### 7\. Support for lot of ARM 64 and ARMHF SBC Boards.

There has been a constant stream of new SBC boards which Debian is supporting, the latest amongst these are pine64_plus, pinebook for ARM64, while Firefly-RK3288, u-boot-rockchip for ARMHF 64 as well as Odroid HC1/HC2 boards, SolidRun Cubox-i Dual/Quad (1.5som), and SolidRun Cubox-i Dual/Quad (1.5som+emmc) boards, Cubietruckplus as well. There is support for Rock 64, Banana Pi M2 Berry, Pine A64 LTS Board, Olimex A64 Teres-1 as well as Raspberry Pi 1, Zero and Pi 3. Support will be out-of-the box for RISC-V systems as well.

#### 8\. Python 2 is dead, long live Python 3

Python 2 will be [deprecated][8] on January 1, 2020 by python.org . While Debian does have Python 2.7 efforts are on to remove after moving all packages to Python 3 to remove it from the repo. This may happen either at Buster release or in a future point release but this is imminent. So Python developers are encouraged to move their code-base to be compatible with Python 3. At the moment of writing, both python2 and python3 are supported in Debian buster.

#### 9\. Mailman 3

Mailman3 is finally available in Debian. While [Mailman][9] has been further sub-divided into components. To install the whole stack, install mailman3-full to get all the components.

#### 10\. Any existing Postgresql databases used will need to be reindexed

Due to updates in glibc locale data, the way the information is sorted in put in text indexes will change hence it would be beneficial to reindex the data so no data corruption arises in near future.

#### 11\. Bash 5.0 by Default

You probably have already about the [new features in Bash 5.0][10], this version is already in Debian.

[][11]

Suggested read  Download 15 Stunning Sexy Debian Wallpapers

#### 12\. Debian implementing /usr/merge

An excellent freedesktop [primer][12] on what /usr/merge brings is already shared. Couple of things to note though. While Debian would like to do the whole transition, there is possibility that due to unforeseen circumstances, some binaries may not be in a position to do the change. One point to note though, /var and /etc/ will be left alone so people who are using containers or cloud would not have to worry too much :)

#### 13\. Secure-boot support

With Buster, Debian now has secure-boot support. Which means machines which have the secure-boot bit turned on in the machine should be easily able to install Debian on such machines. No need to disable or workaround Secure boot anymore :)

#### 14\. Calameres Live-installer for Debian-Live images

For Debian buster, Debian Live, Debian introduces [Calameres Installer][13] instead of plain old debian-installer. While the Debian-installer has a lot more features than Calameres for newbies, Calameres provides a fresh alternative to install unlike debian-installer. Below are some screenshots from the installation process.

![Calamares Partitioning Stage][14]

As can be seen it is pretty easy to Install Debian under Calamares, only 5 stages to go through and you can have Debian installed at your end.

### Download Debian 10 Buster

You can get live Debian images from its website. Both 32-bit and 64-bit images are available.

[Download Debian 10 Buster][15]

**In Conclusion**

While thousands of packages have been updated and it is virtually impossible to list them all. I have tired to list some of the major changes that you can look for in Debian buster. What do you think of the Debian 10 Buster release? Do share your views in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/debian-10-buster/

作者：[Shirish][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/shirish/
[b]: https://github.com/lujun9972
[1]: https://wiki.debian.org/DebianBuster
[2]: https://wiki.debian.org/DebianArt/Themes/futurePrototype
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/debian-buster-theme.png?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[5]: https://wiki.debian.org/AppArmor
[6]: https://itsfoss.com/install-nodejs-ubuntu/
[7]: https://itsfoss.com/nsa-ghidra-open-source/
[8]: https://www.python.org/dev/peps/pep-0373/
[9]: https://www.list.org/
[10]: https://itsfoss.com/bash-5-release/
[11]: https://itsfoss.com/download-15-stunning-sexy-debian-wallpapers/
[12]: https://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/
[13]: https://calamares.io/about/
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/calamares-partitioning-wizard.jpg?fit=800%2C538&ssl=1
[15]: https://www.debian.org/CD/live/
