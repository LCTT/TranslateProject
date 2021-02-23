MX Linux：一款专注于简洁性的中等体量发行版
======

> 这个发行版可以使任何人在 Linux 上如家一般。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/mxlinux.png?itok=OLjmCxT9)

Linux 有着如此多种的发行版。许多发行版为了使自己与众不同而做出了很多改变。另一方面，许多发行版之间的区别又是如此之小，你可能会问为什么有人还愿意不厌其烦的重复别人已经做过的工作呢？也正是基于这一疑惑，让我好奇为什么 [antiX][1] 和 [MEPIS][2]这两个社区要联合推出一个特殊的发行版，考虑到具体情况应该会是一个搭载 Xfce 桌面并基于 antiX 的版本，由 MEPIS 社区承担开发。

这一开发中的使用 Xfce 桌面的 antiX 系统是否会基于它之前的发行版呢？毕竟，antiX 旨在提供一个“基于 Debian 稳定版的快速、轻量级、易于安装的非 systemd 的 live CD 发行版”。antiX 所搭载的桌面是 [LXDE][3]，能够极好的满足关于轻量化系统的相关要求和特性。那究竟是什么原因使得 antiX 决定构建另一个轻量化发行版呢，仅仅是因为这次换成了 Xfce 吗？好吧，Linux 社区中的任何人都知道，增加了不同风格的好的轻量级发行版是值得一试的（特别是可以使得我们的旧硬件摆脱进入垃圾填埋场的宿命）。当然，LXDE 和 Xfce 并不完全属于同一类别。LXDE 应该被认为是一个真正的轻量级桌面，而 Xfce 应该被认为是一个中等体量的桌面。朋友们，这就是为什么 MX Linux 是 antiX 的一个重要迭代的关键。一个基于 Debian 的中等体量的发行版，它包含你完成工作所需的所有工具。

但是在 MX Linux 中有一些直接从 antiX 借用来的非常有用的东西 —— 那就是安装工具。当我初次设置了 VirtualBox 虚拟机来安装 MX Linux 时，我认为安装的系统将是我已经习惯的典型的、非常简单的 Linux 系统。令我非常惊讶的是，MX Linux 使用的 antiX 安装程序打破了以往的痛点，特别是对于那些对尝试 Linux 持观望态度的人来说。

因此，甚至在我开始尝试 MX Linux 之前，我就对它有了深刻的印象。让我们来看看是什么让这个发行版的安装如此特别，最后再来看看桌面。

你可以从[这里][4]下载 MX Linux 17.1。系统的最低要求是:

  * CD/DVD驱动器（以及能够从该驱动器引导的 BIOS）或 live USB（以及能够从 USB 引导的 BIOS）
  * 英特尔 i486 或 AMD 处理器
  * 512 MB 内存
  * 5 GB 硬盘空间
  * 扬声器，AC97 或 HDA-compatible 声卡
  * 作为一个 LiveUSB 使用，需要 4 GB 空间

### 安装

MX Linux 安装程序使安装 Linux 变得轻而易举。虽然它可能不是外观最现代化的安装工具，但也已经差不多了。安装的要点是从选择磁盘和选择安装类型开始的（图 1）。

![install][6]

*图 1：MX Linux 的安装程序截图之一*

下一个重要的界面（图 2）要求你设置一个计算机名称、域名和（如果需要的话，为微软网络设置）工作组。

![network][8]

*图 2：设置网络名称*

配置工作组的能力是第一个真正值得称赞的。这是我记忆中第一款在安装期间提供此选项的发行版。它还应该提示你，MX Linux 提供了开箱即用的共享目录功能。它做到了，而且深藏功与名。它并不完美，但它可以在不需要安装任何额外包的情况下工作（稍后将详细介绍）。

最后一个重要的安装界面（需要用户交互）是创建用户帐户和 root 权限的密码（图 3）。

![user][9]

*图 3：设置用户帐户详细信息和 root 用户密码*

最后一个界面设置完成后，安装将完成并要求重新启动。重启后，你将看到登录屏幕。登录并享受 MX Linux 带来的体验。

### 使用

Xfce 桌面是一个非常容易上手的界面。默认设置将面板位于屏幕的左边缘（图 4）。

![desktop][11]

*图 4：MX Linux 的默认桌面*

如果你想将面板移动到更传统的位置，右键单击面板上的空白点，然后单击“面板”>“面板首选项”。在显示的窗口中（图 5），单击样式下拉菜单，在桌面栏、垂直栏或水平栏之间进行选择你想要的模式。

![panel][13]

*图 5：配置 MX Linux 面板*

桌面栏和垂直选项的区别在于，在桌面栏模式下，面板垂直对齐，就像在垂直模式下一样，但是插件是水平放置的。这意味着你可以创建更宽的面板（用于宽屏布局）。如果选择水平布局，它将默在顶部，然后你必须取消锁定面板，单击关闭，然后（使用面板左侧边缘的拖动手柄）将其拖动到底部。你可以回到面板设置窗口并重新锁定面板。

除此之外，使用 Xfce 桌面对于任何级别的用户来说都是无需动脑筋的事情……就是这么简单。你会发现很多涵盖了生产力（LibreOffice、Orage Calendar、PDF-Shuffler）、图像（GIMP)、通信（Firefox、Thunderbird、HexChat）、多媒体（Clementine、guvcview SMTube、VLC媒体播放器）的软件，和一些 MX Linux 专属的工具（称为 MX 工具，涵盖了 live-USB 驱动器制作工具、网络助手、包管理工具、仓库管理工具、live ISO 快照工具等等）。

### Samba

让我们讨论一下如何将文件夹共享到你的网络。正如我所提到的，你不需要安装任何额外的包就可以使其正常工作。只需打开文件管理器，右键单击任何位置，并选择网络上的共享文件夹。系统将提示你输入管理密码（已在安装期间设置）。验证成功之后，Samba 服务器配置工具将打开（图 6）。

![sharing][15]

*图 6：向网络共享一个目录*

单击“+”按钮配置你的共享。你将被要求指定一个目录，为共享提供一个名称/描述，然后决定该共享是否可写和可见（图 7）。

![sharing][17]

*图 7：在 MX Linux 上配置共享*

当你单击 Access 选项时，你可以选择是让每个人都访问共享，还是限于特定的用户。问题就出在这里。此时，没有用户可以共享。为什么？因为它们还没有被添加。有两种方法可以把它们添加到共享：从命令行或使用我们已经打开的工具。让我们用一种更为简单的方法。在 Samba 服务器配置工具的主窗口中，单击“首选项” > “Samba 用户”。在弹出的窗口中，单击“添加用户”。

将出现一个新窗口（图 8），你需要从下拉框中选择用户，输入 Windows 用户名，并为用户键入/重新键入密码。

![Samba][19]

*图 8：向 Samba 添加用户*

一旦你单击“确定”，这用户就会被添加，并且基于你的网络的对用户的共享功能也随之启用。创建 Samba 共享从未变得如此容易。

### 结论

MX Linux 使任何从桌面操作系统转到 Linux 都变得非常简单。尽管有些人可能会觉得桌面界面不太现代，但发行版的主要关注点不是美观，而是简洁。为此，MX Linux 以出色的方式取得了成功。Linux 的这个特色发行版可以让任何人在使用 Linux 的过程中感到宾至如归。尝试这一中等体量的发行版，看看它能否作为你的日常系统。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/4/mx-linux-mid-weight-distro-focused-simplicity

作者：[JACK WALLEN][a]
译者：[qfzy1233](https://github.com/qfzy1233)
校对：[wxy](https://github.com/wxy)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://antixlinux.com/
[2]:https://en.wikipedia.org/wiki/MEPIS
[3]:https://lxde.org/
[4]:https://mxlinux.org/download-links
[5]:/files/images/mxlinux1jpg
[6]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/mxlinux_1.jpg?itok=i9bNScjH (install)
[7]:/licenses/category/used-permission
[8]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/mxlinux_2.jpg?itok=72nWxkGo
[9]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/mxlinux_3.jpg?itok=ppf2l_bm (user)
[10]:/files/images/mxlinux4jpg
[11]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/mxlinux_4.jpg?itok=mS1eBy9m (desktop)
[12]:/files/images/mxlinux5jpg
[13]:https://www.linux.com/sites/lcom/files/styles/floated_images/public/mxlinux_5.jpg?itok=wsN1hviN (panel)
[14]:/files/images/mxlinux6jpg
[15]:https://www.linux.com/sites/lcom/files/styles/floated_images/public/mxlinux_6.jpg?itok=vw8mIp9T (sharing)
[16]:/files/images/mxlinux7jpg
[17]:https://www.linux.com/sites/lcom/files/styles/floated_images/public/mxlinux_7.jpg?itok=tRIWdcEk (sharing)
[18]:/files/images/mxlinux8jpg
[19]:https://www.linux.com/sites/lcom/files/styles/floated_images/public/mxlinux_8.jpg?itok=ZS6lhZN2 (Samba)
[20]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
