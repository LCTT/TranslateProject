[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Backblaze HDD report shows the resilience of hard disk drives)
[#]: via: (https://www.networkworld.com/article/3543989/backblaze-hdd-report-shows-the-resilience-of-hard-disk-drives.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Backblaze HDD report shows the resilience of hard disk drives
======
With an almost flawless failure rate despite constant use, mechanical drives still have a place in computing.
D3Damon / Getty Images

Given the continued growth in capacity and performance of enterprise SSDs, it would seem mechanical hard disk drives are set to fade out eventually. But if they do, it won't be any time soon. Cloud storage provider Backblaze’s [quarterly drive performance report][1] shows that hard disks have remarkable resilience despite the abuse they take.

Backblaze has storage pods in data center colocations that include more than 129,000 HDDs from various manufacturers, ranging in capacity from 4TB to 16TB. With that many drives deployed, Backblaze has a unique perspective on the durability of different hard drives.

Hard drives go through a specific lifecycle when they're put into service at Backblaze. Initially, data is written to the drives until they're almost full. Once the drives are full, most of the activity is reading and some file deletions. As files are deleted, the space is used to write more files. That last stage is how they operate for most of their lives, with some drives being busier than others. The workload is typically steady but not intense.

The company tracks the number of drives and failures from vendors and various capacities to come up with an estimated annualized failure rate (AFR), which is based on the equation (drive failures/drives days/366) * 100. Drive days represents the number of days the drives were operational during the period of observation, and Backblaze uses 366 because this year is a leap year.

As the chart shows, the AFR for Q1 2020 was 1.07%, which is the lowest AFR for any quarter since Backblaze started keeping track of failures in 2013 (and back then it had much fewer drives).

[][2] Backblaze

"Hard drives are amazing pieces of technology produced on a large scale that can reliably store and retrieve a gigabyte of data for about $0.02. The fact that inside a single hard drive there could be 8 platters spinning at a rate of 60 times per second, each with a head so close to the platter that a fingerprint could cause it to crash, and regularly reading and writing data for an entire year with a mere 1% failure rate is nothing short of science fiction," Backblaze CEO Gleb Budman told me via email.

Across the board, the Backblaze-measured AFR is insanely low.

Looking at specific vendors, HGST (which is owned by Western Digital) was the most reliable brand. Out of 29,047 HGST drives deployed, just 27 died, for a failure rate of 0.09%. Seagate, with 93,398 deployed and 292 drive deaths, had a failure rate of 0.31%. But Budman likes both brands.

"Statistically, some drives are just more reliable – at least we see them in our use case – but all the drives are quite impressive," he says.

On a device basis, the highest failure percentage was the Seagate 12TB at 1.41%, which equates to just 29 failures out of 10,876 drives. 

Anecdotally, I've seen more complaints on hobbyist and home builder boards about Seagate drives than any other brand and had more than a few Seagates brick on me as well. And while the chart shows Seagate drives had a higher failure rate than HGST drives, we're talking about less than 1% failure.

Looking ahead, Backblaze will be adding 16TB drives from Toshiba to test, so despite Toshiba's modest presence in the most recent report, it is not going away. Budman says they are not phasing out Toshiba; its gear has simply been available in more limited quantities in the past.

HDDs aren't going away either. SSDs are growing in use, but they still cannot match a hard disk for affordable capacity. Last year Micron released a 15TB SSD at the princely cost of $2,770. A Seagate 16TB HDD costs $500. Reliability and affordability ensure HDDs will be around for the foreseeable future.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3543989/backblaze-hdd-report-shows-the-resilience-of-hard-disk-drives.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.backblaze.com/blog/backblaze-hard-drive-stats-q1-2020/
[2]: https://images.idgesg.net/images/article/2020/05/backblazechart-100842524-orig.jpg
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
