[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why this developer wrote a quick and responsive music player)
[#]: via: (https://opensource.com/article/19/6/gogglesmm-developer-sander-jansen)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Why this developer wrote a quick and responsive music player
======
GogglesMM developer and maintainer shares the reasons he created an open
source music player.
![Record player with an LP spinning][1]

I [wrote recently][2] that "GogglesMM has been one of my favorite players for quite some time now." So, when I was thinking about interviewing developers who build and maintain open source music players, Sander Jansen came quickly to mind. Sander is the developer and maintainer of Goggles Music Manager ([GogglesMM][3]), a very fine open source music player that's particularly well-suited to getting the music stream from the computer to the digital-analog converter (DAC) in a very transparent fashion.

In my first article in this series, I interviewed [Juan Rios][4], creator of the Guyadeque music player; the following is an edited version of my conversation with Sander.

### Meet Sander Jansen, GogglesMM developer

**Q: Why did you decide to create and maintain an open source music player? What are some of the things about GogglesMM that really matter to you?**

**A:** Not really satisfied with the available players at the time (they used lots of memory, or were slow to start, or severely lacked a friendly user interface), I thought I'd give writing my own a try. At first, I mostly focused on music organization (the typical artist/album/tracks layout) while keeping a low memory footprint and keeping things quick.

**Q: Can you tell us a bit more about the organization issues you face? I know that lots of people with classical music interests also want to order by the composer; is this something you've looked at? And separating conductor, soloists, and orchestra?**

**A:** A limiting factor in organizing your music collection has always been the file format and its supported tagging options. We store all the metadata in the database for fast retrieval, but that merely reflects the contents of the files themselves.

My philosophy has always been that you should be able to copy the files and still have all the metadata without having to copy the database as well. As there is no one standard that covers metadata for all file formats, players trying to support the most common playback formats have to make choices that usually favor the lowest common denominator in terms of supported tags. A format like [ID3v2][5] supports a wide variety of metadata tags and potentially could be embedded in most files. That may sound like a good idea, but you run the risk of breaking playback in other software or devices. In GogglesMM, the native tag format will always have the preference when writing new tags.

GogglesMM does support conductor and composer tags. Allowing for arbitrary tags would certainly be nice, but it does make things way more complicated, from database design to UI options. There is certainly something to be said about keeping things simple.

![GogglesMM's use of the FOX UI.][6]

**Q: Tell us a bit about the libraries GogglesMM uses.**

A: I use the [FOX][7] library for GogglesMM's graphical user interface. It's a pretty nice library, although it hasn't kept up with newer UI features in recent years. In my previous job, we used it to port our applications to Windows and various flavors of Linux/Unix.

GogglesMM has its own playback engine but relies on the usual third-party libraries to decode the various audio codecs. Earlier versions used [xine][8] but lacking fine control over gapless playback made me decide to roll my own.

**Q: You have been building GogglesMM on Launchpad since 2016 and working on it even longer than that. So why is there a very old version of GogglesMM in the Debian and Ubuntu repos instead of your version?**

**A:** There are probably multiple reasons for the lack of an updated official package for GogglesMM. Offering a build on [Launchpad][9] seems the path of least resistance, as nobody else was interested in maintaining a package. The old version on Ubuntu should slowly be disappearing, as my request to stop distributing has finally been acknowledged. In the future, I may offer it as a [snap][10] package instead.

**Q: Are you a software developer in your daytime job?**

**A:** Yes, I'm a software developer at [Baron][11], and my day-to-day activities include development and maintenance of the Baron Weather API, a service that distributes various weather data over the internet.

I've been using Linux since the early 2000s as my main platform for both development and desktop use; first the Mandrake distribution, then Arch Linux, as a rolling release distribution appealed to me and saved me from having to reinstall my OS every year (and it was one of the first 686 optimized distributions I was aware of).

**Q: Are you a musician? How do you like to listen to music?**

**A:** I'm not a musician. GogglesMM is the main music player I use when I'm not in my car or out and about, in which case I use my phone. I use GogglesMM in various setups. At work on my laptop, I mainly listen through headphones. Depending on the activity, those can be podcasts, background music, or something I listen to more intently. It all depends on what I'm doing at the moment.

At home, I have a media PC attached to my 7.1 surround sound via HDMI. It allows me to play back some of my multichannel albums as well as regular stereo, of course. In addition, I have a regular desktop that has access to the same media files. Both use GogglesMM.

**Q: I try to configure my music player to pass on music data in unchanged form to the DAC. It seems that GogglesMM really tries to avoid resampling, changing word length, and so on.**

A: Yes, when I built my playback engine, I made sure it would be possible to do the exact thing that you're trying to accomplish.

  * At the moment, GogglesMM doesn't do resampling itself; there's some experimental code, but it's not complete and normally never gets enabled.
  * GogglesMM will try to pass any decoded data _as is_ to any of its output plugins (ALSA, Open Sound System [OSS], PulseAudio), meaning whatever native format the decoder supports. In the case of a lossless codec, that usually means whatever format the original data was in.
  * In case the output plugin/device doesn't support a specific audio bit depth or data type, the playback engine will try to convert it to one that does (with the least amount of loss of precision).
  * After that, the audio is passed on to either Pulse, ALSA, or OSS. PulseAudio tends to be straightforward for regular users but will probably do some conversion on the audio. Your best bet is ALSA.
  * Depending on the ALSA device you configure, ALSA may do some sort of conversion. There's an option in GogglesMM to disable ALSA resampling. Another method would be to specify a "hw" device directly instead of a "default" or "plug" device. That seems to be the best way to get exactly what you want. See ALSA's documentation on its [device naming scheme][12].
  * Any time the audio format or sample rate changes, GogglesMM will reconfigure its output device as needed, and playback should continue normally. There could be a slight silence between tracks if this happens. (We have to wait until all samples have been played, then stop playback, reconfigure the device, and resume playback afterward.)



![Taking a look at the more advanced tuning options and setting up the input device.][13]

**Q: Quite a few open source music players use [GStreamer][14]; while I've been told it doesn't necessarily mess with the bitstream unless the volume changes or the output device doesn't support the sampling rate or word length, it still makes me nervous that it might be fiddling with something "out of sight" because of some weird configuration issue of which I'm unaware.**

**A:** This could just be laziness on the part of the developer! It takes time to add a resampler and do format conversions on the fly and/or channel re-mapping. With the widespread deployment of PulseAudio, you don't need any of this functionality (in the player itself) to make an easy-to-use music player that just works. The GogglesMM engine was designed to avoid doing work. So the Vorbis decoder giving us float samples will stay float as long as possible, while the FLAC decoder giving 16-bit samples will stay 16 bit. Only when the output device needs something else will we try to convert them.

This also goes to show that slow development may be a good thing, as features you once thought were needed are no longer really required as they are implemented upstream.

**Q: Another thing I really appreciate about GogglesMM is how snappy it is, even on my ancient dual-core desktop. Can you tell us a bit about what you do to lower memory use and make GogglesMM quick and responsive?**

**A:** To be honest, not a lot. I definitely spent a lot of time making sure SQL(ite) queries were fast (especially the ones that get used a lot) and made sure no duplicate information is stored in the database. As computers have become faster and faster, it's been less on my mind, but it's still important to me that when you start up the application, it doesn't take more than a few seconds to show up and be ready to use. It also helps that I'm using FOX, which is already fast and lightweight. To come back to the previous topic, adding support for something like arbitrary tags would certainly have an impact on performance and probably require a database design rewrite.

**Q: Do you have any future plans for GogglesMM?**

**A:** Nothing short term, but for future development, I have been thinking about including support for HDPI monitors, audio crossfade, an equalizer, and integration of my audioconvert utility into GogglesMM.

**Q: What's the plan with audioconvert (audio sync and conversion utility)? To bring stuff into the player, to play it back, to manage collections in a different format on portable devices, or something else?**

**A:** Initially, having it part of the same package will be convenient because it can share the same internal FOX library. Perhaps some of the codebase could be reused to manage collections on portable devices, although I don't see such a big need for that, to be honest. For example, my main music collection is stored as FLAC, and I maintain copies of these files in Opus and MP3 formats in separate folders that are synced up using audioconvert. (This is very simple; just run **audioconvert --flac=opus /data/music/flac /data/music/opus**.) I use the file manager to copy the files I want onto my portable devices.

* * *

I enjoyed my conversation with Sander and learned some interesting details about the internal workings of GogglesMM. It's a fine music player, especially for anyone who wants solid control over the processing pipeline out to the DAC.

### And the music…

A few days ago, I was playing an album ripped from a CD that I bought at a well-known US coffee chain, back in the day when they used to sell music CDs, and I stumbled upon a couple of songs that inspired me to hunt down the artists and purchase a couple of album downloads.

The first is [_One and One is One_][15] by [Joi][16]. The song that led me to Joi is "[Asian Vibes][17]," a wonderful blend of south Asian and electronic music. I'm really enjoying the rest of it as well; it's great stuff that I purchased in FLAC format from the Linux-friendly [7digital][18] purveyor of downloads.

The second is [_Way Down Below Buffalo Hell_][19] by [Jam Nation][20], also acquired from 7digital. Their first work I encountered is [_She Moved Through the Fair_][21], which apparently was created for a particular recording project that incorporated a group of very strong musicians. Their music appeared on a few compilations I encountered back in the 1990s, and I'd love to hear more from them.

Finally, Sander offered a fine recommendation during our conversation: [_Blow Up Hollywood_][22]. He says, "they're a small band from New York and just have released their latest album, _Gold_ (a track from their previous album [appears here][23])."

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/gogglesmm-developer-sander-jansen

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open-music-column-lead-blue.png?itok=5lBw1NgT (Record player with an LP spinning)
[2]: https://opensource.com/article/19/2/audio-players-linux
[3]: https://gogglesmm.dev/
[4]: https://opensource.com/article/19/6/creator-guayadeque-music-player
[5]: https://en.wikipedia.org/wiki/ID3
[6]: https://opensource.com/sites/default/files/uploads/gogglemm_ui.png (GogglesMM UI)
[7]: https://en.wikipedia.org/wiki/Fox_toolkit
[8]: https://en.wikipedia.org/wiki/Xine
[9]: https://launchpad.net/~s.jansen/+ppa-packages
[10]: https://snapcraft.io/
[11]: http://baronweather.com/
[12]: https://alsa-project.org/wiki/DeviceNames
[13]: https://opensource.com/sites/default/files/uploads/gogglemm_output.png (GogglesMM preferences selecting ALSA output)
[14]: https://gstreamer.freedesktop.org/
[15]: https://en.wikipedia.org/wiki/One_and_One_Is_One_(album)
[16]: https://en.wikipedia.org/wiki/Joi_(band)
[17]: https://www.youtube.com/watch?v=sgKhlDIgTZY
[18]: https://ca.7digital.com/artist/joi/release/one-and-one-is-one-4389947?f=20%2C19%2C12%2C16%2C17%2C9%2C2
[19]: https://www.discogs.com/es/Jam-Nation-Way-Down-Below-Buffalo-Hell/release/72522
[20]: https://en.wikipedia.org/wiki/Jam_Nation
[21]: https://www.youtube.com/watch?v=p9Yy0DeYH7Q
[22]: https://www.blowuphollywood.com/
[23]: https://www.youtube.com/watch?v=485nizkMvkg
