[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (Easily Convert Audio File Formats with SoundConverter in Linux)
[#]: via: (https://itsfoss.com/sound-converter-linux/)
[#]: author: (Abhishek Prakash  https://itsfoss.com/author/abhishek/)
[#]: url: (https://linux.cn/article-10350-1.html)

在 Linux 中使用 SoundConverter 轻松转换音频文件格式
======

> 如果你正在寻找将音频文件格式转换为 wav、mp3、ogg 或任何其他格式，SoundConverter 是你在 Linux 中需要的工具。

![Audio Converter in Linux][1]

最近我购买了一些没有 DRM 的音乐。我是从 [SaReGaMa][2] 那里买的，这是一家印度历史最悠久，规模最大的音乐品牌。下载的文件采用高清质量的 WAV 格式。

不幸的是，Rhythmbox 无法播放 WAV。最重要的是，单个文件大小约为 70MB。想象一下，将这么大的音乐传输到智能手机。它会不必要地占用大量空间。

所以我认为是时候将 WAV 文件转换为 MP3 —— 这个长青且最流行的音乐文件格式。

为此，我需要一个在 Linux 中的音频转换器。在这个教程中，我将向你展示如何使用名为 SoundCoverter 的 GUI 工具轻松地将音频文件从一种格式转换为另一种格式。

### 在 Linux 中安装 SoundConverter

[SoundConverter][3] 是一款流行的自由开源软件。它应该可以在大多数 Linux 发行版的官方仓库中找到。

Ubuntu/Linux Mint 用户只需在软件中心搜索 SoundConverter 并从那里安装即可。

![SoundConverter application in Software Center of Ubuntu][4]

*SoundConverter 可以从软件中心安装*

或者，你可以使用命令行方式。在基于 Debian 和 Ubuntu 的系统中，你可以使用以下命令：

```
sudo apt install soundconverter
```

在 Arch、Fedora 和其他非基于 Debian 的发行版中，你可以使用你的发行版的软件中心或软件包管理器。

### 在 Linux 中使用 SoundConverter 转换音频文件格式

安装完 SoundConverter 后，在菜单中搜索并启动它。

默认界面看起来像这样，它不能比这简单：

![SoundConverter application interface in Linux][5]

*简单的界面*

转换音频文件格式只要选择文件并单击转换。

但是，我建议你至少在第一次运行时检查下默认设置。默认情况下，它会将音频文件转换为 OGG 文件格式，你可能不希望这样。

![Preferences in SoundConverter][6]

*可以在“首选项”中更改默认输出设置*

要更改默认输出设置，请单击界面上的“首选项”图标。你会在这里看到很多可更改的选择。

你可以更改默认输出格式、比特率、质量等。你还可以选择是否要将转换后的文件保存在与原始文件相同的文件夹中。

转换后还可以选择自动删除原始文件。我不认为你应该使用那个选项。

你还可以更改输出文件名。默认情况下，它只会更改后缀，但你也可以选择根据曲目编号、标题、艺术家等进行命名。为此，原始文件中应包含适当的元数据。

说到元数据，你听说过 [MusicBrainz Picard][7] 吗？此工具可帮助你自动更新本地音乐文件的元数据。

### 总结

我之前用讨论过用一个小程序 [在 Linux 中录制音频][8]。这些很棒的工具通过专注某个特定的任务使得生活更轻松。你可以使用成熟和更好的音频编辑工具，如 [Audacity][9]，但对于较小的任务，如转换音频文件格式，它可能用起来很复杂。

我希望你喜欢 SoundConverter。如果你使用其他工具，请在评论中提及，我会在 FOSS 中提及。使用开心！

--------------------------------------------------------------------------------

via: https://itsfoss.com/sound-converter-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/Convert-audio-file-format-linux.png?resize=800%2C450&ssl=1
[2]: https://en.wikipedia.org/wiki/Saregama
[3]: http://soundconverter.org/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/sound-converter-software-center.png?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/sound-converter-app-linux.jpeg?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/sound-converter-app-linux-preferences.jpeg?resize=800%2C431&ssl=1
[7]: https://itsfoss.com/musicbrainz-picard/
[8]: https://itsfoss.com/record-streaming-audio/
[9]: https://www.audacityteam.org/
