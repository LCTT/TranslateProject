[#]: subject: (Running Linux Apps In Windows Is Now A Reality)
[#]: via: (https://news.itsfoss.com/linux-gui-apps-wsl/)
[#]: author: (Jacob Crume https://news.itsfoss.com/author/jacob/)
[#]: collector: (lujun9972)
[#]: translator: (Kevin3599)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13376-1.html)

在 Windows 中运行基于 Linux 的应用程序已经成为现实
======

> 微软宣布对其 WSL 进行重大改进，使你能够轻松地运行 Linux 图形化应用程序。

![](https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/04/linux-apps-windows.png?w=1200&ssl=1)

当微软在 2016 年发布 “Windows subsystem for Linux”（也就是 WSL）的时候显然有夸大宣传的嫌疑，当时人们梦想着无需重启就可以同时运行基于 Windows 和 Linux 的应用程序，令人可惜的是，WSL 只能运行 Linux 终端程序。

去年，微软再次尝试去颠覆 Windows 的应用生态，这一次，他们替换了老旧的模拟核心，转而使用了真正的 Linux 核心，这一变化使你可以 [在 Windows 中运行 Linux 应用程序][2]。

### WSL 图形化应用的初步预览

![https://youtu.be/f8_nvJzuaSU](https://img.linux.net.cn//static/video/Introducing%20Linux%20GUI%20apps%20running%20on%20Windows%20using%20the%20Windows%20Subsystem%20for%20Linux%20%28WSL%29-f8_nvJzuaSU.mp4)

从技术上讲，用户最初确实在 WSL 上获得了对 Linux 图形化应用程序的支持，但仅限于使用第三方 X 服务器时。这通常是不稳定的、缓慢、难以设置，并且使人们有隐私方面的顾虑。

结果是小部分 Linux 爱好者（碰巧运行 Windows），他们具有设置 X 服务器的能力。但是，这些爱好者对没有硬件加速支持感到失望。

所以，较为明智的方法是在 WSL 上只运行基于命令行的程序。

**但是现在这个问题得到了改善**。现在，微软 [正式支持][4] 了 Linux 图形化应用程序，我们很快就能够享受硬件加速了，

### 面向大众的 Linux 图形化应用程序：WSLg

![图片来源：Microsoft Devblogs][5]

随着微软发布新的 WSL，有了一系列巨大的改进，它们包括：

  * GPU 硬件加速
  * 开箱即用的音频和麦克风支持
  * 自动启用 X 服务器和 Pulse 音频服务

有趣的是，开发者们给这个功能起了一个有趣的外号 “WSLg”。

这些功能将使在 WSL 上运行 Linux 应用程序几乎与运行原生应用程序一样容易，同时无需占用过多性能资源。

因此，你可以尝试运行 [自己喜欢的 IDE][6]、特定于 Linux 的测试用例以及诸如 [CAD][7] 之类的各种软件。

#### Linux 应用的 GPU 硬件加速

![图片鸣谢：Microsoft Devblogs][8]

以前在 Windows 上运行图形化 Linux 程序的最大问题之一是它们无法使用硬件加速。当用户尝试移动窗口和执行任何需要对 GPU 性能有要求的任务时候，它常常陷入缓慢卡顿的局面。

根据微软发布的公告：

> “作为此次更新的一部分，我们也启用了对 3D 图形的 GPU 加速支持，多亏了 Mesa 21.0 中完成的工作，所有的复杂 3D 渲染的应用程序都可以利用 OpenGL 在 Windows 10 上使用 GPU 为这些应用程序提供硬件加速。”
 
这是一个相当实用的改进，这对用户在 WSL 下运行需求强大 GPU 性能的应用程序提供了莫大帮助。

#### 开箱即用的音频和麦克风支持！

如果想要良好的并行 Windows 和 Linux 程序，好的音频支持是必不可少的，随着新的 WSL 发布，音频得到开箱即用的支持，这都要归功于随着 X 服务器一同启动的 Pulse 音频服务。

微软解释说：

> “WSL 上的 Linux 图形化应用程序还将包括开箱即用的音频和麦克风支持。这一令人兴奋的改进将使你的应用程序可以播放音频提示并调用麦克风，适合构建、测试或使用电影播放器、电信应用程序等。”

如果我们希望 Linux 变得更加普及，这是一项关键功能。这也将允许 Windows 应用的开发人员更好地将其应用移植到 Linux。

#### 自动启动所有必需的服务器

![图片鸣谢：Microsoft Devblogs][9]

以前，你必须先手动启动 [PulseAudio][10] 和 [X 服务器][11]，然后才能运行应用程序。现在，微软已经实现了一项服务，可以检查 Linux 应用程序是否正在运行，然后自动启动所需的服务器。

这使得用户更容易在 Windows 上运行 Linux 应用程序。

微软声称这些改动会显著提升用户体验。

> “借助此功能，我们将启动一个配套的系统分发包，其中包含 Wayland、X 服务器、Pulse 音频服务以及使 Linux 图形化应用程序与 Windows 通信所需的所有功能。使用完图形化应用程序并终止 WSL 发行版后，系统分发包也会自动结束其会话。”

这些组件的结合使 Linux 图形化应用程序与常规 Windows 程序并行运行更为简单。

### 总结

有了这些新功能，微软似乎正在竭尽全力使 Linux 应用程序在 Windows 上运行。随着越来越多的用户在 Windows 上运行 Linux 应用程序，我们可能会看到更多的用户转向 Linux。特别是因为他们习惯的应用程序能够运行。

如果这种做法取得了成功（并且微软几年后仍未将其雪藏），它将结束 5 年来对将 Linux 应用引入 Windows 的探索。如果你想了解更多信息，可以查看 [发行公告][12]。

你对在 Windows 上运行 Linux 图形化应用程序怎么看？请在下面留下你的评论。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-gui-apps-wsl/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[Kevin3599](https://github.com/Kevin3599)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://docs.microsoft.com/en-us/windows/wsl/
[2]: https://itsfoss.com/run-linux-apps-windows-wsl/
[3]: https://i0.wp.com/i.ytimg.com/vi/f8_nvJzuaSU/hqdefault.jpg?w=780&ssl=1
[4]: https://devblogs.microsoft.com/commandline/the-initial-preview-of-gui-app-support-is-now-available-for-the-windows-subsystem-for-linux-2/
[5]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/04/gedit-wsl-gui.png?w=800&ssl=1
[6]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[7]: https://itsfoss.com/cad-software-linux/
[8]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/04/gpu-acceleration-wsl.png?w=800&ssl=1
[9]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/04/wslg-architecture.png?w=800&ssl=1
[10]: https://www.freedesktop.org/wiki/Software/PulseAudio/
[11]: https://x.org/wiki/
[12]: https://blogs.windows.com/windows-insider/2021/04/21/announcing-windows-10-insider-preview-build-21364/
