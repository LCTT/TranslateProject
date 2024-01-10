[#]: subject: "Linux Kernel 6.7 Release is Loaded With Fixes and a New Filesystem"
[#]: via: "https://news.itsfoss.com/linux-kernel-6-7-release/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 6.7 Release is Loaded With Fixes and a New Filesystem
======
One of the biggest Linux Kernel releases, packed with fixes and a couple
of new things.
A new year, a new Linux Kernel release!🎉

We start 2024 with the **Linux kernel 6.7 release** that sees the introduction of many improvements, including some that were left out with the previous release.

Linus Torvalds mentions the little delay because of holidays in the [announcement][1]:

> So we had a little bit more going on last week compared to the holiday
>  week before that, but certainly not enough to make me think we'd want
>  to delay this any further.
>
> End result: 6.7 is (in number of commits: over 17k non-merge commits,
>  with 1k+ merges) one of the largest kernel releases we've ever had,
>  but the extra rc8 week was purely due to timing with the holidays, not
>  about any difficulties with the larger release.

**Suggested Read** 📖

![][2]

## 🆕 Linux Kernel 6.7: What's New?

Being **a non-LTS release** , you don't have to upgrade to Linux Kernel 6.7, unless you are chasing the bleeding edge of what Linux has to offer.

So, keeping that in mind, let's take a look at the **key highlights** of this release:

  * **Intel Improvements**
  * **Better RISC-V Support**
  * **AMD-specific Enhancements**
  * **Many Storage Improvements**



### Intel Improvements

![][3]

We start off with Intel's [Meteor Lake][4] processors. **Linux Kernel 6.7 has native support for Intel Meteor Lake Graphics**. Earlier, the support was behind the _experimental_ curtain. But now, you can take advantage of it properly on laptops equipped with first generation [Core Ultra][5] processors.

Initial groundwork was also laid for Intel's upcoming [Arrow Lake][6] and Lunar Lake chips in [Turbostat][7], a CLI utility for monitoring processor frequency, idle statistics, and more.

However, there has been the removal of some support too.

With Linux kernel 6.7, **support for Intel Itanium IA-64 has been dropped**. This was already in the works for quite some time, but now, it is finally done.

### Better RISC-V Support

![][8]

The highlight with RISC-V has been the **introduction of a software shadow call stack** that aims to protect the CPU architecture against accidents and malicious actions.

Additionally, **support for cbo.zero in userspace** , **CBOs in ACPI-based systems** , and many other misc fixes were also made. This [merge][9] has additional information.

You can also read up on what a [Shadow Stack][10] is for learning more about its uses.

### AMD-specific Enhancements

AMD's **seamless boot functionality has been extended to GPUs which support Display Core Next 3.0 and later**. This includes Radeon RDNA2/RDNA3, and any future GPUs.

This feature results in **a smooth transition into the system without the usual flickering of the screen** that follows a power button press. Previously, this support was only enabled for AMD's Van Gogh series of APUs.

Then there's the **implementation of error detection and correction** ([EDAC][11]) for the [Versal][12] line of SoCs that adds an EDAC driver for the RAS features on the integrated Xilinx DDR memory controllers.

You can learn more about its implementation in the [commit][13], and kudos to [Phoronix][14] for spotting that.

![][15]

### Many Storage Improvements

![][16]

We finally see the introduction of the [Bcachefs][17] file system with Linux kernel 6.7. For those who don't know, it is **a copy-on-write (COW) file system** that focuses on reliability and robustness.

Moreover, there are **three new features with Btrfs** , **support for larger page sizes with F2FS** , and even **IBM Journaled File-System (JFS) sees a few improvements**.

### 🛠️ Other Changes & Improvements

We wrap this one up with some other notable changes:

  * Removal of support for the [MIPS AR7][18] platform.
  * Various improvements to **x86 CPU microcode loading**.
  * **MicroLZMA compression** is now considered stable on [EROFS][19].
  * Better support for the **RISC-V powered** [Milk-V Pioneer][20] board.
  * Inclusion of **Nouveau GPU System Processor (GSP)** that paves the way for a better experience on Nvidia's “Turing” and newer GPUs.



For a brief look into the technical changes, refer to the [shortlog][1] or wait for the changelog to be available on [The Kernel Archives][21].

## Installing Linux Kernel 6.7

For those running a rolling-release distro such as Arch or Fedora, you can expect an upgrade soon enough after some testing by the distro devs.

For others, you could either play the waiting game, or **upgrade to the latest mainline Linux kernel on Ubuntu** by following our handy guide:

![][22]

🚧

We do not recommend you to upgrade the Linux kernel manually unless you really need to resolve some issue.

You can source the tarball for the latest Linux kernel release from the [official website][21]. Just keep in mind that it takes some time for the latest release to be available.

[Linux Kernel 6.7][21]

_💬 Are you going to upgrade to Linux Kernel 6.7? What do you think of this release?_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-6-7-release/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://lore.kernel.org/lkml/CAHk-=widprp4XoHUcsDe7e16YZjLYJWra-dK0hE1MnfPMf6C3Q@mail.gmail.com/T/#u
[2]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[3]: https://news.itsfoss.com/content/images/2024/01/linux-kernel-6-7-chip.png
[4]: https://en.wikipedia.org/wiki/Meteor_Lake
[5]: https://www.intel.com/content/www/us/en/products/details/processors/core-ultra.html
[6]: https://en.wikipedia.org/wiki/Arrow_Lake
[7]: https://www.linux.org/docs/man8/turbostat.html
[8]: https://news.itsfoss.com/content/images/2024/01/linux-kernel-6-7-riscv.png
[9]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d46392bbf5c6ce594669f00b8177f0b34e983f90
[10]: https://en.wikipedia.org/wiki/Shadow_stack
[11]: https://en.wikipedia.org/wiki/Error_detection_and_correction
[12]: https://www.xilinx.com/products/silicon-devices/acap/versal.html
[13]: https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git/commit/?h=edac-drivers&id=0fd934580ea3ea91052b999ff75017c3f08b9783
[14]: https://www.phoronix.com/news/AMD-Xilinx-Versal-EDAC-Linux-67
[15]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[16]: https://news.itsfoss.com/content/images/2024/01/linux-kernel-6-7-storage.png
[17]: https://bcachefs.org/
[18]: https://en.wikipedia.org/wiki/Texas_Instruments_AR7
[19]: https://en.wikipedia.org/wiki/EROFS
[20]: https://milkv.io/pioneer
[21]: https://www.kernel.org/
[22]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
