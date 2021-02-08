[#]: collector: (lujun9972)
[#]: translator: (AnyISalIn)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13063-1.html)
[#]: subject: (How to implement a DevOps toolchain)
[#]: via: (https://opensource.com/article/21/1/devops-tool-chain)
[#]: author: (Tereza Denkova https://opensource.com/users/tereza-denkova)

如何实现 DevOps 工具链
======

> 一套完整启用的 DevOps 工具链可推动你的创新计划，实现快速部署并节约成本。

![](https://img.linux.net.cn/data/attachment/album/202101/29/153905o35h8u9zy5k58bll.jpg)

不同规模和不同行业组织都致力于为提高软件交付的速度和质量提供解决方案。这不仅保证了他们的生存，还令他们在全球市场取得了成功。DevOps 可以帮助他们规划出一条最佳路线。

DevOps 是一个系统，通过引入不同的工具链连接不同工作流程，以便及时交付项目并降低所需的开销。

在我工作的 IT 服务公司 [Accedia][2]，我们会帮助客户落地一套完整的 DevOps 工具链，这套工具链能帮助他们达到甚至超越他们的业务目标。在这篇文章，我会分享目前为止从 DevOps 项目中汲取的经验。

### DevOps 工具链是什么？

一套完善的 DevOps 工具链可以在不同阶段中使用不同的 DevOps 工具来解决特定的业务带来的挑战。一条工具链能保证前端和后端开发者、质量测试人员、客户都能够从中获得收益。构建工具链的目的是为了自动化开发和部署过程，以确保快速、可靠、预算友好地交付与创新。

我们发现成功构建一套 DevOps 工具链不是一个简单的事情。它需要实验和不断的完善，保证必要的流程是完全自动化的。

### 为什么你需要 DevOps 工具链

DevOps 工具链自动化了工作流中的所有技术元素。它能让不同团队在一个平台上进行工作，因此可以使你专注于业务战略以推动组织走向未来。

我们总结了五个实现 DevOps 工具链所带来的好处。你可以让管理层相信，是值得为 DevOps 工具链的开发投入资源和时间的。

  1. **更快、更高效的生产部署**：DevOps 工具自动化了大部分软件开发进程。这会使产品开发专注于创新，交付更加敏捷，更领先于竞争对手。
  2. **预算和时间优化**：将手动的任务转变为自动化会使你的组织节省时间和资源。当没有人为的错误和时间管理不足带来的额外支出，预算自然会得到优化。
  3. **高效的开发**：DevOps 工具链会减少开发工作中不必要的延时，提高开发效率。前端、后端、质量测试人员的工作是一致的，所以没有人需要协调不同团队之间人员的交付。
  4. **更快的部署意味着更高的质量**：DevOps 工具链保证了缺陷能够很快被解决，并且迅速完成高质量的部署进程。怎么样？它可以生成有针对性的告警，并将重要的事件通知给你的团队。这会让你主动地发现并解决潜在的问题，从而规避故障的不断的升级从而导致的客户服务不可用。
  5. **及时事件管理**：DevOps 工具链有助于优化事件管理记录。它能够识别 IT 事件并且逐渐升级事件级别，通知给指定团队的成员，直到问题被解决。这意味着消息的接受和处理会更加的迅速，因为它们发送给了正确的目标。

### DevOps 工具链的实践

对我的团队来说，DevOps 并不新鲜。我们已经敏捷开发很长时间了，并且我们总是热衷于探索最优的工作流。在我们的实践中，往往都是应用复杂性增加从而带来了自动化的需求。

这是我们为一个客户配置的工具链。这个项目包含了移动运营方案，连接了金融交易的所有参与者 （卖方、买方、银行）。这个客户需要动态响应用户反馈并且将故障时间缩短到最小，从而来提高用户体验。我的团队设计了一套工具链用于自动化应用的维护和部署新功能。

![Accedia's DevOps toolchain][3]

*(Accedia, [CC BY-NC-SA 4.0][4])*

  1. 首先，我们团队编写了自动化测试，可以立即识别应用程序的变更。
  2. 当新版本已经准备就绪的时候，代码将被提交到 Gitlab 中。
  3. 通过 Gitlab，提交会自动触发 Jenkins 构建。
  4. 在 **持续集成中**，新的代码版本通过 [Chai][5] 和 [Mocha][6] 进行了测试，以检测是否运行正常。
  5. 当测试通过，**持续部署阶段** 将会开始并创建一个可用的 Docker 镜像并上传到 Sonatype 的 [Nexus][7]。（这是 Sonatype 公司的的一个开源工具）
  6. 最后，新版本应用会通过 Nexus 下载并且部署到线上环境中，例如 [Docker][8] 容器 （**持续部署阶段**）

简而言之，每当有人在仓库中创建一个新的提交，又或者团队上传新的代码版本、功能、升级、缺陷修复等，应用程序包都会自动更新并且交付给客户。

这套系统拥有良好的事故控制能力以保证快速部署，但不以牺牲质量为代价。它对于用户的反馈是动态的，意味着新功能和旧功能的和更新只需要之前一半的时间，同时将故障时间降低到最低。

### 把它封装起来

一套完整并且正确实施的 DevOps 工具链可以从始至终推动你的创新计划并且加速部署。

根据你的需求，你的工具链可能看起来和这些不一样，但是我希望我们的工作流能够让你了解如何将自动化作为一种解决方案。

-------------------------------------------------- -----------------------------

via: https://opensource.com/article/21/1/devops-tool-chain

作者：[Tereza Denkova][a]
选题：[lujun9972][b]
译者：[AnyISalIn](https://github.com/AnyISalIn)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tereza-denkova
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_osyearbook2016_sysadmin_cc.png?itok=Y1AHCKI4 (Wratchet set tools)
[2]: https://accedia.com/services/operations/devops/
[3]: https://opensource.com/sites/default/files/uploads/devopstoolchain.png (Accedia's DevOps toolchain)
[4]: https://creativecommons.org/licenses/by-nc-sa/4.0/
[5]: https://www.chaijs.com/
[6]: https://mochajs.org/
[7]: https://www.sonatype.com/nexus/repository-oss
[8]: https://opensource.com/resources/what-docker
[9]: https://accedia.com/blog/5-good-reasons-why-you-need-a-devops-toolchain/
