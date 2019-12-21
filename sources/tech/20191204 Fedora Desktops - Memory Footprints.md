[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fedora Desktops – Memory Footprints)
[#]: via: (https://fedoramagazine.org/fedora-desktops-memory-footprints/)
[#]: author: (Troy Dawson https://fedoramagazine.org/author/tdawson/)

Fedora Desktops – Memory Footprints
======

![][1]

There are over 40 desktops in Fedora. Each desktop has it’s own strengths and weaknesses. Usually picking a desktop is a very personal preference based on features, looks, and other qualities. Sometimes, what you pick for a desktop is limited by hardware constraints.

This article is to help people compare Fedora desktops based on the desktop baseline memory. To narrow the scope, we are only looking at the desktops that have an official Fedora Live image.

### Installation and Setup

Each of the desktops was installed on it’s own KVM virtual machine. Each virtual machine had 1 CPU, 4GB of memory, 15 GB virtio solid state disk, and everything else that comes standard on RHEL 8.0 kvm.

The images for installation were the standard Fedora 31 Live images. For GNOME, that image was the Fedora Workstation. For the other desktops, the corresponding Spin was used. Sugar On A Stick (SOAS) was not tested because it does not install easily onto a local drive.

The virtual machine booted into the Live CD. “Install to Hard Disk” was selected. During the install, only the defaults were used. A root user, and a regular users were created. After installation and reboot, the Live image was verified to not be in the virtual CDROM.

The settings for each desktop was not touched. They each ran whatever settings came default from the Live CD installation. Each desktop was logged into via the regular user. A terminal was opened. Using sudo each machine ran “dnf -y update”. After update, in that sudo terminal, each machine ran “/sbin/shutdown -h now” to shut down.

### Testing

Each machine was started up. The desktop was logged into via the regular user. Three of the desktop terminals were opened. xterm was never used, it was always the terminal for that desktop, such as konsole.

In one terminal, top was started and M pressed, showing the processes sorted by memory. In another terminal, a simple while loop showed “free -m” every 30 seconds. The third terminal was idle.

I then waited 5 minutes. This allowed any startup services to finish. I recorded the final free result, as well as the final top three memory consumers from top.

### Results

  * Cinnamon
    * 624 MB Memory used
    * cinnamon 4.8% / Xorg 2.2% / dnfdragora 1.8%
  * GNOME
    * 612 MB Memory used
    * gnome-shell 6.9% / gnome-software 1.8% / ibus-x11 1.5%
  * KDE
    * 733 MB Memory used
    * plasmashell 6.2% / kwin_x11 3.6% / akonadi_mailfil 2.9%
  * LXDE
    * 318 MB Memory used
    * Xorg 1.9% / nm-applet 1.8% / dnfdragora 1.8%
  * LXQt
    * 391 MB Memory used
    * lxqt-panel 2.2% / pcmanfm-qt 2.1% / Xorg 2.1%
  * MATE
    * 465 MB Memory used
    * Xorg 2.5% / dnfdragora 1.8% / caja 1.5%
  * XFCE
    * 448 MB Memory used
    * Xorg 2.3% / xfwm4 2.0% / dnfdragora 1.8%



### Conclusion

I will let the numbers speak for themselves.

Remember that these numbers are from a default Live install. If you remove, or add services and features, your memory usage will change. But this is a good baseline to look at if you are determining your desktop based on memory consumption.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-desktops-memory-footprints/

作者：[Troy Dawson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/tdawson/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/11/desktop-memory-footprint-816x346.jpg
