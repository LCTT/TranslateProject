在用户空间做我们会在内核空间做的事情
=======================================================

我相信，Linux 最好也是最坏的事情，就是内核空间和用户空间之间的巨大差别。

但是如果抛开这个区别，Linux 可能也不会成为世界上影响力最大的操作系统。如今，Linux 已经拥有世界上最大数量的用户，和最大范围的应用。尽管大多数用户并不知道，当他们进行谷歌搜索，或者触摸安卓手机的时候，他们其实正在使用 Linux。如果不是 Linux 的巨大成功，Apple 公司也可能并不会成为现在这样（苹果在他们的电脑产品中使用 BSD 发行版）。

不用担心，用户空间是 Linux 内核开发中的一个特性，并不是一个缺陷。正如 Linus 在 2003 的极客巡航中提到的那样，“”我只做内核相关技术……我并不知道内核之外发生的事情，而且我并不关心。我只关注内核部分发生的事情。” 在 Andrew Morton 在多年之后的另一个极客巡航上给我上了另外的一课，我写到：

> 内核空间是 Linux 核心存在的地方。用户空间是使用 Linux 时使用的空间，和其他的自然的建筑材料一样。内核空间和用户空间的区别，和自然材料和人类从中生产的人造材料的区别很类似。

这个区别的自然而然的结果，就是尽管外面的世界一刻也离不开 Linux， 但是 Linux 社区还是保持相对较小。所以，为了增加我们社区团体的数量，我希望指出两件事情。第一件已经非常火热，另外一件可能热门。

第一件事情就是 [blockchain][1]，出自著名的分布式货币，比特币之手。当你正在阅读这篇文章的同时，对 blockchain 的[兴趣已经直线上升][2]。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12042f1.png)
> 图1. 谷歌 Blockchain 的趋势

第二件事就是自主身份。为了解释这个，让我先来问你，你是谁或者你是什么。

如果你从你的雇员，你的医生，或者车管所，Facebook，Twitter 或者谷歌上得到答案，你就会发现他们每一个都有明显的社会性： 为了他们自己的便利，在进入这些机构的控制前，他们都会添加自己的命名空间。正如 Timothy Ruff 在 [Evernym][3] 中解释的，”你并不为了他们而存在，你只为了自己的身份而活。“。你的身份可能会变化，但是唯一不变的就是控制着身份的人，也就是这个组织。

如果你的答案出自你自己，我们就有一个广大空间来发展一个新的领域，在这个领域中，我们完全自由。

第一个解释这个的人，据我所知，是 [Devon Loffreto][4]。在 2012 年 2 月，在的他的博客中，他写道 ”什么是' Sovereign Source Authority'？“，[Moxy Tongue][5]。在他发表在 2016 年 2 月的 "[Self-Sovereign Identity][6]" 中，他写道：

> 自主身份必须是独立个人提出的，并且不包含社会因素。。。自主身份源于每个个体对其自身本源的认识。 一个自主身份可以为个体带来新的社会面貌。每个个体都可能为自己生成一个自主身份，并且这并不会改变固有的人权。使用自主身份机制是所有参与者参与的基石，并且 依旧可以同各种形式的人类社会保持联系。

为了将这个发布在 Linux 条款中，只有个人才能为他或她设定一个自己的开源社区身份。这在现实实践中，这只是一个非常偶然的事件。举个例子，我自己的身份包括：

- David Allen Searls，我父母会这样叫我。
- David Searls，正式场合下我会这么称呼自己。
- Dave，我的亲戚和好朋友会这么叫我。
- Doc，大多数人会这么叫我。

在上述提到的身份认证中，我可以在不同的情景中轻易的转换。但是，这只是在现实世界中。在虚拟世界中，这就变得非常困难。除了上述的身份之外，我还可以是 @dsearls(我的 twitter 账号) 和 dsearls (其他的网络账号)。然而为了记住成百上千的不同账号的登录名和密码，我已经不堪重负。

你可以在你的浏览器上感受到这个糟糕的体验。在火狐上，我有成百上千个用户名密码。很多已经废弃(很多都是从 Netscape 时代遗留下来的)，但是我依旧假设我有时会有大量的工作账号需要处理。对于这些，我只是被动接受者。没有其他的解决方法。甚至一些安全较低的用户认证，已经成为了现实世界中不可缺少的一环。

现在，最简单的方式来联系账号，就是通过 "Log in with Facebook" 或者 "Login in with Twitter" 来进行身份认证。在这些例子中，我们中的每一个甚至并不是真正意义上的自己，或者某种程度上是我们希望被大家认识的自己（如果我们希望被其他人认识的话）。

我们从一开始就需要的是一个可以实体化我们的自主身份和交流时选择如何保护和展示自身的个人系统。因为缺少这个能力，我们现在陷入混乱。Shoshana Zuboff 称之为 "监视资本主义"，她如此说道：

>...难以想象，在见证了互联网和获得了的巨大成功的谷歌背后。世界因 Apple 和 FBI 的对决而紧密联系在一起。真相就是，被热衷于监视的资本家开发监视系统，是每一个国家安全机构真正的恶。

然后，她问道，”我们怎样才能保护自己远离他人的影响？“

我建议使用自主身份。我相信这是我们唯一的方式，来保证我们从一个被监视的世界中脱离出来。以此为基础，我们才可以完全无顾忌的和社会，政治，商业上的人交流。

我在五月联合国举行的 [ID2020][7] 会议中总结了这个临时的结论。很高兴，Devon Loffreto 也在那，自从他在2013年被选为作为轮值主席之后。这就是[我曾经写的一些文章][8]，引用了 Devon 的早期博客(比如上面的原文)。

这有三篇这个领域的准则:

- "[Self-Sovereign Identity][9]" - Devon Loffreto.
- "[System or Human First][10]" - Devon Loffreto.
- "[The Path to Self-Sovereign Identity][11]" - Christopher Allen.

从Evernym 的简要说明中，[digi.me][12], [iRespond][13] 和 [Respect Network][14] 也被包括在内。自主身份和社会身份 (也被称为”current model“） 的对比结果，显示在图二中。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12042f2.jpg)
> 图 2. Current Model 身份 vs. 自主身份

为此而生的[平台][15]就是 Sovrin，也被解释为“”依托于先进技术的，授权机制的，分布式货币上的一个完全开源，基于标识，声明身份的图平台“  同时，这也有一本[白皮书][16]。代号为 [plenum][17]，而且它在 Github 上。

在这-或者其他类似的地方-我们就可以在用户空间中重现我们在上一个的四分之一世纪中已经做过的事情。


--------------------------------------------------------------------------------

via: https://www.linuxjournal.com/content/doing-user-space-what-we-did-kernel-space

作者：[Doc Searls][a]
译者：[译者ID](https://github.com/MikeCoder)
校对：[校对者ID](https://github.com/校对者ID)

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
