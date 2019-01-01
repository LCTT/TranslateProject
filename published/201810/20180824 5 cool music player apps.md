5 个很酷的音乐播放器
======

![](https://fedoramagazine.org/wp-content/uploads/2018/08/5-cool-music-apps-816x345.jpg)

你喜欢音乐吗？那么 Fedora 中可能有你正在寻找的东西。本文介绍在 Fedora 上运行的各种音乐播放器。无论你有庞大的音乐库，还是小一些的，抑或根本没有，你都可以用到音乐播放器。这里有四个图形程序和一个基于终端的音乐播放器，可以让你挑选。

### Quod Libet

Quod Libet 是一个完备的大型音频库管理器。如果你有一个庞大的音频库，你不想只是听，也想要管理，Quod Libet 可能是一个很好的选择。

![][1]

Quod Libet 可以从磁盘上的多个位置导入音乐，并允许你编辑音频文件的标签 —— 因此一切都在你的控制之下。此外，它还有各种插件可用，从简单的均衡器到 [last.fm][2] 同步。你也可以直接从 [Soundcloud][3] 搜索和播放音乐。

Quod Libet 在 HiDPI 屏幕上工作得很好，它有 Fedora 的 RPM 包，如果你运行 [Silverblue][5]，它在 [Flathub][4] 中也有。使用 Gnome Software 或命令行安装它：

```
$ sudo dnf install quodlibet
```

### Audacious

如果你喜欢简单的音乐播放器，甚至可能看起来像传说中的 Winamp，Audacious 可能是你的不错选择。

![][6]

Audacious 可能不直接管理你的所有音乐，但你如果想将音乐按文件组织起来，它能做得很好。你还可以导出和导入播放列表，而无需重新组织音乐文件本身。

此外，你可以让它看起来像 Winamp。要让它与上面的截图相同，请进入 “Settings/Appearance”，选择顶部的 “Winamp Classic Interface”，然后选择右下方的 “Refugee” 皮肤。就这么简单。

Audacious 在 Fedora 中作为 RPM 提供，可以使用 Gnome Software 或在终端运行以下命令安装：

```
$ sudo dnf install audacious
```

### Lollypop

Lollypop 是一个音乐播放器，它与 GNOME 集成良好。如果你喜欢 GNOME 的外观，并且想要一个集成良好的音乐播放器，Lollypop 可能适合你。

![][7]

除了与 GNOME Shell 的良好视觉集成之外，它还可以很好地用于 HiDPI 屏幕，并支持暗色主题。

额外地，Lollypop 有一个集成的封面下载器和一个所谓的派对模式（右上角的音符按钮），它可以自动选择和播放音乐。它还集成了 [last.fm][2] 或 [libre.fm][8] 等在线服务。

它有 Fedora 的 RPM 也有用于 [Silverblue][5] 工作站的 [Flathub][4]，使用 Gnome Software 或终端进行安装：

```
$ sudo dnf install lollypop
```

### Gradio

如果你没有任何音乐但仍想听怎么办？或者你只是喜欢收音机？Gradio 就是为你准备的。

![][9]

Gradio 是一个简单的收音机，它允许你搜索和播放网络电台。你可以按国家、语言或直接搜索找到它们。额外地，它可视化地集成到了 GNOME Shell 中，可以与 HiDPI 屏幕配合使用，并且可以选择黑暗主题。

可以在 [Flathub][4] 中找到 Gradio，它同时可以运行在 Fedora Workstation 和 [Silverblue][5] 中。使用 Gnome Software 安装它。

### sox

你喜欢使用终端在工作时听一些音乐吗？多亏有了 sox，你不必离开终端。

![][10]

sox 是一个非常简单的基于终端的音乐播放器。你需要做的就是运行如下命令：

```
$ play file.mp3
```

接着 sox 就会为你播放。除了单独的音频文件外，sox 还支持 m3u 格式的播放列表。

此外，因为 sox 是基于终端的程序，你可以通过 ssh 运行它。你有一个带扬声器的家用服务器吗？或者你想从另一台电脑上播放音乐吗？尝试将它与 [tmux][11] 一起使用，这样即使会话关闭也可以继续听。

sox 在 Fedora 中以 RPM 提供。运行下面的命令安装：

```
$ sudo dnf install sox
```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/5-cool-music-player-apps/

作者：[Adam Šamalík][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/asamalik/
[1]:https://fedoramagazine.org/wp-content/uploads/2018/08/qodlibet-768x555.png
[2]:https://last.fm
[3]:https://soundcloud.com/
[4]:https://flathub.org/home
[5]:https://teamsilverblue.org/
[6]:https://fedoramagazine.org/wp-content/uploads/2018/08/audacious-768x348.png
[7]:https://fedoramagazine.org/wp-content/uploads/2018/08/lollypop-768x439.png
[8]:https://libre.fm
[9]:https://fedoramagazine.org/wp-content/uploads/2018/08/gradio-768x499.png
[10]:https://fedoramagazine.org/wp-content/uploads/2018/08/sox-768x457.png
[11]:https://fedoramagazine.org/use-tmux-more-powerful-terminal/
