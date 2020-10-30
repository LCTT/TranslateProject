[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Kernel 5.10 Will be the Next LTS Release and it has Some Exciting Improvements Lined Up)
[#]: via: (https://itsfoss.com/kernel-5-10/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Linux Kernel 5.10 Will be the Next LTS Release and it has Some Exciting Improvements Lined Up
======

_**Development for Linux Kernel 5.10 is in progress. It’s been confirmed to be a long term support release and it will be bringing newer hardware support among other promised features.**_

### Linux Kernel 5.10 will be Long Term Support Release

**Greg Kroah-Hartman**, the key stable kernel maintainer, addressed an “Ask the Expert” session at Linux Foundation’s Open-Source Summit Europe and confirmed that Linux 5.10 will be the next LTS release.

Even though there were some early speculations of 5.9 being the LTS release, Greg clarified that the last kernel release of the year will always be an LTS release.

As of now, [Linux Kernel 5.4][1] series happens to be the latest LTS version out there which added a lot of improvements and hardware support. Also, considering the development progress with Linux [Kernel 5.8][2] being the biggest release so far and Linux 5.10’s first release candidate being close to it, there’s a lot of things going on under the hood.

> Because people keep asking me… <https://t.co/cUcGoXEZtX>
>
> — Greg K-H (@gregkh) [October 26, 2020][3]

Let’s take a look at some of the features and improvements that you can expect with Linux Kernel 5.10.

### Linux kernel 5.10 features

![][4]

**Note:** _Linux Kernel 5.10 is still in early development. So, we will be updating the article regularly for the latest additions/feature updates._

#### AMD Zen 3 Processor Support

The new [Ryzen 5000][5] lineup is one of the biggest buzzes of 2020. So, with Linux Kernel 5.10 release candidate version, various additions are being made for Zen 3 processors.

#### Intel Rocket Lake Support

I do not hope for a lot with Intel’s Rocket Lake chipsets arriving Q1 next year (2021). But, considering that Intel’s constantly squeezing everything out of that 14 nm process, it is definitely a good thing to see work done for Intel Rocket Lake on Linux Kernel 5.10

#### Open Source Driver for Radeon RX 6000 series

Even though we’re covering this a day before the Big Navi reveal, the Radeon RX 6000 series is definitely going to be something impressive to compete with NVIDIA RTX 3000 series.

Of course, unless it suffers from the same issues the Vega series or the 5000 series met with.

It’s good to see work being already done for an open source driver to support the next-gen Radeon GPUs on Linux Kernel 5.10.

#### File System Optimizations and Storage Improvements

[Phoronix][6] reports on file-system optimizations and storage improvements with 5.10 as well. So, judging by that, we should see some performance improvements.

#### Other Improvements

Undoubtedly, you should expect a great deal of driver updates and hardware supports with the new kernel.

For now, the support for SoundBlaster AE-7, early support for NVIDIA Orin (AI processor), and Tiger Lake GPU improvements seem to be the key highlights.

A stable release for Linux Kernel 5.10 should be expected around the mid-December timeline. It will be supported for at least 2 years but you could end up with security/bug fix updates till 2026. So, we will have to stay tuned to the development for anything exciting on the next Linux Kernel 5.10 LTS release.

**Recommended Read:**

![][7]

#### [Explained! Why Your Distribution Still Using an ‘Outdated’ Linux Kernel?][8]

A new stable kernel is released every 2-3 months yet your distribution might still be using an old, outdated Linux kernel. But you don’t need to worry and here’s why!

What do you think about the upcoming Linux Kernel 5.10 release? Let us know your thoughts in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/kernel-5-10/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-kernel-5-4/
[2]: https://itsfoss.com/kernel-5-8-release/
[3]: https://twitter.com/gregkh/status/1320745076566433793?ref_src=twsrc%5Etfw
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/kernel-5-10-release.png?resize=800%2C450&ssl=1
[5]: https://www.tomsguide.com/news/amd-ryzen-5000-revealed-what-it-means-for-pc-gaming
[6]: https://www.phoronix.com/scan.php?page=article&item=linux-510-features&num=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/12/why_Linux_distro_use_outdated_kernel.jpg?fit=800%2C450&ssl=1
[8]: https://itsfoss.com/why-distros-use-old-kernel/
