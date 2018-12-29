[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10393-1.html)
[#]: subject: (Listen to the radio at the Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-mplayer)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

在 Linux 终端收听广播
======

> MPlayer 是一个多功能的开源媒体播放器，它在 Linux 命令行中非常有用。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-mplayer.png?itok=6iTm3Xi7)

你已经看到我们为期 24 天的 Linux 命令行玩具日历。如果这是你第一次访问该系列，你可能会问自己什么是命令行玩具。它可能是一个游戏或任何简单的消遣，可以帮助你在终端玩得开心。

你们中的一些人之前已经看过我们日历中的各种玩具，但我们希望每个人至少见到一件新玩具。

在命令行中有很多方法可以听音乐。如果你有本地存储的媒体，`cmus` 是一个很好的选择，但还有[很多其他选择][1]。

不过，很多时候，当我在终端的时候，我会走神并且不会注意挑选每首歌，并让其他的来做。虽然为了这个我有很多播放列表，但过了一段时间，即使过时，我也会切换到互联网电台。

今天的玩具，MPlayer，是一个多功能的多媒体播放器，几乎可以支持任何你给它的媒体格式。如果尚未安装 MPlayer，你可能会发现它已在你的发行版中打包。在 Fedora 中，我在 [RPM Fusion][2] 中找到了它（请注意，这不是 Fedora 的“官方”仓库，因此请谨慎操作）：

```
$ sudo dnf install mplayer
```

MPlayer 有一系列命令行选项可根据你的具体情况进行设置。我想听 Raleigh 当地的大学广播电台（[88.1 WKN][3]，这个很棒！），在它们的网站得到流媒体网址之后，像这样就可以让收音机运行了，不需要 GUI 或 Web 播放器：

```
$ mplayer -nocache -afm ffmpeg http://wknc.sma.ncsu.edu:8000/wknchd1.mp3
```

MPlayer 是 GPLv3 许可证下的开源软件，你可以从项目的[网站][4]中找到更多关于项目的信息并下载源代码。

正如我在昨天的文章中提到的，我试图使用每个玩具的截图作为每篇文章的主图，但是当进入音频世界时，我不得不稍微改改。所以今天的图像是由 **libcaca** 包中的 **img2txt** 绘制的来自公共域的无线电塔图标。

你有特别喜欢的命令行小玩具需要我介绍的吗？我们的日历基本上是为这个系列剩余的玩具设置的，但我们仍然很想在新的一年里推出一些很酷的命令行玩具。评论告诉我，我会查看的。如果还有空位置，我会考虑介绍它的。并让我知道你对今天的玩具有何看法。

一定要看看昨天的玩具，[让你的 Linux 终端说出来][5]，明天记得回来！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-mplayer

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/life/16/8/3-command-line-music-players-linux
[2]: https://rpmfusion.org/
[3]: https://wknc.org/index.php
[4]: http://www.mplayerhq.hu/
[5]: https://opensource.com/article/18/12/linux-toy-espeak
