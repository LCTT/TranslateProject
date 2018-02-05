Linux “完全统治” 了超级计算机
============================================================

> 它终于发生了。如今，全世界超算 500 强全部都运行着 Linux。

Linux 统治了超级计算。自 1998 年以来，这一天终于到来了，那时候 Linux 首次出现在 [TOP 500 超级计算机榜单][5]上。如今，[全世界最快的 500 台超级计算机全部运行着 Linux][6]！

上以期榜单中最后的两台非 Linux 系统，是来自中国的一对运行着 AIX 的 IBM POWER 计算机，掉出了 [2017 年 11 月超级计算机 500 强榜单][7]。

总体而言，[现在中国引领着超级计算的竞赛，其拥有的 202 台已经超越美国的 144 台][8]。中国的超级计算机的总体性能上也超越了美国。其超级计算机占据了 TOP500 指数的 35.4%，其后的美国占 29.6%。随着一个反科学政权掌管了政府，美利坚共和国如今只能看着它的技术领袖地位在持续下降。

[在 1993 年 6 月首次编制超级计算机 500 强榜单][9]的时候，Linux 只不过是个“玩具”而已。那时的它甚至还没有用“企鹅”作为它的吉祥物。不久之后，Linux 就开始进军超级计算机领域。

在 1993/1994 时，在 NASA 的<ruby>戈达德太空飞行中心<rt>Goddard Space Flight Center</rt></ruby>，Donald Becker 和 Thomas Sterling 设计了一个<ruby>货架产品<rt>Commodity Off The Shelf</rt></ruby>（COTS）超级计算机：[Beowulf][10]。因为他们负担不起一台传统的超级计算机，所以他们构建了一个由 16 个 Intel 486 DX4 处理器的计算机集群，它通过以太网信道聚合互联。这台 [Beowulf 超级计算机][11] 当时一时成名。

到今天，Beowulf 的设计仍然是一个流行的、廉价的超级计算机设计方法。甚至，在最新的 TOP500 榜单上，全世界最快的 437 台计算机仍然采用受益于 Beowulf 的集群设计。

Linux 首次出现在 Top500 上是 1998 年。在 Linux 领先之前，Unix 是超级计算机的最佳操作系统。自从 2003 年起，Top500 中 Linux 已经占据了重要的地位。从 2004 年开始，Linux 已经完全领先于 UNIX 了。

[Linux 基金会][12]的报告指出，“Linux [成为] 推进研究和技术创新的计算能力突破的驱动力”。换句话说，Linux 在超级计算中占有重要地位，至少是部分重要地位。因为它正帮助研究人员突破计算能力的极限。

有两个原因导致这种情况：首先，全球的大部分顶级超级计算机都是为特定的研究任务去构建的，每台机器都是用于有唯一特性和需求优化的单独项目。为节省成本，不可能为每一个超算系统都去定制一个操作系统。然而，对于 Linux，研究团队可以很容易地修改和优化 Linux 的开源代码为的他们的一次性设计。

例如，最新的 [Linux 4.14][13] 允许超级计算机去使用 [异构内存管理 (HMM)][14]。这允许 GPU 和 CPU 去访问处理器的共享地址空间。确切地说，Top500 中的 102 台使用了 GPU 加速/协处理器技术。这全是因 HHM 而使它们运行的更快。

并且，同样重要的是，正如 Linux 基金会指出的那样，“定制的、自我支持的 Linux 发行版的授权成本，无论你是使用 20 个节点，还是使用 2000 万个节点，都是一样的。” 因此，“利用巨大的 Linux 开源社区，项目可以获得免费的支持和开发者资源，以保持开发人员成本与其它操作系统相同或低于它们。”

现在，Linux 已经达到了超级计算之巅，我无法想像它会失去领导地位。即将到来的硬件革命，比如，量子计算，将会动摇 Linux 超级计算的地位。当然，Linux 也许仍然可以保持统治地位，因为，[IBM 开发人员已经准备将 Linux 移植到量子计算机上][15]。

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/linux-totally-dominates-supercomputers/

作者：[Steven J. Vaughan-Nichols][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[1]:http://www.zdnet.com/article/linux-totally-dominates-supercomputers/#comments-643ecd13-0265-48a8-b789-7e8d631025ad
[2]:http://www.zdnet.com/article/a-problem-solving-approach-it-workers-should-learn-from-robotics-engineers/
[3]:http://www.zdnet.com/article/a-problem-solving-approach-it-workers-should-learn-from-robotics-engineers/
[4]:http://www.zdnet.com/article/a-problem-solving-approach-it-workers-should-learn-from-robotics-engineers/
[5]:https://www.top500.org/
[6]:https://www.top500.org/statistics/sublist/
[7]:https://www.top500.org/news/china-pulls-ahead-of-us-in-latest-top500-list/
[8]:http://www.zdnet.com/article/now-china-outguns-us-in-top-supercomputer-showdown/
[9]:http://top500.org/project/introduction
[10]:http://www.beowulf.org/overview/faq.html
[11]:http://www.beowulf.org/overview/history.html
[12]:https://www.linux.com/publications/20-years-top500org-supercomputer-data-links-linux-advances-computing-performance
[13]:http://www.zdnet.com/article/the-new-long-term-linux-kernel-linux-4-14-has-arrived/
[14]:https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bffc33ec539699f045a9254144de3d4eace05f07
[15]:http://www.linuxplumbersconf.org/2017/ocw//system/presentations/4704/original/QC-slides.2017.09.13f.pdf
[16]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[17]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[18]:http://www.zdnet.com/blog/open-source/
[19]:http://www.zdnet.com/topic/innovation/
