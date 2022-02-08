[#]: subject: "Nobara Project Aims to Offer an Unofficial Fedora Linux 35 Spin Tailored for Gaming"
[#]: via: "https://news.itsfoss.com/fedora-nobara-gaming/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Nobara Project Aims to Offer an Unofficial Fedora Linux 35 Spin Tailored for Gaming
======

Fedora 35 is an impressive Linux distribution that debuted with GNOME 41 and introduced a new KDE variant.

You can read our [original coverage][1] to know more about it.

While Fedora Linux has constantly been improving the desktop experience, it may not be an ideal desktop distribution for every user. Moreover, even if it includes open-source tools and utilities out of the box, it is not geared to provide an effortless gaming experience.

You need to install a few dependencies and configure the distro to play a game without hassle.

Nobara Project by Thomas Crider (Red Hat Engineer) a.k.a. Glorious Eggroll aims to change that and offer an unofficial Fedora 35 Workstation spin built for gaming.

### Nobara Workstation 35: What’s New?

Fedora 35 is capable of handling several Linux games. However, if you need to play Windows-exclusive titles using Proton or Wine, you will have to configure a few things and probably need to troubleshoot in some titles.

So, Nobara Project aims to provide an unofficial spin that adds user-friendly fixes to it and makes it ideal for Linux gamers.

![][2]

#### Fedora 35 for Point and Click User

If you have been using Linux for a while and are comfortable using the Linux terminal, you should know that it is fairly easy to [set up Wine on Linux][3], Proton and install any additional codecs.

However, for a point-and-click user who relies on pre-installed packages and apps available from the software center, they need to make some effort to learn about it.

#### Lutris, Steam, OBS Studio, and Kdenlive Pre-Installed

Lutris helps you organize and play games on Linux. Not to forget, it has [helped Linux grow as a platform suitable for gaming][4] by providing an easy-to-use GUI that lets users play Windows-only games and more.

With Nobara Workstation 35, you will have Lutris pre-installed. The developer behind this project also happens to maintain Lutris. So, you should expect the latest version of Lutris on Nobara Workstation 35.

Not just Lutris, but you also get Steam, OBS Studio, and Kdenlive baked in.

Of course, you do get the standard Fedora-Workstation packages, in case you were wondering.

#### Fixes for Games

There are some known issues when playing a couple of games on Fedora 35. The project mentions that game developers want Fedora to resolve those issues, and apparently, Fedora points the figure at the game devs. And the problems remain unsolved.

So, with Nobara Workstation 35, some of these issues have been addressed. Problems like:

  * High CPU load due to an issue with libusb and xow (driver for Xbox One wireless dongle)
  * Adding a necessary symlink for Dying Light



#### X11 as the Default Display Server

Wayland may offer technical improvements over the X11 session. However, X11 provides better compatibility with games.

Furthermore, it is also required for AMD’s FSR tech to work, and a few other things with [Steam Play/Proton][5], and Wine.

#### Other Changes

Considering Nobara Workstation 35 is relatively new, surprisingly, you can find some noticeable differences.

Some key highlights worth mentioning include:

  * Nobara Workstation 35 disables a few packages from Fedora’s official repositories, favoring its own. For instance, you should find a newer Lutris version on Nobara’s repo compared to Fedora’s official repositories.
  * Nobara Workstation 35 uses a custom kernel.
  * The [RPM Fusion repositories][6] are enabled by default.
  * Additional packages for Wine 64/32-bit game compatibility.



The developer plans to improve it further by adding the following soon:

  * Add custom OBS Studio with browser integration plugin and vulkan+opengl capture support
  * Nobara specific theming
  * Include [Proton-GE][7] and Lutris Wine-GE builds



You can learn about the other technical changes on its [official website][8].

### Closing Thoughts

If the Nobara Project makes Fedora Linux suitable for gaming, we should have one more [gaming-focused Linux distribution][9].

It would be a good option for Linux gamers comfortable with Fedora Linux.

[Download Nobara Workstation 35][8]

You can try it out by downloading the suitable ISO (GNOME and KDE editions) from its official website. Note that this is a fairly new spin, so you might want to think twice before replacing it as your daily driver.

_What do you think about Noboara Project? Do we need a Fedora Linux flavor geared for gaming? Let me know your thoughts in the comments._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fedora-nobara-gaming/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/fedora-35-release/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM4NSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: https://itsfoss.com/use-windows-applications-linux/
[4]: https://news.itsfoss.com/lutris-creator-interview/
[5]: https://itsfoss.com/steam-play/
[6]: https://itsfoss.com/fedora-third-party-repos/
[7]: https://github.com/GloriousEggroll/proton-ge-custom
[8]: https://nobaraproject.org/
[9]: https://itsfoss.com/linux-gaming-distributions/
