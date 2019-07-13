MidnightBSD Could Be Your Gateway to FreeBSD
======
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/midnight_4_0.jpg?itok=T2gpLVui)

[FreeBSD][1] is an open source operating system that descended from the famous [Berkeley Software Distribution][2]. The first version of FreeBSD was released in 1993 and is still going strong. Around 2007, Lucas Holt wanted to create a fork of FreeBSD that made use of the [GnuStep][3] implementation of the OpenStep (now Cocoa) Objective-C frameworks, widget toolkit, and application development tools. To that end, he began development of the MidnightBSD desktop distribution.

MidnightBSD (named after Lucas’s cat, Midnight) is still in active (albeit slow) development. The latest stable release (0.8.6) has been available since August, 2017. Although the BSD distributions aren’t what you might call user-friendly, getting up to speed on their installation is a great way to familiarize yourself with how to deal with an ncurses installation and with finalizing an install via the command line.

In the end, you’ll wind up with desktop distribution of a very reliable fork of FreeBSD. It’ll take a bit of work, but if you’re a Linux user looking to stretch your skills… this is a good place to start.

I want to walk you through the process of installing MidnightBSD, how to add a graphical desktop environment, and then how to install applications.

### Installation

As I mentioned, this is an ncurses installation process, so there is no point-and-click to be found. Instead, you’ll be using your keyboard Tab and arrow keys. Once you’ve downloaded the [latest release][4], burn it to a CD/DVD or USB drive and boot your machine (or create a virtual machine in [VirtualBox][5]). The installer will open and give you three options (Figure 1). Select Install (using your keyboard arrow keys) and hit Enter.


![MidnightBSD installer][7]

Figure 1: Launching the MidnightBSD installer.

[Used with permission][8]

At this point, there are quite a lot of screens to go through. Many of those screens are self-explanatory:

  1. Set non-default key mapping (yes/no)

  2. Set hostname

  3. Add optional system components (documentation, games, 32-bit compatibility, system source code)

  4. Partitioning hard drive

  5. Administrator password

  6. Configure networking interface

  7. Select region (for timezone)

  8. Enable services (such as secure shell)

  9. Add users (Figure 2)




![Adding a user][10]

Figure 2: Adding a user to the system.

[Used with permission][8]

After you’ve added the user(s) to the system, you will then be dropped to a window (Figure 3), where you can take care of anything you might have missed or you want to re-configure. If you don’t need to make any changes, select Exit, and your configurations will be applied.

In the next window, when prompted, select No, and the system will reboot. Once MidnightBSD reboots, you’re ready for the next phase of the installation.

### Post install

When your newly installed MidnightBSD boots, you’ll find yourself at a command prompt. At this point, there is no graphical interface to be found. To install applications, MidnightBSD relies on the mport tool. Let’s say you want to install the Xfce desktop environment. To do this, log into MidnightBSD and issue the following commands:
```
sudo mport index

sudo mport install xorg

```

You now have the Xorg window server installed, which will allow you to install the desktop environment. Installing Xfce is handled with the command:
```
sudo mport install xfce

```

Xfce is now installed. However, we must enable it to run with the command startx. To do this, let’s first install the nano editor. Issue the command:
```
sudo mport install nano

```

With nano installed, issue the command:
```
nano ~/.xinitrc

```

That file need only contain a single line:
```
exec startxfce4

```

Save and close that file. If you now issue the command startx, the Xfce desktop environment will start. You should start to feel a bit more at home (Figure 4).

![ Xfce][12]

Figure 4: The Xfce desktop interface is ready to serve.

[Used with permission][8]

Since you don’t want to always have to issue the command startx, you’ll want to enable the login daemon. However, it’s not installed. To install this subsystem, issue the command:
```
sudo mport install mlogind

```

When the installation completes, enable mlogind at boot by adding an entry to the /etc/rc.conf file. At the bottom of the rc.conf file, add the following:
```
mlogind_enable=”YES”

```

Save and close that file. Now, when you boot (or reboot) the machine, you should be greeted by the graphical login screen. At the time of writing, after logging in, I wound up with a blank screen and the dreaded X cursor. Unfortunately, it seems there’s no fix for this at the moment. So, to gain access to your desktop environment, you must make use of the startx command.

### Installing

Out of the box, you won’t find much in the way of applications. If you attempt to install applications (using mport), you’ll quickly find yourself frustrated, as very few applications can be found. To get around this, we need to check out the list of available mport software, using the svnlite command. Go back to the terminal window and issue the command:
```
svnlite co http://svn.midnightbsd.org/svn/mports/trunk mports

```

Once you do that, you should see a new directory named ~/mports. Change into that directory (with the command cd ~/.mports. Issue the ls command and you should see a number of categories (Figure 5).

![applications][14]

Figure 5: The categories of applications now available for mport.

[Used with permission][8]

Say you want to install Firefox? If you look in the www directory, you’ll see a listing for linux-firefox. Issue the command:
```
sudo mport install linux-firefox

```

You should now see an entry for Firefox in the Xfce desktop menu. Go through all of the categories and install all of the software you need, using the mport command.

### A sad caveat

One sad little caveat is that the only version of an office suite to be found for mport (via svnlite) is OpenOffice 3. That’s quite out of date. And although Abiword is found in the ~/mports/editors directory, it seems it’s not available for installation. Even after installing OpenOffice 3, it errors out with an Exec format error. In other words, you won’t be doing much in the way of office productivity with MidnightBSD. But, hey, if you have an old Palm Pilot lying around, you can always install pilot-link. In other words, the available software doesn’t make for an incredibly useful desktop distribution… at least not for the average user. However, if you want to develop on MidnightBSD, you’ll find plenty of available tools, ready to install (check out the ~/mports/devel directory). You could even install Drupal with the command:

sudo mport install drupal7

Of course, after that you’ll need to create a database (MySQL is already installed), install Apache (sudo mport install apache24) and configure the necessary Apache directives.

Clearly, what is installed and what can be installed is a bit of a hodgepodge of applications, systems, and servers. But with enough work, you could wind up with a distribution that could serve a specific purpose.

### Enjoy the *BSD Goodness

And that is how you can get MidnightBSD up and running into a somewhat useful desktop distribution. It’s not as quick and easy as many other Linux distributions, but if you want a distribution that’ll make you think, this could be exactly what you’re looking for. Although much of the competition has quite a bit more available software titles ready for installation, MidnightBSD is certainly an interesting challenge that every Linux enthusiast or admin should try.

Learn more about Linux through the free ["Introduction to Linux" ][15]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/5/midnightbsd-could-be-your-gateway-freebsd

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.freebsd.org/
[2]:https://en.wikipedia.org/wiki/Berkeley_Software_Distribution
[3]:https://en.wikipedia.org/wiki/GNUstep
[4]:http://www.midnightbsd.org/download/
[5]:https://www.virtualbox.org/
[6]:/files/images/midnight1jpg
[7]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/midnight_1.jpg?itok=BRfGIEk_ (MidnightBSD installer)
[8]:/licenses/category/used-permission
[9]:/files/images/midnight2jpg
[10]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/midnight_2.jpg?itok=xhxHlNJr (Adding a user)
[11]:/files/images/midnight4jpg
[12]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/midnight_4.jpg?itok=DNqA47s_ ( Xfce)
[13]:/files/images/midnight5jpg
[14]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/midnight_5.jpg?itok=LpavDHQP (applications)
[15]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
