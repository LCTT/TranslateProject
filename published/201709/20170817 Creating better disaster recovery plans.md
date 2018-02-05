创建更好的灾难恢复计划
============================================================

![](https://d3tdunqjn7n0wj.cloudfront.net/720x480/operations-crane-crop-b5a1bcda0327f02d4fd714ce35f8ce8d.jpg)

> Tanya Reilly 的五个问题：相互依赖的服务如何使恢复更加困难，为什么有意并预先管理依赖是个好主意。

我最近请 Google 的网站可靠性工程师 Tanya Reilly 分享了她关于如何制定更好的灾难恢复计划的想法。Tanya 将在 10 月 1 日到 4 日在纽约举行的 O'Reilly Velocity Conference 上发表了一个题为《[你有没有试着把它关闭之后再打开？] [9]》的演讲。

### 1、 在计划备份系统策略时，人们最常犯的错误是什么？

经典的一条是“**你不需要备份策略，你需要一个恢复策略**”。如果你有备份，但你尚未测试恢复它们，那么你没有真正的备份。测试不仅仅意味着知道你可以获得数据，还意味着知道如何把它放回数据库，如何处理增量更改，甚至如果你需要的话，如何重新安装整个系统。这意味着确保你的恢复路径不依赖于与数据同时丢失的某些系统。

但测试恢复是枯燥的。这是人们在忙碌时会偷工减料的那类事情。这值得花时间使其尽可能简单、无痛、自动化，永远不要靠任何人的意志力！同时，你必须确保有关人员知道该怎么做，所以定期进行大规模的灾难测试是很好的。恢复演练是个好方法，可以找出该过程的文档是否缺失或过期，或者你是否没有足够的资源（磁盘、网络等）来传输和重新插入数据。

### 2、 创建<ruby>灾难恢复<rt>disaster recovery</rt></ruby> （DR） 计划最常见的挑战是什么？

我认为很多 DR 是一种事后的想法：“我们有这个很棒的系统，我们的业务依赖它……我猜我们应该为它做 DR？”而且到那时，系统会非常复杂，充满相互依赖关系，很难复制。

第一次安装的东西，它通常是由人手动调整才正常工作的，有时那是个具体特定的版本。当你构建_第二_个时，很难确定它是完全一样的。即使在具有严格的配置管理的站点中，你也可能丢了某些东西，或者过期了。

例如，如果你已经失去对解密密钥的访问权限，那么加密备份没有太多用处。而且任何只在灾难中使用的部分都可能从你上次检查它们过后就破环了。确保你已经涵盖了所有东西的唯一方法做认真地故障切换。当你准备好了的，就计划一下你的灾难（演练）吧！

如果你可以设计系统，以使灾难恢复模式成为正常运行的一部分，那么情况会更好。如果你的服务从一开始就被设计为可复制的，添加更多的副本就是一个常规的操作并可能是自动化的。没有新的方法，这只是一个容量问题。但是，系统中仍然存在一些只能在一个或两个地方运行的组件。偶然计划中的假灾难能够很好地将它们暴露出来。

顺便说一句，那些被遗忘的组件可能包括仅在一个人的大脑中的信息，所以如果你自己发现说：“我们不能在 X 休假回来前进行 DR 故障切换测试”，那么那个人是一个危险的单点失败。

仅在灾难中使用的部分系统需要最多的测试，否则在需要时会失败。这个部分越少越安全，且辛苦的测试工作也越少。

### 3、 为什么服务相互依赖使得灾难恢复更加困难？

如果你只有一个二进制文件，那么恢复它是比较容易的：你做个二进制备份就行。但是我们越来越多地将通用功能分解成单独的服务。微服务意味着我们有更多的灵活性和更少地重新发明轮子：如果我们需要一个后端做一些事情，并且有一个已经存在，那么很好，我们就可以使用它。但是一些需要保留很大的依赖关系，因为它很快会变得纠缠。

你可能知道你直接使用的后端，但是你可能不会注意到有新的后端添加到你使用的库中。你可能依赖于某个东西，它也间接依赖于你。在依赖中断之后，你可能会遇到一个死锁：两个系统都不能启动，直到另一个运行并提供一些功能。这是一个困难的恢复情况！

你甚至可以最终遇到间接依赖于自身的东西，例如你需要配置启动网络的设备，但在网络关闭时无法访问该设备。人们通常会提前考虑这些循环依赖，并且有某种后备计划，但是这些本质上是不太行得通的方式：它们只适用于极端情况，并且以不同的方式使用你的系统、进程或代码。这意味着，它们很可能有一个不会被发现的问题，直到你真的，真的需要它们的工作的时候才发现。

### 4、 你建议人们在感觉需要之前就开始有意管理其依赖关系，以防止潜在的灾难性系统故障。为什么这很重要，你有什么建议有效地做到这一点？

管理你的依赖关系对于确保你可以从灾难中恢复至关重要。它使操作系统更容易。如果你的依赖不可靠，那么你就不可靠，所以你需要知道它们是什么。

虽然在它们变得混乱后也可以开始管理依赖关系，但是如果你早点开始，它会变得更容易一些。你可以设置使用各种服务策略——例如，你必须在堆栈中的这一层依赖于这组系统。你可以通过使其成为设计文件审查的常规部分，引入考虑依赖关系的习惯。但请记住，依赖关系列表将很快变得陈旧。如果你有程序化的发现依赖关系的方式，甚至强制实施依赖，这是最好的。 [我的 Velocity 谈话][10]涵盖了我们如何做到这一点。

早期开始的另一个优点是，你可以将服务拆分为垂直“层”，每个层中的功能必须能够在下一个层启动之前完全在线。所以，例如，你可以说网络必须能够完全启动而不借助任何其他服务。然后说，你的存储系统应该仅仅依赖于网络，程序后端应该仅仅依赖于网络和存储，等等。不同的层次对于不同的架构是有意义的。

如果你提前计划，新服务更容易选择依赖关系。每个服务应该只依赖堆栈中较低的服务。你仍然可以结束循环，在相同的层次服务上批次依赖 —— 但是它们可以更加紧密地包含，并且在逐个基础上处理更容易。

### 5、 你对 Velocity NY 的其他部分感兴趣么？

我整个星期二和星期三的时间表都完成了！正如你可能收集的那样，我非常关心大型相互依赖的系统的可管理性，所以我期待听到 [Carin Meier 关于管理系统复杂性的想法][11]、[Sarah Wells 的微服务][12]和 [Baron 的可观察性][13] 的谈话。我非常着迷听到 [Jon Moore 关于 Comcast 如何从年度发布到每天发布的故事][14]。作为一个前系统管理员，我很期待听到 [Bryan Liles 对这个职位走向的看法][15]。

--------------------------------------------------------------------------------

作者简介：

Nikki McDonald 是 O'Reilly Media，Inc. 的内容总监。她住在密歇根州的安娜堡市。

Tanya Reilly 自 2005 年以来一直是 Google 的系统管理员和站点可靠性工程师，致力于分布式锁、负载均衡和引导等底层基础架构。在加入 Google 之前，她是爱尔兰最大的 ISP eircom.net 的系统管理员，在这之前她担当了一个小型软件公司的整个 IT 部门。

----------------------------

via: https://www.oreilly.com/ideas/creating-better-disaster-recovery-plans

作者：[Nikki McDonald][a], [Tanya Reilly][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.oreilly.com/people/nikki-mcdonald
[b]:https://www.oreilly.com/people/5c97a-tanya-reilly
[1]:https://pixabay.com/en/crane-baukran-load-crane-crane-arm-2436704/
[2]:https://conferences.oreilly.com/velocity/vl-ny?intcmp=il-webops-confreg-reg-vlny17_new_site_right_rail_cta
[3]:https://www.oreilly.com/people/nikki-mcdonald
[4]:https://www.oreilly.com/people/5c97a-tanya-reilly
[5]:https://conferences.oreilly.com/velocity/vl-ny?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_text_cta
[6]:https://www.oreilly.com/ideas/creating-better-disaster-recovery-plans
[7]:https://conferences.oreilly.com/velocity/vl-ny?intcmp=il-webops-confreg-reg-vlny17_new_site_right_rail_cta
[8]:https://conferences.oreilly.com/velocity/vl-ny?intcmp=il-webops-confreg-reg-vlny17_new_site_right_rail_cta
[9]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/61400?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
[10]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/61400?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
[11]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/62779?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
[12]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/61597?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
[13]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/61630?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
[14]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/62733?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
[15]:https://conferences.oreilly.com/velocity/vl-ny/public/schedule/detail/62893?intcmp=il-webops-confreg-reg-vlny17_new_site_creating_better_disaster_recovery_plans_body_text_cta
