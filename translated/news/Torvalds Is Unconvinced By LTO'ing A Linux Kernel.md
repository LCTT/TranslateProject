owen-carter translating
托沃兹对LTO'ing Linux内核并不乐观
================================================================================
昨天，补丁已经通过一个上拉请求而发布[启用了Linux 3.15内核实验LTO支持][1]，但Linus Torvalds还没有决定他是否会接受这段代码中的上游Linux内核...莱纳斯还没有见到在链接时优化内核的好处，是不知道这段代码是否已准备好待mainlined。

[LTO'ing the Linux kernel][2] 具有减小伴随生成一个更快和更高效的二进制Linux内核镜像的大小的优势。在GCC链接时就进行优化从而使整个程序在链接阶
段就实现整个的二进制优化。先前的结果表明，一个LTO'ed内核可以是较小的超过10％的大小和百分之几更快通过优化内核以这种方式，但是它目前的问题是导致了更大的系统内存使用和更长的编译过程。

在应对Linux的3.15 LTO的Kconfig拉的请求后，将使它成为实验性的选项为下一个内核版本，Linus Torvalds[wrote][3]:

> 所以现在，我看到了好几个不进行合并的原因("它是如此的实验性，我们甚至不希望鼓励人们去测试它”，因为目前“它不是完全充实并且使得编译时间变的更长").
> 
> 而且至今没有人真正谈过为什么我 *应该* 合并它（Linus的意思是说其实没有人真正知道并且谈过合并LTO的理由）。
> 
>我觉得这个并没有激起我多少热情。
> 
>所以我想我会让这个等待的时间尽量长一点，直到人们开始谈论有利的一面。最终的结果是到底可以小到什么程度呢？快到什么程度呢？漂亮到何种
境地呢？这会让那些新的很酷的事情成为可能吗？那些很酷的事情真地快要来到了吗？真的希望这个可以被合并，尽管这不是真的准备好了？ 
> 
>所以，请说服我。安迪！
> 
> Linus

为了回应Torvalds的关注，响应的结果是LTO内核具有了更小的尺寸，它们减少了对许多低级别的Kconfig符号/减少所需的配置选项的数目，因为未使用的代码可以自动被淘汰，大量由Tim bird得到的报告显示一个11％的二进制减少在ARM与LTO配置中，而其他用户可以看到向上减少30％。还有的甚至减少
约4％，系统调用了LTO内核的报告。基准测试的结果根据测试工作量有所差异，但可以从一般是几个百分点的进步看到确实得到了改善。 

如今， [link-time optimization][4] 是否被Linux内核所支持，该决策仍在与莱纳斯尚未明朗的想法中，他是否愿意合并此实验性功能的Linux 3.15或不做讨论。

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=news_item&px=MTY1OTg

译者：[owen-carter](https://github.com/owen-carter) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.phoronix.com/scan.php?page=news_item&px=MTY1ODA
[2]:http://www.phoronix.com/scan.php?page=news_item&px=MTY0OTc
[3]:http://lkml.iu.edu/hypermail/linux/kernel/1404.1/00275.html
[4]:http://www.phoronix.com/scan.php?page=search&q=link-time+optimization