# rusking translating

How Linux got to be Linux: Test driving 1993-2003 distros
============================================================

### Enjoy a trip down Linux memory lane as we take early distros for a spin.

 ![How Linux got to be Linux: Test driving 1993-2003 distros](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/car-penguin-drive-linux-yellow.png?itok=ueZE5mph "How Linux got to be Linux: Test driving 1993-2003 distros") 

Image by : 

Internet Archive [Book][7] [Images][8]. Modified by Opensource.com. CC BY-SA 4.0

A unique trait of open source is that it's never truly EOL (End of Life). The disc images mostly remain online, and their licenses don't expire, so going back and installing an old version of Linux in a virtual machine and getting a precise picture of what progress Linux has made over the years is relatively simple.

We begin our journey with Slackware 1.01, posted to the **comp.os.linux.announce** newsgroup well over 20 years ago.

### Slackware 1.01 (1993)

 ![slackware 1.0 screenshot](https://opensource.com/sites/default/files/slack1.png "slackware 1.0 screenshot") 

Slackware 1.01

The best part about trying Slackware 1.01 is that there's a pre-made image in Qemu's [2014 series][9] of free images, so you don't have to perform the install manually (don't get used to this luxury).

```
 $ qemu-kvm -m 16M -drive if=ide,format=qcow2,file=slackware.qcow2 \
 -netdev user,id=slirp -device ne2k_isa,netdev=slirp \
 -serial stdio -redir tcp:22122::22
```

Many things in 1993's version of Linux works just as you'd expect. All the basic commands, such as `ls` and `cd` work, all the basic tools (`gawk`, `cut`, `diff`, `perl`, and of course [Volkerding][10]'s favorite `elvis`) are present and accounted for, but some of the little things surprised me. `BASH` courteously asks for confirmation when you try to tab-complete hundreds of files, and tools to inspect compressed files (such as `zless` and `zmore` and `zcat`) already existed. In more ways than I'd expected, the system feels surprisingly modern.

What's missing is any notion of package management. All installs and uninstalls are entirely manual, with no tracking.

Over all, Slackware 1.01 feels a lot like a fairly modern UNIX—or more appropriately, it feels like modern UNIX might feel to a Linux user. Most everything is familiar, but there are differences here and there. Not nearly as much a difference as you might expect from an operating system released in 1993!

### Debian 0.91 (1994)

To try Debian 0.91, I used the floppy disk images available on the [Ibiblio digital archive][11], originally posted in 1994\. The commands to boot:

```
 $ gunzip bootdsk.gz basedsk1.gz basedsk2.gz
 $ qemu-system-i386 -M pc -m 64 -boot order=ac,menu=on \
   -drive file=bootdisk,if=floppy,format=raw \
   -drive file=debian.raw,if=ide,format=raw \
   -device ne2k_isa,netdev=slirp \
   -serial msmouse -vga std \
   -redir tcp:22122::22 \
   -netdev user,id=slirp
```

The bootdisk for Debian 0.91 boots to a simple shell, with clear instructions on the steps you're meant to take next.

The install process is surprisingly smooth. It works off of a menu system with seven steps—from partitioning a hard drive and writing the ext2 filesystem to it, all the way through to copying the `basedsk` images. This provided a minimal Debian install with many of the familiar conventions any modern Linux user would expect from their OS.

Debian is now famous for its package management system, but there are mere hints of that in this early release. The `dpkg` command exists, but it's an interactive menu-based system—a sort of clunky `aptitude`, with several layers of menu selections and, unsurprisingly, a fraction of available packages.

Even so, you can sense the convenience factor in the design concept. You download three floppy images and end up with a bootable system, and then use a simple text menu to install more goodies. I sincerely see why Debian made a splash.

### Jurix/S.u.S.E. (1996)

 ![Jurix install screen](https://opensource.com/sites/default/files/jurix_install.png "Jurix install screen") 

Jurix installation

A pre-cursor to SUSE, Jurix shipped with binary `.tgz` packages organized into directories resembling the structure of Slackware's install packages. The installer itself is also similar to Slackware's installer.

```
 $ qemu-system-i386 -M pc -m 1024 \
   -boot order=ac,menu=on \
   -drive \
    file=jurix/install,if=floppy,format=raw \
   -drive file=jurix.img,if=ide \
   -drive file=pkg.raw,if=ide,format=raw \
   -device ne2k_isa,netdev=slirp \
   -serial msmouse -vga std \
   -redir tcp:22122::22 \
   -netdev user,id=slirp
```

Because I wasn't specifically looking for the earliest instance, Jurix was the first Linux distribution I found that really "felt" like it intended the user to use a GUI environment. [XFree86][12] is installed by default, so if you didn't intend to use it, you had to opt out.

An example `/usr/lib/X11/XF86Config` (this later became `Xorg.conf`) file was provided, and that got me 90% of the way to a GUI, but fine-tuning `vsync`, `hsync`, and `ramdac` colormap overrides took me an entire weekend until I finally gave up.

Installing new packages on Jurix was simple; find a `.tgz` on your sources drive, and run a routine `tar` command: ` $ su -c 'tar xzvf foo.tgz -C /'`The package gets unzipped and unarchived to the root partition, and ready to use. I did this with several packages I hadn't installed to begin with, and found it easy, fast, and reliable.

### SUSE 5.1 (1998)

 ![suse install](https://opensource.com/sites/default/files/suse5fvwm.png "suse install") 

FVWM running on SuSE 5.1

I installed SUSE 5.1 from a InfoMagic CD-ROM purchased from a software store in Maryland in 1998.

```
 $ qemu-system-i386 -M pc-0.10 -m 64 \
   -boot order=ad,menu=on \
   -drive file=floppy.raw,if=floppy,format=raw \
   -cdrom /dev/sr0 \
   -drive file=suse5.raw,if=ide,format=raw \
   -vga cirrus -serial msmouse
```

The install process was convoluted compared to those that came before. YaST volleyed configuration files and settings between a floppy disk and the boot CD-ROM, requiring several reboots and a few restarts as I tried to understand the sequence expected from me. Once I'd failed the process twice, I got used to the way YaST worked, and the third time was smooth and very much a hint at the Linux user experience to come in later years.

A GUI environment was my main goal for SUSE 5.1\. The configuration process was familiar, with a few nice graphical tools (including a good `XF86Setup`frontend) to help test and debug mouse and monitor problems. It took less than an hour to get a GUI up and running, and most of the delay was caused by my own research on what resolutions and color depths Qemu's virtualized video card could handle.

Included desktops were `fvwm`, `fvwm2`, and `ctwm`. I used `fvwm`, and it worked as expected. I even discovered `tkDesk`, a dock and file manager combo pack that is surprisingly similar to Ubuntu's `Unity` launcher bar.

The experience was, over all, very pleasant, and in terms of getting a successful desktop up and running, SUSE 5.1 was a rousing success.

### Red Hat 6.0 (1999)

 ![Red Hat 1999](https://opensource.com/sites/default/files/redhat6_gimp_0.png "Red Hat 1999") 

Red Hat 6 running GIMP 1.x

The next install disc I happened to have lying around was Red Hat 6.0\. That's not RHEL 6.0—just Red Hat 6.0\. This was a desktop distribution sold in stores, before RHEL or Fedora existed. The disc I used was purchased in June 1999.

```
 $ qemu-system-i386 -M pc-0.10 -m 512 \
   -boot order=ad,menu=on \
   -drive file=redhat6.raw,if=ide,format=raw \
   -serial msmouse -netdev user,id=slirp \
   -vga cirrus -cdrom /dev/sr0
```

The installation was fully guided and remarkably fast. You never have to leave the safety of the install process, whether choosing what packages to install (grouped together in **Workstation**, **Server**, and **Custom** groups), partitioning a drive, or kicking off the install.

Red Hat 6 included an `xf86config` application to step you through X configuration, although it strangely allowed some mouse emulation options that X later claimed were invalid. It beat editing the Xf86Config file, but getting X correct was still clearly not a simple task.

The desktop bundled with Red Hat 6 was, as it still is, GNOME, but the window manager was an early [Enlightenment][13], which also provided the main sound daemon. `Xdm` and `gdm` were both provided as login managers so that normal users could log in without having the permission to start or kill X itself, which is particularly important on multi-user systems.

Certain staple applications are missing; `gedit` didn't exist yet, there's no grand unified office application, and there was no package manager to speak of. `GnoRPM`, a GUI interface for RPM installation, review, and removal, was the closest to a `yum` or `PackageKit` experience it had, and `gnotepad+` is the GUI text editor (Emacs notwithstanding, obviously).

Over all, though, the desktop is intuitive. Unlike later implementations of GNOME, this early version featured a panel at the bottom of the screen, with an application menu and launcher icons and virtual desktop control in a central location. I can't imagine a user of another operating system at the time finding this environment foreign.

Red Hat 6 was a strong entry for Linux, which was obviously moving seriously toward being a proper desktop OS.

### Mandrake 8.0 (2001)

 ![Mandrake 8.0 installer](https://opensource.com/sites/default/files/mandrake8.png "Mandrake 8.0 installer") 

Mandrake: A turning point in Linux

Mandrake 8.0 was released in 2001, so it would have been compared to, for instance, Apple OS 9.2 and Windows ME.

I fell back on fairly old emulated tech to be safe.

```
 $ qemu-system-i386 \
   -M pc-0.10 -m 2048 \
   -boot order=ad,menu=on \
   -drive file=mandrake8.qcow2 \
   -usb -net nic,model=rtl8139 \
   -netdev user,id=slirp \
   -vga cirrus \
   -cdrom mandrake-8.0-i386.iso
```

I'd thought the Red Hat installation process had been nice, but Mandrake's was amazing. It was friendly, it gave the user a chance to test configurations before continuing, it was easy and fast, and it worked almost like magic. I didn't even have to import my `XF86Config` file, because Mandrake's installer got it right.

 ![Mandrake install](https://opensource.com/sites/default/files/mandrake8install_new.png "Mandrake install") 

Mandrake 8.0 installer

Using the Mandrake desktop is a lot like using any given desktop of the time, actually. I was a little surprised at how similar the experience was. I feel certain that if I'd somehow stumbled into Mandrake Linux at this time, it actually wouldn't have been beyond my ability, even as a young and not very technical user. The interfaces are intuitive, the documentation helpful, and the package management quite natural, for a time when it still wasn't yet the mental default for people to just go to a website and download an installer for whatever software they wanted.

### Fedora 1 (2003)

 ![Fedora Core install](https://opensource.com/sites/default/files/fedora1.png "Fedora Core install") 

Blue Fedora, Red Hat

In 2003, the new Fedora Core distribution was released. Fedora Core was based on Red Hat, and was meant to carry on the banner of desktop Linux once Red Hat Enterprise Linux (RHEL) became the flagship product of the company.

Nothing particularly special is required to boot the old Fedora Core 1 disc:

```
 $ qemu-system-i386 -M pc \
   -m 2048 -boot order=ac,menu=on \
   -drive file=fedora1.qcow2 -usb \
   -net nic,model='rtl8139' -netdev user \
   -vga cirrus -cdrom fedora-1-i386-cd1.iso
```

Installing Fedora Core is simple and familiar; it uses the same installer as Fedora and Red Hat for the next 9 years. It's a graphical interface that's easy to use and easy to understand.

 ![Fedora Anaconda](https://opensource.com/sites/default/files/fedora1anaconda.png "Fedora Anaconda") 
Anaconda GUI

The Fedora Core experience is largely indistinguishable from Red Hat 6 or 7\. The GNOME desktop is polished, there are all the signature configuration helper applications, and the presentation is clean and professional.

A _Start Here_ icon on the desktop guides the user toward three locations: an _Applications_ folder, the _Preferences_ panel, and _System Settings_. A red hat icon marks the applications menu, and the lower GNOME panel holds all the latest Linux application launchers, including the OpenOffice office suite and the Mozilla browser.

### The future

By the early 2000s, it's clear that Linux has well and truly hit its stride. The desktop is more polished than ever, the applications available want for nothing, the installation is easier and more efficient than other operating systems. In fact, from the early 2000s onward, the relationship between the user and the system is firmly established and remains basically unchanged even today. There are some changes, and of course several updates and improvements and a staggering amount of innovation.

Project names come and go:

*   Mandrake became Mandriva and then [Mageia][1];
*   Fedora Core became just [Fedora][2];
*   [Ubuntu][3] popped up from [Debian][4] and helped make "Linux" a household term;
*   Valve has made [SteamOS][5] the official basis for its gaming platform; and
*   [Slackware][6] quietly continues to this day.

Whether you're new to Linux, or whether you're such an old hand that most of these screenshots have been more biographical than historical, it's good to be able to look back at how one of the largest open source projects in the world has developed. More importantly, it's exciting to think of where Linux is headed and how we can all be a part of that, starting now, and for years to come.

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/penguinmedallion200x200.png?itok=ROQSR50J)

Seth Kenlon - Seth Kenlon is an independent multimedia artist, free culture advocate, and UNIX geek. He is one of the maintainers of the Slackware-based multimedia production project, http://slackermedia.ml

--------------------------------------------------------------------------------

via: https://opensource.com/article/16/12/yearbook-linux-test-driving-distros

作者：[Seth Kenlon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/seth
[1]:http://mageia.org/
[2]:http://fedoraproject.org/
[3]:http://ubuntu.com/
[4]:http://debian.org/
[5]:http://store.steampowered.com/steamos
[6]:http://slackware.com/
[7]:https://www.flickr.com/photos/internetarchivebookimages/14746482994/in/photolist-ot6zCN-odgbDq-orm48o-otifuv-otdyWa-ouDjnZ-otGT2L-odYVqY-otmff7-otGamG-otnmSg-rxnhoq-orTmKf-otUn6k-otBg1e-Gm6FEf-x4Fh64-otUcGR-wcXsxg-tLTN9R-otrWYV-otnyUE-iaaBKz-ovcPPi-ovokCg-ov4pwM-x8Tdf1-hT5mYr-otb75b-8Zk6XR-vtefQ7-vtehjQ-xhhN9r-vdXhWm-xFBgtQ-vdXdJU-vvTH6R-uyG5rH-vuZChC-xhhGii-vvU5Uv-vvTNpB-vvxqsV-xyN2Ai-vdXcFw-vdXuNC-wBMhes-xxYmxu-vdXxwS-vvU8Zt
[8]:https://www.flickr.com/photos/internetarchivebookimages/14774719031/in/photolist-ovAie2-otPK99-xtDX7p-tmxqWf-ow3i43-odd68o-xUPaxW-yHCtWi-wZVsrD-DExW5g-BrzB7b-CmMpC9-oy4hyF-x3UDWA-ow1m4A-x1ij7w-tBdz9a-tQMoRm-wn3tdw-oegTJz-owgrs2-rtpeX1-vNN6g9-owemNT-x3o3pX-wiJyEs-CGCC4W-owg22q-oeT71w-w6PRMn-Ds8gyR-x2Aodm-owoJQm-owtGp9-qVxppC-xM3Gw7-owgV5J-ou9WEs-wihHtF-CRmosE-uk9vB3-wiKdW6-oeGKq3-oeFS4f-x5AZtd-w6PNuv-xgkofr-wZx1gJ-EaYPED-oxCbFP
[9]:http://www.qemu-advent-calendar.org/2014
[10]:http://www.slackware.com/~volkerdi/
[11]:https://ibiblio.org/pub/historic-linux/distributions/debian-0.91/debian-0.91/dist
[12]:http://www.xfree86.org/
[13]:http://enlightenment.org/
