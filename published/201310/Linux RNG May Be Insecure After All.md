Linux 随机数生成器可能还是不安全的
============================

> 在 Linus 向那些质疑 Linux 随机数生成器安全性的人们发表了自己的[观点][1]之后，现在，一篇新的[学术论文][2]分析了Linux中的/dev/urandom和/dev/random的健壮性。

> 论文中写道：“从实际的角度来说，我们也对 Linux 的两种伪随机数生成器 /dev/random 和 /dev/urandom 的安全性做了精确的评估。特别是，我们展示了几种攻击手段来证明 Linux 中的这两种伪随机数生成器并不符合我们对健壮性的定义，而且熵没有适当地累积起来。这些攻击能生效是由于熵估算器及 Linux 伪随机数生成器的内部混合函数存在弱点。由于这些攻击的存在，Linux 的伪随机数生成器并不满足安全学中‘健壮性’这一概念，但是，在实际情况中，我们并不清楚这些攻击手段是否存在真正可利用的漏洞。”

当然，你[甚至可能连硬件随机数生成器都不相信][3]。论文作者们并非只是简单地证明 Linux 伪随机数生成器是不健壮的（通过使用 Linux 的运行时熵估算器），他们提出了一个新的指标用于检验伪随机数生成器的熵累计阶段是否健壮，并且，他们还提供了另一个伪随机数生成器的模型，他们证明，这个模型不仅是健壮的，而且比现有的 Linux 伪随机数生成器更加高效。

--------------------------------------------------------------------------------

via: http://it.slashdot.org/story/13/10/14/2318211/linux-rng-may-be-insecure-after-all

译者：[will.qian](https://github.com/willqian) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出


[1]:http://linux.slashdot.org/story/13/09/10/1311247/linus-responds-to-rdrand-petition-with-scorn
[2]:http://eprint.iacr.org/2013/338.pdf
[3]:http://slashdot.org/story/13/09/13/1228216/stealthy-dopant-level-hardware-trojans
