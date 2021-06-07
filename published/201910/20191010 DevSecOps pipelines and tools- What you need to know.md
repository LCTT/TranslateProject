[#]: collector: (lujun9972)
[#]: translator: (lnrCoder)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11492-1.html)
[#]: subject: (DevSecOps pipelines and tools: What you need to know)
[#]: via: (https://opensource.com/article/19/10/devsecops-pipeline-and-tools)
[#]: author: (Sagar Nangare https://opensource.com/users/sagarnangare)

你需要知道的 DevSecOps 流程及工具
======

> DevSecOps 对 DevOps 进行了改进，以确保安全性仍然是该过程的一个重要部分。

![](https://img.linux.net.cn/data/attachment/album/201910/23/002010fvzh282e8ghhdzpk.jpg)

到目前为止，DevOps 在 IT 世界中已广为人知，但其并非完美无缺。试想一下，你在一个项目的现代应用程序交付中实施了所有 DevOps 工程实践。你已经到达开发流程的末尾，但是渗透测试团队（内部或外部）检测到安全漏洞并提出了报告。现在，你必须重新启动所有流程，并要求开发人员修复该漏洞。

在基于 DevOps 的软件开发生命周期（SDLC）系统中，这并不繁琐，但它确实会浪费时间并影响交付进度。如果从 SDLC 初期就已经集成了安全性，那么你可能已经跟踪到了该故障，并在开发流程中就消除了它。但是，如上述情形那样，将安全性推到开发流程的最后将导致更长的开发生命周期。

这就是引入 DevSecOps 的原因，它以自动化的方式巩固了整个软件交付周期。

在现代 DevOps 方法中，组织广泛使用容器托管应用程序，我们看到 [Kubernetes][2] 和 [Istio][3] 使用的较多。但是，这些工具都有其自身的漏洞。例如，云原生计算基金会（CNCF）最近完成了一项 [kubernetes 安全审计][4]，发现了几个问题。DevOps 开发流程中使用的所有工具在流程运行时都需要进行安全检查，DevSecOps 会推动管理员去监视工具的存储库以获取升级和补丁。

### 什么是 DevSecOps?

与 DevOps 一样，DevSecOps 是开发人员和 IT 运营团队在开发和部署软件应用程序时所遵循的一种思维方式或文化。它将主动和自动化的安全审计以及渗透测试集成到敏捷应用程序开发中。

要使用 [DevSecOps][5]，你需要：

  * 从 SDLC 开始就引入安全性概念，以最大程度地减少软件代码中的漏洞。
  * 确保每个人（包括开发人员和 IT 运营团队）共同承担在其任务中遵循安全实践的责任。
  * 在 DevOps 工作流程开始时集成安全控件、工具和流程。这些将在软件交付的每个阶段启用自动安全检查。

DevOps 一直致力于在开发和发布过程中包括安全性以及质量保证（QA）、数据库管理和其他所有方面。然而，DevSecOps 是该过程的一个演进，以确保安全永远不会被遗忘，成为该过程的一个重要部分。

### 了解 DevSecOps 流程

典型的 DevOps 流程有不同的阶段；典型的 SDLC 流程包括计划、编码、构建、测试、发布和部署等阶段。在 DevSecOps 中，每个阶段都会应用特定的安全检查。

  * **计划**：执行安全性分析并创建测试计划，以确定在何处、如何以及何时进行测试的方案。
  * **编码**：部署整理工具和 Git 控件以保护密码和 API 密钥。
  * **构建**：在构建执行代码时，请结合使用静态应用程序安全测试（SAST）工具来跟踪代码中的缺陷，然后再部署到生产环境中。这些工具针对特定的编程语言。
  * **测试**：在运行时使用动态应用程序安全测试（DAST）工具来测试您的应用程序。 这些工具可以检测与用户身份验证，授权，SQL 注入以及与 API 相关的端点相关的错误。
  * **发布**：在发布应用程序之前，请使用安全分析工具来进行全面的渗透测试和漏洞扫描。
  * **部署**：在运行时完成上述测试后，将安全的版本发送到生产中以进行最终部署。

### DevSecOps 工具

SDLC 的每个阶段都有可用的工具。有些是商业产品，但大多数是开源的。在我的下一篇文章中，我将更多地讨论在流程的不同阶段使用的工具。

随着基于现代 IT 基础设施的企业安全威胁的复杂性增加，DevSecOps 将发挥更加关键的作用。然而，DevSecOps 流程将需要随着时间的推移而改进，而不是仅仅依靠同时实施所有安全更改即可。这将消除回溯或应用交付失败的可能性。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/devsecops-pipeline-and-tools

作者：[Sagar Nangare][a]
选题：[lujun9972][b]
译者：[lnrCoder](https://github.com/lnrCoder)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sagarnangare
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe (An intersection of pipes.)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://opensource.com/article/18/9/what-istio
[4]: https://www.cncf.io/blog/2019/08/06/open-sourcing-the-kubernetes-security-audit/
[5]: https://resources.whitesourcesoftware.com/blog-whitesource/devsecops
