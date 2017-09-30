OpenStack 上的 OpenShift：更好地交付应用程序
============================================================

你有没有问过自己，我应该在哪里运行 OpenShift？答案是任何地方 - 它可以在裸机、虚拟机、私有云或公共云中很好地运行。但是，这里有一些为什么人们正迁移到围绕全栈和资源消耗自动化相关的私有云和公有云的原因。传统的操作系统一直是关于[硬件资源的展示和消耗][2] - 硬件提供资源，应用程序消耗它们，操作系统一直是交通警察。但传统的操作系统一直局限于单机^注1 。

那么，在原生云的世界里，现在意味着这个概念扩展到包括多个操作系统实例。这就是 OpenStack 和 OpenShift 所在。在原生云世界，虚拟机、存储卷和网段都成为动态配置的构建块。我们从这些构建块构建我们的应用程序。它们通常按小时或分钟付费，并在不再需要时被取消配置。但是，你需要将它们视为应用程序的动态配置能力。 OpenStack 在动态配置能力（展示）方面非常擅长，OpenShift 在动态配置应用程序（消费）方面做的很好，但是我们如何将它们结合在一起来提供一个动态的、高度可编程的多节点操作系统呢？

要理解这个，让我们来看看如果我们在传统的环境中安装 OpenShift 会发生什么 - 想像我们想要为开发者提供动态访问来创建新的应用程序，或者想象我们想要提供业务线，使其能够访问现有应用程序的新副本以满足合同义务。每个应用程序都需要访问持久存储。持久存储不是临时的，在传统的环境中，这通过提交一张工单实现。没关系，我们可以连到 OpenShift，每次需要存储时都会提交一张工单。存储管理员可以登录企业存储阵列并根据需要删除卷，然后将其移回 OpenShift 以满足应用程序。但这将是一个非常慢的手动过程，而且你可能会遇到存储管理员辞职。

![](https://blog.openshift.com/wp-content/uploads/OpenShift-on-OpenStack-Delivering-Applications-Better-Together-Traditional-Storage-1024x615.png)

在原生云的世界里，我们应该将其视为一个策略驱动的自动化流程。存储管理员变得更加战略性、设置策略、配额和服务级别（银、黄金等），但实际配置变得动态。

![](https://blog.openshift.com/wp-content/uploads/OpenShift-on-OpenStack-Delivering-Applications-Better-Together-Cloud-Storage-1024x655.png)

动态过程可扩展到多个应用程序 - 这可能是开发者测试的业务线甚至新应用程序。从 10 多个应用程序到 1000 个应用程序，动态配置提供原生云体验。

![](https://blog.openshift.com/wp-content/uploads/OpenShift-on-OpenStack-Delivering-Applications-Better-Together-Persistent-Volume-Claims-Persistent-Volumes-Demo-1024x350.png)

下面的演示视频展示了动态存储配置如何与 Red Hat OpenStack 平台（Cinder 卷）以及 Red Hat OpenShift 容器平台配合使用，但动态配置并不限于存储。想象一下，随着 OpenShift 的一个实例需要更多的容量、节点自动扩展的环境。想象一下，推送一个敏感的程序更改前，将网段划分为负载测试 OpenShift 的特定实例。这些是你为何需要动态配置 IT 构建块的原因。OpenStack 实际上是以 API 驱动的方式实现的。

[YOUTUBE VIDEO](https://youtu.be/PfWmAS9Fc7I)

OpenShift 和 OpenStack 一起更好地交付应用程序。OpenStack 动态提供资源，而 OpenShift 会动态地消耗它们。它们一起为你所有的容器和虚拟机需求提供灵活的原生云解决方案。

注1：高可用性集群和一些专门的操作系统在一定程度上弥合了这一差距，但在计算中通常是一个边缘情况。

--------------------------------------------------------------------------------

via: https://blog.openshift.com/openshift-on-openstack-delivering-applications-better-together/

作者：[SCOTT MCCARTY][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.openshift.com/author/smccartyredhat-com/
[1]:https://blog.openshift.com/author/smccartyredhat-com/
[2]:https://docs.google.com/presentation/d/139_dxpiYc5JR8yKAP8pl-FcZmOFQCuV8RyDxZqOOcVE/edit
