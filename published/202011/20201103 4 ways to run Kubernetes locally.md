[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12825-1.html)
[#]: subject: (4 ways to run Kubernetes locally)
[#]: via: (https://opensource.com/article/20/11/run-kubernetes-locally)
[#]: author: (Bryant Son https://opensource.com/users/brson)

本地运行 Kubernetes 的 4 种方法
======

> 设置一个本地开发环境，或者直接用这些工具尝试容器编排平台。

![](https://img.linux.net.cn/data/attachment/album/202011/16/132219hn9q9dszudbdtn35.jpg)

[Kubernetes][2] 是一个开源的容器编排平台。它由 Google 开发，为自动化部署、扩展和管理容器化应用提供了一个开源系统。虽然大多数人在云环境中运行 Kubernetes，但在本地运行 Kubernetes 集群不仅是可能的，它还至少有两个好处：

* 在决定使用 Kubernetes 作为主要平台部署应用之前，你可以快速试用它。
* 在将任何东西推送到公共云之前，你可以将其设置为本地开发环境，从而实现开发环境和生产环境之间的分离。

无论你的情况如何，将本地 Kubernetes 环境设置为你的开发环境都是推荐的选择，因为这种设置可以创建一个安全而敏捷的应用部署流程。

幸运的是，有多个平台可以让你尝试在本地运行 Kubernetes，它们都是开源的，并且都是 [Apache 2.0][3] 许可。

* [Minikube][4] 的主要目标是成为本地 Kubernetes 应用开发的最佳工具，并支持所有适合的 Kubernetes 特性。
* [kind][5] 使用 Docker 容器“节点”运行本地 Kubernetes 集群。
* [CodeReady Containers][6]（CRC）用来管理为测试和开发目的优化的本地 OpenShift 4.x 集群。
* [Minishift][7] 通过在虚拟机 （VM） 内运行单节点的 OpenShift 集群，帮助你在本地运行 OpenShift 3.x 集群。

### Minikube

![Minikube][8]

[Minikube][10] 是在本地计算机上运行 Kubernetes 环境的最知名、最流行的选择。无论你使用什么操作系统，[Minikube 的文档][11]都会为你提供一个简单的[安装][12]指南。一般来说，安装 Minikube 只需运行两条命令：

```
$ curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-PLATFORM-amd64
$ sudo install minikube-PLATFORM-amd64 /usr/local/bin/minikube
```

Minikube 可在 Linux、macOS 或 Windows 上快速设置本地 Kubernetes 集群，其功能如下：

* 支持最新的 Kubernetes 版本（包括 6 个以前的小版本）
* 跨平台（Linux、macOS、Windows）
* 以虚拟机、容器或裸机的形式部署
* 支持多个容器运行时（CRI-O、containerd、Docker）
* 用于快速推送镜像的 Docker API 端点
* 负载均衡器、文件系统挂载、FeatureGates 和其他高级功能
* 用于轻松安装 Kubernetes 应用的附加组件

因为 Minikube 是一个开源项目，你可以对它的[源代码][4]做贡献。

### kind

![kind][13]

[kind][14] 的开发者将其描述为“一个使用 Docker 容器‘节点’运行本地 Kubernetes 集群的工具”。它是为测试 Kubernetes 而设计的，但也可能用于本地开发或持续集成。

kind 支持：

* 多节点（包括高可用性）集群
* 从源码构建 Kubernetes 版本
* Make/Bash/Docker 或 Bazel，以及预发布构建
* Linux、MacOS 和 Windows

此外，kind 是一个经过云原生计算基金会（CNCF）认证的 Kubernetes 合规安装程序。因为它是开源的，你可以在它的 GitHub 仓库中找到 kind 的[源码][5]。

### CodeReady Container （CRC）

![CodeReady Container][15]

如果你想在本地尝试最新版本的 OpenShift，可以尝试红帽的 [CodeReady Containers][16] （CRC）。CRC 将一个最小的 OpenShift 4.x 集群带到你的本地计算机上，为开发和测试目的提供一个最小的环境。CRC 主要针对开发者的桌面使用。

你可以在 GitHub 上找到 CodeReady Container 的[源码][6]，也是在 Apache 2.0 许可下提供的。

### Minishift

![Minishift][17]

[Minishift][7] 项目帮助你在本地用 [OKD][19] 在虚拟机内的单节点 OpenShift 集群[运行一个版本的 OpenShift][18]。你可以用它来[尝试 OpenShift][20]，或者在你的本地主机上为云开发。

和这个列表中的其他工具一样，Minishift 也是开源的，你可以在 GitHub 上访问它的[源码][7]。

### 为人服务的 Kubernetes

正如你所看到的，有几种方法可以在本地环境中试用 Kubernetes。我有遗漏么？欢迎留言提问或提出建议。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/run-kubernetes-locally

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://kubernetes.io/
[3]: https://www.apache.org/licenses/LICENSE-2.0
[4]: https://github.com/kubernetes/minikube
[5]: https://github.com/kubernetes-sigs/kind
[6]: https://github.com/code-ready/crc
[7]: https://github.com/minishift/minishift
[8]: https://opensource.com/sites/default/files/uploads/1_minikube.jpg (Minikube)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://minikube.sigs.k8s.io/docs/
[11]: https://minikube.sigs.k8s.io/docs
[12]: https://minikube.sigs.k8s.io/docs/start/
[13]: https://opensource.com/sites/default/files/uploads/2_kind.jpg (kind)
[14]: https://kind.sigs.k8s.io
[15]: https://opensource.com/sites/default/files/uploads/4_crc.jpg (CodeReady Container)
[16]: https://code-ready.github.io/crc
[17]: https://opensource.com/sites/default/files/uploads/3_minishift.jpg (Minishift)
[18]: https://www.redhat.com/sysadmin/kubernetes-cluster-laptop
[19]: https://www.okd.io/
[20]: https://www.redhat.com/sysadmin/learn-openshift-minishift