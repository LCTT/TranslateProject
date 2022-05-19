[#]: subject: "How To Enable Activate Linux Watermark Notification In Linux Desktop"
[#]: via: "https://ostechnix.com/activate-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Enable Activate Linux Watermark Notification In Linux Desktop
======
The "Activate Windows" Watermark is ported to Linux.

In an attempt to stop piracy of Windows OS, the Microsoft developer team has come up with an idea to place a watermark in the corner until the users legally purchase a license and activate the Windows OS.

If you're running a pirated Windows copy in your system, you should have noticed the "Activate Windows" watermark notification in the lower bottom corner as shown in the below screenshot.

![Activate Windows Notification][1]

Fortunately, the Linux users will never get such notifications. Because GNU/Linux is an entirely free, open source operating system, released under the GNU General Public License (GPL).

Anyone can run, study, modify, and redistribute the Linux source code, or even sell copies of their modified code, as long as they do so under the same license.

Since Linux is open source, there is nothing you can do with Linux really, that you can't do with proprietary operating systems.

There are a whole of things you can do in Linux. Be it a fun project or an enterprise-grade application, you can build and run *almost* anything under Linux. Even it is possible to add the "Activate Linux" watermark as well.

### What Is Activate Linux?

A few days ago I came across a fun project called "Activate Linux". It is very similar to "Activate Windows" notification that you see in a non-licensed Windows OS.

The developer of Activate Linux has recreated the "Activate Windows" notification watermark for Linux with with Xlib and cairo in C.

This will show a watermark on your Linux desktop and notify you to go to settings to activate your Linux distribution! Cool, yeah?

### Enable Activate Linux Watermark

The activate-linux project became very popular in a short period of time. It has already been packaged for popular Linux distributions such as Arch Linux, openSUSE and Ubuntu within a few days.

#### Arch Linux

Activate-linux is available in **[AUR][2]**. So you can install activate-linux app in Arch Linux and its variants EndeavourOS and Manjaro Linux using **[Paru][3]** or **[Yay][4]**.

```
$ paru -S activate-linux
```

Or,

```
$ yay -S activate-linux
```

#### openSUSE

Activate-linux is available in **[OBS][5]**.

If you use openSUSE Tumbleweed edition, run the following commands one by one to install activate-linux:

```
$ sudo zypper addrepo https://download.opensuse.org/repositories/home:WoMspace/openSUSE_Tumbleweed/home:WoMspace.repo
```

```
$ sudo zypper refresh
```

```
$ sudo zypper install activate-linux
```

For openSUSE Factory ARM, run the following:

```
$ sudo zypper addrepo https://download.opensuse.org/repositories/home:WoMspace/openSUSE_Factory_ARM/home:WoMspace.repo
```

```
$ sudo zypper refresh
```

```
$ sudo zypper install activate-linux
```

#### Ubuntu

Activate-linux has a PPA for Ubuntu and its derivatives like Pop!_OS.

```
$ sudo add-apt-repository ppa:edd/misc
```

```
$ sudo apt update
```

```
$ sudo apt install activate-linux
```

Once installed, simply run it from the Terminal using command:

```
$ activate-linux
```

You will now see the "Activate Linux" watermark notification in the corner of the desktop just like in a non-licensed Windows copy.

![Activate Linux Watermark In Desktop][6]

Don't be alarmed! It is harmless. To get rid of this notification, go back to the terminal and kill the activate-linux command by pressing **CTRL+C**.

I tested this on Ubuntu 22.04 GNOME edition. It works out of the box in Wayland.

Activate Linux is a one of the pretty funny as well as useless project ever I have come across in a while. I guess it is going to make every Windows switcher feel so much more comfortable!!

### Resource

* [Activate Linux GitHub Repository][7]

--------------------------------------------------------------------------------

via: https://ostechnix.com/activate-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/05/Activate-Windows-Notification.png
[2]: https://aur.archlinux.org/packages/activate-linux-git
[3]: https://ostechnix.com/how-to-install-paru-aur-helper-in-arch-linux/
[4]: https://ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[5]: https://software.opensuse.org//download.html?project=home%3AWoMspace&package=activate-linux
[6]: https://ostechnix.com/wp-content/uploads/2022/05/Activate-Linux.png
[7]: https://github.com/MrGlockenspiel/activate-linux
