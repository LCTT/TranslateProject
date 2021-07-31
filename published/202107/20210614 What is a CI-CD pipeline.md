[#]: subject: (What is a CI/CD pipeline?)
[#]: via: (https://opensource.com/article/21/6/what-cicd-pipeline)
[#]: author: (Will Kelly https://opensource.com/users/willkelly)
[#]: collector: (lujun9972)
[#]: translator: (baddate)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13541-1.html)

CI/CD 管道是什么？
======

> 你如何定义持续集成/持续部署管道取决于你组织的要求。

![Plumbing tubes in many directions][1]

<ruby>持续集成<rt>continuous integration</rt></ruby>/<ruby>持续部署<rt>continuous deployment</rt></ruby>（CI/CD）管道是每个 DevOps 计划的基础。 CI/CD 管道打破了传统的开发孤岛，使开发和运营团队能够在整个软件开发生命周期中进行协作。

更好的是，转向 DevOps 和 CI/CD 管道可以帮助你的组织以更高的速度更安全地 [交付软件][2]。

### 拆解 CI/CD 管道

CI/CD 管道有很多定义，所以我总是建议组织定义自己的 CI/CD 管道版本和其他 DevOps 概念，而不是使用其他人的。开源 CI/CD 工具为你提供构建满足组织要求的 CI/CD 管道的自由和选择。

形成 CI/CD 管道的阶段是将不同的任务子集分组为 _管道阶段_。典型的管道阶段包括：

  * **构建**：开发人员编译应用程序代码。
  * **测试**：质量保证（QA）团队使用自动化测试工具和策略测试应用程序代码。
  * **发布**：开发团队将应用程序代码交付到代码库。
  * **部署**：DevOps 团队将应用程序代码分阶段投入生产。
  * **安全性和合规性**：QA 团队根据项目要求验证构建。这是组织部署容器扫描工具的阶段，这些工具根据<ruby>常见漏洞和暴露<rt>Common Vulnerabilities and Exposures</rt></ruby>（CVE）检查容器镜像的质量。

这些是 CI/CD 管道的标准阶段，但一些组织调整 CI/CD 管道模型以满足他们的要求。例如，为医疗保健市场构建应用程序的组织，具有严格的合规性标准，可以在整个工具链中分发测试、验证和合规性门槛。

其他示例可能是依赖于具有开源软件（OSS）的复杂软件供应链的组织。商业组件可能会设立一个门槛，开发团队成员可以在其中为 OSS 包生成 <ruby>[软件物料清单][3]<rt>software bill of materials</rt></ruby>（SBOM），或者外部商业软件供应商必须将 SBOM 作为其合同可交付成果的一部分进行交付。

### CI/CD 管道的障碍

实施 CI/CD 管道会改变团队的流程和文化。尽管许多开发人员愿意接受某些任务和测试的自动化，但人员可能成为采用 CI/CD 的障碍。

从瀑布式流程转向 CI/CD 可能会动摇某些组织中基本的和隐含的权力结构。由于 CI/CD 管道提高了软件交付速度，旧手动流程的“守门人”可能会受到这种变化的威胁。

### 整合机会

随着你在文化、流程和工具中达到更高的 DevOps 成熟度水平，包含 CI/CD 工具链的工具的开源根源为一些激动人心的集成创造了机会。

分析公司 Forrester 在 2020 年预测，<ruby>即时学习<rt>just-in-time learning</rt></ruby>将加入 CI/CD 管道。如果你考虑一下，会发现这是有道理的。在当前远程工作的时代，甚至对于新员工的远程入职，这更有意义。例如，组织可以将文档 wiki 与内部流程文档集成到其管道中。

更雄心勃勃的组织可以将学习管理系统（LMS）（例如 [Moodle][4]）集成到其 CI/CD 管道中。它可以使用 LMS 发布有关新 DevOps 工具链功能的简短视频，开发人员在加入时或在整个管道中更新工具时需要学习这些功能。

一些组织正在将群聊和其他协作工具直接集成到他们的 CI/CD 管道中。聊天平台提供警报并支持团队之间的协作和沟通。将 Mattermost、Rocket.Chat 或其他 [企业聊天][5] 平台集成到你的 CI/CD 管道中需要预先规划和分析，以确保管道用户不会被警报淹没。

另一个需要探索的集成机会是将分析和高级报告构建到你的 CI/CD 管道中。这有助于你利用通过管道传输的数据。

### 总结

CI/CD 管道是 DevOps 的基础。开源使其能够适应并灵活地满足你在 DevOps 之旅中实施的运营变更所产生的新需求。

我希望看到对统一 DevOps 平台趋势的开源响应，在这种趋势中，组织寻求端到端的 CI/CD 解决方案。这种解决方案的要素就在那里。毕竟，GitLab 和 GitHub 将他们的平台追溯到开源根源。

最后，不要忘记每一个成功的 CI/CD 工具链背后的教育和外展。记录你的工具链和相关流程将改善开发人员入职和持续的 DevOps 团队培训。

你和你的组织如何定义你的 CI/CD 工具链？请在评论中分享你的反馈。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/what-cicd-pipeline

作者：[Will Kelly][a]
选题：[lujun9972][b]
译者：[baddate](https://github.com/baddate)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/willkelly
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/plumbing_pipes_tutorial_how_behind_scenes.png?itok=F2Z8OJV1 (Plumbing tubes in many directions)
[2]: https://techbeacon.com/devops/5-reasons-why-cicd-vital-your-organizations-value-stream
[3]: https://www.ntia.gov/SBOM
[4]: https://moodle.org/
[5]: https://opensource.com/alternatives/slack