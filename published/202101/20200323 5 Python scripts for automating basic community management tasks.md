[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13055-1.html)
[#]: subject: (5 Python scripts for automating basic community management tasks)
[#]: via: (https://opensource.com/article/20/3/automating-community-management-python)
[#]: author: (Rich Bowen https://opensource.com/users/rbowen)

用于基本社区管理任务自动化的 5 个 Python 脚本
======

> 如果某些事情不得不重复做三遍，尝试使其自动化。

![](https://img.linux.net.cn/data/attachment/album/202101/27/000544aakdc4mnmn6tzj8y.jpg)

我 [之前写过关于社区管理员的工作][2]，如果你问 10 位社区管理员，你会得到 12 个不同的答案。不过，大多数情况下，你做的是社区需要你在任何特定时刻做的事情。而且很多事情可能是重复的。

当我还是系统管理员时，我遵循一个规则：如果某些事必须做三遍，我会尝试使其自动化。当然，如今，使用诸如 Ansible 这样的强大工具，就有了一整套科学的方法。

我每天或每周要做的一些事情涉及在一些地方查找内容，然后生成信息的摘要或报告，然后发布到别处。这样的任务是自动化的理想选择。这些并不是什么 [难事][3]，当我与同事共享其中一些脚本时，总是至少有一个能证明这是有用的。

[在 GitHub][4] 上，我有几个每周都要使用的脚本。它们都不是很复杂，但每次都为我节省几分钟。其中一些是用 Perl 写的，因为我快 50 岁了（这些是我早些年写的）。有些是用 Python 写的，因为几年前，我决定要学习 Python。

以下是概述：

### tshirts.py

这个简单的 [tshirts.py 脚本][5]会根据你要定制的活动 T 恤的数量，然后告诉你尺寸分布是什么。它将这些尺寸分布在一条正态曲线（也称为 “钟形曲线”）上，以我的经验，这和一个正常的会议观众的实际需求非常吻合。如果在美国使用，则可能需要将脚本中的值调整的稍大一些；如果在欧洲使用，则可能需要将脚本中的值稍稍缩小一些。你的情况也许不同。

用法：

```
[rbowen@sasha:community-tools/scripts]$ ./tshirts.py                                                                                                                                                          
How many shirts? 300
For a total of 300 shirts, order:

30.0 small
72.0 medium
96.0 large
72.0 xl
30.0 2xl
```

### followers.py

[followers.py 脚本][6]为我提供了我关心的 Twitter 账号的关注者数量。

该脚本只有 14 行，没什么复杂的，但是它可能节省我十分钟的加载网页和查找数字的时间。

你需要编辑 `feed` 数组以添加你关心的帐户：

```
feeds = [
        'centosproject',
        'centos'
        ];
```

注意：如果你在英语国家以外的地方运行它，则可能无法正常工作，因为它只是一个简单的屏幕抓取脚本，它读取 HTML 并查找其中包含的特定信息。因此，当输出使用其他语言时，正则表达式可能不匹配。

用法：

```
[rbowen@sasha:community-tools/scripts]$ ./followers.py                                                                                                                                                                          
centosproject: 11,479 Followers
centos: 18,155 Followers
```

### get_meetups

[get_meetups 脚本][7]S 另一种类别的脚本 —— API脚本。这个特定的脚本使用 [meetup.com][8] 网站的 API 来寻找在特定区域和时间范围内特定主题的聚会，以便我可以将它报告给我的社区。你所依赖的许多服务都提供了 API，因此你的脚本可以查找信息，而无需手动查找网页。学习如何使用这些 API 既令人沮丧又耗时，但是最终将获得可以节省大量时间的技能。

_免责声明：[meetup.com][8] 已于 2019 年 8 月更改了他们的 API，我还没有将这个脚本更新到新的API，所以它现在实际上并没有工作。在接下来的几周内请关注此版本的修复版本。_

### centos-announcements.pl

[centos-announcements.pl 脚本][9]要复杂得多，而且对我的用例来说非常特殊，但你可能有类似的情况。在本例中该脚本查看邮件列表存档（`centos-announce` 邮件列表），并查找具有特定格式的邮件，然后生成这些邮件的报告。报告有两种不同的格式：一种用于我的每月新闻通讯，另一种用于安排 Twitter 信息（借助于 Hootsuite）。

我使用 Hootsuite 为 Twitter 安排内容，它们具有便捷的 CSV（逗号分隔值）格式，你可以一次批量安排整整一周的推文。从各种数据源（比如：邮件列表、博客、其他网页）自动生成 CSV 格式可以节省大量时间。但是请注意，这可能只应该用于初稿，然后你可以对其进行检查和编辑，以便最终不会自动发布你不想要内容的推文。

### reporting.pl

[reporting.pl 脚本][10]也是相当特定的，以满足我的特殊需求，但是这个概念本身是通用的。我每月向 [CentOS SIG][11]（特殊兴趣小组）发送邮件，这些邮件计划在给定的月份报告。该脚本只是告诉我本月有哪些 SIG，并记录需要发送给他们的电子邮件。

但是，因以下两个原因，实际上并未发送该电子邮件。第一，我希望在消息发送之前对其进行编辑。第二，虽然发送电子邮件的脚本在过去很有效，但如今，很可能被当做垃圾邮件而被过滤。

### 总结

在这个存储库中还有一些其他脚本，这些脚本或多或少是针对我的特定需求的，但是我希望其中至少有一个脚本对你有用，并且希望这些脚本的多样性能激励你去自动化一些你自己的东西。我也希望看到你的自动化脚本存储库；在评论中链接他们！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/automating-community-management-python

作者：[Rich Bowen][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rbowen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/Open%20Pharma.png?itok=GP7zqNZE (shapes of people symbols)
[2]: http://drbacchus.com/what-does-a-community-manager-do/
[3]: https://6dollarshirts.com/rocket-surgery
[4]: https://github.com/rbowen/centos-community-tools/tree/master/scripts
[5]: https://github.com/rbowen/centos-community-tools/blob/master/scripts/tshirts.py
[6]: https://github.com/rbowen/centos-community-tools/blob/master/scripts/followers.py
[7]: https://github.com/rbowen/centos-community-tools/blob/master/scripts/get_meetups
[8]: http://meetup.com
[9]: https://github.com/rbowen/centos-community-tools/blob/master/scripts/centos-announcements.pl
[10]: https://github.com/rbowen/centos-community-tools/blob/master/scripts/sig_reporting/reporting.pl
[11]: https://wiki.centos.org/SpecialInterestGroup
