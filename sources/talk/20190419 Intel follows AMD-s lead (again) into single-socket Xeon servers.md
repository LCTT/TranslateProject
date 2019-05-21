[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intel follows AMD’s lead (again) into single-socket Xeon servers)
[#]: via: (https://www.networkworld.com/article/3390201/intel-follows-amds-lead-again-into-single-socket-xeon-servers.html#tk.rss_all)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Intel follows AMD’s lead (again) into single-socket Xeon servers
======
Intel's new U series of processors are aimed at the low-end market where one processor is good enough.
![Intel][1]

I’m really starting to wonder who the leader in x86 really is these days because it seems Intel is borrowing another page out of AMD’s playbook.

Intel launched a whole lot of new Xeon Scalable processors earlier this month, but they neglected to mention a unique line: the U series of single-socket processors. The folks over at Serve The Home sniffed it out first, and Intel has confirmed the existence of the line, just that they “didn’t broadly promote them.”

**[ Read also:[Intel makes a play for high-speed fiber networking for data centers][2] ]**

To backtrack a bit, AMD made a major push for [single-socket servers][3] when it launched the Epyc line of server chips. Epyc comes with up to 32 cores and multithreading, and Intel (and Dell) argued that one 32-core/64-thread processor was enough to handle many loads and a lot cheaper than a two-socket system.

The new U series isn’t available in the regular Intel [ARK database][4] listing of Xeon Scalable processors, but they do show up if you search. Intel says they are looking into that .There are two processors for now, one with 24 cores and two with 20 cores.

The 24-core Intel [Xeon Gold 6212U][5] will be a counterpart to the Intel Xeon Platinum 8260, with a 2.4GHz base clock speed and a 3.9GHz turbo clock and the ability to access up to 1TB of memory. The Xeon Gold 6212U will have the same 165W TDP as the 8260 line, but with a single socket that’s 165 fewer watts of power.

Also, Intel is suggesting a price of about $2,000 for the Intel Xeon Gold 6212U, a big discount over the Xeon Platinum 8260’s $4,702 list price. So, that will translate into much cheaper servers.

The [Intel Xeon Gold 6210U][6] with 20 cores carries a suggested price of $1,500, has a base clock rate of 2.50GHz with turbo boost to 3.9GHz and a 150 watt TDP. Finally, there is the 20-core Intel [Xeon Gold 6209U][7] with a price of around $1,000 that is identical to the 6210 except its base clock speed is 2.1GHz with a turbo boost of 3.9GHz and a TDP of 125 watts due to its lower clock speed.

**[[Get certified as an Apple Technical Coordinator with this seven-part online course from PluralSight.][8] ]**

All of the processors support up to 1TB of DDR4-2933 memory and Intel’s Optane persistent memory.

In terms of speeds and feeds, AMD has a slight advantage over Intel in the single-socket race, and Epyc 2 is rumored to be approaching completion, which will only further advance AMD’s lead.

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3390201/intel-follows-amds-lead-again-into-single-socket-xeon-servers.html#tk.rss_all

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/06/intel_generic_cpu_background-100760187-large.jpg
[2]: https://www.networkworld.com/article/3307852/intel-makes-a-play-for-high-speed-fiber-networking-for-data-centers.html
[3]: https://www.networkworld.com/article/3253626/amd-lands-dell-as-its-latest-epyc-server-processor-customer.html
[4]: https://ark.intel.com/content/www/us/en/ark/products/series/192283/2nd-generation-intel-xeon-scalable-processors.html
[5]: https://ark.intel.com/content/www/us/en/ark/products/192453/intel-xeon-gold-6212u-processor-35-75m-cache-2-40-ghz.html
[6]: https://ark.intel.com/content/www/us/en/ark/products/192452/intel-xeon-gold-6210u-processor-27-5m-cache-2-50-ghz.html
[7]: https://ark.intel.com/content/www/us/en/ark/products/193971/intel-xeon-gold-6209u-processor-27-5m-cache-2-10-ghz.html
[8]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
