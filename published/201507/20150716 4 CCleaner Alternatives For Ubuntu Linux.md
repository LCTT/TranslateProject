Ubuntu 下 CCleaner 的 4 个替代品
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/ccleaner-10-700x393.jpg)

回首我使用 Windows 的那些日子，[CCleaner][1] 是我用来释放空间、删除垃圾文件和加速 Windows 的最喜爱的工具。我知道，当从 Windows 切换到 Linux 时，我并不是唯一期望 CCleaner 拥有 Linux 版本的人。假如你正在寻找 Linux 下 CCleaner 的替代品，我将在下面列举 4 个这样的应用，它们可以用来清理 Ubuntu 或基于 Ubuntu 的 Linux 发行版本。但在我们看这个清单之前，先让我们考虑一下 Linux 是否需要系统清理工具这个问题。

### Linux 需要像 CCleaner 那样的系统清理工具吗？ ###

为了得到答案，让我们看看 CCleaner 做了什么。正如 [How-To Geek][2] 的这篇文章中所提到的那样：

> CCleaner 有两个主要的功能。一是：它扫描并删除无用的文件，释放磁盘空间。二是：它擦除隐私的数据，例如你的浏览记录和在各种软件中最近打开的文件列表。

所以，概括起来，它在系统范围内清理在你的浏览器或媒体播放器中的临时文件。你或许知道 Windows 有在系统中保存垃圾文件的喜好，那 Linux 呢？它是如何处理临时文件的呢？

与 Windows 不同， Linux 自动地清理所有的临时文件(在 `/tmp` 中存储)。在 Linux 中没有注册表，这进一步减轻了头痛。在最坏情况下，你可能会有一些损坏的不再需要的软件包，以及丢失一些网络浏览历史记录， cookies ，缓存等。

### 这意味着 Linux 不必需要系统清理工具了吗？ ###

- 假如你可以运行某些命令来清理偶尔使用的软件包，手动删除浏览历史记录等，那么答案是：不需要；
- 假如你不想不断地从一个地方跳到另一个地方来运行命令，并想用一个工具来删除所有可通过一次或多次点击所选择的东西，那么答案是：需要。

假如你的答案是“需要”，就让我们继续看看一些类似于 CCleaner 的工具，用它们清理你的 Ubuntu 系统。

### Ubuntu 下 CCleaner 的替代品 ###

请注意，我使用的系统是 Ubuntu，因为下面讨论的一些工具只存在于基于 Ubuntu 的 Linux 发行版本中，而另外一些在所有的 Linux 发行版本中都可使用。

#### 1. BleachBit ####

![BleachBit 针对 Linux 的系统清理工具](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/BleachBit_Cleaning_Tool_Ubuntu.jpeg)

[BleachBit][3] 是一个跨平台的应用程序，在 Windows 和 Linux 平台下都可使用。它有一个很长的支持清理的程序的列表，这样可以让你选择性的清理缓存，cookies 和日志文件。让我们快速浏览它的特点：

- 简洁的图形界面确认框，你可以预览或删除
- 支持多平台： Linux 和 Windows
- 免费且开源
- 粉碎文件以隐藏它们的内容并防止数据恢复
- 重写空闲的磁盘空间来隐藏先前删除的文件内容
- 也拥有命令行界面

默认情况下，在 Ubuntu 14.04 and 15.04 中都可以获取到 BleachBit，你可以在终端中使用下面的命令来安装：

    sudo apt-get install bleachbit

对于所有主流的 Linux 发行版本， BleachBit 提供有二进制程序，你可以从下面的链接中下载到 BleachBit：

- [下载 BleachBit 的 Linux 版本][4]

#### 2. Sweeper ####

![Sweeper 针对 Ubuntu 的系统清理工具](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/sweeper.jpeg)

Sweeper 是一个系统清理工具，它是[KDE SC utilities][5] 模块的一部分。它的主要特点有：

- 移除与网络相关的痕迹： cookies, 历史，缓存等
- 移除图形缩略图缓存
- 清理应用和文件的历史记录

默认情况下，Sweeper 在 Ubuntu 的软件仓库中可以得到。可以在终端中使用下面的命令来安装 Sweeper：

    sudo apt-get install sweeper

#### 3. Ubuntu Tweak ####

![清理 Ubuntu 系统的 Ubuntu Tweak 工具 ](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Ubuntu_Tweak_Janitor.jpeg)

正如它的名称所说的那样，[Ubuntu Tweak][6] 是一个调整工具，而不仅仅是一个清理应用。除了调整诸如 compiz 设置，面板的配置，开机启动程序的控制，电源管理等，Ubuntu Tweak 还提供一个清理选项，它可以让你：

- 清理浏览器缓存
- 清理 Ubuntu 软件中心缓存
- 清理缩略图缓存
- 清理 apt 仓库缓存
- 清理旧的内核文件
- 清理软件包配置

你可以从下面的链接中得到 Ubuntu Tweak 的 `.deb` 安装文件：

- [下载 Ubuntu Tweak][7]

#### 4. GCleaner (beta) ####

![GCleaner 类似 CCleaner 的工具](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/GCleaner.jpeg)

作为 elementary OS Freya 的第三方应用， GCleaner 旨在成为 GNU 世界的 CCleaner，其界面与 CCleaner 非常相似。它的一些主要特点有：

- 清理浏览器历史记录
- 清理应用缓存
- 清理软件包及其配置
- 清理最近使用的文件历史记录
- 清空垃圾箱

在书写本文时， GCleaner 仍处于开发阶段，你可以查看这个项目的网站，并得到源代码来编译和使用 GCleaner。

- [更多地了解 GCleaner][8]

### 你的选择呢？ ###

我已经向你列举了一些可能选项，我让你选择决定使用哪个工具来清理 Ubuntu 14.04。但我可以肯定的是，若你正在寻找一个类似 CCleaner 的应用，你将在上面列举的 4 个工具中进行最后的选择。

--------------------------------------------------------------------------------

via: http://itsfoss.com/ccleaner-alternatives-ubuntu-linux/

作者：[Abhishek][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://www.piriform.com/ccleaner/download
[2]:http://www.howtogeek.com/172820/beginner-geek-what-does-ccleaner-do-and-should-you-use-it/
[3]:http://bleachbit.sourceforge.net/
[4]:http://bleachbit.sourceforge.net/download/linux
[5]:https://www.kde.org/applications/utilities/
[6]:http://ubuntu-tweak.com/
[7]:http://ubuntu-tweak.com/
[8]:https://quassy.github.io/elementary-apps/GCleaner/
