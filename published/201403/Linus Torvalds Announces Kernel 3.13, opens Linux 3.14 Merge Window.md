Linus Torvalds发布内核3.13，并开放Linux3.14的合并窗口
==============================================================================
Linux内核3.13已经发布了。但是需要注意的是发布的最终版本除了一些小修复和来自rc8的针对ARM，PowerPC，x86,SPARC的结构更新以及对GPU和网卡的驱动更新外，并没有带来什么新的特性。

![](http://www.efytimes.com/admin/useradmin/photo/Z82K112446AM1212014.jpeg)

重要的更新包括：
- nftables —— iptables的继承者
- 针对高性能SSD的块层(block layer)的翻新
- 一个功耗上限(power capping)的框架来限制在Intel RAPL(Running Average Power Limit)设备中的功耗
- 优化的squashfs性能
- 默认开启AMD Radeon的电源管理和AMD Radeon GPU的自动切换
- 优化NUMA和hugepage的性能
- 默认开启TCP Fast Open(TFO)
- 支持NFC支付
- 支持High-availability Seamless Redundancy(HSR)协议
- 新驱动以及各种小改进。

###为高性能SSD储存设计的可伸缩块层(block layer)###

这次更新包括了Linux块层(block layer)的新设计，基于两个阶段的队列：第一层是为了提交IO的每个CPU中的队列，在这之后是在硬件层面的提交队列。实验表明这种双层面队列的设计可以实现每秒数百万的IO交换，压榨出了NVM-Express或PCI-E设备在多核CPU支持下的性能，在压榨性能的同时，这种设计仍能够提供块层的大众接口以及一些方便的特性。

###nftables，iptables的继承者###

有一些新的iptable以及新的iptable工具可以将iptables的规则转换为nftables的字节码，而且添加新的xtable模块也是可能的。当然这些工具还提供了一些不被老的iptables设计所支持的附加的功能：对tables/chains中的改变的提示，更好的递增规则更新支持，还有开启/禁用每个table中的chains这个功能。新的nft工具有优化过的语法。

###Radeon:默认开启的电源管理功能，自动GPU切换，R9 290X Hawaii显卡的支持###

电源管理提供了更优的电源消耗计划，这对一些通过电池提供电能的设备来说十分重要。而且因为电源管理提供了为GPU以及APU超频的自由，这成为了提供高端性能的要求之一。

###限能框架###

本次发布包含了针对Intel RAPL(Running Average Power Limit)设计的框架，这使在支持这个功能的设备上限制功耗成为可能。

###对Intel MIC(Many Integrated Core Architecture)实现支持###

本次更新增加了对Intel MIC的支持，一个多处理器计算机架构，包含了之前的Larrabee多核技术，Teraflops Research Chip多核芯片研究项目还有Intel Single-chip Cloud Computer多核微处理器的成果。

###优化性能的NUMA系统###

本次更新包含了很多策略可以将处理过程移至其占用内存旁，从而加快处理速度，这些新的策略也可以处理同一分页被不同进程占用以及巨大透明内存分页等情况。新的sysctls命令可以实现NUMA功能的开启/禁用以及调节。

###优化在巨大工作量下的内存分页表的伸缩性###

本次更新使用细粒度锁(finer grained locking)来优化在线程化的巨大分页工作中获取分页表的可伸缩性。看推荐的LWN文章来获取更多信息。

###提升Squashfs的性能###

Squashfs，被大量live发行版、安装包以及一些嵌入式Linux发行版采用的只读文件系统，有了一个重要的优化使得它在同步读取的工作中有了巨大的性能提升。

###应用可以限制网络传输层的运算速率###

本次更新加入了新的套接字选项，SO_MAX_PACING_RATE，这可以为应用提供限制传输层运算速率的能力。这项功能被设计为一种bufferbloat机制来避免缓存区域被数据包塞满，它也可以被用来限制应用中的传输率。

###默认开启TCP Fast Open(TFO)###

对建立TCP连接的优化可以消除特定TCP对话的网络传输往返时间，这可以加速wab页面的显示速度。

###NFC支付支持###

本次更新实现了对Secure Element的支持。一个网络连接的API可以实现开启，禁用和搜索NFC连接的安全元件(secure element)。通过一些用户空间的帮助，这可以实现NFC用来现金交易的支付。

###支持High-availability Seamless Redundancy协议###

这个功能对所有需要高可用性以及短反应时间的应用都十分适合。

引用自 [http://kernelnewbies.org/Linux_3.13][1]

------------------------------------------------------------------------------------

via: http://www.efytimes.com/e1/fullnews.asp?edid=127445

译者：[ThomazL](https://github.com/ThomazL) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://kernelnewbies.org/Linux_3.13
