迁移到 Linux：网络和系统设置
======

> 这个系列我们提供了基础知识的概述，以帮助您成功地从另一个操作系统过渡到 Linux；这篇中我们涉及到 Linux 桌面系统上的一些常见设置。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/animals-birds-flock-55832.jpg?itok=NUGAyhDO)

在这个系列中，我们提供了基础知识的概述，以帮助您成功地从另一个操作系统过渡到 Linux。如果你错过了以前的文章，可以从这访问：

- [第1部分 - 入门介绍][1]
- [第2部分 - 磁盘、文件和文件系统][2]
- [第3部分 - 图形操作环境][3]
- [第4部分 - 命令行][4]
- [第5部分 - 使用 sudo][5]
- [第5部分 - 安装软件][6]

Linux 提供了一系列网络和系统设置。在你的桌面计算机上，Linux 允许您调整系统上的任何内容。大多数这些设置都出现在 `/etc` 目录下的纯文本文件中。这里我将介绍你使用桌面 Linux 操作系统的过程中最常用的设置。

大多数设置都能够在“设置”程序里面找到，这些设置可能对于不同的 Linux 发行版有所不同。通常来说，你可以修改背景、调整音量、连接打印机、进行显示设置等。对于这些设置尽管我不会全部谈论，但你可以自己探索。

### 连接互联网

在 Linux 中连接到互联网通常非常简单。如果您通过以太网电缆连接，Linux 通常会在插入电缆时或启动时（如果电缆已连接）获得 IP 地址并自动连接。

如果您使用无线网络，则在大多数发行版中都有一个菜单，可以在指示器面板中或在“设置”中（取决于您的发行版），您可以在其中选择无线网络的 SSID。如果网络受密码保护，它通常会提示您输入密码。然后连接，这个过程相当顺利。

在图形界面您可以通过进入设置来调整网络设置。通常称为“系统设置”或者是“设置”。通常可以轻松找到设置程序，因为它的图标是齿轮或工具图片（图1）。

![Network Settings][8]

*图1： Gnome 桌面网络设置指示器图标。*

### 网络接口名称

在 Linux 下，网络设备有名称。 从历史上看，它们的名称分别为 eth0 和 wlan0 —— 或“以太网”和“无线网络”。 较新的 Linux 系统一直使用看起来更深奥的不同名称，如 enp4s0 和 wlp5s0 。 如果名称以 en 开头，则它是有线以太网接口。 如果它以 wl 开头，那么它就是一个无线接口。 其余的字母和数字反映了设备如何连接到硬件。

### 通过命令行进行网络管理

如果您希望更好地控制网络设置，或者如果您在没有图形桌面的情况下管理网络连接，则还可以从命令行管理网络。

请注意，用于在图形桌面中管理网络的最常用服务是“<ruby>网络管理器<rt>Network Manager</rt></ruby>”，而网络管理器通常会覆盖在命令行上进行的设置更改。如果您正在使用网络管理器，最好在其界面中更改您的设置，以防止撤消您从命令行或其他位置所做的更改。

在图形环境中的更改设置与在网络管理器中很类似，您还可以使用名为 `nmtui` 的工具从命令行更改网络管理器设置。`nmtui` 工具提供了您在图形环境中找到的所有设置，但是是在基于文本的半图形界面中提供了该设置，该界面可在命令行上运行（图 2）。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/figure-2_0.png?itok=1QVjDdbJ)

*图 2：nmtui 界面*

在命令行上，有一个名为 `ifconfig` 的旧工具来管理网络，还有一个名为 `ip` 的新工具。在某些发行版中，`ifconfig` 被认为是不推荐使用的，默认情况下甚至没有安装。在其他发行版上，`ifconfig` 仍可以使用。

以下是一些允许您显示和更改网络设置的命令：

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/screen_shot_2018-04-17_at_3.11.48_pm.png?itok=EZsjb-GQ)

### 进程和系统信息

在 Windows 系统中，你可以使用任务管理器来查看所有正在运行的程序和服务的列表。你可以停止运行中的程序，并且可以在其中显示的某些选项卡中查看系统性能。

在 Linux 系统下你可以使用命令行或者图形界面中做同样的事情。Linux 系统中根据你的发行版本会有不同的几个可用的图形工具。大多数所共有的工具是“系统监视器”和 KSysGuard。在这些工具中，你可以查看系统性能，查看进程列表甚至是杀死进程（图 3）。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/figure-3_2.png?itok=ePeXj9PA)

*图 3：NetHogs 截图*

在这些工具中，你也可以查看系统全局网络流量（图 4）。

![System Monitor][11]

*图 4：Gnome System Monitor 的截图*

### 管理进程和系统使用

您还可以从命令行使用相当多的工具。使用 `ps` 命令可以查看系统中的进程列表。默认情况下，这个命令的结果是显示当前终端会话下的所有进程列表。但是你也可以通过使用各种命令行参数显示其他进程。如果 `ps` 命令不会使用，可以使用命令 `info ps` 或者 `man ps` 获取帮助。

大多数人都希望得到一个进程列表，因为他们想要停止占用过多内存或 CPU 时间的进程。这种情况下有两个非常简单的命令，分别是 `top` 和 `htop` 命令（图 5）。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/figure-5_0.png?itok=2nm5EmAl)

*图 5：top 截屏*

`top` 和 `htop` 工具使用效果非常相似。两个命令每秒或者两秒会更新重新排序，这样会把占用 CPU 资源最多的放置在列表顶部。你也可以根据其他资源的使用情况比如内存使用情况来排序。

使用这两个命令时（`top` 和 `htop`），你可以输入 `?` 来获取使用帮助，输入 `q` 来退出程序。使用 `top` 命令你可以按 `k` 键然后输入进程 ID 来杀死某个进程。

使用 `htop` 命令时你可以使用 `↑` `↓` 键来将列表中的一条记录进行高亮显示，按下 `F9` 键会杀死进程（需要回车确认）。

本系列中提供的信息和工具将帮助您开始使用 Linux。 只需一点时间和耐心，您就会感到这非常舒服。

想学习更多 Linux 内容可访问免费的 [Linux 简介][12]课程，此课程来自 Linux 基金会和 edx。

------

via: https://www.linux.com/blog/learn/2018/4/migrating-linux-network-and-system-settings

作者：[John Bonesio][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[ScarboroughCoral](https://github.com/ScarboroughCoral)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/johnbonesio
[1]: https://linux.cn/article-9212-1.html
[2]: https://linux.cn/article-9213-1.html
[3]: https://linux.cn/article-9293-1.html
[4]: https://linux.cn/article-9565-1.html
[5]: https://linux.cn/article-9819-1.html
[6]: https://linux.cn/article-9823-1.html
[7]: https://www.linux.com/files/images/figure-1png-2
[8]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/figure-1_2.png?itok=J-C6q-t5 "Network Settings"
[9]: https://www.linux.com/licenses/category/used-permission
[10]: https://www.linux.com/files/images/figure-4png-1
[11]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/figure-4_1.png?itok=boI-L1mF "System Monitor"
[12]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
