[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Awesome Fedora 30 is Here! Check Out the New Features)
[#]: via: (https://itsfoss.com/fedora-30/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

The Awesome Fedora 30 is Here! Check Out the New Features
======

The latest and greatest release of Fedora is here. Fedora 30 brings some visual as well as performance improvements.

Fedora releases a new version every six months and each release is supported for thirteen months.

Before you decide to download or upgrade Fedora, let’s first see what’s new in Fedora 30.

### New Features in Fedora 30

![Fedora 30 Release][1]

Here’s what’s new in the latest release of Fedora.

#### GNOME 3.32 gives a brand new look, features and performance improvement

A lot of visual improvements is brought by the latest release of GNOME.

GNOME 3.32 has refreshed new icons and UI and it almost looks like a brand new version of GNOME.

![Gnome 3.32 icons | Image Credit][2]

GNOME 3.32 also brings several other features like fractional scaling, permission control for each application, granular control on Night Light intensity among many other changes.

GNOME 3.32 also brings some performance improvements. You’ll see faster file and app searches and a smoother scrolling.

#### Improved performance for DNF

Fedora 30 will see a faster [DNF][3] (the default package manager for Fedora) thanks to the [zchunk][4] compression algorithm.

The zchunk algorithm splits the file into independent chunks. This helps in dealing with ‘delta’ or changes as you download only the changed chunks while downloading the new version of a file.

With zcunk, dnf will only download the difference between the metadata of the current version and the earlier versions.

#### Fedora 30 brings two new desktop environments into the fold

Fedora already offers several desktop environment choices. Fedora 30 extends the offering with [elementary OS][5]‘ Pantheon desktop environment and Deepin Linux’ [DeepinDE][6].

So now you can enjoy the looks and feel of elementary OS and Deepin Linux in Fedora. How cool is that!

#### Linux Kernel 5

Fedora 29 has Linux Kernel 5.0.9 version that has improved support for hardware and some performance improvements. You may check out the [features of Linux kernel 5.0 in this article][7].

[][8]

Suggested read The Featureful Release of Nextcloud 14 Has Two New Security Features

#### Updated software

You’ll also get newer versions of software. Some of the major ones are:

  * GCC 9.0.1
  * [Bash Shell 5.0][9]
  * GNU C Library 2.29
  * Ruby 2.6
  * Golang 1.12
  * Mesa 19.0.2


  * Vagrant 2.2
  * JDK12
  * PHP 7.3
  * Fish 3.0
  * Erlang 21
  * Python 3.7.3



### Getting Fedora 30

If you are already using Fedora 29 then you can upgrade to the latest release from your current install. You may follow this guide to learn [how to upgrade a Fedora version][10].

Fedora 29 users will still get the updates for seven more months so if you don’t feel like upgrading, you may skip it for now. Fedora 28 users have no choice because Fedora 28 reached end of life next month which means there will be no security or maintenance update anymore. Upgrading to a newer version is no longer a choice.

You always has the option to download the ISO of Fedora 30 and install it afresh. You can download Fedora from its official website. It’s only available for 64-bit systems and the ISO is 1.9 GB in size.

[Download Fedora 30 Workstation][11]

What do you think of Fedora 30? Are you planning to upgrade or at least try it out? Do share your thoughts in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/fedora-30/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/wp-content/uploads/2019/04/fedora-30-release-800x450.png
[2]: https://itsfoss.com/wp-content/uploads/2019/04/gnome-3-32-icons.png
[3]: https://fedoraproject.org/wiki/DNF?rd=Dnf
[4]: https://github.com/zchunk/zchunk
[5]: https://itsfoss.com/elementary-os-juno-features/
[6]: https://www.deepin.org/en/dde/
[7]: https://itsfoss.com/linux-kernel-5/
[8]: https://itsfoss.com/nextcloud-14-release/
[9]: https://itsfoss.com/bash-5-release/
[10]: https://itsfoss.com/upgrade-fedora-version/
[11]: https://getfedora.org/en/workstation/
