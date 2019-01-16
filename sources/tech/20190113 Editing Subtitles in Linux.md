[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Editing Subtitles in Linux)
[#]: via: (https://itsfoss.com/editing-subtitles)
[#]: author: (Shirish https://itsfoss.com/author/shirish/)

Editing Subtitles in Linux
======

I have been a world movie and regional movies lover for decades. Subtitles are the essential tool that have enabled me to enjoy the best movies in various languages and from various countries.

If you enjoy watching movies with subtitles, you might have noticed that sometimes the subtitles are not synced or not correct.

Did you know that you can edit subtitles and make them better? Let me show you some basic subtitle editing in Linux.

![Editing subtitles in Linux][1]

### Extracting subtitles from closed captions data

Around 2012, 2013 I came to know of a tool called [CCEextractor.][2] As time passed, it has become one of the vital tools for me, especially if I come across a media file which has the subtitle embedded in it.

CCExtractor analyzes video files and produces independent subtitle files from the closed captions data.

CCExtractor is a cross-platform, free and open source tool. The tool has matured quite a bit from its formative years and has been part of [GSOC][3] and Google Code-in now and [then.][4]

The tool, to put it simply, is more or less a set of scripts which work one after another in a serialized order to give you an extracted subtitle.

You can follow the installation instructions for CCExtractor on [this page][5].

After installing when you want to extract subtitles from a media file, do the following:

```
ccextractor <path_to_video_file>
```

The output of the command will be something like this:

It basically scans the media file. In this case, it found that the media file is in malyalam and that the media container is an [.mkv][6] container. It extracted the subtitle file with the same name as the video file adding _eng to it.

CCExtractor is a wonderful tool which can be used to enhance subtitles along with Subtitle Edit which I will share in the next section.

```
Interesting Read: There is an interesting synopsis of subtitles at [vicaps][7] which tells and shares why subtitles are important to us. It goes into quite a bit of detail of movie-making as well for those interested in such topics.
```

### Editing subtitles with SubtitleEditor Tool

You probably are aware that most subtitles are in [.srt format][8] . The beautiful thing about this format is and was you could load it in your text editor and do little fixes in it.

A srt file looks something like this when launched into a simple text-editor:

The excerpt subtitle I have shared is from a pretty Old German Movie called [The Cabinet of Dr. Caligari (1920)][9]

Subtitleeditor is a wonderful tool when it comes to editing subtitles. Subtitle Editor is and can be used to manipulate time duration, frame-rate of the subtitle file to be in sync with the media file, duration of breaks in-between and much more. I’ll share some of the basic subtitle editing here.

![][10]

First install subtitleeditor the same way you installed ccextractor, using your favorite installation method. In Debian, you can use this command:

```
sudo apt install subtitleeditor
```

When you have it installed, let’s see some of the common scenarios where you need to edit a subtitle.

#### Manipulating Frame-rates to sync with Media file

If you find that the subtitles are not synced with the video, one of the reasons could be the difference between the frame rates of the video file and the subtitle file.

How do you know the frame rates of these files, then?

To get the frame rate of a video file, you can use the mediainfo tool. You may need to install it first using your distribution’s package manager.

Using mediainfo is simple:

```
$ mediainfo somefile.mkv | grep Frame
 Format settings : CABAC / 4 Ref Frames
 Format settings, ReFrames : 4 frames
 Frame rate mode : Constant
 Frame rate : 25.000 FPS
 Bits/(Pixel*Frame) : 0.082
 Frame rate : 46.875 FPS (1024 SPF)﻿
```

Now you can see that framerate of the video file is 25.000 FPS. The other Frame-rate we see is for the audio. While I can share why particular fps are used in Video-encoding, Audio-encoding etc. it would be a different subject matter. There is a lot of history associated with it.

Next is to find out the frame rate of the subtitle file and this is a slightly complicated.

Usually, most subtitles are in a zipped format. Unzipping the .zip archive along with the subtitle file which ends in something.srt. Along with it, there is usually also a .info file with the same name which sometime may have the frame rate of the subtitle.

If not, then it usually is a good idea to go some site and download the subtitle from a site which has that frame rate information. For this specific German file, I will be using [Opensubtitle.org][11]

As you can see in the link, the frame rate of the subtitle is 23.976 FPS. Quite obviously, it won’t play well with my video file with frame rate 25.000 FPS.

In such cases, you can change the frame rate of the subtitle file using the Subtitle Editor tool:

Select all the contents from the subtitle file by doing CTRL+A. Go to Timings -> Change Framerate and change frame rates from 23.976 fps to 25.000 fps or whatever it is that is desired. Save the changed file.

![synchronize frame rates of subtitles in Linux][12]

#### Changing the Starting position of a subtitle file

Sometimes the above method may be enough, sometimes though it will not be enough.

You might find some cases when the start of the subtitle file is different from that in the movie or a media file while the frame rate is the same.

In such cases, do the following:

Select all the contents from the subtitle file by doing CTRL+A. Go to Timings -> Select Move Subtitle.

![Move subtitles using Subtitle Editor on Linux][13]

Change the new Starting position of the subtitle file. Save the changed file.

![Move subtitles using Subtitle Editor in Linux][14]

If you wanna be more accurate, then use [mpv][15] to see the movie or media file and click on the timing, if you click on the timing bar which shows how much the movie or the media file has elapsed, clicking on it will also reveal the microsecond.

I usually like to be accurate so I try to be as precise as possible. It is very difficult in MPV as human reaction time is imprecise. If I wanna be super accurate then I use something like [Audacity][16] but then that is another ball-game altogether as you can do so much more with it. That may be something to explore in a future blog post as well.

#### Manipulating Duration

Sometimes even doing both is not enough and you even have to shrink or add the duration to make it sync with the media file. This is one of the more tedious works as you have to individually fix the duration of each sentence. This can happen especially if you have variable frame rates in the media file (nowadays rare but you still get such files).

In such a scenario, you may have to edit the duration manually and automation is not possible. The best way is either to fix the video file (not possible without degrading the video quality) or getting video from another source at a higher quality and then [transcode][17] it with the settings you prefer. This again, while a major undertaking I could shed some light on in some future blog post.

### Conclusion

What I have shared in above is more or less on improving on existing subtitle files. If you were to start a scratch you need loads of time. I haven’t shared that at all because a movie or any video material of say an hour can easily take anywhere from 4-6 hours or even more depending upon skills of the subtitler, patience, context, jargon, accents, native English speaker, translator etc. all of which makes a difference to the quality of the subtitle.

I hope you find this interesting and from now onward, you’ll handle your subtitles slightly better. If you have any suggestions to add, please leave a comment below.


--------------------------------------------------------------------------------

via: https://itsfoss.com/editing-subtitles

作者：[Shirish][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/shirish/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/01/editing-subtitles-in-linux.jpeg?resize=800%2C450&ssl=1
[2]: https://www.ccextractor.org/
[3]: https://itsfoss.com/best-open-source-internships/
[4]: https://www.ccextractor.org/public:codein:google_code-in_2018
[5]: https://github.com/CCExtractor/ccextractor/wiki/Installation
[6]: https://en.wikipedia.org/wiki/Matroska
[7]: https://www.vicaps.com/blog/history-of-silent-movies-and-subtitles/
[8]: https://en.wikipedia.org/wiki/SubRip#SubRip_text_file_format
[9]: https://www.imdb.com/title/tt0010323/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/subtitleeditor.jpg?ssl=1
[11]: https://www.opensubtitles.org/en/search/sublanguageid-eng/idmovie-4105
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/subtitleeditor-frame-rate-sync.jpg?resize=800%2C450&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/01/Move-subtitles-Caligiri.jpg?resize=800%2C450&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/move-subtitles.jpg?ssl=1
[15]: https://itsfoss.com/mpv-video-player/
[16]: https://www.audacityteam.org/
[17]: https://en.wikipedia.org/wiki/Transcoding
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/01/editing-subtitles-in-linux.jpeg?fit=800%2C450&ssl=1
