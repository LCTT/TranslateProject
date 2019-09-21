持续基础设施：另一个 CI
======

> 想要提升你的 DevOps 效率吗？将基础设施当成你的 CI 流程中的重要的一环。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_darwincloud_520x292_0311LL.png?itok=74DLgd8Q)

持续交付（CD）和持续集成（CI）是 DevOps 的两个众所周知的方面。但在 CI 大肆流行的今天却忽略了另一个关键性的 "I"：<ruby>基础设施<rt>infrastructure</rt></ruby>。

曾经有一段时间 “基础设施”就意味着<ruby>无头<rt>headless</rt></ruby>的黑盒子、庞大的服务器，和高耸的机架 —— 更不用说漫长的采购流程和对盈余负载的错误估计。后来到了虚拟机时代，把基础设施处理得很好，虚拟化 —— 以前的世界从未有过这样。我们不再需要管理实体的服务器。仅仅是简单的点击，我们就可以创建和销毁、开始和停止、升级和降级我们的服务器。

有一个关于银行的流行故事：它们实现了数字化，并且引入了在线表格，用户需要手动填写表格、打印，然后邮寄回银行（LCTT 译注：我真的遇到过有人问我这样的需求怎么办）。这就是我们今天基础设施遇到的情况：使用新技术来做和以前一样的事情。

在这篇文章中，我们会看到在基础设施管理方面的进步，将基础设施视为一个版本化的组件并试着探索<ruby>不可变服务器<rt>immutable server</rt></ruby>的概念。在后面的文章中，我们将了解如何使用开源工具来实现持续的基础设施。

![continuous infrastructure pipeline][2]

*实践中的持续集成流程*

这是我们熟悉的 CI，尽早发布、经常发布的循环流程。这个流程缺少一个关键的组件：基础设施。

突击小测试：

* 你怎样创建和升级你的基础设施？
* 你怎样控制和追溯基础设施的改变？
* 你的基础设施是如何与你的业务进行匹配的？
* 你是如何确保在正确的基础设施配置上进行测试的？

要回答这些问题，就要了解<ruby>持续基础设施<rt>continuous infrastructure</rt></ruby>。把 CI 构建流程分为<ruby>代码持续集成<rt>continuous integration code</rt></ruby>（CIc）和<ruby>基础设施持续集成<rt>continuous integration infrastructure</rt></ruby>（CIi）来并行开发和构建代码和基础设施，再将两者融合到一起进行测试。把基础设施构建视为 CI 流程中的重要的一环。

![pipeline with infrastructure][4]

*包含持续基础设施的 CI 流程*

关于 CIi 定义的几个方面：

1. 代码

    通过代码来创建基础设施架构，而不是通过安装。<ruby>基础设施如代码<rt>Infrastructure as code</rt></ruby>（IaC）是使用配置脚本创建基础设施的现代最流行的方法。这些脚本遵循典型的编码和单元测试周期（请参阅下面关于 Terraform 脚本的示例）。
2. 版本

    IaC 组件在源码仓库中进行版本管理。这让基础设施的拥有了版本控制的所有好处：一致性，可追溯性，分支和标记。
3. 管理

    通过编码和版本化的基础设施管理，你可以使用你所熟悉的测试和发布流程来管理基础设施的开发。

CIi 提供了下面的这些优势：

1. <ruby>一致性<rt>Consistency</rt></ruby>

    版本化和标记化的基础设施意味着你可以清楚的知道你的系统使用了哪些组件和配置。这建立了一个非常好的 DevOps 实践，用来鉴别和管理基础设施的一致性。
2. <ruby>可重现性<rt>Reproducibility</rt></ruby>

    通过基础设施的标记和基线，重建基础设施变得非常容易。想想你是否经常听到这个：“但是它在我的机器上可以运行！”现在，你可以在本地的测试平台中快速重现类似生产环境，从而将环境像变量一样在你的调试过程中删除。
3. <ruby>可追溯性<rt>Traceability</rt></ruby>

    你是否还记得曾经有过多少次寻找到底是谁更改了文件夹权限的经历，或者是谁升级了 `ssh` 包？代码化的、版本化的，发布的基础设施消除了临时性变更，为基础设施的管理带来了可追踪性和可预测性。
4. <ruby>自动化<rt>Automation</rt></ruby>

    借助脚本化的基础架构，自动化是下一个合乎逻辑的步骤。自动化允许你按需创建基础设施，并在使用完成后销毁它，所以你可以将更多宝贵的时间和精力用在更重要的任务上。
5. <ruby>不变性<rt>Immutability</rt></ruby>

    CIi 带来了不可变基础设施等创新。你可以创建一个新的基础设施组件而不是通过升级（请参阅下面有关不可变设施的说明）。

持续基础设施是从运行基础环境到运行基础组件的进化。像处理代码一样，通过证实的 DevOps 流程来完成。对传统的 CI 的重新定义包含了缺少的那个 “i”，从而形成了连贯的 CD 。

**(CIc + CIi) = CI -> CD**

### 基础设施如代码 （IaC）

CIi 流程的一个关键推动因素是<ruby>基础设施如代码<rt>infrastructure as code</rt></ruby>（IaC）。IaC 是一种使用配置文件进行基础设施创建和升级的机制。这些配置文件像其他的代码一样进行开发，并且使用版本管理系统进行管理。这些文件遵循一般的代码开发流程：单元测试、提交、构建和发布。IaC 流程拥有版本控制带给基础设施开发的所有好处，如标记、版本一致性，和修改可追溯。

这有一个简单的 Terraform 脚本用来在 AWS 上创建一个双层基础设施的简单示例，包括虚拟私有云（VPC）、弹性负载（ELB），安全组和一个 NGINX 服务器。[Terraform][5] 是一个通过脚本创建和更改基础设施架构和开源工具。

![terraform script][7]

*Terraform 脚本创建双层架构设施的简单示例*

完整的脚本请参见 [GitHub][8]。

### 不可变基础设施

你有几个正在运行的虚拟机，需要更新安全补丁。一个常见的做法是推送一个远程脚本单独更新每个系统。

要是不更新旧系统，如何才能直接丢弃它们并部署安装了新安全补丁的新系统呢？这就是<ruby>不可变基础设施<rt>immutable infrastructure</rt></ruby>。因为之前的基础设施是版本化的、标签化的，所以安装补丁就只是更新该脚本并将其推送到发布流程而已。

现在你知道为什么要说基础设施在 CI 流程中特别重要了吗？

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/continuous-infrastructure-other-ci

作者：[Girish Managoli][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[Jamskr](https://github.com/Jamskr)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/gammay
[1]:/file/376916
[2]:https://opensource.com/sites/default/files/images/life-uploads/figure1.jpg (continuous infrastructure pipeline in use)
[3]:/file/376921
[4]:https://opensource.com/sites/default/files/images/life-uploads/figure2.jpg (CI pipeline with infrastructure)
[5]:https://github.com/hashicorp/terraform
[6]:/file/376926
[7]:https://opensource.com/sites/default/files/images/life-uploads/figure3_0.png (sample terraform script)
[8]:https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples/two-tier
