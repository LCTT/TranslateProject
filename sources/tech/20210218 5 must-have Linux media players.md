[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 must-have Linux media players)
[#]: via: (https://opensource.com/article/21/2/linux-media-players)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 must-have Linux media players
======
Whether its movies or music, Linux has you covered with some great media
players.
![An old-fashioned video camera][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different reasons to use Linux. Playing media is one of my favorite reasons to use Linux.

You may prefer vinyl and cassette tapes or VHS and Laserdisc, but it's still most likely that you consume the majority of the media you enjoy on a digital device. There's a convenience to media on a computer that can't be matched, largely because most of us are near a computer for most of the day. Many modern computer users don't give much thought to what applications are available for listening to music and watching movies because most operating systems provide a media player by default or because they subscribe to a streaming service and don't keep media files around themselves. But if your tastes go beyond the usual hit list of popular music and shows, or if you work with media for fun or profit, then you have local files you want to play. You probably also have opinions about the available user interfaces. On Linux, _choice_ is a mandate, and so your options for media playback are endless.

Here are five of my must-have media players on Linux.

### 1\. mpv

![mpv interface][2]

The mpv interface License: Creative Commons Attribution-ShareAlike

A modern, clean, and minimal media player. Thanks to its Mplayer, [ffmpeg][3], and `libmpv` backends, it can play any kind of media you're likely to throw at it. And I do mean "throw at it" because the quickest and easiest way to start a file playing is just to drag the file onto the mpv window. Should you drag more than one file, mpv creates a playlist for you.

While it provides intuitive overlay controls when you mouse over it, the interface is best when operated through the keyboard. For instance, **Alt+1** causes your mpv window to become full-size, and **Alt+0** reduces it to half-size. You can use the **,** and **.** keys to step through the video frame by frame, the **[** and **]** keys to adjust playback speed, **/** and ***** to adjust volume, **m** to mute, and so on. These master controls make for quick adjustments, and once you learn them, you can adjust playback almost as quickly as the thought occurs to you to do so. For both work and entertainment, mpv is my top choice for media playback.

### 2\. Kaffeine and Rhythmbox

![Kaffeine interface][4]

The Kaffeine interface License: Creative Commons Attribution-ShareAlike

Both the KDE Plasma and GNOME desktops provide music applications that can act as frontends to your personal music library. They invite you to establish a standard location for your music files and then scan through your music collection so you can browse according to album, artist, and so on. Both are great for those times when you just can't quite decide what you want to listen to and want an easy way to rummage through what's available.

[Kaffeine][5] is actually much more than just a music player. It can play video files, DVDs, CDs, and even digital TV (assuming you have an incoming signal). I've gone whole days without closing Kaffeine, because no matter whether I'm in the mood for music or movies, Kaffeine makes it easy to start something playing.

### 3\. Audacious

![Audacious interface][6]

The Audacious interface License: Creative Commons Attribution-ShareAlike

The [Audacious][7] media player is a lightweight application that can play your music files (even MIDI files) or stream music from the Internet. Its main appeal, for me, is its modular architecture, which encourages the development of plugins. These plugins enable playback of nearly every audio media format you can think of, adjust the sound with a graphic equalizer, apply effects, and even reskin the entire application to change its interface.

It's hard to think of Audacious as just one application because it's so easy to make it into the application you want it to be. Whether you're a fan of XMMS on Linux, WinAmp on Windows, or any number of alternatives, you can probably approximate them with Audacious. Audacious also provides a terminal command, `audtool`, so you can control a running instance of Audacious from the command line, so it even approximates a terminal media player!

### 4\. VLC

![vlc interface][8]

The VLC interface License: Creative Commons Attribution-ShareAlike

The [VLC][9] player is probably at the top of the list of applications responsible for introducing users to open source. A tried and true player of all things multimedia, VLC can play music, video, optical discs. It can also stream and record from a webcam or microphone, making it an easy way to capture a quick video or voice message. Like mpv, it can be controlled mostly through single-letter keyboard presses, but it also has a helpful right-click menu. It can convert media from one format to another, create playlists, track your media library, and much more. VLC is the best of the best, and most players don't even attempt to match its capabilities. It's a must-have application no matter what platform you're on.

### 5\. Music player daemon

![mpd with the ncmpc interface][10]

mpd and ncmpc License: Creative Commons Attribution-ShareAlike

The [music player daemon (mpd)][11] is an especially useful player, because it runs on a server. That means you can fire it up on a [Raspberry Pi][12] and leave it idling so you can tap into it whenever you want to play a tune. There are many clients for mpd, but I use [ncmpc][13]. With ncmpc or a web client like [netjukebox][14], I can contact mpd from the local host or a remote machine, select an album, and play it from anywhere.

### Media on Linux

Playing media on Linux is easy, thanks to its excellent codec support and an amazing selection of players. I've only mentioned five of my favorites, but there are many, many more for you to explore. Try them all, find the best, and then sit back and relax.

We see how four music players, VLC, QMMP, Clementine, Amarok, compare. The author also recommends...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-media-players

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_film.png?itok=aElrLLrw (An old-fashioned video camera)
[2]: https://opensource.com/sites/default/files/mpv_0.png
[3]: https://opensource.com/article/17/6/ffmpeg-convert-media-file-formats
[4]: https://opensource.com/sites/default/files/kaffeine.png
[5]: https://apps.kde.org/en/kaffeine
[6]: https://opensource.com/sites/default/files/audacious.png
[7]: https://audacious-media-player.org/
[8]: https://opensource.com/sites/default/files/vlc_0.png
[9]: http://videolan.org
[10]: https://opensource.com/sites/default/files/mpd-ncmpc.png
[11]: https://www.musicpd.org/
[12]: https://opensource.com/article/21/1/raspberry-pi-hifi
[13]: https://www.musicpd.org/clients/ncmpc/
[14]: http://www.netjukebox.nl/
