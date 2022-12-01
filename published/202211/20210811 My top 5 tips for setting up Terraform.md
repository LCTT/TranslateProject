[#]: subject: "My top 5 tips for setting up Terraform"
[#]: via: "https://opensource.com/article/21/8/terraform-tips"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "cool-summer-021"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15206-1.html"

关于配置 Terraform 的五条建议
======

> 本文介绍我使用 Terraform 五年之后吸取到的经验。

![](https://img.linux.net.cn/data/attachment/album/202211/02/220728ngg0kzjg0rldu0l7.jpg)

使用 Terraform 五年的经历让我吸取到一些重要经验。无论团队大小、项目性质，有五条要点对于配置合乎逻辑且可用的 Terraform 平台至关重要。

### 1、了解你的目标受众

这一点似乎显而易见，但我也见过一些在这方面犯错的案例。当组织和规划 Terraform 的相关代码时，无论是将目录结构标准化还是确定命名规范，考虑目标受众是非常重要的。例如：你的团队是否会使用这些 Terraform 脚本和模块？你是否会向其他团队交接工作？你的团队是否会有新成员加入？你是否正在独自进行项目开发？你是否会半年或一年后仍然使用这些配置，还是会将它安排给别人？

这类问题会影响某些决策。理想情况下，无论如何都应该有 <ruby>[远程状态][2]<rt>Remote State</rt></ruby> 和 <ruby>[状态锁定][3]<rt>State Locking</rt></ruby> 两种状态。远程状态确保你的笔记本电脑不是你的 Terraform 唯一运行的机器，状态锁定确保同一时刻只有一个人对基础设施进行修改操作。

命名规范应该对项目的最终拥有者有意义，而不是只对开发团队有意义。如果项目会转交给其他团队，应该确保他们对命名规范有发言权。如果代码由非技术的利益相关者或内部安全/ GCR 团队负责审查，应该确保他们会检查命名规范。另外，对于资源名称，为了让代码审查人员更仔细地进行检查，你应该使用资源标签，把有关的数据分类/隐私需求（高、中、低）标示出来。

### 2、重用，重用，重用

[Terraform 注册表][4] 为大多数普通用例提供了现成模块类库。我已经使用过 VPC 模块和安全模块中的大量功能，这些功能只需要提供相关的参数就能使用。使用不同的参数，简单调用这些模块对于处理大部分用例已经足够了。尽可能多地重用这些公共模块，可以避免大量且重复的编码、测试、检查、修复、重构等操作。

我也发现，基于使用或变更的频率划分模块和资源大有好处。例如，只使用一次的基础设施手脚架，例如 VPC 相关设置、安全模块、路由表、VPC 端点等，可以放在一起。但是像私有托管域条目、自动伸缩模块、目标模块、负载均衡器等，每次部署时都会变化，所以把这些与一次性的基础设施手脚架分离开来，会令代码检查更方便，调试更快速。

### 3、要明确，而非隐含

Terraform 代码中有一些常见的模式，它会导致设计中出现错误的假设。团队可以假设用来写代码的 Terraform 版本永远保持不变，外部模块不会变化，或它们使用的提供者不会变更。当这些外部依赖不可避免地发生变化时，就会导致一些难以发现的问题。

无论何处（包括主要的 Terraform 组、提供者组、功能模块组）都要确保定义是明确的。事先定义版本，可以确保依赖库是固定的，因此你可以在讨论、审查、测试后，明明白白地更新依赖关系。

### 4、自动化每一处，包括笔记本电脑、共享虚拟机、CI/CD。

在部署的各个阶段使用自动化方法，可以避免可能发生的问题。

在你提交代码前，使用 [Git 预提交钩子][5] 运行 `terraform fmt` 和 `terraform validate`。预提交钩子的作用是确保你的代码满足最低程度的格式和语法正确。把这个预提交文件检入到仓库，对你的团队成员都有好处。项目的第一步就进行质量控制相关的操作，它虽然表面上是小事一桩，但也很重要，能为项目节省大量时间。

一切现代化部署工具都有 CI 流程。当你向原始仓库推送代码时，可以使用它来运行 SAST 和单元测试工具。我写过一篇 [博客][6]，是关于使用 Checkov 测试 Terraform 代码的安全性和合规性，并为组织特定的惯例创建自定义检查。把这些单元测试工具加入到你的 CI 管道，可以改进代码质量和健壮性。

### 5、写个好的 README.md 文件

我们都认为 Terraform 代码是自文档化的。的确如此，但是只有当未来的团队已经了解你的公司的命名规范、开发指南、机密通信、圈内笑话，以及你的仓库内除有效的 Terraform 代码之外其他所有东西，才会如此。维护 `README.md` 文件是个好习惯，它能节省大量时间，而且团队成员要为自己向 README 文件提交的任何内容负责，这样也就确保团队成员的忠诚度。

你的 README 文件至少应该包含在你的工作环境下（Linux、 Windows、Mac 等等）初始化 Terraform 环境的步骤，包括 Terraform 的版本信息。它应当确定需要的依赖库（Checkov、 TerraGrunt 及其他依赖）和其版本，以及团队使用的方便的 Linux 别名（例如有人喜欢将 `terraform fmt` 简写为 `tff`）。最重要的是，需要确定分支和 PR 审核策略和流程、命名规范和资源标签的相关标准。

README 文件需要通过这样的检验：如果团队有新成员加入，能否告诉他们做什么以及如何正确地完成工作？如果不能，在后续的几个月内，你将面对的是无休止的标准和流程讨论会议。

### 结束语

这些就是我使用 Terraform 多年后，认为需要传授给大家的五条有用的建议。也欢迎你分享自己的最佳实践。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/terraform-tips

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[cool-summer-021](https://github.com/cool-summer-021)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://www.terraform.io/docs/language/state/index.html
[3]: https://www.terraform.io/docs/language/state/locking.html
[4]: https://registry.terraform.io/
[5]: https://opensource.com/life/16/8/how-construct-your-own-git-server-part-6
[6]: https://notes.ayushsharma.in/2021/07/cloud-infrastructure-sast-terraform-checkov
