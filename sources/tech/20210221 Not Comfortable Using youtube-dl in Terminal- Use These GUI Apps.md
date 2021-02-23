[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Not Comfortable Using youtube-dl in Terminal? Use These GUI Apps)
[#]: via: (https://itsfoss.com/youtube-dl-gui-apps/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Not Comfortable Using youtube-dl in Terminal? Use These GUI Apps
======

If you’ve been following us, you probably already know that [youtube-dl project was taken down temporarily by GitHub][1] to comply with a request.

Considering that it’s now restored and completely accessible, it is safe to say that it not an illegal tool out there.

It is a very useful command-line tool that lets you [download videos from YouTube][2] and some other websites. [Using youtube-dl][3] is not that complicated but I understand that using commands for such tasks is not everyone’s favorite way.

The good thing is that there are a few applications that provide GUI frontend for youtube-dl tool.

### Prerequisites for Using youtube-dl GUI Apps

Before you try some of the options mentioned below, you may need to have youtube-dl and [FFmpeg][4] installed on your system to be able to download / choose different format to download.

You can follow our [complete guide on using ffmpeg][5] to set it up and explore more about it.

To install [youtube-dl][6], you can type in the following commands in your Linux terminal:

```
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
```

Once you download the latest version, you just need to make it executable and ready for use by typing in:

```
sudo chmod a+rx /usr/local/bin/youtube-dl
```

You can also follow the [official setup instructions][7] if you need other methods to install it.

### Youtube-dl GUI Apps

Most download managers on Linux also allow you to download videos from YouTube and other websites. However, the youtube-dl GUI apps might have additional options like extracting only audio or downloading the videos in a particular resolution and video format.

Do note that the list below is in no particular order of ranking. You may choose what suits your requirements.

#### 1\. AllTube Download

![][8]

**Key Features:**

  * Web GUI
  * Open-Source
  * Self-host option



AllTube is an open-source web GUI that you can access by visiting <https://alltubedownload.net/>

If you choose to utilize this, you do not need to install youtube-dl or ffmpeg on your system. It offers a simple user interface where you just have to paste the URL of the video and then proceed to choose your preferred file format to download. You can also choose to deploy it on your server.

Do note that you cannot extract the MP3 file of a video using this tool, it is only applicable for videos. You can explore more about it through their [GitHub page][9].

[AllTube Download Web GUI][10]

#### 2\. youtube-dl GUI

![][11]

**Key Features:**

  * Cross-platform
  * Displays estimated download size
  * Audio and video download option available



A useful cross-platform GUI app made using electron and node.js. You can easily download both audio and video along with the option to choose various file formats available.

You also get the ability to download parts of a channel or playlist, if you want. The estimated download size definitely comes in handy especially if you are downloading high quality video files.

As mentioned, it is also available for Windows and macOS. And, you will get an AppImage file available for Linux in its [GitHub releases][12].

[Youtube-dl GUI][13]

#### 3\. Videomass

![][14]

**Key Features:**

  * Cross-platform
  * Convert audio/video format
  * Multiple URLs supported
  * Suitable for users who also want to utilize FFmpeg



If you want to download video or audio from YouTube and also convert them to your preferred format, Videomass can be a nice option.

To make this work, you need both youtube-dl and ffmpeg installed on your system. You can easily add multiple URLs to download and also set the output directory as you like.

![][15]

You also get some advanced settings to disable youtube-dl, change file preferences, and a few more handy options as you explore.

It offers a PPA for Ubuntu users and an AppImage file for any other Linux distribution. Explore more about it in its [GitHu][16][b][16] [page][16].

[Videomass][17]

#### Additional Mention: Haruna Video Player

![][18]

**Key Features:**

  * Play/Stream YouTube videos



Haruna video player is originally a front-end for [MPV][19]. Even though you cannot download YouTube videos using it, you can watch/stream YouTube videos through youtube-dl.

You can explore more about the video player in our [original article][20] about it.

### Wrapping Up

Even though you may find more youtube-dl GUIs on GitHub and other platforms, most of them do not function well and end up showing multiple errors or aren’t actively developed anymore.

[Tartube][21] is one such option that you can try, but it may not work as expected. I tested it with Pop!_OS and on Ubuntu MATE 20.04 (fresh install). Every time I try to download something, it fails, no matter what I do (even with youtube-dl and ffmpeg installed in the system).

So, my personal favorite seems to be the web GUI ([AllTube Download][9]) that does not depend on anything installed on your system and can be self-hosted as well.

Let me know in the comments what works for you best and if I’ve missed any of your favorite options.

--------------------------------------------------------------------------------

via: https://itsfoss.com/youtube-dl-gui-apps/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/youtube-dl-github-takedown/
[2]: https://itsfoss.com/download-youtube-videos-ubuntu/
[3]: https://itsfoss.com/download-youtube-linux/
[4]: https://ffmpeg.org/
[5]: https://itsfoss.com/ffmpeg/#install
[6]: https://youtube-dl.org/
[7]: https://ytdl-org.github.io/youtube-dl/download.html
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/alltube-download.jpg?resize=772%2C593&ssl=1
[9]: https://github.com/Rudloff/alltube
[10]: https://alltubedownload.net/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/youtube-dl-gui.jpg?resize=800%2C548&ssl=1
[12]: https://github.com/jely2002/youtube-dl-gui/releases/tag/v1.8.7
[13]: https://github.com/jely2002/youtube-dl-gui
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/videomass.jpg?resize=800%2C537&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/videomass-1.jpg?resize=800%2C542&ssl=1
[16]: https://github.com/jeanslack/Videomass
[17]: https://jeanslack.github.io/Videomass/
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/haruna-video-player-dark.jpg?resize=800%2C512&ssl=1
[19]: https://mpv.io/
[20]: https://itsfoss.com/haruna-video-player/
[21]: https://github.com/axcore/tartube
