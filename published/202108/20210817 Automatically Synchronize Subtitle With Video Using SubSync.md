[#]: subject: "Automatically Synchronize Subtitle With Video Using SubSync"
[#]: via: "https://itsfoss.com/subsync/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "turbokernel"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13722-1.html"

使用 SubSync 自动同步视频字幕
======

![](https://img.linux.net.cn/data/attachment/album/202108/27/100003ts3j0odw05j0ooy3.jpg)

让我分享一个场景：当你想要观看一部电影或视频，而又需要字幕时，在你下载字幕后，却发现字幕没有正确同步，也没有其他更好的字幕可用。现在该怎么做？

你可以 [在 VLC 中按 G 或 H 键来同步字幕][1]。它可以为字幕增加延迟。如果字幕在整个视频中的时间延迟相同，这可能会起作用。但如果不是这种情况，就需要 SubSync 出场了。

### SubSync: 字幕语音同步器

[SubSync][2] 是一款实用的开源工具，可用于 Linux、macOS 和 Windows。

它通过监听音轨来同步字幕，这就是它的神奇之处。即使音轨和字幕使用的是不同的语言，它也能发挥作用。如果有必要，它也支持翻译，但我没有测试过这个功能。

我播放一个视频不同步的字幕进行了一个简单的测试。令我惊讶的是，它工作得很顺利，我得到了完美的同步字幕。

使用 SubSync 很简单。启动这个应用，它会让你添加字幕文件和视频文件。

![SubSync 用户界面][3]

你需要在界面上选择字幕和视频的语言。它可能会根据选择的语言下载额外的资源。

![SubSync 可下载附加语言支持包][4]

请记住，同步字幕需要一些时间，这取决于视频和字幕的长度。在等待过程完成时，你可以喝杯茶/咖啡或啤酒。

你可以看到正在进行同步的状态，甚至可以在完成之前保存它。

![SubSync 同步中][5]

同步完成后，你就可以点击保存按钮，把修改的内容保存到原文件中，或者把它保存为新的字幕文件。

![同步完成][6]

我不能保证所有情况下都能正常工作，但在我运行的样本测试中它是正常的。

### 安装 SubSync

SubSync 是一个跨平台的应用，你可以从它的 [下载页面][7] 获得 Windows 和 MacOS 的安装文件。

对于 Linux 用户，SubSync 是作为一个 Snap 包提供的。如果你的发行版已经提供了 Snap 支持，使用下面的命令来安装 SubSync：

```
sudo snap install subsync
```

请记住，下载 SubSync Snap 包将需要一些时间。所以要有一个稳定的网络连接或足够的耐心。

### 最后

就我个人而言，我很依赖字幕。即使我在 Netflix 上看英文电影，我也会把字幕打开。它有助于我清楚地理解每段对话，特别是在有强烈口音的情况下。如果没有字幕，我永远无法理解 [电影 Snatch 中 Mickey O'Neil（由 Brad Pitt 扮演）的一句话][8]。

使用 SubSync 比 [Subtitle Editor][9] 同步字幕要容易得多。对于像我这样在整个互联网上搜索不同国家的冷门或推荐（神秘）电影的人来说，除了 [企鹅字幕播放器][10]，这是另一个很棒的工具。

如果你是一个“字幕用户”，你会喜欢这个工具。如果你使用过它，请在评论区分享你的使用经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/subsync/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/how-to-synchronize-subtitles-with-movie-quick-tip/
[2]: https://subsync.online/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/subsync-interface.png?resize=593%2C280&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/subsync-subtitle-synchronize.png?resize=522%2C189&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/subsync-subtitle-synchronize-1.png?resize=424%2C278&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/subsync-subtitle-synchronize-2.png?resize=424%2C207&ssl=1
[7]: https://subsync.online/en/download.html
[8]: https://www.youtube.com/watch?v=tGDO-9hfaiI
[9]: https://itsfoss.com/subtitld/
[10]: https://itsfoss.com/penguin-subtitle-player/
