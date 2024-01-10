[#]: subject: "Upgrade Alert! Solus Linux 4.5 Adds New Calamares Installer and XFCE Flavor"
[#]: via: "https://news.itsfoss.com/solus-4-5-release/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Upgrade Alert! Solus Linux 4.5 Adds New Calamares Installer and XFCE Flavor
======
Solus 4.5 update arrives with popular calamares installer and a new
variant.
After a rocky 2023, Solus, one of the [best independent Linux distro][1] around, has **introduced Solus 4.5 as its first release of 2024**. This release comes after some time since the release of [Solus 4.4][2] which showed up halfway into 2023.

Code-named “ _Resilience_ ”, this release aims to offer many improvements and fixes across the board, while also providing **a new ISO in the form of a XFCE-equipped offering**.

Let's dive in and see what's on offer.

## 🆕 Solus 4.5: What's New?

![][3]

Solus 4.5 is powered by **a customized Linux kernel 6.6.9** that brings in better hardware support, no compression of kernel modules during initramfs creation, use of the [BORE scheduler][4] by default and enabling of all sound codecs/drivers.

Don't worry, **for those who prefer an older kernel** , there is also the option of opting for **Linux kernel 5.15.145**.

Some **key highlights** of this release include:

  * **Calamares Installer**
  * **Updated Application Suite**
  * **Desktop Environment Upgrades**



### Calamares Installer

![][5]

Solus finally has a new installer in the form of the popular [Calamares][6] installer, making the installation process straightforward, it is now easier to create partition layouts, and use different file systems such as [Btrfs][7].

### Updated Application Suite

For starters, Solus 4.5 features [Mesa 23.3.2][8] that has some neat improvements such as a **gallium VAAPI driver** , **IO support for built-in OpenGL overlay** and **ray-tracing support for Intel XE GPUs**.

Then there's the implementation of AMD's [ROCm][9] tech that **enables users with AMD hardware to take advantage of GPU acceleration** in different kinds of workloads, while also allowing for **hardware accelerated machine learning**.

On the audio/video handling front, **PipeWire replaces PulseAudio and JACK** for a more reliable and better experience overall.

The **default applications also see an update** with apps such as [Firefox 121][10], [LibreOffice 7.6.4.1][11], and [Thunderbird 115.6.0][12] being featured on all editions of Solus 4.5.

### Desktop Environment Upgrades

However, the most important fixes and improvements are on the desktop environment side of things. Solus is offered in four distinct flavors, so let's take a look at those:

**GNOME**

![][13]

Solus 4.5 GNOME Edition is being offered with [GNOME 45.2][14] with a few tweaks; the default GTK theme now uses _adw-gtk3-dark_ for providing a more uniform look when running GTK3/4 apps based on libadwaita.

The file chooser now has a grid view, allowing users to pick files by looking at the thumbnails, even the mouse and touchpad settings are now more accessible.

**Plasma**

![][15]

The Plasma Edition also follows suit with it featuring [Plasma 5.27.10][16], and all the latest KDE goodies such as KDE Gear, KDE Frameworks, KDE branch for QT, etc.

The developers are also slowly transitioning to support the [upcoming Plasma 6][17] release, and **the default behavior to open stuff like apps/folders is now double-click**.

**Budgie**

![][18]

For the flagship version, Solus 4.5 comes with [Budgie 10.8.2][19] featuring the _Budgie Trash Applet_ , that paves the way for easy trashcan browsing, restoring and clearing.

Moreover, the “ _Dark Theme_ ” toggle in the settings menu now sets the dark theme for all applications in the system that support it; except the ones that override this with other color schemes.

**XFCE (Beta)**

![][20]

Introduced as a beta, **the XFCE Edition of Solus is intended to replace the MATE edition** , which was popular for its lightweight desktop experience. With this release, the developers have said users expect some “ _rough edges_ ” as it will take some time to improve.

Solus 4.5 features [XFCE 4.18][21] with **a solid suite of applications** that include the following:

  * **Thunar 4.18.6**
  * **Parole 4.18.0**
  * **Ristretto 0.13.1**
  * **Mousepad 0.6.1**
  * **Whiskermenu 2.8.0**



Even though the devs are working towards providing a straightforward way for existing MATE Edition users to switch to Budgie or XFCE, existing users will still be supported until they are sure with their solution.

## 📥 Download Solus 4.5

You can grab the latest release of Solus in the four different variants from the [official website][22].

[Solus 4.5][22]

**For existing users** , they can either upgrade to the latest release from the Software Center, or run the following command to get the upgrade:

```

    sudo eopkg upgrade

```

You can also refer to the [official documentation][23] and [release notes][24] for more information.

_💬 Any thoughts on this release? Let us know below!_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/solus-4-5-release/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/independent-linux-distros/
[2]: https://news.itsfoss.com/solus-4-4-released/
[3]: https://news.itsfoss.com/content/images/2024/01/Solus_4.5_a.jpg
[4]: https://github.com/firelzrd/bore-scheduler
[5]: https://news.itsfoss.com/content/images/2024/01/Solus_4.5_b.jpg
[6]: https://calamares.io/
[7]: https://en.wikipedia.org/wiki/Btrfs
[8]: https://docs.mesa3d.org/relnotes/23.3.2.html
[9]: https://www.amd.com/en/products/software/rocm.html
[10]: https://www.mozilla.org/en-US/firefox/121.0/releasenotes/
[11]: https://www.libreoffice.org/download/release-notes/
[12]: https://www.thunderbird.net/en-US/thunderbird/115.6.0/releasenotes/
[13]: https://news.itsfoss.com/content/images/2024/01/Solus_4.5_c.jpg
[14]: https://discourse.gnome.org/t/gnome-45-2-released/18358
[15]: https://news.itsfoss.com/content/images/2024/01/Solus_4.5_d.jpg
[16]: https://kde.org/announcements/plasma/5/5.27.10/
[17]: https://news.itsfoss.com/kde-plasma-6-dev/
[18]: https://news.itsfoss.com/content/images/2024/01/Solus_4.5_e.jpg
[19]: https://buddiesofbudgie.org/blog/budgie-10-8-2-released
[20]: https://news.itsfoss.com/content/images/2024/01/Solus_4.5_f.jpg
[21]: https://news.itsfoss.com/xfce-4-18-release/
[22]: https://getsol.us/download/
[23]: https://help.getsol.us/docs/user/package-management/basics/
[24]: https://getsol.us/2024/01/08/solus-4-5-released/
