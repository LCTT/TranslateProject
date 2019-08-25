[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10953-1.html)
[#]: subject: (Why translation platforms matter)
[#]: via: (https://opensource.com/article/19/5/translation-platforms)
[#]: author: (Jean-Baptiste Holcroft https://opensource.com/users/jibec/users/annegentle/users/bcotton)

什么是翻译平台最重要的地方？
======

> 技术上的考虑并不是判断一个好的翻译平台的最佳方式。

![](https://img.linux.net.cn/data/attachment/album/201906/09/112224nvvkrv16qv60vwpv.jpg)

语言翻译可以使开源软件能够被世界各地的人们使用，这是非开发人员参与他们喜欢的（开源）项目的好方法。有许多[翻译工具][2]，你可以根据他们处理翻译中涉及的主要功能区域的能力来评估：技术交互能力、团队支持能力和翻译支持能力。

技术交互方面包括：

* 支持的文件格式
* 与开源存储库的同步
* 自动化支持工具
* 接口可能性

对团队合作（也可称为“社区活力”）的支持包括该平台如何：

* 监控变更（按译者、项目等）
* 跟进由项目推动的更新
* 显示进度状态
* 是否启用审核和验证步骤
* 协助（来自同一团队和跨语言的）翻译人员和项目维护人员之间的讨论
* 平台支持的全球通讯（新闻等）

翻译协助包括：

* 清晰、符合人体工程学的界面
* 简单几步就可以找到项目并开始工作
* 可以简单地了解到翻译和分发之间流程
* 可以使用翻译记忆机
* 词汇表丰富

前两个功能区域与源代码管理平台的差别不大，只有一些小的差别。我觉得最后一个区域也主要与源代码有关。但是，它们处理的数据非常不同，翻译平台的用户通常也不如开发人员了解技术，而数量也更多。

### 我的推荐

在我看来，GNOME 平台提供了最好的翻译平台，原因如下：

* 其网站包含了团队组织和翻译平台。很容易看出谁在负责以及他们在团队中的角色。一切都集中在几个屏幕之内。
* 很容易找到要处理的内容，并且你会很快意识到你必须将文件下载到本地计算机并在修改后将其发回。这个流程不是很先进，但逻辑很容易理解。
* 一旦你发回文件，平台就可以向邮件列表发送通告，以便团队知道后续步骤，并且可以全局轻松讨论翻译（而不是评论特定句子）。
* 它支持多达 297 种语言。
* 它显示了基本句子、高级菜单和文档的明确的进度百分比。
   
再加上可预测的 GNOME 发布计划，社区可以使用一切可以促进社区工作的工具。

如果我们看看 Debian 翻译团队，他们多年来一直在为 Debian （LCTT 译注：此处原文是“Fedora”，疑为笔误）翻译了难以想象的大量内容（尤其是新闻），我们看到他们有一个高度以来于规则的翻译流程，完全基于电子邮件，手动推送到存储库。该团队还将所有内容都放在流程中，而不是工具中，尽管这似乎需要相当大的技术能力，但它已成为领先的语言群体之一，已经运作多年。

我认为，成功的翻译平台的主要问题不是基于单一的（技术、翻译）工作的能力，而是基于如何构建和支持翻译团队的流程。这就是可持续性的原因。

生产过程是构建团队最重要的方式；通过正确地将它们组合在一起，新手很容易理解该过程是如何工作的，采用它们，并将它们解释给下一组新人。

要建立一个可持续发展的社区，首先要考虑的是支持协同工作的工具，然后是可用性。

这解释了我为什么对 [Zanata][3] 工具沮丧，从技术和界面的角度来看，这是有效的，但在帮助构建社区方面却很差。我认为翻译是一个社区驱动的过程（可能是开源软件开发中最受社区驱动的过程之一），这对我来说是一个关键问题。

* * *

本文改编自“[什么是一个好的翻译平台？][4]”，最初发表在 Jibec 期刊上，并经许可重复使用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/translation-platforms

作者：[Jean-Baptiste Holcroft][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jibec/users/annegentle/users/bcotton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/people_remote_teams_world.png?itok=_9DCHEel
[2]: https://opensource.com/article/17/6/open-source-localization-tools
[3]: http://zanata.org/
[4]: https://jibecfed.fedorapeople.org/blog-hugo/en/2016/09/whats-a-good-translation-platform/
