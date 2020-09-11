[#]: collector: (lujun9972)
[#]: translator: (chenmu-kk)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11946-1.html)
[#]: subject: (Editing Subtitles in Linux)
[#]: via: (https://itsfoss.com/editing-subtitles)
[#]: author: (Shirish https://itsfoss.com/author/shirish/)

如何在 Linux 中编辑字幕
======

我作为一位世界电影和地区电影爱好者已经几十年了。这期间字幕是一个必不可少的工具，它可以使我享受来自不同国家不同语言的优秀电影。

如果你喜欢观看带有字幕的电影，你可能会注意到有时字幕并不同步或者说并不正确。

你知道你可以自己编写字幕并使得它们更完美吗？让我们向你展示一些 Linux 中的基本字幕编辑吧。

![Editing subtitles in Linux][1]

### 从闭路字幕数据中提取字幕

大概在 2012、2013 年我开始了解到有一款叫做 [CCEextractor][2] 的工具。随着时间的推移，它已经成为我必不可少的工具之一，尤其是当我偶然发现一份内含有字幕的媒体文件。

CCExtractor 负责解析视频文件以及从<ruby>闭路字幕<rt>closed captions</rt></ruby>数据中产生独立的字幕文件。

CCExtractor 是一个跨平台的、自由开源工具。自它形成的那年起该工具已经成熟了不少而如今已成为 [GSOC][3] 和谷歌编码输入的一部分。

简单来说，这个工具基本上是一系列脚本，这些脚本以一种顺序方式一个接着一个地给你提供提取到的字幕。

你可以按照[本页][5]的 CCExtractor 安装指南进行操作。

若安装后你想从媒体文件中提取字幕，请按以下步骤操作：

```
ccextractor <path_to_video_file>
```

该命令将会输出以下内容：

```
$ ccextractor $something.mkv
CCExtractor 0.87, Carlos Fernandez Sanz, Volker Quetschke.
Teletext portions taken from Petr Kutalek's telxcc
--------------------------------------------------------------------------
Input: $something.mkv
[Extract: 1] [Stream mode: Autodetect]
[Program : Auto ] [Hauppage mode: No] [Use MythTV code: Auto]
[Timing mode: Auto] [Debug: No] [Buffer input: No]
[Use pic_order_cnt_lsb for H.264: No] [Print CC decoder traces: No]
[Target format: .srt] [Encoding: UTF-8] [Delay: 0] [Trim lines: No]
[Add font color data: Yes] [Add font typesetting: Yes]
[Convert case: No] [Video-edit join: No]
[Extraction start time: not set (from start)]
[Extraction end time: not set (to end)]
[Live stream: No] [Clock frequency: 90000]
[Teletext page: Autodetect]
[Start credits text: None]
[Quantisation-mode: CCExtractor's internal function]
-----------------------------------------------------------------
Opening file: $something.mkv
File seems to be a Matroska/WebM container
Analyzing data in Matroska mode

Document type: matroska
Timecode scale: 1000000
Muxing app: libebml v1.3.1 + libmatroska v1.4.2
Writing app: mkvmerge v8.2.0 ('World of Adventure') 64bit
Title: $something

Track entry:
    Track number: 1
    UID: 1
    Type: video
    Codec ID: V_MPEG4/ISO/AVC
    Language: mal
    Name: $something
    
Track entry:
    Track number: 2
    UID: 2
    Type: audio
    Codec ID: A_MPEG/L3
    Language: mal
    Name: $something

Track entry:
    Track number: 3
    UID: somenumber
    Type: subtitle
    Codec ID: S_TEXT/UTF8
    Name: $something
 99%  |  144:34
100%  |  144:34
Output file: $something_eng.srt
Done, processing time = 6 seconds
Issues? Open a ticket here
https://github.com/CCExtractor/ccextractor/issues
```
它会大致浏览媒体文件。在这个例子中，它发现该媒体文件是马拉雅拉姆语言（mal）并且格式是 [.mkv][6]。之后它将字幕文件提取出来，命名为源文件名并添加“_eng”后缀。

CCExtractor 是一款用来增强字幕功能和字幕编辑的优秀工具，我将在下一部分对它进行介绍。

> 趣味阅读：在 [vicaps][7] 有一份有趣的字幕提要，它讲解和分享为何字幕对我们如此重要。对于那些对这类话题感兴趣的人来说，这里面也有许多电影制作的细节。

### 用 SubtitleEditor 工具编辑字幕

你大概意识到大多数的字幕都是 [.srt 格式][8] 的。这种格式的优点在于你可以将它加载到文本编辑器中并对它进行少量的修改。

当进入一个简单的文本编辑器时，一个 srt 文件看起来会是这个样子：

```
1
00:00:00,959 --&gt; 00:00:13,744
"THE CABINET
OF DR. CALIGARI"

2
00:00:40,084 --&gt; 00:01:02,088
A TALE of the modern re-appearance of an 11th Century Myth
involting the strange and mysterious influence
of a mountebank monk over a somnambulist.
```

我分享的节选字幕来自于一部非常老的德国电影《[卡里加里博士的小屋][9]》（1920）。

Subtitleeditor 是一款非常棒的字幕编辑软件。字幕编辑器可以用来设置字幕持续时间、与多媒体文件同步的字幕帧率以及字幕间隔时间等等。接下来我将在这分享一些基本的字幕编辑。

![][10]

首先，以安装 ccextractor 工具同样的方式安装 subtitleeditor 工具，使用你自己喜爱的安装方式。在 Debian 中，你可以使用命令：

```
sudo apt install subtitleeditor
```

当你安装完成后，让我们来看一下在你编辑字幕时一些常见的场景。

#### 调整帧率使其媒体文件同步

如果你发现字幕与视频不同步，一个原因可能是视频文件的帧率与字幕文件的帧率并不一致。

你如何得知这些文件的帧率呢，然后呢？为了获取视频文件的帧率，你可以使用 `mediainfo` 工具。首先你可能需要发行版的包管理器来安装它。

使用 `mediainfo` 非常简单：

```
$ mediainfo somefile.mkv | grep Frame
 Format settings                          : CABAC / 4 Ref Frames
 Format settings, ReFrames                : 4 frames
 Frame rate mode                          : Constant
 Frame rate                               : 25.000 FPS
 Bits/(Pixel*Frame)                       : 0.082
 Frame rate                               : 46.875 FPS (1024 SPF)﻿
```

现在你可以看到视频文件的帧率是 25.000 FPS 。我们看到的另一个帧率则是音频文件的帧率。虽然我可以分享为何在视频解码和音频解码等地方会使用特定的 fps，但这将会是一个不同的主题，与它相关的历史信息有很多。

下一个问题是解决字幕文件的帧率，这个稍微有点复杂。

通常情况下，大多数字幕都是压缩格式的。将.zip 归档文件和字幕文件（以 XXX.srt 结尾）一起解压缩。除此之外，通常还会有一个同名的 .info 文件，该文件可能包含字幕的帧率。

如果不是，那么通常最好去某个站点并从具有该帧速率信息的站点下载字幕。对于这个特定的德文文件，我使用 [Opensubtitle.org][11] 来找到它。

正如你在链接中所看到的，字幕的帧率是 23.976 FPS 。很明显，它不能与帧率为 25.000 FPS 的视频文件一起很好地播放。

在这种情况下，你可以使用字幕编辑工具来改变字幕文件的帧率。

按下 `CTRL+A` 选择字幕文件中的全部内容。点击 “Timings -> Change Framerate” ，将 23.976 fps 改为 25.000 fps 或者你想要的其他帧率，保存已更改的文件。

![synchronize frame rates of subtitles in Linux][12]

#### 改变字幕文件的起点

有时以上的方法就足够解决问题了，但有时候以上方法并不足够解决问题。

在帧率相同时，你可能会发现字幕文件的开头与电影或媒体文件中起点并不相同。

在这种情况下，请按以下步骤进行操作：

按下 `CTRL+A` 键选中字幕文件的全部内容。点击 “Timings -> Select Move Subtitle” 。

![Move subtitles using Subtitle Editor on Linux][13]

设定字幕文件的新起点，保存已更改的文件。

![Move subtitles using Subtitle Editor in Linux][14]

如果你想要时间更精确一点，那么可以使用 [mpv][15] 来查看电影或者媒体文件并点击进度条（可以显示电影或者媒体文件的播放进度），它也会显示微秒。

通常我喜欢精准无误的操作，因此我会试着尽可能地仔细调节。相较于人类的反应时间来说，MPV 中的反应时间很精确。如果我想要极其精确的时间，那么我可以使用像 [Audacity][16] 之类的东西，但是那是另一种工具，你可以在上面做更多的事情。那也将会是我未来博客中将要探讨的东西。

#### 调整字幕间隔时间

有时，两种方法都采用了还不够，甚至你可能需要缩短或增加间隔时间以使其与媒体文件同步。这是较为繁琐的工作之一，因为你必须单独确定每个句子的间隔时间。尤其是在媒体文件中帧率可变的情况下（现已很少见，但你仍然会得到此类文件）

在这种设想下，你可能因为无法实现自动编辑而不得不手动的修改间隔时间。最好的方式是修改视频文件（会降低视频质量）或者换另一个更高质量的片源，用你喜欢的设置对它进行[转码][17] 。这又是一重大任务，以后我会在我的一些博客文章上阐明。

### 总结

以上我分享的内容或多或少是对现有字幕文件的改进。如果从头开始，你需要花费大量的时间。我完全没有分享这一点，因为一部电影或一个小时内的任何视频材料都可以轻易地花费 4-6 个小时，甚至更多的时间，这取决于字幕员的技巧、耐心、上下文、行话、口音、是否是以英语为母语的人、翻译等，所有的这些都会对字幕的质量产生影响。

我希望自此以后你会觉得这件事很有趣，并将你的字幕处理的更好一点。如果你有其他想要补充的问题，请在下方留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/editing-subtitles

作者：[Shirish][a]
选题：[lujun9972][b]
译者：[chenmu-kk](https://github.com/chenmu-kk)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/shirish/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/01/editing-subtitles-in-linux.jpeg?resize=800%2C450&ssl=1
[2]: https://www.ccextractor.org/
[3]: https://itsfoss.com/best-open-source-internships/
[4]: https://www.ccextractor.org/public:codein:google_code-in_2018
[5]: https://github.com/CCExtractor/ccextractor/wiki/Installation
[6]: https://en.wikipedia.org/wiki/Matroska
[7]: https://www.vicaps.com/blog/history-of-silent-movies-and-subtitles/
[8]: https://en.wikipedia.org/wiki/SubRip#SubRip_text_file_format
[9]: https://www.imdb.com/title/tt0010323/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/subtitleeditor.jpg?ssl=1
[11]: https://www.opensubtitles.org/en/search/sublanguageid-eng/idmovie-4105
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/subtitleeditor-frame-rate-sync.jpg?resize=800%2C450&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/01/Move-subtitles-Caligiri.jpg?resize=800%2C450&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/move-subtitles.jpg?ssl=1
[15]: https://itsfoss.com/mpv-video-player/
[16]: https://www.audacityteam.org/
[17]: https://en.wikipedia.org/wiki/Transcoding
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/01/editing-subtitles-in-linux.jpeg?fit=800%2C450&ssl=1
