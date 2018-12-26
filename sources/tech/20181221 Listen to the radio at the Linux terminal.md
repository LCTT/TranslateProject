[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Listen to the radio at the Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-mplayer)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

Listen to the radio at the Linux terminal
======
MPlayer is an extremely versatile open source media player that can be surprisingly useful at the Linux command line.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-mplayer.png?itok=6iTm3Xi7)

You've found your way to our 24-day-long Linux command-line toys advent calendar. If this is your first visit to the series, you might be asking yourself what a command-line toy even is. It could be a game or any simple diversion that helps you have fun at the terminal.

Some of you will have seen various selections from our calendar before, but we hope there’s at least one new thing for everyone.

There are many ways to listen to music at the command line; if you've got media stored locally, **cmus** is a great option, but there are [plenty of others][1] as well.

Lots of times when I'm at the terminal, though, I'd really rather just zone out and not pay close attention to picking each song, and let someone else do the work. While I've got plenty of playlists that work for just such a purpose, after a while, even though go stale, and I'll switch over to an internet radio station.

Today's toy, MPlayer, is a versatile multimedia player that will support just about any media format you throw at it. If MPlayer is not already installed, you can probably find it packaged for your distribution. On Fedora, I found it in [RPM Fusion][2] (be aware that this is not an "official" repository for Fedora, so exercise caution):

```
$ sudo dnf install mplayer
```

MPlayer has a slew of command-line options to set depending on your situation. I wanted to listen to the local college radio station here in Raleigh ([88.1 WKNC,][3] they're pretty good!), and so after grabbing the streaming URL from their website, all that took to get my radio up and running, no GUI or web player needed, was:

```
$ mplayer -nocache -afm ffmpeg http://wknc.sma.ncsu.edu:8000/wknchd1.mp3
```

MPlayer is open source under the GPLv3, and you can find out more about the project and download source code from the project's [website][4].

As I mentioned in yesterday's article, I'm trying to use a screenshot of each toy as the lead image for each article, but as we moved into the world of audio, I had to fudge it a little. So today's image was created from a public domain icon of a radio tower using **img2txt** , which is provided by the **libcaca** package.

Do you have a favorite command-line toy that you we should have included? Our calendar is basically set for the remainder of the series, but we'd still love to feature some cool command-line toys in the new year. Let me know in the comments below, and I'll check it out. And let me know what you thought of today's amusement.

Be sure to check out yesterday's toy, [Let you Linux terminal speak its mind][5], and come back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-mplayer

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/life/16/8/3-command-line-music-players-linux
[2]: https://rpmfusion.org/
[3]: https://wknc.org/index.php
[4]: http://www.mplayerhq.hu/
[5]: https://opensource.com/article/18/12/linux-toy-espeak
