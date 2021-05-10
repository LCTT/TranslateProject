[#]: subject: (Fedora 34 Releases with GNOME 40, Linux Kernel 5.11, and a New i3 Spin)
[#]: via: (https://news.itsfoss.com/fedora-34-release/)
[#]: author: (Arish V https://news.itsfoss.com/author/arish/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Fedora 34 Releases with GNOME 40, Linux Kernel 5.11, and a New i3 Spin
======

After the release of the [Fedora 34 beta][1] a week ago, Fedora 34 stable release is finally here with exciting changes and improvements.

As expected this release of Fedora arrives with the latest Linux kernel 5.11 along with significant changes such as [Gnome 40][2], [PipeWire][3], availability of a [Fedora i3 Spin][4], and various other changes.

Let’s take a look at the important changes coming to Fedora 34.

### Major Highlights of Fedora 34 Release

Here is an overview of the major changes in this release of Fedora.

#### Desktop Environment Updates

![][5]

One of the biggest highlights is the arrival of the [GNOME 40][2] desktop. Fedora 34 is one of the few distributions in which you can experience the latest Gnome 40 right now. So, this change is worth noting.

Taking a look at KDE Plasma, Wayland becomes the default display server for KDE Plasma in Fedora 34. Moreover, KDE Plasma Desktop image is available for AArch64 ARM devices as well.

Coming to other Desktop Environments, the latest Xfce 4.16 is available with this release of Fedora and LXQT also receives an update to the latest version LXQT 0.16.

#### PipeWire to Replace PulseAudio

A noteworthy change happening with this release of Fedora is the replacement of PulseAudio by PipeWire. It replaces PulseAudio and JACK by providing a PulseAudio-compatible server implementation and ABI-compatible libraries for JACK clients.

![][6]

Besides, with this release, there’s also a Fedora i3 Spin that provides the popular i3 tiling window manager and offers a complete experience with a minimalist user interface.

####  Zstd Compression by Default

BTRSF file system was made default with Fedora 34, with this release zstd algorithm is made default for transparent compression when using BTRSF. The developers hope that this would increase the life span of flash-based media by reducing write amplification.

#### Other Changes

Some of the other changes include package the following package updates.

  * Binutils 2.53
  * Golang 1.16
  * Ruby 3.0
  * BIND 9.16
  *  MariaDB 10.5
  * Ruby on Rails 6.1
  * Stratis 2.3.0



Other changes include replacement of The ntp package with ntpsec. Also, the collection packages xorg-x11 are revoked, and the individual utilities within them will be packaged separately.

If you want to see the entire list of changes in Fedora 34, please take a look at the [official announcement post][7] and the [changeset][8] for more technical details.

### Wrapping up

Most of the above changes in Fedora 34 were expected changes, and fortunately nothing went south after the beta release last week. Above all Fedora 34 in powered by the latest Linux kernel 5.11, and you can experience the latest GNOME desktop as well.

_So, what do you think about these exciting additions to Fedora 34? Let me know in the comments below._

 

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

#### _Related_

  * [Fedora 34 Beta Arrives With Awesome GNOME 40 (Unlike Ubuntu 21.04)][1]
  * ![][9] ![][10]


  * [Linux Release Roundup #21.13: GNOME 40, Manjaro 21.0, Fedora 34 and More New Releases][11]
  * ![][9] ![Linux Release Roundups][12]


  * [Manjaro 21.0 Ornara Comes Packed With GNOME 3.38, KDE Plasma 5.21, Xfce 4.16 and Linux Kernel 5.10][13]
  * ![][9] ![][14]



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fedora-34-release/

作者：[Arish V][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/arish/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/fedora-34-beta-release/
[2]: https://news.itsfoss.com/gnome-40-release/
[3]: https://pipewire.org/
[4]: https://spins.fedoraproject.org/i3/
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzQ2OCcgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzUzNicgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[7]: https://fedoramagazine.org/announcing-fedora-34/
[8]: https://fedoraproject.org/wiki/Releases/34/ChangeSet#i3_Spin
[9]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzIwMCcgd2lkdGg9JzM1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[10]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/03/fedora-34-beta-ft.png?fit=1200%2C675&ssl=1&resize=350%2C200
[11]: https://news.itsfoss.com/linux-release-roundup-2021-13/
[12]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2020/12/Linux-release-roundups.png?fit=800%2C450&ssl=1&resize=350%2C200
[13]: https://news.itsfoss.com/manjaro-21-0-ornara-release/
[14]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/03/manjaro-21.png?fit=1200%2C675&ssl=1&resize=350%2C200
