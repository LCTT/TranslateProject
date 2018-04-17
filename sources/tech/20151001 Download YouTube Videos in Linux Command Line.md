Download YouTube Videos in Linux Command Line
======
**Brief: Easily download YouTube videos in Linux using youtube-dl command line tool. With this tool, you can also choose video format and video quality such as 1080p or 4K.**

![](https://itsfoss.com/wp-content/uploads/2015/10/Download-YouTube-Videos.jpeg)

I know you have already seen [how to download YouTube videos][1]. But those tools were mostly GUI ways. I am going to show you how to download YouTube videos in Linux terminal using youtube-dl.

### Install youtube-dl to download YouTube videos in Linux terminal

[youtube-dl][2] is a Python-based small command-line tool that allows downloading videos from [YouTube][3], [Dailymotion][4], Photobucket, Facebook, Yahoo, Metacafe, Depositfiles and few more similar sites. It is written in pygtk and requires Python interpreter to run this program, it’s not platform restricted. It should run on any Unix, Windows or in Mac OS X based systems.

The youtube-dl tool supports resuming interrupted downloads. If youtube-dl is killed (for example by Ctrl-C or due to loss of Internet connectivity) in the middle of the download, you can simply re-run it with the same YouTube video URL. It will automatically resume the unfinished download, as long as a partial download is present in the current directory. Which means you don’t need [download managers in Linux][5] just for resuming downloads.

#### youtube-dl features

This tiny tool has so many features that it won’t be an exaggeration to call it the best YouTube downloader for Linux.

  * Download videos from not only YouTube but other popular video websites like Dailymotion, Facebook etc
  * Allows downloading videos in several available video formats such as MP4, WebM etc.
  * You can also choose the quality of the video being downloaded. If the video is available in 4K, you can download it in 4K, 1080p, 720p etc
  * Automatical pause and resume of video downloads.
  * Allows to bypass YouTube geo-restrictions



Downloading videos from websites could be against their policies. It’s up to you if choose to download videos.

#### How to install youtube-dl

youtube-dl is a popular program and is available in the default repositories of most Linux distributions, if not all. You can use the standard way of installing packages in your distribution to install youtube-dl. I’ll still show some commands for the sake of it.

If you are running Ubuntu-based Linux distribution, you can install it using this command:
```
sudo apt install youtube-dl

```

For other Linux distribution, you can quickly install youtube-dl on your system through the command line interface with:
```
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O/usr/local/bin/youtube-dl

```

After fetching the file, you need to set a executable permission on the script to execute properly.
```
sudo chmod a+rx /usr/local/bin/youtube-dl

```

#### Using YouTube-dl for downloading videos:

To download a video file, simply run the following command. Where “VIDEO_URL” is the URL of the video that you want to download.
```
youtube-dl<video_url>

```

#### Download YouTube videos in various formats and quality size

These days YouTube videos have different resolutions, you first need to check available video formats of a given YouTube video. For that run youtube-dl with “-F” option. It will show you a list of available formats.
```
youtube-dl -F <video_url>

```

Its output will be like:
```
  Setting language
 BlXaGWbFVKY: Downloading video webpage
 BlXaGWbFVKY: Downloading video info webpage
 BlXaGWbFVKY: Extracting video information
Available formats:
37      :       mp4     [1080x1920]
46      :       webm    [1080x1920]
22      :       mp4     [720x1280]
45      :       webm    [720x1280]
35      :       flv     [480x854]
44      :       webm    [480x854]
34      :       flv     [360x640]
18      :       mp4     [360x640]
43      :       webm    [360x640]
5       :       flv     [240x400]
17      :       mp4     [144x176]

```

Now among the available video formats, choose one that you like. For example, if you want to download it in MP4 version and 1080 pixel, you should use:
```
youtube-dl -f 37<video_url>

```

#### Download subtitles of videos using youtube-dl

First, check if there are subtitles available for the video. To list all subs for a video, use the command below:
```
youtube-dl --list-subs <video_url>

```

To download all subs, but not the video:
```
youtube-dl --all-subs --skip-download <video_url>

```

#### Download entire YouTube playlist

To download a playlist, simply run the following command. Where “playlist_url” is the URL of the playlist that you want to download.
```
youtube-dl -cit <playlist_url>

```

#### Download only audio from YouTube videos

If you just want to download the audio from a YouTube video, you can use the -x option to simply extract the audio file from the video.
```
youtube-dl -x <video_url>

```

The default file format is Ogg which you may not like. You can specify the file format of the audio file in the following manner:
```
youtube-dl -x --audio-format mp3 <video_url>

```

#### And a lot more can be done with youtube-dl

youtube-dl is a versatile command line tool and provides a number of functionalities. No wonder it is such a popular command line tool.

I have only shown some of the most common usages of this tool. But if you want to explore its capabilities further, please check its [manual][6].

I hope this article helped you to download YouTube videos on Linux. If you have questions or suggestions, please drop a comment below.

Article updated with inputs from Abhishek Prakash.

--------------------------------------------------------------------------------

via: https://itsfoss.com/download-youtube-linux/

作者：[alimiracle][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/ali/
[1]:https://itsfoss.com/download-youtube-videos-ubuntu/
[2]:https://rg3.github.io/youtube-dl/
[3]:https://www.youtube.com/c/itsfoss/
[4]:https://www.dailymotion.com/
[5]:https://itsfoss.com/4-best-download-managers-for-linux/
[6]:https://github.com/rg3/youtube-dl/blob/master/README.md#readme
