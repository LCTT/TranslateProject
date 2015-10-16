unicornx 翻译中... ...
New Collaborative Group to Speed Real-Time Linux
================================================================================
![](http://www.linux.com/images/stories/66866/Tux-150.png)

The Linux Foundation’s [announcement][1] at LinuxCon this week that it was assuming funding control over the Real-Time Linux project gave renewed hope that embedded Linux will complete its 15-year campaign to achieve equivalence with RTOSes in real-time operations. The RTL group is being reinvigorated as a Real-Time Linux Collaborative Project, with better funding, more developers, and closer integration with mainline kernel development.

在本周的Linux大会活动(LinuxCon)上Linux基金会(Linux Foundation)[宣称][1]，“Real-Time
 Linux”项目(译者注：实时Linux操作系统项目，简称RTL)得到了新的资金支持，并预期这将促进该项目，使其自成立15年来第一次有机会在实时操作性上和其他的实时操作系统一较高下。Linux基金会将RTL项目重组为一个新的项目，并命名为“Real-Time Linux Collaborative Project”(译者注，下文将称其为“RTL协作组”)，该项目将获得更有力的资金支持，更多的开发人员将投入其中，并在开发和集成上和内核主线保持更紧密的联系。

According to the Linux Foundation, moving RTL under its umbrella “will save the industry millions of dollars in research and development.” The move will also “improve quality of the code through robust upstream kernel test infrastructure,” says the Foundation.

根据Linux基金会的说法，RTL项目并入Linux基金会后“将为业界节省数百万美元的重复研发费用。”同时此举也将“通过基于稳定的主线内核版本开发而改善本项目的代码质量”。

Over the past decade, the RTL project has been overseen, and more recently, funded, by the [Open Source Automation Development Lab][2], which is continuing on as a Gold member of the new collaborative project, but will hand funding duties over to the Linux Foundation in January. The RTL project and [OSADL][3] have been responsible for maintaining the RT-Preempt (or [Preempt-RT][4]) patches, and periodically updating them to mainline Linux.

在过去的十几年中，RTL项目的开发管理和经费资助主要由[开源自动化开发实验室(译者注：Open Source Automation Development Lab，简称OSADL)] [2]承担，其将继续作为新合作项目的金牌成员之一，但其原来承担的资金资助工作将会在一月份移交给Linux基金。RTL项目和[OSADL][3]长久以来一直负责维护[内核的实时抢占(RT-Preempt)补丁][4]，并定期将其更新到Linux内核的主线上。

The task is about 90 percent complete, according to Dr. Carsten Emde, longtime General Manager of OSADL. “It’s like building a house,” he explains. “The main components such as the walls, windows, and doors are already in place, or in our case, things like high-resolution timers, interrupt threads, and priority-inheritance mutexes. But then you need all these little bits and pieces such as carpets and wallpaper to finish the job.”

按长期以来一直担任OSADL总经理的Carsten Emde博士的话说，支持内核实时特性的工作已经完成了将近90％。 “这就像盖房子，”他解释说。 “主要的部件，如墙壁，窗户和门都已经安装到位，就实时内核来说，类似的主要部件譬如：高精度定时器(high-resolution timers)，中断线程化机制(interrupt threads)和基于优先级可继承的互斥量(priority-inheritance mutexes)等。你所剩下的工作就是还需要一些小零碎，如地毯和墙纸来完成最终的工程。“

According to Emde, real-time Linux is already technologically equivalent to most real-time operating systems – assuming you’re willing to hassle with all the patches. “The goal of the project was to provide a Linux system with a predefined deterministic worst-case latency and nothing else,” says Emde. “This goal is reached today when a kernel is patched, and the same goal will be reached when a future unpatched mainline RT kernel will be used. The only – of course important – difference is that the maintenance work will be much less when we do no longer need to continually adapt off-tree components to mainline.”

据Emde介绍，从技术的角度来说，实时Linux的性能已经可以媲美绝大多数其他的实时操作系统 - 只要你不厌其烦地愿意把所有的补丁都打上。 Emde的原话如下：“该项目(译者注，指RTL)的目标就是提供一个满足实时性要求Linux系统，使其无论在如何恶劣的负载状况下都可以保证在确定的可以预先定义的时间内对处理做出响应，没有其他，这个目标已经实现，但需要你手动地将RTL提供的补丁添加到Linux内核主线的版本代码上，但新项目将在Linux内核主线版本上直接支持同样的的目标。唯一的，当然也是最重要的区别就是相应的维护工作将少得多，因为我们再也不用一次又一次移植那些独立于内核主线的补丁代码了。”

The RTL Collaborative Group will continue under the guidance of Thomas Gleixner, the key maintainer over the past decade. This week, Gleixner was appointed a Linux Foundation Fellow, joining a select group that includes Linux kernel stable maintainer Greg Kroah-Hartman, Yocto Project maintainer Richard Purdie, and Linus Torvalds.

新的RTL协作组将继续在Thomas Gleixner的指导下工作，Thomas Gleixner在过去的十多年里一直是RTL的核心维护人员。本周，Gleixner被任命为Linux基金会成员，并加入了一个特别的小组，小组成员包括Linux稳定内核维护者Greg Kroah-Hartman，Yocto项目维护者Richard Purdie和Linus Torvalds本人。

According to Emde, RTL’s secondary maintainer Steven Rostedt of Red Hat, who “maintains older but still maintained kernel versions,” will continue to participate in the project along with Red Hat’s Ingo Molnàr, who was a key developer of RTL, but in recent years has had more of an advisory position. Somewhat surprisingly, however, Red Hat is not one of the RTL Collaborative Group’s members. Instead, Google takes the top spot as the lone Platinum member, while Gold members include National Instruments (NI), OSADL, and Texas Instruments (TI). Silver members include Altera, ARM, Intel, and IBM.


据Emde介绍，RTL的第二维护人Steven Rostedt来自Red Hat公司，他负责维护旧的内核版本，他将和同样来自Red Hat的Ingo Molnàr继续参与该项目，Ingo是RTL的关键开发人员，但近年来更多地从事咨询方面的工作。有些令人惊讶的是，Red Hat竟然不是RTL协作组的成员之一。相反，谷歌作为唯一的白金会员占据了头把交椅，其他黄金会员包括国家仪器公司（National Instruments，简称NI），OSADL和德州仪器（TI）。银卡会员包括Altera公司，ARM，Intel和IBM。

### The Long Road to Real Time ###
###走向实时内核的漫长道路###

When Linux first appeared in embedded devices more than 15 years ago, it faced an embedded computing market dominated by RTOSes such as Wind River’s VxWorks, which continue to offer highly deterministic, hardened kernels required by many industrial, avionics, and transportation applications. Like Microsoft’s already then established – and more real-time – Windows CE, Linux faced resistance and outright mockery from potential industrial clients. These desktop-derived distributions might be okay for lightweight consumer electronics, it was argued, but they lacked the hardened, kernels that made RTOSes the choice for devices that required deterministic task scheduling for split-second reliability.

当15年前Linux第一次出现在嵌入式设备上的时候，它所面临的嵌入式计算市场已经被其他的实时操作系统，譬如风河公司（WindRiver）的VxWorks，所牢牢占据着，VxWorks从那时到现在，一直在为众多的工控设备，航空电子设备以及交通运输应用提供着工业级别的高确定性的，硬实时的内核。微软后来也提供了一个支持实时性的操作系统版本-Windows CE，Linux所面临的是来自潜在工业客户的公开嘲讽和层层阻力。他们认为那些从桌面系统改进来的Linux发行版本顶多适合要求不高的轻量级消费类电子产品，是不适合那些对硬实时要求高的设备的。

Improving Linux’s real-time capabilities was an [early goal][5] of embedded Linux pioneers such as [MontaVista][6]. Over the years, RTL development was accelerated and formalized in various groups such as OSADL, which [was founded in 2006][7], as well as the Real-Time Linux Foundation (RTLF). When RTLF [merged with OSADL][8] in 2009, OSADL and its RTL group took full ownership over the PREEMPT-RT patch maintenance and upstreaming process. OSADL also oversees other automation-related projects such as [Safety Critical Linux][9].

对于嵌入式Linux的先行者如[MontaVista公司][6]来说，其[早期的目标][5]很明确就是要改进Linux的实时能力。多年以来，对Linux的实时性能开发发展迅速，得到各种组织的支持，如OSADL[成立于2006年][7]，以及实时Linux基金会（Real-Time Linux Foundation，简称RTLF）。在2009年[OSADL与RTLF合并][8]，OSADL及其RTL组承担了所有的抢占式实时内核(PREEMPT-RT)补丁的维护工作并始终保存跟踪最新的Linux内核主线版本。除此之外OSADL还负责监管其他自动化相关的项目，例如[高可靠性Linux][9](Safety Critical Linux，译者注：指研究如何在关键系统上可靠安全地运行Linux)。

OSADL’s stewardship over RTL progressed in three stages: advocacy and outreach, testing and quality assessment, and finally, funding. Early on, OSADL’s role was to write articles, make presentations, organize training, and “spread the word” about the advantages of RTL, says Emde.  “To introduce a new technology such as Linux and its community-based development model into the rather conservative automation industry required first of all to build confidence,” he says. “Switching from a proprietary RTOS to Linux means that companies must introduce new strategies and processes in order to interact with a community.”

OSADL对RTL的支持经历了三个阶段：拥护和推广、测试和质量评估以及最后的资金支持。Emde表示，在早期，OSADL的角色仅限于写写推广的文章，制作专题报告，组织相关培训，以及“宣传”RTL的优点。他说：“要让一个相当保守的自动化行业接受象Linux之类的新技术及其基于社区的那种开发模式，首先就需要建立其对新事物的信心。从使用专有的实时操作系统转向改用Linux对公司意味着必须引入新的战略和流程，以便与社区进行互动。”

Later, OSADL moved on to providing technical performance data, establishing [a quality assessment and testing center][10], and providing assistance to its industrial members in open source legal compliance and safety certifications.

后来，OSADL改而提供技术性能数据，建立[质量评估和测试中心][10]，并在和开源相关事务的法律问题和安全认证方面向行业成员提供帮助。

As RTL grew more mature, pulling even with the fading Windows CE in real-time capabilities and increasingly [cutting into RTOS market share][11], rival real-time Linux projects – principally [Xenomai][12] – have begun to integrate with it.

当RTL在实时性上变得愈加成熟，相反Windows CE却是江河日下，[其市场份额正在快速地被RTL所蚕食][11]，一些与RTL竞争的实时Linux项目,主要是[Xenomai][12]已开始集成RTL。

“The success of the RT patches, and the clear prospective that they would eventually be merged completely, has led to a change of focus at Xenomai,” says Emde. “Xenomai 3.0 can be used in combination with the RT patches and provide so-called ‘skins’ that allow you to recycle real-time source code that was written for other systems. They haven’t been completely unified, however, since Xenomai uses a dual kernel approach whereas the RT patches apply only to a single Linux kernel.”

“伴随RTL补丁的成功发展，以及明确的预期其最终会被集成到Linux内核主线代码中，导致Xenomai关注的重心发生了变化，”Emde说。 “Xenomai 3.0可与RT补丁结合起来使用，并提供了所谓的‘皮肤’，（译者注：一个封装层），使我们可以复用为其他系统编写的代码。不过，它们还没有完全统一起来，因为Xenomai使用了双内核方法，而RT补丁只适用于单一Linux内核。“

In more recent years, the RTL group’s various funding sources have dropped off, and OSADL took on that role, too. “When the development recently slowed down a bit because of a lack of funding, OSADL started its third milestone by directly funding Thomas Gleixner's work,” says Emde.

近些年来，资助RTL项目的来源越来越少，最终OSADL接过了这个重任。Emde说：“当最近开发工作因缺少资金而陷入停滞时，OSADL对RTL的支持进入到第三个重大阶段：开始直接资助Thomas Gleixner的工作。”

As Emde wrote in an [Oct. 5 blog entry][13], the growing expansion of Real-Time Linux beyond its core industrial base to areas like automotive and telecom suggested that the funding should be expanded as well. “It would not be entirely fair to let the automation industry fund the complete remaining work on its own, since other industries such as telecommunication also rely on the availability of a deterministic Linux kernel,” wrote Emde.

正如Emde在其[10月5日的一篇博文][13]中所描述的那样，实时Linux的应用领域正在日益扩大，由其原来主要服务的工业控制扩大到了汽车行业和电信业等领域，这表明资助的来源也应该得到拓宽。Emde原文写道：“仅仅靠工业自动化行业的资金来支撑剩余的工作是不合理的，因为电信等其他行业也在使用实时Linux内核。”

When the Linux Foundation showed interest in expanding its funding role, OSADL decided it would be “much more efficient to have a single funding and control channel,” says Emde. He adds, however, that as a Gold member, OSADL is still participating in the oversight of the project, and will continue its advocacy and quality assurance activities.

当Linux基金会表明有兴趣提供资金支持时，OSADL认为“单一的资助和控制渠道要有效得多”，Emde如是说。不过，他补充说，作为黄金级成员，OSADL仍参与监管项目的工作，会继续从事其宣传和质量保证方面的活动。

### Automotive Looks for Real-Time Boost ###
###汽车行业期待RTL的崛起###

RTL will continue to see its greatest growth in industrial applications where it will gradually replace RTOS applications, says Emde. Yet, it is also growing quickly in automotive, and will later spread to railway and avionics, he adds.

Emde表示，RTL会继续在工业应用领域迎来最迅猛的发展并逐渐取代其他实时操作系统。而且，他补充道，RTL在汽车行业发展也很迅猛，以后会扩大并应用到铁路和航空电子设备上。

Indeed, the growing role of Linux in automotive appears to be key to the Linux Foundation’s goals for RTL, with potential collaborations with its [Automotive Grade Linux][14] (AGL) workgroup. Automotive may also be the chief motivator for Google’s high-profile participation, speculates Emde. In addition, TI is deeply involved with automotive with its Jacinto processors.

的确，Linux在汽车行业将扮演越来越重要的角色，这也是Linux基金对RTL所寄予厚望的原因之所在。RTL工作组可能会与Linux基金会旗下的[车载Linux(Automotive Grade Linux，简称AGL)][14]工作组展开合作。Emde猜测，Google高调参与的主要动因可能也是希望将RTL用于汽车控制。此外，德州仪器(TI)也非常期望将其Jacinto处理器应用于汽车行业。

Linux-oriented automotive projects like AGL aim to move Linux beyond in-vehicle infotainment (IVI) into cluster controls and telematics where RTOSes like QNX dominate. Autonomous vehicles are even in greater need of real-time performance.

面向车载Linux的项目(比如AGL)旨在让Linux在车载设备应用上不要仅限于车载信息娱乐(In-Vehicle Infotainment，简称IVI)，而是要进入到譬如集群控制和车载通讯领域，这些领域目前主要使用QNX之类的实时操作系统。无人驾驶汽车对操作系统的实时性能的需求还要大。

Emde notes that OSADL's [SIL2LinuxMP][15] project may play an important role in extending RTL into automotive. SIL2LinuxMP is not an automotive-specific project, but BMW is participating, and automotive is one of the key applications. The project aims to certify base components required for RTL to run on a single- or multi-core COTS board. It defines bootloader, root filesystem, Linux kernel, and C library bindings to access RTL.

Emde特别指出，OSADL的[SIL2LinuxMP][15]项目可能会在将RTL引入到汽车工业领域上扮演重要的角色。SIL2LinuxMP并不是专门针对汽车工业的项目，但随着BMW公司参与其中，汽车行业成为其很重要的应用领域之一。该项目的目标在于验证RTL在采用单核或多核CPU的标准化商用(Commercial Off-The-Shelf，简称COTS)板卡上运行所需的基本部件。它定义了引导程序、根文件系统、Linux内核以及对应支持RTL的C库。

Autonomous drones and robots are also ripe for real-time, and Xenomai is already used in many robots, as well as some drones. Yet, RTL’s role will be limited in the wider embedded Linux world of consumer electronics and Internet of Things applications. The main barrier is the latency of wireless communications and the Internet itself.

无人机和机器人使用实时Linux的时机也已成熟，Xenomai系统早已用在许多机器人以及一些无人机中。不过，在更广泛的嵌入式Linux世界，包括了消费电子产品和物联网应用中，RTL可以扮演的角色很有限。主要的障碍在于，无线通信和互联网本身带来的延迟。

“Real-time Linux will have a role within machine control and between machines and peripheral devices, but less between remote machines,” says Emde. “Real-time via Internet will probably never be possible.”

Emde说：“实时Linux主要还是应用于系统内部控制以及系统与周边外设之间的控制，在远程控制机器上作用不大。通过互联网要想实现实时控制恐怕是永远不可能的。”

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