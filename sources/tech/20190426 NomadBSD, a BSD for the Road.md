[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (NomadBSD, a BSD for the Road)
[#]: via: (https://itsfoss.com/nomadbsd/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

NomadBSD, a BSD for the Road
======

As regular It’s FOSS readers should know, I like diving into the world of BSDs. Recently, I came across an interesting BSD that is designed to live on a thumb drive. Let’s take a look at NomadBSD.

### What is NomadBSD?

![Nomadbsd Desktop][1]

[NomadBSD][2] is different than most available BSDs. NomadBSD is a live system based on FreeBSD. It comes with automatic hardware detection and an initial config tool. NomadBSD is designed to “be used as a desktop system that works out of the box, but can also be used for data recovery, for educational purposes, or to test FreeBSD’s hardware compatibility.”

This German BSD comes with an [OpenBox][3]-based desktop with the Plank application dock. NomadBSD makes use of the [DSB project][4]. DSB stands for “Desktop Suite (for) (Free)BSD” and consists of a collection of programs designed to create a simple and working environment without needing a ton of dependencies to use one tool. DSB is created by [Marcel Kaiser][5] one of the lead devs of NomadBSD.

Just like the original BSD projects, you can contact the NomadBSD developers via a [mailing list][6].

[][7]

Suggested read Enjoy Netflix? You Should Thank FreeBSD

#### Included Applications

NomadBSD comes with the following software installed:

  * Thunar file manager
  * Asunder CD ripper
  * Bash 5.0
  * Filezilla FTP client
  * Firefox web browser
  * Fish Command line
  * Gimp
  * Qpdfview
  * Git


  * Hexchat IRC client
  * Leafpad text editor
  * Midnight Commander file manager
  * PaleMoon web browser
  * PCManFM file manager
  * Pidgin messaging client
  * Transmission BitTorrent client


  * Redshift
  * Sakura terminal emulator
  * Slim login manager
  * Thunderbird email client
  * VLC media player
  * Plank application dock
  * Z Shell



You can see a complete of the pre-installed applications in the [MANIFEST file][8].

![Nomadbsd Openbox Menu][9]

#### Version 1.2 Released

NomadBSD recently released version 1.2 on April 21, 2019. This means that NomadBSD is now based on FreeBSD 12.0-p3. TRIM is now enabled by default. One of the biggest changes is that the initial command-line setup was replaced with a Qt graphical interface. They also added a Qt5 tool to install NomadBSD to your hard drive. A number of fixes were included to improve graphics support. They also added support for creating 32-bit images.

[][10]

Suggested read 6 Reasons Why Linux Users Switch to BSD

### Installing NomadBSD

Since NomadBSD is designed to be a live system, we will need to add the BSD to a USB drive. First, you will need to [download it][11]. There are several options to choose from: 64-bit, 32-bit, or 64-bit Mac.

You will be a USB drive that has at least 4GB. The system that you are installing to should have a 1.2 GHz processor and 1GB of RAM to run NomadBSD comfortably. Both BIOS and UEFI are supported.

All of the images available for download are compressed as a `.lzma` file. So, once you have downloaded the file, you will need to extract the `.img` file. On Linux, you can use either of these commands: `lzma -d nomadbsd-x.y.z.img.lzma` or `xzcat nomadbsd-x.y.z.img.lzma`. (Be sure to replace x.y.z with the correct file name you just downloaded.)

Before we proceed, we need to find out the id of your USB drive. (Hopefully, you have inserted it by now.) I use the `lsblk` command to find my USB drive, which in my case is `sdb`. To write the image file, use this command `sudo dd if=nomadbsd-x.y.z.img of=/dev/sdb bs=1M conv=sync`. (Again, don’t forget to correct the file name.) If you are uncomfortable using `dd`, you can use [Etcher][12]. If you have Windows, you will need to use [7-zip][13] to extract the image file and Etcher or [Rufus][14] to write the image to the USB drive.

When you boot from the USB drive, you will encounter a simple config tool. Once you answer the required questions, you will be greeted with a simple Openbox desktop.

### Thoughts on NomadBSD

I first discovered NomadBSD back in January when they released 1.2-RC1. At the time, I had been unable to install [Project Trident][15] on my laptop and was very frustrated with BSDs. I downloaded NomadBSD and tried it out. I initially ran into issues reaching the desktop, but RC2 fixed that issue. However, I was unable to get on the internet, even though I had an Ethernet cable plugged in. Luckily, I found the wifi manager in the menu and was able to connect to my wifi.

Overall, my experience with NomadBSD was pleasant. Once I figured out a few things, I was good to go. I hope that NomadBSD is the first of a new generation of BSDs that focus on mobility and ease of use. BSD has conquered the server world, it’s about time they figured out how to be more user-friendly.

Have you ever used NomadBSD? What is your BSD? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][16].

--------------------------------------------------------------------------------

via: https://itsfoss.com/nomadbsd/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/wp-content/uploads/2019/04/NomadBSD-desktop-800x500.jpg
[2]: http://nomadbsd.org/
[3]: http://openbox.org/wiki/Main_Page
[4]: https://freeshell.de/%7Emk/projects/dsb.html
[5]: https://github.com/mrclksr
[6]: http://nomadbsd.org/contact.html
[7]: https://itsfoss.com/netflix-freebsd-cdn/
[8]: http://nomadbsd.org/download/nomadbsd-1.2.manifest
[9]: https://itsfoss.com/wp-content/uploads/2019/04/NomadBSD-Openbox-menu-800x500.jpg
[10]: https://itsfoss.com/why-use-bsd/
[11]: http://nomadbsd.org/download.html
[12]: https://www.balena.io/etcher/
[13]: https://www.7-zip.org/
[14]: https://rufus.ie/
[15]: https://itsfoss.com/project-trident-interview/
[16]: http://reddit.com/r/linuxusersgroup
