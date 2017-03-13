How to install Fedora 25 on your Raspberry Pi
============================================================

### Check out this step-by-step tutorial.

 ![How to install Fedora 25 on your Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/gnome_raspberry_pi_fedora.jpg?itok=Efm6IKxP "How to install Fedora 25 on your Raspberry Pi") 
>Image by : opensource.com

In October 2016, the release of Fedora 25 Beta was announced, along with initial [support for the Raspberry Pi 2 and 3][6]. The final "general availability" version of Fedora 25 was released a month later, and since then I have been playing around with the many different Fedora spins available for the latest versions of the Raspberry Pi.

This article is not as much a review of Fedora 25 on the Raspberry Pi 3 as a collection of tips, screenshots, and my own personal thoughts on the very first officially supported version of Fedora for the Pi.

More on Raspberry Pi

*   [Our latest on Raspberry Pi][1]
*   [What is Raspberry Pi?][2]
*   [Getting started with Raspberry Pi][3]
*   [Send us your Raspberry Pi projects and tutorials][4]

Before I start, it is worth mentioning that all of the work I have done to write this article was done on my personal laptop, which is running Fedora 25\. I used a microSD to SD adapter to copy and edit all of the Fedora images into a 32GB microSD card, which I used to boot up my Raspberry Pi 3 on a Samsung TV. The Raspberry Pi 3 used an Ethernet cable connection for network connectivity because the built-in Wi-Fi is not yet supported by Fedora 25\. Finally, I used a Logitech K410 wireless keyboard and touchpad for input.

If you don't have the opportunity to use an Ethernet wire connection to play around with Fedora 25 on your Raspberry Pi, I was able to get an Edimax Wi-Fi USB adapter to work on Fedora 25 as well, but for the purposes of this article, I only used the Ethernet connection.

### Before you install Fedora 25 on your Raspberry Pi

Read over the [Raspberry Pi support documentation][7] on the Fedora Project wiki. You can download the Fedora 25 images you need for installation from the wiki, and everything that is supported and not supported is listed there. 

Also, be mindful that this is an initially supported version and a lot of new work and support will be coming out with the release of Fedora 26, so feel free to report bugs and share feedback of your own experience with Fedora 25 on the Raspberry Pi via [Bugzilla][8], Fedora's [ARM mailing list][9], or on the Freenode IRC channel #fedora-arm.

### Installation

I downloaded and installed five different Fedora 25 spins: GNOME (Workstation default), KDE, Minimal, LXDE, and Xfce. For the most part, they all had pretty consistent and easy-to-follow steps to ensure my Raspberry Pi 3 would boot up properly. Some have known bugs that people are working on, and some followed standard operating procedure via the Fedora wiki.

 ![GNOME on Raspberry Pi](https://opensource.com/sites/default/files/gnome_on_rpi.png "GNOME on Raspberry Pi") 

Fedora 25 workstation, GNOME on Raspberry Pi 3.

### Steps for installation

1\. On your laptop, download one of the Fedora 25 images for the Raspberry Pi from the links on the support documentation page.

2\. On your laptop, copy the image onto your microSD using either **fedora-arm-installer** or the command line:

**xzcat Fedora-Workstation-armhfp-25-1.3-sda.raw.xz | dd bs=4M status=progress of=/dev/mmcblk0**

Note: **/dev/mmclk0** was the device that my microSD to SD adapter mounted on my laptop, and even though I am using Fedora on my laptop and I could have used the **fedora-arm-installer**, I preferred the command line.

3\. Once you've copied the image,  _don't boot up your system yet_ . I know it is tempting to just go for it, but you still need to make a couple of tweaks.

4\. To keep the image file as small as possible for download convenience, the root file system on the image was kept to a minimum, so you must grow your root filesystem. If you don't, your Pi will still boot up, but if you run **dnf update** to upgrade your system, it will fill up the file system and bad things will happen, so with the microSD still on your laptop grow the partition:

**growpart /dev/mmcblk0 4
resize2fs /dev/mmcblk0p4**

Note: In Fedora, the **growpart** command is provided by **cloud-utils-growpart.noarch** RPM.

5\. Once the file system is updated, you will need to blacklist the **vc4** module. [Read more about this bug.][10]

I recommend doing this before you boot up the Raspberry Pi because different spins will behave in different ways. For example, (at least for me) GNOME came up first after I booted, without blacklisting **vc4**, but after doing a system update, it no longer came up. The KDE spin wouldn't come up at all during the first initial boot. We might as well blacklist **vc4** even before our first boot until the bug is resolved.

Blacklisting should happen in two different places. First, on your microSD root partition, create a **vc4.conf** under **etc/modprode.d/** with content: **blacklist vc4**. Second, on your microSD boot partition add **rd.driver.blacklist=vc4** to the end of the append line in the **extlinux/extlinux.conf** file.

6. Now, you are ready to boot up your Raspberry Pi.

### Booting Up

Be patient, especially for the GNOME and KDE distributions to come up. In the age of SSDs (Solid-State Drives), and almost instant bootups, it's easy to become impatient with write speeds for the Pi, especially the first time you boot. Before the Window Manager comes up for the first time, an initial configuration screen will pop up, which will allow you to configure root password, a regular user, time zones, and networking. Once you get that configured, you should be able to SSH into your Raspberry Pi, which can be very handy for debugging display issues.

### System updates

Once you have Fedora 25 up and running on your Raspberry Pi, you will eventually (or immediately) want to apply system updates.

First, when doing kernel upgrades, become familiar with your **/boot/extlinux/extlinux.conf** file. If you upgrade your kernel, the next time you boot, unless you manually pick the right kernel, you will most likely boot into Rescue mode. The best way to avoid that is to take the five lines that define the Rescue image on your **extlinux.conf** and move them to the bottom of the file, so the latest kernel will automatically boot up next time. You can edit the **/boot/extlinux/extlinux.conf** directly on the Pi or by mounting on your laptop:

**label Fedora 25 Rescue fdcb76d0032447209f782a184f35eebc (4.9.9-200.fc25.armv7hl)
            kernel /vmlinuz-0-rescue-fdcb76d0032447209f782a184f35eebc
            append ro root=UUID=c19816a7-cbb8-4cbb-8608-7fec6d4994d0 rd.driver.blacklist=vc4
            fdtdir /dtb-4.9.9-200.fc25.armv7hl/
            initrd /initramfs-0-rescue-fdcb76d0032447209f782a184f35eebc.img**

Second, if for whatever reason your display goes dark again after an upgrade and you are sure that **vc4** is blacklisted, run **lsmod | grep vc4**. You can always boot into multiuser mode, instead of graphical mode, and run **startx**from the command line. Read the content of **/etc/inittab** for directions on how to switch targets. 

 ![KDE on Raspberry Pi 3](https://opensource.com/sites/default/files/kde_on_rpi.png "KDE on Raspberry Pi 3") 

A Fedora 25 workstation, KDE on Raspberry Pi 3.

### The Fedora spins

Out of all of the Fedora spins I have tried, the only one that gave me a problem was the XFCE spin, and I believe it was due to this [known bug][11].

GNOME, KDE, LXDE, and minimal spins worked pretty well when I followed the steps I've shared here. Given that KDE and GNOME are a bit more resource heavy, I would recommend LXDE and Minimal for anyone who wants to just start playing with Fedora 25 on the Raspberry Pi. If you are a sysadmin who wants a cheap server backed by SELinux to cover your security concerns and all you want is to run your Raspberry Pi as some sort of server and you are happy with an IP address and port 22 open and vi, go with the Minimal spin. For developers or people starting to learn Linux, the LXDE may be the better way to go because it will give quick and easy access to all the GUI-based tools like browsers, IDEs, and clients you may need.

 ![LXDE on Raspberry Pi 3](https://opensource.com/sites/default/files/lxde_on_rpi.png "LXDE on Raspberry Pi 3") 

Fedora 25 workstation, LXDE on Raspberry Pi 3.

It is fantastic to see more and more Linux distributions become available on ARM-based Raspberry Pi computers. For its very first supported version, the Fedora team has provided a polished experience for the everyday Linux user. I will certainly be looking forward to the improvements and bug fixes for Fedora 26.

--------------------------------------------------------------------------------

作者简介：

Anderson Silva - Anderson started using Linux back in 1996. Red Hat Linux, to be more precise. In 2007, his main professional dream became reality when he joined Red Hat as a Release Engineer in IT. Since then he has worked in several different roles at Red Hat from Release Engineer to System Administrator to Senior Manager and Information System Engineer. He is a RHCE and RHCA and an active Fedora Package maintainer.

----------------

via: https://opensource.com/article/17/3/how-install-fedora-on-raspberry-pi

作者：[Anderson Silva][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ansilva
[1]:https://opensource.com/tags/raspberry-pi?src=raspberry_pi_resource_menu
[2]:https://opensource.com/resources/what-raspberry-pi?src=raspberry_pi_resource_menu
[3]:https://opensource.com/article/16/12/getting-started-raspberry-pi?src=raspberry_pi_resource_menu
[4]:https://opensource.com/article/17/2/raspberry-pi-submit-your-article?src=raspberry_pi_resource_menu
[5]:https://opensource.com/article/17/3/how-install-fedora-on-raspberry-pi?rate=gIIRltTrnOlwo4h81uDvdAjAE3V2rnwoqH0s_Dx44mE
[6]:https://fedoramagazine.org/raspberry-pi-support-fedora-25-beta/
[7]:https://fedoraproject.org/wiki/Raspberry_Pi
[8]:https://bugzilla.redhat.com/show_bug.cgi?id=245418
[9]:https://lists.fedoraproject.org/admin/lists/arm%40lists.fedoraproject.org/
[10]:https://bugzilla.redhat.com/show_bug.cgi?id=1387733
[11]:https://bugzilla.redhat.com/show_bug.cgi?id=1389163
[12]:https://opensource.com/user/26502/feed
[13]:https://opensource.com/article/17/3/how-install-fedora-on-raspberry-pi#comments
[14]:https://opensource.com/users/ansilva
