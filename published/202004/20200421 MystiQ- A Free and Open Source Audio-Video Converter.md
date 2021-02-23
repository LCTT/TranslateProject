[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12160-1.html)
[#]: subject: (MystiQ: A Free and Open Source Audio/Video Converter)
[#]: via: (https://itsfoss.com/mystiq/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

MystiQ：一个自由开源的音视频转换器
======

![](https://img.linux.net.cn/data/attachment/album/202004/28/223258cr9rxzyrj344kh68.jpg)

> MystiQ 是一款全新的开源视频转换工具，适用于 Linux 和 Windows。它的底层使用 FFMPEG，并为你提供了一个基于 Qt 的整洁干净的图形界面。

### MystiQ，一个基于 QT 的 FFmpeg GUI 前端

![][1]

音频/视频转换工具可为每位跨多个平台的计算机用户提供方便。

出于同样的原因，我想着重介绍 [MystiQ][2] 是个好主意，这是一个相对较新的视频/音频转换器工具，适用于 Linux 和 Windows。截至目前，它还不支持 macOS，但可能会在不久的将来支持。

MystiQ 是基于 [Qt 5 界面][4]的 [FFmpeg][3] 图形前端。现在，你可以随时[在 Linux 命令行中安装并使用 ffmpeg][5]，但这不是很舒服，是吗？这就是为什么 [Handbrake][6] 和 MystiQ 之类的工具可以使我们的生活更方便的原因。

由于 MystiQ 基于 FFmpeg，因此你可以将其用于一些基本的视频编辑，例如修剪、旋转等。

让我们来看看它的功能。

### MystiQ 视频转换器的功能

![][7]

即使 MystiQ 目前还算是一个新事物，但它也包含了一组很好的基本功能。以下它提供的：

  * 视频转换
  * 音频转换（也可从视频中提取音频）
  * 支持的格式：MP4、WEBM、MKV、MP3、MOV、OGG、WAV、ASF、FLV、3GP、M4A 等。
  * 跨平台（Windows 和 Linux）
  * 适用于 32 位和 64 位系统的安装包
  * 能够调整音频质量（采样率、比特率等）进行转换
  * 基本的视频编辑功能（剪辑视频、插入字幕、旋转视频、缩放视频等）
  * 将彩色视频转换为黑白
  * 有几个预设方案，可轻松转换视频以获得最佳质量或获得最佳压缩效果。

### 安装 MystiQ

你可能没有在软件中心中找到它，但将它安装在 Linux 发行版上非常容易。

它提供了 .AppImage 文件和 .deb / .rpm 文件（32 位和 64 位软件包）。如果你不清楚如何使用的话，可以阅读[如何使用 AppImage 文件][10]。

如果你想帮助他们测试软件进行改进，你还可以找到他们的 [GitHub 页面][11]，并查看源码或任何近期的预发布软件包。

你可以在其官方网站下载适用于 Linux 和 Windows 的安装程序文件。

- [下载 MystiQ][2]

### 总结

在本文中，我使用 [Pop!_OS][12] 20.04 测试了 MytiQ 转换器，并且在转换视频和音频时没遇到任何问题。而且，对于像我这样的普通用户来说，它的转换速度足够快。

欢迎尝试一下，让我知道你对它的想法！另外，如果你在 Linux 上一直使用其他工具转换视频和音频，那它是什么？

--------------------------------------------------------------------------------

via: https://itsfoss.com/mystiq/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/mystiq-converter-ft.jpg?ssl=1
[2]: https://mystiqapp.com/
[3]: https://www.ffmpeg.org/
[4]: https://www.qt.io/
[5]: https://itsfoss.com/ffmpeg/
[6]: https://itsfoss.com/handbrake/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/mystiq-options.jpg?ssl=1
[9]: https://itsfoss.com/sound-converter-linux/
[10]: https://itsfoss.com/use-appimage-linux/
[11]: https://github.com/swl-x/MystiQ/
[12]: https://system76.com/pop
