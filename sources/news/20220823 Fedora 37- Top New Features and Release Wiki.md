[#]: subject: "Fedora 37: Top New Features and Release Wiki"
[#]: via: "https://www.debugpoint.com/fedora-37/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora 37: Top New Features and Release Wiki
======
An article about Fedora 37 and its new features, release details and everything you need to know.

Fedora 37 development is wrapping up, and the BETA is approaching. Hence the features and packages are final at this stage.

In this usual feature guide page, I have summarised the essential features you should know about Fedora 37 and get an idea of what to expect. But before that, here’s a tentative schedule.

* The beta copy is due on September 13, 2022. The fallback date is September 20, 2022.
* Final Fedora 37 is planned for release on October 18, 2022. The fallback date is October 25, 2022.

![Fedora 37 Workstation with GNOME 43][1]

### Fedora 37: Top New Features

#### Kernel

**First** up are the critical items that make the core. Fedora 37 is powered by **Linux Kernel 5.19,** the latest mainline Kernel available now. Linux Kernel 5.19 brings essential features such as a fix for Ratbleed vulnerability, ARM support, Apple M1 NVMe SSD controller support and many such features, which you can read in our [Kernel feature guide][2].

The advantage of using the latest Kernel is that you can be assured that you are using the latest and greatest hardware support available at this moment in time.

**Next** up, the desktop environments are updated in this release.

#### Desktop Environment

Fedora 37 is the first distribution which brings the stunning **GNOME 43** desktop, which brings some excellent features such as:

* [Revamped quick settings][3] with pill-buttons
* Files (nautilus) 43 with GTK4 and libadwaita port
* Files with rubberband, emblems, responsive sidebar-like features
* Updated GNOME Web with WebExtension API support

And many features you have been waiting for for years. Do check out my [GNOME 43 feature guide][4] to learn more.

Fedora 37 brings **KDE Plasma 5.26** desktop environment with tons of new features, performance improvements and bug fixes. The most noteworthy features of the KDE Plasma desktop include:

* An updated overview screen.
* Dynamic wallpaper for dark and light themes.
* Updated KDE Framework and applications.

Since the lightweight desktop LXQt gets a stable update 1.1.0, it arrives in Fedora 37. **LXQt 1.1.0** brings a default colour palette for dark themes for a uniform look, two variants (simple and compact) of the application menu and re-arranged GTK settings. Furthermore, LXQt 1.1.0 also starts the initial work for the Qt 6.0 porting of desktop components. All these bug fixes and enhancements arrive in the Fedora LXQt edition.

In addition, other primary desktop flavours remain at their current releases since no significant new updates arrive, i.e. **Xfce 4.16 and MATE 1.24**for the respective Fedora flavours.

Let’s see what the system-wide changes in this release that impacts all the Fedora flavours are.

#### System wide changes

The most significant change is the official support for **Raspberry Pi 4** boards. Thanks to the works over the years, you can now enjoy Fedora 37 on your favourite Pi boards with out-of-the-box supports.

Fedora Linux is always a pioneer in advancing technology and adopting the latest features before any other distro. With that in mind, the **SDDM display manager now comes with default Wayland** in KDE Plasma (and Kinoite) and different flavours. This completes the Wayland transition from the Fedora distro aspect for this flavour.

As I [reported earlier][5], Fedora Linux 37 plans to provide us with a preview image of a **Web-based installer** for Anaconda. It might not be available immediately following the release. But it should be within a few days post-release.

Other noteworthy features include changing the **default hostname from “fedora” to “localhost”** to mitigate some third-party system configuration detection.

Other than that, the **Fedora Core OS** is made to be an official Fedora edition and now stands together with Server, IoT and cloud editions for better discovery and adoption. Fedora Core OS minimal footprint OS is primarily used for container workloads and brings auto updates and additional features.

Following the tradition, this release also features a [brand new wallpaper][6] with both night and day version. I must say it’s looks awesome (see the above desktop image).

Finally, also in this release, Fedora **drops 32-bit Java** packages, including JDK 8, 11, and 17, since usage is low. In addition, the openssl1.1 package is also deprecated.

The toolchain, apps and programming stack is updated as follows:

* Glibc 2.36 and Binutils 2.38
* Node.js 18.x
* Perl 5.36
* Python 3.11

### Summary of features in Fedora 37

So, that’s about it with the features of this release. Here’s a summary of the Fedora 37 features:

* Linux Kernel 5.19
* GNOME 43
* KDE Plasma 5.26
* Xfce 4.16
* MATE 1.24
* LXQt 1.1.0
* A preview image of the new web-based installer
* The SDDM display manager defaults to Wayland (in KDE Plasma and others)
* Official Raspberry Pi 4 support
* Fedora Core OS becomes the official flavour
* Key packages dropping 32-bit support
* And associated toolchain and programming language updates.

If you have spare time, you can [give it a spin][7] or test drive. Although, it is extremely unstable and not recommended to run the development version until beta.

**So, what’s your favourite feature in this release? Let me know in the comment section.**

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/fedora-37/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/08/Fedora-37-Workstation-with-GNOME-43-1024x572.jpg
[2]: https://www.debugpoint.com/linux-kernel-5-19/
[3]: https://www.debugpoint.com/gnome-43-quick-settings/
[4]: https://www.debugpoint.com/gnome-43/
[5]: https://debugpointnews.com/fedora-37-anaconda-web-ui-installer/
[6]: https://debugpointnews.com/fedora-37-wallpaper/
[7]: https://dl.fedoraproject.org/pub/fedora/linux/development/37/Workstation/x86_64/iso/
