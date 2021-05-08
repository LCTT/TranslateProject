[#]: subject: (Running Linux Apps In Windows Is Now A Reality)
[#]: via: (https://news.itsfoss.com/linux-gui-apps-wsl/)
[#]: author: (Jacob Crume https://news.itsfoss.com/author/jacob/)
[#]: collector: (lujun9972)
[#]: translator: (Kevin3599 )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
在Windows中运行基于Linux的应用程序已经成为现实

======

当微软在2016年发布“Windows subsystem for Linux”也就是WSL的时候显然有夸大宣传的嫌疑，当时人们梦想着无需重启就可以同时运行基于Windows和Linux的应用程序，令人可惜的是，WSL只能运行Linux终端程序。

去年，微软再次尝试去颠覆Windows的应用生态，这一次，他们替换了老旧的虚拟核心，转而使用了真正的Linux核心，这使得用户可以同时运行Linux和Windows程序。 [Linux apps in Windows][2].

### 有关WSL用户界面的最初展示

![][3]

从技术上讲，用户确实获得了WSL上对Linux GUI应用程序的支持，但仅限于使用第三方X窗口系统时。这通常是不稳定的，缓慢的，难以设置的，并且使人们有隐私方面的顾虑。

结果是小部分Linux爱好者（碰巧运行Windows），他们具有设置X窗口系统的能力。但是，这些爱好者对硬件加速的缺失感到失望。

所以，较为明智的方法是在WSL上只运行基于命令行的程序。

**但是现在这个问题得到了改善**  [现在，微软官方宣布了对图形化的Linux应用程序的支持，][4] 我们很快就能够享受硬件加速了，
### 面向大众的Linux GUI应用程序：WSLg

![图片来源：Microsoft Devblogs][5]

随着微软发布新的WSL，有了一系列巨大的改进，它们包括：

  * GPU硬件加速
  * 开箱即用的音频和麦克风支持
  * 自动启用X图形界面和 Pulse Audio服务


有趣的是，开发者们给这个功能起了一个有趣的外号“WSLg”

这些功能将使在WSL上运行Linux应用程序几乎与运行原生应用程序一样容易，同时无需占用过多性能资源。

因此，您可以尝试运行 [自己喜欢的IDE][6], 特定于Linux的测试用例以及诸如CAD之类的各种软件 [CAD][7].

#### 在Linux应用下的GPU硬件加速。

![图片鸣谢：Microsoft Devblogs][8]

以前在Windows上运行GUI Linux程序的最大问题之一是它们无法使用硬件加速。当用户尝试移动窗口并执行需要对GPU性能有要求的任务时候它常常陷入缓慢卡顿的局面。

根据微软发布的宣发：

> “作为此次更新的一部分，我们也启用了对3D图形的GPU加速支持，多亏了Mesa 21.0，所有的复杂3D渲染的应用程序都可以利用OpenGL在Windows 10上使用GPU为这些应用程序提供硬件加速。”
> 
这是一个相当实用的改进，这对用户在WSL下运行需求强大GPU性能的应用程序提供了莫大帮助。

#### 开箱即用的音频和麦克风支持！

如果想要良好的并行Windows和Linux程序，好的麦克风支持是必不可少的，随着新的WSL发布，音频支持时开箱即用的，这都要归功于随着X图形界面一同启用的pulse Audio服务。

如果想要良好的并行Windows和Linux程序，好的麦克风支持是必不可少的，随着新的WSL发布，音频支持时开箱即用的，这都要归功于随着X图形界面一同启用的pulse Audio服务。

> “WSL上的Linux GUI应用程序还将包括开箱即用的音频和麦克风支持。这一令人兴奋的改进将使您的应用程序可以播放音频提示并调用麦克风，适合构建，测试或使用电影播放器，应用程序等。”

如果我们希望Linux变得更加普及，这是一项关键功能。这也将允许Windows应用的开发人员更好地将其应用移植到Linux。

####自动启动所有必需的服务

![图片鸣谢：Microsoft Devblogs][9]

以前，您必须先手动启动 [PulseAudio][10] 和 [X 图形界面][11] 然后才能运行应用程序。现在，Microsoft已实添加一项功能，该功能可以检查Linux应用程序是否正在运行，然后自动启动所需的服务。

这允许用户更容易在Windows上运行Linux应用程序

微软声称这些改动会显著提升用户体验.

> “借助此功能，我们将启动一个配套发行版，其中包含Wayland，X桌面，音频服务以及使Linux GUI应用程序与Windows并行所需的所有功能。使用完GUI应用程序并终止WSL分发后，系统发行版也会自动结束其进程。”

这些组件的结合使运行Linux GUI应用程序与常规Windows程序并行运行更为简单。

### 总结

有了这些新功能，微软似乎正在竭尽全力使Linux应用程序在Windows上运行。随着越来越多的用户在Windows上运行Linux应用程序，我们可能会看到更多的用户转向Linux。特别是因为他们习惯的应用程序能够运行。

如果这种做法取得了成功（并且微软几年后仍未将其雪藏），它将结束为期5年的试图将Linux应用程序移植入Windows的过程。如果您想了解更多信息，可以查看 [发行说明][12].

_你对Linux软件移植入Windows怎么看？请在下面留下你的评论。_

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

#### _Related_

  * [Linux Mint 20.1 is Available to Download Now, Here are 9 New Features in This Release][13]
  * ![][14] ![Linux Mint 20.1][15]


  * [The Progress Linux has Made in Terms of Gaming is Simply Incredible: Lutris Creator][16]
  * ![][14] ![][17]


  * [Nitrux 1.3.8 Release Packs in KDE Plasma 5.21, Linux 5.11, and More Changes][18]
  * ![][14] ![][19]



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-gui-apps-wsl/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[Kevin3599](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://docs.microsoft.com/en-us/windows/wsl/
[2]: https://itsfoss.com/run-linux-apps-windows-wsl/
[3]: https://i0.wp.com/i.ytimg.com/vi/f8_nvJzuaSU/hqdefault.jpg?w=780&ssl=1
[4]: https://devblogs.microsoft.com/commandline/the-initial-preview-of-gui-app-support-is-now-available-for-the-windows-subsystem-for-linux-2/
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzQ0MScgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[6]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[7]: https://itsfoss.com/cad-software-linux/
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzQ0NScgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[9]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzQ0MCcgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[10]: https://www.freedesktop.org/wiki/Software/PulseAudio/
[11]: https://x.org/wiki/
[12]: https://blogs.windows.com/windows-insider/2021/04/21/announcing-windows-10-insider-preview-build-21364/
[13]: https://news.itsfoss.com/linux-mint-20-1-release/
[14]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzIwMCcgd2lkdGg9JzM1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[15]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/linux-mint-20-1.png?fit=1200%2C675&ssl=1&resize=350%2C200
[16]: https://news.itsfoss.com/lutris-creator-interview/
[17]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/03/lutris-interview-ft.png?fit=1200%2C675&ssl=1&resize=350%2C200
[18]: https://news.itsfoss.com/nitrux-1-3-8-release/
[19]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/03/nitrux-1-3-8.png?fit=1200%2C675&ssl=1&resize=350%2C200
