如何解决 VLC 视频嵌入字幕中遇到的错误
===================

这会是一个有点奇怪的教程。背景故事如下。最近，我创作了一堆 [Risitas y las paelleras][4] 素材中[sweet][1] [parody][2] [的片段][3]，以主角 Risitas 疯狂的笑声而闻名。和往常一样，我把它们上传到了 Youtube，但是从当我决定使用字幕起，到最终在网上可以观看时，我经历了一个漫长而曲折的历程。

在本指南中，我想介绍几个你可能会在创作自己的媒体时会遇到的典型问题，主要是使用字幕，然后上传到媒体共享门户网站，特别是 Youtube 中，以及如何解决这些问题。跟我来。

### 背景故事

我选择的视频编辑软件是 Kdenlive，当我创建那愚蠢的 [Frankenstein][5] 片段时开始使用这个软件，从那以后它一直是我的忠实伙伴。通常，我将文件交给带有 VP8 视频编解码器和 Vorbis 音频编解码器的 WebM 容器来渲染，因为这是 Google 所喜欢的格式。事实上，我在过去七年里上传的大约 40 个不同的片段中都没有问题。

![Kdenlive, create project](http://www.dedoimedo.com/images/computers-years/2016-2/vlc-subs-errors-kdenlive-create-project.jpg)

![Kdenlive, render](http://www.dedoimedo.com/images/computers-years/2016-2/vlc-subs-errors-kdenlive-render.png)

但是，在完成了我的 Risitas＆Linux 项目之后，我遇到了一个困难。视频文件和字幕文件仍然是两个独立的实体，我需要以某种方式将它们放在一起。我最初关于字幕的文章提到了 Avidemux 和 Handbrake，这两个都是有效的选项。

但是，我对它们任何一个的输出都并不满意，而且由于种种原因，有些东西有所偏移。 Avidemux 不能很好处理视频编码，而 Handbrake 在最终输出中省略了几行字幕，而且字体是丑陋的。这个可以解决，但这不是今天的话题。

因此，我决定使用 VideoLAN（VLC） 将字幕嵌入视频。有几种方法可以做到这一点。你可以使用 “Media > Convert/Save” 选项，但这不能达到我们需要的。相反，你应该使用 “Media > Stream”，它带有一个更完整的向导，它还提供了一个我们需要的可编辑的代码转换选项 - 请参阅我的[教程][6]关于字幕的部分。

### 错误！

嵌入字幕的过程并没那么简单的。你有可能遇到几个问题。本指南应该能帮助你解决这些问题，所以你可以专注于你的工作，而不是浪费时间调试怪异的软件错误。无论如何，在使用 VLC 中的字幕时，你将会遇到一小部分可能会遇到的问题。尝试以及出错，还有书呆子的设计。

### 没有可播放的流

你可能选择了奇怪的输出设置。你要仔细检查你是否选择了正确的视频和音频编解码器。另外，请记住，一些媒体播放器可能没有所有的编解码器。此外，确保在所有要播放的系统中都测试过了。

![No playable streams](http://www.dedoimedo.com/images/computers-years/2016-2/vlc-subs-errors-no-playable-streams.png)

### 字幕叠加两次

如果在第一步的流媒体向导中选择了 “Use a subtitle file”，则可能会发生这种情况。只需选择所需的文件，然后单击 “Stream”。取消选中该框。

![Select file](http://www.dedoimedo.com/images/computers-years/2016-2/vlc-subs-select.png)

### 字幕没有输出

这可能是两个主要原因。一、你选择了错误的封装格式。在进行编辑之前，请确保在配置文件页面上正确标记了字幕。如果格式不支持字幕，它可能无法正常工作。

![Encapsulation](http://www.dedoimedo.com/images/computers-years/2016-2/vlc-subs-encap.png)

二、你可能已经在最终输出中启用了字幕编解码器渲染功能。你不需要这个。你只需要将字幕叠加到视频片段上。在单击 “Stream” 按钮之前，请检查生成的流输出字符串并删除 “scodec=<something>” 的选项。

![Remove text from output string](http://www.dedoimedo.com/images/computers-years/2016-2/vlc-subs-remove-text.png)

### 缺少编解码器的解决方法

这是一个常见的 [bug][7]，取决于编码器的实现的实验性，如果你选择以下配置文件，你将很有可能会看到它：“Video - H.264 + AAC (MP4)”。该文件将被渲染，如果你选择了字幕，它们也会被叠加上，但没有任何音频。但是，我们可以用技巧来解决这个问题。

![AAC codec](http://www.dedoimedo.com/images/computers-years/2016-2/vlc-subs-errors-aac-codec.png)

![MP4A error](http://www.dedoimedo.com/images/computers-years/2016-2/vlc-subs-errors-mp4a.png)

一个可能的技巧是从命令行使用 “--sout-ffmpeg-strict=-2” 选项（可能有用）启动 VLC。另一个更安全的解决方法是采用无音频视频，但是带有字幕叠加，并将不带字幕的原始项目作为音频源用 Kdenlive 渲染。听上去很复杂，下面是详细步骤：

*   将现有片段（包含音频）从视频移动到音频。删除其余的。
*   或者，使用渲染过的 WebM 文件作为你的音频源。
*   添加新的片段 - 带有字幕，并且没有音频。
*   将片段放置为新视频。
*   再次渲染为 WebM。

![Repeat render](http://www.dedoimedo.com/images/computers-years/2016-2/vlc-subs-errors-kdenlive-repeat-render.jpg)

使用其他类型的音频编解码器将很有可能可用（例如 MP3），你将拥有一个包含视频、音频和字幕的完整项目。如果你很高兴没有遗漏，你可以现在上传到 Youtube 上。但是之后 ...

### Youtube 视频管理器和未知格式

如果你尝试上传非 WebM 片段（例如 MP4），则可能会收到未指定的错误，你的片段不符合媒体格式要求。我不知道为什么 VLC 会生成一个不符合 YouTube 规定的文件。但是，修复很容易。使用 Kdenlive 重新创建视频，将会生成带有所有正确的元字段和 Youtube 喜欢的文件。回到我原来的故事，我有 40 多个片段使用 Kdenlive 以这种方式创建。

P.S. 如果你的片段有有效的音频，则只需通过 Kdenlive 重新运行它。如果没有，重做视频/音频。根据需要将片段静音。最终，这就像叠加一样，除了你使用的视频来自于一个片段，而音频来自于另一个片段。工作完成。

### 更多阅读

我不想用链接重复自己或垃圾信息。在“软件与安全”部分，我有 VLC 上的片段，因此你可能需要咨询。前面提到的关于 VLC 和字幕的文章已经链接到大约六个相关教程，涵盖了其他主题，如流媒体、日志记录、视频旋转、远程文件访问等等。我相信你可以像专业人员一样使用搜索引擎。

### 总结

我希望你觉得本指南有帮助。它涵盖了很多，我试图使其直接而简单，并解决流媒体爱好者和字幕爱好者在使用 VLC 时可能遇到的许多陷阱。这都与容器和编解码器相关，而且媒体世界几乎没有标准的事实，当你从一种格式转换到另一种格式时，有时你可能会遇到边际情况。

如果你遇到了一些错误，这里的提示和技巧应该可以至少帮助你解决一些，包括无法播放的流、丢失或重复的字幕、缺少编解码器和 Kdenlive 解决方法、YouTube 上传错误、隐藏的 VLC 命令行选项，还有一些其他东西。是的，这些对于一段文字来说是很多的。幸运的是，这些都是好东西。保重，互联网的孩子们。如果你有任何其他要求，我将来的 VLC 文章应该会涵盖，请随意给我发邮件。

干杯。

--------------------------------------------------------------------------------

via: http://www.dedoimedo.com/computers/vlc-subtitles-errors.html

作者：[Dedoimedo][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.dedoimedo.com/faq.html
[1]:https://www.youtube.com/watch?v=MpDdGOKZ3dg
[2]:https://www.youtube.com/watch?v=KHG6fXEba0A
[3]:https://www.youtube.com/watch?v=TXw5lRi97YY
[4]:https://www.youtube.com/watch?v=cDphUib5iG4
[5]:http://www.dedoimedo.com/computers/frankenstein-media.html
[6]:http://www.dedoimedo.com/computers/vlc-subtitles.html
[7]:https://trac.videolan.org/vlc/ticket/6184
