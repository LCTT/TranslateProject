[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Revolutionary data compression technique could slash compute costs)
[#]: via: (https://www.networkworld.com/article/3392716/revolutionary-data-compression-technique-could-slash-compute-costs.html#tk.rss_all)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

Revolutionary data compression technique could slash compute costs
======
A new form of data compression, called Zippads, will create faster computer programs that could drastically lower the costs of computing.
![Kevin Stanchfield \(CC BY 2.0\)][1]

There’s a major problem with today’s money-saving memory compression used for storing more data in less space. The issue is that computers store and run memory in predetermined blocks, yet many modern programs function and play out in variable chunks.

The way it’s currently done is actually, highly inefficient. That’s because the compressed programs, which use objects rather than evenly configured slabs of data, don’t match the space used to store and run them, explain scientists working on a revolutionary new compression system called Zippads.

The answer, they say—and something that if it works would drastically reduce those inefficiencies, speed things up, and importantly, reduce compute costs—is to compress the varied objects and not the cache lines, as is the case now. Cache lines are fixed-size blocks of memory that are transferred to memory cache.

**[ Read also:[How to deal with backup when you switch to hyperconverged infrastructure][2] ]**

“Objects, not cache lines, are the natural unit of compression,” writes Po-An Tsai and Daniel Sanchez in their MIT Computer Science and Artificial Intelligence Laboratory (CSAIL) [paper][3] (pdf).

They say object-based programs — of the kind used now everyday, such as Python — should be compressed based on their programmed object size, not on some fixed value created by traditional or even state-of-the art cached methods.

The alternative, too, isn’t to recklessly abandon object-oriented programming just because it’s inefficient at using compression. One must adapt compression to that now common object-using code.

The scientists claim their new system can increase the compression ratio 1.63 times and improve performance by 17%. It’s the “first compressed memory hierarchy designed for object-based applications,” they say.

### The benefits of compression

Compression is a favored technique for making computers more efficient. The main advantage over simply adding more memory is that costs are lowered significantly—you don’t need to add increasing physical main memory hardware because you’re cramming more data into existing.

However, to date, hardware memory compression has been best suited to more old-school large blocks of data, not the “random, fine-grained memory accesses,” the team explains. It’s not great at accessing small pieces of data, such as words, for example.

### How the Zippads compression system works

In Zippads, as the new system is called, stored object hierarchical levels (called “pads”) are located on-chip and are directly accessed. The different levels (pads) have changing speed grades, with newly referenced objects being placed in the fastest pad. As a pad fills up, it begins the process of evicting older, not-so-active objects and ultimately recycles the unused code that is taking up desirable fast space and isn’t being used. Cleverly, at the fast level, the code parts aren’t even compressed, but as they prove their non-usefulness they get kicked down to compressed, slow-to-access, lower-importance pads—and are brought back up as necessary.

Zippads would “see computers that can run much faster or can run many more apps at the same speeds,” an[ MIT News][4] article says. “Each application consumes less memory, it runs faster, so a device can support more applications within its allotted memory.” Bandwidth is freed up, in other words.

“All computer systems would benefit from this,” Sanchez, a professor of computer science and electrical engineering, says in the article. “Programs become faster because they stop being bottlenecked by memory bandwidth.”

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3392716/revolutionary-data-compression-technique-could-slash-compute-costs.html#tk.rss_all

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/memory-100787327-large.jpg
[2]: https://www.networkworld.com/article/3389396/how-to-deal-with-backup-when-you-switch-to-hyperconverged-infrastructure.html
[3]: http://people.csail.mit.edu/poantsai/papers/2019.zippads.asplos.pdf
[4]: http://news.mit.edu/2019/hardware-data-compression-0416
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
