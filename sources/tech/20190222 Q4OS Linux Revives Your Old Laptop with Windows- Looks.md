[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Q4OS Linux Revives Your Old Laptop with Windows’ Looks)
[#]: via: (https://itsfoss.com/q4os-linux-review)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Q4OS Linux Revives Your Old Laptop with Windows’ Looks
======

There are quite a few Linux distros available that seek to make new users feel at home by [imitating the look and feel of Windows][1]. Today, we’ll look at a distro that attempts to do this with limited success We’ll be looking at [Q4OS][2].

### Q4OS Linux focuses on performance on low hardware

![Q4OS Linux desktop after first boot][3]Q4OS after first boot

> Q4OS is a fast and powerful operating system based on the latest technologies while offering highly productive desktop environment. We focus on security, reliability, long-term stability and conservative integration of verified new features. System is distinguished by speed and very low hardware requirements, runs great on brand new machines as well as legacy computers. It is also very applicable for virtualization and cloud computing.
>
> Q4OS Website

Q4OS currently has two different release branches: 2.# Scorpion and 3.# Centaurus. Scorpion is the Long-Term-Support (LTS) release and will be supported for five years. That support should last until 2022. The most recent version of Scorpion is 2.6, which is based on [Debian][4] 9 Stretch. Centaurus is considered the testing branch and is based on Debian Buster. Centaurus will become the LTS when Debian Buster becomes stable.

Q4OS is one of the few Linux distros that still support both 32-bit and 64-bit. It has also been ported to ARM devices, specifically the Raspberry PI and the PineBook.

The one major thing that separates Q4OS from the majority of Linux distros is their use of the Trinity Desktop Environment as the default desktop environment.

#### The not-so-famous Trinity Desktop Environment

![][5]Trinity Desktop Environment

I’m sure that most people are unfamiliar with the [Trinity Desktop Environment (TDE)][6]. I didn’t know until I discovered Q4OS a couple of years ago. TDE is a fork of [KDE][7], specifically KDE 3.5. TDE was created by Timothy Pearson and the first release took place in April 2010.

From what I read, it sounds like TDE was created for the same reason as [MATE][8]). Early versions of KDE 4 were prone to crash and users were unhappy with the direction the new release was taking, it was decided to fork the previous release. That is where the similarities end. MATE has taken on a life of its own and grew to become an equal among desktop environments. Development of TDE seems to have slowed. There were two years between the last two point releases.

Quick side note: TDE uses its own fork of Qt 3, named TQt.

#### System Requirements

According to the [Q4OS download page][9], the system requirements differ based on the desktop environment you install.

**TDE Version**

  * At least 300MHz CPU
  * 128 MB of RAM
  * 3 GB Storage



**KDE Version**

  * At least 1GHz CPU
  * 1 GB of RAM
  * 5 GB Storage



You can see from the system requirements that Q4OS is a [lightweight Linux distribution suitable for older computers][10].

#### Included apps by default

The following applications are included in the full install of Q4OS:

  * Google Chrome
  * Thunderbird
  * LibreOffice
  * VLC player
  * Konqueror browser
  * Dolphin file manager
  * AisleRiot Solitaire
  * Konsole
  * Software Center


  * KMines
  * Ockular
  * KBounce
  * DigiKam
  * Kooka
  * KolourPaint
  * KSnapshot
  * Gwenview
  * Ark


  * KMail
  * SMPlayer
  * KRec
  * Brasero
  * Amarok player
  * qpdfview
  * KOrganizer
  * KMag
  * KNotes



Of course, you can install additional applications through the software center. Since Q4OS is based on Debian, you can also [install applications from deb packages][11].

#### Q4OS can be installed from within Windows

I was able to successfully install TrueOS on my Dell Latitude D630 without any issues. This laptop has an Intel Centrino Duo Core processor running at 2.00 GHz, NVIDIA Quadro NVS 135M graphics chip, and 4 GB of RAM.

You have a couple of options to choose from when installing Q4OS. You can either install Q4OS with a CD (Live or install) or you can install it from inside Window. The Windows installer asks for the drive location you want to install to, how much space you want Q4OS to take up and what login information do you want to use.

![][12]Q4OS Windows installer

Compared to most distros, the Live ISOs are small. The KDE version weighs less than 1GB and the TDE version is just a little north of 500 MB.

### Experiencing Q4OS: Feels like older Windows versions

Please note that while there is a KDE installation ISO, I used the TDE installation ISO. The KDE Live CD is a recent addition, so TDE is more in line with the project’s long term goals.

When you boot into Q4OS for the first time, it feels like you jumped through a time portal and are staring at Windows 2000. The initial app offerings are very slim, you have access to a file manager, a web browser and not much else. There isn’t even a screenshot tool installed.

![][13]Konqueror film manager

When you try to use the TDE browser (Konqueror), a dialog box pops up recommending using the Desktop Profiler to [install Google Chrome][14] or some other recent web browser.

The Desktop Profiler allows you to choose between a bare-bones, basic or full desktop and which desktop environment you wish to use as default. You can also use the Desktop Profiler to install other desktop environments, such as MATE, Xfce, LXQT, LXDE, Cinnamon and GNOME.

![Q4OS Welcome Screen][15]![Q4OS Welcome Screen][15]Q4OS Welcome Screen

Q4OS comes with its own application center. However, the offerings are limited to less than 20 options, including Synaptic, Google Chrome, Chromium, Firefox, LibreOffice, Update Manager, VLC, Multimedia codecs, Thunderbird, LookSwitcher, NVIDIA drivers, Network Manager, Skype, GParted, Wine, Blueman, X2Go server, X2Go Client, and Virtualbox additions.

![][16]Q4OS Software Centre

If you want to install anything else, you need to either use the command line or the [synaptic package manager][17]. Synaptic is a very good package manager and has been very serviceable for many years, but it isn’t quite newbie friendly.

If you install an application from the Software Centre, you are treated to an installer that looks a lot like a Windows installer. I can only imagine that this is for people converting to Linux from Windows.

![][18]Firefox installer

As I mentioned earlier, when you boot into Q4OS’ desktop for the first time it looks like something out of the 1990s. Thankfully, you can install a utility named LookSwitcher to install a different theme. Initially, you are only shown half a dozen themes. There are other themes that are considered works-in-progress. You can also enhance the default theme by picking a more vibrant background and making the bottom panel transparent.

![][19]Q4OS using the Debonair theme

### Final Thoughts on Q4OS

I may have mentioned a few times in this review that Q4OS looks like a dated version of Windows. It is obviously a very conscious decision because great care was taken to make even the control panel and file manager look Windows-eque. The problem is that it reminds me more of [ReactOS][20] than something modern. The Q4OS website says that it is made using the latest technology. The look of the system disagrees and will probably put some new users off.

The fact that the install ISOs are smaller than most means that they are very quick to download. Unfortunately, it also means that if you want to be productive, you’ll have to spend quite a bit of time downloading software, either manually or automatically. You’ll also need an active internet connection. There is a reason why most ISOs are several gigabytes.

I made sure to test the Windows installer. I installed a test copy of Windows 10 and ran the Q4OS installer. The process took a few minutes because the installer, which is less than 10 MB had to download an ISO. When the process was done, I rebooted. I selected Q4OS from the menu, but it looked like I was booting into Windows 10 (got the big blue circle). I thought that the install failed, but I eventually got to Q4OS.

One of the few things that I liked about Q4OS was how easy it was to install the NVIDIA drivers. After I logged in for the first time, a little pop-up told me that there were NVIDIA drivers available and asked me if I wanted to install them.

Using Q4OS was definitely an interesting experience, especially using TDE for the first time and the Windows look and feel. However, the lack of apps in the Software Centre and some of the design choices stop me from recommending this distro.

**Do you like Q4OS?**

Have you ever used Q4OS? What is your favorite Debian-based distro? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][21].


--------------------------------------------------------------------------------

via: https://itsfoss.com/q4os-linux-review

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/windows-like-linux-distributions/
[2]: https://q4os.org/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/q4os1.jpg?resize=800%2C500&ssl=1
[4]: https://www.debian.org/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/q4os4.jpg?resize=800%2C412&ssl=1
[6]: https://www.trinitydesktop.org/
[7]: https://en.wikipedia.org/wiki/KDE
[8]: https://en.wikipedia.org/wiki/MATE_(software
[9]: https://q4os.org/downloads1.html
[10]: https://itsfoss.com/lightweight-linux-beginners/
[11]: https://itsfoss.com/list-installed-packages-ubuntu/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/q4os-windows-installer.jpg?resize=800%2C610&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/q4os2.jpg?resize=800%2C606&ssl=1
[14]: https://itsfoss.com/install-chrome-ubuntu/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/q4os10.png?ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/q4os3.jpg?resize=800%2C507&ssl=1
[17]: https://www.nongnu.org/synaptic/
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/q4os5.jpg?resize=800%2C616&ssl=1
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/q4os8Debonaire.jpg?resize=800%2C500&ssl=1
[20]: https://www.reactos.org/
[21]: http://reddit.com/r/linuxusersgroup
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/q4os1.jpg?fit=800%2C500&ssl=1
