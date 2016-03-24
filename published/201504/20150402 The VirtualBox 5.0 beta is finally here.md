VirturalBox 终于进入到 5.0 世代
=======================================

**本月初，甲骨文公司的桌面虚拟化软件获得了近五年来的第一次重大改版，但是更像是改进而不是革命性的的变化。**

VirtualBox，由Sun公司创建，现在由甲骨文管理的开源虚拟化系统，获得了近5年来第一次的主版本更新发布。

从发行说明和测试版本身的表现来看，别期望任何真正革命性的改变。在此版本中，VirtualBox在视觉上和技术上都做了一些改进，但和VMware相比，它的主要优势仍然是相同核心功能的开源实现。

VirtualBox 4.0的最后一个主要版本在2010年12月发布，它采用了新的图形化用户界面，新的虚拟化硬件和重组的项目设计，进行了重大的改版。但项目主要版本的发布步伐缓慢，上一次重要版本(版本4.3)在2013年底才发布。从那时起，一切都被正式称为“维护”发布。

![](http://images.techhive.com/images/article/2015/04/vbox-5-100576781-large.idge.png)

*VirtualBox 5.0的第一个测试版增加了编辑菜单，VM窗口的快捷方式图标等功能，如下面所示。*

VirtualBox 5.0最大的变化是增加了对硬件辅助虚拟化指令集扩展的支持。AES-NI指令集通常用于加密时的硬件加速，SSE 4.1和SSE 4.2指令集都包括在其中。另外一点是支持Windows和Linux客户机的半虚拟化，一个抽象主机音响设备的新的架构以及支持客户机中的USB 3（xHCI）控制器。

大部分可用性更新都是对 VirtualBox 图形化用户界面的改进。一个大的变化就是支持给单个虚拟主机自定义菜单和工具栏，这样很少或者从不使用的选项就可以彻底删除。另外重要的一点是可以在VirtualBox接口内部对虚拟磁盘进行加密，而不依赖于客户机操作系统自身的磁盘加密功能(假设有的话)。

甲骨文公司提醒由于这是个测试版软件，需要谨慎对待。当然，主界面和客户机系统界面的某个角落打着红黑相间的测试警告标志。但之前VirtualBox发行版(4.3.26)上创建的Windows 10虚拟机启动和运行都没问题，5.0版本中添加的VirtualBox客户机功能--更好的视频支持，双向复制和粘贴，以及其它功能--在安装的时候也没有问题。(从4.3.18版本就改进了对 Windows 10的支持)。

虽然没有明确指出5.0的最终版什么时候会发布，但是甲骨文公司[建议用户][1]在非生产环境中下载和使用测试版，并在[测试版反馈论坛][2]中提交bug报告。

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/2905098/virtualization/oracle-virtualbox-5-0-beta-is-finally-here.html

作者：[Serdar Yegulalp][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/Serdar-Yegulalp/
[1]:https://forums.virtualbox.org/viewtopic.php?f=15&t=66904
[2]:https://forums.virtualbox.org/viewforum.php?f=15
