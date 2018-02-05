微软正在成为一个 Linux 供应商
=====================================

> 微软通过将 Linux 融入自己的产品中来弥合与 Linux 的裂隙。

![](http://images.techhive.com/images/article/2017/05/microsoft-100722875-large.jpg)

Linux 以及开源技术在数据中心、云以及 IoT 中变得如此主流，以至于微软无法忽视他们。

在微软自己的云中，三分之一的机器运行着 Linux。这些是运行 Linux 的微软客户。微软需要支持他们使用的平台，否则他们将到别处去了。

以下就是微软如何将 Linux 战略落实到它的开发者平台 （Windows 10）、云 （Azure） 以及数据中心 （Windows Server） 上的。

**Windows 中的 Linux：** IT 专家管理公共或者私有 Linux 机器需要原生的 UNIX 工具。Linux 以及 macOS 是仅有的二个提供原生能力的平台。这也难怪你在各种会议如 DockerCon、OpenStack Summit 或者 CoreOS Fest 看到的都是 MacBook 或者少量的 Linux 桌面。

为了弥补这之间的裂隙，微软与 Canonical 协作在 Windows 内部构建了一个 Linux 子系统，它提供了原生的 Linux 工具。这是一个很棒的妥协，这样 IT 专家可以在继续使用 Windows 10 桌面的同时能够使用大多数 Linux 工具来管理他们的 Linux 机器。

**Azure 中的 Linux：** 不能完整支持 Linux 的云有什么好的呢？微软一直以来与 Linux 供应商合作来使客户能够在 Azure 中运行 Linux 程序以及任务。

微软不仅与三家主要的 Linux 供应商 Red Hat、SUSE 和 Canonical 签署了协议，还与无数的其他公司合作，为 Debian 这样的基于社区的发行版提供了支持。

**Windows Server 中的 Linux：** 这是剩下的最后一块拼图。客户使用的 Linux 容器是一个巨大的生态系统。Docker Hub 上有超过 90 万个 Docker 容器，它们只能在 Linux 机器上运行。微软希望把这些容器带到自己的平台上。

在 DockerCon 中，微软宣布在 Windows Server 中支持 Linux 容器，将这些容器都带到 Windows 中。

事情正变得更加有趣，在 Windows 10 上的 Bash on Ubuntu 成功之后，微软正将 Ubuntu bash 带到 Windows Server 中。是的，你听的没错。Windows Server 也将会有一个 Linux 子系统。

微软的高级项目经理 Rich Turne 告诉我：“服务器上的 WSL 为管理员提供了偏好的 *NIX 管理脚本和工具，以便让他们可以在更熟悉的工作环境工作。”

微软在一个通告中称它将允许 IT 专家 “可以在 Windows Server 容器主机上使用在 Linux 容器上所用的相同的脚本、工具、流程和容器镜像。这些容器使用我们的 Hyper-V 隔离技术结合你选择的 Linux 内核来托管负载，而主机上的管理脚本以及工具使用 WSL。”

在覆盖了上面三个情况后，微软已经成功地创建了一个客户不必选择任何 Linux 供应商的环境。

### 它对微软意味着什么？

通过将 Linux 融入它自己的产品，微软已经成为了一个 Linux 供应商。它是 Linux 基金会的一份子，它是众多 Linux 贡献者之一，并且它现在在自己的商店中分发 Linux。

只有一个小问题。微软没有拥有任何 Linux 技术。它完全依赖于外部的厂家，目前 Canonical 为其提供了完全的 Linux 层。如果 Canonical 被强力的竞争对手收购，那会是一个很大的风险。

或许对微软而言尝试收购 Canonical 是有意义的，并且会将核心技术收入囊中。这是有道理的。

### 这对 Linux 供应商意味着什么

表面上，很显然这对微软是个胜利，因为它的客户可以留存在 Windows 世界中。它还将包含 Linux 在数据中心中的发展势头。它或许还会影响 Linux 桌面，由于现在 IT 专家不必为了寻找 *NIX 工具使用 Linux 桌面了，它们可以在 Windows 中做任何事。

微软的成功是传统 Linux 厂家的失败么？某种程度上来说，是的，微软已经成为了一个直接竞争者。但是这里明显的赢家是 Linux。

--------------------------------------------------------------------------------

via: http://www.cio.com/article/3197016/linux/how-microsoft-is-becoming-a-linux-vendor.html

作者：[Swapnil Bhartiya][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.cio.com/author/Swapnil-Bhartiya/
