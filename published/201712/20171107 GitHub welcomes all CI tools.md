GitHub 欢迎一切 CI 工具
====================

[![GitHub and all CI tools](https://user-images.githubusercontent.com/29592817/32509084-2d52c56c-c3a1-11e7-8c49-901f0f601faf.png)][11] 

持续集成（[CI][12]）工具可以帮助你在每次提交时执行测试，并将[报告结果][13]提交到合并请求，从而帮助维持团队的质量标准。结合持续交付（[CD][14]）工具，你还可以在多种配置上测试你的代码，运行额外的性能测试，并自动执行每个步骤，[直到进入产品阶段][15]。

有几个[与 GitHub 集成][16]的 CI 和 CD 工具，其中一些可以在 [GitHub Marketplace][17] 中点击几下安装。有了这么多的选择，你可以选择最好的工具 —— 即使它不是与你的系统预集成的工具。

最适合你的工具取决于许多因素，其中包括：

*   编程语言和程序架构
*   你计划支持的操作系统和浏览器
*   你团队的经验和技能
*   扩展能力和增长计划
*   依赖系统的地理分布和使用的人
*   打包和交付目标

当然，无法为所有这些情况优化你的 CI 工具。构建它们的人需要选择哪些情况下服务更好，何时优先考虑复杂性而不是简单性。例如，如果你想测试针对一个平台的用特定语言编写的小程序，那么你就不需要那些可在数十个平台上测试，有许多编程语言和框架的，用来测试嵌入软件控制器的复杂工具。

如果你需要一些灵感来挑选最好使用哪个 CI 工具，那么看一下 [Github 上的流行项目][18]。许多人在他们的 README.md 中将他们的集成的 CI/CD 工具的状态显示为徽章。我们还分析了 GitHub 社区中超过 5000 万个仓库中 CI 工具的使用情况，并发现了很多变化。下图显示了根据我们的拉取请求中使用最多的[提交状态上下文][19]，GitHub.com 使用的前 10 个 CI 工具的相对百分比。

_我们的分析还显示，许多团队在他们的项目中使用多个 CI 工具，使他们能够发挥它们最擅长的。_

[![Top 10 CI systems used with GitHub.com based on most used commit status contexts](https://user-images.githubusercontent.com/7321362/32575895-ea563032-c49a-11e7-9581-e05ec882658b.png)][20] 

如果你想查看，下面是团队中使用最多的 10 个工具：

*   [Travis CI][1]
*   [Circle CI][2]
*   [Jenkins][3]
*   [AppVeyor][4]
*   [CodeShip][5]
*   [Drone][6]
*   [Semaphore CI][7]
*   [Buildkite][8]
*   [Wercker][9]
*   [TeamCity][10]

这只是尝试选择默认的、预先集成的工具，而没有花时间根据任务研究和选择最好的工具，但是对于你的特定情况会有很多[很好的选择][21]。如果你以后改变主意，没问题。当你为特定情况选择最佳工具时，你可以保证量身定制的性能和不再适合时互换的自由。

准备好了解 CI 工具如何适应你的工作流程了么？

- [浏览 GitHub Marketplace][22]

--------------------------------------------------------------------------------

via: https://github.com/blog/2463-github-welcomes-all-ci-tools

作者：[jonico][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/jonico
[1]:https://travis-ci.org/
[2]:https://circleci.com/
[3]:https://jenkins.io/
[4]:https://www.appveyor.com/
[5]:https://codeship.com/
[6]:http://try.drone.io/
[7]:https://semaphoreci.com/
[8]:https://buildkite.com/
[9]:http://www.wercker.com/
[10]:https://www.jetbrains.com/teamcity/
[11]:https://user-images.githubusercontent.com/29592817/32509084-2d52c56c-c3a1-11e7-8c49-901f0f601faf.png
[12]:https://en.wikipedia.org/wiki/Continuous_integration
[13]:https://github.com/blog/2051-protected-branches-and-required-status-checks
[14]:https://en.wikipedia.org/wiki/Continuous_delivery
[15]:https://developer.github.com/changes/2014-01-09-preview-the-new-deployments-api/
[16]:https://github.com/works-with/category/continuous-integration
[17]:https://github.com/marketplace/category/continuous-integration
[18]:https://github.com/explore?trending=repositories#trending
[19]:https://developer.github.com/v3/repos/statuses/
[20]:https://user-images.githubusercontent.com/7321362/32575895-ea563032-c49a-11e7-9581-e05ec882658b.png
[21]:https://github.com/works-with/category/continuous-integration
[22]:https://github.com/marketplace/category/continuous-integration
