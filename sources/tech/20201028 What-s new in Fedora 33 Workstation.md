[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What’s new in Fedora 33 Workstation)
[#]: via: (https://fedoramagazine.org/whats-new-fedora-33-workstation/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

What’s new in Fedora 33 Workstation
======

![][1]

Fedora 33 Workstation is the [latest release][2] of our free, leading-edge operating system. You can download it from [the official website here][3] right now. There are several new and noteworthy changes in Fedora 33 Workstation. Read more details below.

### GNOME 3.38

Fedora 33 Workstation includes the latest release of GNOME Desktop Environment for users of all types. GNOME 3.38 in Fedora 33 Workstation includes many updates and improvements, including:

#### A new GNOME Tour app

New users are now greeted by “a new _Tour_ application, highlighting the main functionality of the desktop and providing first time users a nice welcome to GNOME.”

![The new GNOME Tour application in Fedora 33][4]

#### Drag to reorder apps

GNOME 3.38 replaces the previously split Frequent and All apps views with a single customizable and consistent view that allows you to reorder apps and organize them into custom folders. Simply click and drag to move apps around.

![GNOME 3.38 Drag to Reorder][5]

#### Improved screen recording

The screen recording infrastructure in GNOME Shell has been improved to take advantage of PipeWire and kernel APIs. This will help reduce resource consumption and improve responsiveness.

GNOME 3.38 also provides many additional features and enhancements. Check out the [GNOME 3.38 Release Notes][6] for further information.

* * *

### B-tree file system

As [announced previously][7], new installations of Fedora 33 will default to using [Btrfs][8]. Features and enhancements are added to Btrfs with each new kernel release. The [change log][9] has a complete summary of the features that each new kernel version brings to Btrfs.

* * *

### Swap on ZRAM

Anaconda and Fedora IoT have been using swap-on-zram by default for years. With Fedora 33, swap-on-zram will be enabled by default instead of a swap partition. Check out [the Fedora wiki page][10] for more details about swap-on-zram.

* * *

### Nano by default

Fresh Fedora 33 installations will set the EDITOR environment variable to [_nano_ by default][11]. This change affects several command line tools that spawn a text editor when they require user input. With earlier releases, this environment variable default was unspecified, leaving it up to the individual application to pick a default editor. Typically, applications would use _[vi][12]_ as their default editor due to it being a small application that is traditionally available on the base installation of most Unix/Linux operating systems. Since Fedora 33 includes nano in its base installation, and since nano is more intuitive for a beginning user to use, Fedora 33 will use nano by default. Users who want vi can, of course, override the value of the EDITOR variable in their own environment. See [the Fedora change request][11] for more details.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/whats-new-fedora-33-workstation/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/10/f33workstation-816x345.jpg
[2]: https://fedoramagazine.org/announcing-fedora-33/
[3]: https://getfedora.org/workstation
[4]: https://fedoramagazine.org/wp-content/uploads/2020/10/fedora-33-gnome-tour-1.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/10/drag-to-reorder-1.gif
[6]: https://help.gnome.org/misc/release-notes/3.38/
[7]: https://fedoramagazine.org/btrfs-coming-to-fedora-33/
[8]: https://en.wikipedia.org/wiki/Btrfs
[9]: https://btrfs.wiki.kernel.org/index.php/Changelog#By_feature
[10]: https://fedoraproject.org/wiki/Changes/SwapOnZRAM
[11]: https://fedoraproject.org/wiki/Changes/UseNanoByDefault
[12]: https://en.wikipedia.org/wiki/Vi
