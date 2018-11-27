2018 重温 Unix 哲学
======
> 在现代微服务环境中，构建小型、单一的应用程序的旧策略又再一次流行了起来。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_data.png?itok=RH6NA32X)

1984 年，Rob Pike 和 Brian W. Kernighan 在 AT&T 贝尔实验室技术期刊上发表了名为 “[Unix 环境编程][1]” 的文章，其中他们使用  BSD 的 `cat -v` 例子来认证 Unix 哲学。简而言之，Unix 哲学是：构建小型、单一的应用程序 —— 不管用什么语言 —— 只做一件小而美的事情，用 `stdin` / `stdout` 进行通信，并通过管道进行连接。

听起来是不是有点耳熟？

是的，我也这么认为。这就是 James Lewis 和 Martin Fowler 给出的 [微服务的定义][2] 。

> 简单来说，微服务架构的风格是将单个 应用程序开发为一套小型服务的方法，每个服务都运行在它的进程中，并用轻量级机制进行通信，通常是 HTTP 资源 API 。

虽然一个 *nix 程序或者是一个微服务本身可能非常局限甚至不是很有用，但是当这些独立工作的单元组合在一起的时候就显示出了它们真正的好处和强大。

### *nix程序 vs 微服务

下面的表格对比了 *nix 环境中的程序（例如 `cat` 或 `lsof`）与微服务环境中的程序。

|               | *nix 程序                  | 微服务                   |
| ------------- | ------------------------- | ----------------------- |
| 执行单元       | 程序使用 `stdin`/`stdout`   | 使用 HTTP 或 gRPC API    |
| 数据流         | 管道                       | ？                      |
| 可配置和参数化  | 命令行参数、环境变量和配置文件  | JSON/YAML 文档          |
| 发现          | 包管理器、man、make          | DNS、环境变量、OpenAPI    |

让我们详细的看看每一行。

#### 执行单元

*nix 系统（如 Linux）中的执行单元是一个可执行的文件（二进制或者是脚本），理想情况下，它们从 `stdin` 读取输入并将输出写入 `stdout`。而微服务通过暴露一个或多个通信接口来提供服务，比如 HTTP 和 gRPC API。在这两种情况下，你都会发现无状态示例（本质上是纯函数行为）和有状态示例，除了输入之外，还有一些内部（持久）状态决定发生了什么。

#### 数据流

传统的，*nix 程序能够通过管道进行通信。换句话说，我们要感谢 [Doug McIlroy][3]，你不需要创建临时文件来传递，而可以在每个进程之间处理无穷无尽的数据流。据我所知，除了我在 [2017 年做的基于 Apache Kafka 小实验][4]，没有什么能比得上管道化的微服务了。

#### 可配置和参数化

你是如何配置程序或者服务的，无论是永久性的服务还是即时的服务？是的，在 *nix 系统上，你通常有三种方法：命令行参数、环境变量，或全面的配置文件。在微服务架构中，典型的做法是用 YAML（或者甚至是 JSON）文档，定制好一个服务的布局和配置以及依赖的组件和通信、存储和运行时配置。例如 [Kubernetes 资源定义][5]、[Nomad 工作规范][6] 或 [Docker 编排][7] 文档。这些可能参数化也可能不参数化；也就是说，除非你知道一些模板语言，像 Kubernetes 中的 [Helm][8]，否则你会发现你使用了很多 `sed -i` 这样的命令。

#### 发现

你怎么知道有哪些程序和服务可用，以及如何使用它们？在 *nix 系统中通常都有一个包管理器和一个很好用的 man 页面；使用它们，应该能够回答你所有的问题。在微服务的设置中，在寻找一个服务的时候会相对更自动化一些。除了像 [Airbnb 的 SmartStack][9] 或 [Netflix 的 Eureka][10] 等可以定制以外，通常还有基于环境变量或基于 DNS 的[方法][11]，允许您动态的发现服务。同样重要的是，事实上 [OpenAPI][12] 为 HTTP API 提供了一套标准文档和设计模式，[gRPC][13] 为一些耦合性强的高性能项目也做了同样的事情。最后非常重要的一点是，考虑到开发者经验（DX），应该从写一份好的 [Makefile][14] 开始，并以编写符合 [风格][15] 的文档结束。

### 优点和缺点

*nix 系统和微服务都提供了许多挑战和机遇。

#### 模块性

要设计一个简洁、有清晰的目的，并且能够很好地和其它模块配合的某个东西是很困难的。甚至是在不同版本中实现并引入相应的异常处理流程都很困难的。在微服务中，这意味着重试逻辑和超时机制，或者将这些功能外包到<ruby>服务网格<rt>service mesh</rt></ruby>是不是一个更好的选择呢？这确实比较难，可如果你做好了，那它的可重用性是巨大的。

#### 可观测性

在一个<ruby>独石<rt>monolith</rt></ruby>（2018 年）或是一个试图做任何事情的大型程序（1984 年），当情况恶化的时候，应当能够直接的找到问题的根源。但是在一个

```
yes | tr \\n x | head -c 450m | grep n
```

或者在一个微服务设置中请求一个路径，例如，涉及 20 个服务，你怎么弄清楚是哪个服务的问题？幸运的是，我们有很多标准，特别是 [OpenCensus][16] 和 [OpenTracing][17]。如果您希望转向微服务，可预测性仍然可能是最大的问题。

#### 全局状态

对于 *nix 程序来说可能不是一个大问题，但在微服务中，全局状态仍然是一个需要讨论的问题。也就是说，如何确保有效的管理本地化（持久性）的状态以及尽可能在少做变更的情况下使全局保持一致。

### 总结一下

最后，问题仍然是：你是否在使用合适的工具来完成特定的工作？也就是说，以同样的方式实现一个特定的 *nix 程序在某些时候或者阶段会是一个更好的选择，它是可能在你的组织或工作过程中的一个[最好的选择][18]。无论如何，我希望这篇文章可以让你看到 Unix 哲学和微服务之间许多强有力的相似之处。也许我们可以从前者那里学到一些东西使后者受益。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/revisiting-unix-philosophy-2018

作者：[Michael Hausenblas][a]
选题：[lujun9972][b]
译者：[Jamskr](https://github.com/Jamskr)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mhausenblas
[b]: https://github.com/lujun9972
[1]: http://harmful.cat-v.org/cat-v/
[2]: https://martinfowler.com/articles/microservices.html
[3]: https://en.wikipedia.org/wiki/Douglas_McIlroy
[4]: https://speakerdeck.com/mhausenblas/distributed-named-pipes-and-other-inter-services-communication
[5]: http://kubernetesbyexample.com/
[6]: https://www.nomadproject.io/docs/job-specification/index.html
[7]: https://docs.docker.com/compose/overview/
[8]: https://helm.sh/
[9]: https://github.com/airbnb/smartstack-cookbook
[10]: https://github.com/Netflix/eureka
[11]: https://kubernetes.io/docs/concepts/services-networking/service/#discovering-services
[12]: https://www.openapis.org/
[13]: https://grpc.io/
[14]: https://suva.sh/posts/well-documented-makefiles/
[15]: https://www.linux.com/news/improve-your-writing-gnu-style-checkers
[16]: https://opencensus.io/
[17]: https://opentracing.io/
[18]: https://robertnorthard.com/devops-days-well-architected-monoliths-are-okay/
