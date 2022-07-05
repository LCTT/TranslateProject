[#]: subject: "New Features in the Upcoming Linux Mint 21 Release"
[#]: via: "https://itsfoss.com/linux-mint-21-features/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

New Features in the Upcoming Linux Mint 21 Release
======
This is a continually updated article to share the latest features added to the upcoming Linux Mint 21 release.

You probably already know that Linux Mint is based on the long-term support (LTS) release of Ubuntu.

Ubuntu 22.04 LTS was released a few months ago. This means that a new major version of Linux Mint is to follow sooner or later.

And indeed the next major version, Linux Mint 21, is already in development. While there is no official release date announced, you should expect it to arrive by the end of July’22 or early August.

### Linux Mint 21 is codenamed Venessa

![linux mint 21][1]

Every Linux Mint release, be it minor or major, has a codename. It is a female name normally of Greek or Latin release.

Like Ubuntu, there is a pattern in the codename in Mint also. The codenames are in alphabetically increasing order for the major release but they use the same alphabet for the minor releases.

For example, Mint 20 was called Ulyana, 20.1 Ulyssa, 20.2 Uma and 20.3 Una. Mint 19 series had codenamed starting with T.

Mint 21 codename starts with V and the first release of the 21 series is called Venessa.

There will be at least 3 more minor releases in the Mint 21 series and they will be released every six months until the next Mint major release in 2024. They all will have a codename starting with the letter V.

### New features in Mint 21 Venessa

There is not a lot of information available to the public about the features in Linux Mint 21. What I am listing here is based on the official updates, forums and GitHub repositories. I’ll be adding more as I test the beta version when it is released.

#### New upgrade tool

Existing Mint 20.3 users should be able to upgrade to Mint 21 relatively easier thanks to the [new upgrade tool][2].

![New Mint Upgrade tool in Linux Mint 21][3]

Earlier, upgrading to a major version involved using the terminal. Now everything should be done with a few mouse clicks in the new GUI tool.

It will show what packages have been upgraded and which packages won’t be upgraded. It supports several languages. It even checks if your PPA and custom repositories are supported in the new version.

![New Mint Upgrade tool in Linux Mint 21][4]

Overall an excellent tool to ease the upgrade process. It’s good to see that Mint focuses on developing graphical tools to help its users.

#### New Bluetooth application

Though not developed by the Mint team, Mint 21 will feature the Blueman tool for managing the Bluetooth settings.

![New Bluetooth settings in Linux Mint 21][5]

What’s wrong with the existing Blueberry tool? Nothing really. But since it is not compatible with GNOME 42 (which is the base for the next version of Cinnamon desktop). As lead developer, Clem [mentioned][6], “There is also frustration upstream from the GNOME Bluetooth development team who simply does not want to have users from other desktops than GNOME and so Blueberry will probably get discontinued.”

Blueberry had a simple interface whereas Blueman has plenty of settings you’ll hardly need.

#### Timeshift becomes a Mint tool

Mint team has been recommending Timeshift for system settings backups for some time now. It almost felt a part of the Mint applications suite. I actually[mistakenly said that in one of the YouTube videos as well][7].

But the good news is that the Mint team has taken over the development of the Timeshift application. It is now part of the XApp and you should see it even more integrated within the Linux Mint ecosystem.

There are already a few developments to it. For example, in rsync mode, Timeshift now calculates the required space for the next snapshot and skips it if performing that snapshot leads to less than 1GB of free space on the disk.

![timeshift mint21][8]

#### WebP image support

WebP image format is getting popular these days among website owners. They are smaller in size without compromising on quality.

If you try to download images from the internet and they are in WebP format, they are opened with a web browser. You’ll have to install additional packages for [WebP support in other Linux distributions][9].

Mint 21 will have WebP support enabled by default. You can open the WebP images in the image viewer and the images will be displayed with Thumbnail in the Nemo file manager.

#### No negative impact on dual boot

It was noticed in Ubuntu 22.04 release that Windows disappeared from the Grub menu in dual boot systems. It was because the os-prober feature was disabled by default in version 2.6 of [Grub bootloader][10].

Mint team has correctly decided to enable the os-prober by default. This means that the Grub bootloader with Mint 21 should be able to properly detect Windows (and other OS) as it used to previously.

#### No surprise killing of applications (like Ubuntu 22.04)

Ubuntu 22.04 introduced the [systemd-oomd][11], a userspace out-of-memory (OOM) killing service. This service takes “corrective action before an OOM occurs in the kernel space”.

So when the system is struggling with memory pressure, this service jumps into action to ensure that system keeps running. How does it do that? By killing some running applications.

But that’s created a problem as[Ubuntu users complained of random closing of running applications][12].

For this reason, Mint team has decided against including this ‘performance improving’ feature in the upcoming Mint 21.

How does that impact you as an end user? Well, if you tried downloading some images from the internet, it might be in

#### AppImage support as it is

It looks like Mint 21 is undoing a lot of things that Ubuntu 22.04 have done. The libfuse library has been removed from Ubuntu 22.04 LTS and hence you [cannot run AppImage applications][13] unless you install it explicitly.

The Mint team takes note of this pain point and has included libfuse2 and libfuse3-3 by default in Mint 21.

#### Newer software and kernel

Of course, Mint 21 will have newer versions of many popular applications and Kernel 5.15 LTS.

The newer version of the Cinnamon desktop environment should bring visual changes as well. More on that when the new version is out.

#### More to come … 

Mint 21 is under heavy development. While you won’t see regular updates from the Mint team on its development, we’ll have a clearer picture of what’s coming when the beta version is released.

Meanwhile, do express your views on Linux Mint 21. What kinds of features are you expecting in the new version?

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-mint-21-features/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/07/linux-mint-21.png
[2]: https://github.com/linuxmint/mintupgrade
[3]: https://itsfoss.com/wp-content/uploads/2022/07/mintupgrade.png
[4]: https://itsfoss.com/wp-content/uploads/2022/07/mintupgrade2.png
[5]: https://itsfoss.com/wp-content/uploads/2022/07/blueman-800x458.png
[6]: https://blog.linuxmint.com/?p=4323
[7]: https://www.youtube.com/watch?v=XWrZvRnAda0&t=45s
[8]: https://itsfoss.com/wp-content/uploads/2022/07/timeshift_mint21-800x648.png
[9]: https://itsfoss.com/webp-ubuntu-linux/
[10]: https://itsfoss.com/what-is-grub/
[11]: https://www.freedesktop.org/software/systemd/man/systemd-oomd.service.html
[12]: https://www.omgubuntu.co.uk/2022/06/ubuntu-22-04-systemd-oom-killing-apps
[13]: https://itsfoss.com/cant-run-appimage-ubuntu/
