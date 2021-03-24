[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13148-1.html)
[#]: subject: (5 must-have Linux media players)
[#]: via: (https://opensource.com/article/21/2/linux-media-players)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 款值得拥有的 Linux 媒体播放器
======

> 无论是电影还是音乐，Linux 都能为你提供一些优秀的媒体播放器。

![](https://img.linux.net.cn/data/attachment/album/202102/24/101806k2g26zfcamiffhlb.jpg)

在 2021 年，人们有更多的理由喜欢 Linux。在这个系列中，我将分享 21 个使用 Linux 的不同理由。媒体播放是我最喜欢使用 Linux 的理由之一。

你可能更喜欢黑胶唱片和卡带，或者录像带和激光影碟，但你很有可能还是在数字设备上播放你喜欢的大部分媒体。电脑上的媒体有一种无法比拟的便利性，这主要是因为我们大多数人一天中的大部分时间都在电脑附近。许多现代电脑用户并没有过多考虑有哪些应用可以用来听音乐和看电影，因为大多数操作系统都默认提供了媒体播放器，或者因为他们订阅了流媒体服务，因此并没有把媒体文件放在自己身边。但如果你的口味超出了通常的热门音乐和节目列表，或者你以媒体工作为乐趣或利润，那么你就会有你想要播放的本地文件。你可能还对现有用户界面有意见。在 Linux 上，*选择*是一种权利，因此你可以选择无数种播放媒体的方式。

以下是我在 Linux 上必备的五个媒体播放器。

### 1、mpv

![mpv interface][2]

一个现代、干净、简约的媒体播放器。得益于它的 Mplayer、[ffmpeg][3] 和 `libmpv` 后端，它可以播放你可能会扔给它的任何类型媒体。我说“扔给它”，是因为播放一个文件的最快捷、最简单的方法就是把文件拖到 mpv 窗口中。如果你拖动多个文件，mpv 会为你创建一个播放列表。

当你把鼠标放在上面时，它提供了直观的覆盖控件，但最好还是通过键盘操作界面。例如，`Alt+1` 会使 mpv 窗口变成全尺寸，而 `Alt+0` 会使其缩小到一半大小。你可以使用 `,` 和 `.` 键逐帧浏览视频，`[` 和 `]` 键调整播放速度，`/` 和 `*` 调整音量，`m` 静音等等。这些主控功能可以让你快速调整，一旦你学会了这些功能，你几乎可以在想到要调整播放的时候快速调整。无论是工作还是娱乐，mpv 都是我播放媒体的首选。

### 2、Kaffeine 和 Rhythmbox

![Kaffeine interface][4]

KDE Plasma 和 GNOME 桌面都提供了音乐应用（[Kaffeine][5] 和 [Rhythmbox][]），可以作为你个人音乐库的前端。它们会让你为你的音乐文件提供一个标准的位置，然后扫描你的音乐收藏，这样你就可以根据专辑、艺术家等来浏览。这两款软件都很适合那些你无法完全决定你想听什么，而又想用一种简单的方式来浏览现有音乐的时候。

[Kaffeine][5] 其实不仅仅是一个音乐播放器。它可以播放视频文件、DVD、CD，甚至数字电视（假设你有输入信号）。我已经整整几天没有关闭 Kaffeine 了，因为不管我是想听音乐还是看电影，Kaffeine 都能让我轻松地开始播放。

### 3、Audacious

![Audacious interface][6]

[Audacious][7] 媒体播放器是一个轻量级的应用，它可以播放你的音乐文件（甚至是 MIDI 文件）或来自互联网的流媒体音乐。对我来说，它的主要吸引力在于它的模块化架构，它鼓励开发插件。这些插件可以播放几乎所有你能想到的音频媒体格式，用图形均衡器调整声音，应用效果，甚至可以重塑整个应用，改变其界面。

很难把 Audacious 仅仅看作是一个应用，因为它很容易让它变成你想要的应用。无论你是 Linux 上的 XMMS、Windows 上的 WinAmp，还是任何其他替代品，你大概都可以用 Audacious 来近似它们。Audacious 还提供了一个终端命令，`audtool`，所以你可以从命令行控制一个正在运行的 Audacious 实例，所以它甚至可以近似于一个终端媒体播放器!

### 4、VLC

![vlc interface][8]

[VLC][9] 播放器可能是向用户介绍开源的应用之首。作为一款久经考验的多媒体播放器，VLC 可以播放音乐、视频、光盘。它还可以通过网络摄像头或麦克风进行流式传输和录制，从而使其成为捕获快速视频或语音消息的简便方法。像 mpv 一样，大多数情况下都可以通过按单个字母的键盘操作来控制它，但它也有一个有用的右键菜单。它可以将媒体从一种格式转换为另一种格式、创建播放列表、跟踪你的媒体库等。VLC 是最好的，大多数播放器甚至无法在功能上与之匹敌。无论你在什么平台上，它都是一款必备的应用。

### 5、Music player daemon

![mpd with the ncmpc interface][10]

[music player daemon（mpd）][11] 是一个特别有用的播放器，因为它在服务器上运行。这意味着你可以在 [树莓派][12] 上启动它，然后让它处于空闲状态，这样你就可以在任何时候播放一首曲子。mpd 的客户端有很多，但我用的是 [ncmpc][13]。有了 ncmpc 或像 [netjukebox][14] 这样的 Web 客户端，我可以从本地主机或远程机器上连接 mpd，选择一张专辑，然后从任何地方播放它。

### Linux 上的媒体播放

在 Linux 上播放媒体是很容易的，这要归功于它出色的编解码器支持和惊人的播放器选择。我只提到了我最喜欢的五个播放器，但还有更多的播放器供你探索。试试它们，找到最好的，然后坐下来放松一下。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-media-players

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_film.png?itok=aElrLLrw (An old-fashioned video camera)
[2]: https://opensource.com/sites/default/files/mpv_0.png
[3]: https://opensource.com/article/17/6/ffmpeg-convert-media-file-formats
[4]: https://opensource.com/sites/default/files/kaffeine.png
[5]: https://apps.kde.org/en/kaffeine
[6]: https://opensource.com/sites/default/files/audacious.png
[7]: https://audacious-media-player.org/
[8]: https://opensource.com/sites/default/files/vlc_0.png
[9]: http://videolan.org
[10]: https://opensource.com/sites/default/files/mpd-ncmpc.png
[11]: https://www.musicpd.org/
[12]: https://opensource.com/article/21/1/raspberry-pi-hifi
[13]: https://www.musicpd.org/clients/ncmpc/
[14]: http://www.netjukebox.nl/
[15]: https://wiki.gnome.org/Apps/Rhythmbox