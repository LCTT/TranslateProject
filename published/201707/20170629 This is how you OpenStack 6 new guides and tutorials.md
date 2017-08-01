 6 个学习 OpenStack 的新指南和教程
============================================================

> 想了解更多关于 OpenStack 的内容？这些免费资源可能只是你所需要的。
 
![OpenStack guides and tutorials](https://opensource.com/sites/default/files/styles/image-full-size/public/images/education/edu_rcos.png?itok=wLMIaigd "OpenStack guides and tutorials")


云基础设施是一个非常需要的技能。如果你正在为你的云基础架构需求寻找开源解决方案，那么 [OpenStack][12] 就是其中之一。

OpenStack 是一个巨大的项目集合，为云服务的几乎每一个部分都提供了解决方案和集成。虽然这个巨大范围使得它成为一个强大的工具，但这也意味着可能很难跟上并了解整个项目，了解如何使用它们、如何自定义它们以及如何向其提供代码。

幸运的是，有很多选择可以帮助你。除了[官方项目文档] [13]、纸质书籍和认证培训计划外，还有大量社区创造的优秀资源。我们每个月可以在 Opensource.com 上查看它在博客和其他网站上最近发布的指南和教程，这会给你启发。我们来看看这次我们发现了什么。

*   首先在本月的这一批中，我们有一篇来自 Antony Messerli 的指南，介绍如何通过 Ansible [设置 OpenStack 云][1]。Messerli 将引导我们完成实验室环境中的配置以及在集群上运行 OpenStack 所需的 playbook，还有添加镜像、设置网络等的基础知识。如果你正在考虑使用 Ansible 安装 OpenStack 小型本地测试环境，这是一篇很好的文章。
*   接下来，你有没有想过 Neutron 网络如何在 OpenStack 中的工作的？应用程序中发生的事情如何对应于底层代码？Arie Bregman 在[这篇文章][2]中提供了一段 OpenStack Neutron 代码。你需要熟悉一般的网络原理，至少有一点 OpenStack 代码基础才能跟上。
*   Gerrit是 OpenStack 使用的开源代码审查项目，用于管理上传的修补程序，并允许在将更改合并到主 OpenStack 代码库之前进行反馈和测试。对于那些习惯于不同的代码审查系统（或根本没有的），Gerrit 可能会有点混乱，尽管它具有很好的仪表板功能，因此你只能看到对你很重要的信息。Dougal Matthews 在[这篇文章][3]中带我们看了他的 Gerrit 仪表板设置，这可能会帮助你设置自己的。
*   上个月在波士顿举办的 OpenStack 峰会的[视频][4]已经发布了，无论你是否参加过上个月的活动，这都包含了技术和非技术专题的宝库。不知道从哪里开始？这有个来自 Julio Villarreal Pelegrino 关于如何规划、构建、运行一个成功的 OpenStack 云计算的[演讲][5]。
*   任何云管理员都应该担心安全问题。但你从哪里开始？Naveen Joy 发布了一个很好的十个安全问题的[清单][6]，用于加固你的 OpenStack 网络；你可以在上个月的同一主题演讲中查看[这个视频][7]。
*   OpenStack 中的内部消息服务在一个公共库中进行管理，该库存在于一个称为 Oslo 的项目中，自然它被称为 Oslo.Messenging。要了解这个库的基础知识，它在这个分为[两个][8][部分][9]的博客中提到。

想要了解更多？可以从这三年来社区说提供的内容中找到我们完整的 [OpenStack 指南、如何做和教程][14]，以帮助你学习成为一名高效的 OpenStack 开发人员或管理员。

有很棒教程、指导或者如何做需要我们分享的么？在下面的评论中分享。

（图片来源：opensource.com）

--------------------------------------------------------------------------------

作者简介：

Jason Baker - Jason 热衷于使用技术使世界更加开放，从软件开发到阳光政府行动。Linux 桌面爱好者、地图/地理空间爱好者、树莓派工匠、数据分析和可视化极客、偶尔的码农、云本土主义者。在 Twitter 上关注他。

via: https://opensource.com/article/17/6/openstack-guides-and-tutorials

作者：[Jason Baker][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:https://www.reversengineered.com/2016/05/09/setting-up-an-openstack-cloud-using-ansible/
[2]:http://abregman.com/2017/05/29/openstack-neutron-service-code-deep-dive/
[3]:http://www.dougalmatthews.com/2017/May/19/how-i-gerrit/
[4]:https://www.openstack.org/videos/
[5]:http://www.juliosblog.com/dont-fail-at-scale-how-to-plan-for-build-and-operate-a-successful-openstack-cloud-video-openstack-summit2017/
[6]:https://blogs.cisco.com/cloud/securing-openstack-networking
[7]:https://www.openstack.org/videos/boston-2017/securing-openstack-networking
[8]:https://pigdogweb.wordpress.com/2017/05/22/intro-to-oslo-messaging/
[9]:https://pigdogweb.wordpress.com/2017/06/02/oslo-messaging-the-cloud-is-calling/
[10]:https://opensource.com/article/17/6/openstack-guides-and-tutorials?rate=tRBp5wgAE1d3YHJSwcHWnfgXyJlqJedMImQFqJiW-tE
[11]:https://opensource.com/user/19894/feed
[12]:https://opensource.com/resources/what-is-openstack
[13]:http://docs.openstack.org/
[14]:https://opensource.com/resources/openstack-tutorials
[15]:https://opensource.com/users/jason-baker
[16]:https://opensource.com/users/jason-baker
[17]:https://opensource.com/article/17/6/openstack-guides-and-tutorials#comments
