[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Dell EMC launches GPU-loaded machine learning server)
[#]: via: (https://www.networkworld.com/article/3393163/dell-emc-launches-gpu-loaded-machine-learning-server.html#tk.rss_all)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Dell EMC launches GPU-loaded machine learning server
======
Dell EMC packs up to 10 Nvidia Tesla V100 GPUs into a 4U unit for massive machine learning processing.
![Thinkstock][1]

The latest news from Dell Technologies World is a high-end machine learning server for the data center that has four, eight, or even 10 Nvidia Tesla V100 GPUs for processing power.

The Dell EMC DSS 8440 is a two-socket server with two of the new Xeon Scalable processors and is specifically designed for machine learning applications and other demanding workloads. Each Tesla is capable of more than 100 teraflops, so the 10 GPU machine is one petaflop of processing power. Dell claims the DSS 8440 is almost on par with performance by the DGX-1, which is also Tesla-powered.

**[ Read also:[What is quantum computing (and why enterprises should care)][2] ]**

Obviously this is not a machine for beginners. That would be Dell EMC’s 740 and 7425 servers, which support up to three GPUs, and the 4140, which supports up to four GPU cards.

The DSS 8440 can support up to 10 2.5-in. devices, which translates to up to 32 terabytes of NVMe storage. It’s built on a high-performance switched PCIe fabric for rapid I/O. This allows it to use accelerators, storage, and network cards from other vendors.

Machine learning involves two distinctly different workloads: training and inference. The initial release of the DSS 8440 is specifically targeted at complex, training workloads. Training for complex workloads such as image recognition, facial recognition, and natural language translation is the hard part and requires the bulk of computing.

Training a model is done by iteration, where you runs massive amounts of data through a weighted, multi-layered algorithm thousands of times, compare it to a specifically targeted outcome and iteratively adjusting the model/weights to ultimately result in a “trained” model.

For example, training image recognition to recognize a cat or a car would involve thousands of training images. Once the model is trained, the inference (the question of is this image a cat or a car or not) is much easier and requires much less processing power.

**[[Get certified as an Apple Technical Coordinator with this seven-part online course from PluralSight.][3] ]**

And Dell EMC isn’t done pumping up this server. It has partnered with a start-up accelerator company called Graphcore to develop machine learning-specific, graph-based technology for inference workloads. Future versions of the DSS 8440 will come with the Graphcore processor, although for now it has no release date.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3393163/dell-emc-launches-gpu-loaded-machine-learning-server.html#tk.rss_all

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/02/artificial_intelligence_automation_digital_brain_thinkstock_875595818-100749926-large.jpg
[2]: https://www.networkworld.com/article/3275367/what-s-quantum-computing-and-why-enterprises-need-to-care.html
[3]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
