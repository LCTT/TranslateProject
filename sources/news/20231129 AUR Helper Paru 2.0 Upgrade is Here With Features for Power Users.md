[#]: subject: "AUR Helper Paru 2.0 Upgrade is Here With Features for Power Users"
[#]: via: "https://news.itsfoss.com/aur-helper-paru-2-0/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

AUR Helper Paru 2.0 Upgrade is Here With Features for Power Users
======
Paru 2.0 release has landed after a long time.
For those who are unfamiliar, Paru is an [AUR helper][1] that automates the tedious process of manually building [PKGBUILD][2]s for installing packages on Arch Linux.

It has gotten a new major release in the form of **Paru 2.0** , that has some important improvements.

Anyway, let's see what this release of Paru has to offer.

🚧

Before we begin, you need to ensure that you know how to troubleshoot your way around when using AUR helpers to build packages. If you are new to Linux, you should stick to your package manager.

## 🆕 Paru 2.0: What's New?

![][3]

Paru 2.0 release is **an update that aims to bring some major changes** , and is mostly aimed at power users.

This release comes more than a year after the last major release. The developer said that he didn't have enough spare time and there were many changes that needed to be done.

The developer also added that:

> As there's not been a release in so long, consider a lot of the things here not battle tested, with a .1 patch to follow.

So, keeping that in mind, let's take a look at the **highlights of the Paru 2.0 release**.

It is now **possible to integrate non-AUR PKGBUILDs into the build engine**. You can add other “pkgbuild” repositories to your paru.conf by using the following command:

```

    [repo_name]
    Url = https://path/to/git/repo

```

Then syncing up the repo with:

```

    paru -Sy --pkgbuilds

```

Moreover, you can specify a path to point to a local pkgbuild repo.

These repos have a **higher priority than AUR** , and also allow for the inclusion of AUR dependencies in them.

Another neat feature is the new **automatic pkgbuild repo** named " . ", which is invisible in the paru.conf.

This allows for executing a ' _paru -S ./foo_ ' command, where 'foo' is the name of a package under the current directory.

What this results in is the ability to have a bunch of pkgbuilds in the same directory that depend on each other, and you can build any one of them using the aforementioned command.

When you build them, **Paru will take care of solving and building the dependencies from the pkgbuilds in the directory itself**.

### 🛠️ Other Changes and Improvements

Other than the ones mentioned above, here are some other changes:

  * A fix for _no sudo_ when running _paru -Sc_.
  * Dates now use the local time zone from your system.
  * Provide searching has been improved, and it now enabled by default.
  * Removed confirmation for pacman install after final paru confirmation is done.
  * _\--chroot_ does not require local repos anymore, but it works better with those around.



For a more in-depth look into this release, you may go through the [release notes][4].

## 📥 Get Paru 2.0

If you installed Paru from AUR, then you can upgrade to the 2.0 release from there. But, if you built it, you could try the _-U_ flag to update or build it again.

If you are installing it for the first time, head over to its [GitHub repo][5] and follow the installation instructions.

[Paru 2.0 (GitHub)][4]

If you are eager to **know more about Paru** , or want to **learn how to install it**. I highly suggest you go through our article on [Paru AUR helper][6]:

![][7]

_💬 Arch users, are you hyped about this release of Paru? Let us know!_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/aur-helper-paru-2-0/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://wiki.archlinux.org/title/AUR_helpers
[2]: https://wiki.archlinux.org/title/PKGBUILD
[3]: https://news.itsfoss.com/content/images/2023/11/Paru_2.0.png
[4]: https://github.com/Morganamilo/paru/releases/tag/v2.0.0
[5]: https://github.com/Morganamilo/paru/
[6]: https://itsfoss.com/paru-aur-helper/
[7]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
