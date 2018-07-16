Linux 内核事件回顾－2014年1月及2月
================================================================================
过去两个月来，我一直在本文中更新报道Linux项目的进展情况。请原谅我最近在埋头于一些开发工作。闲话少说，让我们赶紧把落下的功课补上。

###主线发布（Linus的分支）的相关新闻###

2014年1月19日，Linux3.13发布。详见[Linux3.13是什么][1]。2014年3月2日，3.14-rc5发布。根据rc版本发布的进程来看，2014年3月底前Linux3.14应该就能正式发布。git中3.14-rc1已经PR（pull requests）的一些摘要更新如下：

### 来自Len Brown的turbostat更新： ###

> 一个新的命令行选项 -s，用来dump计数器
> 
> 加强对Haswell Xeon [HSX]的支持。HSX在支持RAPL上与HSW客户端稍有不同，HSX的上一个版本并不支持turbostat。

### 来自Olof Johansson的针对ARM SoC的修复： ###

> 在defconfig中针对相应的平台设备增加了新的驱动
> 
> 增加多平台覆盖率，修改一些DTS，统一相关设备及其衍生产品的驱动支持

### 来自Catalin Marinasd的ARM64位补丁：###

> 支持用PTE_WRITE位来区分某个页面是干净可写的，还是真正的只读页面。

### 来自Rafael Wysocki的ACPI及电源管理更新：###

> 修改ACPI核心，即不论当前设备的状态如何，在扫描命名空间的同时，为ACPI表中列出的每一个设备创建一个acpi_device结构对象。这一改动可以在ACPI表失效前，有效防止ACPI热插拔操作时错误地删除某些对象。
> 
> Todd E Brandt提供了一个用于挂起/恢复性能优化的新工具
> 
> 修改初始化代码，将ACPI的初始化提前，这样内核就能在计时器初始化的时候继续使用ACPI，同时有可能简化EFI的初始化。 —— 来自李春义（音Chun-Yi Lee）
> 
> apm-仿真：添加APM休眠事件使其支持suspend2disk —— 用于改进使用休眠技术实现快速启动的嵌入式系统。通过此改动，APM事件通知软件组件，准备休眠以及状态恢复。捕捉apm状态可以有效帮助实现快速启动，同时保持系统状态，用于休眠和恢复。这一改动使apm支持“挂起到磁盘”。

### 来自张瑞（音Zhang Rui）的热量管理更新：###

> 实时显示设备树的基础设施硬件的热性能。该工作包含了设备树介绍，描述硬件热行为及其限制，读取分析热数据，并建立热区间及其热参数。另外针对三家设备（TI SoC和hwmon的两台设备）的传感器设备使用新的表述方式进行API初始验证。这是完成验证工作的第一步，即使设备转为使用相应的API并进行验证。

### Links to 3.14-rcs ###

- [Linux 3.14-rc1 is out][2]
- [Linux 3.14-rc2][3]
- [Linux 3.14-rc3][4]
- [Linux 3.14-rc4][5]
- [Linux 3.14-rc5][6]

### 稳定分支发布的相关新闻 ###

Jiri Slaby正在接管3.12稳定分支的长期维护工作。Greg KH将继续负责kernel.org的发布。Jiri Slaby负责补丁汇总，发布候选声明。详见[3.12-稳定版内核分支由Jiri Slaby接管][7]。最新的稳定分支发布如下：

### 最新稳定版及扩展版发布 ###

#### Release	Version	Projected EOL ####
	Stable 3.13	3.13.6	Not announced
	Stable 3.12	3.12.14	Not announced
	Stable 3.11	3.11.10	EOL November 29 2013
	Longterm 3.10	3.10.33	September 2015
	Longterm 3.4	3.4.82	October 2014
	Longterm 3.2	3.2.55	2016
	Longterm 3.0	3.0.101	EOL October 22 2013
	Longterm 2.6.34	2.6.34.15 	EOL February 10 2014
	Longterm 2.6.32	2.6.32.61 	mid-2014
	Extended stable 3.11.y.z	3.11.10.6	[Extended Stable][8]
	Extended stable 3.8.y.z	3.8.13.19	[Extended Stable][9]
	Extended stable 3.5.y.z	3.5.7.31	[Extended Stable][10]

如果你还想知道这些稳定版的发布是如何管理的，或者新版多久发布一次，详见[Active kernel releases][11]。

### Linux RT ###

Linux RT的稳定版发布多的不胜枚举。请移步linux-stable-rt.git查看最新版本。

### 哪里能找到Linux发布的所有git树？ ###

#### Linux Release	Git ####

Mainline	git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
Stable releases (all)	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
Linux RT releases	git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git
Extended stable releases	git://kernel.ubuntu.com/ubuntu/linux.git
Bleeding edge linux-next	git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

### 思考写在最后 ###

3.13中的“TCP快速启动”从某些类型的TCP会话中去除了一轮时间轮询，从而大大提升了TCP连接的建立速度，web网页的加载速度也得以改进。

针对ARM的相关修改是3.14-rc1中的重要更新。许多新设备现在都支持或增加了多平台设备的覆盖率，对DTS的一些修改统一了相关设备及其衍生产品的驱动支持。相对于以前的设备树需要平台间的迁移，多平台配置配合DTS改进现在仅需一个通用设备驱动。这对于ARM的拓展是件好事，它开始能够支持PCI设备了。

改进嵌入式设备的休眠功能，进而用于快速启动，这对手机和嵌入式设备是个利好。谁愿意自己的手机休眠的时候总出意外？

Linux3.14-rc5的声明中，Linus Torvalds说道“下一周，下一个rc。一切都很平静，一切都很正常。”基于此，如果没有特殊情况，Linux3.14将在两到三周内发布。与往常一样，紧接着下一个合并窗口也就是3.15-rc1即将打开。

如果有人想知道Jiri Slaby接管3.12的长期维护后有哪些改变，请放心，一切如常。Jiri Slaby将搜集补丁，发布候补。我志愿测试3.12的候补发布，Guenter Roeck志愿在3.12的补丁队列上运行他的build测试。Greg KH将负责kernel.org的最终发布。

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/linux-kernel-news-january-and-february-2014

译者：[Mr小眼儿](http://blog.csdn.net/tinyeyeser) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://kernelnewbies.org/LinuxChanges
[2]:https://lkml.org/lkml/2014/2/2/176
[3]:https://lkml.org/lkml/2014/2/9/372
[4]:https://lkml.org/lkml/2014/2/16/120
[5]:https://lkml.org/lkml/2014/2/23/234
[6]:https://lkml.org/lkml/2014/3/2/257
[7]:https://lkml.org/lkml/2014/2/26/596
[8]:https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable
[9]:https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable
[10]:https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable
[11]:https://www.kernel.org/category/releases.html
