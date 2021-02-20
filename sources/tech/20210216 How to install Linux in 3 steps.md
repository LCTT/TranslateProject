[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to install Linux in 3 steps)
[#]: via: (https://opensource.com/article/21/2/linux-installation)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to install Linux in 3 steps
======
Operating system installations may seem mysterious, but they are
actually pretty straight forward. Here are the steps for a successful
Linux installation.
![bash logo on green background][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different reasons to use Linux. Here's how to install Linux. 

Installing an operating system (OS) is always daunting. It's something of a puzzle to most people: Installing an OS can't happen from inside the OS because it either hasn't been installed, or it's about to be replaced by a different one, so how does it happen? And worse yet, it usually involves confusing questions about hard drive formats, install destinations, time zones, user names, passwords, and a bunch of other stuff that you just don't normally think about. Linux distributions know this, and so they've worked diligently over the years to reduce the time you spend in the OS installer down to the absolute minimum.

### What happens when you install

Whether you're installing just an application or a whole operating system, the process of _installation_ is just a fancy way to copy files from one medium to another. Regardless of any user interface or animations used to disguise the procedure as something highly specialized, it all amounts to the same thing in the end: Files that were once stored on a disc or drive are copied to specific locations on your hard drive.

When it's an application being installed, the valid locations for those files are highly restricted to your _file system_ or the part of your hard drive that your operating system knows it can use. This is significant because it's possible to partition a hard drive into separate spaces (Apple used this trick back in the early '00s for what they called "Bootcamp", allowing users to install both macOS and Windows onto a drive, but as separate entities). When you install an operating system, some special files are installed into places on your drive that are normally off-limits. More importantly, all existing data on your drive is, at least by default, erased to make room for the new system, so creating a backup is _essential_.

### Installers

Technically speaking, you don't actually _need_ an installer to install applications or even operating systems. Believe it or not, some people install Linux manually, by mounting a blank hard drive, compiling code, and copying files. This is accomplished with the help of a project called [Linux From Scratch (LFS)][2]. This project aims to help enthusiasts, students, and future OS designers to learn more about how computers work and what function each component performs. This isn't the recommended method of installing Linux, but you'll find that in open source, it's usually true that _if_ something can be done, then somebody's doing it. And it's a good thing, too, because these niche interests very often lead to surprisingly useful innovations.

Assuming you're not trying to reverse engineer Linux, though, the normal way to install it is with an install disc or install image.

### 3 easy steps to install Linux

When you boot from a Linux install DVD or thumb drive, you're placed into a minimal operating environment designed to run one or more useful applications. The installer is the primary application, but because Linux is such a flexible system, you can usually also run standard desktop applications to get a feel for what the OS is like before you commit to installing it.

Different Linux distributions have different installer interfaces. Here are two examples:

Fedora Linux has a flexible installer (called **Anaconda**) capable of complex system configuration.

![Anaconda installer screen on Fedora][3]

The Anaconda installer on Fedora

Elementary OS has a simple installer designed primarily for an install on a personal computer:

![Elementary OS installer][4]

Elementary OS installer

#### 1\. Get an installer

The first step toward installing Linux is to download an installer. You obtain a Linux install image from the distribution you've chosen to try.

  * [Fedora][5] is famous for being the first to update its software
  * [Linux Mint][6] provides easy options to install missing drivers
  * [Elementary][7] provides a beautiful desktop experience and several special, custom-built applications



Linux installers are `.iso` files, which are "blueprints" for DVD media. You can burn the `.iso` file to a DVD-R if you still use optical media, or you can _flash_ it to a USB drive (make sure it's an empty USB drive, as all of its contents are erased when the image is flashed onto it). To flash an image to a USB drive, you can [use the open source Etcher application][8].

![Etcher used to flash a USB thumb drive][9]

Etcher application can flash a USB thumb drive

You're now ready to install Linux.

#### 2\. Boot order

To install an OS onto a computer, you must boot to the OS installer. This is not common behavior for a computer because it's so rarely done. In theory, you install an OS once, and then you update it. When you opt to install a different operating system onto a computer, you're interrupting that normal lifecycle. That's not a bad thing. It's your computer, so you have the authority to do re-image it. However, it's different from the default behavior of a computer, which is to boot to whatever operating system it finds on the hard drive immediately after being powered on.

Before installing Linux, you must back up any data you have on your target computer because it will all be erased upon installation.

Assuming you've saved your data to an external hard drive, which you've then secreted away to somewhere safe (and not attached to your computer), then you're ready to proceed.

First, attach the USB drive containing your Linux installer to your computer. Power on the computer and watch the screen for some indication of how to interrupt its default boot sequence. This is usually a key like **F2**, **F8**, **Esc**, or even **Del**, but it varies depending on your motherboard manufacturer. If you miss your window of opportunity, just wait for the default OS to load, and then reboot and try again.

When you interrupt the boot sequence, your computer prompts you for boot instructions. Specifically, the firmware embedded into the motherboard needs to know what drive to look to for an operating system it can load. In this case, you want the computer to boot from the USB drive containing the Linux image. How you're prompted for this information varies, depending on the motherboard manufacturer. Sometimes, it's a very direct question complete with a menu:

![Boot device menu][10]

The boot device selection menu

Other times, you're taken into a rudimentary interface you can use to set the boot order. Computers are usually set by default to look to the internal hard drive first. Failing that, it moves on to a USB drive, a network drive, or an optical drive. You need to tell your computer to look for a USB drive _first_ so that it bypasses its own internal hard drive and instead boots the Linux image on your USB drive.

![BIOS selection screen][11]

BIOS selection screen

This may seem daunting at first, but once you get familiar with the interface, it's a quick and easy task. You won't have to do this once Linux is installed because, after that, you'll want your computer to boot off the internal hard drive again. This is a great trick to get comfortable with, though, because it's the key to using Linux off of a thumb drive, testing a computer for Linux compatibility before installing, and general troubleshooting regardless of what OS is involved.

Once you've selected your USB drive as the boot device, save your settings, let the computer reset, and boot to the Linux image.

#### 3\. Install Linux

Once you've booted into the Linux installer, it's just a matter of stepping through prompts.

The Fedora installer, Anaconda, presents you a "menu" of all the things you can customize prior to installation. Most are set to sensible defaults and probably require no interaction from you, but others are marked with alert symbols to indicate that your configurations can't safely be guessed and so need to be set. These include the location of the hard drive you want the OS installed onto and the user name you want to use for your account. Until you resolve these issues, you can't proceed with the installation.

For the hard drive location, you must know which drive you want to erase and re-image with your Linux distribution of choice. This might be an obvious choice on a laptop that has only one drive, to begin with:

![Screen to select the installation drive][12]

Select the drive to install the OS to (there's only one drive in this example)

If you've got more than one drive in your computer, and you only want Linux on one of them, or else you want to treat both drives as one, then you must help the installer understand your goal. It's easiest to assign just one drive to Linux, letting the installer perform automatic partitioning and formatting, but there are plenty of other options for advanced users.

Your computer must have at least one user, so create a user account for yourself. Once that's done, you can click the **Done** button at last and install Linux.

![Anaconda options complete and ready for installation][13]

Anaconda options are complete and you're ready to install

Other installers can be even simpler, believe it or not, so your experience may differ from the images in this article. No matter what, the install process is one of the easiest operating system installations available outside of getting something pre-installed for you, so don't let the idea of installing an OS intimidate you. This is your computer. You can and should install an OS in which you have ownership.

### Own your computer

Ultimately, Linux is your OS. It's an operating system developed by people from all over the world, with one interest at heart: Create a computing culture of participation, mutual ownership, and co-operative stewardship. If you're interested in getting to know open source better, then take the step to know one of its shining examples and install Linux.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-installation

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: http://www.linuxfromscratch.org
[3]: https://opensource.com/sites/default/files/anaconda-installer.png
[4]: https://opensource.com/sites/default/files/elementary-installer.png
[5]: http://getfedora.org
[6]: http://linuxmint.com
[7]: http://elementary.io
[8]: https://opensource.com/article/18/7/getting-started-etcherio
[9]: https://opensource.com/sites/default/files/etcher_0.png
[10]: https://opensource.com/sites/default/files/boot-menu.jpg
[11]: https://opensource.com/sites/default/files/bios_1.jpg
[12]: https://opensource.com/sites/default/files/install-harddrive-chooser.png
[13]: https://opensource.com/sites/default/files/anaconda-done.png
