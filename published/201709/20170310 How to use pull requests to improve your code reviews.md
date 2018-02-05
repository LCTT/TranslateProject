如何使用拉取请求（PR）来改善你的代码审查
============================================================

> 通过使用 GitHub 的<ruby>拉取请求<rt>Pull Request</rt></ruby>正确地进行代码审核，把时间更多的花在构建上，而在修复上少用点时间。

 ![Measure](https://d3tdunqjn7n0wj.cloudfront.net/360x240/measure-106354_1920-a7f65d82a54323773f847cf572e640a4.jpg) 

如果你不是每天编写代码，你可能不知道软件开发人员日常面临的一些问题。

*   代码中的安全漏洞
*   导致应用程序崩溃的代码
*   被称作 “技术债务” 和之后需要重写的代码
*   在某处你所不知道地方的代码已经被重写

<ruby>代码审查<rt>Code review</rt></ruby>可以允许其他的人或工具来检查代码，帮助我们改善所编写的软件。这种审查（也称为<ruby>同行评审<rt>peer review</rt></ruby>）能够通过自动化代码分析或者测试覆盖工具来进行，是软件开发过程中两个重要的部分，它能够节省数小时的手工工作。同行评审是开发人员审查彼此工作的一个过程。在软件开发的过程中，速度和紧迫性是两个经常提及的问题。如果你没有尽快的发布，你的竞争对手可能会率先发布新功能。如果你不能够经常发布新的版本，你的用户可能会怀疑您是否仍然关心改进你的应用程序。

### 权衡时间：代码审查与缺陷修复

如果有人能够以最小争议的方式汇集多种类型的代码审查，那么随着时间的推移，该软件的质量将会得到改善。如果认为引入新的工具或流程最先导致的不是延迟，那未免太天真了。但是代价更高昂的是：修复生产环境中的错误花费的时间，或者在放到生产环境之前改进软件所花费的时间。即使新工具延迟了新功能的发布和得到客户欣赏的时间，但随着软件开发人员提高自己的技能，该延迟会缩短，软件开发周期将会回升到以前的水平，而同时缺陷将会减少。

通过代码审查实现提升代码质量目标的关键之一就是使用一个足够灵活的平台，允许软件开发人员快速编写代码，置入他们熟悉的工具，并对彼此进行同行评审。 GitHub 就是这样的平台的一个很好的例子。然而，只是把你的代码放在 [GitHub][9] 上并不会魔术般地使代码审查发生；你必须使用<ruby>拉取请求<rt>Pull Request</rt></ruby>来开始这个美妙的旅程。

### 拉取请求：关于代码的现场讨论

<ruby>[拉取请求][10]<rt>Pull Request</rt></ruby>是 Github 上的一个工具，允许软件开发人员讨论并提出对项目的主要代码库的更改，这些更改稍后可以部署给所有用户看到。这个功能创建于 2008 年 2 月，其目的是在接受（合并）之前，对某人的建议进行更改，然后在部署到生产环境中，供最终用户看到这种变化。

拉取请求开始是以一种松散的方式让你为某人的项目提供更改，但是它们已经演变成：

*   关于你想要合并的代码的现场讨论
*   提升了所更改内容的可视功能
*   整合了你最喜爱的工具
*   作为受保护的分支工作流程的一部分可能需要显式的拉取请求评审

### 对于代码：URL 是永久的

看看上述的前两个点，拉取请求促成了一个正在进行的代码讨论，使代码变更可以更醒目，并且使您很容易在审查的过程中找到所需的代码。无论是对于新人还是有经验的开发人员，能够回顾以前的讨论，了解一个功能为什么以这种方式开发出来，或者与另一个相关功能的讨论相联系起来是无价的。当跨多个项目协调，并使每个人尽可能接近代码时，前后讨论的内容也非常重要。如果这些功能仍在开发中，重要的是能够看到上次审查以来更改了哪些内容。毕竟，[审查小的更改要比大的容易得多][11]，但不可能全都是小功能。因此，重要的是能够找到你上次审查，并只看到从那时以来的变化。

### 集成工具：软件开发人员的偏执

再看下上述第三点，GitHub 上的拉取请求有很多功能，但开发人员总是偏好第三方工具。代码质量是个完整的代码审查领域，它涉及到其它组件的代码评审，而这些评审不一定是由人完成的。检测“低效”或缓慢的代码、具有潜在安全漏洞或不符合公司标准的代码是留给自动化工具的任务。类似 [SonarQube][12] 和 [Code Climatecan][13] 这样工具可以分析你的代码，而像 [Codecov][14] 和 [Coveralls][15] 的这样工具可以告诉你刚刚写的新代码还没有得到很好的测试。这些工具最令人称奇的是，它们可以集成到 GitHub 中，并把它们的发现汇报到拉取请求当中！这意味着该过程中不仅是人们在审查代码，而且工具也在会在那里报告情况。这样每个人都可以完全了解一个功能是如何开发的。

最后，根据您的团队的偏好，您可以利用[受保护的分支工作流][16]的<ruby>必需状态<rt>required status</rt></ruby>功能来要求进行工具审查和同行评审。

虽然您可能只是刚刚开始您的软件开发之旅，或者是一位希望知道项目正在做什么的业务利益相关者，抑或是一位想要确保项目的及时性和质量的项目经理，你都可以通过设置批准流程来参与到拉取请求中，并考虑集成更多的工具以确保质量，这在任何级别的软件开发中都很重要。

无论是为您的个人网站，贵公司的在线商店，还是想用最新的组合以获得最大的收获，编写好的软件都需要进行良好的代码审查。良好的代码审查涉及到正确的工具和平台。要了解有关 GitHub 和软件开发过程的更多信息，请参阅 O'Reilly 的 《[GitHub 简介][17]》 一书，  您可以在其中了解创建项目、启动拉取请求以及概要了解团队的软件开发流程。

--------------------------------------------------------------------------------

作者简介：

**Brent Beer**

Brent Beer 通过大学的课程、对开源项目的贡献，以及担任专业网站开发人员使用 Git 和 GitHub 已经超过五年了。在担任 GitHub 上的培训师时，他也成为 O’Reilly 的 《GitHub 简介》的出版作者。他在阿姆斯特丹担任  GitHub 的解决方案工程师，帮助 Git 和 GitHub 向世界各地的开发人员提供服务。

**Peter Bell**

Peter Bell 是 Ronin 实验室的创始人以及 CTO。培训是存在问题的，我们通过技术提升培训来改进它！他是一位有经验的企业家、技术专家、敏捷教练和 CTO，专门从事 EdTech 项目。他为 O'Reilly 撰写了 《GitHub 简介》，为代码学校创建了“精通 GitHub ”课程，为 Pearson 创建了“ Git 和 GitHub 现场课”课程。他经常在国际和国际会议上发表 ruby、 nodejs、NoSQL（尤其是 MongoDB 和 neo4j ）、云计算、软件工艺、java、groovy、j 等的演讲。 

-------------


via: https://www.oreilly.com/ideas/how-to-use-pull-requests-to-improve-your-code-reviews

作者：[Brent Beer][a], [Peter Bell][b]
译者：[MonkeyDEcho](https://github.com/MonkeyDEcho)
校对：[wxy](https://github.com/wxy)

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
