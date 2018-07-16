在 Ubuntu 桌面上显示歌词
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/display_lyrics_desktop_Ubuntu.jpeg)

除了免费的流媒体音乐外,我最喜欢[Spotify][1]的地方就是它的歌词插件了。有时候我听不懂一首歌里面的所有歌词，尤其是rap。[TuneWiki][2]插件在这种情况下就派得上用场了。但TuneWiki仅有支持Windows和iTune的插件，那我们在linux桌面上有什么选择呢？

如果你使用过一段时间Linux桌面，你也许听过[OSD Lyrics][3]。它是一个显示桌面歌词的小程序。你可以借助一些音乐播放器来使用它，比如 Rythmbox，[Banshee][4]，[Clementine][5]等等。

### 在Ubuntu 14.04和Linux mint 17上安装OSD Lyrics ###

两年以前 OSD Lyrics 它的官方仓库还在积极地维护，但现在对它的开发已经停止了。尽管这个PPA已经不可用，但可以通过网络下载OSD Lyrics的安装包。虽然这些安装执行文件最初是为 Ubuntu 12.02 设计的，但这些文件也能在 Ubuntu 14.04 上良好地工作。我们一起看看怎么在 Ubuntu 14.04 和 Linux mint 17 上安装OSD Lyrics。

[前往下载页下载OSDLyrics][6]，根据你是使用[32位还是64位的ubuntu][7]来下载相应的.deb 文件。你会在网页的上方找到这些文件。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/OSD_Lyrics_Download.jpeg)

下载完成后，双击它通过使用Ubuntu软件中心来安装。另外，你也可以使用[Gdebi ][8]来快速地安装.deb安装包。

### 怎样在 Ububtu 和 linux mnit 上使用 OSD Lyrics 显示歌词 ###

安装完成后，你可以从Unity Dash运行OSD Lyrics :

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Open_OSD_Lyrics_Ubuntu.jpeg)

首次运行时，OSD Lyrics会检测你的系统中能被它支持的播放器。你可以设定一个默认播放器，以后当你运行OSD Lyrics时它就会自动启动 。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/OSD_Lyrics_Default_Player.jpeg)

有一件事值得注意，那就是OSD Lyrics不像[Shazam][9]等软件一样，它不是通过音频来寻找歌词，而是通过比如名称，专辑，艺术家等信息来关联音乐文件。所以你得确保你的音乐文件的来源正当，或者是你得保持你的音乐文件的信息是正确并且是已经更新后的。

如果OSD Lyrics辨认出了音乐文件，它就会用卡拉OK格式在桌面上显示歌词了:（译者注：OSD Lyrics可以自动在千千静听和虾米歌词站点在线下载歌词，这对我们中文用户来说是个福音）

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Dsiplay_Lyrics_Ubuntu.jpeg)

OSD Lyrics有大量设置选项，你可以改变歌词字体，文字大小等等。

你认为 OSD Lyrics 怎么样？你还使用其它歌词插件吗？欢迎您和我们分享。

-------------------------------------------------------------------------------- 

via: http://itsfoss.com/display-song-lyrics-desktop-ubuntu-1404/

译者：[Love-xuan](https://github.com/Love-xuan) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/install-spotify-ubuntu-1404/
[2]:http://www.tunewiki.com/
[3]:https://code.google.com/p/osd-lyrics
[4]:http://banshee.fm/
[5]:https://www.clementine-player.org/
[6]:https://code.google.com/p/osd-lyrics/downloads/list
[7]:http://itsfoss.com/how-to-know-ubuntu-unity-version/
[8]:http://itsfoss.com/install-deb-files-easily-and-quickly-in-ubuntu-12-10-quick-tip/
[9]:http://www.shazam.com/
