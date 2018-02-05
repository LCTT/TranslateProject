使用 Ubuntu Cleaner 为 Ubuntu/LinuxMint 释放空间
============================================================

我们中的大部分人都会经常忘记清理 Linux 系统中的垃圾文件，这会导致我们的系统空间不足。

一般情况下我们不得不按标准的程序来释放 Linux 发行版中的空间（删除发行版缓存、系统日志、应用程序缓存和垃圾邮件），但如果我们每次以手动方式执行相同的过程，那么会花费大量的时间和困难。

在 Linux 的应用程序中，可以使这个任务更容易。今天我们将教你如何使用 Ubuntu Cleaner，它衍生自 Ubuntu Tweak 中的 Janitor 模块。

[Ubuntu Cleaner][2]  是一个可以简化你清理 Ubuntu 系统的工具。如我们所知道，Ubuntu Tweak 是帮助我们调整 Ubuntu 及其衍生发行版的最佳实用程序之一。但由于它的主要开发人员没有时间维护它，因此已被弃用。

建议阅读：

- [Stacer - Linux 系统优化和监控工具][3]
- [BleachBit - 在 Linux 中清理系统的快速而最佳方法][4]

因为许多用户在最新版本中仍使用 Ubuntu Tweak 这个工具（因为他们不想离开这个工具），所以 Ubuntu Cleaner 的开发人员从 Ubuntu Tweak 工具中复刻了 janitor 模块，并将这个有用的功能带回 Ubuntu 社区，并命名为 Ubuntu Cleaner。它也成为了 Ubuntu 多年来最受欢迎的实用程序之一。

建议阅读：

- [uCareSystem - 用于 Ubuntu / LinuxMint 的一体化系统更新和维护工具][5]

我猜所有那些怀念 Ubuntu Tweak 的人都会因为有 Ubuntu Cleaner 而感到高兴，因为它是从 janitor 模块衍生出来的。

Ubuntu Cleaner 将删除 Ubuntu 及其衍生发行版中的以下垃圾文件：

*   应用缓存 (浏览器缓存)
*   缩略图缓存
*   Apt 缓存
*   旧的内核
*   包的配置文件
*   不需要的包

### 如何安装 Ubuntu Cleaner

因为开发者提供官方 PPA ，我们可以通过 PPA 轻松地将 Ubuntu Cleaner 安装到 Ubuntu 及其衍生发行版。 Ubuntu Cleaner 目前支持 Ubuntu 14.04 LTS 和 Ubuntu 16.04 LTS。

```
$ sudo add-apt-repository ppa:gerardpuig/ppa
$ sudo apt update
$ sudo apt install ubuntu-cleaner
```

### 如何使用 Ubuntu Cleaner

从主菜单启动 Ubuntu Cleaner ，你可以看到得以下默认界面。

![](http://www.2daygeek.com/wp-content/uploads/2017/06/Ubuntu-Cleaner_001.png)

勾选你要清理的文件前面的 “复选框”。 最后点击 “清理” 按钮从系统中删除垃圾文件。

![](http://www.2daygeek.com/wp-content/uploads/2017/06/Ubuntu-Cleaner_002.png)

现在我们已经成功清除了系统中的垃圾。

![](http://www.2daygeek.com/wp-content/uploads/2017/06/Ubuntu-Cleaner_003.png)

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/ubuntu-cleaner-system-cleaner-ubuntu-tweak-alternative-janitor/

作者：[2DAYGEEK][a]
译者：[chenxinlong](https://github.com/chenxinlong)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/2daygeek/
[1]:http://www.2daygeek.com/author/2daygeek/
[2]:http://ubuntu-cleaner.blogspot.in/
[3]:http://www.2daygeek.com/stacer-linux-system-optimizer-and-monitoring-tool/
[4]:http://www.2daygeek.com/bleachbit-system-cleaner-on-ubuntu-debian-fedora-opensuse-arch-linux-mint/
[5]:http://www.2daygeek.com/ucaresystem-system-update-and-maintenance-tool-for-ubuntu-linuxmint/
[6]:http://www.2daygeek.com/wp-content/uploads/2017/06/Ubuntu-Cleaner_001.png
[7]:http://www.2daygeek.com/wp-content/uploads/2017/06/Ubuntu-Cleaner_002.png
[8]:http://www.2daygeek.com/wp-content/uploads/2017/06/Ubuntu-Cleaner_003.png
