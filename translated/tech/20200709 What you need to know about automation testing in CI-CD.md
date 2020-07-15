[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What you need to know about automation testing in CI/CD)
[#]: via: (https://opensource.com/article/20/7/automation-testing-cicd)
[#]: author: (Taz Brown https://opensource.com/users/heronthecli)

你需要了解有关 CI/CD 中的自动化测试的知识
======
持续集成和持续交付是由测试提供支持。以下是如何做的。
![Net catching 1s and 0s or data in the clouds][1]

>“如果一切似乎都在控制之中，那么你就不会足够快。” —Mario Andretti

测试自动化意味着持续专注于在软件开发过程中尽早地检测到缺陷，错误和 bug。这是使用那些追求质量为最高价值的工具完成的，它们旨在_确保_质量，而不仅仅是追求。

持续集成/持续交付（CI / CD）解决方案（也称为 DevOps 管道）最引人注目的功能之一是可以更频繁地进行测试，而又不会给开发人员或操作人员增加更多的手动工作。让我们谈谈为什么这很重要。

### 为什么要在 CI/CD 中自动化测试？

敏捷团队迭代速度更快，以更高的速度交付软件和客户满意度，而这些压力可能会损害质量。全球竞争制造了对缺陷_低容忍度_，同时对敏捷团队软件交付_更快迭代_增加了压力。减轻压力的行业解决方案是什么？ 是 [DevOps][2]。

DevOps 是一个有很多定义的大创意，但是对 DevOps 成功至关重要的一项技术是 CI/CD。通过软件开发流程设计一个连续的改进周期可以带来新的测试机会。

### 这对测试人员意味着什么？

对于测试人员，这通常意味着他们必须：

  * 更早且更频繁地进行测试（使用自动化）
  * 持续测试“真实世界”的工作流（自动和手动）



更具体地说，任何形式的测试（无论是由编写代码的开发人员运行还是由质量保证工程师团队设计）的作用是利用 CI/CD 基础架构在快速推进的同时提高质量。

### 测试人员还需要做什么？

具体点说，测试人员负责：

  * 测试新的和现有的软件应用
  * 通过根据系统要求评估软件来验证功能
  * 利用自动化测试工具来开发和维护可重复使用的自动化测试
  * 与 scrum 团队的所有成员合作，了解正在开发的功能以及实施的技术设计，以设计和开发准确、高质量的自动化测试
  * 分析记录的用户需求，并创建或协助设计针对中度到高度复杂的软件或 IT 系统的测试计划
  * 开发自动化测试，并与职能团队一起审查和评估测试方案
  * 与技术团队合作，确定在开发环境中自动化测试的正确方法
  * 与团队合作，通过自动化测试来理解和解决软件问题，并回应有关修改或增强的建议
  * 参与需求梳理，估算和其他敏捷 scrum 仪式
  * 协助定义标准和流程以支持测试活动和材料（例如脚本、配置、程序、工具、划和结果）



测试是一项艰巨的工作，但这是有效构建软件的重要组成部分。

### 哪些持续测试很重要？

你可以使用多种测试。不同的类型并不是学科之间的界限。相反，它们是表示测试的不同方式。比较测试类型不太重要，而覆盖每种测试类型更重要。

  * **功能测试：**确保软件具有其要求的功能
  * **单元测试：**独立测试软件的较小单元/组件以检查其功能
  * **负载测试：**在重负载或使用期间测试软件的性能
  * **压力测试：**确定承受压力（最大负载）时软件的断点
  * **集成测试：**测试组合或集成的一组组件的输出
  * **回归测试：**当修改任意组件（无论多么小），测试整个应用的功能



### 总结

任何包含持续测试的软件开发过程都将朝着建立关键反馈环路的方向发展，以快速发展并构建有效的软件。最重要的是，该实践将质量内置到 CI/CD 管道中，并意味着了解在软件开发生命周期中提高速度同时减少风险和浪费之间的联系。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/automation-testing-cicd

作者：[Taz Brown][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/heronthecli
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_analytics_cloud.png?itok=eE4uIoaB (Net catching 1s and 0s or data in the clouds)
[2]: https://opensource.com/resources/devops
