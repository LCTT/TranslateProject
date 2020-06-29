[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Ampere announces 128-core Arm server processor)
[#]: via: (https://www.networkworld.com/article/3564514/ampere-announces-128-core-arm-server-processor.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Ampere announces 128-core Arm server processor
======
New chip will be socket-compatible with the 80-core Ampere CPU now on the market.
cloud

Ampere – the semiconductor startup founded by former Intel executive Renee James and not to be confused with the new line of Nvidia cards – just introduced a 128-core, Arm-based server processor to complement its 80-core part.

The new processor, Altra Max, comes just three months after the company launched its first product, the 80-core Altra. Ampere says the new processor will be fully socket compatible with the existing part so customers can just do a chip swap if they want.

[][1] Ampere

"This is not replacing Altra," says Jeff Wittich, senior vice president of products at Ampere and one of many ex-Intel executives at Ampere. "I expect there will be workloads and customers who will use Altra and Altra Max together for a long time. Anything suited for Max will be suited for Altra for a long time."

Ampere is targeting the cloud in the broadest sense possible, from public cloud to hybrid and private, on-premises cloud. Ampere cited IDC research that predicts 80% of workloads will move to containers and microservices by 2023. That requires predictable performance, higher core density, and power efficiency, which Ampere feels it has in the Altra design.

While Intel and AMD have gone with hyperthreading, allowing for two threads per core, Ampere went for single-threaded cores. Ampere says that as it adds cores, performance scales linearly, according to the [Stress-NG][2] benchmark.

"You'd think everyone must scale [as they add cores], but they don't. AMD gets bottlenecked from system level functions. A thread is not the same as a core. You are sharing resources among multiple threads. Scalability was the prime reason we went with single-threaded cores," Wittich says.

Along with the Altra Max news, Ampere took the wraps off many new processors that make up the Altra family. It had talked about an 80-core chip, when in fact Ampere has four 80-core processors ranging in speed from 2.6Ghz to 3.3Ghz and thermal dynamic power (TDP) from 150 to 250 watts.

The company also has one 72-core part, four 64-core parts in a range of clock speeds and TDPs, plus a 48-core and two 32-core parts. All 11 processors support up to eight channels of DDR4-3200 ECC memory and a maximum capacity up to 4TB plus up to 128 lanes of high-speed PCIe 4.0 lanes per socket.

Ampere is slowly lining up OEM partners. One of them is Phoenics Electronics, a semiconductor and board distributor owned by Avnet, which will offer Ampere servers in the coming months. Wittich described Phoenics Electronics as a specialist in low-volume sales for businesses that only want five or 10 custom servers, as opposed to the OEMs selling hundreds of thousands of identical boxes to hyperscalars.

Throughout our talk, Wittich cited Intel and AMD as competitors and not fellow Arm server vendors Marvell (with ThunderX2) and Fujitsu (with the [A64fx][3]). As to Fujitsu, "they are in HPC, which has different performance specs, a different architecture, and a different software stack. That is not where our focus us. They are not playing in cloud, we’re not in HPC," Wittich says.

Now Marvell does play in cloud, but Wittich says "we have additional performance over ThunderX2; we’ll see what they come up with with the [ThunderX3][4] in 2021."

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3564514/ampere-announces-128-core-arm-server-processor.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2020/06/ampere_altra_chip_cap_merged-r-100850276-orig.jpg
[2]: https://manpages.ubuntu.com/manpages/artful/man1/stress-ng.1.html
[3]: https://www.networkworld.com/article/3545816/fujitsu-delivers-exascale-supercomputer-that-you-can-soon-buy.html
[4]: https://www.networkworld.com/article/3533355/marvell-announces-96-core-thunderx3-arm-server-processor.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
