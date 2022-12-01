[#]: collector: (lujun9972)
[#]: translator: (FYJNEVERFOLLOWS)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-15246-1.html)
[#]: subject: (Convert audio files with this versatile Linux command)
[#]: via: (https://opensource.com/article/20/2/linux-sox)
[#]: author: (Klaatu https://opensource.com/users/klaatu)

使用这个多功能的 Linux 命令转换音频文件
======

> SoX Sound Exchange 甚至可以为你的音频文件添加特效。

![](https://img.linux.net.cn/data/attachment/album/202211/13/104314skttlizoioyeaw3w.jpg)

我工作需要使用音视频媒体，不管你处理哪种媒体，你肯定知道标准化是一种有价值的工具。就像你不会试图把一个分数加到一个小数上而不转换其中一个一样，我已经知道，把不同格式的媒体组合起来并不理想。为了方便用户，大多数爱好者级应用程序使转换过程不可见。然而，对于那些需要控制媒体细节的用户的灵活软件，会通常让你自己提前将媒体转换为所需的格式。我有一些最喜欢的音频转换工具，其中之一就是号称“音频的瑞士军刀” —— [SoX][2]。

### 安装

在 Linux 或 BSD 上，可以从软件存储库或 Ports 树中安装 `sox` 命令（，以及一些有用的符号链接）。

你也可以从 [Sourceforge.net][3] 上安装 SoX。它不经常发布，但它的代码库往往是稳定的，所以如果你想要最新的功能（如 Opus 支持），构建它是容易和安全的。

SoX 主要提供了 `sox` 命令，但是创建了一些有用的符号链接：`play`、`rec` 和 `soxi`。

### 使用 SoX 获取文件信息

SoX 可以读取和重写音频数据。它是否存储重写的音频数据取决于你。在有些情况下，你不需要存储转换后的数据，例如，当你将输出直接发送到扬声器进行回放时。然而，在进行任何转换之前，最好首先确定要处理的是什么。

使用 `soxi` 命令也可以收集音频文件信息。`soxi` 会符号链接到 `soxi --info`。

```
$ soxi countdown.mp3
Input File（输入文件）    : '/home/tux/countdown.mp3'
Channels（通道数）       : 1
Sample Rate（采样率）    : 44100
Precision（数据精度）      : 16-bit（16 比特）
Duration（时长）       : 00:00:11.21 = 494185 samples...（11.21 秒 = 494185 采样点）
File Size（文件大小）      : 179k
Bit Rate（比特率）       : 128k
Sample Encoding（编码格式）: MPEG audio (layer I, II or III)
```

这个输出可以让你很好地了解音频文件的编码方式、文件长度、文件大小、采样率和通道数。其中一些你可能*认为*你已经知道了，但当客户把媒体带到我面前时，我从不相信这些假设。使用 `soxi` 验证媒体属性。

### 转换文件

在本例中，，一个游戏节目倒计时的音频是以MP3文件的形式提供的。虽然几乎所有的编辑应用程序都接受压缩音频，但它们并不是在压缩的数据上进行编辑。转换是在某个地方发生的，可能是一个秘密的后台任务，也可能提示让你保存一份副本。我通常喜欢自己提前完成转换。这样，我可以控制使用的格式。我可以在夜间批量处理大量的媒体，而不是浪费宝贵的制作时间，等待编辑应用程序按需处理它们。

`sox` 命令用于转换音频文件。在 `sox` 流程中有几个阶段：

  * 输入
  * 合并
  * 特效
  * 输出

但在命令语法中，特效步骤令人困惑地放到了*最后一步*。这意味着 `sox` 流程是这样组成的:

```
输入 → 合并 → 输出 → 特效
```

### 编码

最简单的转换命令只涉及一个输入文件和一个输出文件。下面是转换 MP3 文件为无损 FLAC 文件的命令：

```
$ sox countdown.mp3 output.flac
$ soxi output.flac

Input File（输入文件）     : 'output.flac'
Channels（通道数）       : 1
Sample Rate（采样率）    : 44100
Precision（数据精度）      : 16-bit（16 比特）
Duration（时长）       : 00:00:11.18 = 493056 samples...（11.18 秒 = 493056 采样点）
File Size（文件大小）      : 545k
Bit Rate（比特率）       : 390k
Sample Encoding（编码格式）: 16-bit FLAC
Comment（注释）        : 'Comment=Processed by SoX'
```

#### 特效

特效可以在命令末尾指定。它可以在将数据发送到最终目的地之前更改音频。例如，有时声音太大会在转换过程中造成问题：

```
$ sox bad.wav bad.ogg
sox WARN sox: `bad.ogg' output clipped 126 samples; decrease volume?
```

应用**增益**（`gain`）效果通常可以解决此问题：


```
$ sox bad.wav bad.ogg gain -1
```

#### 淡入淡出

另一个常用的效果是**淡入淡出**（`fade`）。此效果允许你定义淡入或淡出的类型，以及你希望淡入淡出效果持续的时间。

下面是一个使用倒抛物线的 6 秒淡入示例：

```
$ sox intro.ogg intro.flac fade p 6
```

这将对音频的头部应用 3 秒的淡入，并从 8 秒标记开始淡出（这段音乐只有 11 秒，因此在这种情况下淡出也是 3 秒）：

```
$ sox intro.ogg intro.flac fade p 3 8
```

`sox` 手册页中列出了不同类型的淡入淡出（正弦、线性、倒抛物线等）以及淡入淡出提供的选项。

#### 特效语法

每个特效插件都有自己的语法，因此请参阅手册页了解如何调用每个特效插件的详细信息。

效果可以在一个命令中以菊花链的方式进行，至少在你想组合它们的范围内是如此。换句话说，没有语法可以只在六秒钟的淡出期间应用一个镶边效果。对于如此精确的东西，你需要一个图形声波编辑器或数字音频工作站，例如 [LMMS][4] 或 [Rosegarden][5]。但是，如果你只想应用一次特效，可以在同一命令中将它们一起列出。

此命令应用了一个 -1 的**增益**效果、1.35 的节奏**拉伸**和**淡出**：

```
$ sox intro.ogg output.flac gain -1 stretch 1.35 fade p 0 6
$ soxi output.flac

Input File（输入文件）     : 'output.flac'
Channels（通道数）       : 1
Sample Rate（采样率）    : 44100
Precision（数据精度）      : 16-bit（16 比特）
Duration（时长）        : 00:00:15.10 = 665808 samples...（15.10 秒 = 665808 采样点）
File Size（文件大小）      : 712k
Bit Rate（比特率）       : 377k
Sample Encoding（编码格式）: 16-bit FLAC
Comment（注释）        : 'Comment=Processed by SoX'
```

### 组合音频

SoX 还可以通过连接或混合音频文件来组合音频文件。

要连接（或者说*拼接*）文件合并为一个文件，请在命令中提供多个输入文件：

```
$ sox countdown.mp3 intro.ogg output.flac
```

在本例中，`output.flac` 现在包含 `countdown.mp3` 音频，紧接着是 `intro.ogg` 音乐。

但是，如果你希望两首曲目同时播放，可以使用 `--combine mix` 选项：

```
$ sox --combine mix countdown.mp3 intro.ogg output.flac
```

然而，想象一下，这两个输入文件的不同之处不仅仅在于它们的编解码器。人声音轨用单声道（一个声道）录制并不少见，但音乐至少要用立体声（至少两个声道）来录制。SoX 不会给出默认的解决方案，因此你必须首先自己标准化这两个文件的格式。

#### 更改音频文件

选项与后面列出文件名有关。例如，此命令中的 `--channels` 选项将*仅仅*应用于 `input.wav`，而*不被*应用于 `example.ogg` 和 **output.flac**：

```
$ sox --channels 2 input.wav example.ogg output.flac
```

这意味着在 SoX 中，选项的位置非常重要。如果你在命令开始时指定一个选项，那么实际上只会覆盖 SoX 自己从输入文件中收集的内容。然而，在*输出文件*名前的选项决定了 SoX 如何写入音频数据。

要解决前面的通道不兼容问题，你可以首先标准化输入，然后混合：

```
$ sox countdown.mp3 --channels 2 countdown-stereo.flac gain -1
$ soxi countdown-stereo.flac

Input File（输入文件）     : 'countdown-stereo.flac'
Channels（通道数）       : 2
Sample Rate（采样率）    : 44100
Precision（数据精度）      : 16-bit（16 比特）
Duration（时长）       : 00:00:11.18 = 493056 samples...（11.18 秒 = 493056 采样点）
File Size（文件大小）      : 545k
Bit Rate（比特率）       : 390k
Sample Encoding（编码格式）: 16-bit FLAC
Comment（注释）        : 'Comment=Processed by SoX'

$ sox --combine mix \
  countdown-stereo.flac \
  intro.ogg \
  output.flac
```

SoX 绝对需要多个命令来执行复杂的操作，因此根据需要创建几个临时和中间文件是正常的。

### 多通道音频

当然，并非所有音频都被限制在一个或两个声道。如果你想将多个音频通道组合成一个文件，可以使用 SoX 的 `--combine merge` 选项：

```
$ sox --combine merge countdown.mp3 intro.ogg output.flac
$ soxi output.flac

Input File     : 'output.flac'
Channels       : 3
[...]
```

### 简单的音频操作

在没有视觉界面的情况下操作音频似乎很奇怪，而且对于某些任务来说，SoX 绝对不是最好的工具。然而，对于许多任务，SoX 提供了一个简单而轻量级的工具包。SoX 是一个具有强大潜力的简单命令。有了它，你可以转换音频，操纵通道和波形，甚至生成自己的声音。本文仅简要概述了其功能，因此请阅读其手册页或 [在线文档][2]，然后看看你能创造什么。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/linux-sox

作者：[Klaatu][a]
选题：[lujun9972][b]
译者：[FYJNEVERFOLLOWS](https://github.com/FYJNEVERFOLLOWS)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/klaatu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/hi-fi-stereo-vintage.png?itok=KYY3YQwE (HiFi vintage stereo)
[2]: http://sox.sourceforge.net/sox.html
[3]: http://sox.sourceforge.net
[4]: https://opensource.com/life/16/2/linux-multimedia-studio
[5]: https://opensource.com/article/18/3/make-sweet-music-digital-audio-workstation-rosegarden
