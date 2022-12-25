[#]: subject: "How to Record Streaming Audio in Ubuntu and other Linux Distributions"
[#]: via: "https://itsfoss.com/record-streaming-audio/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "FYJNEVERFOLLOWS"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15381-1.html"

如何在 Ubuntu 中录制流媒体音频
======

![][0]

> 如何在 Ubuntu 和其他 Linux 发行版中录制音频？

如果你想通过计算机的麦克风录制语音，可以使用 GNOME <ruby>录音机<rt>Sound Recorder</rt></ruby> 或 Audacity。

使用 GNOME 录音机很简单，但它功能不足。Audacity 最初可能会让人无从入手，但它有很多专业级录音的功能。不过，在本教程中，我不打算详细讨论这个问题。

GNOME 录音机能与麦克风配合使用。还有一个叫做 Audio recorder 的工具，除了麦克风输入，你可以使用它来录制流媒体音乐（来自 Sptify、YouTube、互联网广播、Skype 和其他大多数来源）。

总而言之，我将向你展示以下步骤：

* 使用 GNOME 录音机录制声音
* 使用 Audio Recorder 录制流音频

### 使用 GNOME 录音机从麦克风录制音频

GNOME 桌面环境有很多有用的应用程序，录音机就是其中之一。

你可以从 Ubuntu 软件中心安装 [录音机][1]。

![Sound Recorder can be installed from the Ubuntu Software Center][2]

或者，你可以在终端中使用此命令来安装它：

```
sudo apt install gnome-sound-recorder
```

安装后，你可以在系统菜单中找到它，并从那里启动它。

![GNOME Sound Recorder][3]

在开始使用它之前，应确保在系统设置中选择了正确的输入源：

![Ensure that you have chosen correct input in system settings][4]

打开录音机，它将显示如下界面：

![Hit the Record button to start audio recording][5]

点击“<ruby>录制<rt>Record</rt></ruby>”按钮，它立即开始录制音频。录制时，你可以选择暂停、停止或取消录制。

![Options while recording audio][6]

你的录音将保存并可从应用程序界面本身获得。单击保存的录音以突出显示。

你可以回放或删除该录音。你可以通过单击“保存/下载”按钮选择将其保存到其他位置。你也可以使用“编辑”按钮重命名该录音。

![Saved recordings][7]

这很方便，对吧？你可以选择以 `MP3`、`FLAC` 和多种格式录制。

#### 删除 GNOME 录音机 

不喜欢它或发现它缺乏功能？

你可以从 Ubuntu 软件中心删除 GNOME 录音机，或使用以下命令：

```
sudo apt remove gnome-sound-recorder
```

GNOME 录音机应用功能有限，它只从麦克风录制，在某些情况下这不是你想要的。

想象一下你想录制 Skype 通话或在应用程序或网络浏览器中播放的内容？在这种情况下，漂亮的 Audio Recorder 会有所帮助。

### 使用 Audio Recorder 来录制流媒体音频

你可以使用 [官方 PPA][10] 在 Ubuntu 和 LinuxMint 中安装 `Audio Recorder`。在终端中依次使用以下命令：

```
sudo apt-add-repository ppa:audio-recorder/ppa
sudo apt update
sudo apt install audio-recorder
```

或者，你可以从 [启动台][11] 下载源代码。安装后，你可以从“<ruby>活动概述<rt>Activity Overview</rt></ruby>”里启动应用程序：

![Audio Recorder][12]

#### 记录不同来源的各种声音

Audio Recorder 记录计算机产生的各种声音。

它记录通过系统声卡、麦克风、浏览器、网络摄像头等播放的音频。

换句话说，即使你的系统打喷嚏，它也会记录（如果你想记录的话）。它允许你选择录制设备，如网络摄像头、麦克风、Skype 等。

要录制流媒体音乐，请选择适当的源。例如，如果你正在 Rhythmbox 中播放流媒体广播，请选择 Rythmbox。

![Audio-Recorder Audio Settings][13]

#### 在你方便的时候录制

Audio Recorder 还提供了设置计时器的选项。你可以在给定的时钟时间或预定义的间隔开始、停止或暂停录制。你还可以设置录制文件大小的限制。

此外，你可以在没有音频（或声音很低）时暂停（和停止），并在声音恢复时继续。

你所要做的就是编辑计时器面板中的文本。注释掉你不想应用的“规则”，并根据你的要求编辑这些规则。

![Audio-recorder Timer Settings][14]

它提供了其他设置，如登录时自动启动、显示托盘图标和其他记录设置。

![Audio-recorder Additional Settings][15]

#### 以各种文件格式保存录制的音乐文件

另一个宝藏。你可以将录制的文件保存为你喜爱的文件格式。支持的文件格式有 OGG 音频、Flac、MP3、SPX 和 WAV。我录音时更喜欢用 MP3 格式。

录制的文件存储在 `~/Audio` 中，即主目录中的“音频”文件夹中。

![Audio-recorder Audio Formats][16]

#### Audio Recorder 有多好？

我在 Ubuntu 中使用 Audio Recorder [录制 YouTube 上播放的音乐][17]。我用 MP3 格式保存了一段 2 分钟的视频，占用了 934 KB 的空间。但我必须说，我没想到录制的音质会这么好。老实说，我无法将它与 YouTube 上的原始歌曲区分开来。

#### 删除 Audio Recorder

如果你不喜欢 Audio Recorder，可以使用以下命令将其删除：

```
sudo apt remove audio-recorder
```

[同时删除 PPA][18] 是个好主意：

```
sudo apt-add-repository -r ppa:audio-recorder/ppa
```

### 结论

Linux 中可能还有其他几种用于音频录制的工具。像 GNOME 一样，其他桌面环境也可能有录音应用程序。我知道深度操作系统肯定有一个。

GNOME 录音机是一个不错的工具，用于从麦克风录制声音。对于录制各种来源的声音，Audio Recorder 是一个不错的选择。

我希望这篇文章能满足你的录音需求。如果你有什么建议，请告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/record-streaming-audio/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[FYJNEVERFOLLOWS](https://github.com/FYJNEVERFOLLOWS)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://wiki.gnome.org/Apps/SoundRecorder
[2]: https://itsfoss.com/wp-content/uploads/2022/08/sound-recorder-ubuntu.png
[3]: https://itsfoss.com/wp-content/uploads/2022/08/sound-recorder.png
[4]: https://itsfoss.com/wp-content/uploads/2022/08/microphone-settings-ubuntu.png
[5]: https://itsfoss.com/wp-content/uploads/2022/08/using-sound-recorder-linux.png
[6]: https://itsfoss.com/wp-content/uploads/2022/08/sound-recording-with-sound-recorder.png
[7]: https://itsfoss.com/wp-content/uploads/2022/08/sound-recorder-interface.png
[8]: https://youtu.be/o7Ia2QGeB7Q
[9]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[10]: https://launchpad.net/~audio-recorder/+archive/ubuntu/ppa
[11]: https://launchpad.net/audio-recorder
[12]: https://itsfoss.com/wp-content/uploads/2022/08/audio-recorder-in-overview.png
[13]: https://itsfoss.com/wp-content/uploads/2022/08/audio-recorder-audio-settings.png
[14]: https://itsfoss.com/wp-content/uploads/2022/08/audio-recorder-timer-settings.png
[15]: https://itsfoss.com/wp-content/uploads/2022/08/audio-recorder-additional-settings.png
[16]: https://itsfoss.com/wp-content/uploads/2022/08/audio-recorder-audio-formats.png
[17]: https://itsfoss.com/youtube-dl-audio-only/
[18]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[0]: https://img.linux.net.cn/data/attachment/album/202212/25/154829ol11lp47i8o6222c.jpg