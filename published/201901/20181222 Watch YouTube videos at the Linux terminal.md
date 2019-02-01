[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10412-1.html)
[#]: subject: (Watch YouTube videos at the Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-youtube-dl)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

在 Linux 终端上观看 YouTube 视频
======

> 视频只能在 GUI 下看么？再想想。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-youtube-dl.png?itok=HYR5vU2a)

我们即将结束为期 24 天的 Linux 命令行玩具日历。希望你一直在看，如果没有，请回到[这里][1]开始，自己试试。你会发现 Linux 终端有很多游戏，消遣和奇怪的东西。

虽然你之前可能已经看过我们日历中的一些玩具，但我们希望对每个人至少有一个新事物。

今天我们要在昨天的玩具 [MPlayer][2] 上再加上一个 [youtube-dl][3]。

正如其名称所暗示的那样，`youtube-dl` 是一个用于下载 YouTube 视频的命令行程序，但它也可以从其他许多站点下载视频，而且它是一个有着[丰富文档][4]的功能齐全的程序，从而使视频获取变得容易。注意：请勿在任何违反你所在司法辖区的版权法的情况下使用 `youtube-dl`。

`youtube-dl` 使用的是 [Unlicense][5] 这个公共领域许可，类似于 Creative Common 的 [CC0][6]。这里还有哪些公共领域贡献适用于开源领域的[法律意见][7]，但它通常被认为与现有的开源许可证兼容，即使是不推荐使用它的组织也是如此。

最简单地，我们将使用 `youtube-dl` 来获取视频以便在终端中播放。首先，使用适用于你发行版的方法[安装][8]它。对我来说，在 Fedora 中，它被打包在我的仓库中，因此安装非常简单：

```
$ sudo dnf install youtube-dl
```

然后，获取一个视频。YouTube 允许你按照许可证进行搜索，所以今天我们将根据知识共享署名许可证查看来自 [Gemmy's Videos][10] 中的壁炉[视频][9]。对于 YouTube 视频，你可以像这样用文件 ID 下载，我们也可以指定输出文件名。我故意选择了一个短片，因为长视频会变得很大！

```
$ youtube-dl pec8P5K4s8c -o fireplace.mp4
```

如果你昨天没有安装 [MPlayer][2]，请继续安装好，如果你之前没有安装 libcaca 则需要安装它。如果你直接用 MPlayer 在命令行中播放视频 ( `$ mplayer fireplace.webm` )，它能够播放，但是会在一个自己的窗口中，这不是我们想要的。

首先，我设置将 libcaca 强制使用 ncurses 作为显示驱动，使输出保持在我的终端：

```
$ export CACA_DRIVER=ncurses
```

然后，我放大了终端（“像素”越多越好），并使用以下命令播放文件（强制使用 libcaca 并静默 MPlayer 的文本输出）：

```
$ mplayer -really-quiet -vo caca fireplace.mp4
```

这就完成了！

![](https://opensource.com/sites/default/files/uploads/linux-toy-youtube-dl.gif)

你有特别喜欢的命令行小玩具需要我介绍的吗？提交今年的建议有点晚了，但我们仍然希望在新的一年里有一些很酷的命令行玩具。请在下面的评论中告诉我，我会查看的。让我知道你对今天的玩具有何看法。

一定要看看昨天的玩具，[在 Linux 终端收听广播][2]，明天还要再来！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-youtube-dl

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/12/linux-toy-boxes
[2]: https://linux.cn/article-10393-1.html
[3]: https://rg3.github.io/youtube-dl/
[4]: https://github.com/rg3/youtube-dl/blob/master/README.md#readme
[5]: https://unlicense.org/
[6]: https://creativecommons.org/share-your-work/public-domain/cc0/
[7]: https://opensource.org/faq#public-domain
[8]: https://github.com/rg3/youtube-dl/blob/master/README.md#installation
[9]: https://www.youtube.com/watch?v=pec8P5K4s8c
[10]: https://www.youtube.com/channel/UCwwaepmpWZVDd605MIRC20A
