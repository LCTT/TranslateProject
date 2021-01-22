[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 Python scripts for automating basic community management tasks)
[#]: via: (https://opensource.com/article/20/3/automating-community-management-python)
[#]: author: (Rich Bowen https://opensource.com/users/rbowen)

用于基本社区管理任务自动化的 5 个 Python 脚本
======

如果某些事情不得不重复做三遍，尝试使其自动化。

![人形符号][1]

我 [之前写过关于社区管理员的工作][2]，如果你问 10 位社区管理员，你会得到 12 个不同的答案。你在任何给定的时刻都要做社区需要你做的事情。并且大多数可以重复。

当我成为系统管理员时，我遵循一个规则：如果某些事必须做三遍，我会尝试使其自动化。当然，如今，使用诸如 Ansible 这样的强大工具，这是一门完整的科学。

我每天或每周要做的一些事情涉及在一些地方查找内容，然后生成摘要或该信息的报告发布到别处。这样的任务是自动化的理想选择。这些并不是 [难事][3]，当我与同事共享其中一些脚本时，总是至少有一个能证明这是有用的。

[在 GitHub][4] 上，我有几个每周都要使用的脚本。他们都不是很复杂的，但每次都为我节省几分钟。其中一些是用 Perl 写的是因为我快 50 岁了。其中一些就在几年前是用 Python 写的，我决定需要学习 Python。概述如下：

### **[tshirts.py][5]**

这个简单的脚本将为你定制一定数量的活动 T恤，告诉你尺寸分布是什么。将它们分布在一条正常的曲线（也称为 “钟形曲线”）上，以我的经验，这和一个正常的会议观众的实际需求非常吻合。如果在美国使用，则可能需要将脚本(中的值)调整的稍大一些；如果在欧洲使用，则可能需要将脚本(中的值)稍稍缩小一些。 YMMV。

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

### **[followers.py][6]**

该脚本为我提供了我关心的 Twitter 账号的关注者数量。

该脚本只有 14 行，并不令人兴奋，但是它可能节省我十分钟的加载网页和查找数字的时间。

您需要编辑 `feed` 数组以添加您关心的帐户：

```
feeds = [
        'centosproject',
        'centos'
        ];
```

注意：如果你在英语国家以外（的地区）运行它，则可能无法正常工作，因为它只是一个简单的屏幕抓取脚本，可读取 HTML 并查找其中包含的特定信息。因此，当输出使用其他语言时，正则表达式将不匹配。

用法：

```
[rbowen@sasha:community-tools/scripts]$ ./followers.py                                                                                                                                                                          
centosproject: 11,479 Followers
centos: 18,155 Followers
```

### **[get_meetups][7]**

该脚本纳入另一种类别的脚本——API脚本。这个特定的脚本使用 [meetup.com][8]（网站）API 寻找在特定区域和时间范围内有关特定主题的聚会，以便我可以向社区报告。您所依赖的许多服务都提供了 API，因此您的脚本可以查找信息，而无需手动浏览网页。学习如何使用这些 API 既令人沮丧又耗时，但是最终将获得可以节省大量时间的技能。

_免责声明：[meetup.com][8] 已于2019年8月更改了他们的 API，目前为止已经不能为新的 API 更新此脚本了，因此它实际上暂时不起作用。在接下来的几周内关注此版本的修复版本。_

### **[centos-announcements.pl][9]**

该脚本在我所使用的实例中是相当复杂的和非常明确的，但你可能有类似的情况。在本例中该脚本查看邮件列表存档（`centos-announce` 邮件列表），并查找具有特定格式的邮件，然后生成这些邮件的报告。报告有两种不同的格式——一种用于我的每月新闻通讯，另一种用于安排 Twitter 信息（借助于 Hootsuite）。

我使用 `Hootsuite` 为 Twitter 安排内容，它们具有便捷的 CSV（逗号分隔值）格式，你可以一次批量安排整整一周的推文。从不同数据源（比如：邮件列表，博客，其他网页）自动生成 CSV 格式可以节省大量时间。但是请注意，这可能仅应用于初稿，然后您可以对其进行检查和编辑，以便最终不会自动发布你不想要内容的推文。
### **[reporting.pl][10]**

该脚本也非常符合我的特定需求，但是概念本身是通用的。我每月向 [CentOS SIG][11]（特殊兴趣小组）发送邮件，这些邮件计划在给定的月份报告。该脚本只是告诉我本月有哪些 SIG，并记录需要发送给他们的电子邮件。

但是，因以下两个原因，实际上并未发送该电子邮件。第一，我希望在消息发送之前对其进行编辑。第二，虽然发送电子邮件的脚本在过去很有效，但如今，很可能被当做垃圾邮件而被过滤。
### 综上所述（总结）

该存储库中还有一些其他脚本或多或少是针对我的特定需求的，但是我希望其中至少有一个脚本对你有用，并且激发你使自己的某些需要自动化。我也希望看到你方便的自动化脚本存储库；在评论中链接他们！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/automating-community-management-python

作者：[Rich Bowen][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

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
