[#]: collector: "lujun9972"
[#]: translator: "messon007"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12015-1.html"
[#]: subject: "Containers vs. VMs, Istio in production, and more industry news"
[#]: via: "https://opensource.com/article/20/3/survey-istio-industry-news"
[#]: author: "Tim Hildred https://opensource.com/users/thildred"

每周开源点评：容器 vs 虚拟机、生产环境中的 Istio 等
======

> 本文是最近一周开源社区的新闻和行业进展。

![Person standing in front of a giant computer screen with numbers, data][1]

我在一家采用开源软件开发模型的企业软件公司任高级产品营销经理，我的一部分职责是为产品营销人员，经理和其他相关人定期发布有关开源社区，市场和业界发展趋势的更新。以下是该更新中我和他们最喜欢的五篇文章。

### 云原生应用采用的技术：容器等

- [文章链接][2]

> * 在生产环境中采用容器的比例从 2018 年的 73% 上升到 2019 年的 84%。其中，运行了至少 250 个容器的比例从 2018 年的 46% 上升到 2019 年的 58%。2017 到 2019 年间, 环境中拥有 50 台以上计算机（物理或虚拟）的受访者人数从 2017 年的 77％ 上升到 2019 年的 81％。
> * 表明: 容器的引入似乎缓解了需要管理的 VM 的快速增长。但是，请警惕要管理的原始机器数量会减少的说法。
>   

**分析**：从直觉上看，随着容器使用的增长，虚拟机的增长将放缓；有许多容器被部署在虚拟机内部，从而充分利用了两者的优势特性，而且许多应用不会很快被容器化（留意下你所在企业的传统单体式应用）。

### 在生产环境中运行Istio的经验

- [文章链接][3]

> 在 HelloFresh，我们将团队分为小队和团伙。每个团伙都有自己的 Kubernetes 命名空间。如上所述，我们先按命名空间启用 sidecar 注入，然后再逐个对应用启用。在将应用添加到 Istio 之前，我们举办了研讨会，以使小队了解其应用发生的变化。由于我们采用“您构建，您维护”的模型，团队可以在故障定位时了解应用的进出流量。不仅如此，它还提升了公司内部的知识量。我们还创建了 Istio 相关的 [OKR][4] ，来跟踪我们的进度并达成我们引入Istio的目的。

**分析**：引入或是不引入技术，要由自己决定，同时要自行承担相应的后果。

### Aether: 首个开源的边缘云平台

- [文章链接][5]

> ONF 的营销副主席 Sloane 这样解释 Aether: 它将多个正在自己的沙箱中开发和运行的项目聚集到一起，ONF 试图在该框架下将多种边缘服务在一个融合平台上支持起来。ONF 的各个项目将保持独立并可继续单独使用，但是 Aether 试图将多个能力绑定到一起来简化企业的私有边缘云运营。
>
> 他说：“我们认为我们正在创造一个新的合作空间，工业界和社区可以携手帮助推动通用平台背后的整合和关键工作，然后可以帮助这些边缘云中的通用功能不断发展”。

**分析**：当今，使用技术解决的问题过于复杂，无法通过单一技术解决。比技术更重要的是要解决的业务问题需要聚焦于真正增值的部分。将两者结合起来，就是企业之间需要在他们共同的需求上找到合作的方法，并在它们特有的方面进行竞争。除了开源，你找不到比这更好的方法了。

### 与云相关职业的女性正在改变现状

- [文章链接][6]

> Yordanova 说:“由于云是一种相对较新的技术，我的[成为一名“科技女性”][7]的经验可能并不典型，因为云行业极为多样化”。“实际上，我的团队中性别比例相当，成员由随着云技术而成长的不同个性、文化和优势的具体人员组成。“

**分析**：我想考虑的一件事就是跨越式的演进思路。你可能可以跳过演进过程中的某个步骤或阶段，因为原先导致其存在的条件已不再适用。云技术时代没有形成“谁发明的以及它是为谁而生”的固有说法，所以也许它所承载的某些前代的技术负担更少？

### StarlingX 如何在中国开源项目的星空中闪耀

- [文章链接][8]

> 我们的团队在中国，因此我们的任务之一是帮助中国的社区开发软件、贡献代码、文档等。大多数 StarlingX 项目会议是在中国的深夜举行，因此华人社区成员的出席和参与颇具挑战。为了克服这些障碍，我们与中国的其他社区成员（例如 99cloud 的朋友）一起采取了一些措施，例如和其他社区成员一起聚会，一起参加动手实践研讨会和中文的特设技术会议，将一些文档翻译成中文，并在微信小组中不断进行互动（就像每个人都可以享受的 24/7 通话服务一样）

**分析**：随着中国对开源项目的贡献不断增长，这种情况似乎有可能逆转或至少相当。“学习英语”根本不是参与开源项目开发的先决条件。

希望你喜欢这个列表，下周再见。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/survey-istio-industry-news

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[messon007](https://github.com/messon007)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr "Person standing in front of a giant computer screen with numbers, data"
[2]: https://thenewstack.io/cncf-survey-snapshot-tech-adoption-in-the-cloud-native-world/
[3]: https://engineering.hellofresh.com/everything-we-learned-running-istio-in-production-part-1-51efec69df65
[4]: https://en.wikipedia.org/wiki/OKR
[5]: https://www.sdxcentral.com/articles/news/onf-projects-coalesce-for-enterprise-edge-cloud/2020/03/
[6]: https://www.cloudpro.co.uk/leadership/cloud-essentials/8446/how-women-in-cloud-are-challenging-the-narrative
[7]: https://www.itpro.co.uk/business-strategy/33301/diversity-not-a-company-priority-claim-nearly-half-of-women-in-tech
[8]: https://superuser.openstack.org/articles/starlingx-community-interview-how-starlingx-shines-in-the-starry-sky-of-open-source-projects-in-china/
