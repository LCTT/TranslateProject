[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Ampere preps an 80-core Arm processor for the cloud)
[#]: via: (https://www.networkworld.com/article/3482248/ampere-preps-an-80-core-arm-processor-for-the-cloud.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Ampere preps an 80-core Arm processor for the cloud
======
A new Ampere chip due out next year is single-threaded to avoid the 'noisy neighbor' problem that can impede customer workloads in multi-tenant cloud-provider networks.
Thinkstock

[Ampere Computing][1], the semiconductor startup led by former Intel president Renee James that designs Arm-based server processors, is preparing to launch its next-generation CPU by mid-2020.

The upcoming chip will have 80 cores, much more than the 32-core processor the company shipped last year and vastly more than x86 CPUs by Intel and AMD. Ampere’s design is different. Instead of multiple threads per core, each core is single threaded.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][2]

Jeff Wittich, Ampere’s senior vice president of products, said that was by design, to avoid some of the CPU vulnerabilities that crept into x86 chips but also to avoid the “noisy neighbor” problem in cloud service-provider networks.

[][3]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][3]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Because of their many cores and threads, users of AWS and other cloud providers never get a CPU all to themselves unless they pay dearly for it. More often than not your instance is sharing CPU cycles with someone else, and if their app makes a lot of hits on the CPU cache, especially the L1 cache, it can impede your performance.

“We designed the product to be single-threaded and many cores to provide as much isolation as possible, with no sharing of threads,” he says. “We intentionally made the product single-threaded, so there is no sharing L1 cache or registers between threads.”

Ampere is specifically targeting cloud providers and hyperscale data-center operators, which includes the usual suspects – Google, Facebook, Amazon – and second-tier cloud providers as well and companies like Twitter and Uber. That may not be a lot of vendors but they buy in the tens if not hundreds of thousands of servers every quarter.

“We’re taking a different approach to this in that we have a product targeted at the cloud vs a product targeted at general data centers trying to shoehorn that into every workload,” he said. “The services and infrastructure architecture [hyperscalers] are deploying are totally different from what people were doing 15 to 20 years ago when x86 came in to play. Things like multi-tenant, quality of service, isolation, and manageability are what’s important now.”

He also notes that hyperscalers have spent the last 10 years optimizing their entire software stack, with custom Linux distributions and their own hypervisor. What they haven’t done is optimize or customize the CPU, because they can’t.

To that end, Ampere is operating like a software provider using Agile development techniques, which means an annual release of new CPUs, faster iterations than seen by Intel, AMD, and Marvell, which owns the Cavium line of Arm server processors. This means extensive simulation testing and less time updating and fixing actual silicon.

Wittich said each core has considerably more performant than the eMAG generation, but he was waiting for silicon to do actual benchmarks. Wittich declined to go into detail on the new processor, even on the product name, beyond that it would run at a TDW of 45 to 200 watts, come in single- and dual-socket designs, use PCI Express Gen 4 and eight channels of memory.

The new processor takes the company into workloads that do run in the cloud now, like database, storage, analytics, media, and machine-learning inference.

It has a few ODM wins so far, China’s Wiwynn and Lenovo and Gigabyte as well. While the company is targeting the public cloud providers it will go after the private cloud to a certain extent if there are opportunities “that make sense,” as he put it.

Silicon samples will be coming back this month and sent to partners before end of year. Taiwan’s TSMC is making the chips using 7nm designs. Wittich said the company is targeting mid-year 2020 for high-volume production.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3482248/ampere-preps-an-80-core-arm-processor-for-the-cloud.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3306447/a-new-arm-based-server-processor-challenges-for-the-data-center.html
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
