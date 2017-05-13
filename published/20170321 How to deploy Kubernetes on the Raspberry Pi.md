如何在树莓派上部署 Kubernetes
============================================================

> 只用几步，使用 Weave Net 在树莓派上设置 Kubernetes。


 ![How to deploy Kubernetes on the Raspberry Pi ](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/raspberrypi_cartoon.png?itok=sntNdheJ "How to deploy Kubernetes on the Raspberry Pi ") 
 
> 图片提供： opensource.com

当我开始对 [ARM][6]设备，特别是 Raspberry Pi 感兴趣时，我的第一个项目是一个 OpenVPN 服务器。

通过将 Raspberry Pi 作为家庭网络的安全网关，我可以使用我的手机来控制我的桌面，远程播放 Spotify，打开文档以及一些其他有趣的东西。我在第一个项目中使用了一个现有的教程，因为我害怕自己在命令行中拼砌。

几个月后，这种恐惧消失了。我扩展了我的原始项目，并使用 [Samba 服务器][7]从文件服务器分离出了 OpenVPN 服务器。这是我第一个没有完全按照教程来的项目。不幸的是，在我的 Samba 项目结束后，我意识到我没有记录任何东西，所以我无法复制它。为了重新创建它，我不得不重新参考我曾经用过的那些单独的教程，将项目拼回到一起。

我学到了关于开发人员工作流程的宝贵经验 - 跟踪你所有的更改。我在本地做了一个小的 git 仓库，并记录了我输入的所有命令。

### 发现 Kubernetes

2015 年 5 月，我发现了 Linux 容器和 Kubernetes。我觉得 Kubernetes 很有魅力，我可以使用仍然处于技术发展的概念 - 并且我实际上可以用它。平台本身及其所呈现的可能性令人兴奋。在此之前，我才刚刚在一块 Raspberry Pi 上运行了一个程序。而有了 Kubernetes，我可以做出比以前更先进的配置。

那时候，Docker（v1.6 版本，如果我记得正确的话）在 ARM 上有一个 bug，这意味着在 Raspberry Pi 上运行 Kubernetes 实际上是不可能的。在早期的 0.x 版本中，Kubernetes 的变化很快。每次我在 AMD64 上找到一篇关于如何设置 Kubernetes 的指南时，它针对的还都是一个旧版本，与我当时使用的完全不兼容。

不管怎样，我用自己的方法在 Raspberry Pi 上创建了一个 Kubernetes 节点，而在 Kubernetes v1.0.1 中，我使用 Docker v1.7.1 [让它工作了][8]。这是第一个将 Kubernetes 全功能部署到 ARM 的方法。

在 Raspberry Pi 上运行 Kubernetes 的优势在于，由于 ARM 设备非常小巧，因此不会产生大量的功耗。如果程序以正确的方式构建而成，那么就可以在 AMD64 上用同样的方法运行同一个程序。这样的一块小型 IoT 板为教育创造了巨大的机会。用它来做演示也很有用，比如你要出差参加一个会议。携带 Raspberry Pi （通常）比拖着大型英特尔机器要容易得多。

现在按照[我建议][9]的 ARM（32 位和 64 位）的支持已被合并到 Kubernetes 核心中。ARM 的二进制文件会自动与 Kubernetes 一起发布。虽然我们还没有为 ARM 提供自动化的 CI（持续集成）系统，不过在 PR 合并之前会自动确定它可在 ARM 上工作，现在它运转得不错。

### Raspberry Pi 上的分布式网络

我通过 [kubeadm][10] 发现了 Weave Net。[Weave Mesh][11] 是一个有趣的分布式网络解决方案，因此我开始了解更多关于它的内容。在 2016 年 12 月，我在 [Weaveworks][12] 收到了第一份合同工作，我成为了 Weave Net 中 ARM 支持团队的一员。

我很高兴可以在 Raspberry Pi 上运行 Weave Net 的工业案例，比如那些需要设备更加移动化的工厂。目前，将 Weave Scope 或 Weave Cloud 部署到 Raspberry Pi 可能不太现实（尽管可以考虑使用其他 ARM 设备），因为我猜这个软件需要更多的内存才能运行良好。理想情况下，随着 Raspberry Pi 升级到 2GB 内存，我想我可以在它上面运行 Weave Cloud 了。

在 Weave Net 1.9 中，Weave Net 支持了 ARM。Kubeadm（通常是 Kubernetes）在多个平台上工作。你可以使用 Weave 将 Kubernetes 部署到 ARM，就像在任何 AMD64 设备上一样安装 Docker、kubeadm、kubectl 和 kubelet。然后初始化控制面板组件运行的主机：

```
kubeadm init
```

接下来，用下面的命令安装你的 pod 网络：

```
kubectl apply -f https://git.io/weave-kube
```

在此之前在 ARM 上，你只能用 Flannel 安装 pod 网络，但是在 Weave Net 1.9 中已经改变了，它官方支持了 ARM。

最后，加入你的节点：

```
kubeadm join --token <token> <master-ip>
```

就是这样了！Kubernetes 已经部署到了 Raspberry Pi 上了。相比在 Intel/AMD64 上运行，你不用做什么特别的事情；Weave Net 在 ARM 上就能工作的很好。

### Raspberry Pi 社区

我希望 Raspberry Pi 社区成长起来，他们的思想传播到世界其他地方。他们在英国和其他国家已经取得了成功，但在芬兰并不是很成功。我希望生态系统能够继续扩展，以让更多的人学习如何部署 Kubernetes 或 Weave 到 ARM 设备上。毕竟，这些是我学到的。通过在 Raspberry Pi 设备上自学，我更好地了解了 ARM 及其上面部署的软件。

### 最后的思考

我通过加入用户社区、提出问题和不同程度的测试，在线学习了关于 Raspberry Pi 和 Kubernetes 的一切。

我是居住在芬兰的说瑞典语的高中生，到目前为止，我还从来没有参加过编程或计算机课程。但我仍然能够加入开源社区，因为它对年龄或教育没有限制：你的工作是根据其价值来评判的。

对于那些第一次要在开源项目中做出贡献感到紧张的人，我想说：深入进去，因为这是完全值得的。你做什么没有任何限制，你将永远不知道开源世界将为你提供哪些机会。这会很有趣，我保证！

--------------------------------------------------------------------------------

作者简介：

Lucas Käldström - 谢谢你发现我！我是一名来自芬兰的说瑞典语的高中生。

------------------

via: https://opensource.com/article/17/3/kubernetes-raspberry-pi

作者：[Lucas Käldström][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/luxas
[1]:https://opensource.com/tags/raspberry-pi?src=raspberry_pi_resource_menu
[2]:https://opensource.com/resources/what-raspberry-pi?src=raspberry_pi_resource_menu
[3]:https://opensource.com/article/16/12/getting-started-raspberry-pi?src=raspberry_pi_resource_menu
[4]:https://opensource.com/article/17/2/raspberry-pi-submit-your-article?src=raspberry_pi_resource_menu
[5]:https://opensource.com/article/17/3/kubernetes-raspberry-pi?rate=xHFaLw4Y4mkFiZww6sIHYnkEleqbqObgjXTC0ALUn9s
[6]:https://en.wikipedia.org/wiki/ARM_architecture
[7]:https://www.samba.org/samba/what_is_samba.html
[8]:https://github.com/luxas/kubernetes-on-arm
[9]:https://github.com/kubernetes/community/blob/master/contributors/design-proposals/multi-platform.md
[10]:https://kubernetes.io/docs/getting-started-guides/kubeadm/
[11]:https://github.com/weaveworks/mesh
[12]:https://www.weave.works/
[13]:https://opensource.com/user/113281/feed
[14]:https://opensource.com/users/luxas
