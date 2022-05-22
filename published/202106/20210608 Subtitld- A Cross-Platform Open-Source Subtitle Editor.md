[#]: subject: (Subtitld: A Cross-Platform Open-Source Subtitle Editor)
[#]: via: (https://itsfoss.com/subtitld/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13510-1.html)

Subtitld: 一个跨平台的开源字幕编辑器
======

![](https://img.linux.net.cn/data/attachment/album/202106/22/145800rejjtp9exvd7zvpn.jpg)

字幕可以使观看视频的体验更加完美。你不需要一定理解视频的语言，字幕可以帮助你用你喜欢的文字来弄清楚正在发生什么。

你在流媒体平台上找到的大部分内容都有字幕，你可能需要为一些你在本地收藏的视频添加字幕。

虽然你可以通过简单地下载 SRT 文件并使用视频播放器加载它来做到这一点，但你如何编辑它，删除它，或转录一个视频？Subtitld 是一个开源的字幕编辑器，它可以帮助你。

### Subtitld: 创建、删除、切分和转录字幕

Subtitld 是一个自由开源的项目，可以让你充分利用你的字幕。

![][1]

如果你没有字幕，就创建一个，如果你需要编辑它，就用这个吧。有了这个开源工具，你会有许多选项来处理字幕。

换句话说，它是字幕编辑器之一，也是一个成熟的字幕编辑器（就我所遇到的而言）。

在你决定试用它之前，让我强调一些关键功能。

### Subtitld 的功能

![][2]

它提供了大量的功能，虽然不是每个人都需要所有的功能，但如果你是一个经常需要创建、编辑和处理字幕的人，它应该会很方便。

下面是它的功能列表：

* 创建字幕
* 编辑字幕
* 使用时间轴移动字幕，手动同步
* 放大/缩小功能，帮助处理拥挤的时间线
* 支持保存为 SRT 文件格式
* 支持各种其他格式的导入和导出（SSA、TTML、SBV、DFXP、VTT、XML、SCC 和 SAMI）
* 易于调整字幕大小或从时间轴上调整字幕的持续时间
* 与其他字幕合并，或从项目中切分字幕
* 能够启用网格，按帧、场景或秒进行可视化
* 在编辑器中回放以检查字幕情况
* 在时间轴上捕捉字幕以避免重叠
* 在字幕中添加/删除
* 启用安全边界，以确保字幕不会看起来不妥当
* 调整播放速度
* 键盘快捷键
* 自动转录
* 输出加入了字幕的视频
* 无限次撤消

除了这些功能外，音频波形的视觉提示也有一定的帮助。

![][3]

总的来说，如果你是一个转录视频的人，想一次性地编辑视频，你可以用它做很多事情，也可以专业地使用它。

### 在 Linux 中安装 Subtitld

虽然它也适用于 Windows，但你可以在 Linux 上使用 [snap 包][6] 轻松地安装它。你不会找到二进制包或 Flatpak，但你应该能够在任何 Linux 发行版上 [使用 snap][7] 安装它。

- [Subtitld][8]

如果你想深入探索，你可以在 [GitLab][9] 上找到源代码。

### 总结

它有视频同步或添加字幕的精细设置，我只是测试了一些导入、导出、添加或删除字幕的基本功能。

自动转录功能仍处于测试阶段（截至发布时），但用户界面可以再做一些改进。例如，当我把鼠标悬停在编辑器内的按钮上时，它没有告诉我它是做什么的。

总的来说，它是一个在 Linux 上的有用工具。你对它有什么看法？请不要犹豫，在下面的评论中让我知道你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/subtitld/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/subtitld-editor.png?resize=800%2C546&ssl=1
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/subtitld-export.png?resize=800%2C469&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/subtitld-screenshot-1.png?resize=800%2C588&ssl=1
[6]: https://snapcraft.io/subtitld
[7]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[8]: https://subtitld.jonata.org
[9]: https://gitlab.com/jonata/subtitld