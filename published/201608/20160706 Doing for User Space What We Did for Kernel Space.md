在用户空间做我们会在内核空间做的事情
=======================================================

我相信，Linux 最好也是最坏的事情，就是内核空间（kernel space）和用户空间（user space）之间的巨大差别。

如果没有这个区别，Linux 可能也不会成为世界上影响力最大的操作系统。如今，Linux 的使用范围在世界上是最大的，而这些应用又有着世界上最大的用户群——尽管大多数用户并不知道，当他们进行谷歌搜索或者触摸安卓手机的时候，他们其实正在使用 Linux。如果不是 Linux 的巨大成功，Apple 公司也可能并不会成为现在这样（即在他们的电脑产品中使用 BSD 的技术）（LCTT 译注：Linux 获得成功后，Apple 曾与 Linus 协商使用 Linux 核心作为 Apple 电脑的操作系统并帮助开发的事宜，但遭到拒绝。因此，Apple 转向使用许可证更为宽松的 BSD 。）。

不（需要）关注用户空间是 Linux 内核开发中的一个特点而非缺陷。正如 Linus 在 2003 年的[极客巡航（Geek Cruise）][18]中提到的那样，“我只做内核相关的东西……我并不知道内核之外发生的事情，而且我也并不关心。我只关注内核部分发生的事情。” 多年之后的[另一次极客巡航][19]上， Andrew Morton 给我上了另外的一课，这之后我写道：

> 内核空间是Linux 所在的地方，而用户空间是 Linux 与其它的“自然材料”一起使用的地方。内核空间和用户空间的区别，和自然材料与人类用其生产的人造材料的区别很类似。

这个区别是自然而然的结果，就是尽管外面的世界一刻也离不开 Linux， 但是 Linux 社区还是保持相对较小。所以，为了增加哪怕一点我们社区团体的规模，我希望指出两件事情。第一件已经非常火了，另外一件可能会火起来。

第一件事情就是 [区块链（blockchain）][1]，出自著名的分布式货币——比特币之手。当你正在阅读这篇文章的同时，人们对区块链的[关注度正在直线上升][2]。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12042f1.png)

*图1. 区块链的谷歌搜索趋势*

第二件事就是自主身份（self-sovereign identity）。为了解释这个概念，让我先来问你：你是谁，你来自哪里？

如果你从你的老板、你的医生或者车管所，Facebook、Twitter 或者谷歌上得到答案，你就会发现它们都是行政身份（administrative identifiers）——这些机构完全以自己的便利为原因设置这些身份和职位。正如一家区块链技术公司 [Evernym][3] 的 Timothy Ruff 所说，“你并不因组织而存在，但你的身份却因此存在。”身份是个因变量。自变量——即控制着身份的变量——是（你所在的）组织。

如果你的答案出自你自己，我们就有一个广大空间来发展一个新的领域，在这个领域中，我们完全自由。

据我所知，第一个解释这个的人是 [Devon Loffreto][4]。在 2012 年 2 月，他在博客 [Moxy Tongue][5] 中写道：“什么是 'Sovereign Source Authority'？”。在发表于 2016 年 2 月的 “[Self-Sovereign Identity][6]” 一文中，他写道：

> 自主身份必须是独立个人提出的，并且不包含社会因素……自主身份源于每个个体对其自身本源的认识。 一个自主身份可以为个体带来新的社会面貌。每个个体都可能为自己生成一个自主身份，并且这并不会改变固有的人权。使用自主身份机制是所有参与者参与的基石，并且依旧可以同各种形式的人类社会保持联系。

将这个概念放在 Linux 领域中，只有个人才能为他或她设定一个自己的开源社区身份。这在现实实践中，这只是一个非常正常的事件。举个例子，我自己的身份包括：

- David Allen Searls，我父母会这样叫我。
- David Searls，正式场合下我会这么称呼自己。
- Dave，我的亲戚和好朋友会这么叫我。
- Doc，大多数人会这么叫我。

作为承认以上称呼的自主身份来源，我可以在不同的情景中轻易的转换。但是，这只是在现实世界中。在虚拟世界中，这就变得非常困难。除了上述的身份之外，我还可以是 @dsearls （我的 twitter 账号） 和 dsearls （其他的网络账号）。然而为了记住成百上千的不同账号的登录名和密码，我已经不堪重负。

你可以在你的浏览器上感受到这个糟糕的体验。在火狐上，我有成百上千个用户名密码。很多已经废弃(很多都是从 Netscape 时代遗留下来的)，但是我想会有大量的工作账号需要处理。对于这些，我只是被动接受者。没有其他的解决方法。甚至一些安全较低的用户认证，已经成为了现实世界中不可缺少的一环。

现在，最简单的方式来联系账号，就是通过 “Log in with Facebook” 或者 “Login in with Twitter” 来进行身份认证。在这种情况下，我们中的每一个甚至并不是真正意义上的自己，甚至（如果我们希望被其他人认识的话）缺乏对其他实体如何认识我们的控制。

我们从一开始就需要的是一个可以实体化我们的自主身份和交流时选择如何保护和展示自身的个人系统。因为缺少这个能力，我们现在陷入混乱。Shoshana Zuboff 称之为 “监视资本主义”，她如此说道：

>...难以想象，在见证了互联网和获得了的巨大成功的谷歌背后。世界因 Apple 和 FBI 的对决而紧密联系在一起。讲道理，热衷于监视的资本家开发的监视系统是每一个国家安全机构都渴望的。

然后，她问道，”我们怎样才能保护自己远离他人的影响？“

我建议使用自主身份。我相信这是我们唯一的既可以保证我们从监视中逃脱、又可以使我们有一个有序的世界的办法。以此为基础，我们才可以完全无顾忌地和社会，政治，商业上的人交流。

我在五月联合国举行的 [ID2020][7] 会议中总结了这个临时的结论。很高兴，Devon Loffreto 也在那，他于 2013 年推动了自主身份的创立。这是[我那时写的一些文章][8]，引用了 Devon 的早期博客(比如上面的原文)。

这有三篇这个领域的准则:

- "[Self-Sovereign Identity][9]" - Devon Loffreto.
- "[System or Human First][10]" - Devon Loffreto.
- "[The Path to Self-Sovereign Identity][11]" - Christopher Allen.

从 Evernym 的简要说明中，[digi.me][12]、 [iRespond][13] 和 [Respect Network][14] 也被包括在内。自主身份和社会身份 (也被称为“当前模式（current model）”） 的对比结果，显示在图二中。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12042f2.jpg)

*图 2. 当前模式身份 vs. 自主身份*

Sovrin 就是为此而生的[平台][15]，它阐述自己为一个“依托于先进、专用、经授权、分布式平台的，完全开源、基于标识的身份声明图平台”。同时，这也有一本[白皮书][16]。它的代码名为 [plenum][17]，并且公开在 Github 上。

在这里——或者其他类似的地方——我们就可以在用户空间中重现我们在过去 25 年中在内核空间做过的事情。

--------------------------------------------------------------------------------

via: https://www.linuxjournal.com/content/doing-user-space-what-we-did-kernel-space

作者：[Doc Searls][a]
译者：[MikeCoder](https://github.com/MikeCoder)
校对：[PurlingNayuki](https://github.com/PurlingNayuki)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxjournal.com/users/doc-searls
[1]: https://en.wikipedia.org/wiki/Block_chain_%28database%29
[2]: https://www.google.com/trends/explore#q=blockchain
[3]: http://evernym.com/
[4]: https://twitter.com/nzn
[5]: http://www.moxytongue.com/2012/02/what-is-sovereign-source-authority.html
[6]: http://www.moxytongue.com/2016/02/self-sovereign-identity.html
[7]: http://www.id2020.org/
[8]: http://blogs.harvard.edu/doc/2013/10/14/iiw-challenge-1-sovereign-identity-in-the-great-silo-forest
[9]: http://www.moxytongue.com/2016/02/self-sovereign-identity.html
[10]: http://www.moxytongue.com/2016/05/system-or-human.html
[11]: http://www.lifewithalacrity.com/2016/04/the-path-to-self-soverereign-identity.html
[12]: https://get.digi.me/
[13]: http://irespond.com/
[14]: https://www.respectnetwork.com/
[15]: http://evernym.com/technology
[16]: http://evernym.com/assets/doc/Identity-System-Essentials.pdf?v=167284fd65
[17]: https://github.com/evernym/plenum
[18]: http://www.linuxjournal.com/article/6427
[19]: http://www.linuxjournal.com/article/8664