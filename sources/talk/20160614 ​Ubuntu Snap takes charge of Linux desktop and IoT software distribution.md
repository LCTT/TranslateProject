Ubuntu Snap takes charge of Linux desktop and IoT software distribution
===========================================================================

[Canonical][28] and [Ubuntu][29] founder Mark Shuttleworth said in an interview that he hadn't planned on an announcement about Ubuntu's new [Snap app package format][30]. But then in a matter of a few months, developers from multiple Linux distributions and companies announced they would use Snap as a universal Linux package format.

![](http://zdnet2.cbsistatic.com/hub/i/r/2016/06/14/a9b2a139-3cd4-41bf-8e10-180cb9450134/resize/770xauto/adc7d16a46167565399ecdb027dd1416/ubuntu-snap.jpg)
>Linux distributors, ISVs, and companies are all adopting Ubuntu Snap to distribute and update programs across all Linux varieties.

Why? Because Snap enables a single binary package to work perfectly and securely on any Linux desktop, server, cloud or device. According to Olli Ries, head of Canonical's Ubuntu client platform products and releases:

>The [security mechanisms in Snap packages][1] allow us to open up the platform for much faster iteration across all our flavors as Snap applications are isolated from the rest of the system. Users can install a Snap without having to worry whether it will have an impact on their other apps or their system.

Of course, as Matthew Garrett, a former Linux kernel developer and CoreOS security developer, has pointed out: If you [use Snap with an insecure program, such as the X11][2] window system, you don't actually gain any security.

Shuttleworth agrees with Garrett but points out that you can control how Snap applications interact with the rest of this system. So, for example, a web browser can be contained within a secure Snap, which uses the Ubuntu packaged [openssl][3] Transport Layer Security (TLS) and Secure Sockets Layer (SSL) library. In addition, even if something does break into the browser instance, it still can't get to the underlying operating system.

Many companies agree. [Dell][4], [Samsung][5], [Mozilla][6], [Krita][7], [Mycroft][8], and [Horizon Computing][9] are adopting Snap. [Arch Linux][10], [Debian][11], [Gentoo][12], and [OpenWrt][13] developers have also embraced Snaps and are adding it to their Linux distributions

Snap packages, aka "Snaps", now work natively on Arch, Debian, Fedora, Kubuntu, Lubuntu, Ubuntu GNOME, Ubuntu Kylin, Ubuntu MATE, Ubuntu Unity, and Xubuntu. Snap is being validated on CentOS, Elementary, Gentoo, Mint, OpenSUSE, and Red Hat Enterprise Linux (RHEL), and are easy to enable on other Linux distributions.

These distributions are adopting Snaps, Shuttleworth explained, because "Snaps bring those apps to every Linux desktop, server, device or cloud machine, giving users freedom to choose any Linux distribution while retaining access to the best apps."

Taken together these distributions represent the vast majority of common Linux desktop, server and cloud distributions. Why would they switch from their existing package management systems? "One nice feature of Snaps is support for edge and beta channels, which allow users to opt-in to the pre-release developer versions of software or stick with the latest stable versions." explained Tim Jester-Pfadt, an Arch Linux contributor.

In addition to the Linux distributors, independent software vendors (ISVs) are embracing Snap since it greatly simplifies third-party Linux app distribution and security maintenance. For example, [The Document Foundation][14] will be making the popular open-source office suite [LibreOffice][15] available as a Snap.

Thorsten Behrens, co-founder of The Document Foundation explained:

>Our objective is to make LibreOffice easily available to as many users as possible. Snaps enable our users to get the freshest LibreOffice releases across different desktops and distributions quickly, easily and consistently. As a bonus, it should help our release engineers to eventually move away from bespoke, home-grown and ancient Linux build solutions, towards something that is collectively maintained.

In a statement, Nick Nguyen, Mozilla's [Firefox][16] VP, added:

>We strive to offer users a great experience and make Firefox available across many platforms, devices and operating systems. With the introduction of Snaps, continually optimizing Firefox will become possible, providing Linux users the most up-to-date features.

Boudewijn Rempt, project lead at the [Krita Foundation][17], a KDE-based graphics program, said:

>Maintaining DEB packages in a private repository was complex and time consuming, snaps are much easier to maintain, package and distribute. Putting the snap in the store was particularly simple, this is the most streamlined app store I have published software in. [Krita 3.0][18] has just been released as a snap which will be updated automatically as newer versions become available.

It's not just Linux desktop programmers who are excited by Snap. Internet of Things (IoT) and embedded developers are also grabbing on to Snap with both hands.

Because Snaps are isolated from one another to help with data security, and can be updated or rolled back automatically, they are ideal for devices. Multiple vendors have launched snappy IoT devices, enabling a new class of "smart edge" device with IoT app store. Snappy devices receive automatic updates for the base OS, together with updates to the apps installed on the device.

Dell, which according to Shuttleworth was one of the first IoT vendors to see the power of Snap, will be using Snap in its devices.

"We believe Snaps address the security risks and manageability challenges associated with deploying and running multiple third party applications on a single IoT Gateway," said Jason Shepherd, Dell's Director of IoT Strategy and Partnerships. "This trusted and universal app format is essential for Dell, our IoT Solutions Partners and commercial customers to build a scalable, IT-ready, and vibrant ecosystem of IoT applications."

It's simple, explained OpenWrt developer Matteo Croce. "Snaps deliver new applications to OpenWrt while leaving the core OS unchanged.... Snaps are a faster way to deliver a wider range of software to supported OpenWrt access points and routers."

Shuttleworth doesn't see Snaps replacing existing Linux package systems such as [RPM][19] and [DEB][20]. Instead he sees it as being complementary to them. Snaps will sit alongside the native package. Each distribution has its own mechanisms to provide and update the core operating system and its updates. What Snap brings to the table is universal apps that cannot interfere with the base operating system

Each Snap is confined using a range of kernel isolation and security mechanisms, tailored to the Snap application's needs. A careful review process ensures that snaps only receive the permissions they require to operate. Users will not have to make complex security decisions when installing the snap.

Since Snaps are essentially self-contained zip files that can be quickly executed in place, "Snaps are much easier to create than traditional Linux packages, and allow us to evolve dependencies independent of the base operating system, so we can easily provide the very best and latest Chinese Linux apps to users across all distributions," explained Jack Yu, leader of the popular [Chinese Ubuntu Kylin][21] team.

The snap format, designed by Canonical, is handled by [snapd][22]. Its development work is done on [GitHub][23]. Porting snapd to a wide range of Linux distributions has proven straightforward, and the community has grown to include contributors from a wide range of Linux backgrounds.

Snap packages are created with the snapcrafttool. The home of the project is [snapcraft.io][24], which includes a tour and step-by-step guides to Snap creation, along with documentation for users and contributors to the project. Snaps can be built from existing distribution packages, but are more commonly built from source for optimization and size efficiency.

Unless you're an Ubuntu power-user or serious Linux developer you may not have heard of Snap. In the future, anyone who does work with Linux on any platform will know the program. It's well on its way to becoming a major -- perhaps the most important of all -- Linux application installation and upgrade mechanism.

#### Related Stories:

- [Linux expert Matthew Garrett: Ubuntu 16.04's new Snap format is a security risk][25]
- [Ubuntu Linux 16.04 is here][26]
- [Microsoft and Canonical partner to bring Ubuntu to Windows 10][27]


--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/ubuntu-snap-takes-charge-of-linux-desktop-and-iot-software-distribution/

作者：[Steven J. Vaughan-Nichols][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[28]: http://www.canonical.com/
[29]: http://www.ubuntu.com/
[30]: https://insights.ubuntu.com/2016/04/13/snaps-for-classic-ubuntu/
[1]: https://insights.ubuntu.com/2016/04/13/snaps-for-classic-ubuntu/
[2]: http://www.zdnet.com/article/linux-expert-matthew-garrett-ubuntu-16-04s-new-snap-format-is-a-security-risk/
[3]: https://www.openssl.org/
[4]: http://www.dell.com/en-us/
[5]: http://www.samsung.com/us/
[6]: http://www.mozilla.com/
[7]: https://krita.org/en/
[8]: https://mycroft.ai/
[9]: http://www.horizon-computing.com/
[10]: https://www.archlinux.org/
[11]: https://www.debian.org/
[12]: https://www.gentoo.org/
[13]: https://openwrt.org/
[14]: https://www.documentfoundation.org/
[15]: https://www.libreoffice.org/download/libreoffice-fresh/
[16]: https://www.mozilla.org/en-US/firefox/new/
[17]: https://krita.org/en/about/krita-foundation/
[18]: https://krita.org/en/item/krita-3-0-released/
[19]: http://rpm5.org/
[20]: https://www.debian.org/doc/manuals/debian-faq/ch-pkg_basics.en.html
[21]: http://www.ubuntu.com/desktop/ubuntu-kylin
[22]: https://launchpad.net/ubuntu/+source/snapd
[23]: https://github.com/snapcore/snapd
[24]: http://snapcraft.io/
[25]: http://www.zdnet.com/article/linux-expert-matthew-garrett-ubuntu-16-04s-new-snap-format-is-a-security-risk/
[26]: http://www.zdnet.com/article/ubuntu-linux-16-04-is-here/
[27]: http://www.zdnet.com/article/microsoft-and-canonical-partner-to-bring-ubuntu-to-windows-10/


