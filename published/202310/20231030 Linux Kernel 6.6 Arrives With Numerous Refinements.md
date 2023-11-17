[#]: subject: "Linux Kernel 6.6 Arrives With Numerous Refinements"
[#]: via: "https://news.itsfoss.com/linux-kernel-6-6-release/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16336-1.html"

Linux 内核 6.6 版本莅临，带来诸多变化
======

![][0]

> 笔记本的支持得到了提升，服务器性能得到了改进，更多内容一一揭晓。

又到了迎接 Linux 内核新版本发布的时刻！

Linux 内核 6.6 的发布，是一次大规模更新，针对各类笔记本、网络硬件、处理器等提供了**大量全方位的改良**。

Linus Torvalds [表示][1]：

> 各种各样的修复散布各处，除了针对 r8152 驱动的一些重要修复外，其它的都相当小型。下面是上周的简短日志，供所有想要一探究竟、了解更多细节的读者。日志篇幅短小，可以快速翻阅。

### 🆕 Linux 内核 6.6：都有哪些新元素？

在我们开始之前，需要提醒大家，这一次发布的是**非长期支持版本**，因此不是每个人都必须进行升级，除非你想要享受最新、最棒的版本。

总的来说，让我们来看看这次发布版本的亮点：

* 针对英特尔芯片的优化
* 对笔记本的更佳支持
* 网络改进
* AMD 芯片性能提升

#### 针对英特尔芯片的优化

![][3]

Linux 内核 6.6 版本新增了对英特尔的**神经处理单元（NPU）**的**支持**，这样的技术原先被称作通用处理器。

这项技术预计将于今年晚些时候，随着英特尔的“[Meteor Lake][4]”芯片亮相而首次公开登场。这些 **NPU 将被专门用于处理人工智能工作负载**。

英特尔甚至已经开始对即将发布的 “**Arrow Lake**”芯片进行**NPU 支持的初步工作**了！

此外，还新增了对英特尔的 [Shadow Stack][5] 的支持，因为他们的 [控制流执行技术][6]（CET）被引入到了内核中。其主要目的是防止现代英特尔 CPU（从 Tiger Lake 起）上的**返回导向编程（ROP）攻击**。

#### 对笔记本的更佳支持

![][8]

**对于惠普笔记本，现在你可以直接在 Linux 中对 BIOS 进行管理了**，这要归功于 “**HP-BIOSCFG**” 驱动的实现。

根据报道，**从 2018 年起出产的惠普笔记本应该都可以支持这个驱动程序**。

**对于联想笔记本，驱动程序已经更新，为更多的 IdeaPad 笔记本**添加了键盘背光控制**。

同样，**对于华硕笔记本**，现在 [ROG Flow X16][9]（2023 年款）游戏笔记本，当屏幕翻转时可以**正确地启用平板模式**。

#### 网络改进

![][10]

在网络方面，Linux 内核 6.6 版本带来了对如 [Atheros QCA8081][11]、**MediaTek MT7988**、**MediaTek MT7981**，[NXP TJA1120 PHY][12] 等新型硬件的**支持**。

同时，各类驱动程序也进行了升级，例如 **高通 Wi-Fi 7 （ath12k）驱动程序**，它现在**支持 Extremely High Throughput（EHT）PHY**。

此外，针对各类 Realtek（rtl8xxxu）Wi-Fi 芯片**启用了 AP 模式**。

关于特定于网络的变动，你可以在这个 [拉取请求][13] 中查阅更多的详细信息。

#### AMD 芯片的性能提升

![][14]

随着 Linux 内核 6.6 的发布，AMD 的开发人员推出了**两项尚未正式公开的新技术的支持**。

一项技术是对他们即将推出的 “**FreeSync Panel Replay**” 技术的支持，这一技术只用于游戏笔记本抖动屏，可以自动降低刷新率以节省电力和降低 GPU 工作负载。

另一项技术被称为 “**动态提速控制**”，这是一项能够**提高某些 Ryzen SoC 性能的功能**，但关于它的更多细节比较少。

关于它的实施，你可以在这个 [补丁序列][15] 中查阅更多的信息。

#### 🛠️ 其他的变化与改进

其他方面，还包括一些值得注意的变动：

* 针对 **龙芯** 的大量新特性。
* **Rust 工具链** 升级至 v1.71.1 版本。
* 对 **RISC-V** 和 **Btrfs** 的多项改进。
* 完全移除了 [无线 USB][16] 和 [**Ultra-Wideband**][17] 的代码。
* 对 **英伟达**、**英特尔** 和 **AMD** 的**开源图形驱动程序** 的众多优化。

你可以在 [更新日志][18] 中查阅更详细的信息。

### 安装 Linux 内核 6.6 版本

如果你的体验是像 Arch 或 Fedora 那类的滚动发行版，升级过程非常简单。

你只需要稍等片刻，因为这些发行版在发布更新时需要一些时间。

对于其他的用户，你可以等待主要版本更新，或者**根据我们的指南在 Ubuntu 中升级至最新的主线 Linux 内核**：

> **[在 Ubuntu 上安装最新的主线 Linux 内核][19]**

你可以在 [官方网站][20] 下载最新的 Linux 内核的 tarball （_发布后可能需要些时间才能得到_）。

💬 你对这次内核发布有何想法？

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-6-6-release/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

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
[19]: https://itsfoss.com/upgrade-linux-kernel-ubuntu/
[20]: https://www.kernel.org/
[0]: https://img.linux.net.cn/data/attachment/album/202310/31/204603jy3e8ezhtyehn9po.jpg