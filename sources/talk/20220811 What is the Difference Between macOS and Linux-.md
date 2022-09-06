
macOS 和 Linux 有什么区别？
======

我们经常对比 [Linux 和 Windows 的区别][1]，那 macOS 和 Linux 有什么区别呢？

虽然 Linux 和 Windows 的差异很明显，但是 Linux 和 macOS 却很相似。

二者都可以在命令行中运行 Unix 命令，并且与用户在 Windows 中的体验大相径庭。同时，并不是所有 Windows 上的应用和游戏可以在 macOS 和Linux 上运行。
Both can run Unix commands in the terminal, and the user experience is vastly different from Windows. And not all Windows applications and games are available for macOS and Linux.

这就是为什么一些人认为苹果公司的 macOS 是基于 Linux 的系统。尽管有相似之处，但 macOS 并不是 Linux。

这两个类 Unix 的操作系统有很多不同之处，我将在这篇文章中指出二者的异同之处。

那就让我们来比较一下苹果和橙色企鹅吧。

### macOS vs. Linux：起源

macOS 有一段迷人的历史。它是由史蒂夫·乔布斯的计算机公司 NeXT 所开发的，那时候乔布斯不在苹果公司工作。从技术上讲，它是基于 [Mach 内核][2] 和 Unix 派生的 BSD。

那时候，**NeXT** 开发了 [NeXTSTEP][3] 操作系统来驱动它设计的设备和电脑。尽管有一些人注意到了该操作系统，但是它未获得成功。之后，苹果公司以恢复史蒂夫董事会席位为交易的一部分，收购了 NeXT 公司，使得 NeXTSTEP OS 成为 macOS 的基础。

这就是为什么 macOS 是 Unix 组件和苹果公司独家技术相结合的操作系统。

**相反**，Linux （内核）是自由并开源的 Unix 的替代品。

Linux 不是一个操作系统，它需要一些组件比如 [桌面环境][4] 才能成为一个操作系统。有许多 [基于 Linux 的操作系统][5]，称之为发行版 (distributions) 。

简单起见，我们将这些操作系统成为 **Linux** 操作系统而不是特定的发行版。

### macOS 内核 vs Linux 内核

macOS 内核的官方名称为 XNU。 [首字母缩略词][6] 代表 “XNU 不是 Unix”。根据 [苹果公司的 Github 页面][7]，XNU 是“将卡内基梅隆大学开发的 Mach 内核，与来自 FreeBSD 的组件，和用于编写驱动程序的 C++ API 相结合的一个混合内核”。代码的 BSD 子系统部分是 [“在微内核系统中实现用户空间服务”][8]。 Mach 部分负责底层工作，例如多任务处理、受保护内存、虚拟内存管理、内核调试支持和控制台 I/O。

虽然 macOS 内核结合了微内核 ([Mach][9]) 和单片内核 ([BSD][10]) 的特性，但 Linux 只是一个单片内核。 [单片内核][11] 负责管理 CPU、内存、进程间通信、设备驱动程序、文件系统和系统服务器调用。

### 二者共同之处

macOS 利用 Unix 组件，而 Linux 是作为 Unix 的替代品而构建的。那么，二者有什么共同点？

二者都可以使用 **Unix 命令、bash/zsh、以及其他 shell**。

或许 [默认 shell][12] 会有所不同，但是你可以根据你的喜好进行设置。

除此之外，我想不到二者还有什么相似之处。

大概在十年前，我们可以说 Linux/macOS 都提供了更少的应用程序。

但时过境迁。

多年来，二者的软件生态和游戏支持都在不断发展，我们将在本文后面讨论。

### 代码库：闭源与开源

![open source proprietary illustration][13]

macOS 是一个闭源的操作系统，意味着你无法看到完整的操作系统源码。

当然，可以获得 [部分 macOS （大多为 GNU）库的源码][14]。有用来开发 macOS 和 iOS 操作系统的 [XNU 内核代码][15]。但是 [你不能只用该代码构建 macOS 的克隆版][16]，并安装在任何硬件上。

没有源码的世界不会崩塌，但你会因为苹果公司保护和增强你使用电脑体验的声明和实践，而获得 **更少的透明度**。

一些人认为出于安全的原因而保持闭源。然而，不论开源还是闭源都面临安全威胁。

**二者的不同** 是：相对于员工数量有限的苹果公司来说，由于有很多开发者在开源社区中，所以会很快修复开源软件。

除非你毫无保留的相信苹果，不然 Linux 的开源模式更胜一筹。

### 目的和用途： macOS vs. Linux

macOS 专为台式机和笔记本电脑使用而设计。它非常适合于 **视频编辑、图形设计和音频编辑**。

当谈到 Linux ，你可以做很多事情。你可以将 Linux 用于：

* 客户端
* Toaster (yes! I hope you know about [IoT][17])
* 单片机
* 服务器

当然，在各种平台上使用它的体验并不相同，但 Linux 可以针对各种用例运行。

所以，如果你喜欢 Linux，你可以选择在其他平台上继续使用它，以获得舒适的体验。

### macOS vs Linux: 用户体验

当谈到用户体验，这取决于个人喜好。

macOS 提供了 **令人愉悦的用户界面**。微妙的动画和高分辨率的壁纸、图标，这在视觉上很有吸引力。

![macOS Monterey][18]

You can expect an easy and seamless experience across the platform.

With Linux, you can get an equally pleasing user interface that is easy to use.

![Zorin OS 16 Pro][19]

**Unfortunately**, the user experience slightly varies because of the distribution you decide to install and the desktop environment it comes along with.

You can explore some of the [best desktop environments][20] listed. You can even opt for [macOS-like Linux distributions][21].

For instance, if you are using **Pop!_OS, Ubuntu, Zorin OS, or elementary OS**, you could have an excellent user experience.

![Pop!_OS 22.04 LTS][22]

If you end up using something like MX Linux, or different, the user experience may not be comparable to macOS.

![MX Linux][23]

Overall, the out-of-the-box experience with Linux is inconsistent, but it is capable enough if you know what you are doing.

And if you are coming from Windows, the interface could be confusing initially.

### 可定制性

![customizability][24]

If you want an operating system that lets you tinker with every aspect of it, macOS is not for you.

While Apple’s designs could be aesthetically pleasing by default, not everyone likes them.

If you want to personalize, take control, and heavily customize the operating system’s nuts and bolts, Linux should be the perfect pick.

You can choose to customize the user interface as much as you want, with a wide range of different elements, and go wild with your preferences. To get started, look at our [KDE customization][25] guide to explore the possibilities.

While that is good, it could backfire when customizing things on a Linux system. So, you need to learn/explore what you want to customize.

### 运行硬件要求：macOS vs Linux

![hardware illustration][26]

This is where macOS suffers a solid defeat.

If you want access to macOS and have a good experience with it, you need to purchase Apple hardware, which is costly.

For example, the base configurations for macOS-powered laptops start with **8 GB of RAM** and **256 GB of storage**, available for **$1200** or more.

Unless you want to constantly use the swap space for multitasking and already have a cloud storage space, it would be a terrible idea to get one for yourself.

In contrast, if you would rather not spend a lot but still want a decent configuration for your system (PC/laptop), it is easy to get a device with 16 GB RAM + 512 GB SSD to run Linux for around 800 USD.

**A personal note**: I’m used to 32 Gigs of RAM + 500 GB of SSD storage. To get that kind of multitasking headroom (without using the swap), I will have to pay a premium to Apple.

Some skilled tinkerers try running macOS on non-Apple hardware. Such a system is called [Hackintosh][27] but it is certainly nowhere close to the comfort of running Linux on a regular computer.

### 软件生态

macOS offers a **top-notch native experience** with macOS-exclusive applications or tools made by Apple.

Yes, you may have to purchase those applications. However, unlike some subscription options, you get one-time purchase alternatives with macOS for professional applications.

![Final Cut Pro on macOS][28]

For users who want to design, edit videos, edit photos, and have a creative workflow, macOS’s software suite should be a great choice if you do not mind investing in it.

The free Apple tools like iMovie, Keynote, etc. are good themselves. Couple them with premium tools like Final Cut Pro, Affinity Designer, and more and you get world-class editing experience. Not to forget that creative tools like Adobe are also available on macOS.

Additionally, Apple has strict guidelines for applications available for its platform that enhance the native experience with third-party apps (free or paid).

This is why many designers and editors prefer using macOS over any other operating systems.

For the Linux platform, you have **great FOSS alternatives** to some macOS-only apps. Unless you like or have experience with macOS-specific applications, you should not have trouble with software available for Linux.

![kdenlive editor][29]

The native app experience depends on the Linux distribution you use.

![Planner (To-do list app for Linux)][30]

It may not be as seamless as macOS, but if you are not a professional-grade video/graphics editor, you should not have any issues.

### 在 Linux 和 macOS 上游戏

![gaming illustration][31]

While Apple’s making good progress on making its new M1/M2 chips as capable as possible, macOS currently has poor support for games.

A handful of games work, and most aren’t supported officially. To be honest, investing in a Mac for gaming is not what it is for.

Regarding Linux, numerous AAA games and Indie titles work fine. Sure, there are some hiccups with certain games. But, with Valve’s push towards official game support for Steam Deck, even the latest releases like “**Spider-Man: Remastered**” are Steam Deck verified.

Ultimately, helping improve the game support for the Linux platform.

Additionally, considering that the PC graphics card market is almost back to normal (near or below MSRP), you can get a sweet PC build or laptop without worrying about performance bottlenecks.

Would you spend upwards of **$1800 for a Mac with 16 GB of RAM and 512 GB of SSD** or get a PC/laptop with 32 GB RAM (or more), and at least 1 TB SSD (or more)?

That’s your call.

### 软件包管理

![package manager illustration new][32]

软件包管理器能够让你很快地找到、安装或卸载你的操作系统中的软件。

与现有的任何系统相比，Linux 一直在包管理方面占据优势。

你可以获得 [Flatpak][33]、[Snap][34]、[Synaptic][35] 等开箱即用的选项。

但是，在默认情况下，Mac 用户没有任何可依赖的东西。幸运的是，像 [Homebrew][36] 这样的选项极大的方便了 macOS 用户。

它还支持Linux。因此，你可以在多个设备上使用它来简化操作。

### 系统升级

![software update illustration][37]

苹果公司不会发布其操作系统具体更新的时间。

例如，**macOS Ventura** （在撰写本文时即将进行版本升级）突然放弃了 2017 年之前的所有 Mac 设备。

有趣的是，以前的操作系统版本平均支持大约 **七年**，但随着更新的变化，现在似乎大约是 **五年**。

对于苹果公司设计的芯片，这或许不是一个简单的答案。但是，至少 4 到 5 年的软件支持是安全的。

Linux 为你提供了选择。如果你想要一个没有升级功能，只专注于维护和安全性的稳定操作系统，Linux 发行版的 [LTS 版本][38] 可以免费为你提供 **五年** 的更新。这主要适用于 [Ubuntu][39] 或基于 Ubuntu 的发行版，如 Linux Mint。

此外，有一个 Ubuntu 订阅项目，你可以持续 **十年** 获取安全更新。

而且，它并没有就此结束；你还可以选择 [滚动发行的版本][40]，来获得没有结束的时间的持续的前沿更新。只要你的硬件能够胜任，你应该就能毫无问题地更新操作系统。

### macOS vs. Linux: 你应该选择哪一个？

如果你需要的话，macOS 物有所值。

不建议只需要上网、发送电子邮件，以及执行一些在任何平台上都可以执行的任务的用户购买 macOS。

macOS 仍然是一个不错的选择。

然而，随着 Linux 的改进，它已经成为先前是 Windows/macOS 的用户、计算机专业学生、开发人员、创意专业人士（如我们）以及广泛潜在用户的有用的选择。

选择 Linux 而不是 macOS 的原因有很多，但（我认为）不矛盾。你对 macOS 与 Linux 有何看法？欢迎在下面的评论中分享你的想法。

--------------------------------------------------------------------------------

via: <https://itsfoss.com/mac-linux-difference/>

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/linux-better-than-windows/
[2]: https://en.wikipedia.org/wiki/Mach_(kernel)
[3]: https://en.wikipedia.org/wiki/NeXTSTEP
[4]: https://itsfoss.com/what-is-desktop-environment/
[5]: https://itsfoss.com/what-is-linux/
[6]: https://github.com/apple/darwin-xnu
[7]: https://github.com/apple/darwin-xnu
[8]: http://osxbook.com/book/bonus/ancient/whatismacosx/arch_xnu.html
[9]: <https://en.wikipedia.org/wiki/Mach_(kernel>
[10]: <https://en.wikipedia.org/wiki/FreeBSD>
[11]: <https://www.howtogeek.com/howto/31632/what-is-the-linux-kernel-and-what-does-it-do/>
[12]: <https://linuxhandbook.com/change-shell-linux/>
[13]: <https://itsfoss.com/wp-content/uploads/2022/08/open-source-proprietary-illustration.jpg>
[14]: <https://opensource.apple.com/releases/>
[15]: <https://github.com/apple/darwin-xnu>
[16]: <https://www.techrepublic.com/article/why-apple-open-sourcing-mac-os-x-isnt-terribly-exciting/>
[17]: <https://www.ibm.com/blogs/internet-of-things/what-is-the-iot/>
[18]: <https://itsfoss.com/wp-content/uploads/2022/08/macos-monterey-screenshot.jpg>
[19]: <https://itsfoss.com/wp-content/uploads/2021/12/zorin-os-16-mac.png>
[20]: <https://itsfoss.com/best-linux-desktop-environments/>
[21]: <https://itsfoss.com/macos-like-linux-distros/>
[22]: <https://itsfoss.com/wp-content/uploads/2022/08/pop-os-screenshot-2022.png>
[23]: <https://itsfoss.com/wp-content/uploads/2022/07/10.-MX-Linux.jpg>
[24]: <https://itsfoss.com/wp-content/uploads/2022/08/customizability-illustration.jpg>
[25]: <https://itsfoss.com/kde-customization/>
[26]: <https://itsfoss.com/wp-content/uploads/2022/08/hardware-illustration-800x450.jpg>
[27]: <https://www.freecodecamp.org/news/build-a-hackintosh/>
[28]: <https://itsfoss.com/wp-content/uploads/2022/08/final-cut-pro-mac.jpg>
[29]: <https://itsfoss.com/wp-content/uploads/2022/08/kdenlive-editor.jpg>
[30]: <https://itsfoss.com/wp-content/uploads/2021/08/planner-board-view.png>
[31]: <https://itsfoss.com/wp-content/uploads/2022/08/gaming-illustration.jpg>
[32]: <https://itsfoss.com/wp-content/uploads/2022/08/package-manager-illustration-new.jpg>
[33]: <https://itsfoss.com/what-is-flatpak/>
[34]: <https://itsfoss.com/use-snap-packages-ubuntu-16-04/>
[35]: <https://itsfoss.com/synaptic-package-manager/>
[36]: <https://itsfoss.com/homebrew-linux/>
[37]: <https://itsfoss.com/wp-content/uploads/2022/07/software-update-illustration.jpg>
[38]: <https://itsfoss.com/long-term-support-lts/>
[39]: <https://itsfoss.com/getting-started-with-ubuntu/>
[40]: <https://itsfoss.com/best-rolling-release-distros/>
