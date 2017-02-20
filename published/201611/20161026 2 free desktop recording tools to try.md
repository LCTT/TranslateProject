两款免费的 Linux 桌面录制工具：SimpleScreenRecorder 和 Kazam
====

> 桌面录制工具可以帮做我们快速高效的制作教学视频和在线示范。

![2 free desktop recording tools to try: SimpleScreenRecorder and Kazam](https://opensource.com/sites/default/files/styles/image-full-size/public/images/education/EDU_OSDC_BYU_520x292_FINAL.png?itok=vBAPsrhh)

一图胜千言，但一段视频演示则可以让你不用大费口舌。我是一个“视觉学习者”，亲眼目睹一件事情的发生对我的学习大有裨益。我也曾观察发现，如果学生实际看到应用程序的设置流程或者代码的编写过程，他们就能从中受益良多。所以，录屏工具是制作教学视频的绝佳工具。在本文中我将介绍一下两款开源桌面录制工具： [SimpleScreenRecorder][4] 和 [Kazam][3]。

### SimpleScreenRecorder

使用 SimpleScreenRecorder 能够轻松录制桌面动作，它拥有直观的用户界面以及多样的编码方式，如 MP4、OGG、[Matroska][2] 或 [WebM][1] 格式。 SimpleScreenRecorder 遵从 GPL 协议发行，运行在 Linux 上。

在安装运行 SimpleScreenRecorder 后，你可以轻松选择录制整个桌面、指定窗口或者一个自定义的区域。我比较偏爱最后这种方式，因为这样我可以使我的学生把注意力集中在我想让他们注意的地方。你还可以在设置中选择是否隐藏光标、调整录制帧率（默认帧率为 30fps）、视频压缩比例或者调整音频后端（如 ALSA、JACK 或 PusleAudio）。

由于 SimpleScreenRecorder 使用了 libav/ffmpeg 库进行编码，故而支持多种文件格式和视频编码方式。可以使用不同的配置文件（编码更快的配置文件意味着更大的体积），包括 YouTube 和 1000kbps – 3000kbps 的  LiveStream。

![simplescreencast screenshot](https://opensource.com/sites/default/files/f1_1.png)

![simplescreencast screenshot](https://opensource.com/sites/default/files/f2_1.png)

配置完毕后，单击“开始录制”按钮或者使用自定义的快捷键就可以轻松开始录制屏幕啦~

![simplescreencast screenshot](https://opensource.com/sites/default/files/f3.png)

你还能在设置中开启提示音功能，它会开始录制和录制结束时给你声音的提示。屏幕录制完成后，你可以对视频文件进行编辑或者直接上传到 YouTube、Vimeo 等视频网站上。

SimpleScreenRecorder 的[官方网站][4]上还有大量说明文档，其中包括设置、录制、上传等方面的帮助手册和针对多种Linux发行版的安装说明。

### Kazam

Kazam 桌面录制工具同样是遵循 GPL 协议的软件。同时和 SimpleScreenRecorder 一样，Kazam 易于上手，界面直观。安装运行 Kazam 之后，你可以设置选择录制整个桌面、指定窗口或是一个自定义的区域。(LCTT 译注：关于自定义区域录制一部分的内容与 SimpleScreenRecorder 介绍中的内容基本相似，略过) ，你还可以选择记录鼠标的移动轨迹。我最中意 Kazam 的一点是延时录制的功能，这在制作视频教程的时候必不可少。

在“文件|设置”菜单下可以轻松对 Kazam 进行个性化设置，比如可以选择扬声器或是麦克风中的音源、关闭倒计时提示等等。

![kazam screenshot](https://opensource.com/sites/default/files/f4.png)

在设置页的第二个选项卡中可以进行视频录制设置。Kazam 默认录制帧率为 15fps，编码格式为 H264（MP4）。其它可供选择的格式有 VP8(WEBM)、HUFFYUV、Lossless JPEG 以及 RAW AVI。录制好的文件会以附加一个预设的前缀来命名，并自动保存在默认目录下，你可以随时修改这些设置。

![kazam screenshot](https://opensource.com/sites/default/files/f5.png)

设置屏幕截图同样很简单。你可以选择 Nikon D80 或 Canon 7D 的快门音效，也可以干脆关掉他们。截图文件是自动存放的。除非你关闭这一功能。

![](https://opensource.com/sites/default/files/f6.png)

录制好的视频将会存储在你选定的目录下，随时可以上传到你喜欢的视频分享网站或是教程网站上。

是时候利用 Linux 和录屏工具让你的课堂焕然一新了！如果你还有其他的屏幕录制工具或是使用技巧，记得在评论里与我交流哦~

--------------------------------------------------------------------------------

via: https://opensource.com/education/16/10/simplescreenrecorder-and-kazam

作者：[Don Watkins][a]
译者：[HaohongWANG](https://github.com/HaohongWANG)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[1]:https://www.webmproject.org/
[2]:https://www.matroska.org/technical/whatis/index.html
[3]:https://launchpad.net/kazam
[4]:http://www.maartenbaert.be/simplescreenrecorder/
