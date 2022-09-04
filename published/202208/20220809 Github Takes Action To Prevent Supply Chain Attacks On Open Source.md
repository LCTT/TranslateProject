[#]: subject: "Github Takes Action To Prevent Supply Chain Attacks On Open Source"
[#]: via: "https://www.opensourceforu.com/2022/08/github-takes-action-to-prevent-supply-chain-attacks-on-open-source/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "lzx916"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14949-1.html"

为防止对开源供应链的攻击，GitHub 在行动
======

![](https://www.opensourceforu.com/wp-content/uploads/2022/08/github-cover-1-1068x601.jpg)

在 2020 年 SolarWinds 网络间谍活动之后，一系列进一步的软件供应链漏洞凸显了确保软件监管链安全的必要性。在这场间谍活动中，俄罗斯黑客渗透到一个广泛使用的 IT 管理平台，并将受污染的升级程序悄悄带入其中。由于开源项目从根本上来说是分散的，而且经常是临时的活动，因此在这种背景下，这个问题尤其紧迫。GitHub 著名的 npm 注册中心广泛使用的 JavaScript 软件包遭到一系列令人不安的黑客攻击后，该公司前不久公布了一项战略，以提供更好的开源安全保护。

代码签名平台 Sigstore 将由微软旗下的 GitHub 支持，以用于 npm 软件包。代码签名类似于数字蜡封。为了让开源维护者更加容易地确认他们编写的代码是否与全球范围内人们实际下载的软件包中最终包含的代码相同，跨行业协作促成了该工具的创建。

GitHub 并不是开源生态系统的唯一组成部分，但 Sigstore 的联合开发者、Chainguard 的首席执行官 Dan Lorenc 指出，它是社区的一个重要枢纽，因为绝大多数项目都在这里存储和共享源代码。然而，当开发人员真正想下载开源软件或工具时，他们通常会通过软件包管理进行。

通过让包管理器可以使用 Sigstore，开发人员可以在 Sigstore 工具的帮助下，在软件通过供应链时处理加密检查和要求。这增加了产品流通过程中每个阶段的透明度。Lorenc 说，许多人在得知这些完整性检查尚未实施时感到震惊，开源生态系统中相当大的一部分长期以来一直依赖于盲目的信心。拜登政府于 2021 年 5 月发布了一项行政命令，主要涉及软件供应链安全问题。

Linux 基金会、谷歌、红帽、Purdue Universit 和 Chainguard 都对 Sigstore 的开发做出了贡献。现在有了使用 Sigstore 为 Python 包发行版签名的官方软件，而且开发软件的开源环境 Kubernetes 现在也支持它。

Sigstore 依靠免费和简单易用来鼓励采用，就像主要行业推动 HTTPS 网络加密一样，这在很大程度上是由非营利组织<ruby>互联网安全研究组<rt>Internet Security Research Group</rt></ruby>的 Let's Encrypt 等工具实现的。据 GitHub 称，该项目会首先提出 Sigstore 将如何在 npm 中实现的建议，并在开放评论期征求社区人员对该工具的精确部署策略的意见。然而，最终的目标是让这样的代码签名能够被尽可能多的开源项目使用，从而让对供应链的攻击更加困难。

GitHub 的 Hutchings 说：“我们希望看到这样一个世界，最终所有的软件工件都被签名并链接回源代码，这就是为什么构建像 Sigstore 这样的开放技术栈是如此重要，其他打包存储库也可以采用这种技术。”

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/08/github-takes-action-to-prevent-supply-chain-attacks-on-open-source/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[lzx916](https://github.com/lzx916)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
