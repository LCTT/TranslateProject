[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco, Google reenergize multicloud/hybrid cloud joint development)
[#]: via: (https://www.networkworld.com/article/3388218/cisco-google-reenergize-multicloudhybrid-cloud-joint-development.html#tk.rss_all)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

思科、谷歌重新赋能多/混合云共同开发
======
思科，VMware，HPE 与其它公司踏入新的 Google Cloud Athos 云技术
![Thinkstock][1]

思科与谷歌已扩展它们的混合云开发活动，以帮助其客户在从预置的数据中心到公共云上的任何地方更简便地搭建安全的多云以及混合云应用。

**[查看[什么是混合云计算][2]并了解[关于多云你所需要知道的][3]。[注册 Network World 速报][4]]以定时接受资讯**

这次扩张围绕着谷歌在这周的 Google Next 活动上介绍的新的称作 Anthos 的开源混合云包展开。Anthos 基于并取代了谷歌现有的谷歌云服务测试版。Anthos 将让客户们无须修改就可以在现有的预置硬件或公共云上运行应用。据谷歌说，它可以在[谷歌云平台][5] (GCP) 与 [谷歌 Kubernetes 引擎][6] (GKE) 或者在数据中心中与 [GKE On-Prem][7] 一同被获取。谷歌说，Anthos 首次让客户们可以无需管理员和开发者了解不同的坏境和 API 就能从谷歌平台上管理在第三方云上的工作负荷如 AWS 和 Azure。

关键在于，Athos 提供一个单独的受管理的服务，它使得客户们无须忧虑不相似的环境或 API 就能跨云管理、部署工作负荷。

作为首秀的一部分，谷歌也宣布一个能够从预置环境或者其它云自动移植虚拟机到 GKE 上的容器的叫做 [Anthos Migrate[8] 的测试项目。谷歌说，“这种独特的移植技术使你无须修改原来的虚拟机或者应用就能以一种行云流水般的方式迁移、更新你的基础架构”。谷歌称它给予了公司按客户节奏转移预置应用到云环境的灵活性。

### 思科和谷歌

就思科来说，它宣布对 Anthos 的支持并承诺将它紧密集成进思科的数据中心科技中，例如 HyperFlex 超融合包，应用中心基础架构（思科的旗舰 SDN 方案）， SD-WAN 和 StealthWatch 云。思科说，无论是预置的还是在云端的，这次集成将通过自动更新到最新版本和安全补丁，给予一种一致的、云般的感觉。

“谷歌云在容器和服务网——分别在 Kubernetes 和 Istio——上的专业与它们在开发者社区的领导力，混合思科的企业级网络，计算，存储和安全产品及服务，将为我们的顾客促成一次强强联合。”思科的资深副总裁，云平台和解决方案小组的 Kip Compton 这样[写道][9]，“思科对于 Anthos 的集成将会帮助顾客跨预置数据中心和公共云搭建、管理多云/混合云应用，并使得他们无须在安全上让步或者增加复杂性就能集中精力在创新与敏捷上。”

### 谷歌云和思科

Eyal Manor，在谷歌云工作的副总裁，[写道][10] 通过思科对 Anthos 的支持，客户将能够：
* 从完全受管理的服务例如 GKE 以及思科的超融合基础架构，网络和安全科技中收益。
* 具有一致性地跨企业数据中心和云操作
* 从一个企业数据中心消耗云服务
* 用最新的云技术更新预置架构



思科和谷歌从2017年10月两公司说他们将从事能够连接预置架构和云环境的开放混合云平台就开始紧密合作。那个包，[为谷歌云打造的思科混合云平台]，大致在2018年9月可以获取。它使得客户们能通过谷歌云管理的包含思科网络和安全以及来自 Istio 的服务网络监听技术的 Kubernetes 容器拥有企业级开发的能力。

谷歌说 Istio 的开源容器和微服务优化科技给开发者提供了通过服务到服务级的 mTLS [双向传输层安全]访问控制认证进行跨云连接，保护，管理和监听微服务的同一方式。其结果就是，客户能够轻松落实新的便携的服务同时也能够中心化地配置管理那些服务。

思科不是唯一宣布对 Anthos 的支持的供应商。谷歌宣称至少30家大的谷歌合作商包括 [VMware][12]，[Dell EMC][13]， [HPE][14]， Intel 和 Lenovo 致力于为他们的客户在它们自己的超融合基础架构上分发 Anthos 服务。

在 [Facebook][15] 和 [LinkedIn][16] 上加入 Network World 社区以对高端话题评论。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3388218/cisco-google-reenergize-multicloudhybrid-cloud-joint-development.html#tk.rss_all

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.techhive.com/images/article/2016/12/hybrid_cloud-100700390-large.jpg
[2]: https://www.networkworld.com/article/3233132/cloud-computing/what-is-hybrid-cloud-computing.html
[3]: https://www.networkworld.com/article/3252775/hybrid-cloud/multicloud-mania-what-to-know.html
[4]: https://www.networkworld.com/newsletters/signup.html
[5]: https://cloud.google.com/
[6]: https://cloud.google.com/kubernetes-engine/
[7]: https://cloud.google.com/gke-on-prem/
[8]: https://cloud.google.com/contact/
[9]: https://blogs.cisco.com/news/next-phase-cisco-google-cloud
[10]: https://cloud.google.com/blog/topics/partners/google-cloud-partners-with-cisco-on-hybrid-cloud-next19?utm_medium=unpaidsocial&utm_campaign=global-googlecloud-liveevent&utm_content=event-next
[11]: https://cloud.google.com/cisco/
[12]: https://blogs.vmware.com/networkvirtualization/2019/04/vmware-and-google-showcase-hybrid-cloud-deployment.html/
[13]: https://www.dellemc.com/en-us/index.htm
[14]: https://www.hpe.com/us/en/newsroom/blog-post/2019/04/hpe-and-google-cloud-join-forces-to-accelerate-innovation-with-hybrid-cloud-solutions-optimized-for-containerized-applications.html
[15]: https://www.facebook.com/NetworkWorld/
[16]: https://www.linkedin.com/company/network-world

