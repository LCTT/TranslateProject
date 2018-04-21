translating by kennethXia
Why I love ARM and PowerPC
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/desk_clock_job_work.jpg?itok=Nj4fuhl6)
Recently I've been asked why I mention [ARM][1] and [PowerPC][2] so often on my blogs and in my tweets. I have two answers: one is personal, the other technical.

### The personal

Once upon a time, I studied environmental protection. While working on my PhD, I was looking for a new computer. As an environmentally aware person, I wanted a high-performing computer that was also efficient. That is how I first became interested in the PowerPC and discovered [Pegasos][3], a PowerPC workstation created by [Genesi][4].

I had already used [RS/6000][5] (PowerPC), [SGI][6] (MIPS), [HP-UX][7] (PA-RISC), and [VMS][8] (Alpha) both as a server and a workstation, and on my PC I used Linux, not Windows, so using a different CPU architecture was not a barrier. [Pegasos][9], which was small and efficient enough for home use, was my first workstation.

Soon I was working for Genesi, enabling [openSUSE][10], Ubuntu, and various other Linux distributions on Pegasos and providing quality assurance and community support. Pegasos was followed by [EFIKA][11], another PowerPC board. It felt strange at first to use an embedded system after using workstations. But as one of the first affordable developer boards, it was the start of a revolution.

I was working on some large-scale server projects when I received another interesting piece of hardware from Genesi: a [Smarttop][12] and a [Smartbook][13] based on ARM. My then-favorite Linux distribution, openSUSE, also received a dozen of these machines. This gave a big boost to ARM-related openSUSE developments at a time when very few ARM machines were available.

Although I have less time available these days, I try to stay up-to-date on ARM and PowerPC news. This helps me support syslog-ng users on non-x86 platforms. And when I have half an hour free, I hack one of my ARM machines. I did some benchmarks on the [Raspberry Pi 2][14] with [syslog-ng][15], and the [results were quite surprising][16]. Recently, I built a music player using a Raspberry Pi, a USB sound card, and the [Music Player Daemon][17], and I use it regularly.

### The technical

Diversity is good: It creates competition, and competition creates better products. While x86 is a solid generic workhorse, chips like ARM and PowerPC (and many others) are better suited in various situations.

If you have an [Android][18] mobile device or an [Apple][19] iPhone or iPad, there's a good chance it is running on an ARM SoC (system on chip). Same with a network-attached storage server. The reason is quite simple: power efficiency. You don't want to constantly recharge batteries or pay more for electricity than you did for your router.

ARM is also conquering the enterprise server world with its 64-bit ARMv8 chips. Many tasks require minimal computing capacity; on the other hand, power efficiency and fast I/O are key— think storage, static web content, email, and other storage- and network-intensive functions. A prime example is [Ceph][20], a distributed object storage and file system. [SoftIron][21], which uses CentOS as reference software on its ARMv8 developer hardware, is working on Ceph-based turnkey storage appliances.

Most people know PowerPC as the former CPU of [Apple Mac][22] machines. While it is no longer used as a generic desktop CPU, it still functions in routers, telecommunications equipment. And [IBM][23] continued to produce chips for high-performance servers. A few years ago, with the introduction of POWER8, IBM opened up the architecture under the aegis of the [OpenPOWER Foundation][24]. POWER8 is an ideal platform for HPC, big data, and analytics, where memory bandwidth is key. POWER9 is right around the corner.

These are all server applications, but there are plans for end-user devices. Raptor Engineering is working on a [POWER9 workstation][25], and there is also an initiative to [create a notebook][26] based on a Freescale/NXP QorIQ e6500 chip. Of course, these machines are not for everybody—you can't install your favorite Windows game or commercial application on them. But they are great for PowerPC developers and enthusiasts, or anyone wanting a fully open system, from hardware to firmware to applications.

### The dream

My dream is a completely x86-free environment—not because I don't like x86, but because I like diversity and always use the most suitable tool for the job. If you look at the [graph][27] on Raptor Engineering's page, you will see that, depending on your use case, ARM and POWER can replace most of x86. Right now I compile, package, and test syslog-ng in x86 virtual machines running on my laptop. Using a strong enough ARMv8 or PowerPC machine, either as a workstation or a server, I could avoid x86 for this kind of tasks.

Right now I am waiting for the next generation of [Pinebook][28] to arrive, as I was told at [FOSDEM][29] in February that the next version is expected to offer much higher performance. Unlike Chromebooks, this ARM-powered laptop runs Linux by design, not as a hack. For a desktop, I am looking for ARMv8 workstation-class hardware. Some are already available—like the [ThunderX Desktop][30] from Avantek—but they do not yet feature the latest, fastest, and more importantly, most energy-efficient ARMv8 CPU generations. Until these arrive, I'll use my Pixel C laptop running Android. It's not as easy and flexible as Linux, but it has a powerful ARM SoC and a Linux kernel at its heart.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/why-i-love-arm-and-powerpc

作者：[Peter Czanik][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/czanik
[1]:https://en.wikipedia.org/wiki/ARM_architecture
[2]:https://en.wikipedia.org/wiki/PowerPC
[3]:https://genesi.company/products/opendesktop
[4]:https://genesi.company/
[5]:https://en.wikipedia.org/wiki/RS/6000
[6]:https://en.wikipedia.org/wiki/Silicon_Graphics#Workstations
[7]:https://en.wikipedia.org/wiki/HP-UX
[8]:https://en.wikipedia.org/wiki/OpenVMS#Port_to_DEC_Alpha
[9]:https://en.wikipedia.org/wiki/Pegasos
[10]:https://www.opensuse.org/
[11]:https://genesi.company/products/efika/5200b
[12]:https://genesi.company/products/efika
[13]:https://genesi.company/products/smartbook
[14]:https://www.raspberrypi.org/products/raspberry-pi-2-model-b/
[15]:https://syslog-ng.com/open-source-log-management
[16]:https://syslog-ng.com/blog/syslog-ng-raspberry-pi-2/
[17]:https://www.musicpd.org/
[18]:https://www.android.com/
[19]:http://www.apple.com/
[20]:http://ceph.com/
[21]:http://softiron.co.uk/
[22]:https://en.wikipedia.org/wiki/Power_Macintosh
[23]:https://www.ibm.com/us-en/
[24]:http://openpowerfoundation.org/
[25]:https://www.raptorcs.com/TALOSII/
[26]:http://www.powerpc-notebook.org/en/
[27]:https://secure.raptorengineering.com/TALOS/power_advantages.php
[28]:https://www.pine64.org/?page_id=3707
[29]:https://fosdem.org/2018/
[30]:https://www.avantek.co.uk/store/avantek-32-core-cavium-thunderx-arm-desktop.html
