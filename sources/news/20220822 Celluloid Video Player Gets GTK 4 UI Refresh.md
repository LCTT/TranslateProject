[#]: subject: "Celluloid Video Player Gets GTK 4 UI Refresh"
[#]: via: "https://news.itsfoss.com/celluloid-0-24-release/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Celluloid Video Player Gets GTK 4 UI Refresh
======
Celluloid 0.24 release gets a modern visual refresh with libadwaita and further refinements.

![Celluloid Video Player Gets GTK 4 UI Refresh][1]

Celluloid is a front-end for mpv (an open-source media player for the command-line).

If you want to avoid bothering with the technical details, Celluloid is one of the best video players for Linux. Many Linux distributions offer Celluloid pre-installed as the default video player, among other essential packages.

With Celluloid v0.24 release, it finally uses [libadwaita][2] along with other refinements.

### 🆕 Celluloid v.0.24: Overview

![][3]

Recently, several applications have migrated over to GTK 4 (using libadwaita).

Whether you hate/love the idea, the applications seem to blend in well with GNOME while providing a modern look.

For instance, a useful [BitTorrent client][4], **Fragments**, [received a UI refresh][5] earlier this year. There are more examples as well.

![][6]

![][7]

Similarly, **Celluloid v0.24** seems to hit the right spot in user experience with this move. In addition to this change, here are the key highlights of the release:

* Migrating to GTK 4
* Dark mode support using libadwaita.
* Redesigned control box.
* Make controls layout adaptive.
* Display chapter marks in the seek bar.
* Display chapter titles in the seek bar pop over.
* Add option to make the video area draggable.

![][8]

In my quick experience with Celluloid on Pop!_OS 22.04 LTS, the UI is refreshing, and works as one would expect.

The dark mode looks perfect. By default, it respects the system choice. However, I would want an option to explicitly choose the dark/light theme.

![][9]

Maybe, we can hope for this addition with the next update.

#### Suggested Read 📖

![][10]

![][11]

### 📥 Download Celluloid 0.24

If you are installing it from the repositories, you may not get the latest version yet (depends on your distribution).

The best way to get the latest release is to get the Flatpak package on [Flathub][12]. You can use the software center for that or install it via the terminal using the following command:

```
flatpak install flathub io.github.celluloid_player.Celluloid
```

You can refer to our [Flatpak setup guide][13] if you are new to Linux.

[Download Celluloid 0.24][14]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/celluloid-0-24-release/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/08/celluloid-v-0-24.jpg
[2]: https://adrienplazas.com/blog/2021/03/31/introducing-libadwaita.html
[3]: https://news.itsfoss.com/content/images/2022/08/celluloid-0-24.jpg
[4]: https://itsfoss.com/best-torrent-ubuntu/
[5]: https://news.itsfoss.com/fragments-2-0-release/
[6]: https://news.itsfoss.com/zrythm-gtk4-alpha/
[7]: https://news.itsfoss.com/zrythm-gtk4-alpha/
[8]: https://news.itsfoss.com/content/images/2022/08/celluloid-about.png
[9]: https://news.itsfoss.com/content/images/2022/08/celluloid-light-0-24.jpg
[10]: https://itsfoss.com/video-players-linux/
[11]: https://itsfoss.com/video-players-linux/
[12]: https://flathub.org/apps/details/io.github.celluloid_player.Celluloid
[13]: https://itsfoss.com/flatpak-guide/
[14]: https://celluloid-player.github.io/
