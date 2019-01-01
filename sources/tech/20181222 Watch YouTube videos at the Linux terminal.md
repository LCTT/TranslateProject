[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Watch YouTube videos at the Linux terminal)
[#]: via: (https://opensource.com/article/18/12/linux-toy-youtube-dl)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)

Watch YouTube videos at the Linux terminal
======
Thought video content was just for your GUI? Think again.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-youtube-dl.png?itok=HYR5vU2a)

We're almost to the end of our 24-day-long Linux command-line toys advent calendar. Hopefully, you've been following along, but if not, start back at [the beginning][1] and work your way through. You'll find plenty of games, diversions, and oddities for your Linux terminal.

And while you may have seen some toys from our calendar before, we hope there’s at least one new thing for everyone.

Today we're going to double-down on yesterday's toy, [MPlayer][2], and add in one more, [**youtube-dl**][3].

As its name would imply, **youtube-dl** is a command-line utility for downloading YouTube videos, but it can capture video from a number of other sites as well, and it's a really quite full-featured application with [thorough documentation][4] to make video acquisition easy. A note: please don't use **youtube-dl** in any context that would violate the copyright laws in your jurisdiction.

**youtube-dl** is licensed under a public domain dedication known as [the][5] [Unlicense][5] that's similar to Creative Common's [CC0][6]. There are some interesting [legal opinions][7] out there about where public domain dedication fits into the open source landscape, but it's generally considered compatible with existing open source licenses even by organizations who don't recommend its use.

In its simplest form, we're going to use **youtube-dl** to grab a video for playback in our terminal. First, [install][8] it using a method appropriate for your distribution. For me, in Fedora, it was packaged in my repositories, so installation was as simple as:

```
$ sudo dnf install youtube-dl
```

Then, let's grab a video. YouTube allows you to search by license, so today, we're going to take a look at a fireplace [video][9] from [Gemmy's Videos][10] available under a Creative Commons attribution license. For YouTube videos, you can download with the file ID alone, like this, and we'll specify an output file name as well. I intentionally picked a short video, since long videos can get quite large!

```
$ youtube-dl pec8P5K4s8c -o fireplace.mp4
```

If you didn't install [MPlayer][2] yesterday, go ahead and do that, and you may need to install **libcaca** for your system as well if you did not install it previously. If you just use MPlayer to launch the video from the command line as-is ( **$** **mplayer fireplace.webm** ), it will play, but in a window all of its own; not exactly what we were going for.

First, I set my **libcaca** settings to force it to use **ncurses** **** as the display driver, keeping the output in my terminal, with:

```
$ export CACA_DRIVER=ncurses
```

Then, I zoomed way out in my terminal (the more "pixels", the better), and played the file with the following (forcing the use of **libcaca** and silencing text output from MPlayer):

```
$ mplayer -really-quiet -vo caca fireplace.mp4
```

And, there you go!
![](https://opensource.com/sites/default/files/uploads/linux-toy-youtube-dl.gif)

Do you have a favorite command-line toy that we should have included? It's a little late to submit a suggestion for this year, but we'd still love to feature some cool command-line toys in the new year. Let me know in the comments below, and I'll check it out. And let me know what you thought of today's amusement.

Be sure to check out yesterday's toy, [Listen to the radio at the Linux terminal][2], and come back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-youtube-dl

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/12/linux-toy-boxes
[2]: https://opensource.com/article/18/12/linux-toy-mplayer
[3]: https://rg3.github.io/youtube-dl/
[4]: https://github.com/rg3/youtube-dl/blob/master/README.md#readme
[5]: https://unlicense.org/
[6]: https://creativecommons.org/share-your-work/public-domain/cc0/
[7]: https://opensource.org/faq#public-domain
[8]: https://github.com/rg3/youtube-dl/blob/master/README.md#installation
[9]: https://www.youtube.com/watch?v=pec8P5K4s8c
[10]: https://www.youtube.com/channel/UCwwaepmpWZVDd605MIRC20A
