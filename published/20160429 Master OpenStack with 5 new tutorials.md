推荐五篇 OpenStack 的新指南
=======================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/education/EDUCATION_tools.png?itok=ybxr0Qe9)

回顾这周的 OpenStack 峰会，我仍然回味着开源云生态系统的浩瀚无垠，有那么多需要了解的项目及概念才能获得成功。不过我们很幸运，因为有许多资源让我们跟随着项目的脚步。除了[官方文档][1]外，我们还有许多来自第三方提供的培训和认证、个人分享，以及许多社区贡献的学习资源。

为了让我们保持获得最新消息，每个月我们将会整合发布 OpenStack 社区的最新教程、指导和小贴士等。下面是我们过去几个月最棒的发布分享。

- 首先，如果你正在寻找一个靠谱实惠的 OpenStack 测试实验室， Intel NUC 是最值得考虑的平台。麻雀虽小，五脏俱全，通过指导文章，可以很轻松的按照教程在 NUC 上使用 [TripleO 部署 OpenStack][2] ，并且还可以轻松避开一些常见的古怪问题。
- 当你已经运行的一段时间 OpenStack 后，你会发现在你的云系统上许多组件生成了大量日志。其中一些是可以安全删除的，而你需要一个管理这些日志的方案。参考在部署生产 9 个月后使用 Celiometer 管理日志的[一些思考][3]。
- 对于 OpenStack 基础设施项目的新手，想要提交补丁到 OpenStack 是相当困难的。入口在哪里，测试怎么做，我的提交步骤是怎么样的？可以通过 Arie Bregman 的这篇[博客文章][4]快速了解整个提交过程。
- 突发计算节点失效，不知道是硬件还是软件问题。不过好消息是 OpenStack 提供了一套非常简单的迁移计划可以让你迁移当机节点到别的主机。然而，迁移过程中使用的命令令许多人感到困惑。可以通过[这篇文章][5]来理解 migrate 和 evacuate 命令的不同。
- 网络功能虚拟化技术需要 OpenStack 之外的一些功能，而用户可能不熟悉它们。例如， SR-IOV 和 PCI 直通是最大限度地提高物理硬件性能的方式。可以学习[部署步骤][6]以使 OpenStack 的性能最大化。

这些文章基本涵盖了本月（译者注： 4 月）推送，如果你还需要更多文章，可以检索过去推送的 [OpenStack 文献][7]来获取更多资源。如果有你认为我们应该推荐的新教程，请在评论中告诉我们，谢谢。

------------------------------------------------------------------------------

via: https://opensource.com/business/16/4/master-openstack-new-tutorials

作者：[Jason Baker][a]
译者：[VicYu/Vic020](http://vicyu.net)
校对：[PurlingNayuki](https://github.com/PurlingNayuki)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker

[1]: http://docs.openstack.org/
[2]: http://acksyn.org/posts/2016/03/tripleo-on-nucs/
[3]: http://silverskysoft.com/open-stack-xwrpr/2016/03/long-term-openstack-usage-summary/
[4]: http://abregman.com/2016/03/05/openstack-infra-jenkins-jobs/
[5]: http://www.danplanet.com/blog/2016/03/03/evacuate-in-nova-one-command-to-confuse-us-all/
[6]: https://trickycloud.wordpress.com/2016/03/28/openstack-for-nfv-applications-sr-iov-and-pci-passthrough/
[7]: https://opensource.com/resources/openstack-tutorials
