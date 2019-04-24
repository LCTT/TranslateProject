[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Strawberry: A Fork of Clementine Music Player)
[#]: via: (https://itsfoss.com/strawberry-music-player/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Strawberry: A Fork of Clementine Music Player
======

In this age of streaming music and cloud services, there are still people who need an application to collect and play their music. If you are such a person, this article should interest you.

We have earlier covered [Sayonara music player][1]. Today, we will be taking a look at the Strawberry Music Player.

### Strawberry Music Player: A fork of Clementine

The [Strawberry Music Player][2] is, quite simply, an application to manage and play your music.

![Strawberry media library][3]

Strawberry contains the following list of features:

  * Play and organize music
  * Supports WAV, FLAC, WavPack, DSF, DSDIFF, Ogg Vorbis, Speex, MPC, TrueAudio, AIFF, MP4, MP3, ASF and Monkey’s Audio Audio CD playback
  * Native desktop notifications
  * Support for playlists in multiple formats
  * Advanced audio output and device configuration for bit-perfect playback on Linux
  * Edit tags on music files
  * Fetch tags from [MusicBrainz Picard][4]
  * Album cover art from [Last.fm][5], MusicBrainz and Discogs
  * Song lyrics from [AudD][6]
  * Support for multiple backends
  * Audio analyzer
  * Audio equalizer
  * Transfer music to iPod, iPhone, MTP or mass-storage USB player
  * Streaming support for Tidal
  * Scrobbler with support for Last.fm, Libre.fm and ListenBrainz



If you take a look at the screenshots, they probably look familiar. That is because Strawberry is a fork of the [Clementine Music Player][7]. Clementine has not been updated since 2016, while the most recent version of Strawberry (0.5.3) was released early April 2019.

Trivia

You might think that Strawberry music player is named after the fruit. However, its [creator][8] claims that he has named the project after the band [Strawbs][9].

### Installing Strawberry Music player

Now let’s take a look at how you can install Strawberry on your system.

#### Ubuntu

The easiest way to install Strawberry on Ubuntu is to install the [official snap][10]. Just type:

```
sudo snap install strawberry
```

If you are not a fan of snaps, you can download a .deb file from Strawberry’s GitHub [release page][11]. You can [install the .deb file][12] by double-clicking it and opening it via the Software Center.

Strawberry is not available in the main [Ubuntu repositories][13].

#### Fedora

Installing Strawberry on Fedora is much simpler. Strawberry is in the Fedora repos, so you just have to type `sudo dnf strawberry`. Strawberry is not available on Flatpak.

#### Arch

Just like Fedora, Strawberry is in the Arch repos. All you have to type is `sudo pacman -S strawberry`. The same is true for Manjaro.

You can find a list of Linux distros that have Strawberry in their repos [here][14]. If you have openSUSE or Mageia, click [here][15]. You can also compile Strawberry from source.

### Experience with Strawberry Music Player

![Playing an audio book with Strawberry][16]

I installed Strawberry on Fedora and Windows. I have used Clementine in the past, so I knew what to expect. I downloaded a number of audiobooks and several [Old Time Radio][17] [shows][18] as I don’t listen to a lot of music. Instead of using a dedicated [audiobook player like Cozy][19], I used Strawberry for listening to these radio shows.

Once I told Strawberry where my files were located, it quickly imported them. I used [EasyTag][20] to fix some of the MP3 information on the old time radio shows. Strawberry has a tag editor, but EasyTag allows you to edit several folders very quickly. Strawberry undated the media library instantaneously.

The big plus for me was performance. It loaded quickly and ran well. This might have something to do with the fact that it is not another Electron app. Strawberry is written in good-old-fashioned C++ and Qt 5. No need to load a whole web browser every time you want to play music, or in my case listen to audio dramas.

I was not able to test the Tidal streaming feature because I don’t have an account. Also, I don’t sync music to my iPod.

### Final Thoughts

Strawberry is like a standard music player that makes managing and playing your audio library very easy.

The features that I miss from Clementine include the option to access your media from cloud storage systems (like Box and Dropbox) and the ability to download podcasts. But then, I don’t store my media in the cloud and I mainly listen to podcasts on my iPod.

I recommend giving Strawberry a try. You just might like it as much as I do.

Have you ever used Strawberry? What is your favorite music player/manager? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][21].

--------------------------------------------------------------------------------

via: https://itsfoss.com/strawberry-music-player/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/sayonara-music-player/
[2]: https://strawbs.org/
[3]: https://itsfoss.com/wp-content/uploads/2019/04/strawberry1-800x471.png
[4]: https://itsfoss.com/musicbrainz-picard/
[5]: https://www.last.fm/
[6]: https://audd.io/
[7]: https://www.clementine-player.org/
[8]: https://github.com/jonaski
[9]: https://en.wikipedia.org/wiki/Strawbs
[10]: https://snapcraft.io/strawberry
[11]: https://github.com/jonaski/strawberry/releases
[12]: https://itsfoss.com/install-deb-files-ubuntu/
[13]: https://itsfoss.com/ubuntu-repositories/
[14]: https://repology.org/project/strawberry/versions
[15]: https://download.opensuse.org/repositories/home:/jonaski:/audio/
[16]: https://itsfoss.com/wp-content/uploads/2019/04/strawberry3-800x471.png
[17]: https://en.wikipedia.org/wiki/Golden_Age_of_Radio
[18]: https://zootradio.com/
[19]: https://itsfoss.com/cozy-audiobook-player/
[20]: https://wiki.gnome.org/Apps/EasyTAG
[21]: http://reddit.com/r/linuxusersgroup
