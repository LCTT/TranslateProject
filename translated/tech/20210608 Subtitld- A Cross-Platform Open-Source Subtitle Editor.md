[#]: subject: (Subtitld: A Cross-Platform Open-Source Subtitle Editor)
[#]: via: (https://itsfoss.com/subtitld/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Subtitld: 一个跨平台的开源字幕编辑器
======

字幕使观看视频的体验更加完美。你不需要一定理解视频的语言，字幕可以帮助你用你喜欢的文字来弄清楚正在发生什么。

你在流媒体平台上获得了大部分内容的字幕，你可能需要为一些你在本地收藏的视频添加字幕。

虽然你可以通过简单地下载 SRT 文件并使用视频播放器加载它来做到这一点，但你如何编辑它，删除它，或转录一个视频？Subtitld 是一个开源的字幕编辑器，它可以帮助你。

### Subtitld: 创建、删除、切分和转录字幕

Subtitld 是一个免费的开源项目，让你充分利用你的字幕。

![][1]

如果你没有字幕，就创建一个，如果你需要编辑它，就去吧。有了这个开源工具，你会有许多选项来处理字幕。

换句话说，它是一个成熟的字幕编辑器，也是同类产品中的一个（就我所遇到的而言）。

在你决定试用它之前，让我强调一些关键功能。

### Subtitld 的特点

![][2]

它提供了大量的功能，虽然不是每个人都需要所有的功能，但如果你是一个经常创建、编辑和处理字幕的人，它应该会很方便。

下面是它们的列表：

* 创建字幕
* 编辑字幕
* 使用时间轴移动字幕，手动同步
* 放大/缩小功能，帮助处理拥挤的时间线
* 支持保存为SRT文件格式
* 支持各种其他格式的导入和导出（SSA、TTML、SBV、DFXP、VTT、XML、SCC 和 SAMI）
* 易于调整大小或从时间轴上调整字幕的持续时间
* 与其他字幕合并，或只是在项目中切分字幕
* 能够启用网格，按帧、场景或秒进行可视化
* 在编辑器中回放以检查字幕情况
* 在时间轴上捕捉字幕以避免重叠
* 在字幕中添加/删除
* 启用安全间隙，以确保字幕不会看起来不妥当
* 调整播放速度
* 可用的键盘快捷键
* 自动转录
* 输出刻录了字幕的视频
* 无限次撤消



除了这些功能外，音频波形的视觉线索也有一定的帮助。

![][3]

总的来说，如果你是一个转录视频的人，想一次性地编辑视频，你可以做很多事情也可以专业地使用它，

### 在 Linux 中安装 Subtitld

虽然它也适用于 Windows，但你可以使用 [snap 包][6]轻松地在 Linux 上安装它。你不会发现有任何二进制包或 Flatpak 可用，但你应该能够在任何 Linux 发行版上[使用 snap][7] 安装它。

[Subtitld][8]

如果你想探索，你可以在 [GitLab][9] 上找到源代码。

### 结尾的想法

它有视频同步或添加字幕的精细设置，我只是测试了一些导入、导出、添加或删除字幕的基本功能。

自动转录功能仍处于测试阶段（截至发布时），但用户界面可以有一些改进。例如，当我把鼠标悬停在编辑器内的按钮上时，它没有告诉我它是做什么的。

总的来说，它是一个在 Linux 上的有用工具。你对它有什么看法？请不要犹豫，在下面的评论中让我知道你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/subtitld/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

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