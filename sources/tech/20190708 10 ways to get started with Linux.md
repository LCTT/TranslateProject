[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 ways to get started with Linux)
[#]: via: (https://opensource.com/article/19/7/ways-get-started-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth/users/don-watkins)

10 ways to get started with Linux
======
Ready to dive in and learn Linux? Try these 10 ways to get started.
![Penguins gathered together in the Artic][1]

The article _[What is a Linux user?][2]_ by Anderson Silva made it clear that these days people are as likely to use Linux (in some way) as they are to use Windows, as long as your definition of "using Linux" is sufficiently broad. Still, if you don't have enough Linux in your life, now is a great time to try Linux in a way you've never tried before.

Here are 10 ways to get started with Linux. Try one or try them all.

### 1\. Join a free shell

![Free shell screenshot][3]

There are a lot of people running Linux with more Linux servers than they know what to do with (keep in mind that a "Linux server" can be anything from the latest supercomputer to a discarded 12-year-old laptop). To put excess computers to good use, many administrators open their spare boxes up for free shell accounts.

If you want to log time in a Linux terminal to learn commands, shell scripting, Python, and the basics of web development, a free shell account is an easy, no-cost way to get started. Here's a short list to try:

  * [Freeshell.de][4] is a public access Linux system that's been online since 2002. You get SSH access (to experiment in a Linux shell), IPv6, and OpenSSL, and you can request a MySQL database.
  * [Blinkenshell][5] provides a Linux shell to learn Unix, use IRC, host simple websites, and share files. It's been online since 2006.
  * [SDF Public Access Unix System][6] was established in 1987 to offer free NetBSD accounts. NetBSD isn't Linux, of course, but it's open source Unix, so it offers a similar experience. It also has several homebrewed applications, so it straddles the line between old-school BBS and plain-old free shell.



Free shell accounts are subject to a lot of abuse, so the more you demonstrate trustworthiness and willingness to participate in the goings-on of the collective, the better your experience. You can often gain access (through a special request or a small donation to demonstrate goodwill) to database engines, compilers, and advanced programming languages. You can also ask for additional software or libraries to be installed, subject to administrator approval.

#### How to use it

Public access shell accounts are a great way to try out a real Linux system. The fact that you don't get root access means you get to learn local software management without having to mow your own lawn or fix leaky faucets. You can do just enough real-life activities to make them viable for getting real work done, although they're not reliable enough to be mission critical.

### 2\. Try Linux on Windows with WSL 2

Believe it or not, Microsoft started shipping Linux with Windows as of June 2019, meaning you can run Linux applications from Windows as the second iteration of the [Windows Subsystem for Linux][7] (WSL 2). While it's primarily aimed at developers, Windows users will find WSL 2 to be a Linux environment from the comfort of a familiar desktop without any virtualization taking up extra resources. This is Linux running as a process on your Windows machine. At this time, it's still a new initiative and a work in progress, so it's subject to change. If you try to push it too far too soon, you're likely to encounter a bug or two, but if you're just looking to get started with Linux, learn some commands, and get a feel for getting serious work done in a text-based environment, WSL 2 may be exactly what you need.

#### How to use it

WSL doesn't yet have a clear pathway or purpose, but it provides a Linux environment on your Windows machine. You get root access and can run Linux distributions and applications, so it's an easy and seamless way to learn. However, even though WSL _is Linux_, it's not exactly a typical Linux experience. It's Linux provided by Windows, and that's not what you're likely to encounter in the real world. WSL is a development and educational tool, but if it's available to you, then you should use it.

### 3\. Carry Linux on a bootable thumb drive

![Porteus Linux][8]

Carry Linux, installed to a USB thumb drive, everywhere you go, and boot any computer you encounter from that thumb drive. You get a personalized Linux desktop, and you don't have to worry about the data on the host computer you've booted from. The computer doesn't touch your Linux OS, and your Linux OS doesn't affect the computer. It's ideal for public computers at hotel business centers, libraries, schools, or just to give yourself an excuse to boot into Linux from time to time.

Unlike many other quick hacks to get to a Linux shell, this method offers you a full and robust Linux system, complete with a desktop, access to whatever software you need, and persistent data storage.

The system never changes. Any data you want to save is written into a compressed filesystem, which is then applied as an overlay to the system when you boot. This flexibility allows you to choose whether to boot in persistent mode, saving all data back to the thumb drive, or in an ephemeral mode, so everything you do disappears once you power down. In other words, you can use this as a secure kiosk on an untrusted computer or as your portable OS on computers you trust.

There are many [thumb drive distributions][9] you can try, some with minimal desktop environments for low-powered computers and others with a full desktop. I'm partial to [Porteus][10] Linux. I've carried it on my keychain every day for the past eight years, using it as my primary computing platform during business travel as well as a utility disk if computer problems strike at work or home. It's a reliable and stable operating system that's fun and easy to use.

On Mac or Windows, download the [Fedora Media Writer][11] to create a bootable thumb drive of whatever portable distribution you download.

#### How to use it

Booting a "live Linux" from a USB thumb drive provides a complete Linux distribution. While data storage is done a little differently from a system you install to a hard drive, everything else is as you'd expect from a Linux desktop. There's little you can't do on a portable Linux OS, so install one on your keychain to unlock the full potential of every computer you encounter.

### 4\. Take an online tour

![Linux tour screenshot][12]

Somebody over at Ubuntu thought up the brilliant idea of hosting an Ubuntu GNOME desktop in the browser. To try it out for yourself, open a web browser and navigate to [tour.ubuntu.com][13]. You can select which activity you want demonstrated, or you can skip individual lessons and click the Show Yourself Around button.

Even if you're new to the Linux desktop, you might find showing yourself around is more familiar than you might expect. From the online tour, you can look around, see what applications are available, and view what a typical default Linux desktop is like. You can't adjust settings or launch another tour in Firefox (it was the first thing I tried, naturally), and while you can go through the motions of installing applications, you can't launch them. But if you've never used a Linux desktop before and you want to see what all the fuss is about, this is the whirlwind tour.

#### How to use it

An online tour is truly just a tour. If you've never seen a Linux desktop in action, this is an opportunity to get a glimpse of what it's like. Not intended for serious work, this is an attractive display to entice passers-by.

### 5\. Run Linux in the browser with JavaScript

![JSLinux][14]

Not so long ago, virtualization used to be computationally expensive, limited to users with premium hardware. Now virtualization has been optimized to the point that it can be performed by a JavaScript engine, thanks to Fabrice Bellard, the creator of the excellent and open source [QEMU][15] machine emulator and virtualizer.

Bellard also started the JSLinux project, which allows you to run Linux and other operating systems in a browser, in his spare time for fun. It's still an experimental project, but it's a technical marvel. Open a web browser to the [JSLinux][16] page, and you can boot a text-based Linux shell or a minimal graphical Linux environment. You can upload and download files to your JSLinux host or (theoretically) send your files to a network backup location, because JSLinux has access to the internet through a VPN socket (although at capped speeds, dependent upon the VPN service).

#### How to use it

You won't be doing serious work on JSLinux anytime soon, and the environment is arguably too unusual to learn broad lessons about how Linux normally works. If, however, you're bored of running Linux on a plain old PC and would like to try Linux on a truly distinctive platform, JSLinux is in a class all its own.

### 6\. Read about it

Not every Linux experience happens on the computer. Maybe you're the sort of person who likes to keep your distance, observe, and do your research before jumping into something new, or maybe you're just not clear yet on what "Linux" encompasses, or maybe you love full immersion. There's a wealth of information to read about how Linux works, what it's like to run Linux, and what's happening in the Linux world.

The more you get familiar with the world of open source, the easier it is to understand the common lingo and to separate urban myth from actual experience. We publish [book lists][17] from time to time, but one of my favorites is [_The Charm of Linux_][18] by Hazel Russman. It's a tour through Linux from many different angles, written by an independent author out of excitement over discovering Linux.

#### How to use it

Nothing beats kicking back with a good book. This is the least traditional method of experiencing Linux, but for people who love the printed word, it's both comforting and effective.

### 7\. Get a Raspberry Pi

![Raspberry Pi 4][19]

If you're using a [Raspberry Pi][20], you're running Linux. It's that easy to get started with Linux and low-powered computing. The great thing about the Pi, aside from it costing well under $100, is that its [website][21] is designed for education. You can learn all about what the Pi does, and while you're at it, all about what Linux can do for you.

#### How to use it

The Pi is, by design, a low-powered computer. That means you can't do as much multitasking as you might be used to, but that's a convenient way to keep yourself from getting overwhelmed. The Raspberry Pi is a great way to learn Linux and all of the possibilities that come with it, and it's a fun way to discover the power of eco-friendly, small-form-factor, simplified computing. And be sure to stay tuned to Opensource.com—especially during Pi Week every March—for [tips][22] and [tricks][23] and [fun][24] [activities][25].

### 8\. Climb aboard the container craze

If you work near the back end of the mythical [cloud][26], then you've heard about the container craze. While you can run Docker and Kubernetes on Windows, Azure, Mac, and Linux, you may not know that the containers themselves are Linux. Cloud computing apps and infrastructure are literally minimal Linux systems that run partly virtualized and partly on bare metal. If you launch a container, you are launching a miniature, hyper-specific Linux distribution.

Containers are [different][27] than virtual machines or physical servers. They're not intended to be used as a general-purpose operating system. However, if you are developing in a container, you might want to pause and have a look around. You'll get a glimpse of how a Linux system is structured, where important files are kept, and which commands are the most common. You can even [try a container online][28], and you can read all about how they work in my article about going [behind the scenes with Linux containers][29].

#### How to use it

Containers are, by design, specific to a single task, but they're Linux, so they're extremely flexible. You can use them as they're intended, or you can build a container out into a mostly complete system for your Linux experiments. It's not a desktop Linux experience, but it's a full Linux experience.

### 9\. Install Linux as a VM

Virtualization is the easy way to try an operating system, and [VirtualBox][30] is a great open source way to virtualize. VirtualBox runs on Windows and Mac, so you can install Linux as a virtual machine (VM) and use it almost as if it were just another application. If you're not accustomed to installing an operating system, VirtualBox is also a very safe way to try Linux without accidentally installing it over your usual OS.

#### How to use it

Running Linux as a VM is convenient and easy, either as a trial run or an alternative to dual-booting or rebooting when you need a Linux environment. It's full-featured and, because it uses virtual hardware, the host operating system drives your peripherals. The only disadvantage to running Linux as a virtual machine is primarily psychological. If you intend to use Linux as your main OS, but end up defaulting to the host OS for all but the most Linux-specific tasks, then the VM has failed you. Otherwise, a VM is a triumph of modern technology, and using Linux in VirtualBox provides you with all the best features Linux has to offer.

### 10\. Install it

![Fedora Silverblue][31]

When in doubt, there's always the traditional route. If you want to give Linux the attention it deserves, you can download Linux, burn the installer to a thumb drive (or a DVD, if you prefer optical media), and install it on your computer. Linux is open source, so it can be distributed by anyone who wants to take the time to bundle Linux—and all the bits and pieces that make it usable—into what is commonly called a _distribution_ (or "distro") for short. Ask any Linux user, and you're bound to get a different answer for which distribution is "best" (mostly because the term "best" is often left undefined). Most people admit that you should use the Linux distribution that works for you, meaning that you should test a few popular distros and settle on the one that makes your computer behave as you expect it to behave. This is a pragmatic and functional approach. For example, should a distribution fail to recognize your webcam and you want your webcam to work, then use a distribution that recognizes your webcam.

If you've never installed an operating system before, you'll find most Linux distributions include a friendly and easy installer. Just download a distribution (they are delivered as ISO files), and download the [Fedora Media Writer][11] to create a bootable installation thumb drive.

#### How to use it

Installing Linux and using it as an operating system is a step toward becoming familiar and familial with it. There's no wrong way to use it. You might discover must-have features you never knew you needed, you might learn more about computers than you ever imagined you could, and you may shift in your worldview. Or you might use a Linux desktop because it was easy to download and install, or because you want to cut out the middleman of some corporate overlord, or because it helps you get your work done.

Whatever your reason, just give Linux a try with any (or all) of these options.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/ways-get-started-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_Penguin_Image_520x292_12324207_0714_mm_v1a.png?itok=p7cWyQv9 (Penguins gathered together in the Artic)
[2]: https://opensource.com/article/19/6/what-linux-user
[3]: https://opensource.com/sites/default/files/uploads/freeshell.png (Free shell screenshot)
[4]: https://freeshell.de
[5]: https://blinkenshell.org/wiki/Start
[6]: https://sdf.org/
[7]: https://devblogs.microsoft.com/commandline/wsl-2-is-now-available-in-windows-insiders/
[8]: https://opensource.com/sites/default/files/uploads/porteus.jpg (Porteus Linux)
[9]: https://opensource.com/article/19/6/tiny-linux-distros-you-have-try
[10]: http://porteus.org
[11]: https://getfedora.org/en/workstation/download/
[12]: https://opensource.com/sites/default/files/uploads/linux_tour.jpg (Linux tour screenshot)
[13]: http://tour.ubuntu.com/en/#
[14]: https://opensource.com/sites/default/files/uploads/jslinux.jpg (JSLinux)
[15]: https://www.qemu.org
[16]: https://bellard.org/jslinux/
[17]: https://opensource.com/article/19/1/tech-books-new-skils
[18]: http://www.lulu.com/shop/hazel-russman/the-charm-of-linux/paperback/product-21229401.html
[19]: https://opensource.com/sites/default/files/uploads/raspberry-pi-4-case.jpg (Raspberry Pi 4)
[20]: https://opensource.com/resources/raspberry-pi
[21]: https://www.raspberrypi.org/
[22]: https://opensource.com/article/19/3/raspberry-pi-projects
[23]: https://opensource.com/article/19/3/piflash
[24]: https://opensource.com/article/19/3/gamepad-raspberry-pi
[25]: https://opensource.com/life/16/3/make-music-raspberry-pi-milkytracker
[26]: https://opensource.com/resources/cloud
[27]: https://opensource.com/article/19/6/how-ssh-running-container
[28]: https://linuxcontainers.org/lxd/try-it/
[29]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[30]: https://virtualbox.org
[31]: https://opensource.com/sites/default/files/uploads/fedora-silverblue.png (Fedora Silverblue)
