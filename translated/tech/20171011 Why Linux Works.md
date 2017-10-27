Linux 是如何运作的
============================================================

_在大量金钱与围绕 Linux 激烈争夺的公司之间的，正是那些真正给操作系统带来活力的开发者。_

实际上，[Linux 社区][7]本身无需太过担心社区的正常运作。Linux 已经尽可能的在多个领域占据着主导的地位 —— 从超级计算机到移动设备再到云计算 —— Linux 内核开发人员更多的是关注于代码本身，而不是其所在公司的利益。

这是一个出现在[Dawn Foster 博士的成果][8]中关于 Linux 内核的合作审查的著名的结论。Foster 博士是在英特尔公司和木偶实验室的前社区领导人，他写到，“很多人优先把自己看作是 Linux 内核开发者，其次才是作为一名雇员。”

大量的“基金洗劫型”公司已经强加于各种开源项目上，意图在虚构的社区面具之下隐藏企业特权，但 Linux 一直设法保持自身的纯粹。问题是怎么做到。

**跟随金钱的脚步**

  毕竟，如果有开源项目需参与到企业的利欲中，那它一定是 Linux。回到 2008 年，[ Linux 生态系统的估值已经达到了最高 250 亿美元][9]。最近10年，伴随着数量众多的云服务，移动端，以及大数据基础设施对于 Linux 的依赖，这一数值一定还在急剧增长。甚至在像 Oracle 这样的单独一个公司，就实现了十亿美元的价值。

那么有点惊奇，这里有这样一个 landgrab 通过代码来影响 Linux 的方向。

看看在过去一年中那些对 Linux 最活跃的贡献者以及这些企业像“海龟”背地球一样撑起的版图, 就像[Linux 基金会的最新报道][10]中的截图:

![linux companies](https://www.datamation.com/imagesvr_ce/201/linux-companies.jpg)

这些企业花费大量的资金来雇佣开发者去构建自由软件，并且每个企业都有赖于这些投资所带来的回报。因为借由 Linux 潜在的企业灵活性，导致一些企业对 Linux 基金会的领导人[表示不满][11]。在像 Microsoft 这样曾为开源界宿敌的企业加入 Linux 基金会之后，这些批评言论正变得越来越响亮。

但老实说，这样一位假想的宿敌已经有点过时了。

虽然企业排队资金赞助 Linux 基金会已经成为了事实，不过这些赞助并没有收买基金会而影响到代码。在最伟大的开源社区中，金钱可以帮助招募开发者，但这些开发者相比企业更优先专注于代码。就像 Linux 基金会执行董事[ Jim Zemlin 强调的那样][12]：

“我们的项目中技术角色都是独立于企业的。没有人会在其提交的内容上标记他们的企业身份：在 Linux 基金会的项目中进行密切的代码交流。在我们的项目中，开发者可以从一个公司切换到另一个公司并且不会改变他们在项目中所扮演的角色。之后企业或政府采纳了这些代码所创造的价值，反过来可以使该项目获得投资。这样的良性循环对大家都有好处，并且也是我们项目的目标之一。”

读过 [Linus Torvalds 的][13] 的邮寄列表批注的人很难相信他就曾是这样的企业的上当者。对其他杰出贡献者保持同样的信任。他们总是普遍被大公司所雇佣，通常这些企业实际上会为开发者已经有意识的去完成并已经在进行的工作支付了一定的费用。

归根结底，很少有公司会有耐心或者必备的风险预测来为一群 Linux 内核骇客提供资金，并在内核团队有影响力的位置为一些他们 _可能_ 贡献质量足够的代码等上数年时间。所以他们选择雇佣已有的值得信赖的开发者。正如 [2016 Linux 基金会报告][14]所写的，“无薪开发者的数量继续[d]缓慢下降，同时 Linux 内核的开发证明是雇主们对有价值的技能需求日益增长，确保了有经验的 kernel 开发者不会在无薪阶段停留太长时间。”

这是代码所带来的信任，并不是通过企业的金钱。因此没有一个 Linux 内核开发者会为眼前的金钱而丢掉他们已经积攒的信任，那样会在出现新的利益冲突时妥协代码质量并很快失去信任。

**不是康巴亚，就是权利的游戏，非此即彼**

最终，Linux 内核开发是关于认同， Foster 的部分研究是这样认为的。

在 Google 工作会很棒，而且也许带有一个体面的头衔以及免费的干洗。然而，作为一个重要的 Linux 内核子系统的维护人员，很难承诺并保证，不会被其他提供更高薪水的公司所雇佣。

Foster 这样写到， “他们甚至享受当前的工作并且觉得他们的雇主不错，许多 [Linux 内核开发者] 倾向于审视一些临时的工作关系，而且他们作为内核开发者的身份被看作更有经验且更加重要。”

由于作为一名 Linux 开发者的身份优先，企业职员的身份第二，Linux 内核开发者甚至可以轻松地与其雇主的竞争对手合作。因为雇主们无力去引导他们开发者的工作，这也呼应了上边的原因。Foster 深入研究了这一问题：

“尽管企业对其雇员所贡献的领域产生了一些影响，在他们如何去完成工作这点上，雇员还是很自由的。许多人在日常工作中几乎没有接受任何指导，来自雇主的信任对工作是非常有帮助的。然而，他们偶尔会被要求做一些特定的零碎工作或者是在一个对公司重要的特定领域投入兴趣。

许多内核开发者同样与他们的竞争者进行日常的基础协作，在这里他们仅作为个人相互交流而不需要关心雇主之间的竞争。这是我在 Intel 工作时经常见到的一幕，因为我们内核开发者几乎都是与我们主要的竞争对手一同工作的。”

那些企业会在芯片上通过运行 Linux，或 Linux 发行版，亦或者是被其他健壮的操作系统支持的软件来进行竞争，但开发者们主要专注于一件事情：尽可能的使用 Linux 。同样，这是因为他们的身份被捆在 Linux 上，而不是坐在防火墙后面写代码。

Foster 通过 USB 子系统邮寄列表（在 2013 年到 2015 年之间）说明了这种相互作用，用深色线条着重描绘的公司之间电子邮件交互：

![linux kernel](https://www.datamation.com/imagesvr_ce/7344/linux-kernel.jpg)

在价格讨论中很明显一些公司可能会在反垄断的权利中增加疑虑，但这种简单的商业行为在 Linux 大陆中一如既往。结果导致为各方产生一个操作系统并迫使他们在自由市场相互竞争。

**寻找合适的平衡**

 Novell 公司的创始人 Ray Noorda 或许就是这样在最佳的开源社区之间的“合作竞争”，但只工作在真正的社区存在的地方。这很难做到，举个例子，为一个由单一供应商所主导的项目实现正确的紧张合作。由 Google 发起的[Kubernetes][15]就表明这是可能的，但其他的像是 Docker 这样的项目却在为同样的目标而挣扎，很大一部分原因是他们一直不愿放弃对自己项目的技术领导。

也许 Kubernetes 能够很好的工作是因为 Google 并不觉得必须占据重要地位，而且事实上，是 _希望_ 其他公司担负起开发领导的职责。通过一个梦幻般的代码库，如果 Google 帮助培养，就有利于像 Kubernetes 这样的项目获得成功，然后开辟一条道路，这就鼓励了 Red Hat 及其他公司做出杰出的贡献。

不过，Kubernetes 是个例外，就像 Linux 曾经那样。这里有许多 _因为_ 企业的利欲而获得成功的例子，并且在利益竞争中获取平衡。如果一个项目仅仅被公司自己的利益所控制，常常会在公司的技术管理上体现出来，而且再怎么开源许可也无法对企业产生影响。

简而言之，Linux 的运作是因为众多企业都想要控制它但却难以做到，由于其在工业中的重要性，使得开发者和构建人员更加灵活的作为一名 _Linux 开发者_ 而不是 Red Hat （或 Intel 亦或 Oracle … ）工程师。

--------------------------------------------------------------------------------

via: https://www.datamation.com/open-source/why-linux-works.html

作者：[Matt Asay][a]
译者：[softpaopao](https://github.com/softpaopao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.datamation.com/author/Matt-Asay-1133910.html
[1]:https://www.datamation.com/feedback/https://www.datamation.com/open-source/why-linux-works.html
[2]:https://www.datamation.com/author/Matt-Asay-1133910.html
[3]:https://www.datamation.com/e-mail/https://www.datamation.com/open-source/why-linux-works.html
[4]:https://www.datamation.com/print/https://www.datamation.com/open-source/why-linux-works.html
[5]:https://www.datamation.com/open-source/why-linux-works.html#comment_form
[6]:https://www.datamation.com/author/Matt-Asay-1133910.html
[7]:https://www.datamation.com/open-source/
[8]:https://opensource.com/article/17/10/collaboration-linux-kernel
[9]:http://www.osnews.com/story/20416/Linux_Ecosystem_Worth_25_Billion
[10]:https://www.linux.com/publications/linux-kernel-development-how-fast-it-going-who-doing-it-what-they-are-doing-and-who-5
[11]:https://www.datamation.com/open-source/the-linux-foundation-and-the-uneasy-alliance.html
[12]:https://thenewstack.io/linux-foundation-critics/
[13]:https://github.com/torvalds
[14]:https://www.linux.com/publications/linux-kernel-development-how-fast-it-going-who-doing-it-what-they-are-doing-and-who-5
[15]:https://kubernetes.io/
