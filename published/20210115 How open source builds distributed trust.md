[#]: collector: (lujun9972)
[#]: translator: (MareDevi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-15081-1.html)
[#]: subject: (How open source builds distributed trust)
[#]: via: (https://opensource.com/article/21/1/open-source-distributed-trust)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

开源如何构建分布式信任
======

> 对开源的信任是一个正反馈循环。  

![信任][1]

这是我即将在 [Wiley][2] 出版的《<ruby>计算和云计算中的信任<rt>Trust in Computing and the Cloud</rt></ruby>》一书中经过编辑的节选，也是我之前写的一篇文章<ruby>[《信任与选择开源》][3]<rt>Trust & choosing open source</rt></ruby>的延伸。

在那篇文章中，我提出了一个问题。当我们说 “我相信开放源码软件” 时，我们在做什么？作为回答，我认为，我们正在做的是确定有足够多的编写和测试该软件的人与我有类似的要求，而且他们的专业知识加在一起，使我使用该软件的风险可以接受。我同时也介绍了 “<ruby>分布式信任<rt>distributed trust</rt></ruby>” 的概念。

在社区内分布信任的概念是亚里士多德提出的 “<ruby>人群智慧理论<rt>wisdom of the crowd theory</rt></ruby>” 的应用，其中的假设是，许多人的意见通常比一个人或少数人的意见更有明智。虽然在某些情况下，最简单的形式显然是错误的 —— 最明显的例子是民众对极权主义政权的支持 —— 但这一原则可以为建立某些信息提供一个非常有效的机制。

我们称这种集体经验的提炼为“分布式信任”，它通过互联网上的许多机制收集。如 TripAdvisor 或 Glassdoor，记录了关于组织或其提供的服务的信息，还有像 UrbanSitter 或 LinkedIn，允许用户添加关于特定人的信息（例如，见 LinkedIn 的推荐和技能与个人档案中的认可部分）。从这些例子中可以获得的利益因网络效应而大大增加，因为随着成员数量的增加，成员之间可能的联系数量也成倍增加。

分布式信任的例子还包括像 Twitter 这样的平台，一个账户的追随者数量可以被视为衡量其声誉，甚至是衡量其可信度的标准，我们应该以强烈的怀疑态度去看待这种计算。事实上，Twitter 认为它必须解决拥有大量追随者的账户的社会力量问题，并建立了一个为 “验证账户” 机制，让人们知道 “一个具有公共利益的账户是真实的”。但是有趣的是，该公司不得不暂停这项服务，因为用户对 “验证” 的确切含义或暗示的期望出现了问题：这就是不同群体之间对内容理解不同的典型案例。

那么，开源的相关性在哪里呢？开源的社区方面实际上就是建立分布式信任的一个驱动力。因为一旦你成为一个开源项目周围社区的一部分，你就会承担一个或多个角色，一旦你说你 “信任” 一个开源项目，你就会开始信任这些角色（见我之前的文章）。例如，架构师、设计师、开发人员、审查人员、技术写作、测试人员、部署人员、错误报告者或错误修复者。你对一个项目的参与越多，你就越是社区的一部分，久而久之，这就可以成为一个 “<ruby>实践社区<rt>community of practice</rt></ruby>”。

Jean Lave 和 Etienne Wenger 在<ruby>[《情境学习：正当的外围参与》][4]<rt>Situated Learning: Legitimate Peripheral Participation</rt></ruby>一书中提出了实践社区的概念，团体在成员热情分享和参与共同活动的过程中演变成社区，导致他们的技能和知识共同提高。这里的核心概念是：当参与者围绕实践社区进行学习时，他们同时也成为社区的成员。

> “正当的的外围参与既指在实践中知识技能身份的发展，也指实践社区的再生产和转化。”

Wenger 在 <ruby>[《实践社区：学习、意义和身份》][5]<rt>Communities of Practice: Learning, Meaning, and Identity</rt></ruby> 中进一步探讨了实践社区的概念：它们如何形成、对其健康的要求，以及它们如何鼓励学习。他认为，意义的可协商性（“我们为什么要一起工作，我们要实现什么？”）是实践社区的核心，并指出，如果没有个人的参与、想象力和一致性，实践社区将不会有活力。

我们可以把这一点与我们对分布式信任如何建立和构建的看法结合起来：当你意识到你对开源的影响可以与其他人的影响相同时，你对社区成员的分布式信任关系就变得不那么具有传递性（第二或第三手甚至更遥远），而是更加直接。你明白，你对你所运行的软件的创建、维护、需求和质量所能产生的影响，可以与所有其他以前匿名的贡献者一样，你现在正在与他们形成一个实践社区，或者你正在加入他们的现有实践社区。然后，你就会成为一个信任关系网络的一部分，这个网络是分布式的，但与你购买和操作专利软件时的经历相差不大。

这个过程并不会停止：因为开源项目的一个共同属性是“交叉授粉”，即一个项目的开发者也在其他项目上工作。由于多个开源项目之间的网络效应，使得对其他项目的重用和依赖性上升，导致整个项目的吸收量增加。

这就很容易理解为什么许多开源贡献者会成为开源爱好者或传道者，不仅仅是为单个项目，而是为整个开源项目。事实上，斯坦福大学社会学家 [Mark Granovetter][6] 的工作表明，社区内太多的强关系会导致小团体和停滞不前，但弱关系会使思想和趋势在社区内流动。这种对其他项目和围绕它们存在的社区的认识，以及想法在项目间的灵活性，导致分布式信任能够被扩展（尽管保证比较弱），超越贡献者在他们有直接经验的项目中所经历的直接或短链间接关系，并向其他项目扩展，因为外部观察或外围参与显示贡献者之间存在类似关系。

简单地说，参与开源项目并通过参与建立信任关系的行为会导致对类似的开源项目或只是对其他类似的开源项目产生更强的分布式信任。

这对我们每个人来说意味着什么？它意味着我们越是参与开源，我们对开源的信任度就越高，而其他人对开源的参与度也会相应提高，从而对开源的信任度也会提高。对开源的信任不仅仅是一个网络效应：它是一个正反馈循环！

* * *

_本文最初发表于 [Alice, Eve, and Bob][7]，经作者许可转载。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/open-source-distributed-trust

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[MareDevi](https://github.com/MareDevi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_trust.png?itok=KMfi0Rdo (Trust)
[2]: https://wiley.com/
[3]: https://aliceevebob.com/2019/06/18/trust-choosing-open-source/
[4]: https://books.google.com/books/about/Situated_Learning.html?id=CAVIOrW3vYAC
[5]: https://books.google.com/books?id=Jb8mAAAAQBAJ&dq=Communities%20of%20Practice:%20Learning,%20meaning%20and%20identity&lr=
[6]: https://en.wikipedia.org/wiki/Mark_Granovetter
[7]: https://aliceevebob.com/2020/11/17/how-open-source-builds-distributed-trust/
