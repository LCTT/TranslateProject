[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (DARPA looks for new NICs to speed up networks)
[#]: via: (https://www.networkworld.com/article/3443046/darpa-looks-for-new-nics-to-speed-up-networks.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

DARPA looks for new NICs to speed up networks
======
The creator of the Internet now looks to speed it up by unclogging network bottlenecks.
RVLsoft / Shulz / Getty Images

The government agency that gave us the Internet 50 years ago is now looking to drastically increase network speed to address bottlenecks and chokepoints for compute-intensive applications.

The Defense Advanced Research Projects Agency (DARPA), an arm of the Pentagon, has unveiled a computing initiative, one of many, that will attempt to overhaul the network stack and interfaces that cannot keep up with high-end processors and are often the choke point for data-driven applications.

[[Get regularly scheduled insights by signing up for Network World newsletters. ]][1]

The DARPA initiative, Fast Network Interface Cards, or FastNICs, aims to boost network performance by a factor of 100 through a clean-slate transformation of the network stack from the application to the system software layers running on top of steadily faster hardware. DARPA is soliciting proposals from networking vendors. .

**[ [Get certified as an Apple Technical Coordinator with this seven-part online course from PluralSight.][2] ]**

“The true bottleneck for processor throughput is the network interface used to connect a machine to an external network, such as an Ethernet, therefore severely limiting a processor’s data ingest capability,” said Dr. Jonathan Smith, a program manager in DARPA’s Information Innovation Office (I2O) in a statement.

“Today, network throughput on state-of-the-art technology is about 1014 bits per second (bps) and data is processed in aggregate at about 1014 bps. Current stacks deliver only about 1010 to 1011 bps application throughputs,” he added.

Advertisement

Many other elements of server design have seen leaps in performance, like memory, meshes, NVMe-over-Fabric, and PCI Express, but networking speed has been something of a laggard, getting minor bumps in speed and throughput by comparison. The fact is we’re still using Ethernet as our network protocol 56 years after Bob Metcalf invented it at Xerox PARC.

So DARPA’s program managers are using an approach that reworks existing network architectures. The FastNICs programs will select a challenge application and provide it with the hardware support it needs, operating system software, and application interfaces that will enable an overall system acceleration that comes from having faster NICs.

Researchers will design, implement, and demonstrate 10 Tbps network interface hardware using existing or road-mapped hardware interfaces. The hardware solutions must attach to servers via one or more industry-standard interface points, such as I/O buses, multiprocessor interconnection networks and memory slots to support the rapid transition of FastNICs technology.

“It starts with the hardware; if you cannot get that right, you are stuck. Software can’t make things faster than the physical layer will allow so we have to first change the physical layer,” said Smith.

The next step would be developing system software to manage FastNICs hardware. The open-source software based on at least one open-source OS would enable faster, parallel data transfer between network hardware and applications.

Details on the proposal can be found [here][3].

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3443046/darpa-looks-for-new-nics-to-speed-up-networks.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[3]: https://www.fbo.gov/index?s=opportunity&mode=form&id=fb5cfba969669de12025ff1ce2c99935&tab=core&_cview=1
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
