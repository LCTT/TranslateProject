How To Download Videos Using youtube-dl In Linux
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Download-YouTube-Videos.jpeg)

I know you have already seen [how to download YouTube videos][1]. But those tools were mostly GUI ways. I am going to show you how to download YouTube videos via terminal using youtube-dl.

### [youtube-dl][2] ###

youtube-dl is a Python based small command-line tool that allows to download videos from YouTube.com, Dailymotion, Google Video, Photobucket, Facebook, Yahoo, Metacafe, Depositfiles and few more similar sites. It written in pygtk and requires Python interpreter to run this program, it’s not platform restricted. It should run on any Unix, Windows or in Mac OS X based systems.

The youtube-dl tool supports resuming interrupted downloads. If youtube-dl is killed (for example by Ctrl-C or due to loss of Internet connectivity) in the middle of download, you can simply re-run it with the same YouTube video url. It will automatically resume the unfinished download, as long as a partial download is present in the current directory. Which means, you don’t need a [download][3] manager for resuming downloads.

#### Installing youtube-dl ####

If you are running Ubuntu based Linux distribution, you can install it using this command:

    sudo apt-get install youtube-dl

For any Linux distribution, you can quickly install youtube-dl on your system through the command line interface with:

    sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O/usr/local/bin/youtube-dl

After fetching the file, you need to set a executable permission on the script to execute properly.

    sudo chmod a+rx /usr/local/bin/youtube-dl

#### Use YouTube-DL to Download Videos: ####

To download a video file, simply run the following command. Where “VIDEO_URL” is the url of the video that you want to download.

    youtube-dl VIDEO_URL

#### Download YouTube Videos in Multiple Formats: ####

These days YouTube videos  have different resolutions, you first need to check available video formats of a given YouTube video. For that run youtube-dl with “-F” option. It will show you a list of available formats.

    youtube-dl -F http://www.youtube.com/watch?v=BlXaGWbFVKY

It’s output will be like:

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

Now among the available video formats, choose one that you like. For example, if you want to download it in MP4 version, you should use:

    youtube-dl -f 17 http://www.youtube.com/watch?v=BlXaGWbFVKY

#### Download subtitles of videos using youtube-dl ####

First check if there are subtitles available for the video. To list all subs for a video, use the command beelow:

    youtube-dl --list-subs https://www.youtube.com/watch?v=Ye8mB6VsUHw

To download all subs, but not the video:

    youtube-dl --all-subs --skip-download https://www.youtube.com/watch?v=Ye8mB6VsUHw

#### Download entire playlist ####

To download a playlist, simply run the following command. Where “playlist_url” is the url of the playlist that ou want to download.

    youtube-dl -cit playlist_url

youtube-dl is a versatile command line tool and provides a number of functionalities. No wonder it is such a popular command line tool.

--------------------------------------------------------------------------------

via: http://itsfoss.com/download-youtube-linux/

作者：[alimiracle][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/ali/
[1]:http://itsfoss.com/download-youtube-videos-ubuntu/
[2]:https://rg3.github.io/youtube-dl/
[3]:http://itsfoss.com/xtreme-download-manager-install/