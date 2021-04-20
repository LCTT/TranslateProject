[#]: subject: (3 new Java tools to try in 2021)
[#]: via: (https://opensource.com/article/21/3/enterprise-java-tools)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13249-1.html)

2021 年要尝试的 3 个新的 Java 工具
======

> 通过这三个工具和框架，为你的企业级 Java 应用和你的职业生涯提供助力。

![](https://img.linux.net.cn/data/attachment/album/202103/29/212649w9j5e05b0ppi9bew.jpg)

尽管在 Kubernetes 上广泛使用 [Python][2]、[Go][3] 和 [Node.js][4] 实现 [人工智能][5] 和机器学习应用以及 [无服务函数][6]，但 Java 技术仍然在开发企业应用中发挥着关键作用。根据 [开发者经济学][7] 的数据，在 2020 年第三季度，全球有 800 万名企业 Java 开发者。

虽然这门语言已经存在了超过 25 年，但 Java 世界中总是有新的趋势、工具和框架，可以为你的应用和你的职业生涯赋能。

绝大多数 Java 框架都是为具有动态行为的长时间运行的进程而设计的，这些动态行为用于运行可变的应用服务器，例如物理服务器和虚拟机。自从 Kubernetes 容器在 2014 年发布以来，情况已经发生了变化。在 Kubernetes 上使用 Java 应用的最大问题是通过减少内存占用、加快启动和响应时间以及减少文件大小来优化应用性能。

### 3 个值得考虑的新 Java 框架和工具

Java 开发人员也一直在寻找更简便的方法，将闪亮的新开源工具和项目集成到他们的 Java 应用和日常工作中。这极大地提高了开发效率，并激励更多的企业和个人开发者继续使用 Java 栈。

当试图满足上述企业 Java 生态系统的期望时，这三个新的 Java 框架和工具值得你关注。

#### 1、Quarkus

[Quarkus][8] 旨在以惊人的快速启动时间、超低的常驻内存集（RSS）和高密度内存利用率，在 Kubernetes 等容器编排平台中开发云原生的微服务和无服务。根据 JRebel 的 [第九届全球 Java 开发者生产力年度报告][9]，Java 开发者对 Quarkus 的使用率从不到 1% 上升到 6%，[Micronaut][10] 和 [Vert.x][11] 均从去年的 1% 左右分别增长到 4% 和 2%。

#### 2、Eclipse JKube

[Eclipse JKube][12] 使 Java 开发者能够使用 [Docker][13]、[Jib][14] 或 [Source-To-Image][15] 构建策略，基于云原生 Java 应用构建容器镜像。它还能在编译时生成 Kubernetes 和 OpenShift 清单，并改善开发人员对调试、观察和日志工具的体验。

#### 3、MicroProfile

[MicroProfile][16] 解决了与优化企业 Java 的微服务架构有关的最大问题，而无需采用新的框架或重构整个应用。此外，MicroProfile [规范][17]（即 Health、Open Tracing、Open API、Fault Tolerance、Metrics、Config）继续与 [Jakarta EE][18] 的实现保持一致。

### 总结

很难说哪个 Java 框架或工具是企业 Java 开发人员实现的最佳选择。只要 Java 栈还有改进的空间，并能加速企业业务的发展，我们就可以期待新的框架、工具和平台的出现，比如上面的三个。花点时间看看它们是否能在 2021 年改善你的企业 Java 应用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/enterprise-java-tools

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://opensource.com/resources/python
[3]: https://opensource.com/article/18/11/learning-golang
[4]: https://opensource.com/article/18/7/node-js-interactive-cli
[5]: https://opensource.com/article/18/12/how-get-started-ai
[6]: https://opensource.com/article/19/4/enabling-serverless-kubernetes
[7]: https://developereconomics.com/
[8]: https://quarkus.io/
[9]: https://www.jrebel.com/resources/java-developer-productivity-report-2021
[10]: https://micronaut.io/
[11]: https://vertx.io/
[12]: https://www.eclipse.org/jkube/
[13]: https://opensource.com/resources/what-docker
[14]: https://github.com/GoogleContainerTools/jib
[15]: https://www.openshift.com/blog/create-s2i-builder-image
[16]: https://opensource.com/article/18/1/eclipse-microprofile
[17]: https://microprofile.io/
[18]: https://opensource.com/article/18/5/jakarta-ee
