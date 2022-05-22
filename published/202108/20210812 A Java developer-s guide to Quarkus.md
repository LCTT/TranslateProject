[#]: subject: "A Java developer's guide to Quarkus"
[#]: via: "https://opensource.com/article/21/8/java-quarkus-ebook"
[#]: author: "Daniel Oh https://opensource.com/users/daniel-oh"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13690-1.html"

下载《Quarkus 的 Java 开发者指南》电子书
======

> 一本新的展示了开发者如何继续使用 Java 框架来构建新的无服务器功能的电子书。

![](https://img.linux.net.cn/data/attachment/album/202108/17/100432yslvlw6s2d462w41.jpg)

[无服务器][2] 架构已经成为一种高效的解决方案，无论是物理服务器、虚拟机还是云环境，都可以根据实际工作负载调整超额配置和不足配置资源（如 CPU、内存、磁盘、网络）。然而，在选择新的编程语言来开发无服务器应用时，Java 开发者有一个担忧。对于云上的无服务器部署，尤其是 [Kubernetes][3]，Java 框架似乎过于沉重和缓慢。

作为 Java 开发者，如果可以继续使用 Java 框架来构建传统的云原生微服务以及同时构建新的无服务器功能呢？这种方法应该是令人兴奋的，因为你不必担心新的无服务器应用框架的学习曲线会很陡峭。

此外，如果 Java 框架不仅可以为开发者提供熟悉技术的乐趣，还可以在启动时以毫秒为单位优化 Kubernetes 中的 Java 无服务器功能，并提供微小的内存足迹，又会怎样？

### 什么是 Quarkus？

[Quarkus][4] 是一个新的 Java 框架，可以为 Java 开发者、企业架构师和 DevOps 工程师提供这些功能和好处。它旨在设计无服务器应用，并编写云原生微服务，以便在云基础设施（例如 Kubernetes）上运行。

Quarkus 还支持一个名为 [Funqy][5] 的可移植 Java API 扩展，供开发者编写和部署无服务器功能到异构无服务器运行时。

Quarkus Funqy 使开发者能够将 [CloudEvents][6] 与 Knative 环境中的无服务器函数绑定，以处理反应式流。这有利于开发者建立一个通用的消息传递格式来描述事件，提高多云和混合云平台之间的互操作性。

在我的新电子书 《[Java 无服务器功能指南][7]》的帮助下，开始你的 Quarkus 之旅。与他人分享你的 Quarkus 经验，让大家都能享受到用 Java 和 Quarkus 进行的无服务器开发。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/java-quarkus-ebook

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://opensource.com/article/21/1/devapps-strategies
[3]: https://opensource.com/article/19/6/reasons-kubernetes
[4]: https://quarkus.io/
[5]: https://quarkus.io/guides/funqy
[6]: https://cloudevents.io/
[7]: https://opensource.com/downloads/java-serverless-ebook
