为什么微服务是一个安全问题
============================================================

### 你可能并不想把所有的遗留应用全部分解为微服务，或许你可以考虑开始一段安全之旅。

![Why microservices are a security issue](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook20 16_security_cc.png?itok=3V07Lpko)

Image by : Opensource.com

我为这篇文章起个标题，使出 “洪荒之力”，也很担心这会遇到 “好奇心点击”。如果你点击它，是因为激起了你的好奇，那么（我）表示抱歉。[1][5] 我是希望你留下来的 [2][6]：这里有有趣的观点以及很多 [3][7] 注解。我不是故意提出微服务会导致安全问题——尽管如同很多组件一样（都有安全问题）。当然，这些微服务是那些涉及安全（人员）的趣向所在，最佳对象。

为什么这样说？好（问题），对于我们这些有[系统安全][16] （的人来说），此时这个世界才是一个有趣的地方。我们看到分布式系统的增长，带宽便宜了并且延迟低了。加上
"轻松上云"（部署到云的便利性在增加），越来越多的架构师们开始意识到应用是可以分解的。他们可以分解应用程序而不只是多个层，并且层内还能分为多个组件。当然均衡负载，对一个层次内的各个组件协同一个任务有帮助。但是增长揭露不同的服务作为小附件已经导致架构的增长，以及实施微服务的部署。

更多关于微服务

*   [如何向你的 CEO 首席执行官 解释微服务][1]

*   [免费电子书：微服务与面向服务的体系架构][2]

*   [为微服务的 DevOps 保驾护航][3]

所以，[什么是微服务][23]？我同意[维基百科的定义][24]，尽管有趣的关于安全性没有提起。[4][17]我喜欢微服务的一点是，精心设计符合 Peter H. Salus 描述的 [UNIX 哲学][25] 的前俩点：

1.  程序应该只关注一个目标，并尽可能把它做好。
2.  让程序能够互相协同工作。
3.  应该让程序处理文本数据流，因为这是一个通用的接口。

三者中最后一个小小的不相关，因为 UNIX 哲学 通常被用来指代独立应用，它常有一个命令实例化。但是，它确实包含了微服务的基本要求之一：必须具有定义 "明确" 的接口。

明确下，我指的不仅仅是很多外部 API 访问的方法，还有正常的微服务输入输出操作——以及，如果有任何副作用。就像我之前的文章描述的，“[五个特征良好的系统架构][18]”，如果你能设计一个系统，数据和描述主体是至关重要的。这里，在我们的微服务描述上，我们得到查看为什么这些是很重要的。因为对我来说，微服务架构的关键未来定义是可分解性。如果你要分解 [5][8] 你的架构，你必须非常非常非常的清楚 "bits"
组件要做什么。

在这里，安全的要来了。准确描述特定组件应该做什么以允许你：

*   查看您的样图
*   确保您的实现符合描述
*   提出可重用测试单元来审查功能
*   跟踪实施中的错误并纠正错误
*   测试意料外的产出
*   监视不当行为
*   审核未来可能的真实行为

现在，这些东西（微服务）可能都在一个大架构里了吗？是的。但如果实体是在更复杂的配置中链接或组合在一起，他们会随着越来越难。为确保正确的实施和贯彻，当你有小块一起工作。以及如果你不能确定单个组件正在做他们应正在工作的，那么衍生出复杂系统运行状况和不正确行为就困难的多了。

不管怎样，它不止于此。由于我已经在许多[以往场合][19]提过，写足够安全的代码是困难的，[7][9] 证实它应该做的更加困难。因此，有理由限制特定安全要求的代码——密码检测、加密、加密密钥管理、授权、等等。——变的小，明确的快。然后你可以执行上面提到所有事情，以确定正确完成。

以及还有更多。我们都知道并不是每个人都擅长于编写与安全相关的代码。通过分解你的体系架构，你得到机会去把最棒的安全人员去限制 J. 随机编码器 [8][10] 会把一些关键的安全控制措施绕过或降级的危险。

它可以作为学校的机会：它总能够指向 设计/实现/测试/监视元组 并且说：“听，读，标记，学习，内在消化。这是应该做的。[9][11] ”

是否应该将所有遗留应用程序分解为微服务？ 你可能可能不会。 但是考虑到所有的好处，你可以考虑从安全功能开始。

* * *

1、有一点——有读者总是好的。

2、我知道他们的意义：我写下了他们。

3、可能不那么使人着迷。

4、在写这篇文章时。我或你们中的一个可能会去编辑改变它。

5、这很有趣，听起来想一个园艺术语。并不是说我很喜欢园艺，但仍然... [6][12]

6、有趣地，我首先写了 “如果你要分解你的架构....” 这听起来想是一个 IT 主题的谋杀电影标题。

7、定期的读者可能会记得提到的优秀电影 “The Thick of It”

8、其他存在的常规人物：请随便选择。

9、不是加密摘要：我不认同原作者的想法。

这篇文章最初出在[爱丽丝与鲍伯](https://zh.wikipedia.org/zh-hans/%E6%84%9B%E9%BA%97%E7%B5%B2%E8%88%87%E9%AE%91%E4%BC%AF)——一个安全博客上，并被许可转载。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/microservices-are-security-issue

作者：[Mike Bursell ][a]
译者：[erlinux](https://itxdm.me)
校对：[校对者ID](https://github.com/校对者ID)

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
