为什么微服务是一个安全问题
============================================================

> 你可能并不想把所有的遗留应用全部分解为微服务，或许你可以考虑从安全功能开始。

![Why microservices are a security issue](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_security_cc.png?itok=3V07Lpko)

Image by : Opensource.com

我为了给这篇文章起个标题，使出 “洪荒之力”，也很担心这会变成标题党。如果你点击它，是因为它激起了你的好奇，那么我表示抱歉 ^[注1][5] 。我当然是希望你留下来阅读的 ^[注2][6] ：我有很多有趣的观点以及很多 ^[注3][7] 脚注。我不是故意提出微服务会导致安全问题——尽管如同很多组件一样都有安全问题。当然，这些微服务是那些安全方面的人员的趣向所在。进一步地说，我认为对于那些担心安全的人来说，它们是优秀的架构。

为什么这样说？这是个好问题，对于我们这些有[系统安全][16] 经验的人来说，此时这个世界才是一个有趣的地方。我们看到随着带宽便宜了并且延迟降低了，分布式系统在增长。加上部署到云愈加便利，越来越多的架构师们开始意识到应用是可以分解的，不只是分成多个层，并且层内还能分为多个组件。当然，均衡负载可以用于让一个层内的各个组件协同工作，但是将不同的服务输出为各种小组件的能力导致了微服务在设计、实施和部署方面的增长。

所以，[到底什么是微服务呢][23]？我同意[维基百科的定义][24]，尽管没有提及安全性方面的内容^[注4][17] 。 我喜欢微服务的一点是，经过精心设计，其符合 Peter H. Salus 描述的 [UNIX 哲学][25] 的前俩点：

1.  程序应该只做一件事，并尽可能把它做好。
2.  让程序能够互相协同工作。
3.  应该让程序处理文本数据流，因为这是一个通用的接口。

三者中最后一个有点不太相关，因为 UNIX 哲学通常被用来指代独立应用，它常有一个实例化的命令。但是，它确实包含了微服务的基本要求之一：必须具有“定义明确”的接口。

这里的“定义明确”，我指的不仅仅是可外部访问的 API 的方法描述，也指正常的微服务输入输出操作——以及，如果有的话，还有其副作用。就像我之前的文章描述的，“[良好的系统架构的五个特征][18]”，如果你能够去设计一个系统，数据和主体描述是至关重要的。在此，在我们的微服务描述上，我们要去看看为什么这些是如此重要。因为对我来说，微服务架构的关键定义是可分解性。如果你要分解 ^[注5][8] 你的架构，你必须非常、非常地清楚每个细节（“组件”）要做什么。

在这里，就要开始考虑安全了。特定组件的准确描述可以让你：

*   审查您的设计
*   确保您的实现符合描述
*   提出可重用测试单元来审查功能
*   跟踪实施中的错误并纠正错误
*   测试意料之外的产出
*   监视不当行为
*   审核未来可能的实际行为

现在，这些微服务能用在一个大型架构里了吗？是的。但如果实体是在更复杂的配置中彼此链接或组合在一起，它们会随之越来越难。当你让一小部分可以彼此配合工作时，确保正确的实施和行为是非常、非常容易的。并且如果你不能确定单个组件正在做它们应该作的，那么确保其衍生出来的复杂系统的正确行为及不正确行为就困难的多了。

而且还不止于此。如我已经在许多[以往场合][19]提过的，写足够安全的代码是困难的^[注7][9] ，证实它应该做的更加困难。因此，有理由限制有特定安全要求的代码——密码检测、加密、加密密钥管理、授权等等——将它们变成小而定义明确的代码块。然后你就可以执行我上面提及所有工作，以确保正确完成。

还有，我们都知道并不是每个人都擅长于编写与安全相关的代码。通过分解你的体系架构，将安全敏感的代码限制到定义明确的组件中，你就可以把你最棒的安全人员放到这方面，并限制了 J.佛系.码奴 ^[注8][10] 绕过或降级一些关键的安全控制措施的危险。

它可以作为学习的机会：它对于设计/实现/测试/监视的兄弟们都是好的，而且给他们说：“听、读、标记、学习，并且引为己用 ^[注9][11] 。这是应该做的。”

是否应该将所有遗留应用程序分解为微服务？ 不一定。 但是考虑到其带来的好处，你可以考虑从安全入手。

* * *

- 注1、有一点——有读者总是好的。
- 注2、这是我写下文章的意义。
- 注3、可能没那么有趣。
- 注4、在我写这篇文章时。我或你们中的一个可能会去编辑改变它。
- 注5、这很有趣，听起来想一个园艺术语。并不是说我很喜欢园艺，但仍然... ^[注6][12]
- 注6、有意思的是，我最先写的 “如果你要分解你的架构....” 听起来想是一个 IT 主题的谋杀电影标题。
- 注7、长期读者可能会记得提到的优秀电影 “The Thick of It”
- 注8、其他的什么人：请随便选择。
- 注9、不是加密<ruby>摘要<rt>digest</rt></ruby>：我不认同原作者的想法。

这篇文章最初出在[爱丽丝、伊娃与鲍伯](https://zh.wikipedia.org/zh-hans/%E6%84%9B%E9%BA%97%E7%B5%B2%E8%88%87%E9%AE%91%E4%BC%AF)——一个安全博客上，并被许可转载。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/microservices-are-security-issue

作者：[Mike Bursell][a]
译者：[erlinux](https://itxdm.me)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mikecamel
[1]:https://blog.openshift.com/microservices-how-to-explain-them-to-your-ceo/?intcmp=7016000000127cYAAQ&amp;amp;amp;amp;amp;amp;amp;amp;src=microservices_resource_menu1
[2]:https://www.openshift.com/promotions/microservices.html?intcmp=7016000000127cYAAQ&amp;amp;amp;amp;amp;amp;amp;amp;src=microservices_resource_menu2
[3]:https://opensource.com/business/16/11/secured-devops-microservices?src=microservices_resource_menu3
[4]:https://opensource.com/article/17/11/microservices-are-security-issue?rate=GDH4xOWsgYsVnWbjEIoAcT_92b8gum8XmgR6U0T04oM
[5]:https://opensource.com/article/17/11/microservices-are-security-issue#1
[6]:https://opensource.com/article/17/11/microservices-are-security-issue#2
[7]:https://opensource.com/article/17/11/microservices-are-security-issue#3
[8]:https://opensource.com/article/17/11/microservices-are-security-issue#5
[9]:https://opensource.com/article/17/11/microservices-are-security-issue#7
[10]:https://opensource.com/article/17/11/microservices-are-security-issue#8
[11]:https://opensource.com/article/17/11/microservices-are-security-issue#9
[12]:https://opensource.com/article/17/11/microservices-are-security-issue#6
[13]:https://aliceevebob.com/2017/10/31/why-microservices-are-a-security-issue/
[14]:https://opensource.com/user/105961/feed
[15]:https://opensource.com/tags/security
[16]:https://aliceevebob.com/2017/03/14/systems-security-why-it-matters/
[17]:https://opensource.com/article/17/11/microservices-are-security-issue#4
[18]:https://opensource.com/article/17/10/systems-architect
[19]:https://opensource.com/users/mikecamel
[20]:https://opensource.com/users/mikecamel
[21]:https://opensource.com/users/mikecamel
[22]:https://opensource.com/article/17/11/microservices-are-security-issue#comments
[23]:https://opensource.com/resources/what-are-microservices
[24]:https://en.wikipedia.org/wiki/Microservices
[25]:https://en.wikipedia.org/wiki/Unix_philosophy
