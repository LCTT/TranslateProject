使用 Open edX 托管课程
======

> Open edX 为各种规模和类型的组织提供了一个强大而多功能的开源课程管理的解决方案。要不要了解一下。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003588_01_rd3os.combacktoschoolseriesgen_rh_032x_0.png?itok=cApG9aB4)

[Open edX 平台][2] 是一个自由开源的课程管理系统，它是 [全世界][3] 都在使用的大规模网络公开课（MOOC）以及小型课程和培训模块的托管平台。在 Open edX 的 [第七个主要发行版][1] 中，到现在为止，它已经提供了超过 8,000 个原创课程和 5000 万个课程注册数。你可以使用你自己的本地设备或者任何行业领先的云基础设施服务提供商来安装这个平台，而且，随着项目的[服务提供商][4]名单越来越长，来自它们中的软件即服务（SaaS）的可用模型也越来越多了。

Open edX 平台被来自世界各地的顶尖教育机构、私人公司、公共机构、非政府组织、非营利机构，以及教育技术初创企业广泛地使用，并且该项目的服务提供商全球社区不断地让甚至更小的组织也可以访问这个平台。如果你打算向广大的读者设计和提供教育内容，你应该考虑去使用 Open edX 平台。

### 安装

安装这个软件有多种方式，这可能有点让你难以选择，至少刚开始是这样。但是不管你是以何种方式 [安装 Open edX][5]，最终你都得到的是有相同功能的应用程序。默认安装包含一个为在线学习者提供的、全功能的学习管理系统（LMS），和一个全功能的课程管理工作室（CMS），CMS 可以让你的讲师团队用它来编写原创课程内容。你可以把 CMS 当做是课程内容设计和管理的 “[Wordpress][6]”，把 LMS 当做是课程销售、分发、和消费的 “[Magento][7]”。

Open edX 是设备无关的、完全响应式的应用软件，并且不用花费很多的努力就可发布一个原生的 iOS 和  Android 应用，它可以无缝地集成到你的实例后端。Open edX 平台的代码库、原生移动应用、以及安装脚本都发布在 [GitHub][8] 上。

#### 有何期望

Open edX 平台的 [GitHub 仓库][9] 包含适用于各种类型的组织的、性能很好的、产品级的代码。来自数百个机构的数千名程序员经常为 edX 仓库做贡献，并且这个平台是一个名副其实的、研究如何去构建和管理一个复杂的企业级应用的好案例。因此，尽管你可能会遇到大量的类似“如何将平台迁移到生产环境中”的问题，但是你无需对 Open edX 平台代码库本身的质量和健状性担忧。

通过少量的培训，你的讲师就可以去设计不错的在线课程。但是请记住，Open edX 是通过它的 [XBlock][10] 组件架构进行扩展的，因此，通过他们和你的努力，你的讲师将有可能将不错的课程变成精品课程。

这个平台在单服务器环境下也运行的很好，并且它是高度模块化的，几乎可以进行无限地水平扩展。它也是主题化的和本地化的，平台的功能和外观可以根据你的需要进行几乎无限制地调整。平台在你的设备上可以按需安装并可靠地运行。

#### 需要一些封装

请记住，有大量的 edX 软件模块是不包含在默认安装中的，并且这些模块提供的经常都是各种组织所需要的功能。比如，分析模块、电商模块，以及课程的通知/公告模块都是不包含在默认安装中的，并且这些单独的模块都是值得安装的。另外，在数据备份/恢复和系统管理方面要完全依赖你自己去处理。幸运的是，有关这方面的内容，社区有越来越多的文档和如何去做的文章。你可以通过 Google 和 Bing 去搜索，以帮助你在生产环境中安装它们。

虽然有很多文档良好的程序，但是根据你的技能水平，配置 [oAuth][11] 和 [SSL/TLS][12]，以及使用平台的 [REST API][13] 可能对你是一个挑战。另外，一些组织要求将 MySQL 和/或 MongoDB 数据库在中心化环境中管理，如果你正好是这种情况，你还需要将这些服务从默认平台安装中分离出来。edX 设计团队已经尽可能地为你做了简化，但是由于它是一个非常重大的更改，因此可能需要一些时间去实现。

如果你面临资源和/或技术上的困难 —— 不要气馁，Open edX 社区 SaaS 提供商，像 [appsembler][14] 和 [eduNEXT][15]，提供了引人入胜的替代方案去进行 DIY 安装，尤其是如果你只想简单购买就行。

### 技术栈

在 Open edX 平台的安装上探索是件令人兴奋的事情，从架构的角度来说，这个项目是一个典范。应用程序模块是 [Django][16] 应用，它利用了大量的开源社区的顶尖项目，包括 [Ubuntu][17]、[MySQL][18]、[MongoDB][19]、[RabbitMQ][20]、[Elasticsearch][21]、[Hadoop][22]、等等。

![edx-architecture.png][24]

*Open edX 技术栈（CC BY，来自 edX）*

将这些组件安装并配置好本身就是一件非常不容易的事情，但是以这样的一种方式将所有的组件去打包，并适合于任意规模和复杂性的组织，并且能够按他们的需要进行任意调整搭配而无需在代码上做重大改动，看起来似乎是不可能的事情 —— 它就是这种情况，直到你看到主要的平台配置参数安排和命名是多少的巧妙和直观。请注意，平台的组织结构有一个学习曲线，但是，你所学习的一切都是值的去学习的，不仅是对这个项目，对一般意义上的大型 IT 项目都是如此。

提醒一点：这个平台的 UI 是在不断变动的，最终的目标是在 [React][25] 和 [Bootstrap][26] 上实现标准化。与此同时，你将会发现基本主题有多个实现的样式，这可能会让你感到困惑。

### 采用

edX 项目能够迅速得到世界范围内的采纳，很大程度上取决于该软件的运行情况。这一点也不奇怪，这个项目成功地吸引了大量才华卓越的人参与其中，他们作为程序员、项目顾问、翻译者、技术作者、以及博客作者参与了项目的贡献。一年一次的 [Open edX 会议][27]、[官方的 edX Google Group][28]、以及 [Open edX 服务提供商名单][4] 是了解这个多样化的、不断成长的生态系统的非常好的起点。我作为相对而言的新人，我发现参与和直接从事这个项目的各个方面是非常容易的。

祝你学习之旅一切顺利，并且当你构思你的项目时，你可以随时联系我。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/getting-started-open-edx

作者：[Lawrence Mc Daniel][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mcdaniel0073
[1]:https://openedx.atlassian.net/wiki/spaces/DOC/pages/11108700/Open+edX+Releases
[2]:https://open.edx.org/about-open-edx
[3]:https://www.edx.org/schools-partners
[4]:https://openedx.atlassian.net/wiki/spaces/COMM/pages/65667081/Open+edX+Service+Providers
[5]:https://openedx.atlassian.net/wiki/spaces/OpenOPS/pages/60227779/Open+edX+Installation+Options
[6]:https://wordpress.com/
[7]:https://magento.com/
[8]:https://github.com/edx
[9]:https://github.com/edx/edx-platform
[10]:https://open.edx.org/xblocks
[11]:https://oauth.net/
[12]:https://en.wikipedia.org/wiki/Transport_Layer_Security
[13]:https://en.wikipedia.org/wiki/Representational_state_transfer
[14]:https://www.appsembler.com/
[15]:https://www.edunext.co/
[16]:https://www.djangoproject.com/
[17]:https://www.ubuntu.com/
[18]:https://www.mysql.com/
[19]:https://www.mongodb.com/
[20]:https://www.rabbitmq.com/
[21]:https://www.elastic.co/
[22]:http://hadoop.apache.org/
[23]:/file/400696
[24]:https://opensource.com/sites/default/files/uploads/edx-architecture_0.png "edx-architecture.png"
[25]:%E2%80%9Chttps://reactjs.org/%E2%80%9C
[26]:%E2%80%9Chttps://getbootstrap.com/%E2%80%9C
[27]:https://con.openedx.org/
[28]:https://groups.google.com/forum/#!forum/openedx-ops
