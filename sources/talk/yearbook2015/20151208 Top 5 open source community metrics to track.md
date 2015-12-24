五大开源社区指标追踪
================================================================================
![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/yearbook2015-osdc-lead-1.png)

你决定使用指标来追踪那些免费开源的软件社区。那么问题来了：我应该去追踪哪些指标呢？

要回答这个问题，你首先要知道你需要什么信息。比如，你可能想要知道一个项目社区的可持续性。这个社区对问题的应对速度怎么样。一个社区如何吸引、维持或者失去贡献者。一旦你知道需要哪类信息，你就可以找出哪些社区活动可以提供你想要知道的内容。幸运的是，免费开源社区（FOSS）一些遵从开放式开发模型的项目在其软件开发仓库里留下了大量的公共数据，我们可以对这些数据进行分析，并从中收集到一些有用的数据。 

在这篇文章中，我会介绍一些指标，从而为这些项目社区提供一个多方位的视角分析。

### 1. 社区活动 ###

一个社区的总体活动和这个社区怎样随着时间演变，是度量一个社区好坏的非常有用的指标。社区活动是评价一个社区工作量的第一印象，也可以用来追踪不同种类的活动。比如，提交次数，给人的第一印象就是跟开发工作量挂钩。通过投票的数量我们可以大概知道提交了多少bug或者又提出了多少新特性。邮件列表的数量或者论坛帖子的数量可以让我了解到有过多少次公开的讨论。

![Activity metrics chart](https://opensource.com/sites/default/files/images/business-uploads/activity-metrics.png)

[OpenStack活动看板][1]上面显示的项目代码提交次数和代码评审之后代码合并次数随时间变化的趋势图（周数据）


### 2. 社区规模 ###

社区的规模指的是参与到这个社区的人数，但是，基于不同形式的参与人数也有很大的差别。好消息是，通常你只对积极活跃的贡献者比较感兴趣。活跃的贡献者

The size of the community is the number of people participating in it, but, depending on the kind of participation, size numbers may vary. Usually you're interested in active contributors, which is good news. Active people may leave traces in the repositories of the project, which means you can count contributors who are active in producing code by looking at the **Author** field in git repositories, or count people participating in the resolution of tickets by looking at who is contributing to them.

This basic idea of activity" (somebody did something) can be extended in many ways. One common way to track activity is to look at how many people did a sizable chunk of the activity. Generally most of a project's code contributions, for example, are from a small fraction of the people in the project's community. Knowing about that fraction helps provide an idea of the core group (i.e., the people who help lead the community).

![Size metrics chart](https://opensource.com/sites/default/files/images/business-uploads/size-metrics.png)

Number of authors and number of posters in mailing lists in the Xen project, as found in the [Xen Project Development Dashboard][2]. Evolution over time (monthly data).

### 3. Performance ###

So far, I have focused on measuring quantities of activities and contributors. You also can analyze how processes and people are performing. For example, you can measure how long processes take to finish. Time to resolve or close tickets shows how the project is reacting to new information that requires action, such as fixing a reported bug or implementing a requested new feature. Time spent in code review—from the moment when a change to the code is proposed to the moment it is accepted—shows how long upgrading a proposed change to the quality standards expected by the community takes.

Other metrics deal with how well the project is coping with pending work, such as the ratio of new to closed tickets, or the backlog of still non-completed code reviews. Those parameters tell us, for example, whether or not the resources put into solving issues is enough.

![Efficiency metrics chart](https://opensource.com/sites/default/files/images/business-uploads/efficiency-metrics.png)

Ratio of tickets closed by tickets opened, and ratio of change proposals accepted or abandoned by new change proposals per quarter. OpenStack project, as shown in the [OpenStack Development Report, 2015-Q3][3] (PDF).

### 4. Demographics ###

Communities change as contributors move in and out. Depending on how people enter and leave a community over time, the age (time since members joined the community) of the community varies. The [community aging chart][4] nicely illustrates these exchanges over time. The chart is structured as a set of horizontal bars, two per "generation" of people joining the community. For each generation, the attracted bar shows how many new people joined the community during the corresponding period of time. The retained bar shows how many people are still active in the community.

The relationship between the two bars for each generation is the retention rate: the fraction of people of that generation who are still in the project. The complete set of attracted bars show how attractive the project was in the past. And the complete set of the retention bars shows the current age structure of the community.

![Demographics metrics chart](https://opensource.com/sites/default/files/images/business-uploads/demography-metrics.png)

Community aging chart for the Eclipse community, as shown in the [Eclipse Development Dashboard][5]. Generations are defined every six months.

### 5. Diversity ###

Diversity is an important factor in the resiliency of communities. In general, the more diverse communities are—in terms of people or organizations participating—the more resilient they are. For example, when a company decides to leave a FOSS community, the potential problems the departure may cause are much smaller if its employees were contributing 5% of the work rather than 85%.

The [Pony Factor][6], a term defined by [Daniel Gruno][7] for the minimum number of developers performing 50% of the commits. Based on the Pony Factor, the Elephant Factor is the minimum number of companies whose employees perform 50% of the commits. Both numbers provide an indication of how many people or companies the community depends on.

![Diversity metrics chart](https://opensource.com/sites/default/files/images/business-uploads/diversity-metrics.png)

Pony and Elephant Factor for several FOSS projects in the area of cloud computing, as presented in [The quantitative state of the open cloud 2015][8] (slides).

There are many other metrics to help measure a community. When determing which metrics to collect, think about the goals of your community, and which metrics will help you reach them.

--------------------------------------------------------------------------------

via: https://opensource.com/business/15/12/top-5-open-source-community-metrics-track

作者：[Jesus M. Gonzalez-Barahona][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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