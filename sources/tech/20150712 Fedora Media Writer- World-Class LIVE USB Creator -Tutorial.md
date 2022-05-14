[#]: subject: "Fedora Media Writer: World-Class LIVE USB Creator [Tutorial]"
[#]: via: "https://www.debugpoint.com/2022/05/fedora-media-writer/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora Media Writer: World-Class LIVE USB Creator [Tutorial]
======
A TUTORIAL ON INSTALLING AND USING FEDORA MEDIA WRITER TO CREATE LIVE
USB FROM LINUX & WINDOWS.
![Fedora Media Writer][1]

### Fedora Media Writer

The community and Fedora Linux team develop and maintain the [Fedora Media Writer app][2]. This application writes any ISO image to your flash drive (USB stick). In addition, Fedora Media Writer also has features to download the ISO file directly from the Fedora Mirrors, provided you have a stable internet connection.

Moreover, it gives you a list of options for download – such as Official Editions, Emerging Editions, Spins and Fedora Labs images.

Not only that, but you can also use this nifty utility to write any other ISO images to your flash drive. It need not be the Fedora ISO always.

Although there are other popular utilities available for creating LIVE USBs, such as [Etcher][3], Ventoy, and Rufus – you can still give this utility a try, considering the team develops it from mainstream Fedora Linux with contributors.

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

Fedora Media Writer is available as Flatpak for Linux Distributions. To install it in any Linux (such as Fedora, Ubuntu, or Linux Mint) – [set up Flatpak by following this guide][4].

Then, click on the below link to install. This will launch the official Software application of your Linux Distro (such as Discover, GNOME Software). After installation, you can launch it via Application Menu.

[Install Fedora Media Writer as Flatpak][5]

#### Windows

If you are a Windows user and planning to migrate to Linux (or Fedora), it is a perfect tool. You need to download the exe installer from GitHub (link below) and follow the onscreen instruction for installation.

[Latest Installer for Windows (exe)][6]

After installation, you can launch it from Start Menu.

For macOS, you can get the dmg file in the above link.

### How to use Fedora Media Writer to Create LIVE USB in Linux

The first screen gives you two main options. The automatic download option is for downloading the ISO images on the fly. And the second option is to write the already downloaded ISO files from your disk directly.

If you have already plugged in the USB, you should see it as the third option. The third option is to format and delete all the data from your USB stick and restore it to its factory settings.

Furthermore, you can use this utility for just formatting your USB flash drive as well. You do not need any command or anything fancy. A point to note is that this option is only visible when your USB stick has data. If it’s already formatted, the tool can detect it and won’t show you the option to restore it!! 😲

#### Automatic Download and Write

![First Screen][1]

The automatic Download option gives you the following screen to download any Fedora ISO you want from mirrors. This is useful for many because it eliminates the hassles of separately downloading ISO files, verifying checksum, etc.

![The automatic download options give you these options][1]

After choosing the distribution, the final screen gives you the option for version (Fedora 36, 35, etc.) and architecture (x86, ARM, etc.). Also, you should see the USB destination. Click on Download and Write to start the process.

![The final Write screen][1]

#### Write an existing ISO file from the disk.

When you choose the ‘select iso file’ option, you can select the file from your system. After that, select the destination USB drive and click Write to start the process.

![Direct ISO write][1]

![Writing is in progress][1]

![Writing Complete][1]

After the write operation is finished, you can see a confirmation message shown above. It took standard time to write a 3GB~ ISO during my test, around 3 to 4 minutes.

### Using Fedora Media Writer to Create LIVE USB in Windows, macOS

The steps are the same to use this utility in Windows and macOS, as shown above for Linux. You can easily find the shortcuts after installation and launch in the same way.

![Running in Windows 11][1]

### Closing Notes

I hope this guide helps you use Fedora Media Writer for your day to day USB writing work. Also, the good thing about this utility is that you can use it for formatting/restoring your USB stick. You do not require GParted or GNOME Disks anymore.

It’s such a terrific utility for Linux, Windows and macOS users.

Cheers.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][7], [Twitter][8], [YouTube][9], and [Facebook][10] and never miss an update!

#### Share this:

  * [Twitter][11]

  * [Facebook][12]

  * [Print][13]

  * [LinkedIn][14]

  * [Reddit][15]

  * [Telegram][16]

  * [WhatsApp][17]

  * [Email][18]

  *


--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/fedora-media-writer/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://github.com/FedoraQt/MediaWriter
[3]: https://www.debugpoint.com/2021/01/etcher-bootable-usb-linux/
[4]: https://flatpak.org/setup/
[5]: https://dl.flathub.org/repo/appstream/org.fedoraproject.MediaWriter.flatpakref
[6]: https://github.com/FedoraQt/MediaWriter/releases/latest
[7]: https://t.me/debugpoint
[8]: https://twitter.com/DebugPoint
[9]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[10]: https://facebook.com/DebugPoint
[11]: https://www.debugpoint.com/2022/05/fedora-media-writer/?share=twitter (Click to share on Twitter)
[12]: https://www.debugpoint.com/2022/05/fedora-media-writer/?share=facebook (Click to share on Facebook)
[13]: tmp.hzW8xj7tdm#print (Click to print)
[14]: https://www.debugpoint.com/2022/05/fedora-media-writer/?share=linkedin (Click to share on LinkedIn)
[15]: https://www.debugpoint.com/2022/05/fedora-media-writer/?share=reddit (Click to share on Reddit)
[16]: https://www.debugpoint.com/2022/05/fedora-media-writer/?share=telegram (Click to share on Telegram)
[17]: https://www.debugpoint.com/2022/05/fedora-media-writer/?share=jetpack-whatsapp (Click to share on WhatsApp)
[18]: https://www.debugpoint.com/2022/05/fedora-media-writer/?share=email (Click to email this to a friend)
