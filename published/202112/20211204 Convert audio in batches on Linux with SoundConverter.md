[#]: subject: "Convert audio in batches on Linux with SoundConverter"
[#]: via: "https://opensource.com/article/21/12/soundconverter-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14072-1.html"

在 Linux 上用 SoundConverter 分批转换音频
======

> SoundConverter 是一个有用的应用，它不仅能做到它的名字所说的那样，而且它是分批和并行地做的。

![](https://img.linux.net.cn/data/attachment/album/202112/11/090248gqt2hwqtyft51qwh.jpg)

有许多用于存储数字音频的文件格式，它们适用于不同的目的。当然，数字音频只是声音的一种表现形式，是一种声波的呈现，它由解码器和一组扬声器转化为声音。一些音频格式，一般被称为 <ruby>无损<rt>lossless</rt></ruby> 格式，旨在将音频编码为接近其原始模拟形式。然而，在现实世界中有大量的数据，而迄今为止，数字形式只能对其进行近似处理，而且需要非常大的文件。其他的音频格式，被称 <ruby>有损<rt>lossy</rt></ruby> 格式，可以在文件大小与声音的合理表现之间取得平衡。

有很多很好的终端命令可以用于音频转换：有 `sox` 和 `ffmpeg`，以及一些特定格式的编码器，如 `opusenc`、`flac`、`oggenc`、`fdkaac`、`wavpack` 和无数的其他编码器。

### 在 Linux 上安装 SoundConverter

SoundConverter 在大多数 Linux 发行版上都可以通过你的包管理器获得。在 Fedora、Mageia 和类似的发行版上：

```
$ sudo dnf install kdenlive
```

在 Elementary、Mint 和其他基于 Debian 的发行版上:

```
$ sudo apt install kdenlive
```

然而，我使用使用 [Flatpak][2] 安装 SoundConverter。

### 转换音频

一旦你把音频编码成有损格式，你就丢失了数据。这些数据是否重要取决于其听众的耳朵。有些人听不出低比特率的 MP3 和全质量的 FLAC 文件之间的区别，即使那些能听出来的人，也常常注意不到 320kbps 的 Ogg Vorbis 播客和 128kbps 的 Ogg Vorbis 播客之间的区别。将音频从压缩格式转换为非压缩格式并不能恢复丢失的数据，但需要将音频从一种格式转换为另一种格式的情况并不少见。你可能想把文件上传到只接受特定格式的网站，或者你的移动设备可能只能播放特定的格式，或者用电子邮件发送一个对你的邮件主机来说太大的文件，或者你可能只是想节省硬盘上的空间。

SoundConverter 可以让你轻松地分批转换音频。要用 SoundConverter 转换音频：

  1. 从你的应用或活动菜单中启动 SoundConverter。
  2. 点击 SoundConverter 窗口左上角的“<ruby>添加文件<rt>Add Files</rt></ruby>”按钮，并选择你要转换的文件。
  3. 添加了文件后，点击窗口右上角的“<ruby>偏好<rt>Preferences</rt></ruby>”按钮（齿轮图标），并选择你想转换的格式。你还可以设置文件命名规则、目标文件夹和其他选项。
  4. 当你准备好了，点击左上角的“<ruby>转换<rt>Convert</rt></ruby>”按钮。

![SoundConverter window][3]

### 并行处理

SoundConverter 是一个有用的应用，它不仅完全做了它的名字所说的事情，而且它是分批和并行地做的。因为现代计算机不仅仅有一个 CPU 核心，把每个文件放在一个队列中逐一编码，是对能源和时间的浪费。SoundConverter 可以同时处理几个文件，并对它们进行编码，这意味着转换 12 个文件所需的时间和通常一个接一个地转换两个文件所需的时间是一样的。你可以用一个好的终端命令做同样的事情，但前提是你要了解如何 [启动并行进程][5]。

![SoundConverter preferences][6]

你也可以将立体声音频转换为单声道文件。这对播客和有声读物特别有用。这些通常由一个人从一个单一的位置（麦克风）说话组成，不需要空间位置感。事实上，将立体声文件减少到单声道，如果你只有一个耳塞，就能更容易听到音频，并将文件大小减半。

### SoundConverter 的优势

为音频提供不同的文件格式是一个很好的功能，但似乎每当我以一种格式保存音频时，我都不可避免地需要另一种格式。有几个很棒的 Linux 命令可以 [转换音频文件][7]，但有时你可能想要一个可以在桌面上打开并拖放文件的应用，这就是 [SoundConverter][8] 的用场。SoundConverter 是一个简单的而用途单一的应用程序，它的作用和它的名字一样：把声音从一种格式转换为另一种格式。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/soundconverter-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/sound-radio-noise-communication.png?itok=KMNn9QrZ (radio communication signals)
[2]: https://opensource.com/article/21/11/install-flatpak-linux
[3]: https://opensource.com/sites/default/files/uploads/soundconverter_0.jpg (SoundConverter window)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/article/18/5/gnu-parallel
[6]: https://opensource.com/sites/default/files/uploads/soundconvert-preferences.jpg (SoundConverter preferences)
[7]: https://opensource.com/article/17/6/ffmpeg-convert-media-file-formats
[8]: https://soundconverter.org/
