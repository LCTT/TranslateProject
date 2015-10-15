unicornx 翻译中... ...
New Collaborative Group to Speed Real-Time Linux
================================================================================
![](http://www.linux.com/images/stories/66866/Tux-150.png)

The Linux Foundation’s [announcement][1] at LinuxCon this week that it was assuming funding control over the Real-Time Linux project gave renewed hope that embedded Linux will complete its 15-year campaign to achieve equivalence with RTOSes in real-time operations. The RTL group is being reinvigorated as a Real-Time Linux Collaborative Project, with better funding, more developers, and closer integration with mainline kernel development.

在本周的Linux大会活动(LinuxCon)上Linux基金会(Linux Foundation)[宣称][1]，“Real-Time
 Linux”项目(译者注：实时Linux操作系统项目，简称RTL)得到了新的资金支持，并预期这将促进该项目，使其自成立15年来第一次有机会在实时操作性上和其他的实时操作系统一较高下。Linux基金会将RTL项目重组为一个新的项目，并命名为“Real-Time Linux Collaborative Project”，该项目将获得更有力的资金支持，更多的开发人员将投入其中，并在开发和集成上和内核主线保持更紧密的联系。

According to the Linux Foundation, moving RTL under its umbrella “will save the industry millions of dollars in research and development.” The move will also “improve quality of the code through robust upstream kernel test infrastructure,” says the Foundation.

根据Linux基金会的说法，RTL项目并入Linux基金会后“将为业界节省数百万美元的重复研发费用。”同时此举也将“通过基于稳定的主线内核版本开发而改善本项目的代码质量”。

Over the past decade, the RTL project has been overseen, and more recently, funded, by the [Open Source Automation Development Lab][2], which is continuing on as a Gold member of the new collaborative project, but will hand funding duties over to the Linux Foundation in January. The RTL project and [OSADL][3] have been responsible for maintaining the RT-Preempt (or [Preempt-RT][4]) patches, and periodically updating them to mainline Linux.

在过去的十几年中，RTL项目的开发管理和经费资助主要由[开源自动化开发实验室(译者注：Open Source Automation Development Lab，简称OSADL)] [2]承担，其将继续作为新合作项目的金牌成员之一，但其原来承担的资金资助工作将会在一月份移交给Linux基金。RTL项目和[OSADL][3]长久以来一直负责维护[内核的实时抢占(RT-Preempt)补丁][4]，并定期将其更新到Linux内核的主线上。

The task is about 90 percent complete, according to Dr. Carsten Emde, longtime General Manager of OSADL. “It’s like building a house,” he explains. “The main components such as the walls, windows, and doors are already in place, or in our case, things like high-resolution timers, interrupt threads, and priority-inheritance mutexes. But then you need all these little bits and pieces such as carpets and wallpaper to finish the job.”

按长期以来一直担任OSADL总经理的Carsten Emde博士的话说，支持内核实时特性的工作已经完成了将近90％。 “这就像盖房子，”他解释说。 “主要的部件，如墙壁，窗户和门都已经安装到位，就实时内核来说，类似的主要部件譬如：高精度定时器(high-resolution timers)，中断线程化机制(interrupt threads)和基于优先级可继承的互斥量(priority-inheritance mutexes)等。你所剩下的工作就是还需要一些小零碎，如地毯和墙纸来完成最终的工程。“

PC <==
  
According to Emde, real-time Linux is already technologically equivalent to most real-time operating systems – assuming you’re willing to hassle with all the patches. “The goal of the project was to provide a Linux system with a predefined deterministic worst-case latency and nothing else,” says Emde. “This goal is reached today when a kernel is patched, and the same goal will be reached when a future unpatched mainline RT kernel will be used. The only – of course important – difference is that the maintenance work will be much less when we do no longer need to continually adapt off-tree components to mainline.”

据昂德，实时Linux已经是技术上等同于大多数实时操作系统 - 假设你愿意麻烦地把所有补丁。 “该项目的目标是提供一个Linux系统预定义的确定性最坏情况下的延迟，没有别的，”昂德说。 “这个目标是走到了今天，当一个内核补丁，并在未来的未打补丁的主线RT内核将使用相同的目标一定会达到。唯一的 - 当然重要的 - 不同的是，维修工作会少得多，当我们不再需要关闭树组件主线不断地适应“。

The RTL Collaborative Group will continue under the guidance of Thomas Gleixner, the key maintainer over the past decade. This week, Gleixner was appointed a Linux Foundation Fellow, joining a select group that includes Linux kernel stable maintainer Greg Kroah-Hartman, Yocto Project maintainer Richard Purdie, and Linus Torvalds.

在RTL协作组将继续托马斯Gleixner，关键维护者在过去十年的指导下进行。本周，Gleixner被任命为Linux基金会研究员，加入一个选择组，其中包括Linux内核维护者稳定格雷格Kroah-Hartman的，Yocto计划维护者理查德Purdie和Linus Torvalds公司。

According to Emde, RTL’s secondary maintainer Steven Rostedt of Red Hat, who “maintains older but still maintained kernel versions,” will continue to participate in the project along with Red Hat’s Ingo Molnàr, who was a key developer of RTL, but in recent years has had more of an advisory position. Somewhat surprisingly, however, Red Hat is not one of the RTL Collaborative Group’s members. Instead, Google takes the top spot as the lone Platinum member, while Gold members include National Instruments (NI), OSADL, and Texas Instruments (TI). Silver members include Altera, ARM, Intel, and IBM.

据昂德，红帽的RTL的二级维护史蒂芬Rostedt，谁“维护旧的，但仍然保持内核版本，”将继续参与该项目与Red Hat的英格·蒙内，谁是RTL的主要开发者，但近年来已经有更多的咨询地位。有些令人惊讶，然而，红帽不是RTL协作组的成员之一。相反，谷歌采取的头把交椅作为唯一的白金会员，黄金会员包括美国国家仪器公司（NI），OSADL和德州仪器（TI）。银卡会员包括Altera公司，ARM，英特尔和IBM。

### The Long Road to Real Time ###
###的漫长道路实时###

When Linux first appeared in embedded devices more than 15 years ago, it faced an embedded computing market dominated by RTOSes such as Wind River’s VxWorks, which continue to offer highly deterministic, hardened kernels required by many industrial, avionics, and transportation applications. Like Microsoft’s already then established – and more real-time – Windows CE, Linux faced resistance and outright mockery from potential industrial clients. These desktop-derived distributions might be okay for lightweight consumer electronics, it was argued, but they lacked the hardened, kernels that made RTOSes the choice for devices that required deterministic task scheduling for split-second reliability.

当Linux第一次出现在嵌入式设备超过15年前，它面临着一个嵌入式计算市场受到的RTOS为主如Wind River的VxWorks，从而继续提供许多工业，航空电子设备和交通运输应用所需的高确定性，硬化的内核。像微软已经随之建立 - 以及更多实时 - 的Windows CE，Linux的面临着阻力和彻底的嘲讽潜在工业客户。这些桌面衍生的分布可能是正确的轻质消费类电子产品，有人主张，但他们缺乏硬化，内核，使得实时操作系统的选择，需要确定的任务调度的瞬间可靠性的设备。

Improving Linux’s real-time capabilities was an [early goal][5] of embedded Linux pioneers such as [MontaVista][6]. Over the years, RTL development was accelerated and formalized in various groups such as OSADL, which [was founded in 2006][7], as well as the Real-Time Linux Foundation (RTLF). When RTLF [merged with OSADL][8] in 2009, OSADL and its RTL group took full ownership over the PREEMPT-RT patch maintenance and upstreaming process. OSADL also oversees other automation-related projects such as [Safety Critical Linux][9].

嵌入式Linux先驱如[MontaVista公司]改进的Linux的实时能力是一个[早期目标] [5] [6]。多年来，RTL加快发展，并正式在不同群体，如OSADL，其中[成立于2006][7]，以及实时Linux基金会（RTLF）。当RTLF[合并OSADL] [8]在2009年，OSADL和RTL集团采取了完整的所有权在PREEMPT-RT补丁维护和上游化的过程。 OSADL还负责监督其他自动化相关的项目，如[安全关键的Linux] [9]。

OSADL’s stewardship over RTL progressed in three stages: advocacy and outreach, testing and quality assessment, and finally, funding. Early on, OSADL’s role was to write articles, make presentations, organize training, and “spread the word” about the advantages of RTL, says Emde.  “To introduce a new technology such as Linux and its community-based development model into the rather conservative automation industry required first of all to build confidence,” he says. “Switching from a proprietary RTOS to Linux means that companies must introduce new strategies and processes in order to interact with a community.”

OSADL的管家，RTL进展分为三个阶段：宣传和推广，测试和质量评估，最后的资金。在早期，OSADL的作用是写文章，作演讲，组织培训，和“口耳相传的”关于劳动教养的优势，昂德说。 “引进新的技术，例如Linux和以社区为基础的发展模式成为需要首先建立信任的相当保守的自动化行业，”他说。 “从专有的实时操作系统向Linux转换意味着企业必须以与社区交互引入新的战略和流程。”

Later, OSADL moved on to providing technical performance data, establishing [a quality assessment and testing center][10], and providing assistance to its industrial members in open source legal compliance and safety certifications.

后来，OSADL转移到提供技术性能数据，建立[质量评估和试验中心] [10]，并提供援助，以它的工业会员开放源码的合法合规性和安全认证。

As RTL grew more mature, pulling even with the fading Windows CE in real-time capabilities and increasingly [cutting into RTOS market share][11], rival real-time Linux projects – principally [Xenomai][12] – have begun to integrate with it.

由于RTL变得更加成熟，即使有衰落的Windows CE的实时能力拉动和日益[切入实时操作系统的市场份额] [11]，竞争对手的实时Linux项目 - 主要是[Xenomai] [12] - 已经开始整合 用它。

“The success of the RT patches, and the clear prospective that they would eventually be merged completely, has led to a change of focus at Xenomai,” says Emde. “Xenomai 3.0 can be used in combination with the RT patches and provide so-called ‘skins’ that allow you to recycle real-time source code that was written for other systems. They haven’t been completely unified, however, since Xenomai uses a dual kernel approach whereas the RT patches apply only to a single Linux kernel.”

“在RT补丁的成功，以及明确的预期，他们最终会被完全合并，导致了焦点的Xenomai的变化，”昂德说。 “Xenomai3.0可以组合使用与RT贴剂并提供所谓的”皮肤“，允许你回收被用于其他系统编写的实时源代码。他们还没有完全统一，但是，由于Xenomai采用了双内核的方法，而RT补丁只适用于单一的Linux内核。“

In more recent years, the RTL group’s various funding sources have dropped off, and OSADL took on that role, too. “When the development recently slowed down a bit because of a lack of funding, OSADL started its third milestone by directly funding Thomas Gleixner's work,” says Emde.

在最近几年中，RTL集团的各种资金来源已经脱落，并OSADL承担了这个角色了。 “当发展减缓近期由于缺乏资金下来了一点，OSADL通过直接资助托马斯Gleixner的工作，开始了它的第三个里程碑，”昂德说。

As Emde wrote in an [Oct. 5 blog entry][13], the growing expansion of Real-Time Linux beyond its core industrial base to areas like automotive and telecom suggested that the funding should be expanded as well. “It would not be entirely fair to let the automation industry fund the complete remaining work on its own, since other industries such as telecommunication also rely on the availability of a deterministic Linux kernel,” wrote Emde.

作为昂德在[十月写道5博客条目] [13]，实时Linux的日益扩张超越其核心产业基地，如汽车和电信领域的建议，基金应该和扩大。 “让自动化产业基金自身完整的剩余工作，因为其他行业如电信还依赖于确定性的Linux内核的可用性这将不是完全公平，写道：”昂德。

When the Linux Foundation showed interest in expanding its funding role, OSADL decided it would be “much more efficient to have a single funding and control channel,” says Emde. He adds, however, that as a Gold member, OSADL is still participating in the oversight of the project, and will continue its advocacy and quality assurance activities.

当Linux基金会表现出扩大其融资作用的兴趣，OSADL决定这将是“更有效有一个单一的资金和控制渠道，”昂德说。然而，他补充说，作为金卡会员，OSADL仍然参与该项目的监督，并将继续倡导和质量保证活动。

### Automotive Looks for Real-Time Boost ###
###汽车看起来实时升压###

RTL will continue to see its greatest growth in industrial applications where it will gradually replace RTOS applications, says Emde. Yet, it is also growing quickly in automotive, and will later spread to railway and avionics, he adds.

RTL将继续看到它在工业领域最大的增长，其中它将逐步取代RTOS应用，昂德说。然而，它也迅速增长的汽车，稍后会蔓延到铁路和航空电子设备，他补充道。

Indeed, the growing role of Linux in automotive appears to be key to the Linux Foundation’s goals for RTL, with potential collaborations with its [Automotive Grade Linux][14] (AGL) workgroup. Automotive may also be the chief motivator for Google’s high-profile participation, speculates Emde. In addition, TI is deeply involved with automotive with its Jacinto processors.

事实上，Linux在汽车出现了越来越大的作用是关键的Linux基金会的目标RTL，与它的[汽车级Linux] [14]（AGL）工作组的潜在合作。汽车也可能是主要的促进因素谷歌的高调参与，推测昂德。此外，TI是深入参与与汽车，其哈辛托处理器。

Linux-oriented automotive projects like AGL aim to move Linux beyond in-vehicle infotainment (IVI) into cluster controls and telematics where RTOSes like QNX dominate. Autonomous vehicles are even in greater need of real-time performance.

面向Linux的汽车项目，如联合集团的目标是将Linux的超越车载信息娱乐（IVI）到集群控制和远程信息处理，其中像QNX实时操作系统占据主导地位。自主车甚至更需要实时性能。

Emde notes that OSADL's [SIL2LinuxMP][15] project may play an important role in extending RTL into automotive. SIL2LinuxMP is not an automotive-specific project, but BMW is participating, and automotive is one of the key applications. The project aims to certify base components required for RTL to run on a single- or multi-core COTS board. It defines bootloader, root filesystem, Linux kernel, and C library bindings to access RTL.

EMDE注意到OSADL的[SIL2LinuxMP] [15]项目可能在延长的RTL到汽车中发挥重要作用。 SIL2LinuxMP不是一个汽车专用的项目，但是宝马参与，以及汽车的关键应用之一。该项目旨在证明上的单核或多核COTS系统运行所需的RTL基本组件。它定义了引导程序，根文件系统，Linux内核和C库绑定访问RTL。

Autonomous drones and robots are also ripe for real-time, and Xenomai is already used in many robots, as well as some drones. Yet, RTL’s role will be limited in the wider embedded Linux world of consumer electronics and Internet of Things applications. The main barrier is the latency of wireless communications and the Internet itself.

自主无人机和机器人也是成熟的实时和Xenomai已经使用在许多的机器人，以及一些无人机。然而，RTL的角色将在更广阔的嵌入式Linux的世界消费电子和物联网的应用受到限制。的主要障碍是无线通信和因特网本身的延迟。

“Real-time Linux will have a role within machine control and between machines and peripheral devices, but less between remote machines,” says Emde. “Real-time via Internet will probably never be possible.”

“实时Linux将拥有在机器控制和机器和外围设备之间的作用，但不远程计算机之间，”昂德说。 “通过互联网实时将可能永远不可能。”

--------------------------------------------------------------------------------

via: http://www.linux.com/news/software/applications/858828-new-collaborative-group-to-speed-real-time-linux

作者：[Eric Brown][a]
译者：[unicornx](https://github.com/unicornx)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linux.com/community/forums/person/42808
[1]:http://www.linuxfoundation.org/news-media/announcements/2015/10/linux-foundation-announces-project-advance-real-time-linux
[2]:http://archive.linuxgizmos.com/celebrating-the-open-source-automation-development-labs-first-birthday/
[3]:https://www.osadl.org/
[4]:http://linuxgizmos.com/adding-real-time-to-linux-with-preempt-rt/
[5]:http://archive.linuxgizmos.com/real-time-linux-what-is-it-why-do-you-want-it-how-do-you-do-it-a/
[6]:http://www.linux.com/news/embedded-mobile/mobile-linux/841651-embedded-linux-pioneer-montavista-spins-iot-linux-distribution
[7]:http://archive.linuxgizmos.com/industry-group-aims-linux-at-automation-apps/
[8]:http://archive.linuxgizmos.com/industrial-linux-groups-merge/
[9]:https://www.osadl.org/Safety-Critical-Linux.safety-critical-linux.0.html
[10]:http://www.osadl.org/QA-Farm-Realtime.qa-farm-about.0.html
[11]:http://www.linux.com/news/embedded-mobile/mobile-linux/818011-embedded-linux-keeps-growing-amid-iot-disruption-says-study
[12]:http://xenomai.org/
[13]:https://www.osadl.org/Single-View.111+M5dee6946dab.0.html
[14]:http://www.linux.com/news/embedded-mobile/mobile-linux/833358-first-open-automotive-grade-linux-spec-released
[15]:http://www.osadl.org/SIL2LinuxMP.sil2-linux-project.0.html