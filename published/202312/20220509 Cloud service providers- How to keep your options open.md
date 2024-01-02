[#]: subject: "Cloud service providers: How to keep your options open"
[#]: via: "https://opensource.com/article/22/5/cloud-service-providers-open"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16482-1.html"

保持对云服务供应商选择的多样性
======

![][0]

> 不论云服务的开放程度如何，你都能为自己的环境选择合适的方式。

对于 Linux 用户来说，市场上有一种新型的电脑出现，我们称之为“云”。

如同你桌面上的个人电脑，背包里的笔记本电脑，或是你租用的虚拟私有服务器一样，你可以选择不同的云计算供应商。虽然品牌名称和你以往熟悉的硬件品牌不一致，但其核心概念是相同的。

要运行 Linux，你需要一台电脑。要在云上运行 Linux，你需要一个云服务供应商。就像你的电脑中的硬件和固件一样，你的计算堆栈可以使用多大的开源程度也是有区别的。

作为一个开源的用户，我更偏向于拥有尽量开放的计算集成环境。在对云计算市场进行详细的调研后，我形成了关于云服务供应商的三层观点。你可以根据这个体系作为指南，对你将选择的云供应商作出明确的决策。

### 开放堆栈

一个完全开放的云是从底层开始就建立在开源技术之上的云。由于云科技中有很大一部分从一开始就是开源的，因此技术层面的开放性堆栈并不难以实现。然而，也有云供应商以专有的方式重新发明轮子，这让用户很容易误入使用了许多封闭源码组件的云服务商的陷阱中。

如果你在寻找一个真正开放的云，那么你应该寻找一个提供 [OpenStack][2] 作为基础的云供应商。OpenStack 提供云的软件基础设施，包括通过 Neutron 实现的软件定义网络（SDN）、通过 Swift 实现的对象存储、身份和密钥管理、镜像服务等等。按照我的硬件电脑比喻，OpenStack 就是驱动云的“内核”。

当然，我并不是字面上的意思，但如果你的云供应商运行 OpenStack，那相当于你可以直接到达堆栈的底部。从用户的角度看，OpenStack 是你的云存在并拥有文件系统、网络等的原因所在。

在 OpenStack 的主体上，可能有一个像 Horizon 或 Skyline 这样的网络用户界面，可能有像 [OpenShift][3] 或 OKD（并不是一个缩写，但前身是 OpenShift Origin）这样的额外组件。所有这些都是开源的，它们帮助你运行容器，这些容器是内嵌应用程序的极简 Linux 镜像。

因为 OpenShift 和 OKD 不需要 OpenStack，这就构成了我对云世界的下一个视野级别。

### 开放平台

你并不总是可以选择你的云正在运行的堆栈。你的云可能运行的是 Azure、AWS，或者类似的东西，而不是 OpenStack。

这些就是云世界的“二进制碎片”。你对它们如何工作，或者为什么工作一无所知；你只知道你的云存在，并且有一个文件系统，一个网络堆栈，等等。

就像桌面计算一样，你可以在获得的服务器上运行一个“操作系统”。言下之意，有一种观点认为 OpenStack 本质上就是云计算的操作系统。然而，通常情况下，用户直接交互的是 OpenShift。

OpenShift 是一个你可以使用 Podman 和 Kubernetes 管理容器和 <ruby>容器荚<rt>Pod</rt></ruby> 的开源“桌面”或工作区。它让你在云上运行应用程序，就像你在笔记本电脑上启动一个应用一样。

### 开放标准

最后，同样重要的一点是，有些情况下你在选择云服务供应商上没有什么选择。你被放在一个运行着专有“内核”、专有“操作系统”的平台上，你能影响的只剩下你在那个环境里运行什么。

但掌握开源的力量，你就能建立你自己的平台。你可以选择在容器内部使用的组件。你可以，而且应该，围绕开源工具设计你的工作环境，因为这样一来，如果你有机会更换服务供应商，你可以将你的所有工作迁移到新的供应商那里。

这可能需要你自行实现一些在你当前受限（非开源）平台上已经内置的功能。例如，你的云供应商可能会用一个包含在他们平台“免费”提供的 API 管理系统或持续集成/持续交付（CI/CD）管道来吸引你，这需要你有清醒的认识。当一个非开放的应用被免费提供时，通常会以其他形式带来一些成本。其中一种成本是，一旦你开始在它的基础上构建，你会更加不愿意迁移，因为你会离开你已建立的一切。

你应当为自己重建这些封闭“特性”，并将其转化为开源服务。在容器中运行 [Jenkins][4] 和 [APIMan][5]。找出你的云提供商声称用专有代码解决的问题，然后使用开源解决方案来确保，当你离开寻找开放的供应商时，你可以迁移你已经构建的系统。

### 开源计算

对于太多的人来说，云计算是一个开源居于次要地位的领域。实际上，开源在云上的重要性与它在你的个人电脑和驱动互联网的服务器上同样重要。

寻找开源的云服务。

当你受困于无法获取源代码的环境时，就肩负起在你的云内使用开源软件的责任吧。

*（题图：DA/9dc5a9d0-d664-492f-890a-b437ce39c4d6）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/cloud-service-providers-open

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/bus-cloud.png
[2]: https://opensource.com/resources/what-is-openstack
[3]: https://cloud.redhat.com/?intcmp=7013a000002qLH8AAM
[4]: https://opensource.com/article/19/9/intro-building-cicd-pipelines-jenkins
[5]: https://www.apiman.io/latest/
[0]: https://img.linux.net.cn/data/attachment/album/202312/17/223915neao8gei208poo8c.jpg