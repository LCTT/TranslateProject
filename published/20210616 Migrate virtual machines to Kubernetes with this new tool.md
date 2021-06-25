[#]: subject: (Migrate virtual machines to Kubernetes with this new tool)
[#]: via: (https://opensource.com/article/21/6/migrate-vms-kubernetes-forklift)
[#]: author: (Miguel Perez Colino https://opensource.com/users/mperezco)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13520-1.html)

用 Forklift 将虚拟机迁移到 Kubernetes 上
======

> 用 Forklift 将你的虚拟化工作负载过渡到 Kubernetes。

![](https://img.linux.net.cn/data/attachment/album/202106/25/113010mxhtznxjhxf1glz7.jpg)

2017 年，[KubeVirt][2] 团队 [发起][3] 了一个在 [Kubernetes][4] 中管理容器及相关的虚拟机（VM）的项目。这个开源项目的意图是让虚拟机成为这个环境中的一等公民。

自从在 [2018 年开源峰会][5] 上推出以来，KubeVirt 一直在不断成熟和发展。它在 GitHub 上已经达到了 200 多颗星，甚至在 2021 年 2 月推出了自己的活动：[KubeVirt 峰会][6]。

![KubeVirt architecture][7]

*KubeVirt 架构（© 2020,[Red Hat OpenShift][8]）*

KubeVirt 是 [OpenShift 虚拟化][9] 的基础，它帮助开发者将虚拟机带入容器化工作流程。

### 在 Kubernetes 中使用虚拟机

KubeVirt 使你能够在虚拟机上原生使用 Kubernetes。这意味着它们可以连接到使用标准 Kubernetes 方法（如服务、路由、管道等）访问的<ruby>吊舱<rt>Pod</rt></ruby>网络。应用于虚拟机吊舱的网络策略与应用于应用吊舱的方式相同，它提供一个一致的模型来管理虚拟机到吊舱（或反之）的通信。

这方面的一个真实例子是一家航空公司利用旧的模拟器软件的方式。它注入了人工智能和机器学习 （AI/ML） 的模型，然后在基于虚拟机的模拟器上自动部署和测试它们。这使得它能够使用 Kubernetes 和 [Kubeflow][10] 完全自动化地获得测试结果和新的遥测训练数据。

![VM-creation workflow][11]

*（Konveyor, [CC BY-SA 4.0][12]）*

[Konveyor.io][13] 是一个开源项目，帮助现有工作负载（开发、测试和生产）过渡到 Kubernetes。其工具包括将容器从一个 Kubernetes 平台转移到另一个平台的 [Crane][14]；将工作负载从 Cloud Foundry 带到 Kubernetes的 [Move2Kube][15]；以及分析 Java 应用，使其对 Kubernetes 等容器化平台中的运行时更加标准和可移植，从而使其现代化的 [Tackle][16]。

这些工具在转化模式中很有用，但许多项目希望在早期阶段利用 Kubernetes，以变得更加敏捷和富有成效。在基础设施方面，这些好处可能包括蓝/绿负载均衡、路由管理、声明式部署，或（取决于你的部署方式）由于不可变的基础设施而更容易升级。在开发方面，它们可能包括将持续集成/持续开发 （CI/CD） 管道与平台整合，使应用更快地投入生产，自我提供资源，或整合健康检查和监控。

KubeVirt 可以通过在 Kubernetes 环境中以虚拟机来运行工作负载帮助你。它能让你的工作负载迅速使用 Kubernetes，享受它的好处，并随着时间的推移稳步实现工作负载的现代化。但是，仍然有一个问题，就是把你的虚拟机从传统的虚拟化平台带到现代的 Kubernetes 平台。这就是 Konveyor 的 [Forklift][17] 项目的意义所在。

### 关于 Forklift

Forklift 使用 KubeVirt 将不同来源的虚拟化工作负载迁移到 Kubernetes。它的设计目标是使任务变得简单，以便你可以从一两台机器到数百台机器迁移任何东西。

迁移是一个简单的、三阶段的过程：

  1. 连接到一个现有的虚拟化平台（称为“源提供者”）和一个 Kubernetes 环境（“目标提供者”）。
  2. 将网络和存储资源从源提供者映射到目标提供者，在两者中寻找等价的资源。
  3. 选择要迁移的虚拟机，分配网络和存储映射，制定迁移计划。然后运行它。

### 如何开始

要开始使用 Forklift，首先，你需要一个兼容的源提供商。你还需要一个带有 KubeVirt 0.40 或更新版本的 Kubernetes 环境和裸机节点（尽管为了测试，你可以使用嵌套虚拟化）。用读-写-执行 （RWX） 功能配置你的存储类，并使用 [Multus][18] 配置你的网络，以匹配你的虚拟机在源提供者中使用的网络。（如果你不能这样做，也不用担心。你也可以选择重新分配 IP 地址。）

最后，使用提供的操作器在你的 Kubernetes 上[安装 Forklift][19]，并进入用户界面，开始运行你的第一次测试迁移。

Forklift 是 Red Hat 的 [虚拟化迁移工具套件][20] 的上游版本。因此，如果你想在生产环境中使用它，你可以考虑使用该工具的支持版本。

迁移愉快！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/migrate-vms-kubernetes-forklift

作者：[Miguel Perez Colino][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mperezco
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_2015-1-osdc-lead.png?itok=VEB4zwza (Containers on a ship on the ocean)
[2]: http://kubevirt.io/
[3]: https://kubevirt.io/2017/This-Week-in-Kube-Virt-1.html
[4]: https://opensource.com/resources/what-is-kubernetes
[5]: https://ossna18.sched.com/event/FAOR/kubevirt-cats-and-dogs-living-together-stephen-gordon-red-hat
[6]: https://kubevirt.io/summit/
[7]: https://opensource.com/sites/default/files/uploads/image1_1.png (KubeVirt architecture)
[8]: https://www.openshift.com/learn/topics/virtualization/
[9]: https://openshift.com/virtualization/
[10]: https://www.kubeflow.org/
[11]: https://opensource.com/sites/default/files/uploads/image2_0_6.png (VM-creation workflow)
[12]: https://creativecommons.org/licenses/by-sa/4.0/
[13]: https://www.konveyor.io/
[14]: https://www.konveyor.io/crane
[15]: https://move2kube.konveyor.io/
[16]: https://www.konveyor.io/tackle
[17]: https://www.konveyor.io/forklift
[18]: https://github.com/k8snetworkplumbingwg/multus-cni
[19]: https://www.youtube.com/watch?v=RnoIP3QjHww&t=1693s
[20]: https://access.redhat.com/documentation/en-us/migration_toolkit_for_virtualization/2.0/
