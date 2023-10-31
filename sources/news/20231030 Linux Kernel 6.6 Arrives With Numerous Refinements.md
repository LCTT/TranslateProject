[#]: subject: "Linux Kernel 6.6 Arrives With Numerous Refinements"
[#]: via: "https://news.itsfoss.com/linux-kernel-6-6-release/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 6.6 Arrives With Numerous Refinements
======
Improved laptop support, server improvements, and more.
It is time for another Linux kernel release!

The Linux kernel 6.6 release is a big one with **plenty of improvements across the board** for various laptops, networking hardware, processors and what not.

Linus Torvalds [mentions][1]:

_There's a random smattering of fixes all over, and apart from some
bigger fixes to the r8152 driver, it's all fairly small. Below is the
shortlog for last week for anybody who really wants to get a flavor of
the details. It's short enough to scroll through._

**Suggested Read** 📖

![][2]

## 🆕 Linux Kernel 6.6: What's New?

Before we begin, just keep in mind that this is **a non-LTS release** , so not everyone is required to upgrade, unless they want the latest and greatest.

Anyway, let's move on to the highlights of this release:

  * **Intel Improvements**
  * **Better Support for Laptops**
  * **Networking Improvements**
  * **AMD Enhancements**



### Intel Improvements

![][3]

Linux kernel 6.6 features **support for Intel's Neural Processing Unit** ( **NPU** ) technology, which was formerly known as the Versatile Processing Unit.

This tech is **set to debut with Intel's “[ **Meteor Lake**][4]” chips** later this year that will see these **NPUs exclusively being used for handling AI workloads**.

Intel has even begun the **initial work for NPU support** on the upcoming “ **Arrow Lake** ” chips with this kernel release!

Then there's the **support for Intel's[ **Shadow Stack**][5]** that came with the inclusion of their [**Control-flow Enforcement Technology**][6] (CET) into the kernel. Its main objective is to **defend against return-oriented programming (ROP) attacks** on modern Intel CPUs from Tiger Lake onwards.

![][7]

### Better Support for Laptops

![][8]

**For HP laptops** , it is now **possible to manage the BIOS from within Linux** , this is thanks to the implementation of the “ **HP-BIOSCFG** ” driver.

According to reports, **HP laptops from 2018 and later should work** with this driver.

**For Lenovo laptops** , the driver was updated to **add support for keyboard backlight control** for more IdeaPad laptops.

Similarly, **for ASUS laptops** , the [ROG Flow X16][9] (2023) gaming laptops can now **properly enable tablet mode** when the lid is flipped over.

### Networking Improvements

![][10]

On the networking side of things, Linux kernel 6.6 features **support for new hardware** such as [**Atheros QCA8081**][11], **MediaTek MT7988** , **MediaTek MT7981** , [**NXP TJA1120 PHY**][12], and more.

Even the **drivers have seen upgrades** , take for instance the **Qualcomm Wi-Fi 7 (ath12k) driver** , which now **supports Extremely High Throughput (EHT) PHY**.

Then there is the **enabling of AP mode for various Realtek (rtl8xxxu) Wi-Fi chips**.

More details on networking-specific changes can be found in the [pull request][13].

### AMD Enhancements

![][14]

With the Linux kernel 6.6 release, AMD developers have pushed **support for two new pieces of technology** that they have yet to officially announce.

One is support for their upcoming “ **FreeSync Panel Replay** ” technology for gaming displays (laptops only) that would automatically decrease the refresh rate to save on power and reduce GPU workload.

The other is called “ **Dynamic boost control** ” that is a **performance** **improving feature for some Ryzen SoCs** , details about it are quite slim.

More on its implementation can be found in the [patch series][15].

### 🛠️ Other Changes & Improvements

As for the rest, here are some other notable changes:

  * Loads of new features for **LoongArch**.
  * The **Rust toolchain** was upgraded to v1.71.1.
  * Various improvements for **RISC-V** and **Btrfs**.
  * Complete removal of [**Wireless USB**][16] and [**Ultra-Wideband**][17] code.
  * Many improvements for **open-source graphics drivers** for **Nvidia** , **Intel** , and **AMD**.



You can go through the [changelog][18] for more details.

## Installing Linux Kernel 6.6

If you are running rolling-release distros such as Arch or Fedora, then it is quite straightforward to upgrade.

You just have to wait a bit, as these distros take their time in releasing the update.

As for the rest, you can either wait for a major release, or **upgrade to the latest mainline Linux kernel in Ubuntu** by following our guide:

![][19]

You can download the tarball for the latest Linux kernel from its [official website][20] ( _it takes time for it to be available after release_ ).

_💬 What do you think of this kernel release?_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-6-6-release/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://lkml.iu.edu/hypermail/linux/kernel/2310.3/06370.html
[2]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[3]: https://news.itsfoss.com/content/images/2023/10/Linux_Kernel_6.6_1.png
[4]: https://www.intel.com/content/www/us/en/content-details/788851/meteor-lake-architecture-overview.html
[5]: https://en.wikipedia.org/wiki/Shadow_stack
[6]: https://www.intel.com/content/www/us/en/developer/articles/technical/technical-look-control-flow-enforcement-technology.html
[7]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[8]: https://news.itsfoss.com/content/images/2023/10/Linux_Kernel_6.6_2-1.png
[9]: https://rog.asus.com/laptops/rog-flow/rog-flow-x16-2023-series/spec/
[10]: https://news.itsfoss.com/content/images/2023/10/Linux_Kernel_6.6_3.png
[11]: https://www.qualcomm.com/products/internet-of-things/networking/wi-fi-networks/qca8081
[12]: https://www.nxp.com/products/interfaces/ethernet-/automotive-ethernet-phys/tja1120-automotive-ethernet-phy-1000base-t1-asil-b-and-tc-10:TJA1120
[13]: https://lore.kernel.org/lkml/20230829125950.39432-1-pabeni@redhat.com/
[14]: https://news.itsfoss.com/content/images/2023/10/Linux_Kernel_6.6_4.png
[15]: https://lore.kernel.org/lkml/20230420163140.14940-1-mario.limonciello@amd.com/T/#m38ab23d70d213ceb67440168b3f71ad2be3aa564
[16]: https://en.wikipedia.org/wiki/Wireless_USB
[17]: https://en.wikipedia.org/wiki/Ultra-wideband
[18]: https://cdn.kernel.org/pub/linux/kernel/v6.x/ChangeLog-6.6
[19]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[20]: https://www.kernel.org/
