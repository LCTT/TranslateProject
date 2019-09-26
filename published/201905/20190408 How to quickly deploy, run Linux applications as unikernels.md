[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10822-1.html)
[#]: subject: (How to quickly deploy, run Linux applications as unikernels)
[#]: via: (https://www.networkworld.com/article/3387299/how-to-quickly-deploy-run-linux-applications-as-unikernels.html#tk.rss_all)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何快速部署并作为 unikernel 运行 Linux 应用
======

unikernel 是一种用于在云基础架构上部署应用程序的更小、更快、更安全的方式。使用 NanoVMs OPS，任何人都可以将 Linux 应用程序作为 unikernel 运行而无需额外编码。

![Marcho Verch \(CC BY 2.0\)][1]

随着 unikernel 的出现，构建和部署轻量级应用变得更容易、更可靠。虽然功能有限，但 unikernal 在速度和安全性方面有许多优势。

### 什么是 unikernel?

unikernel 是一种非常特殊的<ruby>单一地址空间<rt>single-address-space</rt></ruby>的机器镜像，类似于已经主导大批互联网的云应用，但它们相当小并且是单一用途的。它们很轻，只提供所需的资源。它们加载速度非常快，而且安全性更高 —— 攻击面非常有限。单个可执行文件中包含所需的所有驱动、I/O 例程和支持库。其最终生成的虚拟镜像可以无需其它部分就可以引导和运行。它们通常比容器快 10 到 20 倍。

潜在的攻击者无法进入 shell 并获得控制权，因为它没有 shell。他们无法获取系统的 `/etc/passwd`或 `/etc/shadow` 文件，因为这些文件不存在。创建一个 unikernel 就像应用将自己变成操作系统。使用 unikernel，应用和操作系统将成为一个单一的实体。你忽略了不需要的东西，从而消除了漏洞并大幅提高性能。

简而言之，unikernel：

* 提供更高的安全性（例如，shell 破解代码无用武之地）
* 比标准云应用占用更小空间
* 经过高度优化
* 启动非常快

### unikernel 有什么缺点吗？

unikernel 的唯一严重缺点是你必须构建它们。对于许多开发人员来说，这是一个巨大的进步。由于应用的底层特性，将应用简化为所需的内容然后生成紧凑、平稳运行的应用可能很复杂。在过去，你几乎必须是系统开发人员或底层程序员才能生成它们。

### 这是怎么改变的？

最近（2019 年 3 月 24 日）[NanoVMs][3] 宣布了一个将任何 Linux 应用加载为 unikernel 的工具。使用 NanoVMs OPS，任何人都可以将 Linux 应用作为 unikernel 运行而无需额外编码。该应用还可以更快、更安全地运行，并且成本和开销更低。

### 什么是 NanoVMs OPS？

NanoVMs 是给开发人员的 unikernel 工具。它能让你运行各种企业级软件，但仍然可以非常严格地控制它的运行。

使用 OPS 的其他好处包括：

* 无需经验或知识，开发人员就可以构建 unikernel。
* 该工具可在笔记本电脑上本地构建和运行 unikernel。
* 无需创建帐户，只需下载并一个命令即可执行 OPS。

NanoVMs 的介绍可以在 [Youtube 上的 NanoVMs 视频][5] 上找到。你还可以查看该公司的 [LinkedIn 页面][6]并在[此处][7]阅读有关 NanoVMs 安全性的信息。

还有有关如何[入门][8]的一些信息。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3387299/how-to-quickly-deploy-run-linux-applications-as-unikernels.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/04/corn-kernels-100792925-large.jpg
[3]: https://nanovms.com/
[5]: https://www.youtube.com/watch?v=VHWDGhuxHPM
[6]: https://www.linkedin.com/company/nanovms/
[7]: https://nanovms.com/security
[8]: https://nanovms.gitbook.io/ops/getting_started
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
