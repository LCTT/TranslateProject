
Linus对支持链接时优化(LTO)的Linux内核并不看好
================================================================================
之前，用于[启用Linux 3.15内核的实验LTO支持][1]的补丁已经发布了一个PR（上拉请求），但Linus Torvalds 还没有决定他是否会接受这段代码到上游的Linux内核…… Linus 仍然没看到链接时优化内核（LTO：ink-time optimizations）的好处，也不确认这段代码是否已准备好放入主干中。

[LTO的Linux kernel][2]有一个好处是，可以减小Linux内核镜像的大小，而且更快和更高效。在GCC中配合使用LTO会使整个程序在链接阶段就实现整个的二进制优化。先前的结果表明，一个LTO的内核可以减少超过10％的尺寸大小，并且内核优化后比常规的内核快百分之几，但是它目前的问题是需要占用更多的系统内存以及更长的编译时间。

这个推送给Linux 3.15 LTO Kconfig的PR，希望在下一个内核版本中的增加一个实验性选项。作为回复，Linus Torvalds[写道][3]:

> 到目前为止，我有几个不进行合并的原因(“实验性太强，我们甚至不希望鼓励人们去测试它”，以及“它不是完全可靠，并且使得编译时间变的**很长**").
> 
> 而且至今没有人真正和我讨论过，为什么我*应该*合并它（译注：Linus的意思是说其实没有人真正知道，并且讨论合并LTO的理由）。
> 
>如上，我是这样觉得的，这让我多少动力去合并它。
> 
>所以我认为我应该让“子弹飞一会儿”，_直到_人们开始讨论它带来的好处。最终的结果是到底可以小到什么程度呢？快到什么程度呢？能干的多漂亮呢？是否会有新的更酷的东西出现？那些很酷的事情真地快要来到了吗？真的希望这个可以被合并，甚至在还没完全准备好的情况下？ 
> 
>所以，请说服我。Andi？
> 
> Linus

作为对Linus的关注的回应，LTO内核变得尺寸更小了，通过把未使用代码的自动淘汰，它们减少了对许多低级Kconfig符号的需要、减少了所需的配置选项的数目。来自Tim bird的几个报告显示，在ARM上带有LTO配置的内核可以减少11％的尺寸，而其他用户甚至最多减少了30％。也有报告称系统调用减少了约4％。基准测试的结果根据测试负载有所差异，但一般都有几个百分点的提升。

如今，Linux内核是否支持[链接时优化][4]仍然在讨论，Linus 是否愿意合并此实验性功能到Linux 3.15还不明朗。

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=news_item&px=MTY1OTg

译者：[owen-carter](https://github.com/owen-carter) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.phoronix.com/scan.php?page=news_item&px=MTY1ODA
[2]:http://www.phoronix.com/scan.php?page=news_item&px=MTY0OTc
[3]:http://lkml.iu.edu/hypermail/linux/kernel/1404.1/00275.html
[4]:http://www.phoronix.com/scan.php?page=search&q=link-time+optimization