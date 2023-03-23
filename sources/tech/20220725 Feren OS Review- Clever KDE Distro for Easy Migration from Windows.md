[#]: subject: "Feren OS Review: Clever KDE Distro for Easy Migration from Windows"
[#]: via: "https://www.debugpoint.com/feren-os-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Feren OS Review: Clever KDE Distro for Easy Migration from Windows
======
A review of Feren OS – a KDE Plasma and Ubuntu fusion, specially designed for Windows users to help them migrate.

Over the years, many readers commented about Feren OS and its advantages on this website. I never got a chance to try this distribution in terms of its benefits and why it stands out among hundreds of distros.

So, here’s a review of the great Feren OS.

### Feren OS Review

First and foremost, its creators designed and marketed it as an ideal replacement for Windows and macOS. At its core, it’s based on Ubuntu LTS with a base KDE Plasma desktop and additional tweaks. However, it does bring several goodies specially designed for Windows users. A lot on that a little later. Let’s download and install it.

#### Download and Install

The Feren OS (20.04) ISO file is about 2.5 GB, and it has only one variant for KDE Plasma – which is the only offering. However, the download took around 6 hours from SourceForge.

A few interesting things happened when I booted this up in a VM ([virt-manager][1]). During my years of [distro review][2], I haven’t seen any distro do this.

First, the LIVE medium understood that I was using the virtual machine and changed the compositor by itself to Xrender for better performance in VM. Second, it also gave the option to install guest additions for VirtualBox and VM Tools for VM Ware for additional functionalities.

![Virtual Machine detected by Feren OS installer][3]

Moreover, Feren OS gave options to transfer files from the Windows partition before installing the system! And an option to choose the desktop layout if you are installing it on a touch-based device.

![You can take backups of Windows data before install][4]

The installer is Calamares and not Ubuntu’s Ubiquity, although it depends on Ubuntu LTS. While installing the system, Feren OS doesn’t do the account creation, keyboard and other selections. It prompts you for user account creation and additional info after the first reboot and post-installation. Fedora Linux workstation edition does this via the Anaconda installer.

Apparently, it is probably nothing. But from a Windows user’s perspective, an “easy install” experience is important, and I believe the team made an excellent decision on this.

Finally, the installation went smooth, and no such surprises there.

#### First boot and looks

During the first boot, you need to set up the user accounts and other initial settings. The wizard gives you options to choose the light/dark theme, desktop layouts and different initial configs. This is a nice touch and looks professional.

The KDE Plasma desktop is nice and clean with the pre-configured taskbar and the Breeze theme. The taskbar has the application menu on the left side. In the middle of the taskbar, you find the shortcut to Vivaldi, File manager and homegrown Store. And at the right is a traditional system tray.

![Feren OS Desktop][5]

Feren OS pre-loads a good set of Plasma Global Themes other than the usual Breeze variants. All of them are perfect and give your desktop a nice touch with just one click. As of the current version, you get Feren OS, Hooman, Dooars and Mac n’ Cheese theme. In addition, you also can get the Tablet and Classic settings of the desktop. It also features the Inspire icon theme and DMZ cursor theme by default.

#### Workspaces and Full-screen Application View

One of the unique features I want to highlight is the default workspace configuration that Feren OS brings. By default, there are four desktops to work with. At the taskbar, there is an icon which brings up the new workspaces in the KDE Plasma desktop.

![Feren OS – Default four desktops][6]

If you apply the pre-defined macOS theme, the application view is quite spectacular (which is a KDE widget, btw). It even searches the apps and individual settings when you start typing. See the image below.

![Fullscreen app menu with dynamic search][7]

Also, the global menu gives you the extra edge and precious screen space for your workflow.

#### Native and Installed Applications

Let’s talk about some exciting app choices that Feren OS installs by default.

Although it’s based on KDE Plasma, some apps are chosen carefully based on their features and performances. For example, the file manager is Nemo instead of Dolphin, which is a good choice since Nemo is an awesome file manager.

In addition, Feren OS packages Geary [email desktop client][8], GDebi package manager, Timeshift backup utility, and VLC Media player – some of the essential non-KDE Apps.

The native apps are quite interesting.

A native app called “Store” manages application search, installation and uninstall. It’s a homegrown tool which looks similar to GNOME’s Software. It supports usual categories and one-click installation. However, it seems it doesn’t support managing software sources. I belives that’s the reason Synaptic package manager is installed by default.

![Natively designed Store manager][9]

Other than that, there is an app, “Web Browser Manager”, which lets you install additional browsers with just one click. It’s interesting to see a dedicated app to manage just the web browsers.

#### A note about the Transfer Tool

Since its target audiences are Windows users, it brings a dedicated tool to transfer data from your Windows partitions and helps you to take backups to a custom target drive or device. The tool can easily detect generic Windows folders such as Documents, Users, Pictures, Videos etc.

![Feren OS Transfer Tool][10]

It’s a handy tool if you want a quick backup of your Windows partition. More importantly, you can use this in a LIVE medium without installing Feren OS.

#### Performance

You might have guessed about FerenOS’s performance as it’s based on Ubuntu LTS and KDE Plasma desktop. The performance, in simple words, is the same as that of Kubuntu.

In an idle state (i.e. desktop is boot and kept inactive), it consumes around 1.8 GB of memory, and the CPU is at 4% to 8%. The latte dock consumes most system resources and plasma desktop, followed by the KWin. This is when the macOS theme is enabled.

![Feren OS – Performance at Idle State][11]

Next, I make it run through heavy workload situations with one instance each for File manager, media player, Vivaldi browser, image editor, LibreOffice and Console application. At this heavy performance stage, Feren OS consumes around 2.1 GB of system memory, and the CPU is hovering at 8 to 10 %.

![Feren OS – Performance at Heavy workload State][12]

I think it’s an impressive performance metric in the heavy workflow state. I was expecting a little higher memory and CPU consumption.

The only reason I believe the performance is better in a heavy workflow state is not to use Firefox or Chrome. Vivaldi is performing better in the memory utilization space than that Firefox or Chrome.

### Wrapping Up

Feren OS is one of those Linux distros which packs a default look with Stability together. It’s one of the “not-so-popular” & mainstream distros with many prospects. Its unique way of implementing several critical items, from installation to the first experience for a new or migrated Windows user, is a great touch.

Besides, its in-house apps and utilities are one of the best implementations for a distro targeted at Windows users. And the Ubuntu LTS base gives them an edge over the players.

The only drawback I can see is the major release is a little delayed. For example, the Ubuntu 22.04 LTS version is not yet out. Perhaps the delay is because of a small dev team.

But, besides that, it’s a perfect and ready-to-use daily driver. You may give it a try.

You can download Feren OS from the [official website][13].

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/feren-os-review/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/virt-manager/
[2]: https://www.debugpoint.com/tag/linux-distro-review
[3]: https://www.debugpoint.com/wp-content/uploads/2022/07/Virtual-Machine-detected-by-Feren-OS-installer.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/07/You-can-take-backups-of-Windows-data-before-install.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/07/Feren-OS-Desktop.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/07/Feren-OS-Default-four-desktops.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/07/Fullscreen-app-menu-with-dynamic-search.jpg
[8]: https://www.debugpoint.com/best-email-client-linux-windows/
[9]: https://www.debugpoint.com/wp-content/uploads/2022/07/Natively-designed-Store-manager.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/07/Feren-OS-Transfer-Tool.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/07/Feren-OS-Performance-at-Idle-State.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/07/Feren-OS-Performance-at-Heavy-workload-State.jpg
[13]: https://ferenos.weebly.com/get-feren-os.html
