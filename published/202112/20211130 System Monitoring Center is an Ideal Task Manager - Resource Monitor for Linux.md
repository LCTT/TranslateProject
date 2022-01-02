[#]: subject: "System Monitoring Center is an Ideal Task Manager & Resource Monitor for Linux"
[#]: via: "https://itsfoss.com/system-monitoring-center/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14069-1.html"

系统监控中心：一个理想的 Linux 任务管理器和资源监视器
======

> “系统监控中心”是一个多合一的开源应用，不用使用多种工具就可以监控基本的系统资源情况。

![](https://img.linux.net.cn/data/attachment/album/202112/10/131211ng09sz76u2b7gbaw.jpg)

在 Linux 上以图形方式监控系统资源可能体验不是很好，这些与你的桌面环境相配套的系统监控工具可能细节有限。

例如，GNOME 的系统监视器不显示 CPU 频率和温度。

此外，Linux 的默认系统监控程序通常以简单为目标，而不是提供详细的信息。

“<ruby>系统监控中心<rt>System Monitoring Center</rt></ruby>” 是一个有用的 GUI 工具，它提供了大量必要的信息。在这篇文章中，让我给你详细介绍一下它。

### 系统监控中心：显示基本系统统计信息的 Linux 应用

![][1]

系统监控中心是一个基于 GTK3 和 Python 3 的外观时尚的应用，它为你提供了你想要的所有资源使用数据。

在我的例子中，我想在使用系统监控工具时关注 CPU 的频率，但 GNOME 的系统监控工具提供不了帮助。所以，这个应用就非常有用了。

![][2]

该应用的用户体验良好，并提供了大量的信息和功能。让我重点介绍一下它的主要功能。

> 写这篇文章时，该应用程序仍处于测试阶段。因此，你可能会遇到一些错误。然而，我在简短的测试中没有注意到任何问题。

### 系统监控中心的功能

![][3]

首先，它可以让你查看 CPU、内存、磁盘、网络、GPU 和传感器的单独统计数据。

你可以在该工具中看到以下细节信息：

  * 显示 CPU 状态，包括频率
  * 能够显示平均使用率或每个核心的使用率
  * 可以选择 CPU 频率和其他统计的精度
  * 能够改变图表的颜色
  * 按用户过滤系统进程并轻松管理它们
  * 切换一个浮动的摘要小部件，以快速获得信息
  * 显示磁盘使用信息和连接的驱动器
  * 在同一个应用中显示详细的系统信息
  * 控制启动服务和程序
  * 能够控制状态更新的时间间隔
  * 应用本身的系统资源使用率较低
  * 适应系统主题

虽然它为每个标签（或组件）提供了大量的选项和自定义功能，但我希望它能在未来的更新中包括 RAM 频率等东西。

![][4]

然而，考虑到它可以同时取代磁盘使用分析器和 `neofetch` 等终端工具，其余的数据似乎非常有用。

![][5]

请注意，如果你有多个机箱风扇、独立的排风扇或 AIO，你可能无法得到风扇的数据。温度也可能有或没有，但 CPU 的温度应该是可见的。

### 在 Linux 中安装系统监控中心

你可以使用可用的 deb 包在任何基于 Ubuntu 的发行版上轻松安装它。

不幸的是，没有可用的其他软件包，只有一个 ZIP 文件，你得手动构建和编译才能安装它。你在 ZIP 文件中可以找到一个脚本来构建 RPM 包。

deb 文件可以通过 SourceForge 获得。你点击下面的按钮来下载它，或者在他们的 [GitLab 页面][6] 找到。

- [下载系统监控中心][7]

### 总结

系统监控中心是一个开源应用，可以让用户详细了解他们的系统资源，并帮助管理进程。

对于许多 Linux 用户来说，这是一个非常需要的应用，不需要使用单独的终端/GUI 程序就可以提供详细的信息。

--------------------------------------------------------------------------------

via: https://itsfoss.com/system-monitoring-center/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/system-monitoring-center.png?resize=800%2C611&ssl=1
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/system-monitoring-center-full-info.png?resize=800%2C585&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/system-monitoring-center-options.png?resize=582%2C576&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/system-cpu-monitoring.png?resize=800%2C599&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/system-monitoring-center-process.png?resize=800%2C592&ssl=1
[6]: https://kod.pardus.org.tr/Hakan/system-monitoring-center
[7]: https://sourceforge.net/projects/system-monitoring-center/files/latest/download
