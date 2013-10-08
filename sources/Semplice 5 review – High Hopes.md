Semplice 5 review – High Hopes
================================================================================
Sometimes I come across a distribution that looks interesting and I want to see how good it is and whether it brings anything new to the table. That’s why I decided to take a quick look at Semplice, a desktop distribution based on the unstable branch of Debian.

Its name is said to derive from “simple” and that the developers subscribe to the “KISS principle.”

The first time I reviewed a distribution designed around that principle, I was not too impressed, because it usually means shipping a bare-bones system that requires users to tweak almost every aspect to make it just work.

So in this very short and light review, I’ll take you through a test installation of Semplice 5, the latest edition, to see if it’s a distribution I can recommend to my target audience – new and inexperienced users. It was released on September 8 (2013).

Let’s start with the installation program.

**The Installer** is of the graphical type, with an easy-to-navigate interface. It’s not exactly like that of Ubuntu, but close. There is support for automated and manual disk partitioning. This screen shot shows both options at the Disk Partitioning step.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceInstall1-600x410.png)

Opting for automated disk partitioning will cause the installer to create two partitions, one for Swap and the other for the main partition.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceInstall3-600x419.png)

Unfortunately, the automated partition option is more like semi-automated, because to move beyond the step of the installation process shown in this screen shot, you are first required to set the mount points manually. Setting the mount point is a very simple task, but that’s enough to put an asterisk on the “automated” disk partitioning option.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceInstall2-600x410.png)

The user account setup step shows an option for enabling the traditional root account.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceInstall-600x413.png)

After all the preliminary steps have been completed, you just sit back and watch the installer get to work. Although this is an easy to use installer, it does not have the “advanced” features that has now become a standard part of Ubuntu’s installer.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceInstall5-600x435.png)

This is another screen shot from the installer. At this step, you are presented with options to enable a range of features. This features manager is also accessible after installation, so you can always change any setting you make here.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceInstall4-600x410.png)

And for each feature, you have the option to customize it.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceDesktop4-600x442.png)

After the installation has completed, and you reboot the system, you should see this login screen. Beautiful graphics, by the way.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceLogin1-600x450.png)

eyond that login screen is a desktop which uses the Openbox window manager, a minimalist window manager that’s not really for new or inexperienced users looking for a hassle-free system for desktop computing.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceDesktop-600x450.png)

By default, you access the menu by right-clicking anywhere on the desktop or bottom panel. There are four desktops or virtual workspaces to work from.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceDesktop5-600x451.png)

But in keeping with the KISS principle, the standard directories in your home folder are absent. You are required to create them yourself.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceFM-598x475.png)

In terms of installed applications, the standard ones that most people will need for desktop computing are installed. Chromium is the default Web browser.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceTaskM1-600x450.png)

No Office suite is installed, so be prepared to install one yourself. For the record, LibreOffice 4.1.1 is in the repository.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceDesktop8-600x450.png)

And for installing new applications or managing those already installed, the available graphical application manager is Synaptic Package Manager. It does not have the fancy interface of Linux Deepin‘s Deepin Software Center, but it gets the job done.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceDesktop7-600x451.png)

There are a couple of Web apps in the menu (Facebook and Twitter) and the distribution provides a tool for adding others. Just start the application from the command line by typing the command (oneslip-add-app gtk) shown in this screen shot.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceOneslip.png)

Aside from Synaptic Package Manager and the Web app tool, there are other graphical management applications installed. One, is the Services Settings manager, with which you can manage the system daemons.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceDesktop6-354x475.png)

Another is the Task Manager. These are all standard graphical management applications available on most distributions, but it’s good to see that they are available on a distribution designed around the KISS principle.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceTaskM-546x475.png)

This screen shot shows the interface connection manager, which has an option for specifying a firewall zone for an interface. The problem is that FirewallD, the firewall application that provides the feature, is not installed, even though it is available in the repository. Perhaps this is in keeping with the KISS principle. But without a basic security application in place, a default installation of this distribution present a very bad security posture.

![](http://www.linuxbsdos.com/wp-content/uploads/2013/09/SempliceNM-468x475.png)

**Chakra** is the first distribution I reviewed designed around the KISS principle, but with time, the developers have softened their stance and made some features available by default. One thing I’ve learned is that distributions like this are not really designed for new or inexperienced users, but for those looking for a resource-friendly, no-frills operating system. If that’s the type of distribution you are looking for, I think you’ll like Semplice 5. Otherwise, stick with the likes of Linux Mint, Ubuntu (if you can stand the Unity desktop), Mageia and others like them. 

**Resources**: Installation ISO images for 32- and 64-bit systems are available for download [here][1]. And you may read the release announcement [here][2].






--------------------------------------------------------------------------------

via: http://www.linuxbsdos.com/2013/09/27/semplice-5-review-high-hopes/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Mr小眼儿][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Mr小眼儿]:http://linux.cn/space/14801
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://semplice-linux.org/download
[2]:http://semplice-linux.org/blog/2013/09/semplice-5-released
