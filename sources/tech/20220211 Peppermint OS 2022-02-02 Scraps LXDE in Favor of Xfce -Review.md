[#]: subject: "Peppermint OS 2022-02-02 Scraps LXDE in Favor of Xfce [Review]"
[#]: via: "https://www.debugpoint.com/2022/02/peppermint-os-2022-02-02-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Peppermint OS 2022-02-02 Scraps LXDE in Favor of Xfce [Review]
======
WE REVIEW THE PEPPERMINT OS 2022-02-02 RELEASE IN TERMS OF PERFORMANCE
STABILITY AND GIVE YOU AN OVERVIEW OF THE EXCITING CHANGES OF THIS
VERSION.
W

![Peppermint 2022-02-02 Desktop][1]

Peppermint OS is a Debian stable-based Linux Distribution that featured LXDE components alongside Xfce earlier. This operating system is primarily used for older hardware which requires stability and minimal maintenance in terms of software.

Peppermint OS 2022-02-02 was [recently released][2] with significant core module changes with the adaptation of Xfce by removing all LXDE components, new applications and more. We review the release overall and give you an idea of whether you would like to adopt this [Linux Distribution][3] for your daily usage.

### Peppermint OS 2022-02-02 Review and Highlights

#### Live Medium and Installation

In my test, the ISO download was easy, and no issues with the integrity of the iso file. The Live medium boots fine, and you get a nice LIVE desktop with a shortcut to kick start the installation.

The team has replaced the old Ubiquity installer. Now Peppermint uses Calamares installer for its installation system. It is a perfect choice considering Ubuntu is already planning to move away from the good old Ubiquity.

The Calamares never fails, in my experience over the years. I installed Peppermint 2022-02-02 in a triple boot system and a virtual machine ([virt-manager][4]). The installation went smooth. The GRUB update detects all operating systems without any problems.

#### New Features in this release

Peppermint 2022-02-02 release (strange naming convention) took some bold steps at its core.

Since the beginning, Peppermint OS featured LXDE desktop as default. This release of Peppermint removed the LXDE desktop and adopted the lightweight Xfce.

There is a change in the default file manager as well. Nemo is now the default file manager, replacing Thunar, the Xfce’s default file manager.

The team introduces two new native utilities in this release of Peppermint to help users perform specific tasks.

The new Welcome to Peppermint application allows you to install a web browser some additional Peppermint extra goodies like wallpapers etc. It also has a button to lauch the Peppermint Hub, which is another new application in this release.

![The new Welcome to Peppermint application][5]

The Peppermint Hub is an excellent addition to this Linux Distribution. It has all the necessary shortcuts for your system management, from changing themes to updating and downloading software from the repository.

If you are a new user, Peppermint Hub will take care of most system management tasks from one single point.

![The new Peppermint Hub Application written in Python][6]

#### Desktop and Applications with Look &amp; Feel

Peppermint OS is based on Debian stable branch. This release updates its core to [Debian Bullseye 11.2][7], the latest version today with [Linux Kernel 5.10][8]. It also features the current stable [Xfce 4.16][9] lightweight desktop environment.

This OS is now based on Xfce, and you get all the native Xfce applications. But Peppermint also brings some additional GNOME applications that are pre-loaded. The user gets both Xfce and GNOME apps together by default.

[][10]

SEE ALSO:   Ubuntu Unity 20.10 Review: Unity with Stability

Following non-native-Xfce applications are pre-loaded:

  * GNOME Disks
  * DCONF Editor
  * GDebi package manager
  * Gparted



Papirus Icon theme with Peppermint Red Dark style looks excellent, though. I think a light style of Peppermint Red Dark would have been great. Maybe we can expect that in future releases.

#### Things that may cause trouble for users

  * One decision that may create a problem for some users is that there is no Web Browser installed as default. I get it. The team want to give the user the option to choose a browser for themselves. But if you are installing it offline, you need an internet connection to get a browser downloaded and installed.
  * Also, no image viewer is installed by default, which surprises me. Moreover, during my test of necessary connectivity – all went well. The WiFi is connected correctly, the external monitor is detected, and ARANDR is already installed to manage multiple displays.
  * But unfortunately, Bluetooth didn’t work in my test hardware. I could not find Bluetooth daemon and it is not installed with Blueman or related manager. So, this may cause some issues for users who want to connect to an external Bluetooth headset or speakers.
  * One other setting, which should be enabled by default, is tap to click. It is really difficult for Laptop or touchpad users to operate without Tap to Click.



#### Performance

The performance is excellent, considering the new lightweight Xfce desktop. I kept it running for 10 hours in a virtual machine, and it is consuming around 900 MB of memory, and the CPU is at 3% on average.

I ran it through Firefox multiple tabs open with YouTube playing and additional applications available to test the heavy workload. Peppermint OS 2022-02-02 consumes 1.5 GB of memory and CPU at 4% to 5% on average.

![Peppermint OS Performance with a workload][11]

In my opinion, the Xfce desktop is a little heavy on resources compared to LXDE or LXQt. The performance would have been much lighter if I had applied the same workload on LXDE or LXQt.

However, the above metrics shows a good performance display from the OS.

### Closing Notes

One of the selling points of Peppermint OS was the LXDE desktop. Not many Linux Distribution brings LXDE by default. The Debian Stable and LXDE combination is perfect for older hardware and long-running stable system. Now with Xfce, not sure whether users migrate to other distributions. But then MX Linux is also literally the same as peppermint OS at this stage with Debian stable and Xfce. It has some additional advantages with MX Tools and other in-house utilities.

If you plan for a daily driver distribution, then peppermint OS 2022-02-02 can be a choice for you today, even with Xfce.

That said, an excellent and stable release from the peppermint team for its user base.

Cheers.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][12], [Twitter][13], [YouTube][14], and [Facebook][15] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/02/peppermint-os-2022-02-02-review/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/02/Peppermint-2022-02-02-Desktop-1024x576.jpg
[2]: https://peppermintos.com/2022/02/peppermint-release-notes/
[3]: https://www.debugpoint.com/category/distributions
[4]: https://www.debugpoint.com/2020/11/virt-manager/
[5]: https://www.debugpoint.com/wp-content/uploads/2022/02/The-new-Welcome-to-Peppermint-application.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/02/The-new-Peppermint-Hub-Application-written-in-Python-1024x487.jpg
[7]: https://www.debugpoint.com/2021/05/debian-11-features/
[8]: https://www.debugpoint.com/2020/12/linux-kernel-5-10-release-announcement/
[9]: https://www.debugpoint.com/2021/02/xfce-4-16-review/
[10]: https://www.debugpoint.com/2020/11/ubuntu-unity-20-10-review/
[11]: https://www.debugpoint.com/wp-content/uploads/2022/02/Peppermint-OS-Performance-with-workload-1024x414.jpg
[12]: https://t.me/debugpoint
[13]: https://twitter.com/DebugPoint
[14]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[15]: https://facebook.com/DebugPoint
