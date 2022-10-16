[#]: subject: "First Look at LURE! Bringing AUR to All Linux Distros"
[#]: via: "https://news.itsfoss.com/lure-aur/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

First Look at LURE! Bringing AUR to All Linux Distros
======
LURE is a new open-source project that aspires to become the AUR for all distros.

![First Look at LURE! Bringing AUR to All Linux Distros][1]

**AUR** (Arch User Repository) is a community-driven repository for Arch-based Linux distributions.

**Long story short:** it helps install packages not available in the official repositories and lets you get the latest releases.

I found it helpful with my experience on [Manjaro Linux][2].

Technically, AUR builds a package from the source and then utilizes the package manager (pacman) to install it.

You can also explore more about it in our detailed guide:

[What is AUR? How to use AUR in Arch and Manjaro Linux?][3]

📢 Now that you have a good idea about AUR, a **new open-source project**aims to bring the utility of AUR to all the distributions.

The project is called **Linux User REpository (or LURE).**

> 💡 The LURE project is in its alpha stage, announced by the creator a few weeks back. So, it is entirely a work in progress.

### A Project Like This Already Exists?

![lure adding repo][5]

**No.**

Developers have tried making an AUR alternative, but for a specific distribution. Like [makedeb Package Repository][6] for Debian.

LURE is an ambitious idea that could work on any distribution of your choice.

It seeks to be a tool that helps you create native packages for your distribution using a script similar to **PKGBUILD**.

[Creating a PKGBUILD to Make Packages for Arch Linux - It’s FOSS][7]

The developer mentions some of the technical details in a [Reddit announcement post][9]:

> My project is called LURE, short for Linux User REpository. It builds native packages and then installs them using the system package manager, just like the AUR. It uses a build script similar to the AUR's PKGBUILD to build the packages. 
>
> It is written in pure Go, which means that it has zero dependencies after it's built, other than any privilege escalation command (`sudo`, `doas`, etc.) and any one of the supported package managers, which currently are: `pacman`, `apt`, `apk` (Alpine Linux, not Android), `dnf`, `yum`, and `zypper`.

**Sounds exciting!**

[LURE Project Repo][10]

You can also explore more about it on its [GitHub mirror][11].

### Using LURE

You do not have to install an additional package manager to make it work; it works automatically with your system's package manager.

So, if it does not find a package in its repo (or any of its added repo), it moves to the system's default repo and installs it from there. Just like I installed/removed **neofetch** on my system using the lure command:

![lure neofetch remove][12]

While the project is in early development, it offers [binary packages][13] for various distributions allowing you to install and test them.

![][14]

Currently, its repository includes one project from the creator itself. But you can try to add a repo and build/install things.

For the sake of convenience, I tried installing the package in its repo:

![][15]

The command looks like this:

```
lure in itd-bin
```

On its [official documentation page][16], you can read more about its usage to build/install/add repositories.

Some of the planned features for future releases include:

* Automated install script
* Automated docker-based testing tool
* Web interface for repos

### What Would Make It Better?

Well, for starters, this is an excellent project. If you are someone who used Arch in the past or want to move away from Arch Linux, this will be a good tool for you.

However, for most end-users and non-Arch Linux newbies, something like the [Pamac GUI package manager][17] with LURE support should be the icing on the cake.

Of course, at its current stage, it needs support from open-source contributors. So, if you like the idea, feel free to contribute improvements to the project!

*💭 What do you think about LURE? Share your thoughts in the comments below!*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/lure-aur/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/10/LURE-aur-for-all-linux-distros.jpg
[2]: https://news.itsfoss.com/manjaro-linux-experience/
[3]: https://itsfoss.com/aur-arch-linux/
[4]: https://itsfoss.com/aur-arch-linux/
[5]: https://news.itsfoss.com/content/images/2022/10/lure-repos.png
[6]: https://mpr.makedeb.org
[7]: https://itsfoss.com/create-pkgbuild/
[8]: https://itsfoss.com/create-pkgbuild/
[9]: https://www.reddit.com/r/linux/comments/xq09nf/lure_aur_on_nonarch_distros/
[10]: https://gitea.arsenm.dev/Arsen6331/lure
[11]: https://github.com/Arsen6331/lure
[12]: https://news.itsfoss.com/content/images/2022/10/lure-neofetch-rm.png
[13]: https://gitea.arsenm.dev/Arsen6331/lure/releases/tag/v0.0.2
[14]: https://news.itsfoss.com/content/images/2022/10/lure-binaries.jpg
[15]: https://news.itsfoss.com/content/images/2022/10/lure-test.png
[16]: https://github.com/Arsen6331/lure/blob/master/docs/usage.md
[17]: https://itsfoss.com/install-pamac-arch-linux/
