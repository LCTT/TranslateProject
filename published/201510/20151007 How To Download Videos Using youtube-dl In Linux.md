如何在 Linux 中使用 youtube-dl 下载视频
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Download-YouTube-Videos.jpeg)

我知道你已经看过[如何下载 YouTube 视频][1]。但那些工具大部分都采用图形用户界面的方式。我会向你展示如何通过终端使用 youtube-dl 下载 YouTube 视频。

### youtube-dl ###

[youtube-dl][2] 是基于 Python 的命令行小工具，允许你从 YouTube.com、Dailymotion、Google Video、Photobucket、Facebook、Yahoo、Metacafe、Depositfiles 以及其它一些类似网站中下载视频。它是用 pygtk 编写的，需要 Python 解析器来运行，对平台要求并不严格。它能够在 Unix、Windows 或者 Mac OS X 系统上运行。 

youtube-dl 支持断点续传。如果在下载的过程中 youtube-dl 被杀死了（例如通过 Ctrl-C 或者丢失网络连接），你只需要使用相同的 YouTube 视频 URL 再次运行它。只要当前目录中有下载的部分文件，它就会自动恢复没有完成的下载，也就是说，你不需要[下载管理器][3]来恢复下载。

#### 安装 youtube-dl ####

如果你运行的是基于 Ubuntu 的 Linux 发行版，你可以使用下面的命令安装：

    sudo apt-get install youtube-dl

对于任何 Linux 发行版，你都可以通过下面的命令行在你的系统上快速安装 youtube-dl：

    sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O/usr/local/bin/youtube-dl

获取到该文件后，为了能正常执行你需要给脚本设置可执行权限。

    sudo chmod a+rx /usr/local/bin/youtube-dl

#### 使用 youtube-dl 下载视频： ####

要下载一个视频文件，只需要运行下面的命令。其中 “VIDEO_URL” 是你想要下载视频的 url。

    youtube-dl VIDEO_URL

#### 以多种格式下载 YouTube 视频： ####

现在 YouTube 视频有不同的分辨率，首先你需要检查指定的 YouTube 视频可用的视频格式。可以使用 “-F” 选项运行 youtube-dl。它会向你显示出可用的格式。

    youtube-dl -F http://www.youtube.com/watch?v=BlXaGWbFVKY

它的输出类似于：

    Setting language
    BlXaGWbFVKY: Downloading video webpage
    BlXaGWbFVKY: Downloading video info webpage
    BlXaGWbFVKY: Extracting video information
    Available formats:
    37      :       mp4     [1080×1920]
    46      :       webm    [1080×1920]
    22      :       mp4     [720×1280]
    45      :       webm    [720×1280]
    35      :       flv     [480×854]
    44      :       webm    [480×854]
    34      :       flv     [360×640]
    18      :       mp4     [360×640]
    43      :       webm    [360×640]
    5       :       flv     [240×400]
    17      :       mp4     [144×176]

在可用的视频格式中，选择你需要的一种。例如，如果你想下载 MP4 格式的，你可以：

    youtube-dl -f 17 http://www.youtube.com/watch?v=BlXaGWbFVKY

#### 使用 youtube-dl 下载视频字幕 ####

首先检查是否有可用的视频字幕。使用下面的命令列出视频所有可用的字幕：

    youtube-dl --list-subs https://www.youtube.com/watch?v=Ye8mB6VsUHw

下载所有字幕，但不包括视频：

    youtube-dl --all-subs --skip-download https://www.youtube.com/watch?v=Ye8mB6VsUHw

#### 下载整个播放列表 ####

运行下面的命令下载整个播放列表。其中 “playlist_url” 是你希望下载的播放列表的 url。

    youtube-dl -cit playlist_url

youtube-dl 是一个多功能的命令行工具，它提供了很多功能。难怪这个命令行工具这么流行。

--------------------------------------------------------------------------------

via: http://itsfoss.com/download-youtube-linux/

作者：[alimiracle][a]
译者：[ictlyh](http://mutouxiaogui.cn/blog/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/ali/
[1]:http://itsfoss.com/download-youtube-videos-ubuntu/
[2]:https://rg3.github.io/youtube-dl/
[3]:https://linux.cn/article-6209-1.html