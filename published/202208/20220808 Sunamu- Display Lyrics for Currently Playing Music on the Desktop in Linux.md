[#]: subject: "Sunamu: Display Lyrics for Currently Playing Music on the Desktop in Linux"
[#]: via: "https://itsfoss.com/sunamu-music-widget/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14939-1.html"

Sunamu：在 Linux 桌面上显示当前播放音乐的歌词
======

![](https://img.linux.net.cn/data/attachment/album/202208/17/153701c3blbrgglfx7cfbr.jpg)

作为一个吸睛的**音乐小部件**（或控制器） —— 这是 Sunamu 唯一专注的事情，它工作得很好。

Sunamu 是一个有趣的工具。它不是音乐播放器，但可让你显示正在播放的音乐并对其进行控制。

我不喜欢在我的主要工作区使用浮动小部件，但 Sunamu 简约而优雅的方法改变了我的想法！

因此，我将向你介绍它的功能、安装、配置调整以及我的使用经验。

### Sunamu：开源音乐控制器

![playing music with sunamu][1]

正如你在上面的截图中所注意到的，它看起来是一种显示正在播放的音乐的非常好的方式，带有歌词，同时具有基本的控件。

你可以播放/暂停、转到下一首/上一首曲目、随机播放和启用循环。

Sunamu 支持多种音频平台，包括 Spotify。它还可以检测本地收藏中的音乐，支持一些可用于 Linux 的 [最佳音乐播放器][2]。

此外，它还支持 Windows。因此，如果你通过 Windows 上的 Edge 浏览器流式传输某些内容，它应该可以正常工作。

你可以查看其 GitHub 页面上的 [兼容性列表][3] 以了解有关支持的播放器和浏览器的更多信息。

幸运的是，你不必受限于它默认提供的功能。它提供了一种调整配置文件的简单方法（在其 [GitHub 页面][4] 上可以了解更多信息）。这使得新手可以调整一些设置并获得乐趣。

我将在本文的后面部分提到一些关于它的技巧。

### Sunamu 的特点

![Sunamu on empty workspace][5]

Sunamu 具有一些不错的特性，其中一些是：

* 检测并显示当前正在播放的歌曲。
* 从专辑封面中获取配色方案，并使用相同的调色板以获得更好的视觉效果。
* 可通过配置文件进行定制。
* 与 Discord 完美集成。
* 消耗最少的系统资源。

### 在 Linux 上安装 Sunamu

![Disable lyrics in sunamu][6]

它提供 AppImage、deb 和 rpm 包，以便在各种 Linux 发行版中轻松安装。我使用 AppImage 进行测试，并且非常好用。

如果你是 Linux 新手，你还可以从我们关于 [如何使用 AppImage][7] 或 [安装 deb 包][8]、[rpm 包][9] 的指南中得到帮助。

有趣的是，Sunamu 是少数为基于 ARM 的机器提供直接支持的开源音乐工具之一。

访问他们的 [GitHub 发布页面][10]下载包或从源代码构建它。

**让我通过终端向你展示基于 Debian 的发行版的快速安装方法**。只需按照给定的说明进行操作，你就可以开始使用了：

首先，让我们使用 `wget` 命令下载 .deb 包，如下所示：

```
wget https://github.com/NyaomiDEV/Sunamu/releases/download/v2.0.0/sunamu_2.0.0_amd64.deb
```

下载完包后，使用给定的命令进行安装：

```
sudo dpkg -i sunamu_2.0.0_amd64.deb
```

![install sunamu in ubuntu][11]

### 技巧：调整配置文件

默认情况下，Sunamu 不会从专辑封面中获取颜色，而是显示每首歌曲的歌词。和许多其他人一样，我喜欢不看歌词。

Sunamu 的配置文件通常位于 `~/.config/sunamu/config.json5`。

要打开 Sunamu 配置文件，请输入给定的命令：

```
nano ~/.config/sunamu/config.json5
```

如下所示在 `electron` 部分进行更改（启用颜色并禁用歌词）：

```
electron: {
      type: 'electron',
      widgetMode: true,
      colors: true,
      font: '',
      theme: 'default',
      showLyrics: false,
    }
```

这是最终配置文件的样子：

![modify config file of sunamu][12]

### 总结

除非你是避免使用基于 Electron 应用的人，否则 Sunamu 是一款足以增强你在 Linux 上的音乐体验的应用。继 [Amberol][13] 之后，这是我最近喜欢的第二款音乐相关应用。

如果你尝试过，请不要忘记在评论部分分享你的经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/sunamu-music-widget/

作者：[Sagar Sharma][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/08/playing-music-with-sunamu.png
[2]: https://itsfoss.com/best-music-players-linux/
[3]: https://github.com/NyaomiDEV/Sunamu/blob/master/COMPATIBILITY.md
[4]: https://github.com/NyaomiDEV/Sunamu/blob/master/assets/config.json5
[5]: https://itsfoss.com/wp-content/uploads/2022/08/song-with-no-lyrics-min.png
[6]: https://itsfoss.com/wp-content/uploads/2022/08/playing-music-with-sunamu-inclusing-lyrics-min1.png
[7]: https://itsfoss.com/use-appimage-linux/
[8]: https://itsfoss.com/install-deb-files-ubuntu/
[9]: https://itsfoss.com/install-rpm-files-fedora/
[10]: https://github.com/NyaomiDEV/Sunamu/releases/tag/v2.0.0
[11]: https://itsfoss.com/wp-content/uploads/2022/08/install-sunamu-in-ubuntu.png
[12]: https://itsfoss.com/wp-content/uploads/2022/08/modified-config-file-of-sunamu.png
[13]: https://itsfoss.com/amberol-music-player/
