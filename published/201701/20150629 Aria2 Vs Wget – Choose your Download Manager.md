aria2 与 wget ：选择你的下载管理器
============================================================

任何没有下载管理器的 Linux 操作系统是不完整的。多年来，基于 Linux 的发行版使用 wget 作为默认下载管理器。它是一个很棒的小程序，可以在命令行下工作，如果你需要安装东西、下载东西、运行 shell 脚本等，某种程度上都可以在 wget 中完成任务。在过去的很多年里，我们发现 wget 缺乏一些高级的功能，而它的替代品 ** aria2** ，由于满足了高级 Linux 用户的渴望而受到了许多用户的关注。我们将在本文中回顾 **aria2** 的安装过程以及 wget 和 aria2 之间的区别，因此你可以决定哪个下载管理器最符合你的需要。

### 安装 aria2

**在 Ubuntu/Debian 中安装 aria2：**

只要在 Ubuntu 中运行下面的命令安装：

```
sudo apt-get install aria2
```

[
 ![aria2](http://linuxpitstop.com/wp-content/uploads/2015/06/aria2.png) 
][1]

**在 Fedora/RHEL/Centos 中安装 aria2：**

运行下面的命令在 Fedora/RHEL 和基于 Centos 的系统中安装：

```
sudo yum install aria2
```

**在 Arch Linux 中安装 aria2：**

运行下面的命令在基于 Arch Linux 的系统中安装。

```
sudo pacman -Sy aria2
```

### aria2 的重要功能

让我们来讨论 aria2 中使它如此受欢迎的重要功能：

*   通过使用多个连接下载文件，最大限度地利用可用带宽。
*   同时下载多个文件和同时下载的能力。
*   torrent 客户端提供的所有功能都可以在这个小程序中找到。
*   它提供 meta 链接下载。
*   支持使用 JSON-RPC 和 XML-RPC 协议的远程过程调用。
*   无需等待当前下载完成，轻松批量下载文件。

### aria2 的一些副作用:

aria2 的多线程机制可能会使目标服务器过载。相比下来 wget 就轻量级多了，wget 比 aria2 消耗资源少 20％。aria2 尚未经受 wget 那样巨大的使用规模的测试，因此可能完全准备好成为默认下载管理器。

### wget 的重要特性

*   当然它是最广泛使用和测试的下载管理器。
*   它是一个简单的程序，具有较少的功能，但稳定工作了几十年。
*   默认所有 Linux 发行版上都有，不需要繁重的安装。
*   与 aria2 相比更轻量级。

### 总结

虽然 wget 没有丰富的功能，但仍然工作得相当不错，然而，高级用户肯定会喜欢 aria2，因为它满足更快和并发下载的需要。aria2 可能需要很长时间来取代 wget 成为默认下载管理器，而目前 wget 用在几乎所有 linux 发行版的安装程序脚本中。

--------------------------------------------------------------------------------

via: http://linuxpitstop.com/aria-2-vs-wget/

作者：[Aun][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxpitstop.com/author/aun/
[1]:http://linuxpitstop.com/wp-content/uploads/2015/06/aria2.png
