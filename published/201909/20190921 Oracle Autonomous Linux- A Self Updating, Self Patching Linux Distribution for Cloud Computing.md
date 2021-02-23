[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11370-1.html)
[#]: subject: (Oracle Autonomous Linux: A Self Updating, Self Patching Linux Distribution for Cloud Computing)
[#]: via: (https://itsfoss.com/oracle-autonomous-linux/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Oracle Autonomous Linux：用于云计算的自我更新、自我修补的 Linux 发行版
======

自动化是 IT 行业的增长趋势，其目的是消除重复任务中的手动干扰。Oracle 通过推出 Oracle  Autonomous Linux 向自动化世界迈出了又一步，这无疑将使 IoT 和云计算行业受益。

### Oracle Autonomous Linux：减少人工干扰，增多自动化

![][1]

周一，Oracle 联合创始人<ruby>拉里·埃里森<rt>Larry Ellison</rt></ruby>参加了在旧金山举行的Oracle OpenWorld 全球大会。[他宣布了][2]一个新产品：世界上第一个自治 Linux。这是 Oracle 向第二代云迈进的第二步。第一步是两年前发布的 [Autonomous Database][3]。

Oracle Autonomous Linux 的最大特性是降低了维护成本。根据 [Oracle 网站][4] 所述，Autonomous Linux “使用先进的机器学习和自治功能来提供前所未有的成本节省、安全性和可用性，并释放关键的 IT 资源来应对更多的战略计划”。

Autonomous Linux 可以无需人工干预就安装更新和补丁。这些自动更新包括 “Linux 内核和关键用户空间库”的补丁。“不需要停机，而且可以免受外部攻击和内部恶意用户的攻击。”它们也可以在系统运行时进行，以减少停机时间。Autonomous Linux 还会自动处理伸缩，以确保满足所有计算需求。

埃里森强调了新的自治系统将如何提高安全性。他特别提到了 [Capitol One 数据泄露][5]是由于配置错误而发生的。他说：“一个防止数据被盗的简单规则：将数据放入自治系统。没有人为错误，没有数据丢失。 那是我们与 AWS 之间的最大区别。”

有趣的是，Oracle 还瞄准了这一新产品以与 IBM 竞争。埃里森说：“如果你付钱给 IBM，可以停了。”所有 Red Hat 应用程序都应该能够在 Autonomous Linux 上运行而无需修改。有趣的是，Oracle Linux 是从 Red Hat Enterprise Linux 的源代码中[构建][6]的。

看起来，Oracle Autonomous Linux 不会用于企业市场以外。

### 关于 Oracle Autonomous Linux 的思考

Oracle 是云服务市场的重要参与者。这种新的 Linux 产品将使其能够与 IBM 竞争。让人感兴趣的是 IBM 的反应会是如何，特别是当他们有来自 Red Hat 的新一批开源智能软件。

如果你看一下市场数字，那么对于 IBM 或 Oracle 来说情况都不好。大多数云业务由 [Amazon Web Services、Microsoft Azure 和 Google Cloud Platform][7] 所占据。IBM 和 Oracle 落后于他们。[IBM 收购 Red Hat][8] 试图获得发展。这项新的自主云计划是 Oracle 争取统治地位（或至少试图获得更大的市场份额）的举动。让人感兴趣的是，到底有多少公司因为购买了 Oracle 的系统而在互联网的狂野西部变得更加安全？

我必须简单提一下：当我第一次阅读该公告时，我的第一反应就是“好吧，我们离天网更近了一步。”如果我们技术性地考虑一下，我们就像是要进入了机器人末日。如果你打算帮我，我计划去购买一些罐头食品。

你对 Oracle 的新产品感兴趣吗？你会帮助他们赢得云战争吗？在下面的评论中让我们知道。

如果你觉得这篇文章有趣，请花一点时间在社交媒体、Hacker News 或 [Reddit][9] 上分享。

--------------------------------------------------------------------------------

via: https://itsfoss.com/oracle-autonomous-linux/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/oracle-autonomous-linux.png?resize=800%2C450&ssl=1
[2]: https://www.zdnet.com/article/oracle-announces-oracle-autonomous-linux/
[3]: https://www.oracle.com/in/database/what-is-autonomous-database.html
[4]: https://www.oracle.com/corporate/pressrelease/oow19-oracle-autonomous-linux-091619.html
[5]: https://www.zdnet.com/article/100-million-americans-and-6-million-canadians-caught-up-in-capital-one-breach/
[6]: https://distrowatch.com/table.php?distribution=oracle
[7]: https://www.zdnet.com/article/top-cloud-providers-2019-aws-microsoft-azure-google-cloud-ibm-makes-hybrid-move-salesforce-dominates-saas/
[8]: https://itsfoss.com/ibm-red-hat-acquisition/
[9]: https://reddit.com/r/linuxusersgroup
