[#]: subject: (Linux Kernel 5.14 RC1 Released with Plethora of ARM Updates)
[#]: via: (https://www.debugpoint.com/2021/07/linux-kernel-5-14-rc1/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Linux Kernel 5.14 RC1 Released with Plethora of ARM Updates
======
Linux Kernel 5.14 RC1 brings a good deal of new hardware support, we
round up the new features in this kernel release in this post.Download
![Linux Kernel 5.14 RC1][1]

The merge window for Linux Kernel 5.14 is closed, and with that we have the [first release candidate][2] of this Kernel available for testing. This release brings usual updates across Processor, Graphics, Ports, Storage. Nothing major or groundbreaking update, however, the ARM SOCs sees the majority of the updated across different hardware.

> On the whole, I don’t think there are any huge surprises in here, and size-wise this seems to be a pretty regular release too. Let’s hope that that translates to a nice and calm release cycle, but you never know. Last release was big, but it was all fairly calm despite that, so size isn’t always the determining factor here..
>
> …
>
> Now, even if you ignore that AMD header drop, drivers account for over two thirds of the changes when you look at the diff, and that’s perfectly normal. What’s slightly less usual is how there’s a lot of line _removals_ in there, with the old IDE layer finally having met
>  its long-overdue demise, and all our IDE support is now based on libata.
>
> Linus in the announcement

Let’s take a look at what’s new.

### Linux Kernel 5.14 RC1

#### Processor and Architecture Updates

Among the [plethora of Arm hardware support][3] changes to find with Linux 5.14 include:

  * [Raspberry Pi 400][4] can now work completely with this Kernel, thanks to the work done for the past couple of months.
  * [Rockchip RK3568 SoC][5] support lands as well. Rockchip RK3568 chip is a high-range general-purpose SoC, made in 22nm process technology, integrated 4-core ARM architecture A55 processor and Mali G52 2EE graphics processor, supporting 4K decoding and 1080P encoding.
  * Qualcomm SA8155p automotive platform support lands. Qualcomm SA8155p SOC provides high-performance automotive infotainment, advanced driver assist platform for developing, testing, optimizing and showcasing next-generation in-vehicle infotainment solutions.
  * Initial support for the Sony Xperia 1/1II and 5/5II. These two models released a while back.
  * The World’s Smallest AI Supercomputer for Embedded and Edge Systems – NVIDIA Tegra Jetson Xavier NX audio support is added.
  * Various updates added for Qualcomm-powered Microsoft Surface Duo with SM8150 SoC.
  * Updates to DIY BananaPi M5 board is added.
  * The VirtIO-IOMMU driver now supported on x86/x86_64 architecture.
  * The RISC-V architecture also gets some [important updates][6] in this release. That includes, KFENCE (Kernel Electric Fence for memory safety error detection/validation), generic resource mapping, and more.



#### Graphics

  * More support for Intel Alder Lake P and Alder Lake M graphics cards.
  * AMD Beige Goby GPU Support is also added. Beige Goby is the new RDNA2 graphics card from AMD.
  * You can now hot-unplug AMD Raedon graphics cards with this Kernel release.



#### Storage

  * Flash-Friendly File-System (F2FS) sees improvements which brings [read-only feature][7].
  * EXT4 file system received an important update. With the [new code][8], a checkpoint can be triggered by a user, which calls ioctl to flush the journal. This can be accessible via user and can be beneficial for handling periodical journal cleanup.



#### Misc Updates

  * A new system call ‘memfd_secret’ is [introduced][9] which provides a ‘secret’ memory area which is only visible to owning processes.
  * Linux 5.14 has re-introduced support for improvements to l[ower the latency of its USB audio driver][10]s. Managing audio via USB port would have lower latency – thanks to the support added. This has been tested with PipeWire, Jack and Pulse audio as well.
  * More supports being added for USB4. We are seeing continuous code addition over a couple of releases for this new specification.



* * *

So, these are some major changes to the Linux Kernel 5.14 RC1. Usual hardware changes across the modules and improvements over prior additions.

this release tarball [here][11]. Or refer below for direct link to tar, diff from the [Kernel 5.13][12].

| | | | | | | | | | | | ------ | ------------ | | ---------------------------------------------------------------------- | | -------------------------------------------------------------- | | ------------------------------------------------------------------- | --------------------------------------------------------- | | | Kernel | **5.14-rc1** | | [[tarball][13]] | | [[patch][14]] | | [[view diff][15]] | [[browse][16]] | |

We are expecting the usual release of multiple iterations until the final release. The final release of Linux Kernel 5.14 is expected by end of August 2021 if all the iterations testing goes smooth.

Linux Distributions wise, [Ubuntu 21.10][17] and Fedora 35 should pick up Linux Kernel 5.14 when releases during Q4 2021.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/linux-kernel-5-14-rc1/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/blog/wp-content/uploads/2021/07/kernel-5-14-rc1-1024x576.jpg
[2]: http://lkml.iu.edu/hypermail/linux/kernel/2107.1/02943.html
[3]: https://lore.kernel.org/lkml/20210709234054.10288-1-olof@lixom.net/
[4]: https://www.raspberrypi.org/products/raspberry-pi-400/
[5]: https://www.96rocks.com/blog/2020/11/28/introduce-rockchip-rk3568/
[6]: https://lore.kernel.org/lkml/mhng-423e8bdb-977e-4b99-a1bb-b8c530664a51@palmerdabbelt-glaptop/
[7]: https://lore.kernel.org/lkml/YOYHejl3CgABOnhP@google.com/
[8]: https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git/commit/?h=dev&id=339183dfb87ce94f8e14a0db48cae093516e194c
[9]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bd9c35060
[10]: http://lkml.iu.edu/hypermail/linux/kernel/2107.1/00919.html
[11]: https://www.kernel.org/
[12]: https://www.debugpoint.com/2021/06/linux-kernel-5-13-release-announcement/
[13]: https://git.kernel.org/torvalds/t/linux-5.14-rc1.tar.gz
[14]: https://git.kernel.org/torvalds/p/v5.14-rc1/v5.13
[15]: https://git.kernel.org/torvalds/ds/v5.14-rc1/v5.13
[16]: https://git.kernel.org/torvalds/h/v5.14-rc1
[17]: https://www.debugpoint.com/2021/07/ubuntu-21-10/
