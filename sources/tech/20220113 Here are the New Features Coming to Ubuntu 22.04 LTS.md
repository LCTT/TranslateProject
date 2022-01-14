[#]: subject: "Here are the New Features Coming to Ubuntu 22.04 LTS"
[#]: via: "https://itsfoss.com/ubuntu-22-04-release-features/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Here are the New Features Coming to Ubuntu 22.04 LTS
======

_**This is a continually updated article that lists all the main features being added to the upcoming Ubuntu 22.04 LTS ‘Jammy Jellyfish’ release.**_

Ubuntu fans! It’s time to get excited about the next big release which is Ubuntu 22.04 LTS. Yes. It is a long term support release and it will be supported for five years till April 2027.

The upcoming LTS release brings several new features. If you are using Ubuntu 20.04 LTS, you will notice numerous visual changes. If you are using Ubuntu 21.10, you already have seen plenty of changes but there will still be a few new ones in the upcoming release.

Before I show you the new expected new features in 22.04, let’s see when it will be released.

### Ubuntu 22.04 Release Schedule

The stable version of Ubuntu 22.04 is scheduled to be released on April 21, 2022. The development is already going in full swing and it will follow this release schedule:

  * February 24, 2022: Feature freeze
  * March 17, 2022: UI freeze
  * March 31, 2022: Beta release
  * April 14, 2022: Release candidate
  * **April 21, 2022: Final stable release**



Now that you know the important release dates, time to know about the new features Ubuntu 22.04 LTS will be bringing.

### New features in Ubuntu 22.04 LTS Jammy Jellyfish

Since the development is still going on, many new features will be added in the near future. I’ll update them as they are revealed.

For now, here are the main confirmed and expected new features in Ubuntu 22.04.

#### GNOME 42 and the visual changes that come with it

GNOME 42 will be released in March 2022. It will be included in the Ubuntu 22.04.

As always, Ubuntu will be using a customized GNOME version so not all GNOME 42 changes will be reflected here. However, you should still notice some visual changes thanks to the use of new libadwaita and GTK 4 migration.

![GNOME 42 has a revamped screenshot tool | Image Credit][1]

You should see a refreshed settings application and revamped screenshot tool. GNOME 42 will also update a number of GNOME applications like Boxes and introduce a new text editor. However, I think Ubuntu will stick with Gedit as its default text editor.

#### Grub 2.06 and the trouble that comes with it

Ubuntu 22.04 LTS will have [Grub bootloader][2] version 2.06 but there is a problem with it. It has os-prober feature disabled by default.

This means that if you are on a dual boot system, Grub won’t probe for other operating systems and thus it won’t list Windows (or other OS) in Grub. A few people, who upgraded to the development version of Ubuntu 22.04, have already [started facing this issue][3].

It’s not that the problem cannot be fixed. There is a workaround.

Install os-prober (usually installed already) and then edit the /etc/default/grub file to add GRUB_DISABLE_OS_PROBER=false to this file. Save this file, [update grub][4] and Grub should see other operating systems now.

#### New firmware updater app

Ubuntu 22.04 is likely to have a new firmware updater app as [reported by OMG! Ubuntu][5].

Normally, GNOME Software Center is capable of handling firmware updates even with the Snap version in Ubuntu. Still, the development team is working on a dedicated GUI tool to handle firmware update.

![Image Courtesy: OMG! Ubuntu][6]

This new tool is basically a Flutter and Dart based GUI frontend to fwupd, which is a command line tool for getting [firmware from Linux Vendors][7].

#### New installer

![New Ubuntu Installer][8]

The new Flutter based installer has been a work in progress for quite some time now. It was supposed to be shipped with Ubuntu 21.10 but that didn’t happen. There was a separate preview build of Ubuntu 21.10 that featured this new installer, and it is set to become the default installer with Ubuntu 22.04.

The new installer integrates seamlessly with the Ubuntu desktop style, thus giving Ubuntu 22.04 a more modern look and feel right from the beginning.

#### Improved support for Raspberry Pi

Ubuntu started supporting the desktop edition on Raspberry Pi devices with the release of version 20.10. While it could work on the 8 GB version of Raspberry Pi, it struggles on 4 GB and won’t work on 2 GB models.

The performance should improve with Ubuntu 22.04 specially with the [introduction of zswap][9].

#### Other changes

There are a few other changes you should see in terms of software offering. There should be newer versions of most of the prominent softwares. Some of them are:

  * OpenSSL 3.0
  * Ruby 3.0
  * Python 3.10
  * PHP 8.1
  * GCC 11 (expected)



There is no confirmation but it’s more likely that Ubuntu 22.04 will feature Linux kernel 5.17.

As I said earlier, things are in development and I’ll update this article as soon as more new features are revealed.

### Getting Ubuntu 22.04 LTS

**Warning**: Ubuntu 22.04 is still under heavy development. You should not use it on a production machine or on your main system.

If you want to test it on a spare machine or in a virtual machine, you can download the daily build from Ubuntu’s website.

[Download Ubuntu 22.04 Daily Build (Unstable)][10]

If you are using Ubuntu 20.04 LTS or Ubuntu 21.10 on a spare machine, you could force upgrade to the development branch.

### What features you look forward to in Ubuntu 22.04?

Clearly, GNOME 42 will be the biggest highlight of Ubuntu 22.04. What features would you like to see in this new LTS release?

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-22-04-release-features/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/gnome-42-screenshot-tool.png?resize=800%2C600&ssl=1
[2]: https://itsfoss.com/what-is-grub/
[3]: https://itsfoss.community/t/windows-10-boot-option-missing-in-grub-after-upgrading-to-ubuntu-22-04-developer-version/8306/5
[4]: https://itsfoss.com/update-grub/
[5]: https://www.omgubuntu.co.uk/2021/11/ubuntu-is-working-on-a-new-firmware-updater-app
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/gnome-firmware-on-ubuntu.jpg?resize=800%2C436&ssl=1
[7]: https://fwupd.org/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/ubuntu-new-installer.jpeg?resize=720%2C478&ssl=1
[9]: https://www.omgubuntu.co.uk/2022/01/ubuntu-on-raspberry-pi-4-2gb-zswap
[10]: https://cdimage.ubuntu.com/daily-live/current/
