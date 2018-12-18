[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (How a university network assistant used Linux in the 90s)
[#]: via: (https://opensource.com/article/18/5/my-linux-story-student)
[#]: author: ([Alan Formy-Duva](https://opensource.com/users/alanfdoss)
[#]: url: (https://linux.cn/article-10359-1.html)

90 年代的大学网管如何使用 Linux
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/moneyrecycle_520x292.png?itok=SAaIziNr)

在上世纪 90 年代中期，我报名了计算机科学课。我大学的计算机科学系为学生提供了一台 SunOS 服务器，它是一个多用户、多任务的 Unix 系统。我们登录它并编写我们学习的编程语言代码，例如 C、C++ 和 ADA。在那时，在社交网络和 IM 出现之前，我们还使用该系统发送电子邮件和使用诸如 `write` 和 `talk` 之类的程序来相互通信。我们每个人被允许托管一个个人网站。我很高兴能够使用它完成我的作业并联系其他用户。

这是我第一次体验这种类型的操作环境，但我很快就了解了另一个可以做同样事情的操作系统：Linux。

那会我还是学生，我在大学找了份兼职工作。我的第一个职位是住房和住宅部（H＆R）的网络安装人员。这工作涉及到将学生宿舍与校园网络连接起来。由于这是该大学的第一个宿舍网络服务，因此只有两幢楼和大约 75 名学生连上了网。

在第二年，该网络扩展到另外两幢楼。H＆R 决定让该大学的信息技术办公室（OIT）管理这不断增长的业务。我进入 OIT 并开始担任 OIT 网络经理的学生助理。这就是我发现 Linux 的方式。我的新职责之一是管理防火墙系统，它为宿舍提供网络和互联网访问。

每个学生都注册了他们硬件的 MAC 地址。注册的学生可以连接到宿舍网络并获得 IP 地址及访问互联网。与大学使用的其他昂贵的 SunOS 和 VMS 服务器不同，这些防火墙使用运行着自由开源的 Linux 操作系统的低成本计算机。截至年底，该系统已注册近 500 名学生。

![Red hat Linux install disks][1]

OIT 网络工作人员使用 Linux 运行 HTTP、FTP 和其他服务。他们还在个人桌面上使用 Linux。就在那时，我意识到我手上的计算机看起来和运行起来就像 CS 系昂贵的 SunOS 机器一样，但没有高昂的成本。Linux 可以在商用 x86 硬件上运行，例如有 8 MB RAM 和 133Mhz Intel Pentium CPU 的 Dell Latitude。那对我来说是个卖点！我在从一个存货仓库中清理出来的机器上安装了 Red Hat Linux 5.2，并给了我的朋友登录帐户。

我使用我的新 Linux 服务器来托管我的网站并向我的朋友提供帐户，同时它还提供 CS 系服务器没有的图形功能。它使用了 X Windows 系统，我可以使用 Netscape Navigator 浏览网页，使用 [XMMS][2] 播放音乐，并尝试不同的窗口管理器。我也可以下载并编译其他开源软件并编写自己的代码。

我了解到 Linux 提供了一些非常先进的功能，其中许多功能比更主流的操作系统更方便或更优越。例如，许多操作系统尚未提供应用更新的简单方法。在 Linux 中，这很简单，感谢 [autoRPM][3]，一个由 Kirk Bauer 编写的更新管理器，它向 root 用户每日发送邮件，其中包含可用的更新。它有一个直观的界面，用于审查和选择要安装的软件更新 —— 这对于 90 年代中期来说非常了不起。

当时 Linux 可能并不为人所知，而且它经常受到怀疑，但我确信它会存活下来。而它确实生存下来了！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/my-linux-story-student

作者：[Alan Formy-Duval][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/alanfdoss
[1]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/red_hat_linux_install_disks.png?itok=VSw6Cke9 (Red hat Linux install disks)
[2]:http://www.xmms.org/
[3]:http://www.ccp14.ac.uk/solution/linux/autorpm_redhat7_3.html
