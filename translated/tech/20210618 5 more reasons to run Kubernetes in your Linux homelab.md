[#]: subject: (5 more reasons to run Kubernetes in your Linux homelab)
[#]: via: (https://opensource.com/article/21/6/kubernetes-linux-homelab)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (chai001125)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

在你的 Linux 主机上运行 Kubernetes 的 5 个理由
======

>Kubernetes 的优势不仅在于它能够做什么，还在于知道它能为你做什么。

![Working from home at a laptop][1]

在 [Raspberry Pi <ruby>家庭实验室<rt> homelab </rt></ruby>上运行 Kubernetes 的 5 个理由][2] 这篇文章中，我解释了为什么推荐在家里使用 Kubernetes。其中的理由相对来说会有点随意，并且主要于关注结果。除了 Kubernetes 好用的功能之外，还有其他几个应将 Kubernetes 包含在你自己的计算机的理由。

（LCTT译注：Homelab 指的是安置在你家里的一个服务器或者多服务器的组合配置。在之上托管了多个服务和虚拟系统，以此来进行测试、开发，或者提供家庭功能用途。）

### 1、Kubernetes 是基于 Linux 而建立的

![T-shirt reading "Containers are Linux"][3]

Kubernetes 有很高的知名度。对于一些人来说，Kubernetes 是一种难以言说的神秘技术；对其他人来说，Kubernetes 就好像是牧羊犬放牧羊群一样，可以帮助他们管理过多的容器；对于另一些人来说，Kubernetes 是一种 <ruby>云<rt> cloud </rt></ruby>的操作系统，是 <ruby>实效云开发<rt> effective cloud development </rt></ruby>的一个有用的界面；对于大多数人来说，Kubernetes 可能是他们从未听说过的后端软件。正如人们所想的那样，Kubernetes 具有所有这些能力，甚至有更多的功能。

并非每个人都以相同的方式使用 Kubernetes，但如果你主要的工作是系统管理，你会发现 Kubernetes _只是另一个 Linux 命令_。

我有一件 T 恤，上面写着 <ruby>“容器就是 Linux”<rt> Containers are Linux </rt></ruby>，它的意思是显而易见的。容器技术使用 cgroups，来运行包含一个或一组应用程序的最小 Linux 操作系统映像。当你运行容器时，实际上你就是在运行 Linux。虽然在许多平台上都能使用 Kubernetes 命令，但 Kubernetes 命令管理的是 Linux 容器。当你通过终端与 Kubernetes 交互时，Kubernetes 命令类似于 Linux 的使用：有命令、选项、参数和语法。运行 Kubernetes 的 `kubeadm` 或（在 OKD 或 OpenShift 上）运行 `oc` 命令，你会感觉到很熟悉，是因为它们的工作方式与你习惯使用的任何其他 Linux 命令一样。开始时看似陌生的东西很快就会变得自然，任何有兴趣花时间在终端上的 Linux 用户都可以在 Kubernetes 中探索到许多有趣的东西。

### 2、Kubernetes 很灵活

在过去，Kubernetes 有点死板，因为从本质上来说，它仅能支持一个 <ruby>容器运行时<rt> container runtime </rt></ruby>。这个规定非常严格，以至于今天需要一个 <ruby>硬编码的垫片<rt> hardcoded shim </rt></ruby>，才能绕过这个遗留问题。幸运的是，如今 Kubernetes 已经变得足够灵活，可以满足管理员的许多不同需求了。[Podman][5] 和 [CRI-O][6] 可用作于容器引擎，它们都可以与 [systemd][7] 集成（这是因为 Kubernetes 的底层都是 Linux）。你可以自己选择 Kubernetes 所使用的文件系统、集群大小和构造、监控工具、镜像、编程语言等等配置。甚至现在有些人说 Kubernetes 有 _太多_ 的选择了。

### 3、学习 Kubernetes 有助于个人发展

容器是一个硕果累累的事物，它们会快速地成倍增长。这是设计使然的，容器旨在扩展，它们通过生成克隆来扩展。将容器分组（称为 _pods_），并自动化 Pod 生命周期的管理方式，这就是 Kubernetes 运用的方式。Kubernetes 正在改变服务器的运行方式。

你可能不需要无限扩展的容器集合，也不需要任何东西来帮助你管理正运行的一或两个容器。但是，如果你希望受益于处理 Pods 的能力，那么 Kubernetes 正是你需要学习的工具。随着越来越多的公司和组织走向全球，并拥抱 [数字化转型][8]，Kubernetes 正在成为 IT 领域的必备技能。如果你想要在这个领域中发展，那么现在开始学习 Kubernetes 并熟悉它的常见问题及其解决方案，将会是一项很好的投资。

### 4、Kubernetes 让容器更有意义

你可能还记得几年前，当开源项目刚开始将它们的代码作为容器镜像分发时，对于许多人来说，容器这一概念是令人费解的：没有多少系统管理员真正理解 [容器是什么][9]，或者明白容器的边界在哪里、如何进入容器，以及为什么数据不能存在于容器内。

现在，IT 界（包括开发人员在内）都对容器的概念都十分熟悉了。对于现代的 [CI/CD 工作流程][10] 来说，分发容器十分有意义。不过，对于系统管理员来说，容器的优势如下：安装容器比等待发行版更新其软件包和容器规模，更为容易。然而，在你使用 Kubernetes 之前，你很可能都不会真正地感受到这些好处。当你开始使用 Kubernetes 和相关工具管理容器之前，持续交付容器的好处和容器的扩展能力可能只是你读过的想法。将容器集成到你管理服务器的方式中，你会突然明白 Kubernetes 中令人兴奋的是什么。

![Apache JMeter][11]

你可以试试看这个最基本的测试：只需在容器中启动你最喜欢的 Web 服务器，创建一个 pod，然后使用来自 [Apache JMeter][12] 的流量访问你的服务器，然后观察容器响应。

### 5、Kubernetes 是 <ruby>云原生的<rt> Cloud-native </rt></ruby>

如果你主要做的是系统开发，而不是系统管理，那么 Kubernetes 也是 <ruby>网络应用程序<rt> web apps </rt></ruby>的一个很好的平台。我们现在都在使用网络应用程序，尽管大多数人只是将它们视为“<ruby>网站<rt> website </rt></ruby>”。Web 拥有庞大的用户群，因此通过浏览器提供开源的应用程序是非常有意义的。有一些很棒的开源应用程序在网络上运行，其中许多的应用程序都以容器的形式分发的，它们可以支持简单的安装和持续的用户体验。

### Kubernetes 的其他优势：Kubernetes 很有意思

你还记得你还是 Linux 新手的时候吗？对于一些人来说，那可能是几年前的事了，而对于其他人来说，可能是不久的过去。不过，对于所有人来说，学习一项新事物会是一个有趣的挑战。如果你达到了认为“Linux 的安装是麻烦多于挑战”的程度，那么你可以尝试一下构建一个 Kubernetes 集群。它会让你回忆起你忘记的各种概念：如何破解纯文本（特别是 [YAML][13] 格式的）配置文件，如何配置网络接口和网络，如何路由流量，知道一个后端相对于另一个后端的优缺点，在 `--dry-run` 测试之后运行 `dry-run` 测试，试探性地按 Return 来确定你是否做对了。老实说，使用 Kubernetes 很有趣。

如果你想自己构建基础架构，没有什么比构建你自己的 Kubernetes 集群更好的了。Kubernetes 集群将会为你打开一个全新的世界。你很快就会成为一名云架构师，学会完善你的开放云，在容器中安装令人惊叹的开源 Web 应用程序，也能为你的家人和朋友提供访问权限。

你自己就能得到解决方案。这真是太棒啦。

### 快来试试看 Kubernetes 吧

对 Kubernetes 的初学者来说，Kubernetes 似乎很难快速上手，因为 Kubernetes 是一个新的工具，会让你感到有点害怕，而且它还需要云。但是，以下有几种方法可以让你开始 Kubernetes 体验。

首先，安装 [Minikube][14] 或 [Minishift][14]。这两个工具都允许你在自己的计算机上运行 Kubernetes 的本地实例。虽然这种方式比不上“构建一个集群并与你的朋友共享”那么令人满意，但它是一种让你熟悉 Kubernetes 环境、命令和工具包的很好且安全的方式。

当你准备进一步研究 Kubernetes 后，请进一步阅读 Chris Collins 关于 [使用 Raspberry Pi 构建 Kubernetes 集群][15] 的文章。之后，再下载我们的免费电子书 [在你的 Raspberry Pi 家庭实验室上运行 Kubernetes][16]。在不知不觉中，你会发现自己也明白了“容器就是 Linux”的含义。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/kubernetes-linux-homelab

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[chai001125](https://github.com/chai001125)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://opensource.com/article/20/8/kubernetes-raspberry-pi
[3]: https://opensource.com/sites/default/files/uploads/containers-are-linux.jpg (T-shirt reading "Containers are Linux")
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: http://podman.io
[6]: http://cri-o.io
[7]: https://opensource.com/article/21/5/systemd
[8]: https://enterprisersproject.com/what-is-digital-transformation
[9]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[10]: https://opensource.com/article/18/8/what-cicd
[11]: https://opensource.com/sites/default/files/uploads/jmeter.png (Apache JMeter)
[12]: https://jmeter.apache.org
[13]: https://www.redhat.com/sysadmin/yaml-beginners
[14]: https://opensource.com/article/18/10/getting-started-minikube
[15]: https://opensource.com/article/20/6/kubernetes-raspberry-pi
[16]: https://opensource.com/downloads/kubernetes-raspberry-pi
