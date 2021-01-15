[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Discover Fedora Kinoite: a Silverblue variant with the KDE Plasma desktop)
[#]: via: (https://fedoramagazine.org/discover-fedora-kinoite/)
[#]: author: (Timothée Ravier https://fedoramagazine.org/author/siosm/)

Discover Fedora Kinoite: a Silverblue variant with the KDE Plasma desktop
======

![][1]

Photo by [Jaakko Kemppainen][2] on [Unsplash][3]

Fedora Kinoite is an immutable desktop operating system featuring the [KDE Plasma desktop][4]. In short, Fedora Kinoite is like Fedora Silverblue but with KDE instead of GNOME. It is an emerging variant of Fedora, based on the same technologies as Fedora Silverblue (rpm-ostree, Flatpak, podman) and created exclusively from official RPM packages from Fedora.

### Fedora Kinoite is like Silverblue, but what is Silverblue?

From the [Fedora Silverblue documentation][5]:

> Fedora Silverblue is an immutable desktop operating system. It aims to be extremely stable and reliable. It also aims to be an excellent platform for developers and for those using container-focused workflows.

For more details about what makes Fedora Silverblue interesting, read the “[What is Fedora Silverblue?][6]” article previously published on Fedora Magazine. Everything in that article also applies to Fedora Kinoite.

### Fedora Kinoite status

Kinoite is not yet an official emerging edition of Fedora. But this is [in progress][7] and currently planned for Fedora 35. However, it is already usable! [Join us][8] if you want to help.

Kinoite is made from the same packages that are available in the Fedora repositories and that go into the classic Fedora KDE Plasma Spin, so it is as functional and stable as classic Fedora. I’m also “eating my own dog food” as it is the only OS installed on the laptop that I am currently using to write this article.

However, be aware that Kinoite does not currently have graphical support for updates. You will need to be confortable with using the command line to manage updates, install Flatpaks, or overlay packages with rpm-ostree.

#### How to try Fedora Kinoite

As Kinoite is not yet an official Fedora edition, there is not a dedicated installer for it for now. To get started, [install Silverblue][9] and switch to Kinoite with the following commands:

```
# Add the temporary unofficial Kinoite remote
$ curl -O https://tim.siosm.fr/downloads/siosm_gpg.pub
$ sudo ostree remote add kinoite https://siosm.fr/kinoite/ --gpg-import siosm_gpg.pub

# Optional, only if you want to keep Silverblue available
$ sudo ostree admin pin 0

# Switch to Kinoite
$ sudo rpm-ostree rebase kinoite:fedora/33/x86_64/kinoite

# Reboot
$ sudo systemctl reboot
```

#### How to keep it up-to-date

Kinoite does not yet have graphical support for updates in Discover. Work is in progress to teach Discover how to manage an rpm-ostree system. Flatpak management mostly works with Discover but the command line is still the best option for now.

To update the system, use:

```
$ rpm-ostree update
```

To update Flatpaks, use:

```
$ flatpak update
```

### Status of KDE Apps Flatpaks

Just like Fedora Silverblue, Fedora Kinoite focuses on applications delivered as Flatpaks. Some non KDE applications are available in the Fedora Flatpak registry, but until this selection is expanded with KDE ones, your best bet is to look for them in [Flathub][10] (see all [KDE Apps on Flathub][11]). Be aware that applications on Flathub may include non-free or proprietary software. The KDE SIG is working on packaging KDE Apps [as Fedora provided Flatpaks][12] but this is not ready yet.

### Submitting bug reports

Report issues in the [Fedora KDE SIG issue tracker][13] or in the discussion thread at [discussion.fedoraproject.org][14].

### Other desktop variants

Although this project started with KDE, I have also already created variants for XFCE, Mate, Deepin, Pantheon, and LXQt. They are currently available from the same remote as Kinoite. Note that they will remain unofficial until someone steps up to maintain them officially in Fedora.

I have also created an additional smaller Base variant without any desktop environment. This allows you to overlay the lightweight window manager of your choice (i3, Sway, etc.). The same caveats as the ones for other desktop environments apply (currently unofficial and will need a maintainer).

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/discover-fedora-kinoite/

作者：[Timothée Ravier][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/siosm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/01/kinoite-816x345.jpg
[2]: https://unsplash.com/@jaakkok?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/crystal?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://kde.org/plasma-desktop/
[5]: https://docs.fedoraproject.org/en-US/fedora-silverblue/
[6]: https://fedoramagazine.org/what-is-silverblue/
[7]: https://pagure.io/fedora-kde/SIG/issue/4
[8]: https://fedoraproject.org/wiki/SIGs/KDE
[9]: https://docs.fedoraproject.org/en-US/fedora-silverblue/installation/
[10]: https://flathub.org
[11]: https://flathub.org/apps/search/org.kde
[12]: https://pagure.io/fedora-kde/SIG/issue/13
[13]: https://pagure.io/fedora-kde/SIG
[14]: https://discussion.fedoraproject.org/t/kinoite-a-kde-and-now-xfce-version-of-fedora-silverblue/147
