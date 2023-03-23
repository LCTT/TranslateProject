[#]: subject: "Kubernetes To Soon Support Confidential Computing"
[#]: via: "https://www.opensourceforu.com/2022/09/kubernetes-to-soon-support-confidential-computing/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "littlebirdnest"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15083-1.html"

Kubernetes 即将支持机密计算
======

![](https://www.opensourceforu.com/wp-content/uploads/2022/09/kubernets-on-prem-diy-considerations-1.png)

> Constellation 是第一个始终加密的 kubernetes（K8S）。在这个 K8S 中，你的所有工作负载和控制平面都被完全屏蔽起来，你可以使用加密证书远程确认这一点。

Constellation Kubernetes 引擎使用 <ruby>秘密计算<rt>secret computing</rt></ruby> 和 <ruby>机密虚拟机<rt>confidential VM</rt></ruby>，将 Kubernetes 集群与云架构的其余部分隔离开来。因此，无论是在静态还是在内存中，数据总是被加密的，并创建了一个 <ruby>机密上下文<rt>confidential context</rt></ruby>。根据创建 Constellation 的公司 Edgeless Systems 的说法，由于它为在公共云上运行的数据和工作流增加了安全性和保密性，因此机密计算是云计算的未来。

Kubernetes 节点在使用 Constellation 的私有虚拟机中运行。根据 Edgeless Systems 的说法，机密虚拟机是安全飞地的演变，它将机密计算的三个原则——运行时加密、隔离和远程证明——扩展到整个虚拟系统。机密虚拟机（TDX）使用底层硬件对私有计算的特殊支持，例如 AMD 安全加密虚拟化（AEM）、SEV-安全嵌套分页（SEV-SNP）和英特尔信任域扩展。此外，ARM 去年还发布了名为 Realms 的新 V9 架构。此设计包括私有 VM 功能。

Constellation 尝试在集群级别提供证明或通过加密证书进行验证，以及“始终在线”加密。 Constellation 中的机密 VMS 使用了 Fedora CoreOS，它构建在一个不可变的文件系统之上，是面向容器而设计的。Constellation 还利用 Sigstore 来保护 DevOps 信任链。

使用秘密计算时，性能可能会令人担忧。是的，加密会影响性能，但 AMD 和微软的联合基准测试发现，这只会导致 2% 到 8% 之间的微小性能损失。Edgeless Systems 声称 Constellation 将在繁重的工作负载下表现类似。

鉴于 Constellation 已通过 CNCF 认证，并且可与包括 GCP 和 Azure 在内的所有主要云服务互操作，这应保证其与其他 Kubernetes 工作负载和工具的互操作性。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/kubernetes-to-soon-support-confidential-computing/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[littlebirdnest](https://github.com/littlebirdnest)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
