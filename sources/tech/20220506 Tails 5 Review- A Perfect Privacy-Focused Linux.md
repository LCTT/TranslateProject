[#]: subject: "Tails 5 Review: A Perfect Privacy-Focused Linux"
[#]: via: "https://www.debugpoint.com/2022/05/tails-5-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Tails 5 Review: A Perfect Privacy-Focused Linux
======
Here’s a quick review of Debian-based Tails 5, released a while back, refreshing its core modules with Debian 11 Bullseye.

Before we jump into the review of Tails 5, it’s worth mentioning what Tails are about. Tails, aka The Amnesic Incognito Live System, is a [privacy-focussed Linux Distribution][1] which uses the Tor network to protect you while browsing the web. Tails are based on Debian stable branch and come with many goodies such as an IRC client, Tor browser, email clients, and messengers to help you roam around on the web anonymously.

![Tails 5 Desktop Running GNOME 3.38][2]

### Tails 5 Review

#### ISO, Installation

Tails are available as a complete installation ISO image with an additional image capable of running from the USB drive itself. If you plan to use Tails, you should first think about your primary purpose for using Tails. And choose the ISO you want.

I would recommend that everyone be ready with a Tails USB stick. It’s handy on many occasions. For example, if you want to be anonymous for a short time and travel with public Wi-Fi, you might want to create a bootable Thumb drive to carry.

Both images are around 1.2GB in size and are available for download from the official website.

Installation of Tails is a little different, and you can find the guide [here][3].

#### First Impression

The first-time boot of Tails asks you to confirm the keyboard layout and language and followed by connecting to the Tor network. If you are not familiar with the Tor network, it gives two easy options. The Easier option is recommended for all users as it takes care of connecting to the Tor network with bridge setup, etc. You can also choose the “safer” option if you know what the options mean.

Once you complete the setup, you get a nice and clean GNOME Desktop environment which comes as default with Tails with additional applications. The GNOME version for Tails 5 is GNOME 3.38.6 stable which is the pre-GNOME 40 desktop with the traditional application menu with a vertical dock and workspaces.

You don’t need anything fancy desktop while using Tails for some critical work. GNOME 3.38x does just fine and it’s fast.

![Tails Welcome Screen][4]

![Tails 5 – Initial Tor Setup][5]

#### Tor Network and Application Updates

At its core, Tails 5 is based on [Debian 11 Bullseye][6](which is the current stable version) and [Linux Kernel 5.10][7].

The application list of Tails is mostly curated for privacy oriented work. The Tails application list includes the Tor Browser, Tor Connection Manager, and Onion Circuits Manager. During my test, the Tor network connected properly without any problem.

In addition to that, this release introduces Kleopatra (replaces Seahorse) which is a Certification manager to GnuPG and helps to manage OpenPGP certificates and keys.

One of the essential features of Tails is the persistance storage configuration which is required if you use Tails via a USB stick. Tails 5 imprves the Persistance Storage option to make it more faster and rubust in nature.

Furthermore, the application stack in Tails 5.0 refreshed with their respective stable version according to Debian Bullseye listed below.

* Tor Browser 11.0.11
* GNOME 3.38.6
* MAT 0.12
* Audacity 2.4.2
* GNOME Disks 3.38
* GIMP 2.10.22
* Inkscape 1.0
* LibreOffice 7.0

Tails packages all necessary applications to help with your purpose of anonymity, and those are acihved by its specific applications as listed here.

* Password manager – KeePassXC
* Pidgin Internet messenger
* Thunderbird Email Client
* Tor Browser and Connection Manager
* Onion Circuit manager
* Application for configuring Persistance Storage
* GtkHash checks for files
* Root Terminal

A tool called Additional Software that Tails includes; it helps run the different applications from the local media instead of downloading them after each boot.

#### Performance

The performance of Tails is stable and depends on GNOME Desktop. During my test, it behaved well, no major surprises of problems. Overall desktop feel is faster considering it is still GNOME 3.38 version.

So, during the performance test at idle, it was consuming around 4% CPU on average and memory is at 1.6 GB. It may be a little higher for an idle state, but being a privacy-focused distro, background processes, and daemon running contributed to this metric.

Also, the network histroy shows a continuous packaet traction at an idle state which I believe is due to some daemon running continuously.

![Tails 5 Performance shows continuous network ping][8]

### Closing Notes

Privacy is more important than ever today. And Tails is the best Linux distro for privacy-focused people out there. With the solid Debian stable base, GNOME desktop and [robust documentation,][9] Tails is a “go-to” distro for security researchers and advanced users. Moreover, the Tails team did an excellent job with its nicely crafted documentation which takes care of most of the problems you may face while using it. With that said, if you want to try out Tails 5, visit [this page for download][10] and read the installation [guide][11].

A word of caution: While using Tails, try not to visit banks or financial websites or make any transactions requiring 2FA authentication.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/tails-5-review/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/2022/04/privacy-linux-distributions-2022/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/05/Tails-5-Desktop-Running-GNOME-3.38.jpg
[3]: https://tails.boum.org/install/linux/index.en.html
[4]: https://www.debugpoint.com/wp-content/uploads/2022/05/Tails-Welcome-Screen.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/05/Tails-5-Initial-Tor-Setup.jpg
[6]: https://www.debugpoint.com/2021/05/debian-11-features/
[7]: https://www.debugpoint.com/2020/12/linux-kernel-5-10-release-announcement/
[8]: https://www.debugpoint.com/wp-content/uploads/2022/05/Tails-5-Performance-shows-continuous-network-ping.jpg
[9]: https://tails.boum.org/doc/index.en.html
[10]: https://tails.boum.org/install/index.en.html
[11]: https://tails.boum.org/install/linux/index.en.html
