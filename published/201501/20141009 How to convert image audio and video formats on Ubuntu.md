如何在Ubuntu上转换图像、音频和视频格式
================================================================================

如果你的工作中需要接触到各种不同编码格式的图像、音频和视频，那么你很有可能正在使用多个工具来转换这些多种多样的媒体格式。如果存在一个能够处理所有图像/音频/视频格式的多合一转换工具，那就太好了。

[Format Junkie][1] 就是这样一个多合一的媒体转换工具，它有着极其友好的用户界面。更棒的是它是一个免费软件。你可以使用 Format Junkie 来转换几乎所有的流行格式的图像、音频、视频和归档文件（或称压缩文件），所有这些只需要简单地点击几下鼠标而已。

### 在Ubuntu 12.04, 12.10 和 13.04 上安装 Format Junkie ###

Format Junkie 可以通过 Ubuntu PPA format-junkie-team 进行安装。这个PPA支持Ubuntu 12.04, 12.10 和 13.04。在以上任意一种Ubuntu版本中安装Format Junkie的话，简单的执行以下命令即可：

    $ sudo add-apt-repository ppa:format-junkie-team/release
    $ sudo apt-get update
    $ sudo apt-get install formatjunkie
    $ sudo ln -s /opt/extras.ubuntu.com/formatjunkie/formatjunkie /usr/bin/formatjunkie

### 将 Format Junkie 安装到 Ubuntu 13.10 ###

如果你正在运行Ubuntu 13.10 (Saucy Salamander)，你可以按照以下步骤下载 .deb 安装包来进行安装。由于Format Junkie 的 .deb 安装包只有很少的依赖包，所以使用 [gdebi deb installer][2] 来安装它。

在32位版Ubuntu 13.10上：

    $ wget https://launchpad.net/~format-junkie-team/+archive/release/+files/formatjunkie_1.07-1~raring0.2_i386.deb
    $ sudo gdebi formatjunkie_1.07-1~raring0.2_i386.deb
    $ sudo ln -s /opt/extras.ubuntu.com/formatjunkie/formatjunkie /usr/bin/formatjunkie 

在32位版Ubuntu 13.10上：

    $ wget https://launchpad.net/~format-junkie-team/+archive/release/+files/formatjunkie_1.07-1~raring0.2_amd64.deb
    $ sudo gdebi formatjunkie_1.07-1~raring0.2_amd64.deb
    $ sudo ln -s /opt/extras.ubuntu.com/formatjunkie/formatjunkie /usr/bin/formatjunkie 

### 将 Format Junkie 安装到 Ubuntu 14.04 或之后版本 ###

现有可供使用的官方 Format Junkie .deb 文件需要 libavcodec-extra-53，不过它从Ubuntu 14.04开始就已经过时了。所以如果你想在Ubuntu 14.04或之后版本上安装Format Junkie，可以使用以下的第三方PPA来代替。

    $ sudo add-apt-repository ppa:jon-severinsson/ffmpeg
    $ sudo add-apt-repository ppa:noobslab/apps
    $ sudo apt-get update
    $ sudo apt-get install formatjunkie 

### 如何使用 Format Junkie ###

安装完成后，只需运行以下命令即可启动 Format Junkie：

    $ formatjunkie 

#### 使用 Format Junkie 来转换音频、视频、图像和归档格式 ####

就像下方展示的一样，Format Junkie 的用户界面简单而且直观。在顶部的音频、视频、图像和iso媒体四个标签当中点击你需要的那个。你可以根据需要添加任意数量的文件用于批量转换。添加文件后，选择输出格式，直接点击 "Start Converting" 按钮进行转换。

![](http://farm9.staticflickr.com/8107/8643695905_082b323059.jpg)

Format Junkie支持以下媒体格式间的转换：

- **Audio**: mp3, wav, ogg, wma, flac, m4r, aac, m4a, mp2.
- **Video**: avi, ogv, vob, mp4, 3gp, wmv, mkv, mpg, mov, flv, webm.
- **Image**: jpg, png, ico, bmp, svg, tif, pcx, pdf, tga, pnm.
- **Archive**: iso, cso. 

#### 用 Format Junkie 进行字幕编码 ####

除了媒体转换，Format Junkie 可提供了字幕编码的图形界面。实际的字幕编码是由MEncoder来完成的。为了使用Format Junkie的字幕编码接口，首先你需要安装MEencoder。

    $ sudo apt-get install mencoder

然后点击Format Junkie 中的 "Advanced"标签。选择 AVI/subtitle 文件来进行编码，如下所示：

![](http://farm9.staticflickr.com/8100/8644791396_bfe602cd16.jpg)

总而言之，Format Junkie 是一个非常易于使用和多才多艺的媒体转换工具。但也有一个缺陷，它不允许对转换进行任何定制化（例如：比特率，帧率，采样频率，图像质量，尺寸）。所以这个工具推荐给正在寻找一个简单易用的媒体转换工具的新手使用。

喜欢这篇文章吗？请在下面发表评论吧。多谢！

--------------------------------------------------------------------------------

via: http://xmodulo.com/how-to-convert-image-audio-and-video-formats-on-ubuntu.html

作者：[Dan Nanni][a]
译者：[Ping](https://github.com/mr-ping)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://launchpad.net/format-junkie
[2]:http://xmodulo.com/how-to-install-deb-file-with-dependencies.html
