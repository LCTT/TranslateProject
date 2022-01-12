[#]: subject: "Linux Kernel 5.16 Release Improves Gaming & Adds Support for New-Gen Hardware"
[#]: via: "https://news.itsfoss.com/linux-kernel-5-16/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 5.16 Release Improves Gaming & Adds Support for New-Gen Hardware
======

Linux Kernel 5.16 is an interesting release for both gamers and desktop users.

The changes introduced aren’t massive, but useful upgrades for users with the latest hardware and looking to get better performance in terms of gaming.

### Linux Kernel 5.16: What’s New?

The support for the latest generation hardware from team red (AMD) and team blue (Intel) are some major additions to this release. You will notice improvements for the CPU and GPU as well.

There are also some improvements for Raspberry Pi 4, and other ARM hardware/processors.

Here are the key highlights of this release:

#### Performance Boost for AMD-Powered Laptops

As per some benchmark tests by [Phoronix][1], Linux Kernel 5.16 seems to give a performance uplift to laptops with Ryzen processors and Radeon graphics.

If you are going the AMD way or already have a laptop with AMD CPU and GPU, you should more out of your laptop!

I suggest you take a look at the benchmarks if you are curious about the exact figures and how it impacts the performance.

#### Sony PlayStation 5 &amp; Nintendo Switch Controller Support

![][2]

PlayStation 5 is undoubtedly one of the best-selling consoles (even if you can’t find one).

Hoping that you got yours, Linux Kernel 5.16 improves the support for PlayStation controller with an update contributed by Sony. In case you’re curious, they added the official driver to the Linux Kernel last year with [Linux 5.12][3], so kudos to them!

In addition to that, the open-source reverse-engineered driver for Switch Pro and Joy-Cons controller is finally joining the mainline with this release.

#### Improvement for Windows Games Running on Linux

If all goes well, Windows games run fine on Linux, however, there are some performance issues lurking. So, to match a specific functionality in Windows, FUTEX2’s **sys_futex_waitv()** system call is being added to Linux Kernel 5.16.

It was being worked on for quite a while since last year. So, it is good to finally see it in the first week of 2022.

Considering it will resemble the behavior of Windows interacting with games, Wine/Proton-powered games should get a performance boost.

Even if it is by a small margin, it brings the Linux gaming experience closer to what you find with Windows, in terms of performance.

#### Raspberry Pi Compute Module 4 Support

A variant of the Raspberry Pi 4 series tailored for industrial and commercial applications is now supported with Linux Kernel 5.16.

![][4]

#### Display Port 2.0 Support

While Display Port 2.0 is not meant for current-gen AMD cards, progress has been made to bring DP 2.0 support in the AMDGPU driver. This way, upcoming Linux Kernel releases should quickly adopt the latest standard if/when RX 7000 series GPU requires DP 2.0.

#### Initial Work for Intel Raptor Lake

Intel Raptor Lake will be the 13th Gen series of processors, due for release later in 2022.

And, Linux Kernel 5.16 marks the early work for the Raptor Lake series, considering there are rumors for it to introduce a 24-core/32 thread variant.

#### Ryzen 6000 Mobile Processor Support

Initial work for AMD’s next-gen Ryzen 6000 mobile series (announced at CES 2022) is taking shape with Linux Kernel 5.16.

#### Apple M1 Improvements &amp; Apple Magic Keyboard

The support for the Apple M1 chip is significantly improving with every kernel release. This time, you get additions for USB, PCIe, and a few minor fixes.

In addition to that, you finally get to see the support for the Apple Magic keyboard in the mainline Linux Kernel.

#### Connectivity Improvements

With Linux Kernel 5.16, there are improvements to support low-latency USB audio.

And, some vital work to support newer Realtek 802.1ax wireless adapters comes baked in with it.

#### Other Improvements

Some other notable additions include:

  * Snapdragon 690 support
  * KVM RISC-V support
  * AMD EPYC CPU KVM improvements
  * Improved support for HP Omen laptops
  * RISC-V kernel build enables open-source NVIDIA driver



You can refer to the [official changelog][5] and [Linus Torvald’s announcement][6] to explore more details.

### How to Install Linux Kernel 5.16?

You should find the newer kernel listed on [Linux Kernel Archives][7]. So, you can download the [tarball][8] to test it out. You can follow our [Linux Kernel upgrade guide][9] for help.

If you want to avoid compiling it yourself, you should wait for a few weeks for distributions to push it to the repositories.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-5-16/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.phoronix.com/scan.php?page=article&item=linux516-amd-apus&num=1
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: https://news.itsfoss.com/linux-kernel-5-12-release/
[4]: https://i2.wp.com/i.ytimg.com/vi/aOH43s9lm7I/hqdefault.jpg?w=780&ssl=1
[5]: https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.16
[6]: http://lkml.iu.edu/hypermail/linux/kernel/2201.1/00613.html
[7]: https://www.kernel.org
[8]: https://git.kernel.org/torvalds/t/linux-5.16.tar.gz
[9]: https://itsfoss.com/upgrade-linux-kernel-ubuntu/
