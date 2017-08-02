拯救者 Linux：我是如何给我的团队引入 Linux 的
============================================================

> 在项目早期就遇到公开的失败后，一个著名大学的 IT 团队决定将他们的 web 注册系统部署到 Linux上，此举几乎将服务器的最大用户访问量提高了 3 倍

![Linux to the rescue: How I introduced my organization to Linux](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/OSDC_Penguin_Image_520x292_12324207_0714_mm_v1a.png?itok=WfAkwbFy "Linux to the rescue: How I introduced my organization to Linux")

1998年，我在明尼苏达大学为一个新的 web 团队管理他们的服务器管理组。明尼苏达大学是一个非常大的大学，个个院校拥有接近 6000 名在校大学生。当时学校是用一个上了年纪的大型机系统来做学生的档案管理系统，这种系统已经过时了，所以需要做出改变。

这个系统不是 Y2K 类型的（LCTT 译注：保存年份时只用两位数，导致记录 2000 年时计算机会记录为 1900 年，详见[What Does Y2K Compliant Mean?](https://stackoverflow.com/questions/18200744/what-does-y2k-compliant-mean)），所以我们准备建立一个由仁科软件公司来交付的新的学生档案管理系统。这个新系统对明尼苏达大学来说有很多作用，不仅能够管理学生的档案，还能提供其他的一些功能。然而它却缺少了一项关键特性：你不能在你的浏览器上通过 web 来给你的班级进行注册。

按照今天的标准来看，这是一个重大的疏忽，但是在上世纪九十年代，互联网还是一个新生概念。亚马逊才建立不久，ebay 刚创业一年，google 呱呱坠地，Wikipedia 还没有影儿。所以 1998 年仁科公司没有支持 web 在线注册课程这个功能也就不足为奇了。但是明尼苏达大学作为 Gopher 网络的发源地，并且给之前的大型机系统开发了一套 web 功能接口，我们觉得 web 在线注册功能对于这个新的学生档案管理系统是至关重要的。

我们在这个 web 团队的任务就是去实现此管理系统的 web 在线注册功能。

幸运的是，我们并不是孤军奋战。我们联系了 IBM ，在第二年一起开始来搭建这个新的 web 在线注册系统。IBM 负责提供硬件和软件环境来运行这个 web 系统：3 个运行最新的 AIX 系统（类 UNIX 操作系统）、IBM Java 和 IBM WebSphere 平台的 SP 电脑节点，并用一个 IBM 的负载均衡器来实现 3 个节点的负载分流。

![AIX network diagram](https://opensource.com/sites/default/files/resize/diagram-aix_0-700x363.png "AIX network diagram")

在经过一年多的开发和测试后，我们的系统终于上线了！但不幸的是失败却接踵而至。

### 负载过大

在开发过程中，我们无法准确地模拟测试真实场景下许多学生同时登录的场景。原因不是没有测试环境，明尼苏达大学有定制的 web 负载测试软件包，而且 IBM 有自己的工具做补充，但是这个 web 系统在当时对我们来说实在是太陌生了，我们没有意识到这些测试工具是不能满足要求的。

通过数月的测试，我们将此 web 系统的预期负载量调整到 240 个并发用户。但不幸的是，我们实际的使用量却是预期的两倍左右，在第一天系统上线时，超过 400 名学生马上同时登录进系统，由于负载远远超出预期值，3 台 web 服务器直接宕机了。由于持续的高负载，服务器一直崩溃，只能不断地重启。一台刚重启完，另一台又宕机重启了，这种场景居然持续了一个月。

由于不能有效地通过 web 注册，学生只能通过原来的方法来注册：来到登记员的办公室，拿着笔注册，然后再出门。当地报纸也幸灾乐祸地嘲讽道："电脑软件的失败强迫学生只能面对面地注册！"

![Negative headlines about web registration crashes](https://opensource.com/sites/default/files/resize/headlines-700x522.jpg "Negative headlines about web registration crashes")

面对失败这个事实，我们尽自己全力在下一个开发周期中来提高软件性能，在之后 6 个月的时间里，我们疯狂地想去增强这套系统的负载能力。尽管增加了更多的代码，调整了多次配置，还是不能支持更多的用户。尽力了，然而面对的还是失败。

就如所料的，在下一个迭代周期后，迎接我们的还是失败。服务器由于负载问题一次又一次地宕机。这一次新闻标题已经变成了：“web 注册系统就是垃圾”。

在开始下一个为期 6 个月的迭代前，我们已经绝望了。没有人知道服务器不停宕机的原因，我们已经预期这个问题现在是无解的。我们是要采取一些措施来搞定这个问题，但是怎么做呢？以下是我们讨论得出的方法：

### 是否需要切换新的平台?

IBM 当时引入了 Linux，给它的 Java 和 WebSphere 平台做了二次开发。所有产品都获得了红帽公司的 RHEL 认证，并且有几个产品已经在我们的桌面系统上运行了。我们意识到了现在在 Linux 上已经有了完整的生态系统来运行我们的 web 管理系统，但是它能表现的比 AIX 更好吗？

在搭建好一个测试服务器并进行基本的负载测试后，我们惊奇的发现一台 Linux 服务器能够轻松地支持之前 3 台 AIX 服务器所不能支持的负载量，在相同的 web 代码、IBM Java 和 WebSphere 平台下，单台 Linux 服务器能够支持超过 200 个用户。

我们将这个消息告诉了登记员和 CIO，他们同意将 web 注册系统切换到 Linux 平台上。虽然这是我们第一次在明尼苏达大学跑 Linux，但是失败已成习惯，反而无所畏惧了。AIX 只会失败，Linux 却是我们唯一的希望。

我们马上基于 Linux 来进行开发。另一个组的同事也提供了几台 Intel 服务器来给我们使用，我们给服务器装上红帽系统和相关的 IBM 组件，然后在新系统上进行了持续性的负载测试，令人欣喜的是，Linux 服务器没有出现任何问题。

经过两个月高强度的开发测试，我们的新系统终于上线了，而且是巨大的成功！在巨大的负载下，web 注册系统在 Linux 的表现都堪称完美。同时在线峰值甚至超过了 600 名用户。Linux 拯救了明尼苏达大学的 web 注册系统~

### 成功的经验

当我回首这个项目时，我发现你可以用以下几个点来向你的团队介绍 Linux：

1、  **解决问题, 不要自欺欺人**

当我们提议在企业中使用 Linux 时，并不是因为我们认为 Linux 很酷才使用它。当然，我们是 Linux 的爱好者并且已经在自己的环境中运行过它，但是我们在公司是为了解决问题的。能用 Linux 是因为我们的登记员和出资人同意 Linux 是解决问题的一个方法，而不仅仅是因为 Linux很酷我们想用它。

2、  **尽可能小的去做改变**

我们的成功是建立在 IBM 已经基于 Linux 做出了它的 Java 和 WebSphere 产品的基础上的。这能让我们在将 web 系统从 AIX 切换到 Linux 上不用做过多的修改适配。两者比起来只有硬件和操作系统改变了，其他系统相关的组件都保持了一致，这些都是保证平台切换成功的基石。

![AIX cost diagram](https://opensource.com/sites/default/files/resize/cost-diagram-aix-700x363.png "AIX cost diagram")

![Linux cost diagram](https://opensource.com/sites/default/files/resize/cost-diagram-linux-700x363.png "Linux cost diagram")

3、  **诚实对待风险和回报**

我们的问题很明显：web 注册系统在前两个迭代周期中都失败了，而且很可能再次失败。当我们将自己的想法（AIX 切换到 Linux）告诉出资方后，我们对其中的风险和回报是心知肚明的。如果我们什么都不做，就只有失败，如果我们尝试切换到 Linux 平台，我们可能会成功，而且从最初的测试结果分析，成功的概率是高于失败的。

而且就算在 Linux 平台下项目还是失败了，我们也可以迅速地切换回 AIX 服务器。有了这些细致的分析和措施，终于使登记员能够安心让我们试试 Linux。

4、  **言简意赅地交流**

在项目平台切换的过程中，我们做了一个整体计划。我们在一张白纸上明确地写下了我们计划做什么，为什么要这么做。这种方式的成功关键就在于计划的简短性。领导们不喜欢像看小说一样来看技术性的主意，他们不想纠缠在技术细节中。所以我们有意地在执行层面上进行计划安排，在框架层面上进行描述。

当我们在进行平台切换时，我们会定期的告诉出资人当前进展。当新系统成功完成后，我们每天都会提交更新，报告已经有多少学生成功通过此系统完成注册和遇到的问题。

尽管这个项目已经过去了接近 20 年，但是其中的经验教训在今天仍然适用。尽管 Linux 在其中起了举足轻重的作用，但是最重要的还是我们成功地将所有人的目标引导到解决共同的问题上。我认为这种经验也可以运用到很多你所面对的事情当中。

（题图 : Opensource.com）

--------------------------------------------------------------------------------

作者简介：

Jim Hall -我是 FreeDOS 项目的发起者和协调人，我也在 GNOME 理事会中担任董事。工作上我是明尼苏达州拉姆西县的首席信息官，空闲时间里我为开源软件的可用性做出相关的贡献，并通过 [Outreachy](https://en.wikipedia.org/wiki/Outreachy)（为女性提供帮助的一项GNOME外展服务）来指导可用性测试。


---
via: https://opensource.com/article/17/7/how-introduced-organization-linux

作者：[Jim Hall][a]
译者：[吴霄/toyijiu](https://github.com/toyijiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-hall
[1]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[2]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/article/17/7/how-introduced-organization-linux?rate=G1WfZzJPTN4w4fVviJ7iFru6ZBDBBTKkT8QRxSh727g
[7]:https://opensource.com/user/126046/feed
[8]:https://opensource.com/users/jim-hall
[9]:https://opensource.com/users/jim-hall
[10]:https://opensource.com/article/17/7/how-introduced-organization-linux#comments
