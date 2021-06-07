MPV 播放器：Linux 下的极简视频播放器
======

> MPV 是一个开源的，跨平台视频播放器，带有极简的 GUI 界面以及丰富的命令行控制。

VLC 可能是 Linux 或者其他平台下最好的视频播放器。我已经使用 VLC 很多年了，它现在仍是我最喜欢的播放器。

不过最近，我倾向于使用简洁界面的极简应用。这也是我偶然发现 MPV 的原因。我太喜欢这个软件，并把它加入了 [Ubuntu 最佳应用][1]列表里。

[MPV][2] 是一个开源的视频播放器，有 Linux、Windows、MacOS、BSD 以及 Android 等平台下的版本。它实际上是从 [MPlayer][3] 分支出来的。

它的图形界面只有必须的元素而且非常整洁。

![MPV 播放器在 Linux 下的界面][4]

*MPV 播放器*

### MPV 的功能

MPV 有标准播放器该有的所有功能。你可以播放各种视频，以及通过常用快捷键来控制播放。

  * 极简图形界面以及必须的控件。
  * 自带视频解码器。
  * 高质量视频输出以及支持 GPU 硬件视频解码。
  * 支持字幕。
  * 可以通过命令行播放 YouTube 等流媒体视频。
  * 命令行模式的 MPV 可以嵌入到网页或其他应用中。

尽管 MPV 播放器只有极简的界面以及有限的选项，但请不要怀疑它的功能。它主要的能力都来自命令行版本。

只需要输入命令 `mpv --list-options`，然后你会看到它所提供的 447 个不同的选项。但是本文不会介绍 MPV 的高级应用。让我们看看作为一个普通的桌面视频播放器，它能有多么优秀。

### 在 Linux 上安装 MPV

MPV 是一个常用应用，加入了大多数 Linux 发行版默认仓库里。在软件中心里搜索一下就可以了。

我可以确认在 Ubuntu 的软件中心里能找到。你可以在里面选择安装，或者通过下面的命令安装：

```
sudo apt install mpv
```

你可以在 [MPV 网站][5]上查看其他平台的安装指引。

### 使用 MPV 视频播放器

在安装完成以后，你可以通过鼠标右键点击视频文件，然后在列表里选择 MPV 来播放。

![MPV 播放器界面][6]

*MPV 播放器界面*

整个界面只有一个控制面板，只有在鼠标移动到播放窗口上才会显示出来。控制面板上有播放/暂停，选择视频轨道，切换音轨，字幕以及全屏等选项。

MPV 的默认大小取决于你所播放视频的画质。比如一个 240p 的视频，播放窗口会比较小，而在全高清显示器上播放 1080p 视频时，会几乎占满整个屏幕。不管视频大小，你总是可以在播放窗口上双击鼠标切换成全屏。

#### 字幕

如果你的视频带有字幕，MPV 会[自动加载字幕][7]，你也可以选择关闭。不过，如果你想使用其他外挂字幕文件，不能直接在播放器界面上操作。

你可以将额外的字幕文件名改成和视频文件一样，并且将它们放在同一个目录下。MPV 会加载你的字幕文件。

更简单的播放外挂字幕的方式是，用鼠标选中文件拖到播放窗口里放开。

#### 播放 YouTube 或其他在线视频

要播放在线视频，你只能使用命令行模式的 MPV。

打开终端窗口，然后用类似下面的方式来播放：

```
mpv <URL_of_Video>
```

![在 Linux 桌面上使用 MPV 播放 YouTube 视频][8]

*在 Linux 桌面上使用 MPV 播放 YouTube 视频*

用 MPV 播放 YouTube 视频的体验不怎么好。它总是在缓冲缓冲，有点烦。

### 是否安装 MPV 播放器？

这个看你自己。如果你想体验各种应用，大可以试试 MPV。否则，默认的视频播放器或者 VLC 就足够了。

我在早些时候写关于 [Sayonara][9] 的文章时，并不确定大家会不会喜欢一个相对不常用的音乐播放器，但是 FOSS 的读者觉得很好。

试一下 MPV，然后看看你会不会将它作为你的默认视频播放器。

如果你喜欢 MPV，但又觉得它的图形界面需要更多功能，我推荐你使用 [GNOME MPV 播放器][10]。

你用过 MPV 视频播放器吗？体验怎么样？喜欢还是不喜欢？欢迎在下面的评论区留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/mpv-video-player/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:https://itsfoss.com/best-ubuntu-apps/
[2]:https://mpv.io/
[3]:http://www.mplayerhq.hu/design7/news.html
[4]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/mpv-player.jpg
[5]:https://mpv.io/installation/
[6]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/mpv-player-interface.png
[7]:https://itsfoss.com/how-to-play-movie-with-subtitles-on-samsung-tv-via-usb/
[8]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/play-youtube-videos-on-mpv-player.jpeg
[9]:https://itsfoss.com/sayonara-music-player/
[10]:https://gnome-mpv.github.io/
