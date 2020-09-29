[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Announcing the release of Fedora 33 Beta)
[#]: via: (https://fedoramagazine.org/announcing-the-release-of-fedora-33-beta/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)

Announcing the release of Fedora 33 Beta
======

![][1]

The Fedora Project is pleased to announce the immediate availability of Fedora 33 Beta, the next step towards our planned Fedora 33 release at the end of October.

Download the prerelease from our Get Fedora site:

  * [Get Fedora 33 Workstation Beta][2] 
  * [Get Fedora 33 Server Beta][3]
  * [Get Fedora 33 IoT Beta][4]



Or, check out one of our popular variants, including KDE Plasma, Xfce, and other desktop environments, as well as images for ARM devices like the Raspberry Pi 2 and 3:

  * [Get Fedora 33 Beta Spins][5]
  * [Get Fedora 33 Beta Labs][6]
  * [Get Fedora 33 Beta ARM][7]



## **Beta Release Highlights**

### **BTRFS by default**

All of the desktop variants of Fedora 33 Beta – including Fedora Workstation, Fedora KDE, and others – will use BTRFS as the default filesystem. This is a big shift: we’ve been using ext filesystems since Fedora Core 1. BTRFS offers some really compelling features for users, including transparent compression and copy-on-write. For Fedora 33, we’re only defaulting to the basic features of BTRFS, but we’ll build out the default feature set to include more goodies in future releases.

### **Fedora Workstation**

Fedora 33 Workstation Beta includes GNOME 3.38, the newest release of the GNOME desktop environment. It is full of performance enhancements and improvements. GNOME 3.38 now includes a welcome tour after installation to help users learn about all of the great features this desktop environment offers. It also improves screen recording and multi-monitor support. For a full list of GNOME 3.38 highlights, see the [release notes][8].

Fedora 33 Workstation Beta also provides better thermal management and peak performance on Intel CPUs by including thermald in the default install. And because your desktop should be fun to look at as well as easy to use, Fedora 33 Workstation Beta includes animated backgrounds (a time-of-day slideshow with hue changes) by default.

### **Fedora IoT**

With Fedora 33 Beta, Fedora IoT is now an official Fedora Edition. Fedora IoT is geared toward edge devices on a wide variety of hardware platforms. It is based on ostree technology for safe update and rollback. It includes the Platform AbstRaction for SECurity (PARSEC), an open-source initiative to provide a common API to hardware security and cryptographic services in a platform-agnostic way.

### **Other updates**

Fedora 33 Beta defaults to using nano as the editor. nano is a more approachable editor that is more welcoming to new users. Of course, those who want to use vim, emacs, or any other editor are still able to.

Fedora 33 KDE Beta enables earlyOOM by default, as Fedora Workstation did in the previous release. This helps improve system responsiveness on systems that are running out of memory. 

Fedora 33 Beta includes updated versions of many popular packages like Ruby, Python, and Perl. .NET Core will now be available on Fedora on aarch64, in addition to x86_64. We’re also dropping a few older versions: Python 2.6 and Python 3.4 are retired. The httpd module mod_php is also dropped, as php-fpm is a more performant and more secure PHP module.

**Testing needed**

Since this is a Beta release, we expect that you may encounter bugs or missing features. To report issues encountered during testing, contact the Fedora QA team via the mailing list or in the #fedora-qa channel on Freenode IRC. As testing progresses, common issues are tracked on the [Common F33 Bugs page][9].

For tips on reporting a bug effectively, read [how to file a bug][10].

## **What is the Beta Release?**

A Beta release is code-complete and bears a very strong resemblance to the final release. If you take the time to download and try out the Beta, you can check and make sure the things that are important to you are working. Every bug you find and report doesn’t just help you, it improves the experience of millions of Fedora users worldwide! Together, we can make Fedora rock-solid. We have a culture of coordinating new features and pushing fixes upstream as much as we can. Your feedback improves not only Fedora, but Linux and free software as a whole.

## **More information**

For more detailed information about what’s new on Fedora 33 Beta release, you can consult the [Fedora 33 Change set][11]. It contains more technical information about the new packages and improvements shipped with this release.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-the-release-of-fedora-33-beta/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/09/f33-beta-816x345.png
[2]: https://getfedora.org/workstation/download/
[3]: https://getfedora.org/server/download/
[4]: https://getfedora.org/iot/download/
[5]: https://spins.fedoraproject.org/prerelease
[6]: https://labs.fedoraproject.org/prerelease
[7]: https://arm.fedoraproject.org/prerelease
[8]: https://help.gnome.org/misc/release-notes/3.38/
[9]: https://fedoraproject.org/wiki/Common_F33_bugs
[10]: https://docs.fedoraproject.org/en-US/quick-docs/howto-file-a-bug/
[11]: https://fedoraproject.org/wiki/Releases/33/ChangeSet
