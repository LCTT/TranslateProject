Linux：称霸超级计算机系统
================================================================================
![Credit: Michel Ngilen, CC BY 2.0, via Wikimedia Commons](http://images.techhive.com/images/article/2015/08/playstation_3-100602985-primary.idge.jpg)
首图来源：By Michel Ngilen,[ CC BY 2.0 ], via Wikimedia Commons 

> 几乎所有超级计算机上运行的系统都是Linux，其中包括那些由树莓派（Raspberry Pi）板和PlayStation 3游戏机板组成的计算机。

超级计算机是很正经的工具，目的是做严肃的计算。它们往往从事于严肃的追求，比如原子弹的模拟，气候模拟和高级物理学。当然，它们也需要大笔资金的投资。在最新的超级计算机[500强][1]排名中，中国国防科大研制的天河2号位居第一。天河2号耗资约3.9亿美元。

但是，也有一个超级计算机,是由博伊西州立大学电气和计算机工程系的一名在读博士Joshua Kiepert[用树莓派构建完成][2]的。其创建成本低于2000美元。

不，这不是我编造的。这是一个真实的超级计算机，由超频1GHz的[B型树莓派][3]ARM11处理器与VideoCore IV GPU组成。每个都配备了512MB的RAM，一对USB端口和1个10/100 BaseT以太网端口。

那么天河2号和博伊西州立大学的超级计算机有什么共同点？它们都运行Linux系统。世界最快的超级计算机[前500强中有486][4]个也同样运行的是Linux系统。这是20多年前就开始的一种覆盖。现在Linux开始建立于廉价的超级计算机。因为Kiepert的机器并不是唯一的预算数字计算机。

Gaurav Khanna,麻省大学达特茅斯分校的物理学副教授，创建了一台超级计算机仅用了[不足200的PlayStation3视频游戏机][5]。

PlayStation游戏机是由一个3.2 GHz的基于PowerPC的电源处理单元供电。每个都配有512M的RAM。你现在仍然可以花200美元买到一个，尽管索尼将在年底逐步淘汰它们。Khanna仅用16个PlayStation 3s构建了他第一台超级计算机，所以你也可以花费不到4000美元就拥有你自己的超级计算机。

这些机器可能是从玩具建成的，但他们不是玩具。Khanna已经用它做了严肃的天体物理学研究。一个白帽子黑客组织使用了类似的[PlayStation 3超级计算机在2008年破解了SSL的MD5哈希算法][6]。

两年后，美国空军研究实验室研制的[Condor Cluster，使用了1,760个索尼的PlayStation3的处理器][7]和168个通用的图形处理单元。这个低廉的超级计算机，每秒运行约500TFLOPs，或500万亿次浮点运算。

其他的一些便宜且适用于构建家庭超级计算机的构件包括，专业并行处理板比如信用卡大小[99美元的Parallella板][8]，以及高端显卡比如[Nvidia的 Titan Z][9] 以及[ AMD的 FirePro W9100][10].这些高端主板市场零售价约3000美元，被一些[英特尔极限大师赛世界锦标赛英雄联盟参赛][11]玩家觊觎能够赢得的梦想的机器，c[传说][12]这项比赛第一名能获得超过10万美元奖金。另一方面，一个人能够独自提供超过2.5TFLOPS，并且他们为科学家和研究人员提供了一个经济的方法，使得他们拥有自己专属的超级计算机。

作为Linux的连接，这一切都开始于1994年戈达德航天中心的第一个名为[Beowulf超级计算机][13]。

按照我们的标准，Beowulf不能算是最优越的。但在那个时期，作为第一台自制的超级计算机，其16英特尔486DX处理器和10Mbps的以太网总线，是伟大的创举。由[美国航空航天局承包人Don Becker和Thomas Sterling设计的Beowulf][14]，是第一个“制造者”超级计算机。它的“计算部件”486DX PCs，成本仅有几千美元。尽管它的速度只有一位数的浮点运算，[Beowulf][15]表明了你可以用商用现货（COTS）硬件和Linux创建超级计算机。

我真希望我参与创作了一部分，但是我1994年就离开了戈达德，开始了作为一名全职的科技记者的职业生涯。该死。

但是尽管我只是使用笔记本的记者，我依然能够体会到COTS和开源软件是如何永远的改变了超级计算机。我希望现在读这篇文章的你也能。因为，无论是Raspberry Pis集群，还是超过300万英特尔的Ivy Bridge和Xeon Phi芯片的庞然大物，几乎所有当代的超级计算机都可以追溯到Beowulf。

--------------------------------------------------------------------------------

via: 

作者：[Steven J. Vaughan-Nichols][a]
译者：[xiaoyu33](https://github.com/xiaoyu33)
校对：[校对者ID](https://github.com/校对者ID)

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
[12]:http://www.google.com/url?q=http%3A%2F%2Fen.intelextrememasters.com%2Fnews%2Fcheck-out-the-intel-extreme-masters-katowice-prize-money-distribution%2F&sa=D&sntz=1&usg=AFQjCNE6yoAGGz-Hpi2tPF4gdhuPBEckhQ
[13]:http://www.beowulf.org/overview/history.html
[14]:http://yclept.ucdavis.edu/Beowulf/aboutbeowulf.html
[15]:http://www.beowulf.org/
