有了 Linux，你就可以搭建自己的超级计算机
================================================================================

> 几乎所有超级计算机上运行的系统都是 Linux，其中包括那些由树莓派（Raspberry Pi）板卡和 PlayStation 3游戏机组成的计算机。

![Credit: Michel Ngilen, CC BY 2.0, via Wikimedia Commons](http://images.techhive.com/images/article/2015/08/playstation_3-100602985-primary.idge.jpg)

*题图来源：By Michel Ngilen,[ CC BY 2.0 ], via Wikimedia Commons*

超级计算机是一种严肃的工具，做的都是高大上的计算。它们往往从事于严肃的用途，比如原子弹模拟、气候模拟和高等物理学。当然，它们的花费也很高大上。在最新的超级计算机 [Top500][1] 排名中，中国国防科技大学研制的天河 2 号位居第一，而天河 2 号的建造耗资约 3.9 亿美元！

但是，也有一个超级计算机，是由博伊西州立大学电气和计算机工程系的一名在读博士 Joshua Kiepert [用树莓派构建完成][2]的，其建造成本低于2000美元。

不，这不是我编造的。它一个真实的超级计算机，由超频到 1GHz 的 [B 型树莓派][3]的 ARM11 处理器与 VideoCore IV GPU 组成。每个都配备了 512MB 的内存、一对 USB 端口和 1 个 10/100 BaseT 以太网端口。

那么天河 2 号和博伊西州立大学的超级计算机有什么共同点吗？它们都运行 Linux 系统。世界最快的超级计算机[前 500 强中有 486][4] 个也同样运行的是 Linux 系统。这是从 20 多年前就开始的格局。而现在的趋势是超级计算机开始由廉价单元组成，因为 Kiepert 的机器并不是唯一一个无所谓预算的超级计算机。

麻省大学达特茅斯分校的物理学副教授 Gaurav Khanna 创建了一台超级计算机仅用了[不足 200 台的 PlayStation3 视频游戏机][5]。

PlayStation 游戏机由一个 3.2 GHz 的基于 PowerPC 的 Power 处理器所驱动。每个都配有 512M 的内存。你现在仍然可以花 200 美元买到一个，尽管索尼将在年底逐步淘汰它们。Khanna 仅用了 16 个 PlayStation 3 构建了他第一台超级计算机，所以你也可以花费不到 4000 美元就拥有你自己的超级计算机。

这些机器可能是用玩具建成的，但他们不是玩具。Khanna 已经用它做了严肃的天体物理学研究。一个白帽子黑客组织使用了类似的 [PlayStation 3 超级计算机在 2008 年破解了 SSL 的 MD5 哈希算法][6]。

两年后，美国空军研究实验室研制的 [Condor Cluster，使用了 1760 个索尼的 PlayStation 3 的处理器][7]和168 个通用的图形处理单元。这个低廉的超级计算机，每秒运行约 500 TFLOP ，即每秒可进行 500 万亿次浮点运算。

其他的一些便宜且适用于构建家庭超级计算机的构件包括，专业并行处理板卡，比如信用卡大小的 [99 美元的 Parallella 板卡][8]，以及高端显卡，比如 [Nvidia 的 Titan Z][9] 和 [ AMD 的 FirePro W9100][10]。这些高端板卡的市场零售价约 3000 美元，一些想要一台梦幻般的机器的玩家为此参加了[英特尔极限大师赛：英雄联盟世界锦标赛][11]，要是甚至有机会得到了第一名的话，能获得超过 10 万美元奖金。另一方面，一个能够自己提供超过 2.5TFLOPS 计算能力的计算机，对于科学家和研究人员来说，这为他们提供了一个可以拥有自己专属的超级计算机的经济的方法。

而超级计算机与 Linux 的连接，这一切都始于 1994 年戈达德航天中心的第一个名为 [Beowulf 超级计算机][13]。

按照我们的标准，Beowulf 不能算是最优越的。但在那个时期，作为第一台自制的超级计算机，它的 16 个英特尔486DX 处理器和 10Mbps 的以太网总线，是个伟大的创举。[Beowulf 是由美国航空航天局的承建商 Don Becker 和 Thomas Sterling 所设计的][14]，是第一台“创客”超级计算机。它的“计算部件” 486DX PC，成本仅有几千美元。尽管它的速度只有个位数的 GFLOPS （吉拍，每秒10亿次）浮点运算，[Beowulf][15] 表明了你可以用商用现货（COTS）硬件和 Linux 创建超级计算机。

我真希望我参与创建了一部分，但是我 1994 年就离开了戈达德，开始了作为一名全职的科技记者的职业生涯。该死。

但是尽管我只是使用笔记本的记者，我依然能够体会到 COTS 和开源软件是如何永远的改变了超级计算机。我希望现在读这篇文章的你也能。因为，无论是 Raspberry Pi 集群，还是超过 300 万个英特尔的 Ivy Bridge 和 Xeon Phi 芯片的庞然大物，几乎所有当代的超级计算机都可以追溯到 Beowulf。

--------------------------------------------------------------------------------

via: http://www.computerworld.com/article/2960701/linux/for-linux-supercomputers-r-us.html

作者：[Steven J. Vaughan-Nichols][a]
译者：[xiaoyu33](https://github.com/xiaoyu33)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.computerworld.com/author/Steven-J.-Vaughan_Nichols/
[1]:http://www.top500.org/
[2]:http://www.zdnet.com/article/build-your-own-supercomputer-out-of-raspberry-pi-boards/
[3]:https://www.raspberrypi.org/products/model-b/
[4]:http://www.zdnet.com/article/linux-still-rules-supercomputing/
[5]:http://www.nytimes.com/2014/12/23/science/an-economical-way-to-save-progress.html?smid=fb-nytimes&smtyp=cur&bicmp=AD&bicmlukp=WT.mc_id&bicmst=1409232722000&bicmet=1419773522000&_r=4
[6]:http://www.computerworld.com/article/2529932/cybercrime-hacking/researchers-hack-verisign-s-ssl-scheme-for-securing-web-sites.html
[7]:http://phys.org/news/2010-12-air-playstation-3s-supercomputer.html
[8]:http://www.zdnet.com/article/parallella-the-99-linux-supercomputer/
[9]:http://blogs.nvidia.com/blog/2014/03/25/titan-z/
[10]:http://www.amd.com/en-us/press-releases/Pages/amd-flagship-professional-2014apr7.aspx
[11]:http://en.intelextrememasters.com/news/check-out-the-intel-extreme-masters-katowice-prize-money-distribution/

[13]:http://www.beowulf.org/overview/history.html
[14]:http://yclept.ucdavis.edu/Beowulf/aboutbeowulf.html
[15]:http://www.beowulf.org/
