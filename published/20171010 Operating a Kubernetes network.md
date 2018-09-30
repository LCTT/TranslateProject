Kubernetes 网络运维
======

最近我一直在研究 Kubernetes 网络。我注意到一件事情就是，虽然关于如何设置 Kubernetes 网络的文章很多，也写得很不错，但是却没有看到关于如何去运维 Kubernetes 网络的文章、以及如何完全确保它不会给你造成生产事故。

在本文中，我将尽力让你相信三件事情（我觉得这些都很合理 :)）：

*   避免生产系统网络中断非常重要
*   运维联网软件是很难的
*   有关你的网络基础设施的重要变化值得深思熟虑，以及这种变化对可靠性的影响。虽然非常“牛x”的谷歌人常说“这是我们在谷歌正在用的”（谷歌工程师在 Kubernetes 上正做着很重大的工作！但是我认为重要的仍然是研究架构，并确保它对你的组织有意义）。

我肯定不是 Kubernetes 网络方面的专家，但是我在配置 Kubernetes 网络时遇到了一些问题，并且比以前更加了解 Kubernetes 网络了。

### 运维联网软件是很难的

在这里，我并不讨论有关运维物理网络的话题（对于它我不懂），而是讨论关于如何让像 DNS 服务、负载均衡以及代理这样的软件正常工作方面的内容。

我在一个负责很多网络基础设施的团队工作过一年时间，并且因此学到了一些运维网络基础设施的知识！（显然我还有很多的知识需要继续学习）在我们开始之前有三个整体看法：

*   联网软件经常重度依赖 Linux 内核。因此除了正确配置软件之外，你还需要确保许多不同的系统控制（`sysctl`）配置正确，而一个错误配置的系统控制就很容易让你处于“一切都很好”和“到处都出问题”的差别中。
*   联网需求会随时间而发生变化（比如，你的 DNS 查询或许比上一年多了五倍！或者你的 DNS 服务器突然开始返回 TCP 协议的 DNS 响应而不是 UDP 的，它们是完全不同的内核负载！）。这意味着之前正常工作的软件突然开始出现问题。
*   修复一个生产网络的问题，你必须有足够的经验。（例如，看这篇 [由 Sophie Haskins 写的关于 kube-dns 问题调试的文章][1]）我在网络调试方面比以前进步多了，但那也是我花费了大量时间研究 Linux 网络知识之后的事了。

我距离成为一名网络运维专家还差得很远，但是我认为以下几点很重要：

1.  对生产网络的基础设施做重要的更改是很难得的（因为它会产生巨大的混乱）
2.  当你对网络基础设施做重大更改时，真的应该仔细考虑如果新网络基础设施失败该如何处理
3.  是否有很多人都能理解你的网络配置

切换到 Kubernetes 显然是个非常大的更改！因此，我们来讨论一下可能会导致错误的地方！

### Kubernetes 网络组件

在本文中我们将要讨论的 Kubernetes 网络组件有：

*   <ruby>覆盖网络<rt>overlay network</rt></ruby>的后端（像 flannel/calico/weave 网络/romana）
*   `kube-dns`
*   `kube-proxy`
*   入站控制器 / 负载均衡器
*   `kubelet`

如果你打算配置 HTTP 服务，或许这些你都会用到。这些组件中的大部分我都不会用到，但是我尽可能去理解它们，因此，本文将涉及它们有关的内容。

### 最简化的方式：为所有容器使用宿主机网络

让我们从你能做到的最简单的东西开始。这并不能让你在 Kubernetes 中运行 HTTP 服务。我认为它是非常安全的，因为在这里面可以让你动的东西很少。

如果你为所有容器使用宿主机网络，我认为需要你去做的全部事情仅有：

1.  配置 kubelet，以便于容器内部正确配置 DNS
2.  没了，就这些！

如果你为每个 pod 直接使用宿主机网络，那就不需要 kube-dns 或者 kube-proxy 了。你都不需要一个作为基础的覆盖网络。

这种配置方式中，你的 pod 们都可以连接到外部网络（同样的方式，你的宿主机上的任何进程都可以与外部网络对话），但外部网络不能连接到你的 pod 们。

这并不是最重要的（我认为大多数人想在 Kubernetes 中运行 HTTP 服务并与这些服务进行真实的通讯），但我认为有趣的是，从某种程度上来说，网络的复杂性并不是绝对需要的，并且有时候你不用这么复杂的网络就可以实现你的需要。如果可以的话，尽可能地避免让网络过于复杂。

### 运维一个覆盖网络

我们将要讨论的第一个网络组件是有关覆盖网络的。Kubernetes 假设每个 pod 都有一个 IP 地址，这样你就可以与那个 pod 中的服务进行通讯了。我在说到“覆盖网络”这个词时，指的就是这个意思（“让你通过它的 IP 地址指向到 pod 的系统）。

所有其它的 Kubernetes 网络的东西都依赖正确工作的覆盖网络。更多关于它的内容，你可以读 [这里的 kubernetes 网络模型][10]。

Kelsey Hightower 在 [kubernetes 艰难之路][11] 中描述的方式看起来似乎很好，但是，事实上它的作法在超过 50 个节点的 AWS 上是行不通的，因此，我不打算讨论它了。

有许多覆盖网络后端（calico、flannel、weaveworks、romana）并且规划非常混乱。就我的观点来看，我认为一个覆盖网络有 2 个职责：

1.  确保你的 pod 能够发送网络请求到外部的集群
2.  保持一个到子网络的稳定的节点映射，并且保持集群中每个节点都可以使用那个映射得以更新。当添加和删除节点时，能够做出正确的反应。

Okay! 因此！你的覆盖网络可能会出现的问题是什么呢？

*   覆盖网络负责设置 iptables 规则（最基本的是 `iptables -A -t nat POSTROUTING -s $SUBNET -j MASQUERADE`），以确保那个容器能够向 Kubernetes 之外发出网络请求。如果在这个规则上有错误，你的容器就不能连接到外部网络。这并不很难（它只是几条 iptables 规则而已），但是它非常重要。我发起了一个 [拉取请求][2]，因为我想确保它有很好的弹性。
*   添加或者删除节点时可能会有错误。我们使用 `flannel hostgw` 后端，我们开始使用它的时候，节点删除功能 [尚未开始工作][3]。
*   你的覆盖网络或许依赖一个分布式数据库（etcd）。如果那个数据库发生什么问题，这将导致覆盖网络发生问题。例如，[https://github.com/coreos/flannel/issues/610][4] 上说，如果在你的 `flannel etcd` 集群上丢失了数据，最后的结果将是在容器中网络连接会丢失。（现在这个问题已经被修复了）
*   你升级 Docker 以及其它东西导致的崩溃
*   还有更多的其它的可能性！

我在这里主要讨论的是过去发生在 Flannel 中的问题，但是我并不是要承诺不去使用 Flannel —— 事实上我很喜欢 Flannel，因为我觉得它很简单（比如，类似 [vxlan 在后端这一块的部分][12] 只有 500 行代码），对我来说，通过代码来找出问题的根源成为了可能。并且很显然，它在不断地改进。他们在审查拉取请求方面做的很好。

到目前为止，我运维覆盖网络的方法是：

*   学习它的工作原理的详细内容以及如何去调试它（比如，Flannel 用于创建路由的 hostgw 网络后端，因此，你只需要使用 `sudo ip route list` 命令去查看它是否正确即可）
*   如果需要的话，维护一个内部构建版本，这样打补丁比较容易
*   有问题时，向上游贡献补丁

我认为去遍历所有已合并的拉取请求以及过去已修复的 bug 清单真的是非常有帮助的 —— 这需要花费一些时间，但这是得到一个其它人遇到的各种问题的清单的好方法。

对其他人来说，他们的覆盖网络可能工作的很好，但是我并不能从中得到任何经验，并且我也曾听说过其他人报告类似的问题。如果你有一个类似配置的覆盖网络：a) 在 AWS 上并且 b) 在多于 50-100 节点上运行，我想知道你运维这样的一个网络有多大的把握。

### 运维 kube-proxy 和 kube-dns？

现在，我有一些关于运维覆盖网络的想法，我们来讨论一下。

这个标题的最后面有一个问号，那是因为我并没有真的去运维过。在这里我还有更多的问题要问答。

这里的 Kubernetes 服务是如何工作的！一个服务是一群 pod 们，它们中的每个都有自己的 IP 地址（像 10.1.0.3、10.2.3.5、10.3.5.6 这样）

1.  每个 Kubernetes 服务有一个 IP 地址（像 10.23.1.2 这样）
2.  `kube-dns` 去解析 Kubernetes 服务 DNS 名字为 IP 地址（因此，my-svc.my-namespace.svc.cluster.local 可能映射到 10.23.1.2 上）
3.  `kube-proxy` 配置 `iptables` 规则是为了在它们之间随机进行均衡负载。Kube-proxy 也有一个用户空间的轮询负载均衡器，但是在我的印象中，他们并不推荐使用它。

因此，当你发出一个请求到 `my-svc.my-namespace.svc.cluster.local` 时，它将解析为 10.23.1.2，然后，在你本地主机上的 `iptables` 规则（由 kube-proxy 生成）将随机重定向到 10.1.0.3 或者 10.2.3.5 或者 10.3.5.6 中的一个上。

在这个过程中我能想像出的可能出问题的地方：

*   `kube-dns` 配置错误
*   `kube-proxy` 挂了，以致于你的 `iptables` 规则没有得以更新
*   维护大量的 `iptables` 规则相关的一些问题

我们来讨论一下 `iptables` 规则，因为创建大量的 `iptables` 规则是我以前从没有听过的事情！

kube-proxy 像如下这样为每个目标主机创建一个 `iptables` 规则：这些规则来自 [这里][13]）

```
-A KUBE-SVC-LI77LBOOMGYET5US -m comment --comment "default/showreadiness:showreadiness" -m statistic --mode random --probability 0.20000000019 -j KUBE-SEP-E4QKA7SLJRFZZ2DD[b][c]  
-A KUBE-SVC-LI77LBOOMGYET5US -m comment --comment "default/showreadiness:showreadiness" -m statistic --mode random --probability 0.25000000000 -j KUBE-SEP-LZ7EGMG4DRXMY26H  
-A KUBE-SVC-LI77LBOOMGYET5US -m comment --comment "default/showreadiness:showreadiness" -m statistic --mode random --probability 0.33332999982 -j KUBE-SEP-RKIFTWKKG3OHTTMI  
-A KUBE-SVC-LI77LBOOMGYET5US -m comment --comment "default/showreadiness:showreadiness" -m statistic --mode random --probability 0.50000000000 -j KUBE-SEP-CGDKBCNM24SZWCMS 
-A KUBE-SVC-LI77LBOOMGYET5US -m comment --comment "default/showreadiness:showreadiness" -j KUBE-SEP-RI4SRNQQXWSTGE2Y 
```

因此，kube-proxy 创建了许多 `iptables` 规则。它们都是什么意思？它对我的网络有什么样的影响？这里有一个来自华为的非常好的演讲，它叫做 [支持 50,000 个服务的可伸缩 Kubernetes][14]，它说如果在你的 Kubernetes 集群中有 5,000 服务，增加一个新规则，将需要 **11 分钟**。如果这种事情发生在真实的集群中，我认为这将是一件非常糟糕的事情。

在我的集群中肯定不会有 5,000 个服务，但是 5,000 并不是那么大的一个数字。为解决这个问题，他们给出的解决方案是 kube-proxy 用 IPVS 来替换这个 `iptables` 后端，IPVS 是存在于 Linux 内核中的一个负载均衡器。

看起来，像 kube-proxy 正趋向于使用各种基于 Linux 内核的负载均衡器。我认为这只是一定程度上是这样，因为他们支持 UDP 负载均衡，而其它类型的负载均衡器（像 HAProxy）并不支持 UDP 负载均衡。

但是，我觉得使用 HAProxy 更舒服！它能够用于去替换 kube-proxy！我用谷歌搜索了一下，然后发现了这个 [thread on kubernetes-sig-network][15]，它说：

> kube-proxy 是很难用的，我们在生产系统中使用它近一年了，它在大部分的时间都表现的很好，但是，随着我们集群中的服务越来越多，我们发现它的排错和维护工作越来越难。在我们的团队中没有 iptables 方面的专家，我们只有 HAProxy & LVS 方面的专家，由于我们已经使用它们好几年了，因此我们决定使用一个中心化的 HAProxy 去替换分布式的代理。我觉得这可能会对在 Kubernetes 中使用 HAProxy 的其他人有用，因此，我们更新了这个项目，并将它开源：[https://github.com/AdoHe/kube2haproxy][5]。如果你发现它有用，你可以去看一看、试一试。

因此，那是一个有趣的选择！我在这里确实没有答案，但是，有一些想法：

*   负载均衡器是很复杂的
*   DNS 也很复杂
*   如果你有运维某种类型的负载均衡器（比如 HAProxy）的经验，与其使用一个全新的负载均衡器（比如 kube-proxy），还不如做一些额外的工作去使用你熟悉的那个来替换，或许更有意义。
*   我一直在考虑，我们希望在什么地方能够完全使用 kube-proxy 或者 kube-dns —— 我认为，最好是只在 Envoy 上投入，并且在负载均衡&服务发现上完全依赖 Envoy 来做。因此，你只需要将 Envoy 运维好就可以了。

正如你所看到的，我在关于如何运维 Kubernetes 中的内部代理方面的思路还是很混乱的，并且我也没有使用它们的太多经验。总体上来说，kube-proxy 和 kube-dns 还是很好的，也能够很好地工作，但是我仍然认为应该去考虑使用它们可能产生的一些问题（例如，”你不能有超出 5000 的 Kubernetes 服务“）。

### 入口

如果你正在运行着一个 Kubernetes 集群，那么到目前为止，很有可能的是，你事实上需要 HTTP 请求去进入到你的集群中。这篇博客已经太长了，并且关于入口我知道的也不多，因此，我们将不讨论关于入口的内容。

### 有用的链接

几个有用的链接，总结如下：

*   [Kubernetes 网络模型][6]
*   GKE 网络是如何工作的：[https://www.youtube.com/watch?v=y2bhV81MfKQ][7]
*   上述的有关 `kube-proxy` 上性能的讨论：[https://www.youtube.com/watch?v=4-pawkiazEg][8]

### 我认为网络运维很重要

我对 Kubernetes 的所有这些联网软件的感觉是，它们都仍然是非常新的，并且我并不能确定我们（作为一个社区）真的知道如何去把它们运维好。这让我作为一个操作者感到很焦虑，因为我真的想让我的网络运行的很好！:) 而且我觉得作为一个组织，运行你自己的 Kubernetes 集群需要相当大的投入，以确保你理解所有的代码片段，这样当它们出现问题时你可以去修复它们。这不是一件坏事，它只是一个事而已。

我现在的计划是，继续不断地学习关于它们都是如何工作的，以尽可能多地减少对我动过的那些部分的担忧。

一如继往，我希望这篇文章对你有帮助，并且如果我在这篇文章中有任何的错误，我非常喜欢你告诉我。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2017/10/10/operating-a-kubernetes-network/

作者：[Julia Evans][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/about
[1]:http://blog.sophaskins.net/blog/misadventures-with-kube-dns/
[2]:https://github.com/coreos/flannel/pull/808
[3]:https://github.com/coreos/flannel/pull/803
[4]:https://github.com/coreos/flannel/issues/610
[5]:https://github.com/AdoHe/kube2haproxy
[6]:https://kubernetes.io/docs/concepts/cluster-administration/networking/#kubernetes-model
[7]:https://www.youtube.com/watch?v=y2bhV81MfKQ
[8]:https://www.youtube.com/watch?v=4-pawkiazEg
[9]:https://jvns.ca/categories/kubernetes
[10]:https://kubernetes.io/docs/concepts/cluster-administration/networking/#kubernetes-model
[11]:https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/11-pod-network-routes.md
[12]:https://github.com/coreos/flannel/tree/master/backend/vxlan
[13]:https://github.com/kubernetes/kubernetes/issues/37932
[14]:https://www.youtube.com/watch?v=4-pawkiazEg
[15]:https://groups.google.com/forum/#!topic/kubernetes-sig-network/3NlBVbTUUU0
