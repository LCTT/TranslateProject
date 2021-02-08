[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Data centers in 2020: Automation, cheaper memory)
[#]: via: (https://www.networkworld.com/article/3487684/data-centers-in-2020-automation-cheaper-memory.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Data centers in 2020: Automation, cheaper memory
======
As data centers grow in 2020, enterprises will refine the balance between on-premises and cloud resources, adopt AI on servers and try to manage data sprawl effectively.
[Arthur Ogleznev / Unsplash][1] [(CC0)][2]

It’s that time of year again when those of us in the press make our annual prognostications for the coming year. Some things we saw coming; the rise of the cloud and the advance of SSD. Others, like the return of many cloud migrations to on-premises or the roaring comeback of AMD, went right by us. We do our best but occasionally there are surprises.

So with that, let’s take a peek into the always cloudy (no pun intended) crystal ball and make 10 data-center-oriented predictions.

### IoT spawns data-center growth in urban areas

This isn’t a hard prediction to make since it’s already happening. For the longest time, [data centers][3] were placed in the middle of nowhere near renewable energy (usually hydro), but need is going to force more expansion in major metro areas. [IoT][3] will be one driver but so will the increasing use of data center providers like Equinix and DRT as interconnection providers.

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

### Rise of network accelerators

Big Data and artificial intelligence of all flavors mean enormous amounts of data, and not all of it can be found in one place. Add to it that for now, CPUs are required to power network traffic controllers, thus taking them away from their main job of crunching data.

So you will see more and more network accelerators coming to market like Mellanox’s [ConnectX line][5] to let CPUs do the job of processing data and accelerators do the job of moving around massive amounts of data faster than is done now.

### NVMe over fabrics grows

Non-volatile memory express ([NVMe][6]) is a storage interface, like serial advanced technology attachment (SATA). The downside of SATA is that its legacy is in hard disks so it fails to take full advantage of the speed and parallelism of [SSD][7]s. But early enterprise SSDs had a problem: They could only talk to the physical server in which they were installed. Either that or a server needed storage arrays, which meant network hops, which meant latency.

NVMe over fabrics ([NVMeoF][8]) is an important advance. It lets an SSD in one server communicate over the network to another drive somewhere else on the network. This direct communication will be vital for improved data movement in enterprise computing and digital transformation.

  * [Backup vs. archive: Why it’s important to know the difference][9]
  * [How to pick an off-site data-backup method][10]
  * [Tape vs. disk storage: Why isn’t tape dead yet?][11]
  * [The correct levels of backup save time, bandwidth, space][12]



### Cheaper storage-class memory

Storage-class memory is memory that goes in a DRAM slot and can function like DRAM but can also function like an SSD. It has near-DRAM-like speed but has storage capabilities, too, effectively turning it into a cache for SSD.

Intel and Micron were working on SCM together but parted company. Intel released its SCM product, [Optane][13], in May, and Micron came to market in October with QuantX. South Korean memory giant SK Hynix is also working on a SCM product that’s different from the 3D XPoint technology Micron and Intel use as well.

All of this should do wonders to advance the technology and hopefully bring the price down. Right now a 512GB stick of Optane runs an insane $8,000. Granted, Xeons sell for even more than that, but after a while it becomes prohibitively expensive to assemble a fully decked-out server. Advancement of the technology and competition should lower prices, which will make this class of memory more attractive to enterprises.

### AI automation on brand-name servers

All of the server vendors are adding AI to their systems but Oracle is really taking the lead with its autonomous everything, from the hardware through OS and application and middleware stack. HPE, Dell, and Lenovo will continue to make their own advances as well but the hyperscale-server vendors like Inspur and Supermicro will lag because they have only the hardware stack and have done next to nothing in the OS space. They also are lagging in storage, something the big-three server vendors excel at.

Oracle may not be a top-five server vendor, but no one can ignore what they are doing in the automation space. Expect the other brand name-vendors to provide their own increasing levels of automation.

### Cloud migrations slow

Remember when everyone was looking forward to shutting down their data centers entirely and moving to the cloud? So much for that idea. IDC’s latest CloudPulse survey suggests that 85% of enterprises plan to move workload from public to private environments over the next year. And a recent survey by Nutanix found 73% of respondents reported that they are moving some applications off the public cloud and back on-prem. Security was cited as the primary reason.

And since it’s doubtful security will ever be good enough for some companies and some data, it seems the mad rush to the cloud will likely slow a little as people become more picky about what they put in the cloud and what they keep behind their firewall.

### Data sprawl, Part 1

Most data is not where it should be, according to IDC. Only 10% of corporate data is “hot” –  data that is repeatedly accessed and used – while 30% is “warm ” – used semi-regularly – and the other 60% belongs in cold storage where it is rarely if ever accessed.

But the problem is that data is scattered all over the place and often in the wrong tier. Many storage firms have focused on deduplication but not on storage tiers. A startup called Spectra Logic is targeting that very problem, and I suspect it won’t be the last firm to make such an effort. If it really takes off, I expect HPE and Dell to lock horns over the company, too.

### Data sprawl, Part 2

IDC [predicts][14] the total global data haul to weigh in at 175 zettabytes by 2025, and we are already at 32ZB of data, much of it useless. There was a time when data warehousing ruled that data was sorted and processed and stored as something useful. Now people fill data lakes with an endless supply of data from a growing number of sources, like social media and IoT.

Sooner or later, something will have to give. People will take a look at petabytes of data-lake junk and say enough is enough and start to become considerably more picky about what they store. They will question the rationale behind spending a fortune on hard disks and storage arrays to store vast quantities of unused and valueless data. The pendulum will swing back to the data-warehouse model of keeping usable data. It has to or people will be overwhelmed.

### More servers with a mix of processors

Ten years ago, it didn’t matter if your definition of a server was a single-socket Xeon tower sitting under a desk or four-socket rack-mount in a seven-foot cabinet, they were defined by an x86 processor. But now we are seeing more server designs with on-board GPUs, Arm processors, AI accelerators, and network accelerators.

This will require some changes in server designs. First, liquid cooling will become more necessary with this multitude of chips running faster and hotter and in an enclosed space. Second, the software stack will need to be more robust to handle all these chips, requiring some work on the part of Microsoft and the Linux distros.

### IT workload will change

Don’t think that automation means you can sit around playing games on your iPhone. Thanks to their ever-evolving systems, IT pros will have a bunch of new headaches including:

  * Combating shadow IT
  * Addressing digital transformation
  * Developing AI strategies to keep up with competitors
  * Reacting appropriately to the fallout from new AI strategies
  * Maintaining security governance across the company
  * Handling an increasing inflow of data and figuring out what to do with it
  * Responding faster than ever to customers and to company reputation on social media



Join the Network World communities on [Facebook][15] and [LinkedIn][16] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3487684/data-centers-in-2020-automation-cheaper-memory.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/rWDumHFt8E8
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.networkworld.com/article/3433924/mellanox-introduces-smartnics-to-eliminate-network-load-on-cpus.html
[6]: https://www.networkworld.com/article/3280991/what-is-nvme-and-how-is-it-changing-enterprise-storage.html
[7]: https://www.networkworld.com/article/3326058/what-is-an-ssd.html
[8]: https://www.networkworld.com/article/3394296/nvme-over-fabrics-creates-data-center-storage-disruption.html
[9]: https://www.networkworld.com/article/3285652/storage/backup-vs-archive-why-its-important-to-know-the-difference.html
[10]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[11]: https://www.networkworld.com/article/3315156/storage/tape-vs-disk-storage-why-isnt-tape-dead-yet.html
[12]: https://www.networkworld.com/article/3302804/storage/the-correct-levels-of-backup-save-time-bandwidth-space.html
[13]: https://www.networkworld.com/article/3279271/intel-launches-optane-the-go-between-for-memory-and-storage.html
[14]: https://www.networkworld.com/article/3325397/idc-expect-175-zettabytes-of-data-worldwide-by-2025.html
[15]: https://www.facebook.com/NetworkWorld/
[16]: https://www.linkedin.com/company/network-world
