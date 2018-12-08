[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (SMPlayer in Linux: Features, Download and Installation)
[#]: via: (https://itsfoss.com/smplayer/)
[#]: author: (Aquil Roshan;Abhishek Prakash https://itsfoss.com/author/aquil/)
[#]: url: ( )

SMPlayer in Linux: Features, Download and Installation
======

One of the [things you’ll notice after a fresh install of Ubuntu][1], or pretty much any other Linux distribution, is this message when you try to play certain video files.

![][2]
Default media player is not good with codecs

It means that the [codecs needed][3] to play the media are not installed on the system. Now, due to some copyright issues, some Linux based operating systems cannot pre-pack the codecs in the installation media. But they do allow you to download and install the codecs with just a click, or you could just install a media player which has all the multimedia codecs, to begin with. Checkout [SMPlayer][4].

### Meet SMPlayer: A Better Media Player for Linux

SMPlayer is a free and open-source media player built on the powerful [MPlayer][5] media engine. SMPlayer is capable of playing avi, mp4, mkv, mpeg, mov, divx, h.264 and pretty much any other major media format out there. And the cherry on top is, it can play [YouTube][6] videos too, ad-free.

![SMPlayer default interface][7]

SMPlayer is a complete media solution. It is cross-platform, so available on all the operating systems. If you have a dual boot, you can install it on your Windows and Linux OS to get a uniform experience on both the systems. It also supports convertible laptops with touch support.

You can play YouTube on SMPlayer too. I know it’s impractical to copy-paste the video URL and play on an external player every time. But SMPlayer is particularly useful when you are watching comparatively lengthy videos. SMPlayer plays YouTube videos in a very good quality and I felt the videos play out much better than the in-browser videos. And by playing the lengthier videos on SMPlayer, you can stay clear of the mid-roll ads that pop up on the lengthier videos.

If you’re watching a movie which doesn’t have subtitles, You can directly download the subtitles through SMPlayer. It comes with [opensubtitles.org][8] integration. So none of that, open the browser, search for subtitles, download the appropriate ones, unzip, place them in the video folder and connect the subtitles to the movie. No Sir! SMPlayer at your service.

![Automatic subtitle download in SMPlayer][9]

SMPlayer is available in more than 30 languages and it is highly customizable. It has both applications theming and a ton of icon sets in it.

If you feel that the default interface of SMPlayer doesn’t look good, in a few clicks you can make it look like this:

![SMPlayer skin change][10]

SMPlayer comes with a lot of tools and features for the power users. It has an equalizer, video speed controls, aspect ratio and zoom controls, video filters, screenshot ripping and lot more.

All in all, I really liked SMPlayer. It has a lot to offer in a small and lightweight package. I think it is a must have video player on your Linux PC. Along with playing all the media formats easily it also provides a ton of power controls.

### Installing SMPlayer on Linux

SMPlayer should be available in the software center of all major Linux distributions. You can search for it and install it from there itself.

On Ubuntu/ Linux Mint/ Elementary OS, you can also install SMPlayer by running the following command in the terminal

```
sudo apt install smplayer
```

Alternatively, you can download the package for Fedora, Arch Linux, OpenSUSE and Debian [here.][11]

### Wrapping Up

There are a good number of full-fledged media players out there like the VLC media player. SMPlayer is one of the best ones with a full functionality and great add-on benefits. I’ll consider it one of the [must-have applications for Linux][12].

Do give it a try and share your thoughts with us in the comments section below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/smplayer/

作者：[Aquil Roshan;Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/aquil/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/things-to-do-after-installing-ubuntu-18-04/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/SMPlayer-warning.jpg?fit=800%2C450&ssl=1
[3]: https://packages.ubuntu.com/trusty/ubuntu-restricted-extras
[4]: https://www.smplayer.info/
[5]: http://www.mplayerhq.hu/design7/news.html
[6]: https://www.youtube.com/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/SMPlayer-coco.jpg?fit=800%2C450&ssl=1
[8]: https://www.opensubtitles.org/en/search
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/SMPlayer-icon-packs.jpg?fit=800%2C450&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/11/SMPlayer-theme.jpg?fit=800%2C450&ssl=1
[11]: https://software.opensuse.org/download.html?project=home%3Asmplayerdev&package=smplayer
[12]: https://itsfoss.com/essential-linux-applications/
