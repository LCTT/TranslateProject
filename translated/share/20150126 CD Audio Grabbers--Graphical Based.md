
CD音频抓取器——基于图形界面
================================================================================
CD音频抓取器是为了从光盘中提取（“剖出”）原始数字音频（它在一个通常被称为CDDA的格式中）并把它保存成文件或以其他形式输出而设计的。这类软件使用户能把数字音频编码成各种格式，并能下载和上传在线CD目录服务——一个在线的光盘数据库——中的光盘信息。

复制CD合法吗？在美国版权法中，把一个原始CD转换成数字文件用于个人使用在被引用时等同于‘合理使用’。然而，美国版权法并没有明确的允许或禁止拷贝私人音频CD，而且判例法还没有确立出在具体的哪种情况下可以视为合理使用。在英国版权的位置更清晰一些。从2014年开始，英国公民制造CD，MP3，DVD，蓝光和电子书的行为成为合法行为。这仅适用于这个人拥有被采集的媒体的实体，并且复制品仅用于他们个人使用。对于欧盟的其他国家，成员国可以允许私人复制这种特例。

如果你不确定在你生活的国家里版权处于什么位置，在你使用这两页文章中所列举的软件前请查询本地的版权法以确定你处在合法的一边。

在某种程度上，提取CD音轨看起来有点多余。如Spotify和Google Play Music这类流服务提供了一个巨大的以通用格式存在的音乐的库，无需采集你的CD集。但是，如果你已将收藏了一个数量巨大的CD集。能把你的CD转换成可以在便携设备如智能手机、平板和便携式MP3播放器上播放的格式仍然是个诱人的选择。

这两页文章推荐了我最喜欢的音频CD抓取器。我挑了四个最好的图形界面的音频抓取器，四个最好的控制台音频抓取器。所有这些应用程序都是在开源许可下发行的。

----------

![](http://www.linuxlinks.com/portal/content2/png/freac.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-freac.png)

fre:ac是个开源音频转换器和CD提取器，支持很多种流行格式和编码器。目前这个应用可以在MA3、MP4/M4A、WMA、Ogg Vorbis、FLAC、AAC、WAV和Bonk格式间转换。这来源于几种不同形式的LAME编码器。

#### 功能包括： ####

- 易学易用
- MP3、MP4/M4A、WMA、Ogg Vorbis、FLAC、AAC、WAV和Bonk格式转换器
- 集成了CDDB/freedb标题数据库支持的CD提取器
- 多核优化的编码器加速了现代PC上的转换速度
- 对于标签和文件名称的全Unicode支持
- 易学易用，当你需要时还提供专家级选项
- 任务列表
- 可以使用Winamp 2加入附件
- 多语言用户界面可以使用41种语言

- 网址： [freac.org][1]
- 开发人员：Robert Kausch
- 许可证： GNU GPL v2
- 版本号： 20141005

----------

![](http://www.linuxlinks.com/portal/content2/png/Audex.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Audex.png)

Audex是个简单易用的开源音频CD提取应用。虽然它还处于早期开发阶段，这个KDE桌面工具足够稳定、聪明和简单，可以使用。

助手可以给LAME、OGG Vorbis（oggenc）、FLAC、FAAC（AAC/MP4）和RIFF WAVE创建配置文件。除去这个助手，你可以定义你自己的配置文件，这意味着，Audex适用于大部分的命令行编码器。

#### 功能包括：  ####

- 可提取CDDA Paranoia
- 提取和编码同时进行
- 文件名采用本地和远程CDDB/FreeDB数据库
- 提供新的CDDB/FreeDB数据库入口
- 类似capitalize的元数据纠正工具
- 多配置文件提取（每个配置文件文件有一个命令行编码器）
- 从互联网上抓取封面并将他们存在数据库中
- 在目标目录中创建播放列表、封面和基于模板的信息文件
- 创建提取和编码协议
- 将文件传送到FTP服务器
- 支持国际化

- 网址： [kde.maniatek.com/audex][2]
- 开发人员： Marco Nelles
- 许可证： GNU GPL v3
- 版本号： 0.79

----------

![](http://www.linuxlinks.com/portal/content2/png/SoundJuicer.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-SoundJuicer.png)

Sound Juicer是个使用GTK+和GStreamer的轻量级CD提取器。它从CD中提取音频并把它转换成音频文件。Sound Juicer还可以直接播放CD中的音轨，在提取前提供预览。

由于GStreamer插件它支持任何音频编码，包括 MP3、Ogg Vorbis、FLAC和未压缩的PCM格式。

它是GNOME桌面环境已建成的一部分。

#### 功能包括：  ####

- 自动通过CDDB给音轨加标签
- 可编码成ogg/vorbis、FLAC和原始WAV
- 编码路径的设置很简单
- 多种流派
- 国际化支持

- 网址：[burtonini.com][3]
- 开发人员： Ross Burton
- 许可证：GNU GPL v2
- 版本号：3.14

----------

![](http://www.linuxlinks.com/portal/content2/png/ripperX.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-ripperX.png)

ripperX是个开源的图形交互界面，用于提取CD音轨并把他们编码成Ogg、MP2、MP3或FLAC格式。它的目的是容易使用，只需要点几下鼠标就能转换整张专辑。它支持在CDDB寻找专辑和音轨信息。

他使用cdparanoia把CD音轨转换（也就是“提取”）成WAV文件，然后访问Vorbis/Ogg编码器oggenc把WAV文件转换成OGG文件。它还可以访问flac让WAV文件有无损压缩的表现，制成FLAC文件。

#### 功能包括： ####

- 非常简单易用
- 可以把CD音轨提取成WAV、MP3、OGG或FLAC文件
- 支持CDDB查找
- 支持ID3v2标签
- 可暂停提取进程

- 网址：[sourceforge.net/projects/ripperx][4]
- 开发人员：Marc André Tanner
- 许可证：MIT/X Consortium License
- 版本号：2.8.0

--------------------------------------------------------------------------------

转自：http://www.linuxlinks.com/article/20150125043738417/AudioGrabbersGraphical.html

作者：Frazer Kline 
译者：[H-mudcup](https://github.com/H-mudcup)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.freac.org/
[2]:http://kde.maniatek.com/audex/
[3]:http://burtonini.com/blog/computers/sound-juicer
[4]:http://sourceforge.net/projects/ripperx/
