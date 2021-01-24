[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13050-1.html)
[#]: subject: (Haruna Video Player: An Open-Source Qt-based MPV GUI Front-end for Linux)
[#]: via: (https://itsfoss.com/haruna-video-player/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Haruna 视频播放器：一个 MPV GUI 前端
======

> 一个基于 Qt 的 Linux 视频播放器，它可作为 mpv 的前端，并能使用 youtube-dl。

### Haruna 视频播放器：一个基于 Qt 的免费视频播放器

![Haruna Video Player][1]

如果你还不知道 [mpv][2]，它是一个基于命令行的自由开源的媒体播放器。好吧，它有一个[简约的 MPV GUI][3]，但核心是命令行。

你可能还会找到几个[开源视频播放器][4]，它们基本上就是 mpv 的 GUI 前端。

Haruna 视频播放器就是其中之一，同时还可以[使用 youtube-dl][5]。你可以轻松播放本地媒体文件以及 YouTube 内容。

让我给你介绍一下这个播放器提供的功能。

### Haruna 视频播放器的功能

![][6]

你可能会发现它与其他一些视频播放器有些不同。以下是你可以从 Haruna 视频播放器 获得的：

  * 能够直接使用 URL 播放 YouTube 视频
  * 支持播放列表，并且你可以轻松控制它们
  * 能够根据字幕中的某些词语自动跳过
  * 控制播放速度
  * 使用 [youtube-dl][7] 改变播放格式（音频/视频）
  * 大量的键盘快捷键
  * 轻松地从视频中截屏
  * 添加主要和次要字幕的选项
  * 改变截图的文件格式
  * 支持硬件解码
  * 色彩调整以提高你的观看质量。
  * 能够调整鼠标和键盘的快捷键，以便能够快速浏览和做你想做的事情
  * 调整 UI（字体、主题）

### 在 Linux 上安装 Haruna 视频播放器

![][8]

不幸的是（或者不是，取决于你的偏好），你只能[使用 Flatpak][9] 安装它。你可以使用 [Flatpak 包][10]在任何 Linux 发行版上安装它。

如果你使用的是基于 Arch 的系统，你也可以在 [AUR][11] 中找到它。

但是，如果你不喜欢这样，你可以查看 [GitHub][12] 上的源代码，看看你是否可以像普通的 Gentoo 用户一样自己构建它。

- [Haruna 视频播放器][12]

### 总结

Haruna 视频播放器是一款简单实用的在 [libmpv][13] 之上的 GUI。能够在系统上播放 YouTube 视频以及各种文件格式绝对是很多用户所希望的。

用户界面很容易上手，它也提供了一些重要的自定义选项。

你尝试过这款视频播放器了吗？在下面的评论中让我知道你对它的看法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/haruna-video-player/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/haruna-video-player-dark.jpg?resize=800%2C512&ssl=1
[2]: https://mpv.io/
[3]: https://itsfoss.com/mpv-video-player/
[4]: https://itsfoss.com/video-players-linux/
[5]: https://itsfoss.com/download-youtube-linux/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/haruna-video-player-1.png?resize=800%2C503&ssl=1
[7]: https://github.com/ytdl-org/youtube-dl
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/haruna-player-garuda-linux.png?resize=800%2C506&ssl=1
[9]: https://itsfoss.com/flatpak-guide/
[10]: https://flathub.org/apps/details/com.georgefb.haruna
[11]: https://itsfoss.com/aur-arch-linux/
[12]: https://github.com/g-fb/haruna
[13]: https://github.com/mpv-player/mpv/tree/master/libmpv
