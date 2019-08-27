[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Semiconductor startup Cerebras Systems launches massive AI chip)
[#]: via: (https://www.networkworld.com/article/3433617/semiconductor-startup-cerebras-systems-launches-massive-ai-chip.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Semiconductor startup Cerebras Systems launches massive AI chip
======

![Cerebras][1]

There are a host of different AI-related solutions for the data center, ranging from add-in cards to dedicated servers, like the Nvidia DGX-2. But a startup called Cerebras Systems has its own server offering that relies on a single massive processor rather than a slew of small ones working in parallel.

Cerebras has taken the wraps off its Wafer Scale Engine (WSE), an AI chip that measures 8.46x8.46 inches, making it almost the size of an iPad and more than 50 times larger than a CPU or GPU. A typical CPU or GPU is about the size of a postage stamp.

[Now see how AI can boost data-center availability and efficiency.][2]

Cerebras won’t sell the chips to ODMs due to the challenges of building and cooling such a massive chip. Instead, it will come as part of a complete server to be installed in data centers, which it says will start shipping in October.

The logic behind the design is that AI requires huge amounts of data just to run a test and current technology, even GPUs, are not fast or powerful enough. So Cerebras supersized the chip.

The numbers are just incredible. The company’s WSE chip has 1.2 trillion transistors, 400,000 computing cores and 18 gigabytes of memory. A typical PC processor has about 2 billion transistors, four to six cores and a few megabytes of cache memory. Even a high-end GPU has 21 billion transistors and a few thousand cores.

The 400,000 cores on the WSE are connected via the Swarm communication fabric in a 2D mesh with 100 Pb/s of bandwidth. The WSE has 18 GB of on-chip memory, all accessible within a single clock cycle, and provides 9 PB/s memory bandwidth. This is 3000x more capacity and 10,000x greater bandwidth than the best Nvidia has to offer. More to the point it eliminates the need to move data in and out of memory to and from the CPU.

“A vast array of programmable cores provides cluster-scale compute on a single chip. High-speed memory close to each core ensures that cores are always occupied doing calculations. And by connecting everything on-die, communication is many thousands of times faster than what is possible with off-chip technologies like InfiniBand,” the company said in a [blog post][3] announcing the processor.

The cores are called Sparse Linear Algebra Cores, or SLA. They are optimized for the sparse linear algebra that is fundamental to neural network calculation. These cores are designed specifically for AI work. They are small and fast, contain no caches, and have eliminated other features and overheads that are needed in general purpose cores but play no useful role in a deep learning processor.

The chip is the brainchild of Andrew Feldman, who created the SeaMicro high density Atom-based server a decade ago as an alternative to overpowered Xeons for doing simple tasks like file and print or serving LAMP stacks. Feldman is a character, one of the more interesting people [I’ve interviewed][4]. He definitely thinks outside the box.

Feldman sold SeaMicro to AMD for $334 million in 2012, which turned out to be a colossal waste of money on AMD’s part, as the product shortly disappeared from the market. Since then he’s raised $100 million in VC money.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3433617/semiconductor-startup-cerebras-systems-launches-massive-ai-chip.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/08/cerebras-wafer-scale-engine-100809084-large.jpg
[2]: https://www.networkworld.com/article/3274654/ai-boosts-data-center-availability-efficiency.html
[3]: https://www.cerebras.net/hello-world/
[4]: https://www.serverwatch.com/news/article.php/3887471/SeaMicro-Launches-an-AtomPowered-Cloud-Computing-Server.htm
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
