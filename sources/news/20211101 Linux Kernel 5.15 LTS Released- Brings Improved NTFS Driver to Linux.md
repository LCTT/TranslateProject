[#]: subject: "Linux Kernel 5.15 LTS Released! Brings Improved NTFS Driver to Linux"
[#]: via: "https://news.itsfoss.com/linux-kernel-5-15-release/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 5.15 LTS Released! Brings Improved NTFS Driver to Linux
======

On Halloween, Linus Torvalds announced the availability of the next mainline, Linux Kernel 5.15.

While [Linux Kernel 5.14][1] focused on improvements for ARM-based systems, the focus seems to be on some significant changes this time.

Here, I shall highlight the key highlights of this release.

### Linux Kernel 5.15: What’s New?

Fortunately, Linus Torvalds did not delay the kernel release for another week, considering the last recent release candidate versions were almost done to perfection.

In the [announcement][2], he mentioned that the last week before the release involved networking and GPU fixes.

> Anyway, the last week of 5.15 was mainly networking and gpu fixes, with some random sprinkling of other things (a few btrfs reverts, some kvm updates, minor other fixes here and there – a few architecture fixes, couple of tracing, small driver fixes etc). Full shortlog appended.

Overall, the release wasn’t as big, and Linus expects the same for the next merge window:

> This release may have started out with some -Werror pain, but it calmed down fairly quickly and on the whole 5.15 was fair small and calm.
>
> Let’s hope for more of the same – without Werror issues this time – for the upcoming merge window.

### Improved NTFS3 Driver

You no longer need to rely on the FUSE-based open-source NTFS driver. With [Paragon Software][3]‘s NTSF3 kernel driver, you get more features and enhanced performance than the open-source solution.

They have also committed to maintaining it upstream for the near future.

If you want to use NTFS file systems with native-like support for Linux, this kernel release should make that possible.

### Improvements for AMD CPUs/GPUs

After a while, it is good to see the temperature monitoring support added for AMD Zen 3 based APUs.

You will also find a new audio driver for Van Gogh APU, which should benefit Valve’s Steam Deck.

Also, support for more (upcoming) RDNA2 graphics cards seems to have dropped in the AMDGPU kernel driver. So, if you are waiting to get the next-gen AMD graphics card, Linux should be ready for out-of-the-box support with Linux Kernel 5.15.

### Enhanced Support for Intel Alder Lake

Intel Alder Lake (or the 12th gen Intel family of processors) was primarily supported by Linux Kernel 5.14.

However, a few things for the final touch remained (like the support for the Intel TCC driver), which seems to have been added with the Linux Kernel 5.15.

So, you can choose to keep the 12th-gen processor cool while being able to underclock its performance upon reaching a temperature threshold.

### Initial Support for Intel DG2/Alchemist Discrete Graphics and XeHP

Intel’s discrete graphics can be a viable alternative to AMD/NVIDIA GPUs, irrespective of its predicted availability.

So, it is good to see the initial support for it in the latest mainline kernel.

In addition to that, XeHP support was also added considering built for next-gen Intel Xeon processors targeting HPC platforms.

### Improved Apple M1 Support

To support more Linux functionality in Apple’s M1 chip, the IOMMU driver was merged with Linux Kernel 5.15.

In case you didn’t know, it resulted from the “[Asahi Linux][4]” project to enable the use of USB and PCIe, along with the function of running the display driver.

### Other Key Improvements

Several significant optimization and improvements follow along with Linux Kernel 5.15. Here are some of the noteworthy improvements:

  * Optimizations for EXT4 filesystems
  * Support for FUSE to mount an active device
  * Btrfs performance improvements
  * Removal of Canon Lake graphics support



For more information, you can refer to the [official announcement post][2] or the [Linux Kernel archives][5] for all the technical details.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-5-15-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/kernel-5-14-release/
[2]: https://lore.kernel.org/lkml/CAHk-=wjfbfQobW2jygMvgfJXKmzZNB=UTzBrFs2vTEzVpBXA4Q@mail.gmail.com/T/
[3]: https://www.paragon-software.com/
[4]: https://news.itsfoss.com/asahi-linux-announcement/
[5]: https://www.kernel.org/
