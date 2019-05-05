[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (SMPlayer in Linux: Features, Download and Installation)
[#]: via: (https://itsfoss.com/smplayer/)
[#]: author: (Aquil Roshan;Abhishek Prakash https://itsfoss.com/author/aquil/)
[#]: url: (https://linux.cn/article-10365-1.html)

SMPlayer：增强版的媒体播放器
======

当你要播放视频时，你会在[全新安装的 Ubuntu][1]，或其他许多发行版中，会注意到一个消息：

![][2]

*默认媒体播放器没有适合的编解码器*

这意味着系统上没有安装播放媒体的[所需编解码器][3]。现在，由于某些版权问题，某些基于 Linux 的操作系统无法在安装介质中预先打包编解码器。但是它们能让你只需点击即可下载和安装编解码器，或者你可以安装拥有所有媒体编解码器的媒体播放器。让我们了解一下 [SMPlayer][4]。

### 认识 SMPlayer：适用于 Linux 的更好的媒体播放器

SMPlayer 是一款自由开源媒体播放器，它基于强大的 [MPlayer][5] 媒体引擎。SMPlayer 能够播放 avi、mp4、mkv、mpeg、mov、divx、h.264 以及其他任何主要媒体格式。锦上添花的是，它也可以播放 [YouTube][6] 视频，并且无广告。

![SMPlayer default interface][7]

SMPlayer 是一个完整的媒体解决方案。它是跨平台的，因此可在所有操作系统上使用。如果你是双启动系统，则可以将其安装在 Windows 和 Linux 操作系统上，以便在两个系统上获得统一的体验。它还支持带触摸的可变形笔记本。

你也可以在 SMPlayer 上播放 YouTube。我知道每次复制粘贴视频 URL 并在外部播放器上播放是不切实际的。但是当你观看相对较长的视频时，SMPlayer 特别有用。SMPlayer 以相当好的质量播放 YouTube 视频，我觉得比在浏览器中播放得更好。通过在 SMPlayer 上播放较长的视频，你可以远离视频中间弹出的插播广告。

如果你在观看没有字幕的电影，你可以直接通过 SMPlayer 下载字幕。它集成了 [opensubtitles.org][8]。所以，打开浏览器，搜索字幕，下载相应的字幕，解压缩，将它们放在视频文件夹中并将字幕连接到电影，这些都不需要！SMPlayer 会为你服务。

![Automatic subtitle download in SMPlayer][9]

SMPlayer 支持 30 多种语言，并可高度自定义。它还有应用主题和大量的图标集。

如果你觉得 SMPlayer 的默认界面看起来不太好，只需点击几下，它就可以看起来像这样：

![SMPlayer skin change][10]

SMPlayer 为高级用户提供了许多工具和功能。它有均衡器、视频速度控制、宽高比和缩放控制、视频过滤器、屏幕截图等等。

总而言之，我真的很喜欢 SMPlayer。它在一个小巧轻量级的安装包中提供了很多功能。我认为它是 Linux PC 上必备的视频播放器。除了轻松播放所有媒体格式外，它还提供了大量的控制。

### 在 Linux 上安装 SMPlayer

SMPlayer 应该可在所有主要 Linux 发行版的软件中心获取。你可以搜索它并从那里安装它。

在 Ubuntu/ Linux Mint/ Elementary OS 上，你还可以通过在终端中运行以下命令来安装 SMPlayer

```
sudo apt install smplayer
```

或者，你可以在[这里][11]下载 Fedora、Arch Linux、OpenSUSE 和 Debian 的软件包。

### 总结

有很多像 VLC 媒体播放器那样成熟的播放器。SMPlayer 是拥有完整功能和插件优势的最佳产品之一。我认为它是[必备 Linux 应用][12]之一。

请尝试一下并在下面的评论栏与我们分享你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/smplayer/

作者：[Aquil Roshan;Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/aquil/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/things-to-do-after-installing-ubuntu-18-04/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/SMPlayer-warning.jpg?fit=800%2C450&ssl=1
[3]: https://packages.ubuntu.com/trusty/ubuntu-restricted-extras
[4]: https://www.smplayer.info/
[5]: http://www.mplayerhq.hu/design7/news.html
[6]: https://www.youtube.com/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/SMPlayer-coco.jpg?fit=800%2C450&ssl=1
[8]: https://www.opensubtitles.org/en/search
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/SMPlayer-icon-packs.jpg?fit=800%2C450&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/11/SMPlayer-theme.jpg?fit=800%2C450&ssl=1
[11]: https://software.opensuse.org/download.html?project=home%3Asmplayerdev&package=smplayer
[12]: https://itsfoss.com/essential-linux-applications/
