3 open source music players for Linux
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/guitar_amp_music.jpg?itok=jZB_OMY7)

As I described [in my last article][1], when I'm using a Linux-based computer to listen to music, I pass that music through a dedicated digital-analog converter, or DAC. To make sure the bits in the music file get through to the DAC without any unnecessary fiddling on the part of intermediate software on my computer (like audio mixers), I like to aim the music player directly at the [hw interface][2] (or, if necessary, the plughw interface) that ALSA provides to the external equipment.

So, when I hear about a new music player, the first thing I do is figure out how to configure the output device. In the process of reviewing quite a few Linux-based music players, I'm beginning to see a pattern.

First, a sizable group of players depends on [GStreamer][3] to play the audio. As its website says, GStreamer is a multimedia framework that allows construction of arbitrary pipelines of media-processing components. In my case, [the alsasink plugin][4] can be used in a pipeline, like this:
```
gst-launch-1.0 -v uridecodebin uri=file:///path/to/my.flac ! audioconvert ! audioresample ! autoaudiosink

```

to play back the file `/path/to/my.flac` on the default ALSA audio output device. Note the use of the `audioresample` component in the pipeline—that's one of the things I don't want! Also, I don't want to use the ALSA default output—I want to select the device.

GStreamer-based music players vary in the configurability of their outputs. At the one extreme, players like [QuodLibet][5] provide the ability to precisely configure the output. At the other extreme, players like [Rhythmbox][6] use the default audio device, meaning—as far as I can tell, anyway—that mixing and resampling are going to happen. For example, the [PulseAudio Perfect Setup Guide][7] explains:

> Applications using the modern GStreamer media framework such as Rhythmbox or Totem can make use of the PulseAudio through gst-pulse, the PulseAudio plugin for GStreamer…

and then shows how to use `gconftool` to enable that:
```
gconftool -t string --set /system/gstreamer/0.10/default/audiosink pulsesink

```

So far, I've only found a few GStreamer-based music players that let me build the dedicated output connection I want: QuodLibet, [Guayadeque][8], and [Gmusicbrowser][9]. All three of these are great music players, but for my use—once configured—[I prefer Guayadeque][10].

Second, there is a different group of players that don't use GStreamer, instead taking a different route to getting data to the output device. A subgroup of these players are clients for [the MPD music server backend][11]. Of the players that use the MPD backend, [Cantata][12] is [my favorite, by far][13]. Of course, the nice thing about MPD being a server is that it can be controlled by other devices, such as Android-based phones or tablets. Therefore, for a music player hooked up to the home stereo or AV center, MPD is my go-to.

Of the non-MPD, non-GStreamer music players I've tried that support my use case, I really like [Goggles Music Manager][14].

With that background, let's take a look at some new (to me) players.

### Museeks music player

The [Museeks][15] music player is available on GitHub in source or binary (.deb, .AppImage,.rpm, amd64, or i386). Taking a quick look at the code, I see that Museeks is an Electron application, which I find kind of intriguing. The .deb installed without problems, and upon startup I was greeted with the Museeks user interface, which I find to be simple but attractive.

![](https://opensource.com/sites/default/files/uploads/museeks.png)

After clicking on the Audio tab, the only option I saw changes the playback rate, which is not of interest to me. After further online searching, I opened an issue on GitHub to ask about this and was encouraged by a quick and friendly response from Pierre de la Martinière saying he thought it interesting and that he would look into it. So, for now, without the ability to configure output, I'm going to put this otherwise interesting-looking player on pause.

### LPlayer music player

The [LPlayer][16] music player is also available on GitHub and as an Ubuntu PPA. I used the latter to install the current version, which proceeded without issue. LPlayer offers a very simple user interface: audio files (music or whatever) are loaded from the filesystem into the current playlist, reminiscent of [VLC][17]. I don't mind this kind of organization, but I like a more extensive, tag-based music browser. However, a lightweight player has its own charms, so I continued with the evaluation.

Here is LPlayer's main screen with two tracks loaded:

![](https://opensource.com/sites/default/files/uploads/lplayer.png)

The Settings control offers the playing track's current position, the playback speed, options to "remove silence" and "play continuously," and a graphical equalizer, but no output device configuration.

![](https://opensource.com/sites/default/files/uploads/lplayer_settings.png)

A bit of source code investigation showed that LPlayer uses GStreamer. I decided to contact the author, Lorenzo Carbonell, to see if he had any thoughts about the idea of configuring the GStreamer playback pipeline within the application. Until I hear back from him, I'll keep this little player on the shelf. (By the way, Linux fans, Sr. Carbonell has a pretty great-looking Spanish-language Linux blog, [El Atareao-Linux para Legos][18]).

### Elisa music player

According to the KDE community website, the [Elisa][19] music player is intended to provide "very good integration with the Plasma desktop of the KDE community without compromising the support for other platforms." One of these days, I need to set up a KDE desktop so I can try some of this stuff in the native environment, but that's not in the cards for this review.

I took a look at the [Try It][20] instructions to get an idea of how I might, well, try it. According to that page, my options were: 1) try a [Flatpak][21], 2) install ArchLinux and use the AUR available, or 3) install Fedora for which "the releases are usually packaged." Based on these options, I thought it was time I tried a Flatpak…
```
me@mymachine:~/Downloads$ sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

me@mymachine:~/Downloads$ sudo flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo

flatpak install kdeapps org.kde.elisa

Required runtime for org.kde.elisa/x86_64/master (org.kde.Platform/x86_64/5.9) is not installed, searching...

Found in remote flathub, do you want to install it? [y/n]:

```

Hmmm let's see, `org.kde.Platform`… maybe I don't want to bring all that in. I think I'm going to press pause on this player, too, until I can take the time to set up a KDE environment.

### Conclusions for this round

Well, really there aren't many, except that Museeks and LPlayer reinforce my impression that being able to pass music data to the DAC without tampering is not a primary design goal for a lot of Linux music players. This is too bad, really, because there are plenty of decent-to-excellent, low-cost DACs that are compatible with Linux and do a great job of converting those digits to sweet, sweet analog.

### Let's not forget the music

I've been shopping for music downloads again, this time on 7digital's Linux-friendly store. I picked up three great albums by [Fela Kuti][22], in CD-quality FLAC format: [Opposite People][23], [Roforofo Fight][24], and [Unnecessary Begging][25]. This man made so much great music! The sound quality on these files is generally quite decent, which is a nice treat. Opposite People dates back to 1977, Roforofo Fight to 1972, and Unnecessary Begging to 1982.

I also bought [Trentemøller][26]'s 2016 album, [Fixion][27]. I've liked his stuff since I first bumped into [The Last Resort][28]. This [video documentary][29] provides an interesting perspective on Trentemøller and his music, which is quite distinctive; I like his use of guitars, which can sometimes hint at '60s surfer music. The version on 7digital was available in 96KHz/24bit, so that's what I bought.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/open-source-music-players

作者：[Chris Hermansen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/clhermansen
[1]:https://opensource.com/article/18/3/phono-preamplifier-project
[2]:https://en.wikipedia.org/wiki/Advanced_Linux_Sound_Architecture#Concepts
[3]:https://gstreamer.freedesktop.org/
[4]:https://gstreamer.freedesktop.org/data/doc/gstreamer/head/gst-plugins-base-plugins/html/gst-plugins-base-plugins-alsasink.html
[5]:https://quodlibet.readthedocs.io/en/latest/
[6]:https://help.gnome.org/users/rhythmbox/stable/
[7]:https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/PerfectSetup/
[8]:http://www.guayadeque.org/
[9]:https://gmusicbrowser.org/
[10]:https://opensource.com/article/16/12/soundtrack-open-source-music-players
[11]:https://www.musicpd.org/
[12]:https://github.com/CDrummond/cantata
[13]:https://opensource.com/article/17/8/cantata-music-linux
[14]:https://gogglesmm.github.io/
[15]:https://github.com/KeitIG/Museeks/releases/tag/0.9.4
[16]:https://github.com/atareao/lplayer
[17]:https://www.videolan.org/vlc/index.es.html
[18]:https://www.atareao.es/
[19]:https://community.kde.org/Elisa
[20]:https://community.kde.org/Elisa#Try_It
[21]:https://flatpak.org/
[22]:https://en.wikipedia.org/wiki/Fela_Kuti
[23]:https://youtu.be/PeH4xziCHQs
[24]:https://youtu.be/XvX_iNFcKho
[25]:https://www.youtube.com/watch?v=614ZdP8SIbg
[26]:http://www.trentemoller.com/
[27]:http://www.trentemoller.com/music/fixion-0
[28]:https://en.wikipedia.org/wiki/The_Last_Resort_(album)
[29]:https://youtu.be/avatsxJazA0
