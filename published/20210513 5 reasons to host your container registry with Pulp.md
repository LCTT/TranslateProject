[#]: subject: (5 reasons to host your container registry with Pulp)
[#]: via: (https://opensource.com/article/21/5/container-management-pulp)
[#]: author: (Melanie Corr https://opensource.com/users/melanie-corr)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13410-1.html)

用 Pulp 托管你的容器注册中心的 5 个理由
======

> 有很多令人信服的理由来用 Pulp 来托管你自己的容器注册中心。下面是其中的一些。

![](https://img.linux.net.cn/data/attachment/album/202105/21/091220vpckb2yywo2eq12y.jpg)

Linux 容器极大地简化了软件发布。将一个应用程序与它运行所需的一切打包的能力有助于提高环境的稳定性和可重复性。

虽然有许多公共注册中心可以上传、管理和分发容器镜像，但有许多令人信服的论据支持托管自己的容器注册中心。让我们来看看为什么自我托管是有意义的，以及 [Pulp][2]，一个自由开源项目，如何帮助你在企业内部环境中管理和分发容器。

### 为什么要托管你自己的容器注册中心

你可以考虑托管自己的容器注册中心，原因有很多：

  * **体积**：一些容器镜像是相当大的。如果你有多个团队下载同一个镜像，这可能需要大量的时间，并给你的网络和预算带来压力。
  * **带宽**：如果你在一个带宽有限的地区工作，或在一个出于安全原因限制访问互联网的组织中工作，你需要一个可靠的方法来管理你工作的容器。
  * **金钱**：服务条款可以改变。外部容器注册中心能引入或增加速率限制阈值，这可能会对你的操作造成极大的限制。
  * **稳定性**：托管在外部资源上的容器镜像可能会因为一些原因消失几天。小到你所依赖的更新容器镜像，可能会导致你想要避免的重大更改。
  * **隐私**：你可能也想开发和分发容器，但你不想在公共的第三方注册中心托管。

### 使用 Pulp 进行自我托管

使用 Pulp，你可以避免这些问题并完全控制你的容器。

#### 1、避免速率限制

在 Pulp 中创建容器镜像的本地缓存，可以让你组织中的每个人都能拉取到 Pulp 上托管的容器镜像，而不是从外部注册中心拉取。这意味着你可以避免速率限制，只有当你需要新的东西时才从外部注册中心进行同步。当你确实需要从外部注册中心同步容器时，Pulp 首先检查内容是否已经存在，然后再从远程注册中心启动同步。如果你受到注册中心的速率限制，你就只镜像你需要的内容，然后用 Pulp 在整个组织中分发它。

#### 2、整理你的容器

使用 Pulp，你可以创建一个仓库，然后从任何与 Docker Registry HTTP API V2 兼容的注册中心镜像和同步容器。这包括 Docker、Google Container registry、Quay.io 等，也包括另一个 Pulp 服务器。对于你结合来自不同注册中心的镜像容器的方式，没有任何限制或约束。你可以自由地混合来自不同来源的容器。这允许你整理一套公共和私人容器，以满足你的确切要求。

#### 3、无风险的实验

在 Pulp 中，每当你对仓库进行修改时，就会创建一个新的不可变的版本。你可以创建多个版本的仓库，例如，development、test、stage 和 production，并在它们之间推送容器。你可以自由地将容器镜像的最新更新从外部注册中心同步到 Pulp，然后让最新的变化在开发或其他环境中可用。你可以对你认为必要的仓库进行任何修改，并促进容器内容被测试团队或其他环境使用。如果出了问题，你可以回滚到早期版本。

#### 4、只同步你需要的内容

如果你想使用 Pulp 来创建一个容器子集的本地缓存，而不是一个完整的容器注册中心，你可以从一个远程源过滤选择容器。使用 Pulp，有多种内容同步选项，以便你只存储你需要的内容，或配置你的部署，按需缓存内容。

#### 5、在断线和空气隔离的环境中工作

如果你在一个断线或受限制的环境中工作，你可以从一个连接的 Pulp 实例中同步更新到你断连的 Pulp。目前，有计划为 Pulp 实现一个原生的空气隔离功能，以促进完全断线的工作流程。同时，作为一种变通方法，你可以使用 [Skopeo][3] 等工具来下载你需要的容器镜像，然后将它们推送到你断线的 Pulp 容器注册中心。

#### 还有更多！

通过 Pulp，你还可以从容器文件中构建容器，将私有容器推送到仓库，并在整个组织中分发这些容器。我们将在未来的文章中对这个工作流程进行介绍。

### 如何开始

如果你对自我托管你的容器注册中心感兴趣，你现在就可以 [安装 Pulp][4]。随着 Pulp Ansible 安装程序的加入，安装过程已经被大量自动化和简化了。

Pulp 有一个基于插件的架构。当你安装 Pulp 时，选择容器插件和其他任何你想管理的内容插件类型。如果你想测试一下 Pulp，你今天就可以评估 Pulp 的容器化版本。

如果你有任何问题或意见，请随时在 Freenode IRC 的 #pulp 频道与我们联系，我们也很乐意在我们的邮件列表 [pulp-list@redhat.com][5] 中接受问题。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/container-management-pulp

作者：[Melanie Corr][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/melanie-corr
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_2015-2-osdc-lead.png?itok=kAfHrBoy (Containers for shipping overseas)
[2]: https://pulpproject.org/
[3]: https://github.com/containers/skopeo
[4]: https://pulpproject.org/installation-introduction/
[5]: mailto:pulp-list@redhat.com
