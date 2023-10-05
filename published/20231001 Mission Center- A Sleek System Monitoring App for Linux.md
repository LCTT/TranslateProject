[#]: subject: "Mission Center: A Sleek System Monitoring App for Linux"
[#]: via: "https://news.itsfoss.com/mission-center/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16257-1.html"

任务中心：一款流畅的 Linux 系统监控应用
======

![][0]

> 这是一款为 Linux 打造的用户友好的系统监控应用。让我们一起来了解！

假如有一天，你发现你的系统开始运行缓慢，你的发行版的默认的系统监控应用又无法给与帮助，你会如何处理？

我能理解当你在试图找出是什么进程引起你的系统运行缓慢，而系统监控器却无法提供帮助是何等烦恼的事。

在此，我初步介绍的这个工具，或许就是你需要的。这就是 “<ruby>任务中心<rt>Mission Center</rt></ruby>”，一个为 Linux 打造的系统监控器，旨在提供实用的功能。

下文将一一展示这个应用可以做什么，以及它的一些限制。

> 🚧 这个应用还是非常新的，处于积极的开发中。所以，预计会有一些变动。

### ⭐ 任务中心：概述

![][1]

主要使用 **内存安全的 Rust 编程语言** 编写的 [任务中心][2] 是一款可以让你监控 CPU、内存、磁盘、网络以及 GPU 的系统监控器。

它的几个关键特性包括：

  * 实时监控每个线程的 CPU 使用情况。
  * 有能力监控 RAM 和 Swap 的使用状况。
  * 提供应用和进程的详细使用信息。
  * 监控网络的利用率和传输速度。

### 👨‍💻 初步印象

我在一个运行着 **[Ubuntu 22.04][4] LTS** 的系统上进行了测试，由于这款应用 **提供了 Flatpak 安装方式**，使得整个安装过程相当简洁。

我不得不说，任务中心 **看起来和** [Windows 11][5] **上的任务管理器大体相似**，这并不算是坏事。这种界面布局十分适合以用户友好的方式展示所有重要的信息。

我首先查看的是系统监控的 “<ruby>性能<rt>Performance</rt></ruby>” 部分中的 CPU 标签。它向我提供了我处理器的所有关键信息，并配有一个能**展示实时 CPU 使用率的图表**。

我还能切换到 “<ruby>逻辑处理器<rt>logical processors</rt></ruby>” 视图，以便**观察每个线程的 CPU 使用情况**。只需在图表上进行右键点击并进入 “<ruby>改变视图<rt>Change Graph To</rt></ruby>” 菜单即可切换。

![][6]

我接下来查看的是 “<ruby>内存<rt>Memory</rt></ruby>” 标签，它提供了**一个内存使用的实时图表**，以及两个正在使用的 RAM 模块的实用信息。

![][7]

然后我查看了 “<ruby>硬盘<rt>Disk</rt></ruby>” 标签。即便我在我的系统中有多个存储硬盘，但我只在 Ubuntu 上使用了 “Disk 4”。我对其进行了使用率检查，显示出来的似乎是实时的磁盘使用数据。

不过，[据开发者所述][8]，当前**硬盘使用率的百分比仍在开发中**，因此，现在的数据可能尚不准确。

![][9]

最后，我查看了 “<ruby>以太网<rt>Ethernet</rt></ruby>” 标签。它向你展示了有关系统的网络活动的实时图表，包括了下载和上传活动的两个信息点。

然而，它对于应用的网络数据使用情况，目前还是**没有应用级的网络数据信息**。这个功能，开发者正 [在着手开发][10]。

![][12]

接下来，我查看了 “<ruby>应用<rt>Apps</rt></ruby>” 部分。这里包含了系统中运行的大部分（甚至全部）应用和进程。它不有展示了应用/进程的全部有用信息，包括 PID、CPU 使用、内存和磁盘使用情况。

你还能在任何一个应用/进程上进行右键点击，来选择 **停止应用/进程** 或 **强制停止应用/进程**。

![][13]

我还调整了任务中心应用的一些设置，比如：

  * 调整所有实时图表的更新频率
  * 设定合并进程统计数据
  * 记住我在 “<ruby>应用<rt>Apps</rt></ruby>” 部分所使用的排序顺序。

![][14]

我注意到一个缺失的数据，关于我的 GPU。任务中心**未能检测到我的英伟达 GPU**。

这是可以理解的，因为 **GPU 的支持目前仍然处于实验阶段**，仅支持 AMD 和英伟达的 GPU。

### 📥 获取任务中心

任务中心可以在 [Flathub 商店][15] 或者 [GitLab][16] 上获得，如果你更倾向于从源码来构建的话。

> **[任务中心（Flathub）][15]**

💬 你会考虑用任务中心来替代你 Linux 系统上的默认系统监控器吗？

*（题图：MJ/feb84cdf-0719-401a-9c4a-1db7960d4572）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/mission-center/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_1.png
[2]: https://missioncenter.io/
[3]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[4]: https://news.itsfoss.com/ubuntu-22-04-release/
[5]: https://www.microsoft.com/en-us/windows?wa=wsignin1.0
[6]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_2.png
[7]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_3.png
[8]: https://gitlab.com/mission-center-devs/mission-center/-/issues/2
[9]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_4.png
[10]: https://gitlab.com/mission-center-devs/mission-center/-/issues/3
[11]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[12]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_5-1.png
[13]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_6.png
[14]: https://news.itsfoss.com/content/images/2023/09/Mission_Center_7.png
[15]: https://flathub.org/apps/io.missioncenter.MissionCenter
[16]: https://gitlab.com/mission-center-devs/mission-center
[17]: https://news.itsfoss.com/tag/first-look/
[0]: https://img.linux.net.cn/data/attachment/album/202310/05/180653pnz0nkta1lc1tclz.jpg