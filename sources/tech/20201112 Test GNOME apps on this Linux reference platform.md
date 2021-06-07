[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Test GNOME apps on this Linux reference platform)
[#]: via: (https://opensource.com/article/20/11/gnome-os)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

Test GNOME apps on this Linux reference platform
======
Introducing GNOME OS, the plain-vanilla Linux reference platform that
makes it easier to test GNOME applications and bug reports.
![Penguin with green background][1]

I'm very excited about [GNOME 3.38][2]. The new version of the Linux desktop environment includes [lots of new features and a noticeable performance boost][3]. But in the background, mostly unnoticed, is another neat new thing about GNOME: the development of GNOME OS.

As you might guess from its name, GNOME OS is a Linux distribution that uses GNOME as its desktop. But unlike Pop!_OS, Fedora, or Ubuntu, GNOME OS isn't meant as a complete Linux distribution. Instead, it is a reference platform for GNOME.

The idea is to have a standard operating system image running GNOME to give developers a consistent platform to test on. As GNOME makes new releases, the GNOME development team can share that image with testers, so they can experience the new version.

This is significant for GNOME testing. Previously, if someone reported a bug in a GNOME application, a developer would have to dig into the bug report and determine if the bug is really in the GNOME desktop or if it happened because the distribution did something or tweaked something in GNOME that had a knockdown effect on a GNOME application. But with GNOME OS, developers have a standard reference platform that is always a _vanilla_ version of GNOME. Developers can reproduce bug reports using GNOME OS; if they can reproduce the bug, they know it's really with GNOME and not someone else's "spin" on GNOME.

As such, GNOME OS is not meant to be a full desktop operating system. It's just meant to be a place to test GNOME and GNOME applications.

![Installing GNOME OS][4]

Installing GNOME OS (Jim Hall, [CC BY-SA 4.0][5])

GNOME OS also helps GNOME developers add new features. Imagine having a virtual machine where a developer can test new changes to GNOME Shell and the extensions. In previous GNOME releases, GNOME extensions would usually break in every release. With GNOME OS, developers can test those extensions against a full version of GNOME. Developers and testers don't have to reinstall their full desktop OS—they can just run GNOME OS in a virtual machine and test it there.

![Booting GNOME OS][6]

Booting GNOME OS (Jim Hall, [CC BY-SA 4.0][5])

That's the big value in GNOME OS. Now extension writers can do their tests using GNOME OS and don't have to wait for a new version of the full GNOME to become available in a standard distribution. This allows GNOME to better support development and testing processes.

GNOME OS also makes it easier for testers to join the project. If you want to work on GNOME, just download the GNOME OS image and test against that. Because GNOME OS is a reference platform, you know that any bugs you find will be only against GNOME.

![Running GNOME OS][7]

Running GNOME OS (Jim Hall, [CC BY-SA 4.0][5])

GNOME OS is automatically generated from new builds, so it's always the latest version of GNOME. Whenever there's a change in GNOME, it gets pushed to the GNOME OS image. GNOME OS is managed with [OSTree][8], so you don't have to keep downloading new versions. This also makes it easy to roll back if an update is broken.

Interested in GNOME OS? Learn more about it at [GNOME OS Nightly][9], or visit the [GitLab project][10] to download a bootable GNOME OS image.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/gnome-os

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 (Penguin with green background)
[2]: https://help.gnome.org/misc/release-notes/3.38/
[3]: https://opensource.com/article/20/10/whats-new-gnome-338
[4]: https://opensource.com/sites/default/files/uploads/installing-gnome-os.png (Installing GNOME OS)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/booting-gnome-os.png (Booting GNOME OS)
[7]: https://opensource.com/sites/default/files/uploads/running-gnome-os.png (Running GNOME OS)
[8]: https://ostreedev.github.io/ostree/
[9]: https://os.gnome.org/
[10]: https://gitlab.gnome.org/GNOME/gnome-build-meta/-/wikis/home
