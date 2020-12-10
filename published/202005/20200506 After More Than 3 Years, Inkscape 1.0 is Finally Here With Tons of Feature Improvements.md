[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12188-1.html)
[#]: subject: (After More Than 3 Years, Inkscape 1.0 is Finally Here With Tons of Feature Improvements)
[#]: via: (https://itsfoss.com/inkscape-1-release/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

经过了 3 年，Inkscape 1.0 终于发布了
======

![](https://img.linux.net.cn/data/attachment/album/202005/06/094055fvnh9nnnbybwl4jn.jpg)

虽然我不是这方面的专业人员，但可以肯定地说，Inkscape 是[最好的矢量图形编辑器][1]之一。

不仅仅因为它是自由开源软件，而且对于数字艺术家来说，它是一个非常有用的应用程序。

上一次发布（0.92 版本）是在 3 年前。现在，终于，[Inkscape 宣布了它的 1.0 版本][2] —— 增加了很多新的功能和改进。

### Inkscape 1.0 里的新东西

![Inkscape 1.0][3]

在这里，让我重点介绍一下 Inkscape 1.0 版本中重要关键变化。

#### 首个原生 macOS 应用

对于像 Inkscape 这样的神奇工具来说，适当的跨平台支持总是好的。在这个最新的版本中，它推出了原生的 macOS 应用。

请注意，这个 macOS 应用仍然是一个**预览版**，还有很多改进的空间。不过，在无需 [XQuartz][4] 的情况下就做到了更好的系统集成，对于 macOS 用户来说，应该是一个值得期许的进步。

#### 性能提升

不管是什么应用程序/工具，都会从显著的性能提升中受益，而 Inkscape 也是如此。

随着其 1.0 版本的发布，他们提到，当你使用 Inkscape 进行各种创意工作时，你会发现性能更加流畅。

除了在 macOS 上（仍为“预览版”），Inkscape 在 Linux 和 Windows 上的运行都是很好的。

#### 改进的 UI 和 HiDPI 支持

![][5]

他们在发布说明中提到：

> ……达成了一个重要的里程碑，使 Inkscape 能够使用最新的软件（即 GTK+3）来构建编辑器的用户界面。拥有 HiDPI（高分辨率）屏幕的用户要感谢 2018 年波士顿黑客节期间的团队合作，让更新后的 GTK 轮子开始运转起来。

从 GTK+3 的用户界面到高分辨率屏幕的 HiDPI 支持，这都是一次精彩的升级。

更不要忘了，你还可以获得更多的自定义选项来调整外观和感受。

#### 新增功能

![][6]

即便是从纸面上看，这些列出新功能都看起来不错。根据你的专业知识和你的喜好，这些新增功能应该会派上用场。

以下是新功能的概述：

  * 新改进过的实时路径效果（LPE）功能。
  * 新的可搜索的 LPE 选择对话框。
  * 自由式绘图用户现在可以对画布进行镜像和旋转。
  * 铅笔工具的新的 PowerPencil 模式提供了压感的宽度，并且终于可以创建封闭路径了。
  * 包括偏移、PowerClip 和 PowerMask LPE 在内的新路径效果会吸引艺术类用户。
  * 能够创建复制引导、将网格对齐到页面上、测量工具的路径长度指示器和反向 Y 轴。
  * 能够导出带有可点击链接和元数据的 PDF 文件。
  * 新的调色板和网状渐变，可在网页浏览器中使用。

虽然我已经尝试着整理了这个版本中添加的关键功能列表，但你可以在他们的[发布说明][7]中获得全部细节。

#### 其他重要变化

作为重大变化之一，Inkscape 1.0 现在支持 Python 3。而且，随着这一变化，你可能会注意到一些扩展程序无法在最新版本中工作。

所以，如果你的工作依赖于某个扩展程序的工作流程，我建议你仔细看看他们的[发布说明][7]，了解所有的技术细节。

### 在 Linux 上下载和安装 Inkscape 1.0

Inkscape 1.0 有用于 Linux 的 AppImage 和 Snap 软件包，你可以从 Inkscape 的网站上下载。

- [下载 Inkscape 1.0 for Linux][8]

如果你还不知道，可以查看[如何在 Linux 上使用 AppImage 文件][9]来入门。你也可以参考[这个 Snap 指南][10]。

Ubuntu 用户可以在 Ubuntu 软件中心找到 Inskcape 1.0 的 Snap 版本。

我在 [Pop!_OS 20.04][11] 上使用了 AppImage 文件，工作的很好。你可以详细体验所有的功能，看看它的效果如何。

你试过了吗？请在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/inkscape-1-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/vector-graphics-editors-linux/
[2]: https://inkscape.org/news/2020/05/04/introducing-inkscape-10/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/inkscape-1-0.jpg?ssl=1
[4]: https://en.wikipedia.org/wiki/XQuartz
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/inkscape-ui-customization.jpg?ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/inkscape-live-path-effects.jpg?ssl=1
[7]: https://wiki.inkscape.org/wiki/index.php/Release_notes/1.0
[8]: https://inkscape.org/release/1.0/gnulinux/
[9]: https://itsfoss.com/use-appimage-linux/
[10]: https://itsfoss.com/install-snap-linux/
[11]: https://itsfoss.com/pop-os-20-04-review/
