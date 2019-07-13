TrueOS: A Simple BSD Distribution for the Desktop Users
======
**Brief: If you want to try something other than Linux, have a look at TrueOS. It is a BSD distribution specifically aimed at desktop users.**

When you think of It’s FOSS you probably think mainly of Linux. It’s true that we cover mostly Linux-related news and tutorials. But today we are going to do something different.We are going to look at TrueOS BSD distribution.

Linux and BSD, both fall into Unix-like operating system domain. The main difference lies at the core i.e. the kernel as both Linux and BSD have their own kernel implementation.

### TrueOS BSD Review

![TrueOS BSD ][1]

[TrueOS (formerly PC-BSD)][2] is a desktop operating system based on [FreeBSD][3]. The goal of the project is to create a version of BSD that can be easily installed and is ready to use out of the box.

TrueOS contains all of the FreeBSD goodness and includes some improvements of its own. It’s features include:

  * Graphical installer
  * OpenZFS file system
  * Automatically configured hardware
  * Full clang functionality
  * Upgrades use boot environments so live system is not harmed
  * Laptop support
  * Easy system administration
  * Built-in firewall
  * Built in support for the [Tor Project][4]



There are [two version][5] of TrueOS for desktop use. TrueOS Stable is a long-term-release that is updated every 6 months. The most recent version is 18.03. TrueOS Unstable is more of a rolling release. It is based on the latest development version of FreeBSD. TrueOS also support ARM processors with [TrueOS Pico][6].

#### Lumina

![True OS BSD][7]

While TrueOS supports many of the desktop environments that you are used to, it comes with [Lumina][8] installed by default. Started in 2014, Lumina is a lightweight desktop created by the TrueOS team from scratch. Since it is primarily designed for TrueOS and other BSDs, Lumina does not make use of “any of the Linux-based desktop frameworks (ConsoleKit, PolicyKit, D-Bus, systemd, etc..)”. However, it has been [ported][9] for several Linux distros. It currently uses Fluxbox, but they are writing a new window manage for [tighter integration][10].

Lumina does come with its own file manager, media player, archiver and other utilities. The most current version is [1.4.0][11].

#### System Requirements

TrueOS’ [handbook][12] lists the following system requirements

##### Minimum Requirements

  * 64-bit processor
  * 1 GB RAM
  * 10 – 15 GB of free hard drive space on a primary partition for a command-line server installation.
  * Network card



##### Recommended Requirements

  * 64-bit processor
  * 4 GB of RAM
  * 20 – 30 GB of free hard drive space on a primary partition for a graphical desktop installation.
  * Network card
  * Sound card
  * 3D-accelerated video card



#### Included Applications

The number of applications that come pre-installed in TrueOS is small. Here they are:

  * AppCafe
  * QupZilla
  * Photonic
  * TrueOS PDF Viewer
  * Trojita email client
  * Insight File Manager
  * Lumina Archiver
  * Lumina Media Player
  * Lumina Screenshot
  * Lumina Text Editor
  * QTerminal
  * Calculator



### Installation

I was able to successfully install TrueOS on my Dell Latitude D630. This laptop has an Intel Centrino Duo Core processor running at 2.00 GHz, NVIDIA Quadro NVS 135M graphics chip, and 4 GB of RAM.

The installation process was pretty painless. It was similar to most modern OS installers, you work your way through a series of screens which ask you for information. Interestingly, you don’t have the option to boot into a live environment. You have to install TrueOS, even if you only want to test it.

I would like to note that some BSDs are fairly easy to install. I’ve installed FreeBSD and it took a little over an hour to go from text installer to a GUI. I have not managed to install vanilla Arch yet, but I’m sure it would take longer.

### ![][13]

### Experience

I’ve been wanting to install TrueOS for a while (going back to the PC-BSD days). My only experience with BSD before this had been a web server running FreeBSD. Based on the name, I was expecting a polished desktop experience. After all, it ships with its own desktop environment. My experience was not as good as I had hoped.

Whenever I start using a new operating system, I check to see if the applications that I regularly use are available. TrueOS does come with its own package manager (AppCafe), which made things easy. I was able to quickly install LibreOffice, VLC, FireFox, and Calibre. However, I was unable to install my favorite Markdown editor, ghostwriter. Interestingly, when I searched Markdown in the AppCafe there were quite a few packages listed, but none of them were Markdown editors. I was also unable to install Dropbox, which I use to backup up my writing.

Besides the AppCafe package manager, you can also install applications using the TrueOS ports collection. To figure out how to do this, I turned to the [TrueOS handbook][14]. Unfortunately, the section on [ports][15] was very light on details. This is what I learned from my research on the web. The first step is to download the ports information from GitHub with this command: `git clone http://github.com/trueos/freebsd-ports.git /usr/ports`. From there you need to navigate to the directory of the port you want to install and type `make install`to start the process.

While this process is similar to Arch’s AUR, it limits you to install one package at a time. Also, it takes quite a while to download the entire ports collection. (I have a fast connection and it took over 30 minutes.) When I was searching for information about how to use ports, I did see a command that allows you to only download the ports that you want to install, but that was not included in the TrueOS handbook.

Like macOS and Windows, TrueOS has login and shutdown jingles. While it was cool at first, it got annoying pretty quickly. Especially, when I didn’t expect it.

I applaud the TrueOS team for creating their own desktop environment (especially since the whole TrueOS team consists of less than a dozen people.). They have come a long way from their first release, but it still feels unfinished. One thing that I kept noticing was that the icons in the system tray were not a uniform size. The battery and sound icon were large, but the wifi icon was half the size. Also, when I went to click on the “start” button, I had to make sure to click on the icon, not near it, or the menu would not launch. Most other “start” menus don’t have this problem. They seem to have a large click area, so you don’t miss.

For some reason, I could not get the system clock set. I entered the information for my timezone and location, but TrueOS set the time ahead by five hours.

![][16]

### Final Thoughts

Overall, I like the idea of TrueOS, a user-friendly BSD. It offered an experience that was familiar, but different than any Linux distro. Unfortunately, the lack of applications was disappointing. Also, I wish the TrueOS handbook was more fleshed out in some areas.

I would recommend that you install TrueOS if you want to get the full the BSD experience, complete with its own desktop environment. There is nothing even remotely related to Linux here.

Have you ever TrueOS? What is your favorite version of BSD? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media.

--------------------------------------------------------------------------------

via: https://itsfoss.com/trueos-bsd-review/

作者：[John Paul][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[1]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/trueos-bsd-featured-800x450.jpg
[2]:https://www.trueos.org
[3]:https://en.wikipedia.org/wiki/FreeBSD
[4]:https://www.trueos.org/handbook/using.html#tor-mode
[5]:https://www.trueos.org/downloads/
[6]:https://www.trueos.org/trueos-pico/
[7]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/02/TrueOSScreenshot2-800x500.png
[8]:https://lumina-desktop.org
[9]:https://lumina-desktop.org/get-lumina/
[10]:https://lumina-desktop.org/faq/
[11]:https://lumina-desktop.org/version-1-4-0-released/
[12]:https://www.trueos.org/handbook/introducing.html#hardware-requirements-and-supported-hardware
[13]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/02/TrueOSScreenshot5.png
[14]:https://www.trueos.org/handbook/trueos.html
[15]:https://www.trueos.org/handbook/using.html#freebsd-ports
[16]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/02/TrueOSScreenshot4.png
