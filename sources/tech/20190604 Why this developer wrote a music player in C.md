[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why this developer wrote a music player in C++)
[#]: via: (https://opensource.com/article/19/6/creator-guayadeque-music-player)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Why this developer wrote a music player in C++
======
The creator of Guayadeque, an open source music player, opens up.
![][1]

Recently I was listening to some newly purchased music downloads on my System76 [Gazelle laptop][2] through my [Schiit Fulla 2 DAC][3], thinking how wonderful the music sounded and how much I enjoy using my favorite [open source music players][4].

I started wondering about what motivates the developers who create and maintain these excellent pieces of software, so I decided to reach out to a few of them. I've had some great conversations, which I'll share on [Opensource.com][5]. But first, a bit of background on how I developed such an appreciation for open source music players, including [Guayadeque][6], created by Juan Ríos and my first "serious" open source music player.

### My open source music player journey

My earliest experience with open source music players was in 2006 when our family was packing up to spend a year in Grenoble, France. Music is an important part of our lives, but we couldn't see taking our entire CD collection with us. So, with a fresh Linux install on my then nearly new Toshiba laptop, I started ripping our favorite CDs to FLAC and organizing them with [Rhythmbox][7]. I needed to use the Toshiba for work as well as enjoyment, so I couldn't use up too much of the "huge" 100GB storage. I recall the music sounding surprisingly good over my Grado headphones and planned to acquire a cheap but decent pair of powered speakers so the entire family could listen in our new, temporary home.

I continued using Rhythmbox until early 2011 when I became increasingly less satisfied with its features and started exploring alternatives. I didn't like the playlist-oriented players like [Exaile][8] or [Amarok][9]; I wasn't keen on [Banshee][10] because I wasn't keen on the Mono platform. Then I discovered Guayadeque. I liked its smart playlist, cover-fetching, and inter-track fading features, and I noted that it all happened by default with no need to figure out a complicated collection of plugins and tweaking to get going.

By early 2012, I ordered my first high-resolution digital-analog converter (DAC), a Schiit Bifrost, which I chose because Schiit tech support said it should work with Linux. I really liked what the DAC did when I hooked it up to my home stereo. By this time, my no-longer-new Toshiba was relegated to the home music player. I started [experimenting with MPD][11] and Linux and Android clients, and in mid-2014, I purchased my first [dedicated music server][12], a CuBox-i4, to replace the Toshiba. Meanwhile, I [continued to use Guayadeque][13] on my work laptop and desktop. Both of these setups allowed me to play back my library, including my growing collection of higher-than-CD resolution music, through the Advanced Linux Sound Architecture ([ALSA][14]) without re-sampling.

By late 2016, I had experimented with several other music players that sent the original music stream, untouched, through ALSA to the DAC, including [Quod Libet][15], [Gmusicbrowser][16], and [GogglesMM][17]. Of these, I particularly liked GogglesMM's minimalist approach—it's very lightweight and configurable to talk directly to ALSA's hardware interface. And I have since discovered a few more players that I like, including [Strawberry][18].

### Meet Juan Ríos, Guayadeque developer

For my first article in this series, I spoke with Juan Ríos, who designed, built, and maintains Guayadeque. Juan lives in the Canary Islands, a Spanish autonomous community located off the northwest coast of Africa. We had an interesting discussion about open source music players and life in general; our conversation has been edited for clarity and conciseness.

**Q: When and why did you decide to create Guayadeque?

* * *

**A:** In 2008, I evaluated Amarok, Banshee, and Rhythmbox to store my large music collection (about 20,000 songs). None of them could competently manage a collection this large. I was programming mostly as a hobby, and I decided I would write my own music player that could manage large music collections in an efficient and rapid manner. The first release was in 2009. It was a considerable amount of work!

******Q: At the time, did your job involve programming? Were you working in Linux?

* * *

**********A:********** I've been programming for about 30 years now, but only in the last three years have I been involved in work-related programming and software support. I started using Linux in 2000 because it was more reliable and more useful than the other options I evaluated; plus I really appreciated the libre culture around it.

**********Q: What do you think are Guayadeque's most important features and components?

* * *

**************A:************** Well, first of all, it's programmed in C++. I used the [WxWidgets][19] cross-platform GUI library because, even though I was mainly interested in the Linux side of things, I wanted it to run on other platforms as well. I used [SQLite][20] as the database for storing music metadata and [GStreamer][21] to manage the audio streams.

Component-wise, the things that stand out are the volume unit (VU) meters, which show the peak and root mean square (RMS) signal level; the smart playlist; the ability to handle very large music collections; the ability to sync all or part of the music library in other formats to portable devices, such as phones; and the ability to connect GStreamer to various Linux audio software, including PulseAudio, ALSA, Open Sound System, and others.

I'm glad I wrote Guayadeque in C++, which plays a significant role in its good performance. I primarily use a lightweight desktop environment like XFCE, and I don't have the fastest hardware in town, so it's important that Guayadeque be efficient and speedy on a modest computing platform.

**************Q: Can you tell me a bit about the VU meters?**************

******************A:****************** The idea is to mimic signal level meters on professional recording equipment. When a song is playing, the user can see the most recent peak signal level, the current signal level, and the RMS signal level. RMS means "root mean square," which is a kind of averaging process that indicates the overall apparent loudness. There is a separate meter for the left (above) and the right (below) channel.

![Guayadeque's VU meter][22]

Guayadeque's VU meter shows a track's peak, current, and RMS levels.

******************Q: What about the smart playlist?

* * *

**********************A:********************** When the user has the smart playlist feature enabled, Guayadeque will search LastFM and the user's music library to find songs that other LastFM users have indicated are similar to the one currently playing and are also in the user's music library. This allows the player to use the recommendations of others to construct a playlist.

(For example, in this image the player has found "similar" recommendations between "Son para ti," "Yamulemu," and "Fue una de mambo.")

![Guayadeque's smart playlist][23]

Guayadeque's smart playlist queues songs automatically.

**********************Q: Are you a musician? How do you like to listen to music?

* * *

**************************A:************************** I'm not a musician. One of my children plays the piano, but that's as close as I get. I like a lot of different kinds of music, and in general, I like to listen to a whole album at a time. I typically listen with headphones, and I don't use an external DAC; I find the quality produced by my computer sound card is sufficient for my needs.

**************************Q: Are you satisfied with Guayadeque? What does the future hold?**************************

******************************A:****************************** Generally, I'm quite satisfied with Guayadeque. The time and effort I invested in it seem to me to be worthwhile. It meets my design goals, and I've received lots of positive feedback on its design and implementation. It was easy for me to add the ability to directly interface to ALSA based upon a user's request a few years ago.

![Setting the ALSA output device][24]

Setting Guayadeque's ALSA output device.

My main disappointment is that I haven't been able to attract others to join me in its development and support; I'd like to build a Guayadeque community. To this end, I feel that my choice of WxWidgets was not sufficiently mainstream, so I have begun rewriting Guayadeque using Qt. I hope this will attract more interest and participation in maintaining and enhancing the software.

* * *

I appreciated the opportunity to talk to Juan Ríos about Guayadeque, an open source music player that has given me great pleasure over the years. I wish him well in the move to Qt, and I hope that he meets his goal of establishing a development community.

### As for the music…

I recently stumbled upon an interesting online music store called [Juno Download][25], which bills itself as a "dance MP3 download store" with more than 5 million tracks in various formats including FLAC. It also provides sample packs and DJ charts. I was delighted to find Massive Attack's [_Ritual Spirit_][26] in FLAC (CD-quality) format to replace the MP3 version I bought a while back. I also acquired both of Peace Orchestra's albums [_Peace Orchestra_][27] and [_Reset_][28], also in CD-quality FLAC format. I've been a big fan of [Peter Kruder][29] for a long time but had found _Reset_ only on vinyl (which is great, but not convenient for traveling). Juno Download is highly Linux-friendly, requiring no bloatware download managers whatsoever. Nice!

For those of you who have fond memories of the [Doobie Brothers][30], you might want to check out [_The Best of the Doobies_][31], remastered and re-released in 2016 in high-resolution FLAC (192kHz sample rate /24-bit word length). Here's the [Spek][32] acoustic spectrum analyzer's take on track 8's signal content:

![Acoustic spectrum analyzer][33]

The Doobie Brothers' 2016 remastered version of "It Keeps You Runnin'."

It's nice to see this isn't just a CD-quality copy "remastered" at 192/24.

I acquired it from [7digital][34], one of my favorite Linux-friendly online music stores. The music sounds great to me; it doesn't seem to be overly compressed, with peaks right up near 0dB but RMS values generally sitting down around -10 to -6dB, plus I enjoy the stroll down memory lane!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/creator-guayadeque-music-player

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/CreativeCommons_music_520x292_1112JS.png?itok=R2HYcCqu
[2]: https://system76.com/guides/gaze13
[3]: https://opensource.com/article/17/4/fun-new-gadget
[4]: https://opensource.com/article/19/2/audio-players-linux
[5]: http://Opensource.com
[6]: https://www.guayadeque.org/
[7]: https://wiki.gnome.org/Apps/Rhythmbox
[8]: https://www.exaile.org/
[9]: https://amarok.kde.org/en
[10]: http://banshee.fm/
[11]: https://opensource.com/article/17/6/armbian-cubox-i4pro
[12]: https://opensource.com/life/16/1/how-set-linux-based-music-server-home
[13]: https://opensource.com/life/16/6/what-i-like-about-guayadeque
[14]: https://www.alsa-project.org/wiki/Main_Page
[15]: https://quodlibet.readthedocs.io/en/latest/
[16]: https://gmusicbrowser.org/
[17]: https://github.com/gogglesmm/gogglesmm
[18]: https://www.strawbs.org/
[19]: https://www.wxwidgets.org/
[20]: https://www.sqlite.org/index.html
[21]: https://gstreamer.freedesktop.org/
[22]: https://opensource.com/sites/default/files/uploads/guayadeque_vu-meters.png (Guayadeque's VU meter)
[23]: https://opensource.com/sites/default/files/uploads/guayadeque_smart-playlist_feature.png (Guayadeque's smart playlist)
[24]: https://opensource.com/sites/default/files/uploads/guayadeque_smart-playlist_0.png (Setting the ALSA output device)
[25]: https://www.junodownload.com/
[26]: https://en.wikipedia.org/wiki/Ritual_Spirit
[27]: https://en.wikipedia.org/wiki/Peace_Orchestra_(album)
[28]: https://en.wikipedia.org/wiki/Peace_Orchestra:_Reset
[29]: https://en.wikipedia.org/wiki/Peter_Kruder
[30]: https://en.wikipedia.org/wiki/The_Doobie_Brothers
[31]: https://en.wikipedia.org/wiki/Best_of_The_Doobies
[32]: http://spek.cc/
[33]: https://opensource.com/sites/default/files/uploads/doobiebrothers.png (Acoustic spectrum analyzer)
[34]: https://ca.7digital.com/artist/the-doobie-brothers/release/the-best-of-the-doobies-5352866?f=12%2C16%2C17
