衡量开源社区的五大指标
================================================================================
![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/yearbook2015-osdc-lead-1.png)

如果你想要使用指标来追踪你的自由开源软件（FOSS）的社区。现在就面临着一个问题：我应该去追踪哪些指标呢？

要回答这个问题，你必须知道你需要什么信息。比如，你可能想要知道一个项目社区的可持续性。一个社区对问题的应对速度有多快。一个社区怎么吸引、维护或者流失贡献者。一旦你知道需要哪类信息，你就可以找出哪些社区活动可以提供你想要知道的内容。幸运的是，自由开源软件（FOSS）遵从开放式开发模型，在其软件开发仓库里留下了大量的公共数据，我们可以对这些数据进行分析，并从中收集到一些有用的数据。 

在这篇文章中，我会介绍一些指标，从而为你的项目社区提供一个多方位的视角分析。

### 1. 社区活动（Activity） ###

一个社区的总体活动和这个社区怎样随着时间演变，是度量所有社区好坏的非常有用的指标。社区活动是评价一个社区工作量的第一印象，也可以用来追踪不同种类的活动。比如，提交次数，给人的第一印象就是跟开发工作量挂钩。通过提出的问题（tickets opened）我们可以大概知道提交了多少 bug 或者又提出了多少新特性。邮件列表中的邮件数量或者论坛帖子的数量可以让我们了解到有过多少次公开讨论。

![Activity metrics chart](https://opensource.com/sites/default/files/images/business-uploads/activity-metrics.png)

[OpenStack 活动看板][1]上面显示的项目代码提交次数和代码评审之后代码合并次数随时间变化的趋势图（周数据）。


### 2. 社区规模（Size） ###

社区的规模指的是参与到这个社区的人数，但是，基于不同形式的参与人数也有很大的差别。好消息是，通常你只对积极活跃的贡献者比较感兴趣。活跃的贡献者会在项目的仓库留下一些线索。这意味着你可以通过查看git仓库存放的代码中**author**字段来统计积极贡献代码的人数，或者通过看积极参与问题解决的人数来统计活跃人数。

所谓活动（某些人做了某些事）可以扩展到很多方面。一种常见的跟踪活动的方式是看有多少人做了工作量相当可观的任务。比如，通常一个项目代码的贡献者是来自这个项目社区的一小部分人。了解了这一小部分人，就对核心的工作组（比如，领导这个社区的人）有一个基本的认识了。

![Size metrics chart](https://opensource.com/sites/default/files/images/business-uploads/size-metrics.png)

[Xen 项目开发看板][2]上展示的该项目邮件列表上作者人数和提交人数随时间的变化趋势（每月数据）

### 3. 社区表现（Performance） ###

到目前为止，关注点主要集中在活动数量和贡献者数量的统计上了。你也可以分析流程还有用户的表现如何。比如，你可以测量某流程需要多久才能执行完成。解决或者关闭问题的时间可以表明一个需要及时响应的项目对新信息的应对如何，比如修复一个报告过来的 bug 或者实现一个新需求。代码评审花费的时间，即从代码修改提交到被通过的时间，可以看出更新一个提出的改变要达到社区期望的标准需要多久。

其他的一些指标主要与项目处理挂起的工作表现如何有关，比如新的和被关闭问题的比例，或者仍然没有完成的代码评审的队列。这些参数能告诉我们像投入到解决这些问题的资源是否充足这样的一些信息。

![Efficiency metrics chart](https://opensource.com/sites/default/files/images/business-uploads/efficiency-metrics.png)

在[2015第三季度 OpenStack 开发报告][3]上显示的，每季度关闭与打开状态的问题数之比，接受与放弃的改变提案与最新的改变提案之比。

### 4. 社区人口特征（Demographics） ###

随着贡献者的参与或者退出，社区也在不断改变。随着人们加入和退出社区，社区成员的会龄（从社区成员加入时算起）也各异。[社区会龄统计图表][4]很直观的展现了这些改变随时间的变化。图表是由一系列的水平条组成，每两条水平条代表加入到社区的一代人。对于每一代，吸引力（Attracted）水平条表示在相应的时间里有多少人加入到了社区。活跃度（Retained）水平条表示有多少人目前仍然活跃在社区。

代表一代人的两个水平条的关系就是滞留比例：依然在这个项目中的那一代人的一部分。吸引力（Attracted）水平条的完整集合表示这个项目在过去有多么受欢迎。活跃度（Retained）水平条的完整集合则表示社区目前的会龄结构。

![Demographics metrics chart](https://opensource.com/sites/default/files/images/business-uploads/demography-metrics.png)

[Eclipse 开发看板][5]上显示的 Eclipse 社区的社区年龄表。每六个月定义一次。

### 5. 社区多样性（Diversity） ###

多样性是一个社区保持弹性的很关键的因素。通常来说，一个社区越具有多样性（人或者组织参与的多元化），那么这个社区的弹性也就越大。比如，如果一个公司要决定离开一个自由开源社区，那么这个公司的员工贡献5%要远比贡献85%所可能引起的潜在问题要小很多。

[小马因素（Pony Factor）][6]，是 [Daniel Gruno][7] 为“最少的开发者贡献了50%的代码提交量”这一现象定义的术语。基于小马因素，大象因素（Elephant Factor）则是指最少量的公司其员工贡献了50%的代码提交量。这两个数据提供了一种指示，即这个社区依赖多少人或者公司。

![Diversity metrics chart](https://opensource.com/sites/default/files/images/business-uploads/diversity-metrics.png)

[2015开发云数量状态统计][8]显示的在云计算领域的几个自由开源社区项目的小马和大象因素。

还有许多其他的指标来衡量一个社区。在决定收集哪些指标时，可以考虑一下社区的目标，还有哪些指标能帮到你。

--------------------------------------------------------------------------------

via: https://opensource.com/business/15/12/top-5-open-source-community-metrics-track

作者：[Jesus M. Gonzalez-Barahona][a]
译者：[sonofelice](https://github.com/sonofelice)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jgbarah
[1]:http://activity.openstack.org/
[2]:http://projects.bitergia.com/xen-project-dashboard/
[3]:http://activity.openstack.org/dash/reports/2015-q3/pdf/2015-q3_OpenStack_report.pdf
[4]:http://radar.oreilly.com/2014/10/measure-your-open-source-communitys-age-to-keep-it-healthy.html
[5]:http://dashboard.eclipse.org/demographics.html
[6]:https://ke4qqq.wordpress.com/2015/02/08/pony-factor-math/
[7]:https://twitter.com/humbedooh
[8]:https://speakerdeck.com/jgbarah/the-quantitative-state-of-the-open-cloud-2015-edition