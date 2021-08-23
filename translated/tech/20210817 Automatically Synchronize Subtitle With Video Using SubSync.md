[#]: subject: "Automatically Synchronize Subtitle With Video Using SubSync"
[#]: via: "https://itsfoss.com/subsync/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 SubSync 自动将字幕与视频同步化
======

让我分享一个场景。你正试图观看一部电影或视频，你需要字幕。你下载了字幕，却发现字幕没有正确同步。没有其他好的字幕可用。现在该怎么做？

你可以[在 VLC 中按 G 或 H 键来同步字幕][1]。它为字幕增加了一个延迟。如果字幕在整个视频中以相同的时间间隔不同步，这可能会起作用。但如果不是这种情况，SubSync 在这里会有很大帮助。

### SubSync: 字幕语音同步器

[SubSync][2] 是一个灵巧的开源工具，可用于 Linux、macOS 和 Windows。

它通过收听音轨来同步字幕，这就是它的神奇之处。即使音轨和字幕使用的是不同的语言，它也能发挥作用。如果有必要，它也可以被翻译，但我没有测试这个功能。

我做了一个简单的测试，使用一个与我正在播放的视频不同步的字幕。令我惊讶的是，它工作得很顺利，我得到了完美的同步字幕。

使用 SubSync 很简单。你启动应用，它要求你添加字幕文件和视频文件。

![User interface for SubSync][3]

你必须在界面上指定字幕和视频的语言。它可能会根据使用的语言下载额外的资源。

![SubSync may download additional packages for language support][4]

请记住，同步字幕需要一些时间，这取决于视频和字幕的长度。在等待过程完成时，你可以拿起你的茶/咖啡或啤酒。

你可以看到正在进行的同步状态，甚至可以在完成之前保存它。

![SubSync synchronization in progress][5]

同步完成后，你就可以点击保存按钮，把修改的内容保存到原文件中，或者把它保存为新的字幕文件。

![Synchronization completed][6]

我不能说它在所有情况下都能工作，但在我运行的样本测试中它是有效的。

### 安装 SubSync

SubSync 是一个跨平台的应用，你可以从它的[下载页面][7]获得 Windows 和 MacOS 的安装文件。

对于 Linux 用户，SubSync 是作为一个 Snap 包提供的。如果你的发行版已经启用了 Snap 支持，使用下面的命令来安装 SubSync：

```
sudo snap install subsync
```

请记住，下载 SubSync snap 包将需要一些时间。所以要有一个良好的网络连接或足够的耐心。

### 最后

就我个人而言，我对字幕很上瘾。即使我在 Netflix 上看英文电影，我也会把字幕打开。它有助于清楚地理解每段对话，特别是在有强烈口音的情况下。如果没有字幕，我永远无法理解[电影 Snatch 中 Mickey O'Neil（由 Brad Pitt 扮演）的一句话][8]。

使用 SubSync 比[使用 Subtitle Editor][9] 同步字幕要容易得多。在[企鹅字幕播放器][10]之后，对于像我这样在整个互联网上搜索不同国家的稀有或推荐（神秘）电影的人来说，这是另一个很棒的工具。

如果你是一个“字幕用户”，我感觉你会喜欢这个工具。如果你使用过它，请在评论区分享你的使用经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/subsync/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

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
