[#]: subject: "Linux Kernel 5.17 Released. This is What’s New"
[#]: via: "https://www.debugpoint.com/2022/03/linux-kernel-5-17/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14384-1.html"

Linux 内核 5.17 发布及新变化
======

> Linux 内核 5.17 已经发布，它具有更好的硬件支持和核心模块改进。下面是对新功能的简要介绍，并附有下载和安装细节。

![Linux 内核 5.17 带来了更多的硬件兼容性][1]

Linux Torvalds [宣发了][2] Linux 内核 5.17，这是 2022 年第二个稳定版主线内核。这个版本的内核模块中引入了对新处理器、显卡、存储和其他硬件组件的支持。

比内核 5.16 发布后的时间表稍有延迟，Linux 主线内核 5.17 现在可供下载了。这些更新包括对 AMD Zen 系列设备的温度支持；长期存在的软盘挂起错误，几个 ARM/SoC 支持以及各个子系统的性能改进。

我们已经在第一个候选版本发布时介绍了大部分变化，下面是对 Linux 内核 5.17 新特性的快速回顾。

### Linux 内核 5.17 的新内容

#### 处理器

Linux 内核中的 ARM64 架构现在包括了<ruby>内核并发净化器<rt>Kernel Concurrency Sanitizer</rt></ruby>（KCSAN）。KSCAN 是一个竞争条件检测器，已经支持了其他架构。而现在 ARM64 也在支持名单上了。另外，<ruby>可扩展矩阵扩展<rt>Scalable Matrix Extensions</rt></ruby>（SME）的初始工作有望为矩阵操作提供更好、更快的支持。

AMD [带来了][3] 基于 k10temp 的 CPU 温度监控，用于 AMD Zen 系列第 19 代 CPU 型号。

一组广泛的 Arm/SoC 支持 [进入了][4] Linux 内核 5.17 中。其中主要包括新的 Snapdragon 8 Gen 1 和 X65 平台。其他 SoC 包括恩智浦 i.MX8ULP、德州仪器 J721S2 和瑞萨 R-Car S4-8。

CPU 的重大变化之一是加入了 AMD 的 P-state 驱动，这是与 Valve 为 Steam Deck 合作开发的。这将提供更好的电源效率，因为透过 ACPI <ruby>协作处理器性能控制<rt>Collaborative Processor Performance Controls</rt></ruby>（CPPC）支持，可以更加细化的控制电源。

这个内核中另一个重要的 RISC-V 变化是支持 sv48，提供了 48 位虚拟地址空间。这使得内核可以对高达 128TB 的虚拟地址空间进行寻址。

这个版本带来了很多笔记本电脑、平板电脑的驱动更新。[这里][5] 有一个列表，主要内容是：

- 为华硕 ROG 笔记本电脑增加了自定义风扇曲线支持。
- 增加了对<ruby>通用手写笔计划<rt>Universal Stylus Initiative</rt></ruby>（USI）和 NVIDIA Tegra 平板电脑的支持。
- 对基于 AMD 的笔记本电脑的一些性能改进和修复，涉及到睡眠和声音驱动。

#### 显卡

英特尔的 Alder Lake P 显卡经过前一年的多次迭代，现在已经在主线内核上稳定了。这个内核引入了 [对 Raptor Lake S 显卡的首批支持补丁][6]。

英特尔的 Gen Icelake 显卡家族 [获得了][7] 可变刷新率/自适应同步支持。

一些较新的笔记本电脑带来了内置的隐私屏幕，预计更多的 OEM 厂商会效仿。另外，值得注意的是，GNOME 桌面和其他公司正计划在之后使用这一隐私功能。所以，为了这个以隐私为中心的功能，最初的架构和代码工作都已经包含在这个内核版本中了。

你可以在 [这里][9] 找到一个很好的显卡驱动更新列表。

#### 存储

在内核的每个版本中都会对所有主要的文件系统和存储技术进行增量更新。这个版本也会有一些：

  * 主要的更新包括流行的 EXT4 文件系统使用新的 Linux 挂载 API。
  * 像往常一样，[F2FS][10]、[Btrfs][11] 和 [XFS][12] 的性能得到改善。
  * FS-Cache 和 CacheFiles 模块 [做了][13] 重大重写。

#### 杂项硬件更新

今天谁还在使用软盘？我相信仍然有一些特定的商业用例仍在使用软盘。所以，这就给我们带来了这个特定的补丁，在这个内核版本中。内核中存在一个长期的错误：当系统试图读取一个坏掉的软盘时可能会挂起。所以，这个老毛病终于在这个版本中得到了解决，我希望能让少数仍然使用这种古老存储介质的人为此驻足一下。

其他值得注意的杂项硬件更新包括：

  * 任天堂 GameCube/Wii/Wii U 实时时钟 [驱动][14]。
  * 一个通用的 USB GNSS（<ruby>全球导航卫星系统<rt>Global Navigation Satellite System</rt></ruby>）驱动程序。
  * Cirrus CS35L41 高清音频编解码器 [驱动][15]。
  * 许多英特尔 Wi-Fi 驱动程序 [改进][16]。
  * 英特尔 Alder Lake N [音频][17] 支持。

### 如何下载和安装 Linux 内核 5.17

我们总是建议不要在你的稳定系统中安装最新的主线内核，除非你拥有特定的新硬件或想做实验。对于普通用户来说，最好是通过你的 Linux 发行版（如 Ubuntu、Fedora）的官方部署渠道等待内核的更新。

如果你仍然想安装，请按照下面的说明来安装 Linux 内核 5.17。

访问 [主线内核页面][18]。

有两种类型的构建可供选择：**通用**的和**低延迟**的。对于标准的系统，你可以下载通用的构建，大部分时间都可以工作。对于音频录制和其他需要低延迟的设置，请下载低延迟的。

通过终端下载以下四个通用软件包并安装：

```
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.17/amd64/linux-headers-5.17.0-051700-generic_5.17.0-051700.202203202130_amd64.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.17/amd64/linux-headers-5.17.0-051700_5.17.0-051700.202203202130_all.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.17/amd64/linux-image-unsigned-5.17.0-051700-generic_5.17.0-051700.202203202130_amd64.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.17/amd64/linux-modules-5.17.0-051700-generic_5.17.0-051700.202203202130_amd64.deb
```

安装完毕后，重新启动系统。

低延迟和其他架构（ARM）的安装指令是一样的。替换上述 `wget` 命令中的软件包名称。你可以在主线内核页面找到它们。

对于 Arch Linux 用户来说，预计 Linux 内核 5.17 发布包将在 2022 年 4 月第一周的 Arch .iso 月度刷新中到达。

随着这个版本的发布，合并窗口将为接下来 Linux 内核 5.18 打开。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/03/linux-kernel-5-17/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/03/kernel517-1024x576.png
[2]: https://lkml.org/lkml/2022/3/20/213
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?h=hwmon-next&id=6482dd78c00c6d604ac1c757fb2d8a2be2878654
[4]: https://lore.kernel.org/linux-arm-kernel/CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com/
[5]: https://lore.kernel.org/lkml/aea4c26b-25a1-9480-f780-7eb3502a4ce4@redhat.com/T/#u
[6]: https://lore.kernel.org/dri-devel/87ee6f5h9u.fsf@intel.com/
[7]: https://lists.freedesktop.org/archives/intel-gfx/2021-November/284109.html
[8]: https://www.debugpoint.com/2022/01/linux-kernel-5-17-rc1/
[9]: https://lists.freedesktop.org/archives/dri-devel/2022-January/336492.html
[10]: https://lore.kernel.org/lkml/YedlHVEa4sdbvB2F@google.com/
[11]: https://lore.kernel.org/lkml/cover.1641841093.git.dsterba@suse.com/
[12]: https://lore.kernel.org/lkml/YdyxjTFaLWif6BCM@mit.edu/
[13]: https://lore.kernel.org/lkml/510611.1641942444@warthog.procyon.org.uk/
[14]: https://lore.kernel.org/lkml/Yen7oaDXAbd4tFOD@piout.net/
[15]: https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=7b2f3eb492dac7665c75df067e4d8e4869589f4a
[16]: https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=bc11517bc8219314948780570ec92814d14d6602
[17]: https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=4d5a628d96532607b2e01e507f951ab19a33fc12
[18]: https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.17
[19]: https://t.me/debugpoint
[20]: https://twitter.com/DebugPoint
[21]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[22]: https://facebook.com/DebugPoint
