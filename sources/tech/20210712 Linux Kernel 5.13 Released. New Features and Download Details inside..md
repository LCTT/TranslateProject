[#]: subject: (Linux Kernel 5.13 Released. New Features and Download Details inside.)
[#]: via: (https://www.debugpoint.com/2021/06/linux-kernel-5-13-release-announcement/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Linux Kernel 5.13 Released. New Features and Download Details inside.
======
Linux Torvalds announced the release of Linux Kernel 5.13. Here’s a
recap of the new features and we give you the details on downloading
this Kernel.generic
Linux Kernel 5.13 brings some important changes and support across Processor, File systems, Network, Graphics, and other general hardware Area.

The most important inclusion is the initial support for the Apple M1 silicon devices which lands in this release. Although this is very early-stage work for Apple Silicon devices and expected more support coming up in future Kernel releases.

Apart from that, the release mostly consists of driver release changes and usual code clean-ups, and more.

> if the last week was small and calm, 5.13 overall is actually fairly large. In fact, it’s one of the bigger 5.x releases, with over 16k commits (over 17k if you count merges), from over 2k developers. But it’s a “big all over” kind of thing, not something particular that stands out as particularly unusual. Some of the extra size might just be because 5.12 had that extra rc week.
>
> And with 5.13 out the door, that obviously means that the merge window for 5.14 will be starting tomorrow. I already have a few pull requests for it pending, but as usual, I’d ask people to give the final 5.13 at least a quick test before moving on to the exciting new pending
>  stuff
>
> Linus

Let’s take a look at what’s new.

![Linux Kernel 5.13][1]

### Linux Kernel 5.13 – What’s New

### Processor

  * [Apple M][2]1 with Apple Silicon Devices support is [introduced][3] in this Kernel. This is the very early stage of the support and much work to be done in the coming weeks. Hence we would be seeing more updates on this SoC is coming Kernel releases.
  * AMD Energy driver is [removed][4] from the Linux kernel due to disagreement on the implementation between AMD and the HWMON module maintainer.
  * A new driver is [introduced][5] for Intel mobile/desktop CPUs which enables cooling by downclocking the CPU at a lower threshold than the default value.
  * Intel Alder Lake, AMD Zen 3 CPUs sees [improvements][6] in performance tracking and monitoring areas.
  * MIPS-based open-source processor Loongson 2K1000 supports lands in this Kernel.
  * Microsoft adds patches to allow Linux to be run in a 64 bit ARM Hyper-V guest. This change is significant in contracts to Apple’s M1 ARM support in the same Kernel.
  * AMD Green Sardine APU supports added to the AMD Crypto Co-processor Driver which helps to offload the encryption work to the Co-processor in the Sardine APU line up.



### Graphics

  * Intel Alder Lake S support is added in this Kernel.
  * More advancement is added for the Intel Discrete Graphics drive enabling the use of local memory for internal memory allocations.
  * Many fixes and performance improvements for AMDGPU drivers.
  * Generic USB Display Driver “[GUD][7]” support is added in this Kernel opening up various avenues to connect displays such as USB to HDMI/SDTV, etc.



### Storage, File Systems

  * In the past couple of Kernel releases, we saw Btrfs support is being added incrementally. And this release also [includes][8] more work on the Btrfs zoned mode support.
  * Flash-Friendly File-System (F2FS) [sees][9] improvements in mount options and fixes.
  * The Flash file system for unmanaged flash memory devices UBIFS introduces Zstd compression by default.
  * Cluster computing file system OrangeFS sees performance [improvements][10] in this Kernel release. The performance is expected to speed up by 17x with the new code.



### Other Major Additions

  * Realtek Ethernet controller chips RTL8156 2.5G and RTL8153 support are added.
  * Amazon Luna Game controller support and Microsoft Azure MANA network adapter support are added.
  * Realtek sound amplifiers RT1019, RT1316, RT711, and RT715 support are added.
  * More updates to USB and Thunderbolt ports.
  * Apple Magic Mouse 2 and new MS Surface device support are added.



### Linux Kernel 5.13 Download

#### How to Install in Ubuntu

You can install the mainline kernel packages from the below link right now in your latest Ubuntu or Ubuntu-based Linux distributions. But it is not recommended to install this as it might break the current Ubuntu Linux system whichever you are running (e.g Ubuntu 20.04 LTS). If you are running Debian, Ubuntu, and other stable releases – do not upgrade using the below steps. Instead, wait for an official update in respective distributions.

For general users, unless you are keen to experiment with the latest hardware whose support is added in this release, you should not update at the moment.

If you still want to install the latest Linux Kernel 5.13, follow the below instructions to install in Ubuntu-based systems.

Visit the [mainline kernel page][11].

There are two types of builds available – and **lowlatency**. For common systems, you can download generic builds that work most of the time. For audio recordings and other setups that require low latency, download the lowlatency one.

Download below four packages for generic via terminal and install.

```
cd /tmp
```

```
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.13/amd64/linux-headers-5.13.0-051300-generic_5.13.0-051300.202106272333_amd64.deb
```

```
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.13/amd64/linux-headers-5.13.0-051300_5.13.0-051300.202106272333_all.deb
```

```
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.13/amd64/linux-image-unsigned-5.13.0-051300-generic_5.13.0-051300.202106272333_amd64.deb
```

```
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.13/amd64/linux-modules-5.13.0-051300-generic_5.13.0-051300.202106272333_amd64.deb
```

```
sudo dpkg -i *.deb
```

After installation, reboot the system.

The instruction for lowlatency and other architecture (ARM) installations are the same. Replace the package name in the above wget command. You can find them on the [mainline kernel page][11].

If you are using Arch Linux, or Arch-based distribution, it is expected that Linux Kernel 5.13 release packages arrive within the July 2021 first week during monthly Arch .iso refresh.

Linux Kernel 5.13 would be available in the next installment of Ubuntu and Fedora Linux by end of this year.

Linux Kernel 5.14 development and merge window kicks off with this stable release.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/06/linux-kernel-5-13-release-announcement/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/l513head-1024x576.jpg
[2]: https://www.debugpoint.com/2020/12/apple-m1-mac-linux-announcement/
[3]: http://lkml.iu.edu/hypermail/linux/kernel/2104.3/01764.html
[4]: http://lkml.iu.edu/hypermail/linux/kernel/2104.3/01630.html
[5]: https://lore.kernel.org/lkml/aaa1d843-a8fc-ed31-495d-45080a944558@linaro.org/T/#u
[6]: http://lkml.iu.edu/hypermail/linux/kernel/2104.3/05305.html
[7]: https://github.com/notro/gud/wiki
[8]: http://lkml.iu.edu/hypermail/linux/kernel/2104.3/01780.html
[9]: https://lore.kernel.org/lkml/YJCGSeyA7XoNcyZT@google.com/
[10]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9ccce092fc64d19504fa54de4fd659e279cc92e7
[11]: https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.13
