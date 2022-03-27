[#]: subject: "Linux Mint Debian Edition (LMDE) 5 is Here with Debian 11 ‘Bullseye’"
[#]: via: "https://news.itsfoss.com/lmde-5-release/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Mint Debian Edition (LMDE) 5 is Here with Debian 11 ‘Bullseye’
======

Linux Mint’s offering with Debian is always an exciting release to look forward to.

In case you did not know, LMDE is meant to act as a replacement if Ubuntu ever disappears. So, whether you like or hate Ubuntu as a base, you have an impressive alternative without compromising the Linux Mint experience on your desktop.

With the latest LMDE 5 “Elsie”, the Linux Mint team has included all the goodies introduced in [Linux Mint 20.3][1] and [Debian 11 “Bullseye”][2] as its base.

Let me highlight the essential details regarding the new upgrade.

### Linux Mint Debian Edition 5 “Elsie”: What’s New?

![][3]

As you can guess, Linux Mint Debian Edition 5 comes loaded with Cinnamon as its desktop and looks exactly the same as Linux Mint’s primary offering with Ubuntu as its base.

### Cinnamon 5.2.7

Unlike Linux Mint’s main edition, you do not get the option for other desktop environments.

![][4]

So, you will have a Cinnamon desktop out-of-the-box with LMDE 5. The latest Cinnamon version includes plenty of improvements to give you a good user experience.

#### 32-bit Support Still Exists

If you are looking for [Linux distributions supporting 32-bit systems][5], LMDE 5 is yet another option that you can opt for.

While it may be irrelevant for most modern desktop users, it is still essential for Linux distributions to support 32-bit systems.

And, it is a good thing that Linux Mint’s Debian edition still includes support for it.

### Linux Kernel 5.10 LTS

[Linux Kernel 5.10][6] may not be the latest LTS release but it should be great for most hardware configurations (unless you have the latest and greatest from Intel/AMD).

![][7]

### Linux Mint 20.3 Improvements

With LMDE 5, the Linux Mint team has tried their best to add all the improvements [introduced in Linux Mint 20.3][1], with a new Debian base.

![][8]

You can notice the availability of new wallpaper backgrounds and get the latest app additions like “Thingy” or “Library” to manage documents.

In addition to the features, you also get to experience the same visual refresh to the theme with round edges, and slight changes to the theme color.

### Download LMDE 5

Before proceeding to install it, you may want to go through the [official release notes][9] to know about some common issues.

You can download the 64-bit or 32-bit ISO file from the [official site][10].

[Linux Mint Debian Edition 5][10]

If you were using [LMDE 5 beta][11], you do not need to upgrade, but type in a few commands, as per the instructions in the [release announcement][12]:

```

    apt install network-manager-config-connectivity-debian plymouth-label pipewire plocate
    apt remove mlocate brltty
    sudo updatedb

```

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/lmde-5-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/linux-mint-20-3-una-release/
[2]: https://news.itsfoss.com/debian-11-feature/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ0MCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjYxNCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: https://itsfoss.com/32-bit-linux-distributions/
[6]: https://news.itsfoss.com/kernel-5-10-release/
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ5NyIgd2lkdGg9IjY5NyIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU0NiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[9]: https://linuxmint.com/rel_elsie.php
[10]: https://www.linuxmint.com/edition.php?id=297
[11]: https://news.itsfoss.com/lmde-5-beta/
[12]: https://blog.linuxmint.com/?p=4287
