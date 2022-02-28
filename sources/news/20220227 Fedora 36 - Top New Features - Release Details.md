[#]: subject: "Fedora 36 – Top New Features & Release Details"
[#]: via: "https://www.debugpoint.com/2022/02/fedora-36/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora 36 – Top New Features & Release Details
======
THIS ARTICLE SUMMARISES SIGNIFICANT NEW FEATURES AND RELEASES
INFORMATION ABOUT FEDORA 36 RELEASE (UPCOMING).
![Fedora 36 Workstation \(pre-release\)][1]

Fedora Linux is always the pioneer in advancing new technology and adopting new features before any Linux Distributions. Continuing with that trend, Fedora 36 is a promising new release in terms of features, recent changes and embracing new critical technical advances.

This release promises more Wayland adaptation in critical use cases, some under the hood updates that helps casual workstation users, developers and enterprise users, new versions of desktop environments applications and an upgraded toolchain for your projects.

Fedora 36 Beta release is due soon, and features are frozen. Here’s the tentative schedule before we give you the rundown of the features.

### Fedora 36 Release Schedule

: March 15, 2022, with a fallback date of March 22, 2022.
**Go/No Go Decision** for final release: April 14, 2022.
Fed**ora 36 final release** is planned for April 19, 2022, with a fallback date of April 26, 2000.

### Fedora 36 – New Features

#### Kernel and GNOME 42

  * Fedora 36 is powered by Linux Kernel 5.17 at its core. This Kernel version is in the testing phase at the moment and will be released by March end and will be picked up by Fedora 36 for its final release. Linux Kernel 5.17 brings usual new hardware stack support across processors, GPU, Storage and Networking with several Kernel level optimizations. You can read details in our regular coverage of [Linux Kernel 5.17 here.][2]


  * If you are a desktop user, this release is bringing the much-awaited GNOME 42 for its base workstation edition. GNOME 42 brings revamped applications and packages migrated to libadwaita version 1.0, performance improvements in Mutter and GNOME Shell. Also a new screenshot utility, [text editor][3] to name a few of the new features of GNOME 42 which you can read in our regular coverage here – [[New features of GNOME 42][4]].



#### System-Wide Changes

  * The default font type is [changing][5] to Noto Font from DejaVu fonts. This will provide a better experience and consistent text rendering across the desktop. So, google-noto-sans* packages will be installed by default to replace dejavu*.


  * Fedora 36 will now [only install recommended dependent packages][6] on upgrade. That means during the future upgrades of the package, the dependent package will not be installed if not installed earlier.


  * OpenJDK version sees a version bump in this release from java-11-openjdk to java-17-openjdk.


  * The internal RPM package database in the Fedora system is located under `/var` today. It is now [moving][7] to `/usr` in this release. The primary reason is consistency with other RPM-based distributions such as openSUSE and Fedora rpm-ostree based systems (Kinoite, Silverblue, etc.)


  * Another interesting change in this release is making [Wayland as default][8] session with NVIDIA proprietary driver. The Wayland is a default session for FEdora since Fedora 22 but not when NVIDIA proprietary driver is in use. This changes now. If you are installing Fedora 36 on NVIDIA based system, you get a Wayland as default with open-source nouveau and Xorg session as an option on the login page.


  * Fedora 36 makes [Wayland as default][9] for distributions that uses SDDM such as Fedora KDE Spin, Kinoite flavour. Now you can get to experience Wayland based SDDM greeter with these spins.


  * The single-user installations of Fedora Workstations are much higher than shared, enterprise systems. Looking at this use case, Fedora 36 makes that single-user as administrator during installation. The Anaconda installer GUI now select the option by default.


  * The systemd console messages bring a little but [important change][10] on how the messages are displayed. Earlier the systemd messages were used to show only the systemd unit description (e.g. Network Manager). Now along with a description, it would show the unit name (e.g. NetworkManager.service) as well.



#### Desktop Environments

The official Fedora flavours arrive with their latest stable releases with this version. Here’s a quick list of the desktop environment versions.

  * [KDE Plasma 5.24][11]
  * [Xfce 4.16][12]
  * [LxQt 1.0.0][13]
  * [GNOME 42][4]



Along with the above, the web browser Firefox, LibreOffice and other apps and libraries are updated in Fedora 36.

  * PHP 8.1
  * Ruby on Rails 7.0
  * OpenJDK 17
  * Django 4.0
  * gcc 12
  * glibc 2.35
  * Golang 1.18
  * OpenSSL 3.0
  * Ruby 3.1
  * Ansible 5
  * Firefox 96
  * LibreOffice 7.3



#### Wallpaper

  * Each Fedora release brings a nice default “time of the day” wallpaper. And this version is no exception. After a lot of brainstorming and working session, the following wallpapers are chosen for this version. It features abstract nature landscapes with trees, sky, sun and water theme. You can refer to this [package][14] if you want a high-res copy of these.



![Fedora 36 Default Wallpaper – Day][15]

![Fedora 36 Default Wallpaper – Night][16]

For more details on the changes, visit the [official changelog page][17].

### Download

You can download the current nightly copy (not Rawhide) from the below link. It is reasonably stable right now. But do not use it for your daily use at the moment.

[Download Fedora 36 Nightly][18]

### Closing Notes

Overall, in my opinion, it is a reasonably well-constructed release considering the Wayland progress, toolchain updates and applications. Also, this release will be the first Linux distribution featuring GNOME 42 for workstations. Like all releases, we wait until the final copy is ready to download or upgrade.

Cheers.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][19], [Twitter][20], [YouTube][21], and [Facebook][22] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/02/fedora-36/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/02/Fedora-36-Workstation-pre-release-1024x563.jpg
[2]: https://www.debugpoint.com/2022/01/linux-kernel-5-17-rc1/
[3]: https://www.debugpoint.com/2021/12/gnome-text-editor/
[4]: https://www.debugpoint.com/2021/12/gnome-42/
[5]: https://fedoraproject.org/wiki/Changes/DefaultToNotoFonts
[6]: https://fedoraproject.org/wiki/Changes/ExcludeFromWeakAutodetect
[7]: https://fedoraproject.org/wiki/Changes/RelocateRPMToUsr
[8]: https://www.debugpoint.com/2022/02/fedora-36/.org/wiki/Changes/WaylandByDefaultOnNVIDIA
[9]: http://ct.org/wiki/Changes/WaylandByDefaultForSDDM
[10]: https://fedoraproject.org/wiki/Changes/Unit_Names_in_Systemd_Messages
[11]: https://www.debugpoint.com/2022/01/kde-plasma-5-24/
[12]: https://www.debugpoint.com/2021/02/xfce-4-16-review/
[13]: https://www.debugpoint.com/2021/11/lxqt-1-0-release/
[14]: https://github.com/fedoradesign/backgrounds/releases/tag/v36.0.0
[15]: https://www.debugpoint.com/wp-content/uploads/2022/02/Fedora-36-Default-Wallpaper-Day-1024x538.jpg
[16]: https://www.debugpoint.com/wp-content/uploads/2022/02/Fedora-36-Default-Wallpaper-Night-1024x543.jpg
[17]: https://fedoraproject.org/wiki/Releases/36/ChangeSet
[18]: https://kojipkgs.fedoraproject.org/compose/branched/Fedora-36-20220226.n.0/compose/Everything/x86_64/iso/
[19]: https://t.me/debugpoint
[20]: https://twitter.com/DebugPoint
[21]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[22]: https://facebook.com/DebugPoint
