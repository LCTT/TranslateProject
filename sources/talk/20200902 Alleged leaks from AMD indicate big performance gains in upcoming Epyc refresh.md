[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Alleged leaks from AMD indicate big performance gains in upcoming Epyc refresh)
[#]: via: (https://www.networkworld.com/article/3572334/alleged-leaks-from-amd-indicate-big-performance-gains-in-upcoming-epyc-refresh.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Alleged leaks from AMD indicate big performance gains in upcoming Epyc refresh
======
Next-gen Milan will see up to 20% better core performance while Genoa will change in other ways.
AMD

A German tech site claims to have internal AMD documents that show the next generation of AMD Epyc server processors will boast a significant performance gain. AMD declined to comment on the veracity of the article.

Hardwareluxx [posted][1] what it said were details from internal AMD slides revealing the performance potential of AMD's next-gen server processors, codenamed “Milan,” otherwise known as Zen 3, due to ship later this year.

According to the slides, Zen 3 is in many ways similar to the [Zen 2 generation (aka “Rome”)][2] currently on the market. It will be socket-compatible with the first and second generation of Epycs, so current owners can swap out the older chips for newer. It will have a maximum of 64 cores, which is the same as Rome. It will support DDR4 memory and PCI Express 4.0 interconnects, like Rome. One difference is that instead of two 16MB L3 caches, Milan will have one 32MB L3 cache.

WIth Milan, AMD focused on core performance improvements. The slides reportedly say that for Milan, single-threaded performance should increase by 20% in 32-core Rome processors and increase 10% to 15% in the 64-core Epyc.

The reason the 32-core chips are faster is because AMD can achieve a higher clock rate for processors with fewer cores. There likely will not be big jumps in the clock rate since Milan, like Rome, is made using the 7nm manufacturing process.

A performance increase of 10% to 20% over one generation is quite remarkable. Usually we get single-digit performance bumps from generation to generation. And it’s socket compatible, so there is no need for [Osborne Effec][3]t fears.

### Next Stop, Genoa

AMD is continuing its tour of Italy with Genoa, aka Zen 4, due in late 2021. If the internal slides are to be believed, this will be a disruptive release because of several

[[Get regularly scheduled insights by signing up for Network World newsletters.]][4]

notable jumps, starting with the move to 5nm production. The thermal design power (TDP) will increase from 225 watts in Rome and Milan to 240 watts for Genoa.

The roadmap indicates AMD plans to go to more than 64 cores for Genoa. It will continue to come with two threads per core, called SMT2. There is also talk of DDR5, support for Persistent Memory (NVDIMM-P) and PCI-Express 5.0. NVDIMM-P is basically Intel’s Optane for the rest of the industry.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3572334/alleged-leaks-from-amd-indicate-big-performance-gains-in-upcoming-epyc-refresh.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.hardwareluxx.de/index.php/news/hardware/prozessoren/53922-epyc-milan-mit-10-bis-20-leistungsplus-l3-cache-ueber-acht-kerne-und-ausblick-auf-genoa.html
[2]: https://www.networkworld.com/article/3319518/amd-continues-server-push-introduces-zen-2-architecture.html
[3]: https://en.wikipedia.org/wiki/Osborne_effect
[4]: https://www.networkworld.com/newsletters/signup.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
