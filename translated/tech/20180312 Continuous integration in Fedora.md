在 Fedora 中持续集成
======

![](https://fedoramagazine.org/wp-content/uploads/2017/07/ci-mar2018-945x400.jpg)
持续集成 （CI） 是为项目的每一项变更运行测试的过程，如同这是新的交付项目一样。如果持续执行，这意味着软件随时可以发布。 CI 是整个 IT 行业以及免费和开源项目非常成熟的流程。Fedora 在这方面有点落后，但我们正在赶上。阅读以下内容了解进展。

### 我们为什么需要这个？

CI 将全面改善 Fedora。它通过尽早揭示 bug 提供更稳定和一致的操作系统。它让你在遇到问题时添加测试，以免再次发生（避免回归）。CI 可以运行来自上游的项目测试，还有测试集成在发行版中 Fedora 特定的测试。

最重要的是，一致的 CI 能自动化并减少手工劳动。它释放了我们宝贵的志愿者和贡献者，让他们将更多时间花在 Fedora 的新事物上。

### 它看起来如何？

对于初学者，我们将对在 Fedora 包 （dist-git） 仓库的每个提交运行测试。这些测试独立于构建时运行的每个软件包的测试。但是，他们在尽可能接近 Fedora 用户运行环境的环境中测试软件包的功能。除了特定的软件包测试外，Fedora 还运行一些发行测试，例如从 F27 升级到 F28 或者全新安装。

软件包根据测试结果进行“控制”：测试失败会阻止将更新推送给用户。但是，有时由于各种原因，测试会失败。也许测试本身是错误的，或者不是最新的软件。或者可能发生基础架构问题，并阻止测试正常运行。维护人员能够重新触发测试或放弃测试结果，直到测试更新。

最终，当在 <https://src.fedoraproject.org> 上有合并请求或者更新时，Fedora 的 CI 将运行测试。这将使维护者了解建议的更改对包稳定性的影响，并帮助他们决定如何进行。

### 我们如今有什么？

目前，CI 管道在 Fedora Atomic Host 一部分软件包上运行测试。其他软件包可以在 dist-git 中进行测试，但它们不会自动运行。分发特定的测试已经在我们所有的软件包上运行。这些测试结果被用于过滤测试失败的软件包。

### 我该如何参与？

最好的入门方法是阅读关于[ Fedora 持续集成][1]的文档。你应该熟悉[标准测试接口][2]，它描述了很多术语以及如何编写测试和使用现有的测试。

有了这些知识，如果你是一个软件包维护者，你可以开始添加测试到你的软件包。你可以在本地或虚拟机上运行它们。 （后者对于破坏性测试是明治的！）

标准测试接口使测试保持一致。因此，你可以轻松地将任何测试添加到你喜欢的包中，并在 [仓库]​​[3] 提交合并请求给维护人员。

Reach out on #fedora-ci on irc.freenode.net with feedback, questions or for a general discussion on CI.
在 irc.freenode.net 上与 #fedora-ci 联系，提供反馈，问题或关于 CI 的一般性讨论。

[Samuel Zeller][4] 在  [Unsplash][5] 上提供的照片

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/continuous-integration-fedora/

作者：[Pierre-Yves Chibon;Dominik Perpeet][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:http://fedoraproject.org/wiki/CI
[2]:http://fedoraproject.org/wiki/CI/Standard_Test_Interface
[3]:https://src.fedoraproject.org
[4]:https://unsplash.com/photos/77oXlGwwOw0?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[5]:https://unsplash.com/search/photos/factory-line?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
