[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12018-1.html)
[#]: subject: (Amazon Has Launched Its Own Linux Distribution But It’s Not for Everyone)
[#]: via: (https://itsfoss.com/bottlerocket-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Amazon 推出了自己的容器专用 Linux 发行版“瓶装火箭”
======

![](https://img.linux.net.cn/data/attachment/album/202003/21/074953h0a55lq72h0qlpzd.jpg)

Amazon 已经[推出][1]了自己的基于 Linux 的开源操作系统 Bottlerocket（“瓶装火箭”）。但在你兴奋地想要尝试安装和运行它之前，我必须告诉你，它不是常规的如 Ubuntu、Fedora 或 Debian 这样的 Linux 发行版。那它是什么？

### Bottlerocket：来自 Amazon 的 Linux 发行版，用于运行容器

![][2]

如果你不了解 Linux 容器，建议你阅读 Red Hat 的[这篇文章][3]。

自从首次提出云计算一词以来，IT 行业发生了许多变化。得益于 Amazon AWS、Google、Linode、Digital Ocean 等云服务器提供商，部署 Linux 服务器（通常在虚拟机中运行）只需几秒钟。最重要的是，你可以借助 Docker 和 Kubernetes 之类的工具在这些服务器上以容器形式部署应用和服务。

问题是，当你唯一目的是在 Linux 系统上运行容器时，并不总是需要完整的 Linux 发行版。这就是为什么容器专用 Linux 仅提供必要软件包的原因。这将大大减少操作系统的大小，从而进一步减少部署时间。

[Bottlerocket][5] Linux 由 Amazon Web Services（AWS）专门构建，用于在虚拟机或裸机上运行容器。它支持 docker 镜像和其他遵循 [OCI 镜像][6]格式的镜像。

### Bottlerocket Linux 的特性

![][7]

这是来自 Amazon 的新 Linux 发行版提供的特性：

#### 没有逐包更新

传统的 Linux 发行版更新过程由更新单个软件包组成。Bottlerocket 改用基于镜像的更新。

由于采用了这种方法，可以避免冲突和破坏，并可以进行快速而完整的回滚（如有必要）。

#### 只读文件系统

Bottlerocket 还使用了只读主文件系统。在启动时通过 dm-verity 检查其完整性。在其他安全措施上，也不建议使用 SSH 访问，并且只能通过[管理容器][8]（附加机制）使用。

AWS 已经统治了云世界。

#### 自动更新

你可以使用 Amazon EKS 之类的编排服务来自动执行 Bottlerocket 更新。

Amazon 还声称，与通用 Linux 发行版相比，仅包含运行容器的基本软件可以减少攻击面。

### 你怎么看？

Amazon 并不是第一个创建“容器专用 Linux” 的公司。我认为 CoreOS 是最早的此类发行版之一。[CoreOS 被 Red Hat 收购][9]，Red Hat 又被 [IBM 收购][10]。Red Hat 公司最近停用了 CoreOS，并用 [Fedora CoreOS][11] 代替了它。

云服务器是一个巨大的行业，它将继续发展壮大。像 Amazon 这样的巨头将竭尽所能与它竞争对手保持一致或领先。我认为，Bottlerocket 是对 IBM Fedora CoreOS（目前）的应答。

尽管 [Bottlerocket 仓库可在 GitHub 上找到][12]，但我还没发现就绪的镜像（LCTT 译注：源代码已经提供）。在撰写本文时，它仅[可在 AWS 上预览][5]。

你对此有何看法？Amazon 会从 Bottlerocket 获得什么？如果你以前使用过 CoreOS 之类的软件，你会切换到 Bottlerocket 么？

--------------------------------------------------------------------------------

via: https://itsfoss.com/bottlerocket-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://aws.amazon.com/blogs/aws/bottlerocket-open-source-os-for-container-hosting/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/botlerocket-logo.png?ssl=1
[3]: https://www.redhat.com/en/topics/containers/whats-a-linux-container
[4]: https://www.linode.com/
[5]: https://aws.amazon.com/bottlerocket/
[6]: https://www.opencontainers.org/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/BottleRocket.png?ssl=1
[8]: https://github.com/bottlerocket-os/bottlerocket-admin-container
[9]: https://itsfoss.com/red-hat-acquires-coreos/
[10]: https://itsfoss.com/ibm-red-hat-acquisition/
[11]: https://getfedora.org/en/coreos/
[12]: https://github.com/bottlerocket-os/bottlerocket
