[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intel formally launches Optane for data center memory caching)
[#]: via: (https://www.networkworld.com/article/3387117/intel-formally-launches-optane-for-data-center-memory-caching.html#tk.rss_all)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Intel formally launches Optane for data center memory caching
======

### Intel formally launched the Optane persistent memory product line, which includes 3D Xpoint memory technology. The Intel-only solution is meant to sit between DRAM and NAND and to speed up performance.

![Intel][1]

As part of its [massive data center event][2] on Tuesday, Intel formally launched the Optane persistent memory product line. It had been out for a while, but the current generation of Xeon server processors could not fully utilize it. The new Xeon 8200 and 9200 lines take full advantage of it.

And since Optane is an Intel product (co-developed with Micron), that means AMD and Arm server processors are out of luck.

As I have [stated in the past][3], Optane DC Persistent Memory uses 3D Xpoint memory technology that Intel developed with Micron Technology. 3D Xpoint is a non-volatile memory type that is much faster than solid-state drives (SSD), almost at the speed of DRAM, but it has the persistence of NAND flash.

**[ Read also:[Why NVMe? Users weigh benefits of NVMe-accelerated flash storage][4] and [IDC’s top 10 data center predictions][5] | Get regularly scheduled insights [Sign up for Network World newsletters][6] ]**

The first 3D Xpoint products were SSDs called Intel’s ["ruler,"][7] because they were designed in a long, thin format similar to the shape of a ruler. They were designed that way to fit in 1u server carriages. As part of Tuesday’s announcement, Intel introduced the new Intel SSD D5-P4326 'Ruler' SSD, using four-cell or QLC 3D NAND memory, with up to 1PB of storage in a 1U design.

Optane DC Persistent Memory will be available in DIMM capacities of 128GB on up to 512GB initially. That’s two to four times what you can get with DRAM, said Navin Shenoy, executive vice president and general manager of Intel’s Data Center Group, who keynoted the event.

“We expect system capacity in a server system to scale to 4.5 terabytes per socket or 36 TB in an 8-socket system. That’s three times larger than what we were able to do with the first-generation of Xeon Scalable,” he said.

## Intel Optane memory uses and speed

Optane runs in two different modes: Memory Mode and App Direct Mode. Memory mode is what I have been describing to you, where Optane memory exists “above” the DRAM and acts as a cache. In App Direct mode, the DRAM and Optane DC Persistent Memory are pooled together to maximize the total capacity. Not every workload is ideal for this kind of configuration, so it should be used in applications that are not latency-sensitive. The primary use case for Optane, as Intel is promoting it, is Memory Mode.

**[[Get certified as an Apple Technical Coordinator with this seven-part online course from PluralSight.][8] ]**

When 3D Xpoint was initially announced a few years back, Intel claimed it was 1,000 times faster than NAND, with 1000 times the endurance, and 10 times the density potential of DRAM. Well that was a little exaggerated, but it does have some intriguing elements.

Optane memory, when used in 256B contiguous 4 cacheline, can achieve read speeds of 8.3GB/sec and write speeds of 3.0GB/sec. Compare that with the read/write speed of 500 or so MB/sec for a SATA SSD, and you can see the performance gain. Optane, remember, is feeding memory, so it caches frequently accessed SSD content.

This is the key takeaware of Optane DC. It will keep very large data sets very close to memory, and hence the CPU, with low latency while at the same time minimizing the need to access the slower storage subsystem, whether it’s SSD or HDD. It now offers the possibility of putting multiple terabytes of data very close to the CPU for much faster access.

## One challenge with Optane memory

The only real challenge is that Optane goes into DIMM slots, which is where memory goes. Now some motherboards come with as many as 16 DIMM slots per CPU socket, but that’s still board real estate that the customer and OEM provider will need to balance out: Optane vs. memory. There are some Optane drives in PCI Express format, which alleviate the memory crowding on the motherboard.

3D Xpoint also offers higher endurance than traditional NAND flash memory due to the way it writes data. Intel promises a five-year warranty with its Optane, while a lot of SSDs offer only three years.

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3387117/intel-formally-launches-optane-for-data-center-memory-caching.html#tk.rss_all

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/06/intel-optane-persistent-memory-100760427-large.jpg
[2]: https://www.networkworld.com/article/3386142/intel-unveils-an-epic-response-to-amds-server-push.html
[3]: https://www.networkworld.com/article/3279271/intel-launches-optane-the-go-between-for-memory-and-storage.html
[4]: https://www.networkworld.com/article/3290421/why-nvme-users-weigh-benefits-of-nvme-accelerated-flash-storage.html
[5]: https://www.networkworld.com/article/3242807/data-center/top-10-data-center-predictions-idc.html#nww-fsb
[6]: https://www.networkworld.com/newsletters/signup.html#nww-fsb
[7]: https://www.theregister.co.uk/2018/02/02/ruler_and_miniruler_ssd_formats_look_to_banish_diskstyle_drives/
[8]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
