New Collaborative Group to Speed Real-Time Linux
================================================================================
![](http://www.linux.com/images/stories/66866/Tux-150.png)

Tux-150The Linux Foundation’s [announcement][1] at LinuxCon this week that it was assuming funding control over the Real-Time Linux project gave renewed hope that embedded Linux will complete its 15-year campaign to achieve equivalence with RTOSes in real-time operations. The RTL group is being reinvigorated as a Real-Time Linux Collaborative Project, with better funding, more developers, and closer integration with mainline kernel development.

According to the Linux Foundation, moving RTL under its umbrella “will save the industry millions of dollars in research and development.” The move will also “improve quality of the code through robust upstream kernel test infrastructure,” says the Foundation.

Over the past decade, the RTL project has been overseen, and more recently, funded, by the [Open Source Automation Development Lab][2], which is continuing on as a Gold member of the new collaborative project, but will hand funding duties over to the Linux Foundation in January. The RTL project and [OSADL][3] have been responsible for maintaining the RT-Preempt (or [Preempt-RT][4]) patches, and periodically updating them to mainline Linux.

The task is about 90 percent complete, according to Dr. Carsten Emde, longtime General Manager of OSADL. “It’s like building a house,” he explains. “The main components such as the walls, windows, and doors are already in place, or in our case, things like high-resolution timers, interrupt threads, and priority-inheritance mutexes. But then you need all these little bits and pieces such as carpets and wallpaper to finish the job.”

According to Emde, real-time Linux is already technologically equivalent to most real-time operating systems – assuming you’re willing to hassle with all the patches. “The goal of the project was to provide a Linux system with a predefined deterministic worst-case latency and nothing else,” says Emde. “This goal is reached today when a kernel is patched, and the same goal will be reached when a future unpatched mainline RT kernel will be used. The only – of course important – difference is that the maintenance work will be much less when we do no longer need to continually adapt off-tree components to mainline.”

The RTL Collaborative Group will continue under the guidance of Thomas Gleixner, the key maintainer over the past decade. This week, Gleixner was appointed a Linux Foundation Fellow, joining a select group that includes Linux kernel stable maintainer Greg Kroah-Hartman, Yocto Project maintainer Richard Purdie, and Linus Torvalds.

According to Emde, RTL’s secondary maintainer Steven Rostedt of Red Hat, who “maintains older but still maintained kernel versions,” will continue to participate in the project along with Red Hat’s Ingo Molnàr, who was a key developer of RTL, but in recent years has had more of an advisory position. Somewhat surprisingly, however, Red Hat is not one of the RTL Collaborative Group’s members. Instead, Google takes the top spot as the lone Platinum member, while Gold members include National Instruments (NI), OSADL, and Texas Instruments (TI). Silver members include Altera, ARM, Intel, and IBM.

### The Long Road to Real Time ###

When Linux first appeared in embedded devices more than 15 years ago, it faced an embedded computing market dominated by RTOSes such as Wind River’s VxWorks, which continue to offer highly deterministic, hardened kernels required by many industrial, avionics, and transportation applications. Like Microsoft’s already then established – and more real-time – Windows CE, Linux faced resistance and outright mockery from potential industrial clients. These desktop-derived distributions might be okay for lightweight consumer electronics, it was argued, but they lacked the hardened, kernels that made RTOSes the choice for devices that required deterministic task scheduling for split-second reliability.

Improving Linux’s real-time capabilities was an [early goal][5] of embedded Linux pioneers such as [MontaVista][6]. Over the years, RTL development was accelerated and formalized in various groups such as OSADL, which [was founded in 2006][7], as well as the Real-Time Linux Foundation (RTLF). When RTLF [merged with OSADL][8] in 2009, OSADL and its RTL group took full ownership over the PREEMPT-RT patch maintenance and upstreaming process. OSADL also oversees other automation-related projects such as [Safety Critical Linux][9].

OSADL’s stewardship over RTL progressed in three stages: advocacy and outreach, testing and quality assessment, and finally, funding. Early on, OSADL’s role was to write articles, make presentations, organize training, and “spread the word” about the advantages of RTL, says Emde.  “To introduce a new technology such as Linux and its community-based development model into the rather conservative automation industry required first of all to build confidence,” he says. “Switching from a proprietary RTOS to Linux means that companies must introduce new strategies and processes in order to interact with a community.”

Later, OSADL moved on to providing technical performance data, establishing [a quality assessment and testing center][10], and providing assistance to its industrial members in open source legal compliance and safety certifications.

As RTL grew more mature, pulling even with the fading Windows CE in real-time capabilities and increasingly [cutting into RTOS market share][11], rival real-time Linux projects – principally [Xenomai][12] – have begun to integrate with it.

“The success of the RT patches, and the clear prospective that they would eventually be merged completely, has led to a change of focus at Xenomai,” says Emde. “Xenomai 3.0 can be used in combination with the RT patches and provide so-called ‘skins’ that allow you to recycle real-time source code that was written for other systems. They haven’t been completely unified, however, since Xenomai uses a dual kernel approach whereas the RT patches apply only to a single Linux kernel.”

In more recent years, the RTL group’s various funding sources have dropped off, and OSADL took on that role, too. “When the development recently slowed down a bit because of a lack of funding, OSADL started its third milestone by directly funding Thomas Gleixner's work,” says Emde.

As Emde wrote in an [Oct. 5 blog entry][13], the growing expansion of Real-Time Linux beyond its core industrial base to areas like automotive and telecom suggested that the funding should be expanded as well. “It would not be entirely fair to let the automation industry fund the complete remaining work on its own, since other industries such as telecommunication also rely on the availability of a deterministic Linux kernel,” wrote Emde.

When the Linux Foundation showed interest in expanding its funding role, OSADL decided it would be “much more efficient to have a single funding and control channel,” says Emde. He adds, however, that as a Gold member, OSADL is still participating in the oversight of the project, and will continue its advocacy and quality assurance activities.

### Automotive Looks for Real-Time Boost ###

RTL will continue to see its greatest growth in industrial applications where it will gradually replace RTOS applications, says Emde. Yet, it is also growing quickly in automotive, and will later spread to railway and avionics, he adds.

Indeed, the growing role of Linux in automotive appears to be key to the Linux Foundation’s goals for RTL, with potential collaborations with its [Automotive Grade Linux][14] (AGL) workgroup. Automotive may also be the chief motivator for Google’s high-profile participation, speculates Emde. In addition, TI is deeply involved with automotive with its Jacinto processors.

Linux-oriented automotive projects like AGL aim to move Linux beyond in-vehicle infotainment (IVI) into cluster controls and telematics where RTOSes like QNX dominate. Autonomous vehicles are even in greater need of real-time performance.

Emde notes that OSADL's [SIL2LinuxMP][15] project may play an important role in extending RTL into automotive. SIL2LinuxMP is not an automotive-specific project, but BMW is participating, and automotive is one of the key applications. The project aims to certify base components required for RTL to run on a single- or multi-core COTS board. It defines bootloader, root filesystem, Linux kernel, and C library bindings to access RTL.

Autonomous drones and robots are also ripe for real-time, and Xenomai is already used in many robots, as well as some drones. Yet, RTL’s role will be limited in the wider embedded Linux world of consumer electronics and Internet of Things applications. The main barrier is the latency of wireless communications and the Internet itself.

“Real-time Linux will have a role within machine control and between machines and peripheral devices, but less between remote machines,” says Emde. “Real-time via Internet will probably never be possible.”

--------------------------------------------------------------------------------

via: http://www.linux.com/news/software/applications/858828-new-collaborative-group-to-speed-real-time-linux

作者：[Eric Brown][a]
译者：[译者ID](https://github.com/译者ID)
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