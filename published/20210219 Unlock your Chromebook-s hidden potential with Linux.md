[#]: collector: (lujun9972)
[#]: translator: (max27149)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13149-1.html)
[#]: subject: (Unlock your Chromebook's hidden potential with Linux)
[#]: via: (https://opensource.com/article/21/2/chromebook-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

用 Linux 释放你 Chromebook 的隐藏潜能
======

> Chromebook 是令人惊叹的工具，但通过解锁它内部的 Linux 系统，你可以让它变得更加不同凡响。

![](https://img.linux.net.cn/data/attachment/album/202102/24/114254qstdq1dhj288jh1z.jpg)

Google Chromebook 运行在 Linux 系统之上，但通常它运行的 Linux 系统对普通用户而言，并不是十分容易就能访问得到。Linux 被用作基于开源的 [Chromium OS][2] 运行时环境的后端技术，然后 Google 将其转换为 Chrome OS。大多数用户体验到的界面是一个电脑桌面，可以用来运行 Chrome 浏览器及其应用程序。然而，在这一切的背后，有一个 Linux 系统等待被你发现。如果你知道怎么做，你可以在 Chromebook 上启用 Linux，把一台可能价格相对便宜、功能相对基础的电脑变成一个严谨的笔记本，获取数百个应用和你需要的所有能力，使它成为一个通用计算机。

### 什么是 Chromebook?

Chromebook 是专为 Chrome OS 创造的笔记本电脑，它本身专为特定的笔记本电脑型号而设计。Chrome OS 不是像 Linux 或 Windows 这样的通用操作系统，而是与 Android 或 iOS 有更多的共同点。如果你决定购买 Chromebook，你会发现有许多不同制造商的型号，包括惠普、华硕和联想等等。有些是为学生而设计，而另一些是为家庭或商业用户而设计的。主要的区别通常分别集中在电池功率或处理能力上。

无论你决定买哪一款，Chromebook 都会运行 Chrome OS，并为你提供现代计算机所期望的基本功能。有连接到互联网的网络管理器、蓝牙、音量控制、文件管理器、桌面等等。

![Chrome OS desktop][3]

*Chrome OS 桌面截图*

不过，想从这个简单易用的操作系统中获得更多，你只需要激活 Linux。

### 启用 Chromebook 的开发者模式

如果我让你觉得启用 Linux 看似简单，那是因为它确实简单但又有欺骗性。之所以说有欺骗性，是因为在启用 Linux 之前，你*必须*备份数据。

这个过程虽然简单，但它确实会将你的计算机重置回出厂默认状态。你必须重新登录到你的笔记本电脑中，如果你有数据存储在 Google 云盘帐户上，你必须得把它重新同步回计算机中。启用 Linux 还需要为 Linux 预留硬盘空间，因此无论你的 Chromebook 硬盘容量是多少，都将减少一半或四分之一（自主选择）。

在 Chromebook 上接入 Linux 仍被 Google 视为测试版功能，因此你必须选择使用开发者模式。开发者模式的目的是允许软件开发者测试新功能，安装新版本的操作系统等等，但它可以为你解锁仍在开发中的特殊功能。

要启用开发者模式，请首先关闭你的 Chromebook。假定你已经备份了设备上的所有重要信息。

接下来，按下键盘上的 `ESC` 和 `⟳`，再按 **电源键** 启动 Chromebook。

![ESC and refresh buttons][4]

*ESC 键和 ⟳ 键*

当提示开始恢复时，按键盘上的 `Ctrl+D`。

恢复结束后，你的 Chromebook 已重置为出厂设置，且没有默认的使用限制。

### 开机启动进入开发者模式

在开发者模式下运行意味着每次启动 Chromebook 时，都会提醒你处于开发者模式。你可以按 `Ctrl+D` 跳过启动延迟。有些 Chromebook 会在几秒钟后发出蜂鸣声来提醒你处于开发者模式，使得 `Ctrl+D` 操作几乎是强制的。从理论上讲，这个操作很烦人，但在实践中，我不经常启动我的 Chromebook，因为我只是唤醒它，所以当我需要这样做的时候，`Ctrl+D` 只不过是整个启动过程中小小的一步。

启用开发者模式后的第一次启动时，你必须重新设置你的设备，就好像它是全新的一样。你只需要这样做一次（除非你在未来某个时刻停用开发者模式）。

### 启用 Chromebook 上的 Linux

现在，你已经运行在开发者模式下，你可以激活 Chrome OS 中的 **Linux Beta** 功能。要做到这一点，请打开 **设置**，然后单击左侧列表中的 **Linux Beta**。

激活 **Linux Beta**，并为你的 Linux 系统和应用程序分配一些硬盘空间。在最糟糕的时候，Linux 是相当轻量级的，所以你真的不需要分配太多硬盘空间，但它显然取决于你打算用 Linux 来做多少事。4 GB 的空间对于 Linux 以及几百个终端命令还有二十多个图形应用程序是足够的。我的 Chromebook 有一个 64 GB 的存储卡，我给了 Linux 系统 30 GB，那是因为我在 Chromebook 上所做的大部分事情都是在 Linux 内完成的。

一旦你的 **Linux Beta** 环境准备就绪，你可以通过按键盘上的**搜索**按钮和输入 `terminal` 来启动终端。如果你还是 Linux 新手，你可能不知道当前进入的终端能用来安装什么。当然，这取决于你想用 Linux 来做什么。如果你对 Linux 编程感兴趣，那么你可能会从 Bash（它已经在终端中安装和运行了）和 Python 开始。如果你对 Linux 中的那些迷人的开源应用程序感兴趣，你可以试试 GIMP、MyPaint、LibreOffice 或 Inkscape 等等应用程序。

Chrome OS 的 **Linux Beta** 模式不包含图形化的软件安装程序，但 [应用程序可以从终端安装][5]。可以使用 `sudo apt install` 命令安装应用程序。

  * `sudo` 命令可以允许你使用超级管理员权限来执行某些命令（即 Linux 中的 `root`）。
  * `apt` 命令是一个应用程序的安装工具。
  * `install` 是命令选项，即告诉 `apt` 命令要做什么。

你还必须把想要安装的软件包的名字和 `apt` 命令写在一起。以安装 LibreOffice 举例:

```
sudo apt install libreoffice
```
当有提示是否继续时，输入 `y`（代表“确认”），然后按 **回车键**。

一旦应用程序安装完毕，你可以像在 Chrome OS 上启动任何应用程序一样启动它：只需要在应用程序启动器输入它的名字。

了解 Linux 应用程序的名字和它的包名需要花一些时间，但你也可以用 `apt search` 命令来搜索。例如，可以用以下的方法是找到关于照片的应用程序：

```
apt search photo
```

因为 Linux 中有很多的应用程序，所以你可以找一些感兴趣的东西，然后尝试一下！

### 与 Linux 共享文件和设备

 **Linux Beta** 环境运行在 [容器][7] 中，因此 Chrome OS 需要获得访问 Linux 文件的权限。要授予 Chrome OS 与你在 Linux 上创建的文件的交互权限，请右击要共享的文件夹并选择 **管理 Linux 共享**。

![Chrome OS Manage Linux sharing interface][8]

*Chrome OS 的 Linux 管理共享界面*

你可以通过 Chrome OS 的 **设置** 程序来管理共享设置以及其他设置。

![Chrome OS Settings menu][9]

*Chrome OS 设置菜单*

### 学习 Linux

如果你肯花时间学习 Linux，你不仅能够解锁你 Chromebook 中隐藏的潜力，还能最终学到很多关于计算机的知识。Linux 是一个有价值的工具，一个非常有趣的玩具，一个通往比常规计算更令人兴奋的事物的大门。去了解它吧，你可能会惊讶于你自己和你 Chromebook 的无限潜能。

---

源自: https://opensource.com/article/21/2/chromebook-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[max27149](https://github.com/max27149)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://www.chromium.org/chromium-os
[3]: https://opensource.com/sites/default/files/chromeos.png
[4]: https://opensource.com/sites/default/files/esc-refresh.png
[5]: https://opensource.com/article/18/1/how-install-apps-linux
[6]: https://opensource.com/tags/linux
[7]: https://opensource.com/resources/what-are-linux-containers
[8]: https://opensource.com/sites/default/files/chromeos-manage-linux-sharing.png
[9]: https://opensource.com/sites/default/files/chromeos-beta-linux.png
