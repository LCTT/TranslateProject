[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Haruna Video Player: An Open-Source Qt-based MPV GUI Front-end for Linux)
[#]: via: (https://itsfoss.com/haruna-video-player/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Haruna Video Player: An Open-Source Qt-based MPV GUI Front-end for Linux
======

_**Brief: A Qt-based video player for Linux that acts as a front-end to mpv along with the ability to use youtube-dl.**_

### Haruna Video Player: A Qt-based Free Video Player

![Haruna Video Player][1]

In case you’re not aware of [mpv][2], it is a free and open-source command-line based media player. Okay, there is a [minimalist GUI for MPV][3] but at the core, it is command line.

You might also find several [open-source video players][4] that are basically the GUI front-end to mpv.

Haruna video player is one of them along with the ability to [use youtube-dl][5]. You can easily play local media files as well as YouTube content.

Let me give you an overview of the features offered with this player.

### Features of Haruna Video Player

![][6]

You might find it a bit different from some other video players. Here’s what you get with Haruna video player:

  * Ability to play YouTube videos directly using the URL
  * Support playlists and you get to control them easily
  * Ability to auto-skip based on some words in the subtitle.
  * Control the playback speed
  * Change the format to play (audio/video) using [youtube-dl][7]
  * Plenty of keyboard shortcuts
  * Easily take a screenshot from the video
  * Option to add primary and secondary subtitle
  * Change the file format of the screenshot
  * Hardware decoding supported
  * Color adjustments to improve the quality of what you watch
  * Ability to tweak mouse and keyboard shortcuts to be able to quickly navigate and do what you want
  * Tweak the UI (fonts, theme)



### Installing Haruna Video Player on Linux

![][8]

Unfortunately (or not), depending on what you prefer, you can only install it [using Flatpak][9]. You can install it on any Linux distribution using the [Flatpak package][10].

You can find it in [AUR][11] as well if you’re using an Arch-based system.

But, if you do not prefer that, you may take a look at the source code on [GitHub][12] to see if you can build it yourself like a normal Gentoo user.

[Haruna Video Player][12]

### Concluding Thoughts

Haruna Video Player is a simple and useful GUI on top [libmpv][13]. The ability to play YouTube videos along with various file formats on the system is definitely something many users would like.

The user interface is easy to get used to and offers some important customization options as well.

Have you tried this video player already? Let me know what you think about it in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/haruna-video-player/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/haruna-video-player-dark.jpg?resize=800%2C512&ssl=1
[2]: https://mpv.io/
[3]: https://itsfoss.com/mpv-video-player/
[4]: https://itsfoss.com/video-players-linux/
[5]: https://itsfoss.com/download-youtube-linux/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/haruna-video-player-1.png?resize=800%2C503&ssl=1
[7]: https://github.com/ytdl-org/youtube-dl
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/haruna-player-garuda-linux.png?resize=800%2C506&ssl=1
[9]: https://itsfoss.com/flatpak-guide/
[10]: https://flathub.org/apps/details/com.georgefb.haruna
[11]: https://itsfoss.com/aur-arch-linux/
[12]: https://github.com/g-fb/haruna
[13]: https://github.com/mpv-player/mpv/tree/master/libmpv
