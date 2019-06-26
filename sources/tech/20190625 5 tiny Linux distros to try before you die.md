[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 tiny Linux distros to try before you die)
[#]: via: (https://opensource.com/article/19/6/linux-distros-to-try)
[#]: author: (Seth Kenlon https://opensource.com/users/seth/users/marcobravo)

5 tiny Linux distros to try before you die
======
Resurrect an ancient machine, boot a broken system, or ensure a safe
public computing session with these tiny Linux distros.
![Hand putting a Linux file folder into a drawer][1]

There are plenty of Linux distributions out there to choose from when you're deciding what to run on a daily basis, yet some are so small that they get little notice. But tiny Linux distributions are powerful innovations: having an entire operating system drive a computer with less than 1GB of storage and half as much RAM is the ultimate software hack.

Tiny distros have many uses, such as:

  * Save old and slow computers from the rubbish bin. Reject planned obsolescence and use computers until they fall apart, not just until they start to feel slow.
  * Boot broken or corrupted systems from a thumb drive to recover data or repair boot partitions.
  * Ensure a safe and private environment when on a public computer. If you boot a public computer in a hotel lobby or a library from a thumb drive, you'll know your operating environment is secure.



There are plenty of lightweight distributions out there, like [Lubuntu][2], [Peppermint OS][3], and [Bodhi][4], but there's something special about the truly tiny. Here are five tiny distros you owe it to yourself to try.

### Tiny Core

![Tiny Core Linux][5]

At 11MB for a text console and 16MB for a GUI, [Tiny Core Linux][6] is almost impossibly small. I dug through my collection of old thumb drives; the smallest one was 128MB, which is still eight times the size of Tiny Core's image.

By default, Tiny Core includes the base OS, assuming you have an Ethernet connection to the internet so you can install only the applications you need. It's such an extremely efficient model that it doesn't even include an application to install the OS (although you can download it from the Tiny Core repository when you're ready to install).

I've run Tiny Core from a 128MB thumb drive on a system with 512MB RAM, and the performance was excellent, as you might expect from an OS that takes only 16MB. Performance slows only when browsing the internet in a web browser, but the blame lies with the complexity of most modern websites more than Tiny Core.

Without a GUI, Tiny Core runs well on a mere 64MB of RAM.

#### Installation

[Download Tiny Core][7] and write it to a thumb drive with **dd** or [Etcher][8].

Installing Tiny Core is easy, once you download the **tc-install** or **tc-install-GUI** application using the **Apps** icon in the launcher bar at the bottom of the screen.

![Tiny Core installer][9]

You have several options to install Tiny Core. You can install it to a thumb drive formatted as a Linux drive (this requires your computer to allow booting from a USB drive, which is common in most modern PCs but was less common for older ones), to a Microsoft FAT thumb drive (a hack for PCs that don't normally boot from USB drives), or even to a directory in an existing Linux partition.

The installation is quick, and when you finish, you can reboot your computer and boot into your Tiny Core Linux OS.

#### Applications

Since it comes with little more than a text editor and a terminal, the first thing you should do is install some applications. The **Apps** icon in the bottom launcher bar displays all the Tiny Core packages available to you. The **Apps** repository also includes important drivers, so it's useful when you're looking to get a WiFi card or a printer working.

When installing a new application or utility, you can choose between having the package load into Tiny Core at boot time or on demand. Choosing to load a package at boot makes it available to you immediately and still available after a reboot (as you would expect). Choosing to load it on demand means the package is available after Tiny Core downloads the package, but after a reboot, it won't be loaded into memory. This may keep your boot time fast and Tiny Core's footprint in RAM tiny, but it also means the package data isn't loaded into memory until you use it for the first time each session.

The application selection is a good mix between user-centric apps, like office and graphics applications, and server-centric, such as [Samba][10] and web servers.

Of course, once you start adding applications to Tiny Core, it becomes less tiny. Even the **Tiny Core Plus** image, which includes all WiFi drivers, on the Tiny Core website is only about 100MB, so "less tiny" is likely still well under 256MB or so.

#### Bottom line

Tiny Core is ideal for old computers with few resources, network boot images, and anyone who values applications over the OS. Tiny Core is a great weekend project: build the OS you want from 16MB until you have just as much of an OS as you need.

### SliTaz

![SliTaz Linux][11]

The [SliTaz Linux][12] image is about 51MB, about four times the size of Tiny Core, with an impressive collection of drivers and applications included. In fact, if you didn't know better, you might think you booted into a 1GB Ubuntu image because everything you'd expect from a basic starter image is there: text editor, web browser, paint program, spreadsheet application, and so on.

I've run SliTaz from a 128MB thumb drive on a system with 512MB RAM, and the performance was excellent. Performance slows when browsing heavy websites, but the included lightweight [Midori][13] browser keeps most sites loading quickly.

At boot time, you can choose to run SliTaz without a GUI; it runs nicely on a mere 64MB of RAM.

#### Installation

There are many download options for SliTaz because its developers and community provide many variations for potential system limitations. For instance, there's a low RAM version for systems with as little as 24MB RAM, a version with Firefox instead of Midori, a version with no extra applications, and so on.

If you're overwhelmed by options and just want to try it out, [download the rolling release][14]. This version is roughly 50MB and is updated weekly. If you fall in love with SliTaz, you can choose a download that's better for your needs—if the rolling release proves to be _too_ fresh for you.

Once you've downloaded your choice of SliTaz image, write it to a thumb drive with **dd** or [Etcher][8] and reboot.

Installing SliTaz to a thumb drive or hard drive is done through the **TazPanel** application. It guides you through partitioning your disk (as needed) and installs SliTaz to the destination you choose.

![SliTaz installer][15]

#### Applications

The **TazPanel** application is SliTaz's control center. If you're a fan of OpenSUSE or Mageia (née Mandrake), you might find TazPanel familiar, at least in concept: it's a single application that provides access to system configuration, hardware detection, user and group management, system updates, and application installation.

Available applications satisfy most basic requirements, meaning if you're not picky about which application you use to accomplish a task, then SliTaz's repositories probably have something for you. If you have specific requirements (GIMP 2.10 instead of GIMP 2.8, for instance), then you'll have to learn how to generate SliTaz packages. The good news is that the **tazpkg** command can convert from several packaging formats, including:

  * Debian packages (.deb, .udeb)
  * RPM packages (.rpm)
  * Slackware packages (.tgz)
  * Puppy packages (.sfs, .pet)
  * NuTyX packages (.cards.tar.xz)
  * Arch and Alpine Linux packages (.apk, .pkg.tar.gz, .pkg.tar.xz)
  * OpenWrt packages (.ipk, .opk)
  * Paldo packages (.tar.bz2)
  * Void packages (.xbps)
  * Tiny Core packages (.tce, .tcel, .tcem, .tcz)



#### Bottom line

SliTaz is a fast, small Linux distribution with a centralized control panel that makes it easy to learn. Because its packaging tools can convert from other Linux packaging formats, its application selection is theoretically vast, making it easy for you to design your work environment with all your favorite tools. SliTaz is small but lethal, just like its arachnid logo.

### Porteus

![Porteus Linux][16]

[Porteus][17] offers a few desktop options, with the smallest image around 270MB and the largest 350MB. That makes it one of the largest of tiny Linux images, but most of that space is dedicated to ensuring a smooth Linux desktop experience, to the point that you'll likely forget you're using a live distribution. Installing Porteus to an SSD drive or loading it to RAM during boot results in such a flawlessly smooth environment that you won't believe your OS occupies less space than half a CD-ROM.

Porteus is tiny in the sense that its base image is comparatively small, but depending on the desktop you choose, it can easily require up to 1GB of RAM to run. While other tiny Linux distributions tend to capitalize on minimalist applications to preserve space and resources, Porteus expects you to use it as you would any other distribution. Install all your favorite apps and drivers and forget you're running on a tiny, compressed root filesystem.

#### Installation

Download Porteus from your [closest Porteus mirror][18], choosing from MATE, LXQT, LXDE, OpenBox, XFCE, Cinnamon, or KDE, depending upon your preference. If you have no preference, the MATE or KDE desktop are both good at balancing image size with a familiar-feeling desktop experience.

![Porteus installer][19]

opensource.com

You can install Porteus to a thumb drive or an internal hard drive using the instructions in the [official installation guide][20]. The process is similar either way and results in a compressed root filesystem that never changes. It's a stable and contained filesystem upon which you overlay your changes as you use it. When you reboot, changes you make and applications you install are loaded into memory, so your environment is just as you left it.

#### Applications

Applications are called "modules" in Porteus lingo and are available from the [Unified Slackware Package Manager][21] (USM), which draws from five different Slackware repositories, meaning you have plenty of applications to choose from.

#### Bottom line

Porteus is a full Linux experience with a fraction of the space usually required. It's an excellent portable Linux distribution with lots of desktop options and lots of applications.

### Bodhi Linux

![Bodhi Linux][22]

[Bodhi Linux][4] might not look tiny at first glance, with an ISO image of 740MB, but once it's installed, you'll be amazed at just how tiny it is. Bodhi runs smoothly on only 512MB of RAM but looks and feels like the desktop of tomorrow. Bodhi uses the [Enlightenment][23] desktop, a beautiful user interface that's lovingly crafted to be both small and powerful.

Bodhi doesn't just use Enlightenment, though, it adds to it. Bodhi's configuration applications and system setting panels are custom interfaces to Enlightenment's sometimes overwhelming array of options. Bodhi makes some sane default choices for you and provides a subset of options. If you're a die-hard Enlightenment user, Bodhi's interpretation might not be pure enough for you, but for many users, Bodhi brings focus to the Enlightenment desktop.

#### Installation

[Download Bodhi Linux][24], write it to a thumb drive with **dd** or [Etcher][8], and reboot.

The Bodhi installer is available from the **Applications** menu in the **Preferences** category. The installation application is **Ubiquity**, so the process is the same as installing Ubuntu. If you've never installed Ubuntu, don't worry; it's one of the easiest to install.

![Bodhi installer][25]

#### Applications

Bodhi is based on the latest long term support (LTS) Ubuntu Linux release, so your available software knows almost no bounds. If it's available for Ubuntu Linux, Bohdi has access to it.

#### Bottom line

Bodhi Linux is a step down from the size of a typical Ubuntu install and a step up from many other minimalist Ubuntu environments because it uses Enlightenment. If you're looking for a Linux distribution that runs lighter than most without resorting to overlay filesystems and application modules, then Bodhi is the distribution for you.

### Puppy Linux

![Puppy Linux][26]

Before there was Tiny Core or SliTaz or [AntiX][27] or Porteus, there was [Puppy Linux][28]. One of the original tiny Linux distributions, Puppy has endured for a decade and a half as a reliable, bootable OS for old computers and new users alike.

Upon first boot, Puppy does its best to guide the user through any necessary steps to ensure everything works as expected. It's a lot of windows to wade through, but once you get through it all, you know without a doubt what works and what doesn't before you choose whether to install.

Puppy is almost 300MB and failed to work on anything under 1GB RAM in my tests, so it's not exactly the tiniest Linux available. However, it's still a great, under-1GB operating system, and of the OSes in that category, it's one of the very friendliest.

#### Installation

[Download Puppy Linux][29] and write it to a thumb drive with **dd** or [Etcher][8] or burn it to a CD or DVD, then reboot.

![Puppy installer][30]

Puppy can install onto nearly anything that accepts data. The installer application, available from the top launcher bar, is called **Puppy Installer**, and it manages installing Puppy and applications for Puppy.

Puppy Installer steps you through the process of installing the OS onto whatever media you have available. Puppy can boot from a thumb drive, an optical disc, a hard drive, and even an SD card. I've used Puppy on a computer with no hard drive whatsoever, no working optical drive, and no option to boot from USB. Because Puppy can write your configuration options to just about anything, I was able to use it with persistent data storage to an external device.

#### Applications

The **Puppy Installer** application is also used to install apps onto Puppy. Because Puppy is based on Ubuntu, there aren't likely to be any Linux packages missing from its repositories, and if there are, you can probably use a [Flatpak][31].

#### Bottom line

Puppy is the original tiny Linux. While it's not the tiniest any more, it's by far the easiest.

### Bonus: Silverblue

![SilverBlue, not tiny, but tiny-adjacent][32]

The concept of tiny Linux has changed over the years. Long ago, a tiny Linux distribution was something you downloaded onto a CD-R and ran from your optical drive while saving changes to external media. Later, it was something you ran from a thumb drive with dedicated space for persistent changes. Now it's all of those things plus the ability to install to internal drives or directories.

What no one expected was for Linux to kick off the craze for containers, in which applications are self-contained Linux systems running in a para-virtualized environment. What was once a niche hobby for people who either loved to optimize disk space or who loved to resurrect ancient computers quickly became a salient requirement for developers who wanted to develop containers without adding too much overhead to their applications. All the work put into the minimalist, ephemeral Linux distributions suddenly paid off in an unexpected way.

With the concept of what a root filesystem looks like, the Fedora Project's [Silverblue][33] experiment is an effort to create an immutable OS. It's an operating system that never changes and instead gets updates and application installs in the form of, essentially, containers.

Silverblue at 2.1GB is by no means a tiny Linux distribution, but in many ways, it's a child of the tiny Linux and container movements.

#### Installation

[Download Silverblue][34] and write it to a thumb drive with **dd** or [Etcher][8] or burn it to a CD or DVD, then reboot.

After booting into Silverblue, install it to an internal hard drive using [Anaconda][35], the standard, friendly Fedora Linux installer.

![Anaconda installer][36]

#### Applications

Silverblue doesn't install applications in the traditional sense; instead, it runs containers over the top of its base OS. Specifically, it uses Flatpaks for GUI applications and [Toolbox][37] for commands.

Because Flatpaks aren't nearly as common as traditional Fedora RPM packages, Silverblue also provides **package layering**, a way to convert Fedora RPM packages to Silverblue.

#### Bottom line

Silverblue could be a fun experiment testing out emerging technology, or it could be the future of the desktop OS. It's tiny only in the sense that its root filesystem remains the same size regardless of updates and applications added onto it, but it's worth looking at to see where the strange obsession with tiny distributions has delivered the Linux community and industry. Don't forget to tip your hat to the 11MB pioneers on your way out.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/linux-distros-to-try

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: http://lubuntu.net
[3]: http://peppermintos.com
[4]: https://www.bodhilinux.com/
[5]: https://opensource.com/sites/default/files/uploads/tinycore.jpg (Tiny Core Linux)
[6]: http://tinycorelinux.net/
[7]: http://tinycorelinux.net/welcome.html
[8]: https://www.balena.io/etcher/
[9]: https://opensource.com/sites/default/files/uploads/tc-install-gui.png (Tiny Core installer)
[10]: https://www.samba.org/
[11]: https://opensource.com/sites/default/files/uploads/slitaz.jpg (SliTaz Linux)
[12]: http://www.slitaz.org/en/
[13]: https://github.com/midori-browser/core
[14]: http://slitaz.org/en/get/#rolling
[15]: https://opensource.com/sites/default/files/uploads/slitaz-install.jpg (SliTaz installer)
[16]: https://opensource.com/sites/default/files/uploads/porteus.jpg (Porteus Linux)
[17]: http://www.porteus.org/
[18]: http://porteus.org/porteus-mirrors.txt
[19]: https://opensource.com/sites/default/files/images/porteus-installer.png (Porteus installer)
[20]: http://www.porteus.org/component/content/article/26-tutorials/general-info-tutorials/114-official-porteus-installation-guide.html
[21]: http://www.porteus.org/tutorials/9-modules/149-usm.html
[22]: https://opensource.com/sites/default/files/uploads/bodhi.jpg (Bodhi Linux)
[23]: https://www.enlightenment.org/
[24]: https://www.bodhilinux.com/download
[25]: https://opensource.com/sites/default/files/uploads/bodhi-install.jpg (Bodhi installer)
[26]: https://opensource.com/sites/default/files/uploads/puppy.jpg (Puppy Linux)
[27]: https://antixlinux.com/
[28]: http://puppylinux.com/
[29]: http://puppylinux.com/index.html#download
[30]: https://opensource.com/sites/default/files/uploads/puppy-install.jpg (Puppy installer)
[31]: https://docs.fedoraproject.org/en-US/fedora-silverblue/getting-started/#flatpak
[32]: https://opensource.com/sites/default/files/uploads/silverblue.jpg (SilverBlue, not tiny, but tiny-adjacent)
[33]: https://silverblue.fedoraproject.org/
[34]: https://silverblue.fedoraproject.org/download
[35]: https://fedoraproject.org/wiki/Anaconda
[36]: https://opensource.com/sites/default/files/uploads/silverblue-install.jpg (Anaconda installer)
[37]: https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/
