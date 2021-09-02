[#]: subject: "SparkyLinux 6.0 “Po-Tolo” Released Based on Debian 11 Bullseye"
[#]: via: "https://www.debugpoint.com/2021/08/sparky-linux-6-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

SparkyLinux 6.0 “Po-Tolo” Released Based on Debian 11 Bullseye
======
We review the SparkyLinux 6 “Po-Tolo” and round up the release.
[SparkyLinux][1] is a desktop-based Linux distribution based on Debian and provides almost all major desktop flavors. It is a unique distribution in the sense that it provides both Debian Stable and Debian Testing editions with the latest desktop packages. SparkyLinux also provides a collection of curated applications, with some special editions as well. For example, if you are a Game lover, then the SparkyLinux GameOver edition is there. For system admins, there is a Rescue Edition as well to fix broken systems. All these special editions come with pre-loaded games, utilities with some proprietary packages as well.

The latest release of SparkyLinux 6 brings the packages from [Debian 11 Bullseye][2], which released a while back. Let’s take a look at what’s new.

![SparkyLinux 6 desktop \(Xfce\)][3]

### SparkyLinux 6 – What’s New

  * SparkyLinux 6 is based on Debian 11 Bullseye.
  * Powered by Linux Kernel 5.10.x LTS


  * This distribution maintains its own repo, and it is now updated with Bullseye packages.
  * The default and necessary applications are updated to their respective Debian stable version. Here’s a quick update:



– Firefox 78.13.0ESR instead of Firefox (latest)
– Thunderbird 78.13.0
– VLC 3.0.16
– LibreOffice 7.0.4
– Calamares 3.2.41.1

  * The default AppCenter – APTUS is included in this release which provides you curated 2000+ applications which can be installed via a simple GUI with one-click. This is one of the best feature of SparkyLinux, specially for new users or large deployments.


  * The APTUS – AppCenter also provides one-click features for the followings –



System upgrade
Search packages
Fix broken packages
Edit repo
Clean up cache
…and more

  * Desktop environments retain their current stable versions with Sparky flavors –



Xfce 4.16
KDE Plasma 5.22
LXQt 0.17

  * Other changes include, the MinimalGUI version changed file manager to PCManFM and browser to Firefox ESR.



Detailed changes with information is available [here][4].

### Download, Upgrade and Install

If you are using an earlier version of SparkyLinux, simple making a system upgrade takes you to SparkyLinux 6.0. No additional steps are required.

[][5]

SEE ALSO:   SparkyLinux 2021.03 Gets First-Ever KDE Plasma Edition with Debian 11

For fresh installation with respective Desktop environments – refer below link for download. You can use [Etcher][6] or similar utility to create LIVE usb for fresh installation. Do not forget to turn off secure boot if you are installing in UEFI systems.

[download sparkylinux stable][7]

### Sparky Linux 6 – Quick Review

  * I ran SparkyLinux in a virtual machine and native install, both with Xfce desktop edition for a quick test. The installation went smooth, thanks to the awesome Calamares installer. No surprises there.
  * After initial boot, a welcome screen guides you to go over the important items if you may want to read. SparkyLinux takes care of system configurations based on GUI based utility. For example, you do not need to open terminal and run “sudo apt upgrade” to update your system. It’ll prompt you that an upgrade is available, you give admin password, and it takes care of it.
  * SparkyLinux is super stable thanks to Debian and very lightweight. In idle scenario, the Xfce desktop with SparkyLinux was consuming around 600 MB of memory and most of the CPU is used by respective desktop window manager which is at around 5%.
  * If you are using KDE Plasma or LXQt – the memory and CPU usage should vary, but they would not fluctuate much.
  * The APTUS – AppCenter plus system administration utility is one of the best feature which makes it stand apart among other distributions.



![APTus APPCENTER in SparkyLinux][8]

  * And the good thing is, it gives you flavors of Debian Rolling and Debian Stable both. If you want to use Debian Rolling packages in SparkyLinux, then you can get it out-of-the-box.



That said, it’s a simple, stable and user-friendly distribution. Give it a try if you have not yet; It is a perfect and suitable daily-usage distro.

Cheers.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/08/sparky-linux-6-review/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://sparkylinux.org
[2]: https://www.debugpoint.com/2021/05/debian-11-features/
[3]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/SparkyLinux-6-desktop-Xfce-1024x764.jpeg
[4]: https://sparkylinux.org/sparky-6-0-po-tolo/
[5]: https://www.debugpoint.com/2021/03/sparkylinux-2021-03-release/
[6]: https://www.debugpoint.com/2021/01/etcher-bootable-usb-linux/
[7]: https://sparkylinux.org/download/stable/
[8]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/APTus-APPCENTER-in-SparkyLinux-1024x781.jpeg
