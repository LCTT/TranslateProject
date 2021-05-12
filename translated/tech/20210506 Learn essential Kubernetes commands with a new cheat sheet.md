[#]: subject: (Learn essential Kubernetes commands with a new cheat sheet)
[#]: via: (https://opensource.com/article/21/5/kubernetes-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

用新的速查表学习 Kubernetes 的基本命令
======
开始探索 kubectl、容器、pod 等，接着下载我们的免费的速查表，这样你就可以随时掌握关键的命令了。
![Cheat Sheet cover image][1]

云计算主要是在 Kubernetes 上运行，Kubernetes 主要是在 Linux 上运行，而 Linux 在有熟练的系统管理员控制时运行得最好。无论你认为自己是云计算架构师还是只是一个谦虚的系统管理员，现代互联网都需要了解如何在容器中创建应用和服务，按需扩展，按需扩展以及如何明智地进行监视和管理。

进入勇敢的容器世界的第一步是学习 Kubernetes 和它的基本命令：`kubectl`。

### 安装 kubectl

`kubectl` 命令允许你在 Kubernetes 集群上运行命令。你使用 `kubectl` 来部署应用，查看日志，检查和管理集群资源，并在出现问题时进行故障排除。`kubectl`（以及整个 Kubernetes）的典型”问题“是，要对集群运行命令，你首先需要一个集群。然而，有一些简单的解决方案。

首先，你可以创建自己的 Kubernetes 集群，只需买三块树莓派板和相关外围设备（主要是电源）。当你获得了硬件，阅读 Chris Collins 的[_使用树莓派构建 Kubernetes 集群_][2]，你就会拥有自己的安装有 `kubectl` 的集群。

另一种获得集群的方法是使用 [Minikube][3]，这是一个 Kubernetes 的实践环境。在所有建立和运行集群的方法中，这是最简单的。

还有更多的选择；例如，你可以参加一个关于 Kubernetes 的课程，以获得一个运行集群的实验室，或者你可以在云上购买时间。只要你有一个 Kubernetes 环境来练习，如何获得集群并不重要。

当你你能访问一个集群，你就可以开始探索 `kubectl` 命令。

### 了解 pod 和容器

容器是一个轻量级的、部分的 Linux 系统，专门用于运行一个应用或服务。容器受到[内核命名空间][4]的限制，这使它能够访问其主机（运行容器的计算机）上的重要系统组件，同时防止它向其主机发送数据。容器以容器镜像（或简称_镜像_）的形式保存，并由称为 _Containerfiles_ 或 _Dockerfiles_ 的文本文件定义。

一个 pod 是容器的正式集合，也是管理员扩展、监控和维护任何数量的容器的一种简单方法。

这些一起就像 Kubernetes 的”应用“。创建或获取容器镜像是你在云上运行服务的方式。

### 运行一个 pod

容器镜像的两个可靠仓库是 Docker Hub 和 Quay。你可以在仓库中搜索可用的镜像列表。通常有由项目提供的大型项目的官方镜像，也有专门的、定制的或特殊项目的社区镜像。最简单和最小的镜像之一是 [BusyBox][5] 容器，它提供了一个最小的 shell 环境和一些常用命令。

无论你是从仓库中拉取镜像，还是自己编写镜像定义并从 Git 仓库中拉取到集群中，其工作流程都是一样的。当你想在 Kubernetes 中启动一个 pod 时：

  1. 在 [Docker Hub][6] 或 [Quay][7] 上找到一个你想使用的镜像
  2. 拉取镜像
  3. 创建一个 pod
  4. 部署 pod



如果你想使用 BusyBox 容器的例子，你可以用一条命令完成最后三个步骤：


```
`$ kubectl create deployment my-busybox --image=busybox`
```

等待 kubectl 完成这个过程，最后你就有了一个正在运行的 BusyBox 实例。这个 pod 并没有暴露给其他人。它只是在后台安静地在你的集群上运行。

要看你的集群上有哪些 pod 在运行：


```
`$ kubectl get pods --all-namespaces`
```

你也可以获得关于 pod 部署的信息：


```
`$ kubectl describe deployment my-busybox`
```

### 与 pod 互动

容器通常包含使其自动化的配置文件。例如，将 Nginx httpd 服务器作为容器安装，应该不需要你的互动。你开始运行容器，它就会工作。对于你添加到 pod 中的第一个容器和之后的每个容器都是如此。

Kubernetes 模型的优点之一是，你可以根据需要扩展你的服务。如果你的网络服务被意外的流量淹没，你可以在你的云中启动一个相同的容器（使用 `scale` 或 `autoscale` 子命令），使你的服务处理传入请求的能力增加一倍。

即便如此，有时还是很高兴看到一些证明 pod 正在按预期运行的证据，或者能够对似乎无法正常运行的某些问题进行故障排除。为此，你可以在一个容器中运行任意的命令：


```
`$ kubectl exec my-busybox -- echo "hello cloud"`
```

另外，你可以在你的容器中打开一个 shell，用管道将你的标准输入输入到其中，并将其输出到终端的标准输出：


```
`$ kubectl exec --stdin --tty my-busybox -- /bin/sh`
```

### 暴露服务

默认情况下，pod 在创建时不会暴露给外界，这样你就有时间在上线前进行测试和验证。假设你想把 Nginx Web 服务器作为一个 pod 安装和部署在你的集群上，并使其可以访问。与任何服务一样，你必须将你的 pod 指向服务器上的一个端口。`kubectl` 子命令 `expose` 可以为你做到这点：


```
$ kubectl create deployment \
my-nginx --image=nginx
$ kubectl expose deployment \
my-nginx --type=LoadBalancer --port=8080
```

只要你的集群可以从互联网上访问，你就可以通过打开浏览器并导航到你的公共 IP 地址来测试你的新 Web 服务器的可访问性。

### 不仅仅是 pod

Kubernetes 提供了很多东西，而不仅仅是存储普通服务的镜像。除了作为一个[容器协调][8]的系统，它还是一个云开发的平台。你可以编写和部署应用，管理和监控性能和流量，实施智能负载平衡策略等。

Kubernetes 是一个强大的系统，它已经迅速成为各种云的基础，最主要的是[开放混合云][9]。今天就开始学习 Kubernetes 吧。随着你对 Kubernetes 的进一步了解，你会需要一些关于其主要概念和一般语法的快速提醒，所以[**下载我们的 Kubernetes 速查表**][10]并将它放在身边。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/kubernetes-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://opensource.com/article/20/6/kubernetes-raspberry-pi
[3]: https://opensource.com/article/18/10/getting-started-minikube
[4]: https://opensource.com/article/19/10/namespaces-and-containers-linux
[5]: https://www.busybox.net/
[6]: http://hub.docker.com
[7]: http://quay.io
[8]: https://opensource.com/article/20/11/orchestration-vs-automation
[9]: https://opensource.com/article/20/10/keep-cloud-open
[10]: https://opensource.com/downloads/kubernetes-cheat-sheet
