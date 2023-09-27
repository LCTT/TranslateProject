[#]: subject: "Linux Mint Debian Edition 6 'Faye' is Here!"
[#]: via: "https://news.itsfoss.com/lmde-6/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Mint Debian Edition 6 'Faye' is Here!
======
The wait is over! The upgrade for Linux Mint's Debian edition has
dropped.
We have been waiting for this one for some time now!

Linux Mint Debian Edition ( **LMDE** ) received a major release last year in the form of [LMDE 5][1], and that had arrived with some pretty neat improvements.

And for this year, we have the **LMDE 6 release** code-named “ **Faye** ”, it follows a similar naming scheme to past releases.

Let's see what this release has to offer.

### Linux Mint Debian Edition 6 “Faye”: What's New?

![][2]

Powered by the recently launched [**Debian 12 release**][3], LMDE 6 features all of its improvements, bug fixes, new features, and then some more.

You can expect all the goodies added to Linux Mint 21.2.

Some key highlights of this release include:

  * **Linux Kernel 6.1**
  * **Cinnamon Upgrades**
  * **Revamped Software Manager**



💡

LMDE is just Linux Mint on top of Debian base instead of Ubuntu. It is an alternative to Ubuntu-based distros. Everything is aimed to be the same as you get with the Linux Mint flagship series.

#### Linux Kernel 6.1

![][4]

LMDE 6 takes advantage of the long-term supported [Linux Kernel 6.1][5] release, that allows it to leverage **experimental support for Rust** , **initial support for Intel's Meteor Lake chips** , **AMD's RDNA 3 graphics** , and more.

#### Cinnamon Upgrades

![][6]

Then there are the improvements thanks to the implementation of **Cinnamon 5.8**. Being the flagship desktop environment for Linux Mint, plenty of things are being offered.

Take for instance the **gestures support for window management** , **better window tiling/media controls** , **enhanced workspace management** , and more.

Then there's the new setting called ' **Styles** ', for tweaking the whole look and feel of the system. It allows you to set various colors to the different elements of the system.

I suggest you go through our article on the **[Linux Mint 21.2][7]** release to get a better look at the Cinnamon-specific improvements.

**Suggested Read** 📖

![][8]

#### Revamped Software Manager

![][9]

Similarly, we now have the **overhauled software manager** that we first saw with the Linux Mint 21.2 release, and now it is here with LMDE 6.

It features an **improved layout for accessibility** , with the main app categories being shifted further below on the homepage, and the search bar being moved to the left side.

Furthermore, it has become significantly **simpler to choose between the system package and Flatpak** of an application.

#### 🛠️ Other Changes and Improvements

Other than the above-mentioned, here are a few changes that are worth mentioning:

  * Improved login screen.
  * Better security for Warpinator.
  * Proper support for HEIF and AVIF images.
  * The 'Mint-Y-Legacy' theme was renamed to 'Mint-L'.
  * Ability to set accent colors to folders in the file manager.



For more details of this release, you can go through the official [release notes][10].

### 📥 Download LMDE 6 “Faye”

Not to forget, LMDE is one of the few [Linux distributions supporting 32-bit systems][11], and with the release of LMDE 6, that has remained unchanged.

It is being offered in both **32-bit** and **64-bit** variants, you can head over to the [official website][12] to get the variant of your choice.

**For existing LMDE 5 users** , you can upgrade by installing the upgrade tool through the commands below:

```

    apt update
    apt install mintupgrade

```

Once you install it, launch the GUI upgrade tool with:

```

    sudo mintupgrade

```

![][13]

Follow the on-screen instructions, and when the upgrade is a success, remove the upgrade tool using the following commands and reboot:

```

    apt remove mintupgrade
    sudo reboot

```

[LMDE 6 "Faye"][12]

_💬 Will you be taking LMDE 6 for a spin? Let us know!_

* * *

[![Linux Foundation Bootcamp Offer][14]][15]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/lmde-6/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/lmde-5-release/
[2]: https://news.itsfoss.com/content/images/2023/09/LMDE_6_1.png
[3]: https://news.itsfoss.com/debian-12-release/
[4]: https://news.itsfoss.com/content/images/2023/09/LMDE_6_2.png
[5]: https://news.itsfoss.com/linux-kernel-6-1-release/
[6]: https://news.itsfoss.com/content/images/2023/09/LMDE_6_3.png
[7]: https://news.itsfoss.com/linux-mint-21-2/
[8]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[9]: https://news.itsfoss.com/content/images/2023/09/LMDE_6_4.png
[10]: https://linuxmint.com/rel_faye.php
[11]: https://itsfoss.com/32-bit-linux-distributions/
[12]: https://linuxmint.com/download_lmde.php
[13]: https://news.itsfoss.com/content/images/2023/09/shadow_mintupgrade.png
[14]: https://news.itsfoss.com/assets/images/Certs-and-Bundles-1536x864.webp
[15]: https://itsfoss.click/latest-lf-offer
