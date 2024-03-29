[#]: subject: "Fedora Media Writer: World-Class LIVE USB Creator [Tutorial]"
[#]: via: "https://www.debugpoint.com/2022/05/fedora-media-writer/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora Media Writer: World-Class LIVE USB Creator [Tutorial]
======
A tutorial on installing and using Fedora Media Writer to create LIVE USB from Linux & Windows.

### Fedora Media Writer

The community and Fedora Linux team develop and maintain the [Fedora Media Writer app][1]. This application writes any ISO image to your flash drive (USB stick). In addition, Fedora Media Writer also has features to download the ISO file directly from the Fedora Mirrors, provided you have a stable internet connection.

Moreover, it gives you a list of options for download – such as Official Editions, Emerging Editions, Spins and Fedora Labs images.

Not only that, but you can also use this nifty utility to write any other ISO images to your flash drive. It need not be the Fedora ISO always.

Although there are other popular utilities available for creating LIVE USBs, such as [Etcher][2], Ventoy, and Rufus – you can still give this utility a try, considering the team develops it from mainstream Fedora Linux with contributors.

So, in summary, here are quick feature highlights of Fedora Media Writer.

#### Features Summary of Fedora Media Writer

* Available for Linux, Windows and macOS
* Directly download + write the images to a USB flash drive
* Official Editions (Workstation, IoT, Server) download
* Emerging Editions (Silverblue, Kinoite) download
* Spins (KDE Plasma, Xfce, etc)
* Labs (Fedora Astronomy, Robotic and other flavours)
* Available as Flatpak for Linux Distros
* Also, can write any other ISO images (non-Fedora) to a USB stick.
* Ability to format USB stick, restore flash drive
* Based on Qt

### How to Install

#### Linux

Fedora Media Writer is available as Flatpak for Linux Distributions. To install it in any Linux (such as Fedora, Ubuntu, or Linux Mint) – [set up Flatpak by following this guide][3].

Then, click on the below link to install. This will launch the official Software application of your Linux Distro (such as Discover, GNOME Software). After installation, you can launch it via Application Menu.

#### Windows

If you are a Windows user and planning to migrate to Linux (or Fedora), it is a perfect tool. You need to download the exe installer from GitHub (link below) and follow the onscreen instruction for installation.

[Latest Installer for Windows (exe)][4]

After installation, you can launch it from Start Menu.

For macOS, you can get the dmg file in the above link.

### How to use Fedora Media Writer to Create LIVE USB in Linux

The first screen gives you two main options. The automatic download option is for downloading the ISO images on the fly. And the second option is to write the already downloaded ISO files from your disk directly.

If you have already plugged in the USB, you should see it as the third option. The third option is to format and delete all the data from your USB stick and restore it to its factory settings.

Furthermore, you can use this utility for just formatting your USB flash drive as well. You do not need any command or anything fancy. A point to note is that this option is only visible when your USB stick has data. If it’s already formatted, the tool can detect it and won’t show you the option to restore it!! 😲

#### Automatic Download and Write

The automatic Download option gives you the following screen to download any Fedora ISO you want from mirrors. This is useful for many because it eliminates the hassles of separately downloading ISO files, verifying checksum, etc.

After choosing the distribution, the final screen gives you the option for version (Fedora 36, 35, etc.) and architecture (x86, ARM, etc.). Also, you should see the USB destination. Click on Download and Write to start the process.

#### Write an existing ISO file from the disk.

When you choose the ‘select iso file’ option, you can select the file from your system. After that, select the destination USB drive and click Write to start the process.

After the write operation is finished, you can see a confirmation message shown above. It took standard time to write a 3GB~ ISO during my test, around 3 to 4 minutes.

### Using Fedora Media Writer to Create LIVE USB in Windows, macOS

The steps are the same to use this utility in Windows and macOS, as shown above for Linux. You can easily find the shortcuts after installation and launch in the same way.

### Closing Notes

I hope this guide helps you use Fedora Media Writer for your day to day USB writing work. Also, the good thing about this utility is that you can use it for formatting/restoring your USB stick. You do not require GParted or GNOME Disks anymore.

It’s such a terrific utility for Linux, Windows and macOS users.

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/fedora-media-writer/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://github.com/FedoraQt/MediaWriter
[2]: https://www.debugpoint.com/2021/01/etcher-bootable-usb-linux/
[3]: https://flatpak.org/setup/
[4]: https://github.com/FedoraQt/MediaWriter/releases/latest
