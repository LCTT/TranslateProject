[#]: collector: (lujun9972)
[#]: translator: (chen-ni)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11000-1.html)
[#]: subject: (Why startups should release their code as open source)
[#]: via: (https://opensource.com/article/19/5/startups-release-code)
[#]: author: (Clément Flipo https://opensource.com/users/cl%C3%A9ment-flipo)

为什么初创公司应该将代码开源
======

> Dokit 曾经怀疑将自己的知识开源可能是一个失败的商业决策，然而正是这个选择奠定了它的成功。

![open source button on keyboard][1]

回想一个项目开展最初期的细节并不是一件容易的事情，但这有时候可以帮助你更清晰地理解这个项目。如果让我来说，关于 [Dokit][2] 这个用来创建用户手册和文档的平台的最早的想法来自我的童年。小时候我家里都是 Meccano（LCTT 译注：一种类似乐高的拼装玩具）和飞机模型之类的玩具，对于我来说，游戏中很重要的一部分就是动手制作，把独立的零件组装在一起来创造一个新的东西。我父亲在一家 DIY 公司工作，所以家里到处都建筑、修理，以及使用说明书。小的时候父母还让我参加了童子军，在那里我们制作桌子和帐篷，还有泥巴做的烧烤炉，这些事情都培养了我在共同学习中感受到的乐趣，就像我在开源活动中感受到的一样。

在童年学到的修理东西和回收产品的本领成为了我工作的一部分。后来我决心要用线上的方式，还原这种在家里或者小组里学习如何制作和修理东西时的那种非常棒的感觉。Dokit 就从这个想法中诞生了。

### 创业初期

事情并非一帆风顺，在我们的公司于 2017 年成立之后，我很快就意识到那些最庞大、最值得奋斗的目标一般来说也总是最困难的。如果想要实现我们的计划 —— 彻底改变 [老式的说明书和用户手册的编写和发行方式][3]，并且在这个细分市场（我们非常清楚这一点）里取得最大的影响力 —— 那么确立一个主导任务就十分关键，它关乎项目的组织方式。我们据此做出了第一个重要决策：首先 [在短时间内使用一个已有的开源框架 MediaWiki 制作产品原型来验证我们的想法][4]，然后将我们的全部代码都作为开源项目发布。

当时 [MediaWiki][5] 已经在正常运作了，事后看来，这一点让我们的决策变得容易了许多。这个平台已经拥有我们设想的最小可用产品（MVP）所需要的 90% 的功能，并且在全世界范围内有 15000 名活跃的开发者。MediaWiki 因为是维基百科的驱动引擎而小有名气，如果没有来自它的支持，事情对我们来说无疑会困难很多。还有一个许多公司都在使用的文档平台 Confluence 也有一些不错的功能，但是最终在这两者之间做出选择还是很容易的。

出于对社区的信赖，我们把自己平台的初始版本完全放在了 GitHub 上。我们甚至还没有真正开始进行推广，就已经可以看到世界各地的创客们开始使用我们的平台，这种令人激动的感觉似乎说明我们的选择是正确的。尽管 [创客以及 Fablab 运动][6]（LCTT 译注：Fablab 是一种向个人提供包括 3D 打印在内的电子化制造服务的小型工坊）都在鼓励用户积极分享说明材料，并且在 [Fablab 章程][7] 中也写明了这一点，但现实中像模像样的文档还是不太多见。

人们喜欢使用我们这个平台的首要原因是它可以解决一个非常实在的问题：一个本来还不错的项目，却使用了非常糟糕的文档 —— 其实这个项目本来可以变得更好的。对我们来说，这有点儿像是在修复创客及 DIY 社区里的一个裂缝。在我们的平台发布后的一年之内，Fablabs、[Wikifab][8]、[Open Source Ecology][9]、[Les Petits Debrouillards][10]、[Ademe][11] 以及 [Low-Tech Lab][12] 都在他们的服务器上安装了我们的工具，用来制作逐步引导的教程。

甚至在我们还没有发新闻稿之前，我们的其中一个用户 Wikifab 就开始在全国性媒体上收到“DIY 界的维基百科”这样的称赞了。短短两年之内，我们看到有数百的社区都在他们自己的 Dokits 上开展了项目，从有意思的、搞笑的，到那种很正式的产品手册都有。这种社区的力量正是我们想要驾驭的，并且有这么多的项目 —— 从风力涡轮机到宠物喂食器 —— 都在使用我们创建的平台编写非常有吸引力的产品手册，这件事情真的令我们赞叹不已。

### 项目开源

回头看看前两年的成功，很明显选择开源是我们能迅速取得成果的关键因素。最有价值的事情就是在开源项目中获得反馈的能力了。如果一段代码无法正常运行，[会有人立刻告诉我们][14]。如果可以从这些已经在使用你提供的服务的人那里学到这么多东西，为什么还要需要等着和顾问们开会呢？

社区对我们这个项目的关注程度也反映出了这个市场的潜力（包括利润上的潜力）。[巴黎有一个非常好的、成长迅速的开发者社区][15]（LCTT 译注：Dokit 是一家设立在巴黎的公司），但是开源将我们从一个只有数千当地人的小池子里带到了全世界数百万的开发者身边，他们都将成为我们的创作中的一部分。与此同时，代码的开放性也让我们的用户和客户更加放心，因为即使我们这个公司不在了，代码仍然会存续下去。

如果说上面这些都是在我们之前对开源的预期之中的话，其实这一路上也有不少惊喜。因为开源，我们获得了更多的客户、声望以及精准推广，这种推广本来以我们有限的预算是负担不起的，现在却不需要我们支付费用。我们发现开源代码还改善了我们的招聘流程，因为在雇佣之前就可以通过我们的代码来测试候选人，并且被雇佣之后的入职过程也会更加顺利。

开发者在完全公开的情况下写代码，既有一点尴尬，同时也很团结，这对我们提升产品质量很有帮助。人们可以互相发表意见和反馈，并且因为工作都是完全公开的，人们似乎会尽可能地想做到最好。为了不断优化、不断重构 Dokit 的运行方式，我们明白未来应该在对社区的支持上做得更好。

### 下一步是什么？

尽管我们对正在做的事情一直都很有信念，并且看到很多出色的产品说明书都是用我们的软件制作出来的，我们还是会对这个项目的成长不断地感到兴奋，并且非常确信未来一定会很好。

在创业初期，我们对将自己的知识免费分发出去这件事还是非常担心的。事实证明正好相反 —— 正是开源让我们能够迅速构建起一个可持续的初创企业。Dokit 平台的设计初衷是通过社区的支持，让它的用户有信心去构建、组装、修理和创造全新的发明。事后看来，我们用开源的方式去构建了 Dokit 这个平台，这和 Dokit 本身想做的其实正好是同一件事情。

如同修理或者组装一件实体产品一样，只有当你对自己的方法有信心的时候，事情才会越来越顺利。现在，在我们创业的第三个年头，我们开始注意到全世界对这个领域的兴趣在增加，因为它迎合了出于不断变化的居家和生活方式的需求而 [想要使用或重复利用以及组装产品的新一代客户][16]。我们正是在通过线上社区的支持，创造一个让大家能够在自己动手做东西的时候感到更加有信心的平台。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/startups-release-code

作者：[Clément Flipo][a]
选题：[lujun9972][b]
译者：[chen-ni](https://github.com/chen-ni)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cl%C3%A9ment-flipo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/button_push_open_keyboard_file_organize.png?itok=KlAsk1gx (open source button on keyboard)
[2]: https://dokit.io/
[3]: https://dokit.io/9-reasons-to-stop-writing-your-user-manuals-or-work-instructions-with-word-processors/
[4]: https://medium.com/@gofloaters/5-cheap-ways-to-build-your-mvp-71d6170d5250
[5]: https://en.wikipedia.org/wiki/MediaWiki
[6]: https://en.wikipedia.org/wiki/Maker_culture
[7]: http://fab.cba.mit.edu/about/charter/
[8]: https://wikifab.org/
[9]: https://www.opensourceecology.org/
[10]: http://www.lespetitsdebrouillards.org/
[11]: https://www.ademe.fr/en
[12]: http://lowtechlab.org/
[13]: https://www.20minutes.fr/magazine/economie-collaborative-mag/2428995-20160919-pour-construire-leurs-meubles-eux-memes-ils-creent-le-wikipedia-du-bricolage
[14]: https://opensource.guide/how-to-contribute/
[15]: https://www.rudebaguette.com/2013/03/here-are-the-details-on-the-new-developer-school-that-xavier-niel-is-launching-tomorrow/?lang=en
[16]: https://www.inc.com/ari-zoldan/why-now-is-the-best-time-to-start-a-diy-home-based.html
