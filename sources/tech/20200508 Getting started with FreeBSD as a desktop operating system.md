[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with FreeBSD as a desktop operating system)
[#]: via: (https://opensource.com/article/20/5/furybsd-linux)
[#]: author: (Joshua Allen Holm https://opensource.com/users/holmja)

Getting started with FreeBSD as a desktop operating system
======
FuryBSD's live desktop environment lets you try it before committing to
it.
![web development and design, desktop and browser][1]

[FreeBSD][2] is a great operating system, but, by design, it does not come with a desktop environment. Without installing additional software from FreeBSD's [ports and packages collection][3], FreeBSD is a command-line only experience. The screenshot below shows what logging into FreeBSD 12.1 looks like when every one of the "optional system components" is selected during installation.

![FreeBSD][4]

FreeBSD can be turned into a desktop operating system with any of a wide selection of desktop environments, but it takes time, effort, and [following a lot of written instructions][5]. Using the **desktop-installer** package, which provides the user with options in a text-based menu and helps automate much of the process, is still time-consuming. The biggest problem with either of these methods is that users might find out that their system is not fully compatible with FreeBSD after they have taken all the time to set things up.

[FuryBSD][6] solves that problem by providing a live desktop image that users can evaluate before installing. Currently, FuryBSD provides an Xfce image and a KDE image. Each of these images provides an installation of FreeBSD that has a desktop environment pre-installed. If users try out the image and find that their hardware works, they can install FuryBSD and have a ready-to-go desktop operating system powered by FreeBSD. For the purposes of this article, I will be using the Xfce image, but the KDE image works the exact same way.

Getting started with FuryBSD should be a familiar process to anyone who has installed a Linux distribution, any of the BSDs, or any other Unix-like open source operating system. Download the ISO from the FuryBSD website, copy it to a flash drive, and boot a computer from the flash drive. If booting from the flash drive fails, make sure Secure Boot is disabled.

![FuryBSD Live XFCE Desktop][7]

After booting from the flash drive, the desktop environment loads automatically. In addition to the Home, File System, and Trash icons, the live desktop has icons for a tool to configure Xorg, getting started instructions, the FuryBSD installer, and a system information utility. Other than these extras and some custom Xfce settings and wallpaper, the desktop environment does not come with much beyond the basic Xfce applications and Firefox.

![FuryBSD Xorg Tool][8]

Only basic graphics drivers are loaded at this point, but it is enough to check to see if the system's wired and wireless network interfaces are supported by FuryBSD. If none of the network interfaces is working automatically, the **Getting Started.txt** file contains instructions for attempting to configure network interfaces and other configuration tasks. If at least one of the network interfaces works, the **Configure Xorg** application can be used to install Intel, NVidia, or VirtualBox graphics drivers. The drivers will be downloaded and installed, and Xorg will need to be restarted. If the system does not automatically re-login to the live image user, the password is **furybsd**. Once they are configured, the graphics drivers will carry over to an installed system.

![FuryBSD Installer - ZFS Configuration][9]

If everything works well in the live environment, the FuryBSD installer can configure and install FuryBSD onto the computer. This installer runs in a terminal, but it provides the same options found in most other BSD and Linux installers. The user will be asked to set the system's hostname, configure ZFS storage, set the root password, add at least one non-root user, and configure the time and date settings. Once the process is complete, the system can be rebooted into a pre-configured FreeBSD with an Xfce (or KDE) desktop. FuryBSD did all the hard work and even took the extra effort to make the desktop look nice.

![FuryBSD Post-Install XFCE Desktop][10]

As noted above, the desktop environment does not come with a lot of pre-installed software, so installing additional packages is almost certainly necessary. The quickest way to do this is by using the **pkg** command in the terminal. This command behaves much like **dnf** and **apt**, so users coming from a Linux distribution that uses one of those should feel right at home when it comes to finding and installing packages. FreeBSD's package collection is large, so most of the big-name open source software packages are available.

Users trying out FuryBSD without having much FreeBSD experience should consult the [FreeBSD Handbook][11] to learn more about how to do things the FreeBSD way. Users with experience using any Linux distribution or one of the other BSDs should be able to figure out a lot of things, but there are differences that the handbook can help clarify. Another great resource for learning more about the FreeBSD way of doing things is _[Absolute FreeBSD, 3rd Edition][12],_ by Michael W. Lucas.

A brief overview of PC-BSD and thoughts about the distribution.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/furybsd-linux

作者：[Joshua Allen Holm][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/holmja
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh (web development and design, desktop and browser)
[2]: https://www.freebsd.org
[3]: https://www.freebsd.org/ports/
[4]: https://opensource.com/sites/default/files/uploads/freebsd.png (FreeBSD)
[5]: https://www.freebsdfoundation.org/freebsd/how-to-guides/installing-a-desktop-environment-on-freebsd/
[6]: https://www.furybsd.org
[7]: https://opensource.com/sites/default/files/uploads/furybsd_live_xfce_desktop.png (FuryBSD Live XFCE Desktop)
[8]: https://opensource.com/sites/default/files/uploads/furybsd_xorg_tool.png (FuryBSD Xorg Tool)
[9]: https://opensource.com/sites/default/files/uploads/furybsd_installer_-_zfs_configuration.png (FuryBSD Installer - ZFS Configuration)
[10]: https://opensource.com/sites/default/files/uploads/furybsd_post-install_xfce_desktop.png (FuryBSD Post-Install XFCE Desktop)
[11]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/
[12]: https://nostarch.com/absfreebsd3
