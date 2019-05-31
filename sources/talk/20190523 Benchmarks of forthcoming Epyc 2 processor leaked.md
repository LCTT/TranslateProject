[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Benchmarks of forthcoming Epyc 2 processor leaked)
[#]: via: (https://www.networkworld.com/article/3397081/benchmarks-of-forthcoming-epyc-2-processor-leaked.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Benchmarks of forthcoming Epyc 2 processor leaked
======
Benchmarks of AMD's second-generation Epyc server briefly found their way online and show the chip is larger but a little slower than the Epyc 7601 on the market now.
![Gordon Mah Ung][1]

Benchmarks of engineering samples of AMD's second-generation Epyc server, code-named “Rome,” briefly found their way online and show a very beefy chip running a little slower than its predecessor.

Rome is based on the Zen 2 architecture, believed to be more of an incremental improvement over the prior generation than a major leap. It’s already known that Rome would feature a 64-core, 128-thread design, but that was about all of the details.

**[ Also read:[Who's developing quantum computers][2] ]**

The details came courtesy of SiSoftware's Sandra PC analysis and benchmarking tool. It’s very popular and has been used by hobbyists and benchmarkers alike for more than 20 years. New benchmarks are uploaded to the Sandra database all the time, and what I suspect happened is someone running a Rome sample ran the benchmark, not realizing the results would be uploaded to the Sandra database.

The benchmarks were from two different servers, a Dell PowerEdge R7515 and a Super Micro Super Server. The Dell product number is not on the market, so this would indicate a future server with Rome processors. The entry has since been deleted, but several sites, including the hobbyist site Tom’s Hardware Guide, managed to [take a screenshot][3].

According to the entry, the chip is a mid-range processor with a base clock speed of 1.4GHz, jumping up to 2.2GHz in turbo mode, with 16MB of Level 2 cache and 256MB of Level 3 cache, the latter of which is crazy. The first-generation Epyc had just 32MB of L3 cache.

That’s a little slower than the Epyc 7601 on the market now, but when you double the number of cores in the same space, something’s gotta give, and in this case, it’s electricity. The thermal envelope was not revealed by the benchmark. Previous Epyc processors ranged from 120 watts to 180 watts.

Sandra ranked the processor at #3 for arithmetic and #5 for multimedia processing, which makes me wonder what on Earth beat the Rome chip. Interestingly, the servers were running Windows 10, not Windows Server 2019.

**[[Get certified as an Apple Technical Coordinator with this seven-part online course from PluralSight.][4] ]**

Rome is expected to be officially launched at the massive Computex trade show in Taiwan on May 27 and will begin shipping in the third quarter of the year.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3397081/benchmarks-of-forthcoming-epyc-2-processor-leaked.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/11/rome_2-100779395-large.jpg
[2]: https://www.networkworld.com/article/3275385/who-s-developing-quantum-computers.html
[3]: https://www.tomshardware.co.uk/amd-epyc-rome-processor-data-center,news-60265.html
[4]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
