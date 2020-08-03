[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12480-1.html)
[#]: subject: (Video Trimmer: A No-nonsense, Simple Video Trimming Application for Linux Desktop)
[#]: via: (https://itsfoss.com/video-trimmer/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Video Trimmer：Linux 桌面中的傻瓜级的视频修剪应用
======

> 一个非常简单的工具，无需重新编码即可快速修剪视频。我们来看看它提供了什么。

你可能已经知道 Linux 的一些[最佳免费视频编辑器][1]，但并不是每个人都需要它们提供的所有功能。

有时，你只想快速执行一项操作，例如修剪视频。你是选择探索功能完善的视频编辑器但只是执行简单的修剪操作，还是希望使用便捷工具来修剪视频？

当然，这取决于你的个人喜好以及处理视频的方式。但是，对于大多数用户而言，首选是使用非常容易使用的修剪工具。

因此，我想重点介绍一个傻瓜级的开源工具，即 “[Video Trimmer][2]”，它可以快速修剪视频。

![][3]

### Video Trimmer：一个用于快速修剪视频的傻瓜应用

Video Trimmer 是一个开源应用，它可帮助你修剪视频片段而无需重新编码。因此，基本上，你可以能够修剪视频而不会失去原始质量。

你要做的就是使用 Video Trimmer 打开视频文件，然后使用鼠标选择要修剪的时间区域。

你可以手动设置要修剪的时间范围，也可以仅使用鼠标拖动区域进行修剪。当然，如果视频文件很长，而且你不知道从哪里看，手动设置时间戳可能需要一段时间。

为了让你有个印象，请看下面的截图，看看在使用 Video Trimmer 时可用的选项：

![][4]

### 在 Linux 上安装 Video Trimmer

Video Trimmer 仅作为 [Flathub][5] 上的 Flatpak 软件包提供。因此，你应该能够在 Flatpak 支持的任何 Linux 发行版上安装它，而不会出现任何问题。

以防你不了解 Flatpak，你可能想要参考我们的[使用和安装 Flatpak][6] 指南。

- [下载 Video Trimmer（Flathub）][5]

### 总结

Video Trimmer 底层使用 [ffmpeg][7]。它所做的可以在终端中轻松[使用 ffmpeg 命令][8]完成。但是，并非所有人都希望使用终端来剪辑视频的一部分。Video Trimmer 之类的工具可以帮助像我这样的人。

由于某些原因，如果你想寻找一种替代方法，也可以尝试使用 [VidCutter][9]。当然，你始终可以依靠 [Linux 中的顶级视频编辑器][10]（例如 [OpenShot][11]） 来修剪视频以及执行一些高级操作的能力。

你认为在 Linux 中使用 Video Trimmer 如何？你是否有其他喜欢的视频修剪工具？在下面的评论中让我知道你的想法！

--------------------------------------------------------------------------------

via: https://itsfoss.com/video-trimmer/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/open-source-video-editors/
[2]: https://gitlab.gnome.org/YaLTeR/video-trimmer
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/video-trimmer.jpg?ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/video-trimmer-screenshot.jpg?ssl=1
[5]: https://flathub.org/apps/details/org.gnome.gitlab.YaLTeR.VideoTrimmer
[6]: https://itsfoss.com/flatpak-guide/
[7]: https://ffmpeg.org/
[8]: https://itsfoss.com/ffmpeg/
[9]: https://itsfoss.com/vidcutter-video-editor-linux/
[10]: https://linux.cn/article-10185-1.html
[11]: https://itsfoss.com/openshot-video-editor-release/
