如何使用 pull requests 来改善你的代码审查
============================================================

在 Github 上使用 pull requests 来做代码审查，花费更多的时间去构建，而更少的时间去修改。

 ![Measure](https://d3tdunqjn7n0wj.cloudfront.net/360x240/measure-106354_1920-a7f65d82a54323773f847cf572e640a4.jpg) 


>看看 Brent 和 Peter’s 的[ _Introducing GitHub_ ][5]的书, 了解更多有关创建项目，开始 pull requests 和团队软件开发流程的概述。


如果你每天不编写代码，你可能不知道软件开发人员每天面临的一些问题。

*   代码中的安全漏洞
*   导致应用程序崩溃的代码
*   被称作 “技术债务” 和之后需要重写的代码
*   已经重写在你所不知道地方的代码


代码审查可以允许其他人和工具检查来帮助我们改善所编写的软件。这种审查通过自动化代码分析或者测试覆盖工具来进行软件开发过程中重要的二个部分，节省数小时的手工劳动或同行评审。同行的审查是开发人员审查彼此工作的过程。在软件开发的过程中，速度和紧迫性是经常面临的问题中二个重要的部分。如果你没有尽快的发布，你的竞争对手可能会在你之前发布相似的产品。如果你不经常发不新的版本，你的用户可能会怀疑您是否仍然关心你的应用程序的改进优化。

### 衡量时间权衡：代码审查 vs. bug 修复

如果有人能够以最小争议的方式汇集多种类型的代码审查，那么随着时间的推移，该软件的质量将会得到改善。认为引入新的工具或流程在最初不会推迟时间，这是天真的想法。但是更昂贵的是：修复生产中的错误的时候，在还是软件生产之前改进软件，即使新工具延迟了时间，客户可以发布和欣赏新功能，随着软件开发人员提高自己的技能，软件开发周期将会回升到以前的水平，同时应该减少错误。

通过代码审查实现提升代码质量目标的关键之一就是使用一个足够灵活的平台，允许软件开发人员快速编写代码，使用他们熟悉的工具，并行彼此进行同行评审码。 GitHub 就是这样一个平台的。然而，把你的代码放在 [GitHub][9] 上并不只是神奇地使代码审查发生; 你必须使用 pull requests ，来开始这个美妙的旅程。

### Pull requests: 一个代码的生活讨论的工具

[Pull requests][10] 是 Github 上的一个工具，允许软件开发人员讨论并提出对项目的主要代码库的更改，稍后可以让所用用户看到。它们在 2008 年 2 月创建的，目的是在接受（合并）某人之前的建议进行更改，然后在部署到生产中，供最终用户看到这种变化。

Pull requests 开始是一种松散的方式为某人的项目提供改变，但是它已经演变成：

*   关于你想要合并的代码的生活讨论
*   增加功能，这种可见性的修改（更改）
*   整合你最喜爱的工具
*   作为受保护的分支工作流程的一部分可能需要显式提取请求评估

### 考虑带代码: URL 是永久的

看看上面的前两个点，pull requests 促成了一个正在进行的代码讨论，使代码变化非常明显，并且使您很容易在回顾的过程中找到所需的代码。对于新人和有经验的开发人员来说，能够回顾以前的讨论，了解为什么一个功能被开发出来，或者与另一个关于相关功能的讨论这样的联系方式是便捷的。当跨多个项目协调功能并使每个人尽可能接近代码时，前后讨论的内容也非常重要。如果这些功能仍在开发中，重要的是能够看到上次审查以来更改了哪些内容。毕竟，[对小的更改比大的修改要容易得多][11]，但大的功能并不总是可能的。因此，重要的是能够拿起你上次审查，并只看到从那时以来的变化。

### 集成工具: 软件开发人员的建议

考虑到上述第三点，GitHub 上的 pull requests 有很多功能，但开发人员将始终对第三方工具有偏好。代码质量是代码审查的整个领域，涉及到其他组件的代码评审，而这些评审不一定是人的。检测“低效”或缓慢、潜在的安全漏洞或不符合公司标准的代码是留给自动化工具的任务。
[SonarQube][12] 和 [Code Climatecan][13] 分析你的代码的工具，而像 [Codecov][14] 和 [Coveralls][15] 的工具可以告诉你如果你只是写新代码没有得到很好的测试。这些令人惊奇工具最大的特点就是，他们可以插到 GitHub 和 pull requests 报告他们的发现！这意味着不仅让人们检查代码，而且工具也在那里报告情况。每个人都可以停留在一个如何发展循环中的功能。

最后，根据您的团队的偏好，您可以利用[受保护的分支工作流][16]所需的状态特性来进行工具和同行评审。

虽然您可能只是开始您的软件开发之旅，一个希望知道一个项目正在做什么的业务利益相关者，或者是想要确保项目的及时性和质量的项目经理，可以通过设置参与 pull requests 批准工作流程，并考虑与其他工具集成以确保质量，在任何级别的软件开发中都很重要。

无论是为您的个人网站，贵公司的在线商店，还是最新的组合，以最大的收益收获今年的玉米，编写好的软件都需要进行良好的代码审查。良好的代码审查涉及到正确的工具和平台。要了解有关 GitHub 和软件开发过程的更多信息，请参阅 O'Reilly 的 [ _GitHub 简介_ ][17] 一书，  您可以在其中了解创建项目，启动拉取请求以及概述团队的“软件开发流程”。

--------------------------------------------------------------------------------

作者简介：

**Brent Beer**

Brent Beer 使用 Git 和 GitHub 已经超过五年了，通过大学的课程，对开源项目的贡献，以及专业网站开发人员。在担任 GitHub 上的培训师时，他也成为 O’Reilly 的 “GitHub简介” 的出版作者。他现在担任 Amsterdam GitHub 上的解决方案工程师，帮助 Git 和 GitHub 向世界各地的开发人员提供服务。

**Peter Bell**

Peter Bell 是 Ronin 实验室的创始人以及 CTO。Training is broken - we're fixing it through technology enhanced training!他是一位有经验的企业家，技术专家，敏捷教练和CTO，专门从事 EdTech 项目。他为 O'Reilly 撰写了 “ GitHub 简介” ，为代码学校创建了“掌握 GitHub ”课程，为 Pearson 创建了“ Git 和 GitHub LiveLessons ”课程。他经常在国际和国际会议上提供 ruby ， nodejs ， NoSQL （尤其是 MongoDB 和 neo4j ），云计算，软件工艺，java，groovy，j ... 

-------------


via: https://www.oreilly.com/ideas/how-to-use-pull-requests-to-improve-your-code-reviews?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311

作者：[Brent Beer][a]，[Peter Bell][b]
译者：[MonkeyDEcho](https://github.com/MonkeyDEcho)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.oreilly.com/people/acf937de-cdf4-4b0e-85bd-b559404c580e
[b]:https://www.oreilly.com/people/2256f119-7ea0-440e-99e8-65281919e952
[1]:https://pixabay.com/en/measure-measures-rule-metro-106354/
[2]:http://conferences.oreilly.com/oscon/oscon-tx?intcmp=il-prog-confreg-update-ostx17_new_site_oscon_17_austin_right_rail_cta
[3]:https://www.oreilly.com/people/acf937de-cdf4-4b0e-85bd-b559404c580e
[4]:https://www.oreilly.com/people/2256f119-7ea0-440e-99e8-65281919e952
[5]:https://www.safaribooksonline.com/library/view/introducing-github/9781491949801/?utm_source=newsite&utm_medium=content&utm_campaign=lgen&utm_content=how-to-use-pull-requests-to-improve-your-code-reviews
[6]:http://conferences.oreilly.com/oscon/oscon-tx?intcmp=il-prog-confreg-update-ostx17_new_site_oscon_17_austin_right_rail_cta
[7]:http://conferences.oreilly.com/oscon/oscon-tx?intcmp=il-prog-confreg-update-ostx17_new_site_oscon_17_austin_right_rail_cta
[8]:https://www.oreilly.com/ideas/how-to-use-pull-requests-to-improve-your-code-reviews?imm_mid=0ee8ca&cmp=em-prog-na-na-newsltr_20170311
[9]:https://github.com/about
[10]:https://help.github.com/articles/about-pull-requests/
[11]:https://blog.skyliner.io/ship-small-diffs-741308bec0d1
[12]:https://github.com/integrations/sonarqube
[13]:https://github.com/integrations/code-climate
[14]:https://github.com/integrations/codecov
[15]:https://github.com/integrations/coveralls
[16]:https://help.github.com/articles/about-protected-branches/
[17]:https://www.safaribooksonline.com/library/view/introducing-github/9781491949801/?utm_source=newsite&utm_medium=content&utm_campaign=lgen&utm_content=how-to-use-pull-requests-to-improve-your-code-reviews-lower
