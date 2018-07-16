
开源项目Docker，Red Hat新的虚拟化选择
==============================================================

![redhat](http://www.eweek.com/imagesvr_ce/1773/290x195redhat1.jpg)

**Red Hat与开源项目Docker容器技术开发人员组成合作团队，提供一个虚拟机管理器技术(hypervisors)的替代方案。**

Linux发行商Red Hat正与虚拟技术公司dotCloud合作，为Fedora社区Linux项目开发一种新型开源容器技术，名为"[Docker][1]"。

当今Linux上的虚拟技术主要包括两类，一类是管理器技术(hypervisors)，例如KVM、Xen，另一类为容器技术(container)，例如 [Linux LXC][2]项目(LinuX Containers)。Fedora项目领袖Robyn Bergeron向eWeek介绍说，Red Hat已经将容器技术作为OpenShift PaaS解决方案的一部分，为用户提供应用分离解决方案。

Bergeron补充说尽管Docker与容器类型类似，但是Docker并非Red Hat目前正在使用的容器技术。他说，dotCloud和Red Hat两家都希望Docker能在Red Hat家族的Linux系统中运行。双方的合作目前集中在将Docker作为Fedora协同开源开发环境的一部分。

dotCloud创始人同时也是Docker项目发起人Solomon Hykes说，Docker并不是为了用来替代LXC。

“Docker底层使用了LXC，并整合了其它技术”，Hykes说，“Docker是现有的低层面技术的一个集合，但并非只是简单的将它们叠加在一起。”

Hykes介绍，他们的目标是为[DevOps][3]世界带来一种开发者和运维人员都能明白并使用的技术。一个Docker容器包含了运行一个特定进程所必需的所有的二进制文件、库文件和配置文件。

他还说，“我们希望将容器用于应用程序部署，而不只是将其看做微型服务器。”

###容器技术 vs. 管理器技术

在企业级服务领域，许多系统管理员如今都熟悉虚拟机管理器技术，例如VMware ESX、Xen和KVM。Hykes认为容器技术正成为管理器技术的互补。

“管理器技术一直以来的处境是，它确实是一门伟大的技术，但是行业内却把它当做一把大斧头并试图用它来完成所有的木匠活”，Hykes认为虚拟机管理器作为一种服务类型，相当于提供了一台裸机的硬件，而与之相对的，容器的工作就是为这台主机提供一系列软件。

###Red Hat与Docker

作为Red Hat的开发合作伙伴，Hykes说他们的首要任务是确保Docker能够在Red Hat家族的Linux系统上流畅运行。他承认目前Docker 0.6版在包括Fedora之内的Red Hat家族的Linux系统上运行时还有一些问题。下一个发布版本0.7版将针对这些问题重点改进，确保Red Hat家族Linux系统成为Docker部署环境的“一等公民”。

迄今为止，dotCloud已经为它的Docker项目筹集到了1000万美元风投资金。Hykes补充说Docker目前还并没有一款成形的商用产品，他们的首要目标是建立Docker社区生态环境与基础用户群。

“dotCloud的第一阶段是确保Docker足够的普及程度，同时取得IT界大客户的青睐，”Hykes说，“能够与Red Hat合作对我们来说是一个巨大阶段性胜利。”

---

via: http://www.eweek.com/developer/red-hat-expands-virtualization-options-with-open-source-docker.html

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Mr小眼儿] 校对：[wxy][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Mr小眼儿]:http://linux.cn/space/14801
[wxy]:http://linux.cn/space/wxy

[1]:https://www.docker.io/
[2]:http://en.wikipedia.org/wiki/LXC
[3]:http://en.wikipedia.org/wiki/DevOps
