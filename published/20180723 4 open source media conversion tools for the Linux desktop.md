Linux 桌面中 4 个开源媒体转换工具
======
> 使用这些易用的工具来将音视频文件从一种格式转换为另一种格式。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_newmedia.png?itok=imgehG2v)

啊，有这么多的文件格式，特别是音频和视频格式，如果你不认识这个文件扩展名或者你的播放器无法播放那个格式，或者你想使用一种开放格式，那就需要花点心思了。

那么，Linux 用户可以做些什么呢？当然是去使用 Linux 桌面的众多开源媒体转换工具之一。我们来看看其中的四个。

### Gnac

![](https://opensource.com/sites/default/files/uploads/gnac.png)

[Gnac][1] 是我最喜欢的音频转换器之一，已经存在很多年了。它易于使用，功能强大，并且它做得很好 —— 任何一流的程序都应该如此。

有多简单？单击工具栏按钮添加一个或多个要转换的文件，选择要转换的格式，然后单击**Convert**。转换很快，而且很干净。

有多强大？Gnac 可以处理 [GStreamer][2] 多媒体框架支持的所有音频格式。开箱即用，你可以在 Ogg、FLAC、AAC、MP3、WAV 和 SPX 之间进行转换。你还可以更改每种格式的转换选项或添加新格式。

### SoundConverter

![](https://opensource.com/sites/default/files/uploads/soundconverter.png)

如果在简单的同时你还要一些额外的功能，那么请看一下 [SoundConverter][3]。正如其名称所述，SoundConverter 仅对音频文件起作用。与 Gnac 一样，它可以读取 GStreamer 支持的格式，它可以输出 Ogg Vorbis、MP3、FLAC、WAV、AAC 和 Opus 文件。

通过单击 **Add File** 或将其拖放到 SoundConverter 窗口中来加载单个文件或整个文件夹。单击 **Convert**，软件将完成转换。它也很快 —— 我已经在大约一分钟内转换了一个包含几十个文件的文件夹。

SoundConverter 有设置转换文件质量的选项。你可以更改文件的命名方式（例如，在标题中包含曲目编号或专辑名称），并为转换后的文件创建子文件夹。

### WinFF

![](https://opensource.com/sites/default/files/uploads/winff.png)

[WinFF][4] 本身并不是转换器。它是 FFmpeg 的图形化前端，[Tim Nugent 为此][5] 在 Opensource.com 写了篇文章。虽然 WinFF 没有 FFmpeg 的所有灵活性，但它使 FFmpeg 更易于使用，并且可以快速，轻松地完成工作。

虽然它不是这里最漂亮的程序，也不需要是。它远比可以使用要好。你可以从下拉列表中选择要转换的格式，并选择多个预设配置。最重要的是，你可以指定比特率和帧速率，要使用的音频通道数量，甚至裁剪视频的大小等选项。

转换，特别是视频，需要一些时间，但结果通常非常好。有时，转换会有点受损 —— 但往往不足以引起关注。而且，正如我之前所说，使用 WinFF 可以节省一些时间。

### Miro Video Converter

![](https://opensource.com/sites/default/files/uploads/miro-main-window.png)

并非所有视频文件都是同样创建的。有些是专有格式。有的在显示器或电视屏幕上看起来很棒但是没有针对移动设备进行优化。这就是 [Miro Video Converter][6] 可以用的地方。

Miro Video Converter 非常重视移动设备。它可以转换在 Android 手机、Apple 设备、PlayStation Portable 和 Kindle Fire 上播放的视频。它会将最常见的视频格式转换为 MP4、[WebM][7] 和 [Ogg Theora][8]。你可以[在 Miro 的网站][6]上找到支持的设备和格式的完整列表

要使用它，可以将文件拖放到窗口中，也可以选择要转换的文件。然后，单击“Format”菜单以选择转换的格式。你还可以单击 Apple、Android 或其他菜单以选择要转换文件的设备。Miro Video Converter 会为设备屏幕分辨率调整视频大小。

你有最喜欢的 Linux 媒体转换程序吗？请留下评论，随意分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/media-conversion-tools-linux

作者：[Scott Nesbitt][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:http://gnac.sourceforge.net
[2]:http://www.gstreamer.net/
[3]:http://soundconverter.org/
[4]:https://www.biggmatt.com/winff/
[5]:https://opensource.com/article/17/6/ffmpeg-convert-media-file-formats
[6]:http://www.mirovideoconverter.com/
[7]:https://en.wikipedia.org/wiki/WebM
[8]:https://en.wikipedia.org/wiki/Ogg_theora
