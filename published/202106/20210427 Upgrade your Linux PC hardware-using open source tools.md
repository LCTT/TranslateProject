[#]: subject: (Upgrade your Linux PC hardware using open source tools)
[#]: via: (https://opensource.com/article/21/4/upgrade-linux-hardware)
[#]: author: (Howard Fosdick https://opensource.com/users/howtech)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13472-1.html)

使用开源工具升级你的 Linux PC 硬件
======

> 升级你的电脑硬件来提升性能，以获得最大的回报。

![](https://img.linux.net.cn/data/attachment/album/202106/09/204443k8dz09dddhd7xu65.jpg)

在我的文章《[使用开源工具识别 Linux 性能瓶颈][2]》中，我解释了一些使用开源的图形用户界面（GUI）工具监测 Linux 性能的简单方法。我的重点是识别 _性能瓶颈_，即硬件资源达到极限并阻碍你的 PC 性能的情况。

你会如何解决性能瓶颈问题呢？你可以调整应用程序或系统软件。或者你可以运行更高效的应用程序。你甚至可以改变你使用电脑的行为，例如，将后台程序安排在非工作时间。

你也可以通过硬件升级来提高电脑的性能。本文重点介绍可以给你带来最大回报的升级。

开源工具是关键。GUI 工具可以帮助你监控你的系统，预测哪些硬件改进会有效。否则，你可能买了硬件后发现它并没有提高性能。在升级之后，这些工具也有助于验证升级是否产生了你预期的好处。

这篇文章概述了一种简单的 PC 硬件升级的方法，其“秘诀”是开源的 GUI 工具。

### 如何升级内存

几年前，升级内存是不用多想的。增加内存几乎总是能提高性能。

今天，情况不再是这样了。个人电脑配备了更多的内存，而且 Linux 能非常有效地使用它。如果你购买了系统用不完的内存，就浪费了钱。

因此，你要花一些时间来监测你的电脑，看看内存升级是否会有助于提升它的性能。例如，在你进行典型的一天工作时观察内存的使用情况。而且一定要检查在内存密集型工作负载中发生了什么。

各种各样的开源工具可以帮助你进行这种监测，不过我用的是 [GNOME 系统监视器][3]。它在大多数 Linux 软件库中都有。

当你启动系统监视器时，它的“资源”面板会显示这样的输出：

![用 GNOME 系统监控器监控内存][4]

*图 1. 用 GNOME 系统监视器监控内存 (Howard Fosdick, [CC BY-SA 4.0][5])*

屏幕中间显示了内存的使用情况。[交换空间][6] 是 Linux 在内存不足时使用的磁盘空间。Linux 通过使用交换空间作为内存的一个较慢的扩展来有效地增加内存。

由于交换空间比内存慢，如果内存交换活动变得显著，增加内存将改善你的计算机的性能。你会得到多大的改善取决于交换活动的数量和交换空间所在的设备的速度。

如果使用了大量的交换空间，你通过增加内存会得到比只使用了少量交换空间更多的性能改善。

如果交换空间位于慢速的机械硬盘上，你会发现增加内存比将交换空间放在最快的固态硬盘上改善更多。

下面是一个关于何时增加内存的例子。这台电脑在内存利用率达到 80% 后显示交换活动在增加。当内存利用率超过 90% 时，它就变得失去反应了。

![系统监控 - 内存不足的情况][7]

*图 2. 内存升级会有帮助（Howard Fosdick, [CC BY-SA 4.0][5])*

#### 如何进行内存升级

在升级之前，你需要确定你有多少个内存插槽，有多少个是空的，它们需要什么样的内存条，以及你的主板所允许的最大内存。

你可以阅读你的计算机的文档来获得这些答案。或者，你可以直接输入这些 Linux 命令行：

问题 | 命令
---|---
已安装的内存条有什么特点？ | `sudo lshw -short -C memory`
这台计算机允许的最大内存是多少？ | `sudo dmidecode -t memory | grep -i max`
有多少个内存插槽是空的？（没有输出意味着没有可用的） | `sudo lshw -short -C memory | grep -i empty`

与所有的硬件升级一样，事先拔掉计算机的电源插头。在你接触硬件之前，将自己接地 —— 即使是最微小的电涌也会损坏电路。将内存条完全插入主板的插槽中。

升级后，启动系统监视器。运行之前使你的内存超载的相同程序。

系统监控器应该显示出你扩充的内存，而且你应该发现性能更好了。

### 如何升级存储

我们正处在一个存储快速改进的时代。即使是只用了几年的计算机也可以从磁盘升级中受益。但首先，你要确保升级对你的计算机和工作负载是有意义的。

首先，要找出你有什么磁盘。许多开源工具会告诉你。[Hardinfo][8] 或 [GNOME 磁盘][9] 是不错的选择，因为它们都是广泛可用的，而且它们的输出很容易理解。这些应用程序会告诉你磁盘的品牌、型号和其他细节。

接下来，通过基准测试来确定你的磁盘性能。GNOME 磁盘让这一切变得简单。只要启动该工具并点击它的“磁盘基准测试”选项。这会给出你磁盘的读写率和平均磁盘访问时间。

![GNOME 磁盘基准测试][10]

*图 3. GNOME 磁盘基准输出（Howard Fosdick, [CC BY-SA 4.0][5])*

有了这些信息，你可以在 [PassMark Software][11] 和 [UserBenchmark][12] 等基准测试网站上将你的磁盘与其他人进行比较。这些网站提供性能统计、速度排名，甚至价格和性能数字。你可以了解到你的磁盘与可能的替代品相比的情况。

下面是你可以在 UserBenchmark 找到的一些详细磁盘信息的例子。

![UserBenchmark 的磁盘比较][13]

*图 4. 在 [UserBenchmark][14] 进行的磁盘比较*

#### 监测磁盘利用率

就像你对内存所做的那样，实时监控你的磁盘，看看更换磁盘是否会提高性能。[atop 命令行][15] 会告诉你一个磁盘的繁忙程度。

在它下面的输出中，你可以看到设备 `sdb` 是 `busy 101%`。其中一个处理器有 85% 的时间在等待该磁盘进行工作（`cpu001 w 85%`）。

![atop 命令显示磁盘利用率][16]

*图 5. atop 命令显示磁盘利用率（Howard Fosdick, [CC BY-SA 4.0][5]）*

很明显，你可以用一个更快的磁盘来提高性能。

你也会想知道是哪个程序使用了磁盘。只要启动系统监视器并点击其“进程”标签。

现在你知道了你的磁盘有多忙，以及哪些程序在使用它，所以你可以做出一个有根据的判断，是否值得花钱买一个更快的磁盘。

#### 购买磁盘

购买新的内置磁盘时，你会遇到三种主流技术：

  * 机械硬盘（HDD）
  * SATA 接口的固态硬盘（SSD）
  * PCIe 接口的 NVMe 固态磁盘（NVMe SSD）

它们的速度差异是什么？你会在网上看到各种不同的数字。这里有一个典型的例子。

![相对磁盘速度][17]

*图 6. 内部磁盘技术的相对速度（[Unihost][18]）*

  * **红色柱形图：** 机械硬盘提供最便宜的大容量存储。但就性能而言，它们是迄今为止最慢的。
  * **绿色柱形图：** 固态硬盘比机械硬盘快。但如果固态硬盘使用 SATA 接口，就会限制其性能。这是因为 SATA 接口是十多年前为机械硬盘设计的。
  * **蓝色柱形图：** 最快的内置磁盘技术是新的 [PCIe 接口的 NVMe 固态盘][19]。这些可以比 SATA 连接的固态硬盘大约快 5 倍，比机械硬盘快 20 倍。

对于外置 SSD，你会发现 [最新的雷电接口和 USB 接口][20] 是最快的。

#### 如何安装一个内置磁盘

在购买任何磁盘之前，请确认你的计算机支持必要的物理接口。

例如，许多 NVMe 固态硬盘使用流行的新 M.2（2280）外形尺寸。这需要一个量身定做的主板插槽、一个 PCIe 适配器卡，或一个外部 USB 适配器。你的选择可能会影响你的新磁盘的性能。

在安装新磁盘之前，一定要备份你的数据和操作系统。然后把它们复制到新磁盘上。像 Clonezilla、Mondo Rescue 或 GParted 这样的开源 [工具][21] 可以完成这项工作。或者你可以使用 Linux 命令行，如 `dd` 或 `cp`。

请确保在最有影响的情况下使用你的快速新磁盘。把它用作启动盘、存储操作系统和应用程序、交换空间，以及最常处理的数据。

升级之后，运行 GNOME 磁盘来测试你的新磁盘。这可以帮助你验证你是否得到了预期的性能提升。你可以用 `atop` 命令来验证实时运行。

### 如何升级 USB 端口

与磁盘存储一样，USB 的性能在过去几年中也有了长足的进步。许多只用了几年的计算机只需增加一个廉价的 USB 端口卡就能获得很大的性能提升。

这种升级是否值得，取决于你使用端口的频率。很少使用它们，如果它们很慢也没有关系。经常使用它们，升级可能真的会影响你的工作。

下面是不同端口标准的最大 USB 数据速率的巨大差异。 

![USB 速度][22]

*图 7. USB 速度差别很大（Howard Fosdick，[CC BY-SA 4.0][5]，基于 [Tripplite][23] 和 [维基][24] 的数据*

要查看你得到的实际 USB 速度，请启动 GNOME 磁盘。GNOME 磁盘可以对 USB 连接的设备进行基准测试，就像对内部磁盘一样。选择其“磁盘基准测试”选项。

你插入的设备和 USB 端口共同决定了你将得到的速度。如果端口和设备不匹配，你将体验到两者中较慢的速度。

例如，将一个支持 USB 3.1 速度的设备连接到一个 2.0 端口，你将得到 2.0 的数据速率。你的系统不会告诉你这一点，除非你用 GNOME 磁盘这样的工具来检查）。反之，将 2.0 设备连接到 3.1 端口，你也会得到 2.0 的速度。因此，为了获得最好的结果，总是要匹配你的端口和设备的速度。

要实时监控 USB 连接的设备，请使用 `atop` 命令和系统监控器，就像你监控内部磁盘一样。这可以帮助你看到是否碰到了当前设置的限制，并可以通过升级而受益。

升级你的端口很容易。只要购买一个适合你的空闲的 PCIe 插槽的  USB 卡。

USB 3.0 卡的价格只有 25 美元左右。较新、较贵的卡提供 USB 3.1 和 3.2 端口。几乎所有的 USB 卡都是即插即用的，所以 Linux 会自动识别它们。但在购买前一定要核实。

请确保在升级后运行 GNOME 磁盘以验证新的速度。

### 如何升级你的互联网连接

升级你的互联网带宽很容易。只要给你的 ISP 写一张支票即可。

问题是，应该升级吗？

系统监控器显示了你的带宽使用情况（见图 1）。如果你经常遇到你从 ISP 购买的带宽限额，你会从购买更高的限额中受益。

但首先，要确认你是否有一个可以自己解决的问题。我见过很多案例，有人认为他们需要从 ISP 那里购买更多的带宽，而实际上他们只是有一个可以自己解决的连接问题。

首先在 [Speedtest][25] 或 [Fast.com][26] 等网站测试你的最大网速。为了获得准确的结果，关闭所有程序，只运行速度测试；关闭你的虚拟私有网络；在一天中的不同时间运行测试；并比较几个测试网站的结果。如果你使用 WiFi，在有 WiFi 和没有 WiFi 的情况下进行测试（将你的笔记本电脑直接与调制解调器连接）。

如果你有一个单独的路由器，在有它和没有它的情况下进行测试。这将告诉你路由器是否是瓶颈。有时，只是重新定位你家里的路由器或更新其固件就能提高连接速度。

这些测试将验证你是否得到了你从 ISP 购买的带宽速度。它们也会暴露出任何你可以自己解决的本地 WiFi 或路由器问题。

只有在你做了这些测试之后，你才应该得出结论，你需要购买更多的网络带宽。

### 你应该升级你的 CPU 还是 GPU？

升级你的 CPU（中央处理单元）或 GPU（图形处理单元）呢？

笔记本电脑用户通常不能升级这两个单元，因为它们被焊接在主板上。

大多数台式机主板支持一系列的 CPU，并且是可以升级的 —— 假设你还没有使用该系列中最顶级的处理器。

使用系统监视器观察你的 CPU，并确定升级是否有帮助。它的“资源”面板将显示你的 CPU 负载。如果你的所有逻辑处理器始终保持在 80% 或 90% 以上，你可以从更多的 CPU 功率中受益。

这是一个升级 CPU 的有趣项目。只要小心谨慎，任何人都可以做到这一点。

不幸的是，这几乎没有成本效益。大多数卖家对单个 CPU 芯片收取溢价，比他们卖给你的新系统要高。因此，对许多人来说，升级 CPU 并不具有经济意义。

如果你将显示器直接插入台式机的主板，你可能会通过升级图形处理器而受益。只需添加一块显卡。

诀窍是在新显卡和你的 CPU 之间实现平衡的工作负荷。这个 [在线工具][27] 能准确识别哪些显卡能与你的 CPU 最好地配合。[这篇文章][28] 详细解释了如何去升级你的图形处理。

### 在升级前收集数据

个人电脑用户有时会根据直觉来升级他们的 Linux 硬件。一个更好的方法是先监控性能并收集一些数据。开源的 GUI 工具使之变得简单。它们有助于预测硬件升级是否值得你花时间和金钱。然后，在你升级之后，你可以用它们来验证你的改变是否达到了预期效果。

这些是最常见的硬件升级。只要稍加努力并使用正确的开源工具，任何 Linux 用户都可以经济有效地升级一台 PC。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/upgrade-linux-hardware

作者：[Howard Fosdick][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/howtech
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://linux.cn/article-13462-1.html
[3]: https://vitux.com/how-to-install-and-use-task-manager-system-monitor-in-ubuntu/
[4]: https://opensource.com/sites/default/files/uploads/system_monitor_-_resources_panel_0.jpg (Monitoring memory with GNOME System Monitor)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/article/18/9/swap-space-linux-systems
[7]: https://opensource.com/sites/default/files/uploads/system_monitor_-_out_of_memory_0.jpg (System Monitor - Out Of Memory Condition)
[8]: https://itsfoss.com/hardinfo/
[9]: https://en.wikipedia.org/wiki/GNOME_Disks
[10]: https://opensource.com/sites/default/files/uploads/gnome_disks_-_benchmark_0.jpg (GNOME Disks benchmark)
[11]: https://www.harddrivebenchmark.net/
[12]: https://www.userbenchmark.com/
[13]: https://opensource.com/sites/default/files/uploads/userbenchmark_disk_comparisons_0.jpg (Disk comparisons at UserBenchmark)
[14]: https://ssd.userbenchmark.com/
[15]: https://opensource.com/life/16/2/open-source-tools-system-monitoring
[16]: https://opensource.com/sites/default/files/uploads/atop_-_storage_bottleneck_0.jpg (atop command shows disk utilization)
[17]: https://opensource.com/sites/default/files/uploads/hdd_vs_ssd_vs_nvme_speeds_0.jpg (Relative disk speeds)
[18]: https://unihost.com/help/nvme-vs-ssd-vs-hdd-overview-and-comparison/
[19]: https://www.trentonsystems.com/blog/pcie-gen4-vs-gen3-slots-speeds
[20]: https://www.howtogeek.com/449991/thunderbolt-3-vs.-usb-c-whats-the-difference/
[21]: https://www.linuxlinks.com/diskcloning/
[22]: https://opensource.com/sites/default/files/uploads/usb_standards_-_speeds_0.jpg (USB speeds)
[23]: https://www.tripplite.com/products/usb-connectivity-types-standards
[24]: https://en.wikipedia.org/wiki/USB
[25]: https://www.speedtest.net/
[26]: https://fast.com/
[27]: https://www.gpucheck.com/gpu-benchmark-comparison
[28]: https://helpdeskgeek.com/how-to/see-how-much-your-cpu-bottlenecks-your-gpu-before-you-buy-it/
