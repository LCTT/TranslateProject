Linux 是如何成功运作的
============================================================

_在大量金钱与围绕 Linux 激烈争夺的公司之间，真正给操作系统带来活力的正是那些开发者。_

事实证明上，Linux 社区是可行的，因为它本身无需太过担心社区的正常运作。尽管 Linux 已经在超级计算机、移动设备和云计算等多个领域占据了主导的地位，但 Linux 内核开发人员更多的是关注于代码本身，而不是其所在公司的利益。

这是一个出现在 [Dawn Foster 博士][8]研究 Linux 内核协作开发的博士论文中的重要结论。Foster 是在英特尔公司和<ruby>木偶实验室<rt>Puppet Labs</rt></ruby>的前任社区领导人，他写到，“很多人首先把自己看作是 Linux 内核开发者，其次才是作为一名雇员。”

随着大量的“<ruby>基金洗劫型<rt>foundation washing</rt></ruby>”公司开始侵蚀各种开源项目，意图在虚构的社区面具之下隐藏企业特权，但 Linux 依然设法保持了自身的纯粹。问题是这是怎么做到的？

### 跟随金钱的脚步

毕竟，如果有任何开源项目会进入到企业贪婪的视线中，那它一定是 Linux。早在 2008 年，[Linux 生态系统的估值已经达到了最高 250 亿美元][9]。最近 10 年，伴随着数量众多的云服务、移动端，以及大数据基础设施对于 Linux 的依赖，这一数据一定倍增了。甚至在像 Oracle 这样单独一个公司里，Linux 也能提供数十亿美元的价值。

那么就难怪有这样一个通过代码来影响 Linux 发展方向的必争之地。

在 [Linux 基金会的最新报道][10]中，让我们看看在过去一年中那些最活跃的 Linux 贡献者，以及他们所在的企业[像](https://linux.cn/article-8220-1.html)[“海龟”一样](https://en.wikipedia.org/wiki/Turtles_all_the_way_down)高高叠起。

![linux companies](https://www.datamation.com/imagesvr_ce/201/linux-companies.jpg)

这些企业花费大量的资金来雇佣开发者去为自由软件做贡献，并且每个企业都从这些投资中得到了回报。由于存在企业对 Linux 过度影响的潜在可能，导致一些人对引领 Linux 开发的 Linux 基金会[表示不满][11]。在像微软这样曾经的开源界宿敌的企业挥舞着钞票进入 Linux 基金会之后，这些批评言论正变得越来越响亮。

但这只是一位虚假的敌人，坦率地说，这是一个以前的敌人。

虽然企业为了利益而给 Linux 基金会投入资金已经是事实，不过这些赞助并不能收买基金会而影响到代码。在这个最伟大的开源社区中，金钱可以帮助招募到开发者，但这些开发者相比关注企业而更专注于代码。就像 Linux 基金会执行董事 [Jim Zemlin 所强调的][12]：

> “我们的项目中技术角色都是独立于企业的。没有人会在其提交的内容上标记他们的企业身份： 在 Linux 基金会的项目当中有关代码的讨论是最大声的。在我们的项目中，开发者可以从一个公司跳槽到另一个公司而不会改变他们在项目中所扮演的角色。之后企业或政府采用了这些代码而创造的价值，反过来又投资到项目上。这样的良性循环有益于所有人，并且也是我们的项目目标。”

任何读过 [Linus Torvalds 的][13] 的邮件列表评论的人都不可能认为他是个代表着这个或那个公司的人。这对于其他的杰出贡献者来说也是一样的。虽然他们几乎都是被大公司所雇佣，但是一般情况下，这些公司为这些开发者支付薪水让他们去做想做的开发，而且事实上，他们正在做他们想做的。

毕竟，很少有公司会有足够的耐心或承受风险来为资助一群新手 Linux 内核开发者，并等上几年，等他们中出现几个人可以贡献出质量足以打动内核团队的代码。所以他们选择雇佣已有的、值得信赖的开发者。正如 [2016 Linux 基金会报告][14]所写的，“无薪开发者的数量正在持续地缓慢下降，同时 Linux 内核开发被证明是一种雇主们所需要的日益有价值的技能，这确保了有经验的内核开发者不会长期停留在无薪阶段。”

然而，这样的信任是代码所带来的，并不是通过企业的金钱。因此没有一个 Linux 内核开发者会为眼前的金钱而丢掉他们已经积攒的信任，当出现新的利益冲突时妥协代码质量就很快失去信任。因此不存在这种问题。

### 不是康巴亚，就是权利的游戏，非此即彼

最终，Linux 内核开发就是一种身份认同， Foster 的研究是这样认为的。

为 Google 工作也许很棒，而且也许带有一个体面的头衔以及免费的干洗。然而，作为一个关键的 Linux 内核子系统的维护人员，很难得到任意数量的公司承诺高薪酬的雇佣机会。

Foster 这样写到，“他们甚至享受当前的工作并且觉得他们的雇主不错，许多（Linux 内核开发者）倾向于寻找一些临时的工作关系，那样他们作为内核开发者的身份更被视作固定工作，而且更加重要。”

由于作为一名 Linux 开发者的身份优先，企业职员的身份次之，Linux 内核开发者甚至可以轻松地与其雇主的竞争对手合作。之所以这样，是因为雇主们最终只能有限制地控制开发者的工作，原因如上所述。Foster 深入研究了这一问题：

> “尽管企业对其雇员所贡献的领域产生了一些影响，在他们如何去完成工作这点上，雇员还是很自由的。许多人在日常工作中几乎没有接受任何指令，来自雇主的高度信任对工作是非常有帮助的。然而，他们偶尔会被要求做一些特定的零碎工作或者是在一个对公司重要的特定领域投入兴趣。

> 许多内核开发者也与他们的竞争者展开日常的基础协作，在这里他们仅作为个人相互交流，而不需要关心雇主之间的竞争。这是我在 Intel 工作时经常见到的一幕，因为我们内核开发者几乎都是与我们主要的竞争对手一同工作的。”

那些公司可能会在运行 Linux 的芯片上、或 Linux 发行版，亦或者是被其他健壮的操作系统支持的软件上产生竞争，但开发者们主要专注于一件事情：使 Linux 越来越好。同样，这是因为他们的身份与 Linux 维系在一起，而不是编码时所在防火墙（指公司）。

Foster 通过 USB 子系统的邮件列表（在 2013 年到 2015 年之间）说明了这种相互作用，用深色线条描绘了公司之间更多的电子邮件交互：

![linux kernel](https://www.datamation.com/imagesvr_ce/7344/linux-kernel.jpg)

在价格讨论中一些公司明显的来往可能会引起反垄断机构的注意，但在 Linux 大陆中，这只是简单的商业行为。结果导致为所有各方在自由市场相互竞争中得到一个更好的操作系统。

### 寻找合适的平衡

这样的“合作”，如 Novell 公司的创始人 Ray Noorda 所说的那样，存在于最佳的开源社区里，但只有在真正的社区里才存在。这很难做到，举个例子，对一个由单一供应商所主导的项目来说，实现正确的合作关系很困难。由 Google 发起的 [Kubernetes][15] 表明这是可能的，但其它像是 Docker 这样的项目却在为同样的目标而挣扎，很大一部分原因是他们一直不愿放弃对自己项目的技术领导。

也许 Kubernetes 能够工作的很好是因为 Google 并不觉得必须占据重要地位，而且事实上，它_希望_其他公司担负起开发领导的职责。凭借出色的代码解决了一个重要的行业需求，像 Kubernetes 这样的项目就能获得成功，只要 Google 既能帮助它，又为它开辟出一条道路，这就鼓励了 Red Hat 及其它公司做出杰出的贡献。

不过，Kubernetes 是个例外，就像 Linux 曾经那样。成功是因为企业的贪婪，有许多要考虑的，并且要在之间获取平衡。如果一个项目仅仅被公司自己的利益所控制，常常会在公司的技术管理上体现出来，而且再怎么开源许可也无法对企业产生影响。

简而言之，Linux 的成功运作是因为众多企业都想要控制它但却难以做到，由于其在工业中的重要性，使得开发者和构建人员更愿意作为一名 _Linux 开发者_ 而不是 Red Hat （或 Intel 亦或 Oracle … ）工程师。

--------------------------------------------------------------------------------

via: https://www.datamation.com/open-source/why-linux-works.html

作者：[Matt Asay][a]
译者：[softpaopao](https://github.com/softpaopao)
校对：[wxy](https://github.com/wxy)

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
