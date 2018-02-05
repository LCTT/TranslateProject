CRI-O 1.0 简介
=====

去年，Kubernetes 项目推出了<ruby>[容器运行时接口][11]<rt>Container Runtime Interface</rt></ruby>（CRI）：这是一个插件接口，它让 kubelet（用于创建 pod 和启动容器的集群节点代理）有使用不同的兼容 OCI 的容器运行时的能力，而不需要重新编译 Kubernetes。在这项工作的基础上，[CRI-O][12] 项目（[原名 OCID] [13]）准备为 Kubernetes 提供轻量级的运行时。

那么这个**真正的**是什么意思？

CRI-O 允许你直接从 Kubernetes 运行容器，而不需要任何不必要的代码或工具。只要容器符合 OCI 标准，CRI-O 就可以运行它，去除外来的工具，并让容器做其擅长的事情：加速你的新一代原生云程序。

在引入 CRI 之前，Kubernetes 通过“[一个内部的][14][易失性][15][接口][16]”与特定的容器运行时相关联。这导致了上游 Kubernetes 社区以及在编排平台之上构建解决方案的供应商的大量维护开销。

使用 CRI，Kubernetes 可以与容器运行时无关。容器运行时的提供者不需要实现 Kubernetes 已经提供的功能。这是社区的胜利，因为它让项目独立进行，同时仍然可以共同工作。

在大多数情况下，我们不认为 Kubernetes 的用户（或 Kubernetes 的发行版，如 OpenShift）真的关心容器运行时。他们希望它工作，但他们不希望考虑太多。就像你（通常）不关心机器上是否有 GNU Bash、Korn、Zsh 或其它符合 POSIX 标准 shell。你只是要一个标准的方式来运行你的脚本或程序而已。

### CRI-O：Kubernetes 的轻量级容器运行时

这就是 CRI-O 提供的。该名称来自 CRI 和开放容器计划（OCI），因为 CRI-O 严格关注兼容 OCI 的运行时和容器镜像。

现在，CRI-O 支持 runc 和 Clear Container 运行时，尽管它应该支持任何遵循 OCI 的运行时。它可以从任何容器仓库中拉取镜像，并使用<ruby>[容器网络接口][17]<rt>Container Network Interface</rt></ruby>（CNI）处理网络，以便任何兼容 CNI 的网络插件可与该项目一起使用。

当 Kubernetes 需要运行容器时，它会与 CRI-O 进行通信，CRI-O 守护程序与 runc（或另一个符合 OCI 标准的运行时）一起启动容器。当 Kubernetes 需要停止容器时，CRI-O 会来处理。这没什么令人兴奋的，它只是在幕后管理 Linux 容器，以便用户不需要担心这个关键的容器编排。

![CRI-O Overview](https://www.redhat.com/cms/managed-files/styles/max_size/s3/CRI-Ov1_Chart_1.png?itok=2FJxD8Qp "CRI-O Overview") 

### CRI-O 不是什么

值得花一点时间了解下 CRI-O _不是_什么。CRI-O 的范围是与 Kubernetes 一起工作来管理和运行 OCI 容器。这不是一个面向开发人员的工具，尽管该项目确实有一些面向用户的工具进行故障排除。

例如，构建镜像超出了 CRI-O 的范围，这些留给像 Docker 的构建命令、 [Buildah][18] 或 [OpenShift 的 Source-to-Image][19]（S2I）这样的工具。一旦构建完镜像，CRI-O 将乐意运行它，但构建镜像留给其他工具。

虽然 CRI-O 包含命令行界面 （CLI），但它主要用于测试 CRI-O，而不是真正用于在生产环境中管理容器的方法。

### 下一步

现在 CRI-O 1.0 发布了，我们希望看到它作为一个稳定功能在下一个 Kubernetes 版本中发布。1.0 版本将与 Kubernetes 1.7.x 系列一起使用，即将发布的 CRI-O 1.8-rc1 适合 Kubernetes 1.8.x。

我们邀请您加入我们，以促进开源 CRI-O 项目的开发，并感谢我们目前的贡献者为达成这一里程碑而提供的帮助。如果你想贡献或者关注开发，就去 [CRI-O 项目的 GitHub 仓库][20]，然后关注 [CRI-O 博客][21]。

--------------------------------------------------------------------------------

via: https://www.redhat.com/en/blog/introducing-cri-o-10

作者：[Joe Brockmeier][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.redhat.com/en/blog/authors/joe-brockmeier
[1]:https://www.redhat.com/en/blog/authors/joe-brockmeier
[2]:https://www.redhat.com/en/blog/authors/senior-evangelist
[3]:https://www.redhat.com/en/blog/authors/linux-containers
[4]:https://www.redhat.com/en/blog/authors/red-hat-0
[5]:https://www.redhat.com/en/blog
[6]:https://www.redhat.com/en/blog/tag/community
[7]:https://www.redhat.com/en/blog/tag/containers
[8]:https://www.redhat.com/en/blog/tag/hybrid-cloud
[9]:https://www.redhat.com/en/blog/tag/platform
[10]:mailto:?subject=Check%20out%20this%20redhat.com%20page:%20Introducing%20CRI-O%201.0&body=I%20saw%20this%20on%20redhat.com%20and%20thought%20you%20might%20be%20interested.%20%20Click%20the%20following%20link%20to%20read:%20https://www.redhat.com/en/blog/introducing-cri-o-10https://www.redhat.com/en/blog/introducing-cri-o-10
[11]:https://github.com/kubernetes/kubernetes/blob/242a97307b34076d5d8f5bbeb154fa4d97c9ef1d/docs/devel/container-runtime-interface.md
[12]:http://cri-o.io/
[13]:https://www.redhat.com/en/blog/running-production-applications-containers-introducing-ocid
[14]:http://blog.kubernetes.io/2016/12/container-runtime-interface-cri-in-kubernetes.html
[15]:http://blog.kubernetes.io/2016/12/container-runtime-interface-cri-in-kubernetes.html
[16]:http://blog.kubernetes.io/2016/12/container-runtime-interface-cri-in-kubernetes.html
[17]:https://github.com/containernetworking/cni
[18]:https://github.com/projectatomic/buildah
[19]:https://github.com/openshift/source-to-image
[20]:https://github.com/kubernetes-incubator/cri-o
[21]:https://medium.com/cri-o
