[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 ways to get started with Linux)
[#]: via: (https://opensource.com/article/19/7/ways-get-started-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth/users/don-watkins)

Linux 入门十法
======

> 想要进入 Linux 之门，试试这十个方法。

![Penguins gathered together in the Artic][1]

文章《[什么是 Linux 用户？][2]》的作者 Anderson Silva 明确表示，现今人们使用 Linux（在某种程度上）就像使用 Windows 一样，只要你对“使用 Linux”这个事情定义得足够广泛。尽管如此，如果你的生活中没有足够的使用 Linux 的机会，现在正是以前所未有的方式尝试 Linux 的好时机。

以下是 Linux 入门的十种方法。你可以试试其中一个或者全部试试。

### 1、加入免费 shell 计划

![Free shell screenshot][3]

有很多人在用不上的服务器上运行 Linux （请记住，“Linux 服务器”可以是从最新的超级计算机到丢弃的已经用了 12 年的笔记本电脑中的任何一个）。为了充分利用多余的计算机，许多管理员用这些备用的机器提供了免费的 shell 帐户。

如果你想要登录到 Linux 终端中学习命令、shell 脚本、Python 以及 Web 开发的基础知识，那么免费的 shell 帐户是一种简单、免费的入门方式。这是一个简短的列表：

* [Freeshell.de][4] 是一个自 2002 年以来一直在线的公用 Linux 系统。你可以通过 SSH、IPv6 和 OpenSSL 进行访问，以获得 Linux shell 体验，并且可以使用 MySQL 数据库。
* [Blinkenshell][5] 提供了一个学习 Unix、使用 IRC、托管简单网站和共享文件的 Linux shell。它自 2006 年以来一直在线。
* [SDF 公用 Unix 系统][6]成立于 1987 年，提供了免费的 NetBSD 账户。当然，NetBSD 不是 Linux，但它是开源的 Unix，因此它提供了类似的体验。它也有几个自制应用程序，因此它跨越了老派 BBS 和普通的免费 shell 之间的界限。

免费 shell 帐户受到很多滥用，因此你表现出的信任度和参与集体活动的意愿越多，你的体验就越好。你通常可以访问数据库引擎、编译器和高级编程语言（通过特殊请求或小额捐赠来证明声誉）。你还可以要求安装其他软件或库，但需经管理员批准。

#### 如何使用

公用 shell 帐户是尝试真正的 Linux 系统的好方法。你无法获得 root 权限这一事实意味着你可学习本地软件管理，而无需做更多的维护工作。你可以做很多实际操作，以完成真正的工作，尽管它们对于学习关键任务还不够。

### 2、试试 Windows WSL 2 里面的 Linux

不管你信不信，微软从 2019 年 6 月开始在 Windows 里面带上了 Linux，这意味着你可以从 Windows 运行 Linux 应用程序，这是第二代的 [Windows 里的 Linux 子系统][7]（WSL 2）。虽然它主要针对开发人员，但 Windows 用户会发现 WSL 2 是一个熟悉的桌面上的 Linux 环境，而没有被任何虚拟化占用额外资源。这是一个以进程方式运行在 Windows 机器上的 Linux。在这个时候，它仍然是一个新的动向和正在进行中的工作，因此它可能会发生变化。如果你试图用它承担重任，你可能会遇到一两个错误，但是如果你只是想入门 Linux、学习一些命令，并感受在基于文本的环境如何完成工作，那么 WSL 2 可能正是你所需要的。

#### 如何使用

WSL 还没有明确的方向或目的，但它在 Windows 机器上提供了 Linux 环境。你可以获得 root 访问权限，并可以运行 Linux 发行版和应用程序，因此这是一种简单而无缝的学习方式。但是，即使 WSL *是Linux*，它也不能给你典型的 Linux 体验。它是由 Windows 提供的 Linux，而这不太会是你在现实世界中遇到的。WSL 是一个开发和教育工具，但如果你可以使用它，那么你应该试试它。

### 3、把 Linux 放到可启动的 U 盘上

![Porteus Linux][8]

便携 Linux 可以安装到 U 盘上随身携带，并用该 U 盘启动你遇到的任何计算机。你可以获得个性化的 Linux 桌面，而无需担心所启动的主机上的数据。计算机不会接触你的 Linux 操作系统，并且你的 Linux 操作系统也不会影响计算机。它非常适合酒店商务中心、图书馆、学校的公共计算机，或者只是给自己一个不时启动 Linux 的借口。

与许多其他快速取得的 Linux shell 不同，此方法为你提供了一个完整而强大的 Linux 系统，包括桌面环境，可访问你需要的任何软件以及持久的数据存储。

这个系统永远不会改变。你要保存的任何数据都将写入压缩的文件系统中，然后在引导时将其作为覆盖层应用于该系统。这种灵活性允许你选择是以持久模式启动，将所有数据保存回 U 盘；还是以临时模式启动，以便一旦关闭电源，你所做的一切都会消失。换句话说，你可以将其用作不受信任的计算机上的安全信息亭或你信任的计算机上的便携式操作系统。

你可以尝试很多 [U 盘发行版][9]，有些桌面环境很少，适用于低功耗计算机，有些适用于完整桌面环境。我偏爱 [Porteus][10] Linux。在过去的八年里，我每天都把它放在我的钥匙链上，在商务旅行中使用它作为我的主要计算平台，如果在工作或家中计算机发生问题，它也会用作工具盘。它是一个可靠而稳定的操作系统，有趣且易于使用。

在 Mac 或 Windows 上，下载 [Fedora Media Writer][11] 以创建你下载的任何便携式发行版的可启动 U 盘。

#### 如何使用

从 U 盘启动一个“实时 Linux”可提供完整的 Linux 发行版。虽然数据存储与你安装到硬盘驱动器的系统略有不同，但其他所有内容都与你在 Linux 桌面上所期望的一样。在便携式 Linux 操作系统上你几乎没有什么不能做的，所以在你的钥匙串上安装一个以解锁你遇到的每台计算机的全部潜力吧。

### 4、Take an online tour

![Linux tour screenshot][12]

Somebody over at Ubuntu thought up the brilliant idea of hosting an Ubuntu GNOME desktop in the browser. To try it out for yourself, open a web browser and navigate to [tour.ubuntu.com][13]. You can select which activity you want demonstrated, or you can skip individual lessons and click the Show Yourself Around button.

Even if you're new to the Linux desktop, you might find showing yourself around is more familiar than you might expect. From the online tour, you can look around, see what applications are available, and view what a typical default Linux desktop is like. You can't adjust settings or launch another tour in Firefox (it was the first thing I tried, naturally), and while you can go through the motions of installing applications, you can't launch them. But if you've never used a Linux desktop before and you want to see what all the fuss is about, this is the whirlwind tour.

#### 如何使用

An online tour is truly just a tour. If you've never seen a Linux desktop in action, this is an opportunity to get a glimpse of what it's like. Not intended for serious work, this is an attractive display to entice passers-by.

### 5、Run Linux in the browser with JavaScript

![JSLinux][14]

Not so long ago, virtualization used to be computationally expensive, limited to users with premium hardware. Now virtualization has been optimized to the point that it can be performed by a JavaScript engine, thanks to Fabrice Bellard, the creator of the excellent and open source [QEMU][15] machine emulator and virtualizer.

Bellard also started the JSLinux project, which allows you to run Linux and other operating systems in a browser, in his spare time for fun. It's still an experimental project, but it's a technical marvel. Open a web browser to the [JSLinux][16] page, and you can boot a text-based Linux shell or a minimal graphical Linux environment. You can upload and download files to your JSLinux host or (theoretically) send your files to a network backup location, because JSLinux has access to the internet through a VPN socket (although at capped speeds, dependent upon the VPN service).

#### 如何使用

You won't be doing serious work on JSLinux anytime soon, and the environment is arguably too unusual to learn broad lessons about how Linux normally works. If, however, you're bored of running Linux on a plain old PC and would like to try Linux on a truly distinctive platform, JSLinux is in a class all its own.

### 6、Read about it

Not every Linux experience happens on the computer. Maybe you're the sort of person who likes to keep your distance, observe, and do your research before jumping into something new, or maybe you're just not clear yet on what "Linux" encompasses, or maybe you love full immersion. There's a wealth of information to read about how Linux works, what it's like to run Linux, and what's happening in the Linux world.

The more you get familiar with the world of open source, the easier it is to understand the common lingo and to separate urban myth from actual experience. We publish [book lists][17] from time to time, but one of my favorites is [_The Charm of Linux_][18] by Hazel Russman. It's a tour through Linux from many different angles, written by an independent author out of excitement over discovering Linux.

#### 如何使用

Nothing beats kicking back with a good book. This is the least traditional method of experiencing Linux, but for people who love the printed word, it's both comforting and effective.

### 7、Get a Raspberry Pi

![Raspberry Pi 4][19]

If you're using a [Raspberry Pi][20], you're running Linux. It's that easy to get started with Linux and low-powered computing. The great thing about the Pi, aside from it costing well under $100, is that its [website][21] is designed for education. You can learn all about what the Pi does, and while you're at it, all about what Linux can do for you.

#### 如何使用

The Pi is, by design, a low-powered computer. That means you can't do as much multitasking as you might be used to, but that's a convenient way to keep yourself from getting overwhelmed. The Raspberry Pi is a great way to learn Linux and all of the possibilities that come with it, and it's a fun way to discover the power of eco-friendly, small-form-factor, simplified computing. And be sure to stay tuned to Opensource.com—especially during Pi Week every March—for [tips][22] and [tricks][23] and [fun][24] [activities][25].

### 8、Climb aboard the container craze

If you work near the back end of the mythical [cloud][26], then you've heard about the container craze. While you can run Docker and Kubernetes on Windows, Azure, Mac, and Linux, you may not know that the containers themselves are Linux. Cloud computing apps and infrastructure are literally minimal Linux systems that run partly virtualized and partly on bare metal. If you launch a container, you are launching a miniature, hyper-specific Linux distribution.

Containers are [different][27] than virtual machines or physical servers. They're not intended to be used as a general-purpose operating system. However, if you are developing in a container, you might want to pause and have a look around. You'll get a glimpse of how a Linux system is structured, where important files are kept, and which commands are the most common. You can even [try a container online][28], and you can read all about how they work in my article about going [behind the scenes with Linux containers][29].

#### 如何使用

Containers are, by design, specific to a single task, but they're Linux, so they're extremely flexible. You can use them as they're intended, or you can build a container out into a mostly complete system for your Linux experiments. It's not a desktop Linux experience, but it's a full Linux experience.

### 9、Install Linux as a VM

Virtualization is the easy way to try an operating system, and [VirtualBox][30] is a great open source way to virtualize. VirtualBox runs on Windows and Mac, so you can install Linux as a virtual machine (VM) and use it almost as if it were just another application. If you're not accustomed to installing an operating system, VirtualBox is also a very safe way to try Linux without accidentally installing it over your usual OS.

#### 如何使用

Running Linux as a VM is convenient and easy, either as a trial run or an alternative to dual-booting or rebooting when you need a Linux environment. It's full-featured and, because it uses virtual hardware, the host operating system drives your peripherals. The only disadvantage to running Linux as a virtual machine is primarily psychological. If you intend to use Linux as your main OS, but end up defaulting to the host OS for all but the most Linux-specific tasks, then the VM has failed you. Otherwise, a VM is a triumph of modern technology, and using Linux in VirtualBox provides you with all the best features Linux has to offer.

### 10、Install it

![Fedora Silverblue][31]

When in doubt, there's always the traditional route. If you want to give Linux the attention it deserves, you can download Linux, burn the installer to a thumb drive (or a DVD, if you prefer optical media), and install it on your computer. Linux is open source, so it can be distributed by anyone who wants to take the time to bundle Linux—and all the bits and pieces that make it usable—into what is commonly called a _distribution_ (or "distro") for short. Ask any Linux user, and you're bound to get a different answer for which distribution is "best" (mostly because the term "best" is often left undefined). Most people admit that you should use the Linux distribution that works for you, meaning that you should test a few popular distros and settle on the one that makes your computer behave as you expect it to behave. This is a pragmatic and functional approach. For example, should a distribution fail to recognize your webcam and you want your webcam to work, then use a distribution that recognizes your webcam.

If you've never installed an operating system before, you'll find most Linux distributions include a friendly and easy installer. Just download a distribution (they are delivered as ISO files), and download the [Fedora Media Writer][11] to create a bootable installation thumb drive.

#### 如何使用

Installing Linux and using it as an operating system is a step toward becoming familiar and familial with it. There's no wrong way to use it. You might discover must-have features you never knew you needed, you might learn more about computers than you ever imagined you could, and you may shift in your worldview. Or you might use a Linux desktop because it was easy to download and install, or because you want to cut out the middleman of some corporate overlord, or because it helps you get your work done.

Whatever your reason, just give Linux a try with any (or all) of these options.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/ways-get-started-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_Penguin_Image_520x292_12324207_0714_mm_v1a.png?itok=p7cWyQv9 (Penguins gathered together in the Artic)
[2]: https://opensource.com/article/19/6/what-linux-user
[3]: https://opensource.com/sites/default/files/uploads/freeshell.png (Free shell screenshot)
[4]: https://freeshell.de
[5]: https://blinkenshell.org/wiki/Start
[6]: https://sdf.org/
[7]: https://devblogs.microsoft.com/commandline/wsl-2-is-now-available-in-windows-insiders/
[8]: https://opensource.com/sites/default/files/uploads/porteus.jpg (Porteus Linux)
[9]: https://linux.cn/article-11040-1.html
[10]: http://porteus.org
[11]: https://getfedora.org/en/workstation/download/
[12]: https://opensource.com/sites/default/files/uploads/linux_tour.jpg (Linux tour screenshot)
[13]: http://tour.ubuntu.com/en/#
[14]: https://opensource.com/sites/default/files/uploads/jslinux.jpg (JSLinux)
[15]: https://www.qemu.org
[16]: https://bellard.org/jslinux/
[17]: https://opensource.com/article/19/1/tech-books-new-skils
[18]: http://www.lulu.com/shop/hazel-russman/the-charm-of-linux/paperback/product-21229401.html
[19]: https://opensource.com/sites/default/files/uploads/raspberry-pi-4-case.jpg (Raspberry Pi 4)
[20]: https://opensource.com/resources/raspberry-pi
[21]: https://www.raspberrypi.org/
[22]: https://opensource.com/article/19/3/raspberry-pi-projects
[23]: https://opensource.com/article/19/3/piflash
[24]: https://opensource.com/article/19/3/gamepad-raspberry-pi
[25]: https://opensource.com/life/16/3/make-music-raspberry-pi-milkytracker
[26]: https://opensource.com/resources/cloud
[27]: https://opensource.com/article/19/6/how-ssh-running-container
[28]: https://linuxcontainers.org/lxd/try-it/
[29]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[30]: https://virtualbox.org
[31]: https://opensource.com/sites/default/files/uploads/fedora-silverblue.png (Fedora Silverblue)
