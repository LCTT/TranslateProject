用"Avconv"工具录制你的桌面视频和音频
================================================================================
**Libav**是一款跨平台的工具库,能够用来处理多媒体文件,流和协议,最初是fork自ffmpeg.Libav包含了子工具,比如:

- **Avplay**: 一款视频音频播放器.
- **Avconv**: 能够记录多个设备输入源的一个多媒体转换器和视频音频录制器.
- **Avprobe**: 一个连接多媒体文件流并且返回关于这个文件流的统计信息的工具.
- **Libavfilter**:一个Libav工具的过滤器(filtering)API.

接下来,我们就要展示如何通过'Avconv'程序在**Debian/Ubuntu/Linux Mint**发行版上录制Linux桌面视频音频.
### 步奏 1:下载 Avconv 工具 ###

**1.** **avconv**是 “**libav-tools**” 的一部分, 可以通过官方的基于debian的仓库下载,比如Mint,Ubuntu.输入下面命令即可:

    $ sudo apt-get update
    $ sudo apt-get install libav-tools

![Install Avconv Tool](http://www.tecmint.com/wp-content/uploads/2014/11/Install-avconv-tool.jpeg)

下载Avconv工具

**注意**: 如果从默认仓库下载的话 ‘**avconv**‘ 的版本可能比较老. 因此我们推荐你拉取最新的git官方版本.

    $ sudo apt-get install yasm
    $ git clone git://git.libav.org/libav.git
    $ cd libav
    $ ./configure
    $ make
    $ sudo make install

**注意**: 你必须运行 “**./configure –help**” 去列出所有的可选配置选项并且安装相应的解码器和库,你还需要做很多去下载依赖.
同样注意,如果你是从源代码编译的,就需要使用**sudo avconv**而不是**avconv**来运行这个工具.

### 步奏 2:开启桌面录制 ###

**2.**你已经准备好了,现在可以通过运行下面的命令录制你的视频了:

    $ avconv -f x11grab -r 25 -s 1920x1080 -i :0.0 -vcodec libx264 -threads 4 $HOME/output.avi

简单解释一下这个命令:

- **avconv -f x11grab** 默认从x服务捕捉画面.
- **-r 25** 这是视频的帧率,可以自行设置.
- **-s 1920×1080** 是你的画面分辨率,要设置成你当前画面的分辨率,这一点非常重要.
- **-i :0.0** 记录的起点,设置成这样就可以了.
- **-vcodec libx264** 我们用来录制视频的解码器.
- **-threads 4**线程数, 可以根据情况更改.
- **$HOME/output** 目标文件路径.
- **.avi**视频格式,可以转换成 “flv”, “mp4″, “wmv”, “mov”, “mkv”.

**3.**在运行命令之后,录像机就会打开,并且在terminal上自动运行,按"Ctrl+C"建来终止. 

![Record Desktop Screen](http://www.tecmint.com/wp-content/uploads/2014/11/Record-Desktop-Screen.jpeg)

录制桌面视频

**4.** 你可能需要使用VLC或者其他的播放器,或者你需要使用"avplay",这是一个Libav包里的播放器.

    $ avplay $HOME/output.avi

**注意:** 别忘了替换输出文件的路径,录制效果还是很好的.

![Play Recorded Video](http://www.tecmint.com/wp-content/uploads/2014/11/Play-Recorded-Video.jpeg)

播放录制的文件

这有一段我用 “**avconv**” 录制的视频.

[视频地址](http://www.youtube.com/embed/g1FEh4wByGE)

<iframe width="640" height="380" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/g1FEh4wByGE"></iframe>

### 步奏 3: 开始桌面音频和视频录制 ###

**5.** 如果想录制音频,先运行这个命令,列出所有的音频输入源:

    $ arecord -l

如果结果是这样的

![Check Audio Input](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Audio-Input.png)

检查音频输入源

在我的例子中,我只有一个音频输入源,所以数量是**1**,这就是为什么我使用下面的命令来捕捉我的视频以及麦克风的音频了.

    $ avconv -f alsa -i hw:1 -f x11grab -r 25 -s 1920x1080 -i :0.0 -vcodec libx264 -threads 4 output-file2.avi

看黄色的部分:那是我修改了的地方,下面做个简短的解释:
- **-f** alsa 一个从alsa设备捕捉声音的选项.
- **-i** hw:1 是一个从 “hw:1” 设备捕捉画面的选项,这个设备是我电脑上仅有的一个设备.

**注意**: 别忘了替换 “**1**”,如果你想用**arecord -l**显示的**1**之外的设备的话.

结束录制, 再来一次“**Ctrl + C**” 就可以.

### 步奏 4:开始桌面音频的录制 ###

**6.**  如果只想录制音频的话,使用下面的命令.

    $ avconv -f alsa -i hw:1 out.wav

**7.** 替换成 **.mp3** Libav支持的格式都可以,播放 **out.wav**就能听到你自己的声音了

![Record Desktop Audio](http://www.tecmint.com/wp-content/uploads/2014/11/Record-Desktop-Audio.png)

录制桌面音频

###最后 ###

“**avconv**” 工具可以用来做很多其他事情,不仅仅是录制桌面视频,更多的教程和文档请移步到官网.

- [https://libav.org/avconv.html][1]

你对"avconv"的体验如何,你使用过其他工具录制桌面视频么？在评论里面和我们分享吧.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/record-ubuntu-desktop-screen-using-avconv/

作者：[Hanny Helal][a]
译者：[ggaaooppeenngg](https://github.com/ggaaooppeenngg)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/hannyhelal/
[1]:https://libav.org/avconv.html
