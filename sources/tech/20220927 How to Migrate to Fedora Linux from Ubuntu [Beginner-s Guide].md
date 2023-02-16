[#]: subject: "How to Migrate to Fedora Linux from Ubuntu [Beginner’s Guide]"
[#]: via: "https://www.debugpoint.com/migrate-to-fedora-from-ubuntu/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Migrate to Fedora Linux from Ubuntu [Beginner’s Guide]
======
Here’s a quick model on how to migrate to Fedora from the Ubuntu desktop, for good & save yourself from “snap drama”.

[Ubuntu][1] and [Fedora][2] – are both great Linux operating systems.

They are used by millions of users every day and are available for desktops, servers, and cloud deployments. Fedora is sponsored by Red Hat and developed by the community, whereas Ubuntu development is managed by Canonical.

They follow a separate release schedule and have a different package management process. Otherwise, they are the same if you think of them as just a Linux distribution. So that said, it is not that difficult to migrate to Fedora for a long-term Ubuntu user. And use Fedora as a daily driver.

![KDE Plasma 5.21 in Fedora 34][3]

The objective of this guide is for desktop migration.

That means if you have been using Ubuntu on your Laptop/desktop for some time and never had a chance to try out the Fedora Linux workstation, then this article is for you.

Server migration to Fedora from Ubuntu Sever is an entirely different topic and requires an advanced assessment before you try. Server migration is not covered in this guide.

### Steps to migrate to Fedora from Ubuntu

#### Housekeeping

* I assume that you have adequate disk space and partition ready where you want to install Fedora Linux. Also, if you want to completely get rid of Ubuntu, you can install Fedora in the same partition easily.

* Make sure you take backups of your data from the Ubuntu installation. I would suggest you review your files in `/home` directory. Verify what backup you need to take in Documents, Pictures, Download directories.

* Write down the applications you additionally installed so that you can re-install them in your Fedora system. You can easily open GNOME Software (if you are using GNOME) and get a list of manually installed applications.

* Also, keep a note about the list of GNOME Extensions you use (if you are using GNOME).

* Write down the partitions of your disks and decide in which partition you want to install Fedora Linux. The easiest way to do this is using the GParted tool. Install it in Ubuntu using `sudo apt install gparted`. And get a list of partitions.

* Alternatively, run the following command from the terminal to get the partition list.

```
sudo lsblk -o name,mountpoint,label,size,uuid
```

* Like the Ubuntu desktop installer, Fedora also comes with Workstation editions (GNOME) for desktop installs. It also gives you a dedicated installer featuring all popular desktops. For example, if you prefer KDE Plasma, you get the Fedora KDE Plasma Spin.

* If you are all done with the housekeeping mentioned above, it’s time to download the ISO file for Fedora. So, download Fedora Workstation (GNOME) or Spin (like the different flavours with desktops) as per your need from the below link.

[download fedora – workstation edition (gnome)][4]

[download fedora – spins][5]

* Once downloaded, write the iso in USB using GNOME disk utility or use [Etcher][6] for easy and flawless LIVE USB preparation. Also, you may want to try [Fedora Media Writer][7] – which is a nice ISO creator, by the way.

#### Installation steps and differences

* The main installation is handled by different utilities by Fedora and Ubuntu. Hence if you are first time in Fedora, it would be a little tricky.

* Ubuntu uses the Ubiquity installer, and Fedora uses the Anaconda installer program. In my experience, the Ubiquity is fairly simple, and Anaconda is a little confusing on the disk partition section. But once you get to use Anaconda, it will be seamless for you.

* Start booting from the Fedora LIVE USB you created and boot into the live system desktop. After that, click on the install to the hard disk to start the installation.

* In the Anaconda installer, after selecting the language, click on the SYSTEM installation destination. This is a very important and the only complex step.

![Choose destination][8]

* Select disk and configuration as custom. This is easier than Blivet-GUI (based on my experience over the years).

![Select disk and configuration][9]

* Click on the “+” sign and give your partition size after selecting the partition format.

![Create partition][10]

![Provide the mountpoint and size][11]

![Verify and accept changes][12]

![Begin Installation][13]

* Click on begin installation to start the installation process and reboot when finished.

* Once you boot into the Fedora system, you are good to go. If you are already familiar with your desktop environment, such as GNOME or KDE Plasma, etc, then you would not feel the difference whether you are using Fedora or Ubuntu.

* The account creation, such as user name, password and other settings, is available the first time boot after the installation. This is another difference when you compare it with the Ubuntu installation.

### Important Commands

Fedora and Ubuntu are both Linux distributions. But their package manager is different.

Ubuntu uses an **apt** package manager, and Fedora uses **dnf**. Hence you need to know the basic terminal commands for daily usage. Here’s a quick comparison for you – so that you know what are the different commands for dnf.

| Function | Fedora Usage | Ubuntu Usage | 
| :- | :- | :- |
| Update system | sudo dnf update | sudo apt update | 
| Upgrade system | sudo dnf upgrade | sudo apt upgrade | 
| Install a package | sudo dnf install <package> | sudo apt install <package> | 
| Remove a package | sudo dnf remove <package> | sudo apt remove <package> | 
| Search a package | dnf search <package> | apt-cache search <package> |

### Restricted repository in Fedora

Like Ubuntu restricted repository, you also can have the same in Fedora using a repository called RPMFusion. You can enable this repo to access restricted packages, including the non-free version of several packages such as 3D graphics drivers, etc.

This is how you can enable it using the following commands. For detailed instructions, refer to [this guide][14].

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

```
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

### Distribution differences

Another fact you should be aware of while using Fedora.

Unlike Ubuntu, **Fedora doesn’t come with a long-term support release**. So, you get a new Fedora major version twice a year – on the “April-May” and “Oct-Nov” timeframe.

This is one of the main advantages of Fedora, you get updated latest upstream Linux Kernel and other packages twice a year. Stability-wise, Fedora is well stable unless you have a completely different setup/hardware box.

The upgrade process of Fedora is very [straightforward and stre][15]amlined. And most cases, you can keep on updating your existing installation, year after year, without any major problems.

### Help in Communities

From the user base, it is a well-known fact that Ubuntu has a more extensive user base across desktops, servers, and other flavors. Hence the free support channels are also full of reasonable solutions and fixes.

But Fedora also has a huge forum with always active members to help you when stuck with any issues while using Fedora. Using the following link, you can create a topic and get help anytime.

[https://ask.fedoraproject.org/][16]

So, that’s some of the essential items you need to know to migrate to Fedora from Ubuntu Linux.

### Closing Notes

I hope this essential guide helps you to jump the ship from Ubuntu to Fedora.

If you are a beginner or an average Linux user, you can quickly start with Fedora and do your necessary work. And once you are comfortable using dnf and other commands, navigating around problems in Fedora will be effortless.

In my personal experience, Fedora can be used as a daily driver for many years without any sudden surprises. The upgrades are painless with a stable package base with the best vanilla GNOME experience.

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/migrate-to-fedora-from-ubuntu/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://ubuntu.com
[2]: https://getfedora.org
[3]: https://www.debugpoint.com/wp-content/uploads/2021/04/KDE-Plasma-5.21-in-Fedora-34.png
[4]: https://getfedora.org/en/workstation/download/
[5]: https://spins.fedoraproject.org/
[6]: https://www.debugpoint.com/2021/01/etcher-bootable-usb-linux/
[7]: https://www.debugpoint.com/fedora-media-writer/
[8]: https://www.debugpoint.com/wp-content/uploads/2021/04/Choose-destination.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2021/04/Select-disk-and-configuration.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2021/04/Create-partition.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2021/04/Provide-the-mountpoint-and-size.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2021/04/Verify-and-accept-changes.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2021/04/Begin-Installation.jpg
[14]: https://www.debugpoint.com/2020/07/enable-rpm-fusion-fedora-rhel-centos/
[15]: https://www.debugpoint.com/upgrade-fedora-36-from-fedora-35/
[16]: https://ask.fedoraproject.org/
