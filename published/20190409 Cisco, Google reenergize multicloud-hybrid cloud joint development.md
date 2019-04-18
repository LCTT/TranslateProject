[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10747-1.html)
[#]: subject: (Cisco, Google reenergize multicloud/hybrid cloud joint development)
[#]: via: (https://www.networkworld.com/article/3388218/cisco-google-reenergize-multicloudhybrid-cloud-joint-development.html#tk.rss_all)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

思科、谷歌重新赋能多/混合云共同开发
======
> 思科、VMware、HPE 等公司开始采用了新的 Google Cloud Athos 云技术。

![Thinkstock][1]

思科与谷歌已扩展它们的混合云开发活动，以帮助其客户可以在从本地数据中心到公共云上的任何地方更轻松地搭建安全的多云以及混合云应用。

这次扩张围绕着谷歌被称作 Anthos 的新的开源混合云包展开，它是在这周的 Google Next 活动上推出的。Anthos 基于并取代了谷歌现有的谷歌云服务测试版。Anthos 将让客户们无须修改应用就可以在现有的本地硬件或公共云上运行应用。据谷歌说，它可以在[谷歌云平台][5] (GCP) 与 [谷歌 Kubernetes 引擎][6] (GKE) 或者在数据中心中与 [GKE On-Prem][7] 一同使用。谷歌说，Anthos 首次让客户们可以无需管理员和开发者了解不同的坏境和 API 就能从谷歌平台上管理在第三方云上（如 AWS 和 Azure）的工作负荷。

关键在于，Athos 提供了一个单一的托管服务，它使得客户们无须担心不同的环境或 API 就能跨云管理、部署工作负荷。

作为首秀的一部分，谷歌也宣布一个叫做 [Anthos Migrate][8] 的测试计划，它能够从本地环境或者其它云自动迁移虚拟机到 GKE 上的容器中。谷歌说，“这种独特的迁移技术使你无须修改原来的虚拟机或者应用就能以一种行云流水般的方式迁移、更新你的基础设施”。谷歌称它给予了公司按客户节奏转移本地应用到云环境的灵活性。

### 思科和谷歌

就思科来说，它宣布对 Anthos 的支持并承诺将它紧密集成进思科的数据中心技术中，例如 HyperFlex 超融合包、应用中心基础设施（思科的旗舰 SDN 方案）、SD-WAN 和 StealthWatch 云。思科说，无论是本地的还是在云端的，这次集成将通过自动更新到最新版本和安全补丁，给予一种一致的、云般的感觉。

“谷歌云在容器（Kubernetes）和<ruby>服务网格<rt>service mesh</rt></ruby>（Istio）上的专业与它们在开发者社区的领导力，再加上思科的企业级网络、计算、存储和安全产品及服务，将为我们的顾客促成一次强强联合。”思科的云平台和解决方案集团资深副总裁 Kip Compton 这样[写道][9]，“思科对于 Anthos 的集成将会帮助顾客跨本地数据中心和公共云搭建、管理多云/混合云应用，让他们专注于创新和灵活性，同时不会影响安全性或增加复杂性。”

### 谷歌云和思科

谷歌云工程副总裁 Eyal Manor [写道][10] 通过思科对 Anthos 的支持，客户将能够：

* 受益于全托管服务例如 GKE 以及思科的超融合基础设施、网络和安全技术；
* 在企业数据中心和云中一致运行
* 在企业数据中心使用云服务
* 用最新的云技术更新本地基础设施

思科和谷歌从 2017 年 10 月就在紧密合作，当时他们表示正在开发一个能够连接本地基础设施和云环境的开放混合云平台。该套件，即[思科为谷歌云打造的混合云平台][11]，大致在 2018 年 9 月上市。它使得客户们能通过谷歌云托管 Kubernetes 容器开发企业级功能，包含思科网络和安全技术以及来自 Istio 的服务网格监控。

谷歌说开源的 Istio 的容器和微服务优化技术给开发者提供了一种一致的方式，通过服务级的 mTLS （双向传输层安全）身份验证访问控制来跨云连接、保护、管理和监听微服务。因此，客户能够轻松实施新的可移植的服务，并集中配置和管理这些服务。

思科不是唯一宣布对 Anthos 支持的供应商。谷歌表示，至少 30 家大型合作商包括 [VMware][12]、[Dell EMC][13]、[HPE][14]、Intel 和联想致力于为他们的客户在它们自己的超融合基础设施上提供 Anthos 服务。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3388218/cisco-google-reenergize-multicloudhybrid-cloud-joint-development.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

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

