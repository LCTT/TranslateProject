[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 predictions for Kubernetes in 2020)
[#]: via: (https://opensource.com/article/20/1/kubernetes-2020)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux)

2020 年对 Kubernetes 的 5 项预测
======
请先回顾下 2019 年网站上最受欢迎的 Kubernetes 的文章。
![Person drinking a hat drink at the computer][1]

你怎么追踪一个广受欢迎的项目（如 Kubernetes）的发展轨迹？你怎么能了解它发展到什么程度了？如果你在为这个项目作贡献或加入了 SIG（Special Interest Group），可能你会在潜移默化中了解到它的发展轨迹，但如果你的全日工作不涉及到为 Kubernetes 作贡献，那么你可能需要一点关于未来的预测来帮助你了解。对于一个诸如 Kubernetes 的快速发展的项目，年末是回顾过去的一年和展望新的一年的最好时机。

今年，Kubernetes 取得了很大的进展。除了去查看源码、文档、会议笔记，你也可以去浏览博客。为了深入了解，我在 Opensource.com 上看了 Kubernetes 的 top 10 文章。通过这些文章，我们能了解开发者们更喜欢读和写哪些话题的文章。我们开始吧！

(2019 年末获取 Kubernetes 文章的 top 10。)

首先，我要指明这些文章中有 5 篇是关于 Kubernetes 工作负载的扩展以及它们可以运行在什么场景。这些工作负载涵盖数据科学、PostgreSQL、InfluxDB、Grafana（不仅仅监控集群本身）和 Edge。从历史角度看，Kubernetes 和容器都是在虚拟机上运行的，尤其是运行在由云提供的基础设施上时。抛开对于 Kubernetes 的兴趣因素，这也表明了终端用户们极度希望在裸机上安装 Kubernetes（参照[OpenShift 环境安装 Kubernetes][2]）。

其次，也有很多开发者希望了解操作相关的知识以及 Kubernetes 的最佳实践。从 [Kubernetes 操作][3] 到 [Kubernetes 控制器][4]，从 [Secrets][5] 到 [ConfigMaps][6]，开发者和运维人员都希望能找到简化部署和管理工作的最佳实践。我们经常纠结在怎么去修改配置文件或别人会怎么配置，而不去回头想想这些配置是怎么让应用部署运转的（不是怎么安装，也不是怎么运行 Kubernetes）。

最后，人们似乎对入门教程真的感兴趣。事实上，构建 Kubernetes 所需了解的信息太多了，以至于让人们望而却步，也使他们走了错误的路。流行度高的文章中有几篇讲述了为什么你需要了解用 Kubernetes 运行应用程序，而不仅仅是安装它。就是最佳实践类的文章一样，人们也通常不会回头分析在入门时他们应该在什么地方花费时间。我一直秉持的理念是，把有限的时间和金钱投入到如何使用某项技术上，而不是如何构建它。

### 2020 年对 Kubernetes 的 5 项预测

回顾下 2019 年的相关主题，这些主题告诉我们 2020 年将如何发展？结合这些文章中的观点，加上我自己的看法，我来分享下我对于 2020 年以及未来发展趋势的想法：

  1. 工作负载扩展。我会关注高性能计算，AI/ML 以及使用 Operator 的有状态工作负载。

  2. 更多的生产中的最佳实践，尤其是跟一些成熟的标准相关的，像 PCI，HIPAA，NIST 等等.

  3. rootless 相关的更好的安全性和 [runtimes classes][7]（如 [gVisor][8]，[Kata Containers][9] 等等）更高的安全性。

  4. 在部署和开发者们共享应用时，把 Kubernetes 清单的更好的规范标准作为部署的核心要素。如 [podman generate kube][10], [podman play kube][11], 还有多合一 Kubernetes 环境，如 [CodeReady Containers (CRC)][12]

  5. 一个前所未有的网络、存储和专业硬件（如 GPU 等等）供应商的生态系统，为 Kubernetes 提供 BoB（译注：best of breed，单项最佳品牌）解决方案（在免费软件中，我们相信开放的生态系统好过垂直整合的解决方案）。

期待 Kubernetes 在新的一年里再创辉煌！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/kubernetes-2020

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hat drink at the computer)
[2]: https://blog.openshift.com/kubernetes-on-metal-with-openshift/
[3]: https://kubernetes.io/docs/concepts/extend-kubernetes/operator/
[4]: https://kubernetes.io/docs/concepts/architecture/controller/
[5]: https://kubernetes.io/docs/concepts/configuration/secret/
[6]: https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/
[7]: https://kubernetes.io/docs/concepts/containers/runtime-class/
[8]: https://gvisor.dev/
[9]: https://katacontainers.io/
[10]: https://developers.redhat.com/blog/2019/01/29/podman-kubernetes-yaml/
[11]: https://www.redhat.com/en/blog/rhel-81-minor-release-major-new-container-capabilities
[12]: https://developers.redhat.com/products/codeready-containers/overview
