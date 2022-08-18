[#]: subject: "Github Takes Action To Prevent Supply Chain Attacks On Open Source"
[#]: via: "https://www.opensourceforu.com/2022/08/github-takes-action-to-prevent-supply-chain-attacks-on-open-source/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "lzx916"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

为防止对开源供应链的攻击，Github在行动
======
在2020年“SolarWinds”网络间谍活动之后，一系列进一步的软件供应链漏洞突显了确保软件监管链安全的必要性。在这场间谍活动中，俄罗斯黑客渗透到一个广泛使用的IT管理平台，并将受污染的升级产品悄悄带入其中。由于开源项目从根本上来说是分散的，而且经常是临时的活动，因此在这种背景下，这个问题尤其紧迫。GitHub著名的“npm”注册表中广泛使用的JavaScript软件包遭到一系列令人不安的黑客攻击后，该公司本周公布了一项战略，以提供更好的开源安全保护。

代码签名平台Sigstore将由微软旗下的GitHub支持，以用于npm软件包。代码签名类似于数字蜡封。为了让开源维护者更加容易地确认他们编写的代码是否与全球范围内人们实际下载的软件包中最终包含的代码相同，跨行业协作促成了该工具的创建。

GitHub并不是开源生态系统的唯一组成部分，但Sigstore的联合开发者、Chainguard的首席执行官Dan Lorenc指出，它是社区的一个重要枢纽，因为绝大多数项目都在这里存储和共享源代码。然而，当开发人员真正想下载开源软件或工具时，他们通常会访问包管理。

通过让包管理器可以使用Sigstore，开发人员可以在Sigstore工具的帮助下，在软件通过供应链时处理加密检查和要求。这增加了产品流通过程中每个阶段的透明度。Lorenc说，许多人惊讶地发现，这些完整性检查还没有实施，开源生态系统中相当大的一部分长期以来一直依赖于盲目的信心。拜登政府于2021年5月发布了一项行政命令，主要处理软件供应链安全问题。

Linux基金会、Google、Red Hat、Purdue University和Chainguard都对Sigstore的开发做出了贡献。现在有了使用Sigstore为Python包发行版签名的官方软件，而且开发软件的开源环境Kubernetes现在也支持它。

Sigstore依靠免费和简单易用来鼓励采用，就像主要行业推动HTTPS网络加密一样，这在很大程度上是由非营利互联网安全研究集团(Internet Security Research Group)的Let’s Encrypt等工具实现的。据Github称，该项目会首先提出Sigstore将如何在npm中实现的建议，并在开放评论期征求社区人员对该工具的精确部署策略的意见。然而，最终的目标是让这样的代码签名能够被尽可能多的开源项目使用，从而实现对供应链的攻击。

GitHub的Hutchings说：“我们希望看到这样一个世界，最终所有的软件工件都被签名并链接回源代码，这就是为什么构建像Sigstore这样的开放技术栈是如此重要，其他打包存储库也可以采用这种技术。”

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/08/github-takes-action-to-prevent-supply-chain-attacks-on-open-source/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[lzx916](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
