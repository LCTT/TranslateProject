[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13029-1.html)
[#]: subject: (5 Streaming Audio Players for Linux)
[#]: via: (https://www.linux.com/blog/2019/2/5-streaming-audio-players-linux)
[#]: author: (Jack Wallen https://www.linux.com/users/jlwallen)

5 个适用于 Linux 的流式音频播放器
======

![](https://img.linux.net.cn/data/attachment/album/202101/18/220035k8mmbl1blmkb97f8.jpg)

当我工作的时候，我会一直在后台播放音乐。大多数情况下，这些音乐是以黑胶唱片的形式在转盘上旋转。但有时我不想用这种单纯的方法听音乐时，我会选择听流媒体音频应用程序的方式。然而，由于我工作在 Linux 平台上，所以我只可以使用在我的操作系统上运行良好的软件。幸运的是，对于想在 Linux 桌面听流式音频的人来说，有很多工具可以选择。

事实上，Linux 为音乐流媒体提供了许多可靠的产品，我将重点介绍我最喜欢的五种用于此任务的工具。警告一句，并不是所有的玩意都是开源的。但是如果你不介意在你的开源桌面上运行一个专有的应用程序，你有一些非常棒的选择。让我们来看看有什么可用的。

### Spotify

Linux 版的 Spotify 不是那种在你启动就闪退的愚蠢的、半生不熟的应用程序，也没有阉割什么功能。事实上，Spotify 的 Linux 版本与其他平台上的版本完全相同。使用 Spotify 流媒体客户端，你可以收听音乐和播客、创建播放列表、发现新的艺术家等等。Spotify 界面（图 1）非常易于导航和使用。

![Spotify][2]

*图 1：Spotify 界面可以很容易地找到新的音乐和旧的收藏。*

你可以使用 snap（使用 `sudo snap install Spotify` 命令）安装 Spotify，也可以使用以下命令从官方存储库安装 Spotify：

```  
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
sudo echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client
```
 
一旦安装，你就可以登录你的 Spotify 帐户，这样你就可以开始听好听的音乐，以帮助激励你完成你的工作。如果你已在其他设备上安装了 Spotify（并登录到同一帐户），则可以指定音乐应该流式传输到哪个设备（通过单击 Spotify 窗口右下角附近的“可用设备”图标）。

### Clementine

Clementine 是 Linux 平台上最好的音乐播放器之一。Clementine 不仅允许用户播放本地存储的音乐，还可以连接到许多流媒体音频服务，例如：

  * Amazon Cloud Drive
  * Box
  * Dropbox
  * Icecast
  * Jamendo
  * Magnatune
  * RockRadio.com
  * Radiotunes.com
  * SomaFM
  * SoundCloud
  * Spotify
  * Subsonic
  * Vk.com
  * 或其他有趣的电台

使用 Clementine 有两个注意事项。首先，你必须使用最新版本（因为某些软件库中可用的构建版本已过时，并且不会安装必要的流式处理插件）。第二，即使是最新的构建版本，一些流媒体服务也不会像预期的那样工作。例如，接入 Spotify 频道时，你只能使用最热门的曲目（而无法使用播放列表，或搜索歌曲的功能）。

使用 Clementine 互联网流媒体服务时，你会发现其中有很多你从来没有听说过的音乐家和乐队（图 2）。

![Clementine][5]

*图 2：Clementine 互联网广播是寻找新音乐的好方法。*

### Odio

Odio 是一个跨平台的专有应用程序（可用于 Linux、MacOS 和 Windows），它允许你流式传输各种类型的互联网音乐站。广播的内容是取自 [www.radio-browser.info][6]，而应用程序本身在为你呈现流方面做了令人难以置信的工作（图 3）。

![Odio][8]

*图 3：Odio 接口是你能找到的最好的接口之一。*

Odio 让你很容易找到独特的互联网广播电台，甚至可以把你找到并收藏的电台添加到你的库中。目前，在 Linux 上安装 Odio 的唯一方法是通过 Snap。如果你的发行版支持 snap 软件包，请使用以下命令安装此流应用程序：

```
sudo snap install odio
```

安装后，你可以打开应用程序并开始使用它。无需登录（或创建）帐户。Odio 的设置非常有限。实际上，它只提供了在设置窗口中选择暗色主题或亮色主题的选项。然而，尽管它可能功能有限，但 Odio 是在 Linux 上播放互联网广播的最佳选择之一。

### StreamTuner2

Streamtuner2 是一个优秀的互联网电台 GUI 工具。使用它，你可以流式播放以下音乐：

  * Internet radio stations
  * Jameno
  * MyOggRadio
  * Shoutcast.com
  * SurfMusic
  * TuneIn
  * Xiph.org
  * YouTube

Streamtuner2 提供了一个很好的界面（如果不是有点过时的话），可以很容易地找到和播放你喜爱的音乐。StreamTuner2 的一个警告是，它实际上只是一个用于查找你想要听到的流媒体的 GUI。当你找到一个站点时，双击它打开与流相关的应用程序。这意味着你必须安装必要的应用程序，才能播放流媒体。如果你没有合适的应用程序，你就不能播放流媒体。因此，你将花费大量的时间来确定要为某些流媒体安装哪些应用程序（图 4）。

![Streamtuner2][10]

*图4：配置 Streamtuner2 需要一个坚强的心脏。*

### VLC

很长一段时间以来，VLC 一直被称为 Linux 最好的媒体播放工具。这是有充分理由的，因为几乎所有你丢给它的东西它都能播放。其中包括流媒体广播电台。虽然你无法让 VLC 连接到 Spotify 这样的网站，但你可以直接访问互联网广播，点击播放列表，而 VLC 毫无疑问可以打开它。考虑到目前有很多互联网广播电台，你在寻找适合自己口味的音乐方面不会有任何问题。VLC 还包括可视化工具、均衡器（图 5）等工具。

![VLC ][12]

*图 5：VLC 可视化工具和均衡器特性。*

VLC 唯一需要注意的是，你必须有一个你希望听到的互联网广播的 URL，因为这个工具本身并不能进行管理。但是有了这些链接，你就找不到比 VLC 更好的媒体播放器了。

### 这些工具软件怎么来的

如果这五个工具都不太不适合你的需要，我建议你打开你发行版的应用商店，搜索一个适合你的。有很多工具可以制作流媒体音乐、播客等等，不仅可以在 Linux 上实现，而且很简单。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2019/2/5-streaming-audio-players-linux

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[2]: https://lcom.static.linuxfound.org/sites/lcom/files/spotify_0.jpg?itok=8-Ym-R61 (Spotify)
[3]: https://www.linux.com/licenses/category/used-permission
[5]: https://lcom.static.linuxfound.org/sites/lcom/files/clementine_0.jpg?itok=5oODJO3b (Clementine)
[6]: http://www.radio-browser.info
[8]: https://lcom.static.linuxfound.org/sites/lcom/files/odio.jpg?itok=sNPTSS3c (Odio)
[10]: https://lcom.static.linuxfound.org/sites/lcom/files/streamtuner2.jpg?itok=1MSbafWj (Streamtuner2)
[12]: https://lcom.static.linuxfound.org/sites/lcom/files/vlc_0.jpg?itok=QEOsq7Ii (VLC )
[13]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
