开源开发者提交不安全代码，遭 Linus 炮轰
================================================================================
![](http://thevarguy.com/site-files/thevarguy.com/files/imagecache/medium_img/uploads/2015/11/linus-torvalds.jpg)

Linus 上个月骂了一个 Linux 开发者，原因是他向 kernel 提交了一份不安全的代码。

Linus 是个 Linux 内核项目非官方的“仁慈的独裁者（benevolent dictator）”（LCTT译注：英国《卫报》曾将乔布斯评价为‘仁慈的独裁者’），这意味着他有权决定将哪些代码合入内核，哪些代码直接丢掉。

在10月28号，一个开源开发者提交的代码未能符合 Torvalds 的要求，于是遭来了[一顿臭骂][1]。Torvalds 在他提交的代码下评论道：“你提交的是什么东西。”

接着他说这个开发者是“毫无能力的神经病”。

Torvalds 为什么会这么生气？他觉得那段代码可以写得更有效率一点，可读性更强一点，编译器编译后跑得更好一点（编译器的作用就是将让人看的代码翻译成让电脑看的代码）。

Torvalds 重新写了一版代码将原来的那份替换掉，并建议所有开发者应该像他那种风格来写代码。

Torvalds 一直在嘲讽那些不符合他观点的人。早在1991年他就攻击过 [Andrew Tanenbaum][2]——那个 Minix 操作系统的作者，而那个 Minix 操作系统被 Torvalds 描述为“脑残”。

但是 Torvalds 在这次嘲讽中表现得更有战略性了：“我想让*每个人*都知道，像他这种代码是完全不能被接收的。”他说他的目的是提醒每个 Linux 开发者，而不是针对那个开发者。

Torvalds 也用这个机会强调了烂代码的安全问题。现在的企业对安全问题很重视，所以安全问题需要在开源开发者心中得到足够重视，甚至需要在代码中表现为最高等级（LCTT 译注：操作系统必须权衡许多因素：安全、处理速度、灵活性、易用性等，而这里 Torvalds 将安全提升为最高优先级了）。骂一下那些提交不安全代码的开发者可以帮助提高 Linux 系统的安全性。

--------------------------------------------------------------------------------

via: http://thevarguy.com/open-source-application-software-companies/110415/linus-torvalds-lambasts-open-source-programmers-over-inse

作者：[Christopher Tozzi][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://thevarguy.com/author/christopher-tozzi
[1]:http://lkml.iu.edu/hypermail/linux/kernel/1510.3/02866.html
[2]:https://en.wikipedia.org/wiki/Tanenbaum%E2%80%93Torvalds_debate
