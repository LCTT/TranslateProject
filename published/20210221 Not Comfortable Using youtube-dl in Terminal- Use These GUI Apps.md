[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13158-1.html)
[#]: subject: (Not Comfortable Using youtube-dl in Terminal? Use These GUI Apps)
[#]: via: (https://itsfoss.com/youtube-dl-gui-apps/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

不习惯在终端使用 youtube-dl？可以使用这些 GUI 应用
======

![](https://img.linux.net.cn/data/attachment/album/202102/27/143909m29a8m8kgkzmmskc.jpg)

如果你一直在关注我们，可能已经知道 [youtube-dl 项目曾被 GitHub 暂时下架][1] 以合规。但它现在已经恢复并完全可以访问，可以说它并不是一个非法的工具。

它是一个非常有用的命令行工具，可以让你 [从 YouTube][2] 和其他一些网站下载视频。使用 [youtube-dl][3] 并不复杂，但我明白使用命令来完成这种任务并不是每个人都喜欢的方式。

好在有一些应用为 `youtube-dl` 工具提供了 GUI 前端。

### 使用 youtube-dl GUI 应用的先决条件

在你尝试下面提到的一些选择之前，你可能需要在你的系统上安装 `youtube-dl` 和 [FFmpeg][4]，才能够下载/选择不同的格式进行下载。

你可以按照我们的 [ffmpeg 使用完整指南][5] 进行设置，并探索更多关于它的内容。

要安装 [youtube-dl][6]，你可以在 Linux 终端输入以下命令：

```
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
```

下载最新版本后，你只需要输入以下内容使其可执行就可使用：

```
sudo chmod a+rx /usr/local/bin/youtube-dl
```

如果你需要其他方法安装它，也可以按照[官方安装说明][7]进行安装。

### Youtube-dl GUI 应用

大多数 Linux 上的下载管理器也允许你从 YouTube 和其他网站下载视频。然而，youtube-dl GUI 应用可能有额外的选项，如只提取音频或下载特定分辨率和视频格式。

请注意，下面的列表没有特别的排名顺序。你可以根据你的要求选择。

#### 1、AllTube Download

![][8]

**主要特点：**

  * Web GUI
  * 开源
  * 可以自托管

AllTube 是一个开源的 web GUI，你可以通过 <https://alltubedownload.net/> 来访问。

如果你选择使用这款软件，你不需要在系统上安装 youtube-dl 或 ffmpeg。它提供了一个简单的用户界面，你只需要粘贴视频的 URL，然后继续选择你喜欢的文件格式下载。你也可以选择将其部署在你的服务器上。

请注意，你不能使用这个工具提取视频的 MP3 文件，它只适用于视频。你可以通过他们的 [GitHub 页面][9]探索更多关于它的信息。

- [AllTube Download Web GUI][10]

#### 2、youtube-dl GUI

![][11]

**主要特点：**

  * 跨平台
  * 显示预计下载大小
  * 有音频和视频下载选择

一个使用 electron 和 node.js 制作的有用的跨平台 GUI 应用。你可以很容易地下载音频和视频，以及选择各种可用的文件格式的选项。

如果你愿意的话，你还可以下载一个频道或播放列表的部分内容。特别是当你下载高质量的视频文件时，预计的下载大小绝对是非常方便的。

如上所述，它也适用于 Windows 和 MacOS。而且，你会在它的 [GitHub 发布][12]中得到一个适用于 Linux 的 AppImage 文件。

- [Youtube-dl GUI][13]

#### 3、Videomass

![][14]

**主要特点：**

  * 跨平台
  * 转换音频/视频格式
  * 支持多个 URL
  * 适用于也想使用 FFmpeg 的用户

如果你想从 YouTube 下载视频或音频，并将它们转换为你喜欢的格式，Videomass 可以是一个不错的选择。

要做到这点，你需要在你的系统上同时安装 youtube-dl 和 ffmpeg。你可以轻松的添加多个 URL 来下载，还可以根据自己的喜好设置输出目录。

![][15]

你还可以获得一些高级设置来禁用 youtube-dl，改变文件首选项，以及随着你的探索，还有一些更方便的选项。

它为 Ubuntu 用户提供了一个 PPA，为任何其他 Linux 发行版提供了一个 AppImage 文件。在它的 [Github 页面][16]探索更多信息。

- [Videomass][17]

#### 附送：Haruna Video Player

![][18]

**主要特点：**

  * 播放/流式传输 YouTube 视频

Haruna Video Player 原本是 [MPV][19] 的前端。虽然使用它不能下载 YouTube 视频，但可以通过 youtube-dl 观看/流式传输 YouTube 视频。

你可以在我们的[文章][20]中探索更多关于视频播放器的内容。

### 总结

尽管你可能会在 GitHub 和其他平台上找到更多的 youtube-dl GUI，但它们中的大多数都不能很好地运行，最终会显示出多个错误，或者不再积极开发。

[Tartube][21] 就是这样的一个选择，你可以尝试一下，但可能无法达到预期的效果。我用 Pop!_OS 和 Ubuntu MATE 20.04（全新安装）进行了测试。每次我尝试下载一些东西时，无论我怎么做都会失败（即使系统中安装了 youtube-dl 和 ffmpeg）。

所以，我个人最喜欢的似乎是 Web GUI（[AllTube Download][9]），它不依赖于安装在你系统上的任何东西，也可以自托管。

如果我错过了你最喜欢的选择，请在评论中告诉我什么是最适合你的。

--------------------------------------------------------------------------------

via: https://itsfoss.com/youtube-dl-gui-apps/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/youtube-dl-github-takedown/
[2]: https://itsfoss.com/download-youtube-videos-ubuntu/
[3]: https://itsfoss.com/download-youtube-linux/
[4]: https://ffmpeg.org/
[5]: https://itsfoss.com/ffmpeg/#install
[6]: https://youtube-dl.org/
[7]: https://ytdl-org.github.io/youtube-dl/download.html
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/alltube-download.jpg?resize=772%2C593&ssl=1
[9]: https://github.com/Rudloff/alltube
[10]: https://alltubedownload.net/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/youtube-dl-gui.jpg?resize=800%2C548&ssl=1
[12]: https://github.com/jely2002/youtube-dl-gui/releases/tag/v1.8.7
[13]: https://github.com/jely2002/youtube-dl-gui
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/videomass.jpg?resize=800%2C537&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/videomass-1.jpg?resize=800%2C542&ssl=1
[16]: https://github.com/jeanslack/Videomass
[17]: https://jeanslack.github.io/Videomass/
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/haruna-video-player-dark.jpg?resize=800%2C512&ssl=1
[19]: https://mpv.io/
[20]: https://itsfoss.com/haruna-video-player/
[21]: https://github.com/axcore/tartube
