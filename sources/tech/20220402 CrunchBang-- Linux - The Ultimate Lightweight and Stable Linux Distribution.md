[#]: subject: "CrunchBang++ Linux – The Ultimate Lightweight and Stable Linux Distribution"
[#]: via: "https://www.debugpoint.com/2022/04/crunchbang-linux-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

CrunchBang++ Linux – The Ultimate Lightweight and Stable Linux Distribution
======
WE REVIEW THE DEBIAN BASED, OPENBOX POWERED LIGHTWEIGHT LINUX
DISTRIBUTION CRUNCHBANG++ LINUX AND GUIDE YOU IF YOU PLAN TO USE IT.
The CrunchBang++ Linux is a successor of the unique CrunchBang project, which is now discontinued. The earlier CrunchBang Linux was popular because of its using very minimal system resources and being friendly on low-end hardware. CrunchBang++ also has a 32-bit installer (rare these days) for outdated hardware or PCs.

We received some comments about not featuring CrunchBang++ in our earlier article on [top lightweight Linux Distributions][1]. So, we wanted to do a deep dive on this super-thin Linux Distribution in terms of performance, Accessibility and other factors. Let’s dig in.

### CrunchBang++ Linux Review

![CrunchBang++ Linux Desktop with Openbox][2]

#### LIVE Medium and Installation

As of writing this review, CrunchBang++ is based on the latest Debian 11 Bullseye and provides both 32-bit and 64-bit ISO variants. You can get your copy from the [official website][3]. For this review, we have used the 64-bit installer. The 64-bit installer size is 1.6GB, which is perfect if you compare the popular Linux Distribution ISO size today. For example, the latest Ubuntu 64-bit desktop ISO is 3.2GB+, which is enormous.

The installer boot menu provides the option to test the LIVE image and kick off the installation. If you are planning to try the LIVE image first, go ahead. But you can not start the installation from the LIVE medium! Instead, you have to boot again and choose the install option. The Live desktop user id and password are both ‘live’.

![Installation in the boot menu][4]

The installation in both physical and virtual machines ([virt-manager][5]) went fine. CrunchBang++ uses Debian’s native installer, which is a little complex. But you can easily install it by following the on-screen instructions. You may want to check out our [Debian Installation guide][6] if you are new to Debian installer.

Installation time is around 5 to 10 minutes on average in virtual and physical systems.

#### First Look with Desktop

CrunchBang++ gives you the classic Openbox window manager experience. The login screen is surprisingly clean and perfect, with only the option to enter your credentials.

If you are running it for the first time, a welcome script will guide you to check the internet speed, update your system, etc.

![The welcome script][7]

The Openbox itself is fast and clean. The desktop brings a clean look with its pre-configured SBPP Openbox theme with the following components –

  * [gmrun][8] – a lightweight application launcher
  * [Tint2][9] panel, which is at the top of the desktop
  * [dmenu][10] – the simple dynamic menu system



You can configure each of them with easy configuration options accessible from the right-click menu.
By default, two workspaces are accessible via the top panel. The top panel also have the basic tray icons for your needs:

  * Volume Control
  * Network connections
  * Language tool
  * Battery monitor
  * Clipboard manager



Being a window manager, you do not have an application view. But with the gmrun application launcher, it’s super easy to launch any application. However, the primary Openbox right-click menu gives you all the options whenever you need any application to launch.

#### Accessibility and applications

CrunchBang++ only includes the minimum required applications to keep the ISO and installation lightweight. The following applications are pre-installed.

  * GIMP
  * Thunar File Manager
  * Catfish File Search
  * Gnumeric
  * VLC Media Player
  * Filezilla
  * Remote Desktop Client
  * Transmission Torrent Client
  * Screenshot utility
  * Geany Text Editor



[][11]

SEE ALSO:   ExTiX 21.1 Released based on latest Deepin Desktop [Review]

The powerful Synaptic package manager takes care of all your software needs. LibreOffice is not installed by default, so you need to install it separately. There is no utility for centralized settings, so you may feel the lack of a settings manager, sometimes.

#### Performance and Resource Usage

The performance of CrunchBang++ is perfect for lightweight distribution.

This distro uses 585 MB of RAM, and the CPU is at 1% in an idle state. If you keep the system running for an hour or more in an inactive state, the RAM is further reduced to around 350 MB. This is an impressive metric.

![Performance During Idle State][12]

To test the heavy workload, we opened one instance of the below application in CrunchBang++:

  * Firefox with two tabs
  * Thunar File Manager
  * GIMP
  * Gnumeric
  * Text Editor
  * Terminal
  * Catfish File Search



This workload uses 1.07 GB of RAM, and the CPU is at 5%-7%.

The default installation of this distro uses 4 GB of disk space.

![Performance During Heavy workload State][13]

#### Connectivity

We ran it through various Connectivity tests as outlined below. And it passed each of them except Bluetooth.

  * Wifi detection and connection – works perfectly
  * It aligned correctly with multiple displays and resolution config (thanks to the pre-installed ARandR).
  * Auto-detection of USB (even in virtual machine mode) – works well



There is no utility available for Bluetooth enable, discovery and connect (like some of the Xfce desktop flavours). So, if you install a utility, you should be all set.

#### Things that did not go well with CrunchBang++

In my opinion, this Linux distribution should be used by little experienced users who are okay to navigate around errors in Linux in general and comfortable using the terminal when needed.

I found some of the items that I think are required with default installations. There is no way to configure the Mouse, Keyboard in this distro. No utility is pre-installed. You can, however, tweak them via the terminal. You may need to install additional applications to configure those.

There are some bugs in the right-click menu with recent applications and some in the Nitrogen wallpaper changer. However, they are not a showstopper for your day to day usage.

So, overall I think it’s stable and can work well despite the missing pieces.

### Summary and Conclusion

While wrapping up the CrunchBang++ review, I am compelled to say that it is one of the efficient and functional Linux distribution. It might not be the shiny and glittery desktop out there, but a stable and productive Linux Distribution that can run on any hardware. You can easily use it for your daily driver and keep on using it for years without formatting your entire system. A great piece of software from the people involved with CrunchBang++.

Cheers.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][14], [Twitter][15], [YouTube][16], and [Facebook][17] and never miss an update!

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/crunchbang-linux-review/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2022/03/lightweight-linux-distributions-2022/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/CrunchBang-Linux-Desktop-with-Openbox-1024x576.jpg
[3]: https://crunchbangplusplus.org/
[4]: https://www.debugpoint.com/wp-content/uploads/2022/04/Installation-in-boot-menu.jpg
[5]: https://www.debugpoint.com/2020/11/virt-manager/
[6]: https://www.debugpoint.com/2021/01/install-debian-buster/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/04/The-welcome-script.jpg
[8]: https://github.com/WdesktopX/gmrun
[9]: https://gitlab.com/o9000/tint2
[10]: https://tools.suckless.org/dmenu/
[11]: https://www.debugpoint.com/2021/01/extix-21-1-review/
[12]: https://www.debugpoint.com/wp-content/uploads/2022/04/Performance-During-Idle-State.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/04/Performance-During-Heavy-workload-State.jpg
[14]: https://t.me/debugpoint
[15]: https://twitter.com/DebugPoint
[16]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[17]: https://facebook.com/DebugPoint
