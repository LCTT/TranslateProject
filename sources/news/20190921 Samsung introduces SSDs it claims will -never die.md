[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Samsung introduces SSDs it claims will 'never die')
[#]: via: (https://www.networkworld.com/article/3440026/samsung-introduces-ssds-it-claims-will-never-die.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Samsung introduces SSDs it claims will 'never die'
======
New fail-in-place technology in Samsung's SSDs will allow the chips to gracefully recover from chip failure.
Samsung

[Solid-state drives][1] (SSDs) operate by writing to cells within the chip, and after so many writes, the cell eventually dies off and can no longer be written to. For that reason, SSDs have more actual capacity than listed. A 1TB drive, for example, has about 1.2TB of capacity, and as chips die off from repeated writes, new ones are brought online to keep the 1TB capacity.

But that's for gradual wear. Sometimes SSDs just up and die completely, and without warning after a whole chip fails, not just a few cells. So Samsung is trying to address that with a new generation of SSD memory chips with a technology it calls fail-in-place (FIP).

**Also read: [Inside Hyperconvergence: Combining compute, storage and networking][2]**

FIP technology allows a drive to cope with a failure by working around the dead chip and allowing the SSD to keep operating and just not using the bad chip. You will have less storage, but in all likelihood that drive will be replaced anyway, so this helps prevent data loss.

FIP also scans the data for any damage before copying it to the remaining NAND, which would be the first time I've ever seen a SSD with built-in data recovery.

### Built-in virtualization and machine learning technology

The new Samsung SSDs come with two other software innovations. The first is built-in virtualization technology, which allows a single SSD to be divided up into up to 64 smaller drives for a virtual environment.

The second is V-NAND machine learning technology, which helps to "accurately predict and verify cell characteristics, as well as detect any variation among circuit patterns through big data analytics," as Samsung put it. Doing so means much higher levels of performance from the drive.

As you can imagine, this technology is aimed at enterprises and large-scale data centers, not consumers. All told, Samsung is launching 19 models of these new SSDs called under the names PM1733 and PM1735.

**[ [Get certified as an Apple Technical Coordinator with this seven-part online course from PluralSight.][3] ]**

The PM1733 line features six models in a 2.5-inch U.2 form factor, offering storage capacity of between 960GB and 15.63TB, as well as four HHHL card-type drives with capacity ranging from 1.92TB to 30.72TB of storage. Each drive is guaranteed for one drive writes per day (DWPD) for five years. In other words, the warranty is good for writing the equivalent of the drive's total capacity once per day every day for five years.

The PM1735 drives have lower capacity, maxing out at 12.8TB, but they are far more durable, guaranteeing three DWPD for five years. Both drives support PCI Express 4, which has double the throughput of the widely used PCI Express 3. The PM1735 offers nearly 14 times the sequential performance of a SATA-based SSD, with 8GB/s for read operations and 3.8GB/s for writes.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3440026/samsung-introduces-ssds-it-claims-will-never-die.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3326058/what-is-an-ssd.html
[2]: https://www.idginsiderpro.com/article/3409019/inside-hyperconvergence-combining-compute-storage-and-networking.html
[3]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
