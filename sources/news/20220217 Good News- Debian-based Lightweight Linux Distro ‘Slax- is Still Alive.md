[#]: subject: "Good News! Debian-based Lightweight Linux Distro ‘Slax’ is Still Alive"
[#]: via: "https://news.itsfoss.com/slax-11-2/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Good News! Debian-based Lightweight Linux Distro ‘Slax’ is Still Alive
======

Slax is one of the best [lightweight Linux distributions][1] that can revive an old computer.

However, we did not get to see any significant development activities since 2018.

While a testing version based on Debian 10.2 was in the works in 2019, the pandemic could have affected the progress.

Fast-forward to 2022, finally, now we have a new testing version available (release candidate 2) of **Slax 11.2** based on [Debian Bullseye][2].

### Slax 11.2: What’s New?

![Slax 11.2][3]

Slax 11.2 is almost ready for its final release, with a second release candidate available for testing.

The latest version is based on Debian Bullseye version 11.2. The changes involve removing a few things and adding new stuff.

Let me mention the key highlights.

#### Linux Kernel 5.10 LTS

![][4]

[Linux Kernel 5.10][5] LTS introduces many essential changes and performance improvements.

Not to forget, it also enhances the hardware compatibility options.

#### Debian 11.2 Base

With [Debian 11][2] (Bullseye) as its base, you get obvious improvements/package support that you did not have with older Debian releases.

The most notable benefit includes the support for 32-bit systems, which keeps Slax in its position as one of the [best Linux distributions that support 32-bit computers][6].

In addition to that, you also get ExFAT support and improvements for the printer/scanner.

#### PCManFM Lives

![][7]

If you have been keeping an eye on its latest test releases, **Tomas M**, the creator, decided to ditch PCManFM (file manager) in favor of tuxCommander, thinking that pcmanfm was no longer available in Debian.

Fortunately, it is still there. And, PCManFM works super fast as expected!

#### Adding/Removing Applications

![][8]

With Slax 11.2, you get [connman][9] as the network manager and [scite][10] as the text editor.

Unfortunately, you will no longer find Leafpad and [wicd][11].

#### AUFS vs. Overlayfs

AUFS lets you modify the overlay files system and add modules on the fly. However, with AUFS no longer supported by Debian, Slax initially planned to use Overlayfs.

With the RC2 release, Slax decided to recompile the Linux Kernel and add AUFS from sources to provide the necessary functionalities suitable for Slax.

### Download Slax 11.2

You will find both 32-bit and 64-bit versions available for Slax 11.2.

When publishing this, we only have the RC2 ISO available, which works well as a VM in my brief test.

You can wait for the stable release or get the release candidate from its [latest blog post][12].

[Slax 11.2][13]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/slax-11-2/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/lightweight-linux-beginners/
[2]: https://news.itsfoss.com/debian-11-feature/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ4OCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxNCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: https://news.itsfoss.com/kernel-5-10-release/
[6]: https://itsfoss.com/32-bit-linux-distributions/
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU2MSIgd2lkdGg9Ijc1NSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQxOCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[9]: https://wiki.archlinux.org/title/ConnMan
[10]: https://www.scintilla.org/SciTE.html
[11]: https://wiki.archlinux.org/title/wicd
[12]: https://www.slax.org/blog/25843-AUFS-is-a-must.html
[13]: https://www.slax.org/
