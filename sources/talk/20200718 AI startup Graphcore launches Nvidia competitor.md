[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (AI startup Graphcore launches Nvidia competitor)
[#]: via: (https://www.networkworld.com/article/3567349/ai-startup-graphcore-launches-nvidia-competitor.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

AI startup Graphcore launches Nvidia competitor
======
Graphcore is putting its new AI processor, the Colossus MK2 IPU, up against Nvidia's Ampere A100 GPU.
kohb / Getty Images

A British chip startup has launched what it claims is the world's most complex AI chip, the Colossus MK2 or GC200 IPU (intelligence processing unit). [Graphcore][1] is positioning its MK2 against Nvidia's Ampere A100 GPU for AI applications.

The MK2 and its predecessor MK1 are designed specifically to handle very large machine-learning models. The MK2 processor has 1,472 independent processor cores and 8,832 separate parallel threads, all supported by 900MB of in-processor RAM.

**SEE ALSO:** [Nvidia unleashes new generation of GPU hardware][2]

[][3] Graphcore

Graphcore says the MK2 offers a 9.3-fold improvement in BERT-Large training performance over the MK1, a 8.5-fold improvement in BERT-3Layer inference performance, and a 7.4-fold improvement in EfficientNet-B3 training performance.

BERT, or Bidirectional Encoder Representations from Transformers, is a technique for natural language processing pre-training developed by Google for natural language-based searches.

And Graphcore isn't stopping at just offering a chip. For a relatively new startup (it formed in 2016), Graphcore has built a remarkable ecosystem around its chips. Most chip startups focus on just their silicon, but Graphcore offers a lot more.

It sells the GC200 through its new IPU-Machine M2000, which contains four GC200 chips in a 1U box and delivers 1 petaflop of total compute power, according to the company. Graphcore notes you can get started with a single IPU-Machine M2000 box directly connected to an existing x86 server or add up to a total of eight IPU-Machine M2000s connected to one server. For larger systems, it offers the IPU-POD64, comprising 16 IPU-Machine M2000s built into a standard 19-inch rack.

Connecting IPU-Machine M2000s and IPU-PODs at scale is done through Graphcore's new IPU-Fabric technology, which has been designed from the ground up for machine intelligence communication and delivers a dedicated low latency fabric that connects IPUs across the entire data center.

Graphcore's Virtual-IPU software integrates with workload management and orchestration software to serve many different users for training and inference, and it allows the available resources to be adapted and reconfigured from job to job.

The startup says its new hardware is completely plug-and-play, and that customers will be able to connect up to 64,000 IPUs together for a total of 16 exaFLOPs of computing power.

That's a BIG claim. Intel, Arm, AMD, Fujitsu, and Nvidia are still pushing toward one exaflop, and Graphcore is claiming 16 times that.

Another key element of Graphcore is its Poplar software stack designed from scratch with the IPU and fully integrated with standard machine learning frameworks, so developers can port existing models easily, and get up and running quickly in a familiar environment. For developers who want full control to exploit maximum performance from the IPU, Poplar enables direct IPU programming in Python and C++.

Graphcore has some significant early adopters of MK2 system, including the University of Oxford, the U.S. Department of Energy's Lawrence Berkeley National Laboratory, and J.P. Morgan, which is focused on natural language processing and speech recognition.

IPU-Machine M2000 and IPU-POD64 systems are available to pre-order today with full production volume shipments starting in Q4 2020. Early access customers are able to evaluate IPU-POD systems in the cloud through Graphcore's cloud partner Cirrascale. It plans to announce OEM and channel partner in the coming months.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3567349/ai-startup-graphcore-launches-nvidia-competitor.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.graphcore.ai/
[2]: https://www.networkworld.com/article/3543958/nvidia-unleashes-new-generation-of-gpu-hardware.html
[3]: https://images.idgesg.net/images/article/2020/07/ipu-machine-for-machine-intelligence-compute-100852152-orig.jpg
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
