Master OpenStack with 5 new tutorials
5篇文章快速掌握OpenStack
=======================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/education/EDUCATION_tools.png?itok=ybxr0Qe9)

回顾这周的OpenStack峰会,我仍然回味着开源云生态系统的浩瀚无垠,并且需要熟悉多少个不同的项目和概念才能获得成功.但是,我们却如此的幸运有许多资源让我们跟随项目的脚步.不单是[官方文档][1],还包括了许多学习的工具,来自三方的组织的培训和认证,也有个人的分享,以及许多社区贡献的教程.

为了让我们保持获得最新消息,每一个月我们将会整合发布,penStack社区的最新教程,指导,和小贴士等.下面是我们过去几个月最棒的发布分享.

- 首先,如果你正在寻找一个靠谱实惠的OpenStack测试实验室,Intel NUC是最值得考虑的平台.麻雀虽小,五脏俱全,通过指导文章,可以很轻松的按照教程在NUC上使用[Triple0部署OpenStack][2],并且还可以轻松预防一些常见的怪异问题.
- 当你已经运行的一段时间OpenStack后,你会发现在你的云系统上许多组件生成了大量日志.其中一些是可以安全删除的,你同样需要一个计划去管理这些日志.参看这篇文章[突然的想法][3]学习在部署9个月后Celiometer上如何管理日志.
- 对于OpenStack基础设施项目的新手,想要提交补丁到OpenStack是相当困难的.入口在哪里,测试怎么做,我的提交步骤是怎么样的?可以通过Arie Bregman的[博客文章][4]快速了解整个提交过程.
- 突发计算节点失效,不知道是硬件还是软件问题,好消息是OpenStack提供了一套非常简单的迁移计划让当机节点迁移到别的主机.然而,许多人发现使用这个命令总会遇到一些问题.可以学习[这篇文章][5]来理解migrate和evacuate命令的不同.
- 网络功能虚拟化技术需要OpenStack的额外用户不熟悉的知识。例如,SR-IOV和PCI直通是最大限度地提高物理硬件性能的方式.学习[部署步骤][6]使OpenStack部署获得更多效能.

这些文章基本涵盖了本月推送,如果你还需要更多文章,可以检索过去推送的[OpenStack文献][7]来获取更多资源.如果有新的教程或指导,你认为我们应该推荐,请在评论中告诉我们,谢谢. 

------------------------------------------------------------------------------

via: https://opensource.com/business/16/4/master-openstack-new-tutorials

作者：[Jason Baker][a]
译者：[VicYu/Vic020](http://vicyu.net)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker

[1]: http://docs.openstack.org/
[2]: http://acksyn.org/posts/2016/03/tripleo-on-nucs/
[3]: http://silverskysoft.com/open-stack-xwrpr/2016/03/long-term-openstack-usage-summary/
[4]: http://abregman.com/2016/03/05/openstack-infra-jenkins-jobs/
[5]: http://www.danplanet.com/blog/2016/03/03/evacuate-in-nova-one-command-to-confuse-us-all/
[6]: https://trickycloud.wordpress.com/2016/03/28/openstack-for-nfv-applications-sr-iov-and-pci-passthrough/
[7]: https://opensource.com/resources/openstack-tutorials
