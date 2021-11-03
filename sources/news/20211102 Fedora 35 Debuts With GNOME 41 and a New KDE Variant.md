[#]: subject: "Fedora 35 Debuts With GNOME 41 and a New KDE Variant"
[#]: via: "https://news.itsfoss.com/fedora-35-release/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora 35 Debuts With GNOME 41 and a New KDE Variant
======

A couple of weeks after the beta release, Fedora 35 stable version has finally arrived! This version brings a few key improvements, many of which we will be looking at here.

Most notable of these improvements is the inclusion of the recently-released Gnome 41, accompanied by smaller upgrades such as Linux Kernel 5.14 and the completion of the transition to PipeWire.

Now, let’s have a look at some of these changes in brief along with some improvements introduced with Fedora 35.

### Key Upgrades in Fedora 35

Here are some of the more impactful upgrades and additions in Fedora 35.

### Desktop Environments

Fedora is well known for its incredible support for the latest desktop environments, and this doesn’t seem to be changing with this release.

#### GNOME 41

![][1]

By far the most popular version, Fedora 35 Workstation now ships with GNOME 41. This means that it gains the new Connections app, significantly improved software center, and some awesome multitasking controls.

It should also help laptop users, with its improved touchpad gestures, power profiles, and mobile data settings.

If you want to see what else is new, you can take a look at our [GNOME 41 release coverage][2].

#### KDE Plasma 5.22

![][1]

Unfortunately, this release doesn’t include the recently released Plasma 5.23, instead opting for [Plasma 5.22][3]. This is understandable, however, given that the Fedora team would only have had about a week to get it working.

While a pretty minor upgrade, Plasma 5.22 does bring in the adaptive transparency feature, along with the improved Krunner and system settings. You might want to explore more about [KDE Plasma 5.22][3] if you are curious.

### New KDE Edition: Fedora Kinoite

![][1]

Fedora Kinoite features the KDE Plasma desktop and is based on rpm-ostree technology. You get Flatpak application support out-of-the-box to easily install the software.

As per the official description:

> “_Kinoite provides atomic updates and an immutable operating system for increased reliability._“

So, it could be an interesting option to use as your Linux desktop operating system for everyday tasks without the risk of breaking the user experience with updates.

As of now, it is available for X86_64 and AArch64. You can head to its [project website][4] to get started.

### Linux Kernel 5.14

Back in August, I looked at the [new Linux 5.14 k][5]ernel, which has now found its way into Fedora 35. This is great news for those on ARM-based systems, as Linux 5.14 brought many ARM-specific improvements.

If you’re not using an ARM computer, you will still benefit from some of the other improvements in Linux 5.14. These improvements are primarily related to GPUs, as well as improved support for USB 4.

#### DNS Over TLS Support

With privacy becoming more and more important, technologies such as DNS over TLS (DoT) are becoming a critical part of our privacy. Now, Fedora 35 brings support for this technology, which aids in encrypting your internet traffic to and from the DNS server.

This means that your ISP shouldn’t be able to spy on your browsing habits, which I’m sure everyone will appreciate.

### Other Improvements

Aside from the ones previously mentioned, Fedora 35 brings support for the following new features:

  * Firewalld package update
  * GNU Toolchain update
  * Flathub applications included with third-party repositories
  * Default btrfs filesystem for Fedora cloud
  * The transition to Pipewire



If you want to see a full list of changes, they can be found in the [official changelist][6] or in the [official announcement][7].

### Wrapping Up

While this release doesn’t bring as many ground-breaking improvements as Fedora 34, I think users will be more than satisfied with it. Between Gnome 41 and Linux 5.14, users should notice a nice improvement to their systems.

If you want to try Fedora 35 out for yourself, feel free to download it from the button below.

[Download Fedora 35][8]

_What do you think about the changes introduced in Fedora 35? Let me know in the comment below!_

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fedora-35-release/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[2]: https://news.itsfoss.com/gnome-41-release/
[3]: https://news.itsfoss.com/kde-plasma-5-22-release/
[4]: https://kinoite.fedoraproject.org/
[5]: https://news.itsfoss.com/kernel-5-14-release/
[6]: https://fedoraproject.org/wiki/Releases/35/ChangeSet
[7]: https://fedoramagazine.org/announcing-fedora-35/
[8]: https://getfedora.org/
