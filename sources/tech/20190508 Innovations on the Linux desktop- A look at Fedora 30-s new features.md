[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Innovations on the Linux desktop: A look at Fedora 30's new features)
[#]: via: (https://opensource.com/article/19/5/fedora-30-features)
[#]: author: (Anderson Silva  https://opensource.com/users/ansilva/users/marcobravo/users/alanfdoss/users/ansilva)

Innovations on the Linux desktop: A look at Fedora 30's new features
======
Learn about some of the highlights in the latest version of Fedora
Linux.
![Fedora Linux distro on laptop][1]

The latest version of Fedora Linux was released at the end of April. As a full-time Fedora user since its original release back in 2003 and an active contributor since 2007, I always find it satisfying to see new features and advancements in the community.

If you want a TL;DR version of what's has changed in [Fedora 30][2], feel free to ignore this article and jump straight to Fedora's [ChangeSet][3] wiki page. Otherwise, keep on reading to learn about some of the highlights in the new version.

### Upgrade vs. fresh install

I upgraded my Lenovo ThinkPad T series from Fedora 29 to 30 using the [DNF system upgrade instructions][4], and so far it is working great!

I also had the chance to do a fresh install on another ThinkPad, and it was a nice surprise to see a new boot screen on Fedora 30—it even picked up the Lenovo logo. I did not see this new and improved boot screen on the upgrade above; it was only on the fresh install.

![Fedora 30 boot screen][5]

### Desktop changes

If you are a GNOME user, you'll be happy to know that Fedora 30 comes with the latest version, [GNOME 3.32][6]. It has an improved on-screen keyboard (handy for touch-screen laptops), brand new icons for core applications, and a new "Applications" panel under Settings that allows users to gain a bit more control on GNOME default handlers, access permissions, and notifications. Version 3.32 also improves Google Drive performance so that Google files and calendar appointments will be integrated with GNOME.

![Applications panel in GNOME Settings][7]

The new Applications panel in GNOME Settings

Fedora 30 also introduces two new Desktop environments: Pantheon and Deepin. Pantheon is [ElementaryOS][8]'s default desktop environment and can be installed with a simple:


```
`$ sudo dnf groupinstall "Pantheon Desktop"`
```

I haven't used Pantheon yet, but I do use [Deepin][9]. Installation is simple; just run:


```
`$ sudo dnf install deepin-desktop`
```

then log out of GNOME and log back in, choosing "Deepin" by clicking on the gear icon on the login screen.

![Deepin desktop on Fedora 30][10]

Deepin desktop on Fedora 30

Deepin appears as a very polished, user-friendly desktop environment that allows you to control many aspects of your environment with a click of a button. So far, the only issue I've had is that it can take a few extra seconds to complete login and return control to your mouse pointer. Other than that, it is brilliant! It is the first desktop environment I've used that seems to do high dots per inch (HiDPI) properly—or at least close to correctly.

### Command line

Fedora 30 upgrades the Bourne Again Shell (aka Bash) to version 5.0.x. If you want to find out about every change since its last stable version (4.4), read this [description][11]. I do want to mention that three new environments have been introduced in Bash 5:


```
$ echo $EPOCHSECONDS
1556636959
$ echo $EPOCHREALTIME
1556636968.012369
$ echo $BASH_ARGV0
bash
```

Fedora 30 also updates the [Fish shell][12], a colorful shell with auto-suggestion, which can be very helpful for beginners. Fedora 30 comes with [Fish version 3][13], and you can even [try it out in a browser][14] without having to install it on your machine.

(Note that Fish shell is not the same as guestfish for mounting virtual machine images, which comes with the libguestfs-tools package.)

### Development

Fedora 30 brings updates to the following languages: [C][15], [Boost (C++)][16], [Erlang][17], [Go][18], [Haskell][19], [Python][20], [Ruby][21], and [PHP][22].

Regarding these updates, the most important thing to know is that Python 2 is deprecated in Fedora 30. The community and Fedora leadership are requesting that all package maintainers that still depend on Python 2 port their packages to Python 3 as soon as possible, as the plan is to remove virtually all Python 2 packages in Fedora 31.

### Containers

If you would like to run Fedora as an immutable OS for a container, kiosk, or appliance-like environment, check out [Fedora Silverblue][23]. It brings you all of Fedora's technology managed by [rpm-ostree][24], which is a hybrid image/package system that allows automatic updates and easy rollbacks for developers. It is a great option for anyone who wants to learn more and play around with [Flatpak deployments][25].

Fedora Atomic is no longer available under Fedora 30, but you can still [download it][26]. If your jam is containers, don't despair: even though Fedora Atomic is gone, a brand new [Fedora CoreOS][27] is under development and should be going live soon!

### What else is new?

As of Fedora 30, **/usr/bin/gpg** points to [GnuPG][28] v2 by default, and [NFS][29] server configuration is now located at **/etc/nfs.conf** instead of **/etc/sysconfig/nfs**.

There have also been a [few changes][30] for installation and boot time.

Last but not least, check out [Fedora Spins][31] for a spin of Fedora that defaults to your favorite Window manager and [Fedora Labs][32] for functionally curated software bundles built on Fedora 30 (i.e. astronomy, security, and gaming).

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/fedora-30-features

作者：[Anderson Silva ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ansilva/users/marcobravo/users/alanfdoss/users/ansilva
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fedora_on_laptop_lead.jpg?itok=XMc5wo_e (Fedora Linux distro on laptop)
[2]: https://getfedora.org/
[3]: https://fedoraproject.org/wiki/Releases/30/ChangeSet
[4]: https://fedoraproject.org/wiki/DNF_system_upgrade#How_do_I_use_it.3F
[5]: https://opensource.com/sites/default/files/uploads/fedora30_fresh-boot.jpg (Fedora 30 boot screen)
[6]: https://help.gnome.org/misc/release-notes/3.32/
[7]: https://opensource.com/sites/default/files/uploads/fedora10_gnome.png (Applications panel in GNOME Settings)
[8]: https://elementary.io/
[9]: https://www.deepin.org/en/dde/
[10]: https://opensource.com/sites/default/files/uploads/fedora10_deepin.png (Deepin desktop on Fedora 30)
[11]: https://git.savannah.gnu.org/cgit/bash.git/tree/NEWS
[12]: https://fishshell.com/
[13]: https://fishshell.com/release_notes.html
[14]: https://rootnroll.com/d/fish-shell/
[15]: https://docs.fedoraproject.org/en-US/fedora/f30/release-notes/developers/Development_C/
[16]: https://docs.fedoraproject.org/en-US/fedora/f30/release-notes/developers/Development_Boost/
[17]: https://docs.fedoraproject.org/en-US/fedora/f30/release-notes/developers/Development_Erlang/
[18]: https://docs.fedoraproject.org/en-US/fedora/f30/release-notes/developers/Development_Go/
[19]: https://docs.fedoraproject.org/en-US/fedora/f30/release-notes/developers/Development_Haskell/
[20]: https://docs.fedoraproject.org/en-US/fedora/f30/release-notes/developers/Development_Python/
[21]: https://docs.fedoraproject.org/en-US/fedora/f30/release-notes/developers/Development_Ruby/
[22]: https://docs.fedoraproject.org/en-US/fedora/f30/release-notes/developers/Development_Web/
[23]: https://silverblue.fedoraproject.org/
[24]: https://rpm-ostree.readthedocs.io/en/latest/
[25]: https://flatpak.org/setup/Fedora/
[26]: https://getfedora.org/en/atomic/
[27]: https://coreos.fedoraproject.org/
[28]: https://gnupg.org/index.html
[29]: https://en.wikipedia.org/wiki/Network_File_System
[30]: https://docs.fedoraproject.org/en-US/fedora/f30/release-notes/sysadmin/Installation/
[31]: https://spins.fedoraproject.org
[32]: https://labs.fedoraproject.org/
