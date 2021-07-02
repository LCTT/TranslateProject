[#]: subject: (Identify Linux performance bottlenecks using open source tools)
[#]: via: (https://opensource.com/article/21/3/linux-performance-bottlenecks)
[#]: author: (Howard Fosdick https://opensource.com/users/howtech)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13462-1.html)

使用开源工具识别 Linux 的性能瓶颈
======

> 不久前，识别硬件瓶颈还需要深厚的专业知识。今天的开源 GUI 性能监视器使它变得相当简单。

![](https://img.linux.net.cn/data/attachment/album/202106/07/000141z5shv5nzxeln5y5c.jpg)

计算机是一个集成的系统，它的性能取决于最慢的硬件组件。如果一个组件的能力比其他组件差，性能落后而不能跟上，它就会拖累你的整个系统。这就是一个 _性能瓶颈_。消除一个严重的瓶颈可以使你的系统飞起来。

本文解释了如何识别 Linux 系统中的硬件瓶颈。这些技术同时适用于个人的电脑和服务器。我强调的是个人电脑 —— 我不会涉及局域网管理或数据库系统等领域的服务器特定的瓶颈。这些通常涉及专门的工具。

我也不会多谈解决方案。这对本文来说是个太大的话题。相反，我将写一篇关于性能调整的后续文章。

我将只使用开源的图形用户界面（GUI）工具来完成这项工作。大多数关于 Linux 瓶颈的文章都相当复杂。它们使用专门的命令，并深入研究神秘的细节。

开源提供的 GUI 工具使得识别许多瓶颈变得简单。我的目标是给你一个快速、简单的方法，你可以在任何地方使用。

### 从哪里开始

一台计算机由六个关键的硬件资源组成。

  * 处理器
  * 内存
  * 存储器
  * USB 端口
  * 互联网连接
  * 图形处理器

如果任何一个资源表现不佳，就会产生一个性能瓶颈。为了识别瓶颈，你必须监测这六种资源。

开源提供了大量的工具来完成这项工作。我会使用 [GNOME 系统监视器][2]。它的输出很容易理解，而且你可以在大多数软件库中找到它。

启动它并点击“资源”标签。你可以马上发现许多性能问题。

![系统监控-资源面板][3]

*图 1. 系统监控器发现问题。(Howard Fosdick, [CC BY-SA 4.0][4])*

在“资源”面板上显示三个部分：CPU 历史、内存和交换历史，以及网络历史。一眼就能看出你的处理器是否不堪负荷了，还是你的电脑没有内存了，抑或你的网络带宽被用光了。

我将在下面探讨这些问题。现在，当你的电脑速度变慢时，首先检查系统监视器。它可以立即为你提供最常见的性能问题的线索。

现在让我们来探讨一下如何识别特定方面的瓶颈。

### 如何识别处理器的瓶颈

要发现瓶颈，你必须首先知道你有什么硬件。开源为这个目的提供了几个工具。我喜欢 [HardInfo][5]，因为它的屏幕显示很容易阅读，而且广泛流行。

启动 HardInfo。它的“计算机->摘要”面板可以识别你的 CPU 并告诉你它的核心数、线程数和速度。它还能识别你的主板和其他计算机部件。

![HardInfo Summary Panel][6]

*图 2. HardInfo 显示了硬件细节。(Howard Fosdick, [CC BY-SA 4.0][4])*

HardInfo 显示，这台计算机有一个物理 CPU 芯片。该芯片包含两个处理器（或称为核心）。每个核心支持两个线程（或称为逻辑处理器）。这就是总共四个逻辑处理器 —— 正是图 1 中系统监控器的 CPU 历史部分所显示的。

当处理器不能在其时间内对请求做出反应时，就会出现 _处理器瓶颈_，说明它们已经很忙了。

当系统监控器显示逻辑处理器的利用率持续在 80% 或 90% 以上时，你就可以确定这一点。这里有一个例子，四个逻辑处理器中有三个被淹没在 100% 的利用率中。这是一个瓶颈，因为它没有留下多少 CPU 用于其他工作。

![系统监视器的处理器瓶颈][7]

*图 3. 一个处理器的瓶颈。(Howard Fosdick, [CC BY-SA 4.0][4])*

#### 哪个程序导致了这个问题？

你需要找出是哪个程序在消耗所有的 CPU。点击系统监视器的“进程”标签。然后点击“CPU 百分比”标头，根据它们消耗的 CPU 的多少对进程进行排序。你将看到哪些应用程序正在扼杀你的系统。

![系统监控进程面板][8]

*图 4. 识别违规的进程。(Howard Fosdick, [CC BY-SA 4.0][4])*

前三个进程各消耗了 _总 CPU 资源的 24%_。由于有四个逻辑处理器，这意味着每个进程消耗了一整个处理器。这就像图 3 所示。

在“进程”面板上，一个名为“analytical_AI”的程序被确定为罪魁祸首。你可以在面板上右键单击它，以查看其资源消耗的更多细节，包括内存使用、它所打开的文件、其输入/输出细节，等等。

如果你的登录会话有管理员权限，你可以管理这个进程。你可以改变它的优先级，并停止、继续、结束或杀死它。因此，你可以在这里立即解决你的瓶颈问题。

![系统监视器管理一个进程][9]

*图 5. 右键点击一个进程来管理它。(Howard Fosdick, [CC BY-SA 4.0][4])*

如何解决处理瓶颈问题？除了实时管理违规的进程外，你也可以防止瓶颈的发生。例如，你可以用另一个应用程序来代替违规进程，绕过它，改变你使用该应用程序的行为，将该应用程序安排在非工作时间，解决潜在的内存问题，对该应用程序或你的系统软件进行性能调整，或升级你的硬件。这里涉及的内容太多，所以我将在下一篇文章中探讨这些方式。

#### 常见的处理器瓶颈

在用系统监控器监控你的 CPU 时，你会遇到几种常见的瓶颈问题。

有时一个逻辑处理器出现瓶颈，而其他所有的处理器都处于低利用率。这意味着你有一个应用程序，它的代码不够智能，无法利用一个以上的逻辑处理器，而且它已经把正在使用的那个处理器耗尽了。这个应用程序完成的时间将比使用更多的处理器要长。但另一方面，至少它能让你的其他处理器腾出手来做别的工作，而不会接管你的电脑。

你也可能看到一个逻辑处理器永远停留在 100% 的利用率。要么它非常忙，要么是一个进程被挂起了。判断它是否被挂起的方法是，是看该进程是否从不进行任何磁盘活动（正如系统监视器“进程”面板所显示的那样）。

最后，你可能会注意到，当你所有的处理器都陷入瓶颈时，你的内存也被完全利用了。内存不足的情况有时会导致处理器瓶颈。在这种情况下，你要解决的是根本的内存问题，而不是体现出症状的 CPU 问题。

### 如何识别内存瓶颈

鉴于现代 PC 中有大量的内存，内存瓶颈比以前要少得多。然而，如果你运行内存密集型程序，特别是当你的计算机没有很多的随机存取内存（RAM）时，你仍然可能遇到这些问题。

Linux [使用内存][10] 既用于程序，也用于缓存磁盘数据。后者加快了磁盘数据的访问速度。Linux 可以在它需要的任何时候回收这些内存供程序使用。

系统监视器的“资源”面板显示了你的总内存和它被使用的程度。在“进程”面板上，你可以看到单个进程的内存使用情况。

下面是系统监控器“资源”面板中跟踪总内存使用的部分。

![系统监控器的内存瓶颈][11]

*图 6. 一个内存瓶颈。(Howard Fosdick, [CC BY-SA 4.0][4])*

在“内存”的右边，你会注意到 [交换空间][12]。这是 Linux 在内存不足时使用的磁盘空间。它将内存写入磁盘以继续操作，有效地将交换空间作为你的内存的一个较慢的扩展。

你要注意的两个内存性能问题是：

1. 内存被大量使用，而且你看到交换空间的活动频繁或不断增加。
2. 内存和交换空间都被大量使用。

情况一意味着更慢的性能，因为交换空间总是比内存更慢。你是否认为这是一个性能问题，取决于许多因素（例如，你的交换空间有多活跃、它的速度、你的预期，等等）。我的看法是，对于现代个人电脑来说，交换空间任何超过象征性的使用都是不可接受的。

情况二是指内存和交换空间都被大量使用。这是一个 _内存瓶颈_。计算机变得反应迟钝。它甚至可能陷入一种“咆哮”的状态，在这种状态下，除了内存管理之外，它几乎不能完成其他任务。

上面的图 6 显示了一台只有 2GB 内存的旧电脑。当内存使用量超过 80% 时，系统开始向交换空间写入，响应速度下降了。这张截图显示了内存使用量超过了 90%，而且这台电脑已经无法使用。

解决内存问题的最终答案是要么少用内存，要么多买内存。我将在后续文章中讨论解决方案。

### 如何识别存储瓶颈

如今的存储有固态和机械硬盘等多个品种。设备接口包括 PCIe、SATA、雷电和 USB。无论有哪种类型的存储，你都要使用相同的程序来识别磁盘瓶颈。

从系统监视器开始。它的“进程”面板显示各个进程的输入/输出率。因此，你可以快速识别哪些进程做了最多的磁盘 I/O。

但该工具并不显示每个磁盘的总数据传输率。你需要查看特定磁盘上的总负载，以确定该磁盘是否是一个存储瓶颈。

要做到这一点，使用 [atop][13] 命令。它在大多数 Linux 软件库中都有。

只要在命令行提示符下输入 `atop` 即可。下面的输出显示，设备 `sdb` 达到 `busy 101%`。很明显，它已经达到了性能极限，限制了你的系统完成工作的速度。

![atop 磁盘瓶颈][14]

*图 7. atop 命令识别了一个磁盘瓶颈。(Howard Fosdick, [CC BY-SA 4.0][4])*

注意到其中一个 CPU 有 85% 的时间在等待磁盘完成它的工作（`cpu001 w 85%`）。这是典型的存储设备成为瓶颈的情况。事实上，许多人首先看 CPU 的 I/O 等待时间来发现存储瓶颈。

因此，要想轻松识别存储瓶颈，请使用 `atop` 命令。然后使用系统监视器上的“进程”面板来识别导致瓶颈的各个进程。

### 如何识别 USB 端口的瓶颈

有些人整天都在使用他们的 USB 端口。然而，他们从不检查这些端口是否被最佳地使用。无论你是插入外部磁盘、U 盘，还是其他东西，你都要确认你是否从 USB 连接的设备中获得了最大性能。

这个图表显示了原因。潜在的 USB 数据传输率差异 _很大_。

![USB 标准][15]

*图 8. USB 速度变化很大。(Howard Fosdick，根据 [Tripplite][16] 和 [Wikipedia][17] 提供的数字，[CC BY-SA 4.0][4])*

HardInfo 的“USB 设备”标签显示了你的计算机支持的 USB 标准。大多数计算机提供不止一种速度。你怎么知道一个特定端口的速度呢？供应商对它们进行颜色编码，如图表中所示。或者你可以在你的计算机的文档中查找。

要看到你得到的实际速度，可以使用开源的 [GNOME 磁盘][18] 程序进行测试。只要启动 GNOME 磁盘，选择它的“磁盘基准”功能，然后运行一个基准测试。这将告诉你在一个端口插入特定设备时，你将得到的最大实际速度。

你可能会得到不同的端口传输速度，这取决于你将哪个设备插入它。数据速率取决于端口和设备的特定组合。

例如，一个可以以 3.1 速度运行的设备如果使用 2.0 端口就会以 2.0 的速度运行。（而且它不会告诉你它是以较慢的速度运行的！）相反，如果你把一个 USB 2.0 设备插入 3.1 端口，它能工作，但速度是 2.0 的速度。所以要获得快速的 USB，你必须确保端口和设备都支持它。GNOME 磁盘为你提供了验证这一点的方法。

要确定 USB 的处理瓶颈，使用你对固态和硬盘所做的同样程序。运行 `atop` 命令来发现 USB 存储瓶颈。然后，使用系统监视器来获取违规进程的详细信息。

### 如何识别互联网带宽瓶颈

系统监控器的“资源”面板会实时告诉你互联网连接速度（见图 1）。

有 [很好的 Python 工具][19] 可以测试你的最大网速，但你也可以在 [Speedtest][20]、[Fast.com][21] 和 [Speakeasy][22] 等网站进行测试。为了获得最佳结果，关闭所有东西，只运行 _速度测试_；关闭你的虚拟私有网络；在一天中的不同时间运行测试；并比较几个测试网站的结果。

然后将你的结果与你的供应商声称的下载和上传速度进行比较。这样，你就可以确认你得到的是你所付费的速度。

如果你有一个单独的路由器，在有和没有它的情况下进行测试。这可以告诉你，你的路由器是否是一个瓶颈。如果你使用 WiFi，在有 WiFi 和没有 WiFi 的情况下进行测试（通过将你的笔记本电脑直接与调制解调器连接）。我经常看到人们抱怨他们的互联网供应商，而实际上他们只是有一个 WiFi 瓶颈，可以自己解决。

如果某些程序正在消耗你的整个互联网连接，你想知道是哪一个。通过使用 `nethogs` 命令找到它。它在大多数软件库中都有。

有一天，我的系统监视器突然显示我的互联网访问量激增。我只是在命令行中输入了 `nethogs`，它立即确定带宽消耗者是 Clamav 防病毒更新。

![Nethogs][23]

*图 9. Nethogs 识别带宽用户。(Howard Fosdick, [CC BY-SA 4.0][4])*

### 如何识别图形处理瓶颈

如果你把显示器插在台式电脑后面的主板上，你就在使用 _板载显卡_。如果你把它插在后面的卡上，你就有一个专门的图形子系统。大多数人称它为 _视频卡_ 或 _显卡_。对于台式电脑来说，附加显卡通常比主板上的显卡更强大、更昂贵。笔记本电脑总是使用板载显卡。

HardInfo 的“PCI 设备”面板告诉你关于你的图形处理单元（GPU）。它还显示你的专用视频内存的数量（寻找标有“可预取”的内存）。

![视频芯片组信息][24]

*图 10. HardInfo提供图形处理信息。(Howard Fosdick, [CC BY-SA 4.0][4])*

CPU 和 GPU [非常密切地][25] 一起工作。简而言之，CPU 为 GPU 准备渲染的帧，然后 GPU 渲染这些帧。

当你的 CPU 在等待 100% 繁忙的 GPU 时，就会出现 _GPU 瓶颈_。

为了确定这一点，你需要监控 CPU 和 GPU 的利用率。像 [Conky][26] 和 [Glances][27] 这样的开源监控器，如果它们的扩展插件支持你的图形芯片组，就可以做到这一点。

看一下 Conky 的这个例子。你可以看到，这个系统有很多可用的 CPU。GPU 只有 25% 的使用率。想象一下，如果这个 GPU 的数量接近 100%。那么你就会知道 CPU 在等待 GPU，你就会有一个 GPU 的瓶颈。

![Conky CPU 和 GPU 监控][28]

*图 11. Conky 显示 CPU 和 GPU 的利用率。 (图片来源：[AskUbuntu论坛][29])*

在某些系统上，你需要一个供应商专属的工具来监控你的 GPU。它们可以从 GitHub 上下载，并在 [GPU 监控和诊断命令行工具][30] 这篇文章中有所描述。

### 总结

计算机由一系列集成的硬件资源组成。如果它们中的任何一个在工作量上远远落后于其他资源，就会产生性能瓶颈。这可能会拖累你的整个系统。你需要能够识别和纠正瓶颈，以实现最佳性能。

不久前，识别瓶颈需要深厚的专业知识。今天的开源 GUI 性能监控器使它变得相当简单。

在我的下一篇文章中，我将讨论改善你的 Linux 电脑性能的具体方法。同时，请在评论中分享你自己的经验。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/linux-performance-bottlenecks

作者：[Howard Fosdick][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/howtech
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_lightning.png?itok=wRzjWIlm (Lightning in a bottle)
[2]: https://wiki.gnome.org/Apps/SystemMonitor
[3]: https://opensource.com/sites/default/files/uploads/1_system_monitor_resources_panel.jpg (System Monitor - Resources Panel )
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://itsfoss.com/hardinfo/
[6]: https://opensource.com/sites/default/files/uploads/2_hardinfo_summary_panel.jpg (HardInfo Summary Panel)
[7]: https://opensource.com/sites/default/files/uploads/3_system_monitor_100_processor_utilization.jpg (System Monitor processor bottleneck)
[8]: https://opensource.com/sites/default/files/uploads/4_system_monitor_processes_panel.jpg (System Monitor Processes panel)
[9]: https://opensource.com/sites/default/files/uploads/5_system_monitor_manage_a_process.jpg (System Monitor managing a process)
[10]: https://www.networkworld.com/article/3394603/when-to-be-concerned-about-memory-levels-on-linux.html
[11]: https://opensource.com/sites/default/files/uploads/6_system_monitor_out_of_memory.jpg (System Monitor memory bottleneck)
[12]: https://opensource.com/article/18/9/swap-space-linux-systems
[13]: https://opensource.com/life/16/2/open-source-tools-system-monitoring
[14]: https://opensource.com/sites/default/files/uploads/7_atop_storage_bottleneck.jpg (atop disk bottleneck)
[15]: https://opensource.com/sites/default/files/uploads/8_usb_standards_speeds.jpg (USB standards)
[16]: https://www.samsung.com/us/computing/memory-storage/solid-state-drives/
[17]: https://en.wikipedia.org/wiki/USB
[18]: https://wiki.gnome.org/Apps/Disks
[19]: https://opensource.com/article/20/1/internet-speed-tests
[20]: https://www.speedtest.net/
[21]: https://fast.com/
[22]: https://www.speakeasy.net/speedtest/
[23]: https://opensource.com/sites/default/files/uploads/9_nethogs_bandwidth_consumers.jpg (Nethogs)
[24]: https://opensource.com/sites/default/files/uploads/10_hardinfo_video_card_information.jpg (Video Chipset Information)
[25]: https://www.wepc.com/tips/cpu-gpu-bottleneck/
[26]: https://itsfoss.com/conky-gui-ubuntu-1304/
[27]: https://opensource.com/article/19/11/monitoring-linux-glances
[28]: https://opensource.com/sites/default/files/uploads/11_conky_cpu_and_gup_monitoring.jpg (Conky CPU and GPU monitoring)
[29]: https://askubuntu.com/questions/387594/how-to-measure-gpu-usage
[30]: https://www.cyberciti.biz/open-source/command-line-hacks/linux-gpu-monitoring-and-diagnostic-commands/
