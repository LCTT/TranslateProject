[#]: subject: "Wolfi: The Linux Un(distro) Improving Cloud Software Supply Chain Turns One!"
[#]: via: "https://news.itsfoss.com/wolfi-turns-one/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16261-1.html"

Wolfi：改进云软件供应链的 Linux “非”发行版
=====

![][0]

> Wolfi，这个有趣的项目致力于增强软件供应链的安全性，现已走过一载岁月！

这里说的不是 [世界上最小的章鱼][1]，而是一款从这个小章鱼那里汲取灵感的 Linux 发行版。

Wolfi 是一个**由社区驱动、以容器为核心的 Linux 发行版**，目的在于保护软件供应链的安全性。创造者（[Chainguard][2]）将其誉为 “**非发行版**”。

Wolfi 的目标是解决构建和分发软件时经常遇到的容器问题。

下面我们一起来回顾下 Wolfi 的历程，以及未来的展望。

### Wolfi：项目的成就 🐙

自从 Wolfi [去年][5] 开始启动，它已经取得了长足的进步，例如 **在 Wolfi 的仓库中具有超过 1300 个包配置** ，并且在 Wolfi 的索引中拥有 **超过 18000 的软件包**。

**有 60 名贡献者**参与了这个项目 ，在过去的一年中， **超过 4400 个拉取请求已经成功地合并了** 到 Wolfi 在 [GitHub][6] 上的仓库中。

此外，他们还保证了 80% 的时间内， 在 GitHub 项目中的 **软件包更新间隔少于 24 小时** ，并且还添加了如 [Docker Scout][7] 、[Snyk][8] 、[Wiz][9] 等漏洞扫描工具。

由于 Wolfi 采用了 [滚动发布][10] 模式，因此它还致力于为新发现的 [CVE][11] 快速提供修复。

综上，这些成就使得他们在以下方面实现了技术创新：

  * 为所有 Wolfi 软件包构建了 64 位 ARM 版本。
  * 对 Go 和 Java 实现了全源引导。
  * 引入了 [Rustls][12] TLS 库，用于处理内存安全漏洞。
  * 分发了一个名称为 “[wolfi-act][13]” 的新项目，让 Wolfi 包能在 GitHub 操作中动态使用。

你可能会好奇：**未来的计划是什么？**

好吧，Wolfi 的开发团队希望它能发展成为一个**由社区驱动的项目**，并有望成为人们最信赖的容器化工作负载发行版。他们还期望 **广大开发者都能充分利用 Wolfi 的全部潜力，解决各种问题**。

此外，他们还分享了一个 Wolfi 的使用案例：

> 在当前应用中，Wolfi 的一个清晰的示例是 [Chainguard Images][14] —— 这正是我们开始构建该项目的原因。Chainguard Images 只是 Wolfi 实现的许多解决方案之一，我们鼓励更多的用户和社区去探寻 Wolfi 所能搭建出的可能性。

根据他们的新闻发布，他们还提到，在不久的将来 **将为 Rust 和其他语言生态系统加入全源引导**。

💬 你是否有过用 Wolfi 的经验？你对它的体验是如何的？

 

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/wolfi-turns-one/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Octopus_wolfi
[2]: https://www.chainguard.dev/
[3]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[4]: https://news.itsfoss.com/content/images/2023/09/Wolfi.png
[5]: https://news.itsfoss.com/wolfi-linux-undistro/
[6]: https://github.com/wolfi-dev
[7]: https://docs.docker.com/scout/
[8]: https://snyk.io/
[9]: https://www.wiz.io/
[10]: https://itsfoss.com/rolling-release/
[11]: https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures
[12]: https://github.com/rustls/rustls
[13]: https://github.com/wolfi-dev/wolfi-act
[14]: https://www.chainguard.dev/chainguard-images
[15]: https://news.itsfoss.com/assets/images/Certs-and-Bundles-1536x864.webp
[16]: https://itsfoss.click/latest-lf-offer
[0]: https://img.linux.net.cn/data/attachment/album/202310/07/192722wdzz199535h4c983.jpg