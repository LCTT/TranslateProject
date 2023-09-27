[#]: subject: "Bazzite: A Distro for Linux Gaming on Steam Deck and PCs"
[#]: via: "https://news.itsfoss.com/bazzite/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Bazzite: A Distro for Linux Gaming on Steam Deck and PCs
======
Gear up for gaming on Linux desktop or the Steam Deck. That sounds
exciting!
Would you be interested in a distro that is tailored for Linux gaming?

If yes, then we have just the thing for you.

Bazzite is a new Fedora-based distro that has been **tailor-made for gaming on Linux desktops** , and even the increasingly popular, **[Steam Deck][1]**.

In this article, we will take a brief look at Bazzite, and see what it has to offer.

### Bazzite: Overview ⭐

![][2]

Based on the recently released [Fedora 38][3], Bazzite is using [Universal Blue][4], which is an OCI base image of Fedora. It features expanded hardware support like **Microsoft Surface device support** , and has key drivers preinstalled.

🚧

Fedora 39-based builds are also available for testing. You can keep an eye out for its stable release later next month.

Some of its highlights include:

  * **Preinstalled proprietary Nvidia drivers**
  * **Support for hardware accelerated H264 decoding**
  * **[Waydroid][5] implementation, allowing for running Android apps**
  * **Support for Xbox controllers due to implementation of[xone][6], [xpadneo][7], and [xpad-noone][8]**



![][9]

#### Initial Impressions 👨‍💻

I tested Bazzite out on a [virtual machine][10] to take a look at it, and the installation experience was quite similar to Fedora's. But, the post-install is where you see the differences.

Bazzite uses KDE [Plasma 5.27][11] desktop environment by default, with a neat **Steam Deck-like branding** across the operating system.

It also offers **separate ISOs** for PCs and Steam Deck, including an **NVIDIA-focused variant** , and a **GNOME variant** if you do not like KDE.

For setting up the distro for gaming use, I used the 'Bazzite Portal' app that took me through some important configuration steps. You also get to install [Open Razer][12] if you need it here.

![][13]

It first set up 'Bazzite Arch', which is a custom Arch Linux OCI in Distrobox that allows the likes of [Steam][14], [Lutris][15], and others to run gaming workloads inside it.

![][16]

After going through a few other config options, came the installation of applications, it showed different categories that contain the most popular apps for specific use cases.

![][17]

And, finally, after the setup, you have an OS all set for gaming 😲

![Lutris and Steam running on Bazzite.][18]

Recently, with an update, Bazzite has added two new preinstalled apps:

![Bazzite GNOME edition with system monitor app][19]

  * [Mission Control][20] (system monitor app)
  * [Discover Overlay][21] (an app for Discord overlay).



There are a few other config options that I skipped over.

Bazzite can make use of the **Nix Package Manager** , **start Steam in Big Picture Mode at startup** , **has options for memory tuning** and more.

It sounds like an interesting concept, and if you have been wanting something based on Fedora tweaked for gaming like [Nobara][22], you can try it.

**Suggested Read** 📖

![][23]

### 📥 Download Bazzite

If you like what Bazzite has to offer, you can grab the latest release from its [GitHub repo][24].

[Bazzite (GitHub)][24]

For more info on Bazzite, you can also head over to its early announcement [blog post][25].

_💬 Share your thoughts on the project in the comments below._

* * *

[![Linux Foundation Bootcamp Offer][26]][27]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/bazzite/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://store.steampowered.com/steamdeck/
[2]: https://news.itsfoss.com/content/images/2023/08/Bazzite_1.png
[3]: https://news.itsfoss.com/fedora-38-release/
[4]: https://github.com/ublue-os/main
[5]: https://waydro.id/
[6]: https://github.com/medusalix/xone
[7]: https://github.com/atar-axis/xpadneo
[8]: https://github.com/ublue-os/xpad-noone
[9]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[10]: https://itsfoss.com/virtual-machine/
[11]: https://news.itsfoss.com/kde-plasma-5-27-release/
[12]: https://github.com/openrazer/openrazer
[13]: https://news.itsfoss.com/content/images/2023/08/Bazzite_2.png
[14]: https://store.steampowered.com/
[15]: https://lutris.net/
[16]: https://news.itsfoss.com/content/images/2023/08/Bazzite_3.png
[17]: https://news.itsfoss.com/content/images/2023/08/Bazzite_6.png
[18]: https://news.itsfoss.com/content/images/2023/08/Bazzite_9.png
[19]: https://news.itsfoss.com/content/images/2023/09/bazzite-gnome-task-manager.jpg
[20]: https://gitlab.com/mission-center-devs/mission-center
[21]: https://github.com/trigg/Discover
[22]: https://nobaraproject.org/
[23]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[24]: https://github.com/ublue-os/bazzite/releases
[25]: https://universal-blue.org/blog/2023/08/20/bazzite-10/
[26]: https://news.itsfoss.com/assets/images/Certs-and-Bundles-1536x864.webp
[27]: https://itsfoss.click/latest-lf-offer
