[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12302-1.html)
[#]: subject: (Track Your Screen Time in Linux with ActivityWatch)
[#]: via: (https://itsfoss.com/activitywatch/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

使用 ActivityWatch 跟踪你在 Linux 中的屏幕使用时间
======

![](https://img.linux.net.cn/data/attachment/album/202006/10/104854yumcnhp8smmjxcht.jpg)

> ActivityWatch 是一款开源的隐私友好型应用程序，可追踪你在台式电脑或移动设备上的使用时间。

### ActivityWatch: 一个追踪你在哪个应用程序上花了多少时间的开源应用程序

![ActivityWatch lets you check the time spent on various applications][1]

[ActivityWatch][2] 是一款跨平台的开源应用，可以帮助你追踪使用时间，衡量你的工作效率。它可以追踪你花在应用程序、浏览器上的时间，以及你是否 AFK（远离键盘）或系统处于休眠状态。

不只是追踪时间，它还提供了一堆有用的功能，通过可视化的方式帮助你轻松分析你是如何花费时间的，从而有可能提高你的生产力。

![][3]

它是 [RescueTime][4] 和 [ManicTime][5] 等专有产品的绝佳替代品。

ActivityWatch 可用于 Linux、Windows、macOS 和 [Android][6]。它还提供了 Chrome 和 Firefox 的浏览器扩展。截至目前，App Store 上还没有它的 iOS 版应用。

![][7]

它刚刚进入该领域，正在积极开发，以解决任何现有的问题并引入新的功能，如在多个设备上同步你的活动数据的能力。

**对于注重隐私的用户来说，我应该提到，收集的数据被存储在你本地的设备上。这是一件好事，因为你可以跟踪你的花费时间，而不会被别人跟踪。**

### ActivityWatch 的功能

![][8]

基本上，ActivityWatch 可以让你监控你的活动，以分析不良的屏幕使用时间，或改善你在设备上工作的时间管理。

具体来说，它提供了几个有用的功能，主要有：

* 摘要你的日常活动及按使用时间排序的应用和程序列表。
* 追踪你的浏览器活动的时间，使用浏览器扩展来获得每个活动标签所花费时间的确切数据。
* 追踪 AFK 和非 AFK 时间。（AFK - “Away From Keyboard” 的缩写，即不在电脑前）
* 提供不同的可视化时间线，以监测你的活动。
* 能够使用 [watchers][9] 跟踪你在编辑器上写代码的时间。
* 记录你的活动，以分析你的生产力。
* 将花费的时间进行分类，可以帮助你详细分析。
* 可以添加更多的类别和调整时间轴的持续时长。
* 能够将数据导出/导入为 [JSON][10] 文件。
* 实验性的秒表功能。
* 本地存储数据，以尊重用户隐私。

### 在 Linux 上安装 ActivityWatch

> 注：如果你的 Linux 发行版不支持系统托盘图标，你需要遵循这个[文档][11]来解决这个问题。

不幸的是，你找不到 AppImage、Flatpak 或 Snap 软件包。然而，对于 Manjaro 或 Arch Linux 有可以安装的 [AUR][12] 包。

对于所有其它的 Linux 发行版，你会得到一个 ZIP 文件，其中包括一个要运行的 `aw-qt` 应用程序。

要运行它，你需要[解压 zip 归档文件][13]，然后通过双击 `aw-qt` 应用程序运行二进制文件来安装它。

![Aw Qt][14]

你也可以使用终端：

```
cd activitywatch-v0.9.2-linux-x86_64
sudo ./aw-qt
```

解压文件夹的位置和文件名可能会有所不同 —— 所以请确保你导航到正确的目录，然后使用上面的命令。完成后，你可以从系统托盘图标访问 ActivityWatch，或者直接前往 [localhost:5600][15] 访问它。

你也可以查看他们的 [GitHub 页面][16]或[官方网站][2]来探索更多关于它的信息。

- [下载 ActivityWatch][2]

顺便提一句，如果你计划经常使用 ActivityWatch，你应该将下载的文件移动到 `/opt` 目录下，并在 `/usr/share/bin` 目录下创建一个链接到 `aw-qt` 可执行文件符号链接。这样一来，该应用程序可以作为一个常规命令供系统上的所有用户使用。类似的方法在 [PopcornTime 安装教程][17]中也有演示。

### 我对 ActivityWatch 的看法

![][18]

在 [Pop!_OS 20.04][19] 上，时间跟踪功能可以完全正常地工作，也支持系统托盘图标。你可能会遇到一个错误，不能让你从系统托盘图标访问 ActivityWatch（这也是一个 [GitHub 上的已知问题][20]）。在这种情况下，你需要通过 [localhost:5600][15] 来访问它。

就个人而言，考虑到我在桌面上使用它，并且没有计划在智能手机上使用它，我对提供的功能相当满意。

我必须得向你推荐尝试这个不错的开源项目，并一路支持他们。如果你喜欢这个项目，请随时通过添加星标或赞助[他们的 GitHub 仓库][21]来表示你的赞赏。

欢迎在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/activitywatch/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/activitywatch.png?fit=800%2C607&ssl=1
[2]: https://activitywatch.net/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/activitywatch-afk.jpg?ssl=1
[4]: https://itsfoss.com/recommends/rescuetime/
[5]: https://www.manictime.com/
[6]: https://play.google.com/store/apps/details?id=net.activitywatch.android
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/activitywatch-timeline.jpg?ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/activitywatch-settings.jpg?ssl=1
[9]: https://docs.activitywatch.net/en/latest/watchers.html
[10]: https://en.wikipedia.org/wiki/JSON
[11]: https://docs.activitywatch.net/en/latest/getting-started.html
[12]: https://aur.archlinux.org/packages/activitywatch-bin/
[13]: https://itsfoss.com/unzip-linux/
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/aw-qt.jpg?ssl=1
[15]: https://itsfoss.com/activitywatch/5600
[16]: https://github.com/ActivityWatch
[17]: https://itsfoss.com/popcorn-time-ubuntu-linux/
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/activitywatch-screenshot.jpg?ssl=1
[19]: https://itsfoss.com/pop-os-20-04-review/
[20]: https://github.com/ActivityWatch/activitywatch/issues/208
[21]: https://github.com/ActivityWatch/activitywatch
