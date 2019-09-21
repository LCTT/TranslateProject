[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Top Open Source Video Players for Linux)
[#]: via: (https://itsfoss.com/video-players-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Top Open Source Video Players for Linux
======

_**Wondering which video player should you use on Linux? Here’s a list of top open source video players available for Linux distributions.**_

You can watch Hulu, Prime Video and/or [Netflix on Linux][1]. You can also [download videos from YouTube][2] and watch them later or if you are in a country where you cannot get Netflix and other streaming services, you may have to rely on torrent services like [Popcorn Time in Linux][3].

Watching movies/TV series or other video contents on computers is not an ‘ancient tradition’ yet. Usually, you go with the default video player that comes baked in with your Linux distribution (that could be anything).

You won’t have an issue utilizing the default player – however, if you specifically want more open-source video player choices (or alternatives to the default one), you should keep reading.

### Best Linux video players

![][4]

I have included the installation steps for Ubuntu but that shouldn’t make it the list of Ubuntu video players. These open source software should be available in any Linux distribution you are using.

Installing the software

Another note for Ubuntu users. You should have [universe repository enabled][5] in order to find and install these video players from the software center or by using command line. I have mentioned the commands but if you like, you can also install them from the Software Center.

_Please keep in mind that the list is in no particular order of ranking._

#### 1\. VLC Media Player

![][6]

Key Highlights:

  * Built-in codecs
  * Customization options
  * Cross-platform
  * Every video file format supported
  * Extensions available for added functionalities



[VLC Media Player][7] is unquestionably the most popular open source video player. Not just limited to Linux – but it’s a must-have video player for every platform (including Windows).

It is a quite powerful video player capable of handling a variety of file formats and codecs. You can customize the look of it by using skins and enhance the functionalities with the help of certain extensions. Other features like [subtitle synchronization][8], audio/video filters, etc, exist as well.

[VLC Media Player][7]

#### How to install VLC?

You can easily [install VLC in Ubuntu][9] from the Software Center or download it from the [official website][7].

If you’re utilizing the terminal, you will have to separately install the components as per your requirements by following the [official resource][10]. To install the player, just type in:

```
sudo apt install vlc
```

#### 2\. MPlayer

![][11]

Key Highlights:

  * Wide range of output drivers supported
  * Major file formats supported
  * Cross-platform
  * Command-line based



Yet another impressive open-source video player (technically, a video player engine). [MPlayer][12] may not offer you an intuitive user experience but it supports a wide range of output drivers and subtitle files.

Unlike others, MPlayer does not offer a working GUI (it has one, but it doesn’t work as expected). So, you will have to utilize the terminal in order to play a video. Even though this isn’t a popular choice – it works and a couple of video players that I’ll be listing below are inspired (or based) from MPlayer but with a GUI.

[MPlayer][12]

#### How to install MPlayer?

We already have an article on [installing MPlayer on Ubuntu and other Linux distros][13]. If you’re interested to install this, you should check it out.

```
sudo apt install mplayer mplayer-gui
```

#### 3\. SMPlayer

![][14]

Key Highlights:

  * Supports all major video formats
  * Built-in codecs
  * Cross-platform (Windows &amp; Linux)
  * Play ad-free YouTube video
  * Opensubtitles integration
  * UI Customization available
  * Based on MPlayer



As mentioned, SMPlayer uses MPlayer as the playback engine. So, it supports a wide range of file formats. In addition to all the basic features, it also lets you play YouTube videos from within the video player (by getting rid of the annoying ads).

If you want to know about SMPlayer a bit more – we have a separate article here: [SMPlayer in Linux][15].

Similar to VLC, it also comes baked in with codecs, so you don’t have to worry about finding codecs and installing them to make it work unless there’s something specific you need.

[SMPlayer][16]

#### How to install SMPlayer?

SMPlayer should be available in your Software Center. However, if you want to utilize the terminal, type in this:

```
sudo apt install smplayer
```

#### 4\. MPV Player

![][17]

Key Highlights:

  * Minimalist GUI
  * Video codecs built in
  * High-quality video output by video scaling
  * Cross-platform
  * YouTube Videos supported via CLI



If you are looking for a video player with a streamlined/minimal UI, this is for you. Similar to the above-mentioned video players, we also have a separate article on [MPV Player][18] with installation instructions (if you’re interested to know more about it).

Keeping that aside, it offers what you would expect from a standard video player. You can even try it on your Windows/Mac systems.

[MPV Player][19]

#### How to install MPV Player?

You will find it listed in the Software Center or Package Manager. In either case, you can download the required package for your distro from the [official download page][20].

If you’re on Ubuntu, you can type in this in the terminal:

```
sudo apt install mpv
```

#### 5\. Dragon Player

![][21]

Key Highlights:

  * Simple UI
  * Tailored for KDE
  * Supports playing CDs and DVDs



This has been specifically tailored for KDE desktop users. It is a dead-simple video player with all the basic features needed. You shouldn’t expect anything fancy out of it – but it does support the major file formats.

[Dragon Player][22]

#### How to install Dragon Player?

You will find it listed in the official repo. In either case, you can type in the following command to install it via terminal:

```
sudo apt install dragonplayer
```

#### 6\. GNOME Videos

![Totem Video Player][23]

Key Highlights:

  * A simple video player for GNOME Desktop
  * Plugins supported
  * Ability to sort/access separate video channels



The default video player for distros with GNOME desktop environment (previously known as Totem). It supports all the major file formats and also lets you take a snap while playing a video. Similar to some of the others, it is a very simple and useful video player. You can try it out if you want.

[Gnome Videos][24]

#### How to install Totem (GNOME Videos)?

You can just type in “totem” to find the video player for GNOME listed in the software center. If not, you can also try utilizing the terminal with the following command:

```
sudo apt install totem
```

#### 7\. Deepin Movie

![][25]

If you are using [Deepin OS][26], you will find this as your default video player for Deepin Desktop Environment. It features all the basic functionalities that you would normally look in a video player. You can try compiling the source to install it if you aren’t using Deepin.

[Deepin Movie][27]

#### How to Install Deepin?

You can find it in the Software Center. If you’d want to compile, the source code is available at [GitHub][28]. In either case, type in the following command in the terminal:

```
sudo apt install deepin-movie
```

#### 8\. Xine Multimedia Engine

![][29]

Key Higlights:

  * Customization available
  * Subtitles supported
  * Major file formats supported
  * Streaming playback support



Xine is an interesting portable media player. You can either choose to utilize the GUI or call the xine library from other applications to make use of the features available.

It supports a wide range of file formats. You can customize the skin of the GUI. It supports all kinds of subtitles (even from the DVDs). In addition to this, you can take a snapshot while playing the video, which comes handy.

[Xine Multimedia][30]

#### How to install Xine Multimedia?

You probably won’t find this in your Software Center. So, you can try typing this in your terminal to get it installed:

```
sudo apt install xine-ui
```

In addition to that, you can also check for available binary packages on their [official website][31].

**Wrapping Up**

We would recommend you to try out these open source video players over anything else. In addition to all these, you can also try [Miro Player][32] which is no more being actively maintained but works – so you can give it a try, if nothing else works for you.

However, if you think we missed one of your favorite Linux video player that deserves a mentioned, let us know about it in the comments down below!

--------------------------------------------------------------------------------

via: https://itsfoss.com/video-players-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/watch-netflix-in-ubuntu-linux/
[2]: https://itsfoss.com/download-youtube-linux/
[3]: https://itsfoss.com/popcorn-time-ubuntu-linux/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/Video-Players-for-Linux.png?ssl=1
[5]: https://itsfoss.com/ubuntu-repositories/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/vlc-media-player.jpg?ssl=1
[7]: https://www.videolan.org/vlc/
[8]: https://itsfoss.com/how-to-synchronize-subtitles-with-movie-quick-tip/
[9]: https://itsfoss.com/install-latest-vlc/
[10]: https://wiki.videolan.org/Debian/#Debian
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2015/10/mplayer-video.jpg?ssl=1
[12]: http://www.mplayerhq.hu/design7/news.html
[13]: https://itsfoss.com/mplayer/
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/SMPlayer-coco.jpg?ssl=1
[15]: https://itsfoss.com/smplayer/
[16]: https://www.smplayer.info/en/info
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/08/mpv-player-interface.png?ssl=1
[18]: https://itsfoss.com/mpv-video-player/
[19]: https://mpv.io/
[20]: https://mpv.io/installation/
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/dragon-player.jpg?ssl=1
[22]: https://kde.org/applications/multimedia/org.kde.dragonplayer
[23]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/totem-video-player.png?ssl=1
[24]: https://wiki.gnome.org/Apps/Videos
[25]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/deepin-movie.jpg?ssl=1
[26]: https://www.deepin.org/en/
[27]: https://www.deepin.org/en/original/deepin-movie/
[28]: https://github.com/linuxdeepin/deepin-movie-reborn
[29]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/xine-multilmedia.jpg?ssl=1
[30]: https://www.xine-project.org/home
[31]: https://www.xine-project.org/releases
[32]: http://www.getmiro.com/
