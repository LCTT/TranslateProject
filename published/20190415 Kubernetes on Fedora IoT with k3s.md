[#]: collector: (lujun9972)
[#]: translator: (StdioA)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10908-1.html)
[#]: subject: (Kubernetes on Fedora IoT with k3s)
[#]: via: (https://fedoramagazine.org/kubernetes-on-fedora-iot-with-k3s/)
[#]: author: (Lennart Jern https://fedoramagazine.org/author/lennartj/)

使用 k3s 在 Fedora IoT 上运行 K8S
======

![](https://img.linux.net.cn/data/attachment/album/201905/28/094048yrzlik9oek5rbs5s.jpg)

Fedora IoT 是一个即将发布的、面向物联网的 Fedora 版本。去年 Fedora Magazine 的《[如何使用 Fedora IoT 点亮 LED 灯][2]》一文第一次介绍了它。从那以后，它与 Fedora Silverblue 一起不断改进，以提供针对面向容器的工作流的不可变基础操作系统。

Kubernetes 是一个颇受欢迎的容器编排系统。它可能最常用在那些能够处理巨大负载的强劲硬件上。不过，它也能在像树莓派 3 这样轻量级的设备上运行。让我们继续阅读，来了解如何运行它。

### 为什么用 Kubernetes？

虽然 Kubernetes 在云计算领域风靡一时，但让它在小型单板机上运行可能并不是常见的。不过，我们有非常明确的理由来做这件事。首先，这是一个不需要昂贵硬件就可以学习并熟悉 Kubernetes 的好方法；其次，由于它的流行性，市面上有[大量应用][3]进行了预先打包，以用于在 Kubernetes 集群中运行。更不用说，当你遇到问题时，会有大规模的社区用户为你提供帮助。

最后但同样重要的是，即使是在家庭实验室这样的小规模环境中，容器编排也确实能够使事情变得更加简单。虽然在学习曲线方面，这一点并不明显，但这些技能在你将来与任何集群打交道的时候都会有帮助。不管你面对的是一个单节点树莓派集群，还是一个大规模的机器学习场，它们的操作方式都是类似的。

#### K3s - 轻量级的 Kubernetes

一个“正常”安装的 Kubernetes（如果有这么一说的话）对于物联网来说有点沉重。K8s 的推荐内存配置，是每台机器 2GB！不过，我们也有一些替代品，其中一个新人是 [k3s][4] —— 一个轻量级的 Kubernetes 发行版。

K3s 非常特殊，因为它将 etcd 替换成了 SQLite 以满足键值存储需求。还有一点，在于整个 k3s 将使用一个二进制文件分发，而不是每个组件一个。这减少了内存占用并简化了安装过程。基于上述原因，我们只需要 512MB 内存即可运行 k3s，极度适合小型单板电脑！

### 你需要的东西

1.  Fedora IoT 运行在虚拟机或实体设备中运行的。在[这里][5]可以看到优秀的入门指南。一台机器就足够了，不过两台可以用来测试向集群添加更多节点。
2. [配置防火墙][6]，允许 6443 和 8372 端口的通信。或者，你也可以简单地运行 `systemctl stop firewalld` 来为这次实验关闭防火墙。

### 安装 k3s

安装 k3s 非常简单。直接运行安装脚本：

```
curl -sfL https://get.k3s.io | sh -
```

它会下载、安装并启动 k3s。安装完成后，运行以下命令来从服务器获取节点列表：

```
kubectl get nodes
```

需要注意的是，有几个选项可以通过环境变量传递给安装脚本。这些选项可以在[文档][7]中找到。当然，你也完全可以直接下载二进制文件来手动安装 k3s。

对于实验和学习来说，这样已经很棒了，不过单节点的集群也不能算一个集群。幸运的是，添加另一个节点并不比设置第一个节点要难。只需要向安装脚本传递两个环境变量，它就可以找到第一个节点，而不用运行 k3s 的服务器部分。

```
curl -sfL https://get.k3s.io | K3S_URL=https://example-url:6443 \
  K3S_TOKEN=XXX sh -
```

上面的 `example-url` 应被替换为第一个节点的 IP 地址，或一个完全限定域名。在该节点中，（用 XXX 表示的）令牌可以在 `/var/lib/rancher/k3s/server/node-token` 文件中找到。

### 部署一些容器

现在我们有了一个 Kubernetes 集群，我们可以真正做些什么呢？让我们从部署一个简单的 Web 服务器开始吧。

```
kubectl create deployment my-server --image nginx
```

这会从名为 `nginx` 的容器镜像中创建出一个名叫 `my-server` 的 [部署][8]（默认使用 docker hub 注册中心，以及 `latest` 标签）。

```
kubectl get pods
```

为了访问到 pod 中运行的 nginx 服务器，首先通过一个 [服务][9] 来暴露该部署。以下命令将创建一个与该部署同名的服务。

```
kubectl expose deployment my-server --port 80
```

服务将作为一种负载均衡器和 Pod 的 DNS 记录来工作。比如，当运行第二个 Pod 时，我们只需指定 `my-server`（服务名称）就可以通过 `curl` 访问 nginx 服务器。有关如何操作，可以看下面的实例。

```
# 启动一个 pod，在里面以交互方式运行 bash
kubectl run debug --generator=run-pod/v1 --image=fedora -it -- bash
# 等待 bash 提示符出现
curl my-server
# 你可以看到“Welcome to nginx!”的输出页面
```

### Ingress 控制器及外部 IP

默认状态下，一个服务只能获得一个 ClusterIP（只能从集群内部访问），但你也可以通过把它的类型设置为 [LoadBalancer][10] 为该服务申请一个外部 IP。不过，并非所有应用都需要自己的 IP 地址。相反，通常可以通过基于 Host 请求头部或请求路径进行路由，从而使多个服务共享一个 IP 地址。你可以在 Kubernetes 使用 [Ingress][11] 完成此操作，而这也是我们要做的。Ingress 也提供了额外的功能，比如无需配置应用即可对流量进行 TLS 加密。

Kubernetes 需要 Ingress 控制器来使 Ingress 资源工作，k3s 包含 [Traefik][12] 正是出于此目的。它还包含了一个简单的服务负载均衡器，可以为集群中的服务提供外部 IP。这篇[文档][13]描述了这种服务：

> k3s 包含一个使用可用主机端口的基础服务负载均衡器。比如，如果你尝试创建一个监听 80 端口的负载均衡器，它会尝试在集群中寻找一个 80 端口空闲的节点。如果没有可用端口，那么负载均衡器将保持在 Pending 状态。
>
> k3s README

Ingress 控制器已经通过这个负载均衡器暴露在外。你可以使用以下命令找到它正在使用的 IP 地址。

```
$ kubectl get svc --all-namespaces
NAMESPACE     NAME         TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
 default       kubernetes   ClusterIP      10.43.0.1               443/TCP                      33d
 default       my-server    ClusterIP      10.43.174.38            80/TCP                       30m
 kube-system   kube-dns     ClusterIP      10.43.0.10              53/UDP,53/TCP,9153/TCP       33d
 kube-system   traefik      LoadBalancer   10.43.145.104   10.0.0.8      80:31596/TCP,443:31539/TCP   33d
```

找到名为 `traefik` 的服务。在上面的例子中，我们感兴趣的 IP 是 10.0.0.8。

### 路由传入的请求

让我们创建一个 Ingress，使它通过基于 Host 头部的路由规则将请求路由至我们的服务器。这个例子中我们使用 [xip.io][14] 来避免必要的 DNS 记录配置工作。它的工作原理是将 IP 地址作为子域包含，以使用 `10.0.0.8.xip.io` 的任何子域来达到 IP `10.0.0.8`。换句话说，`my-server.10.0.0.8.xip.io` 被用于访问集群中的 Ingress 控制器。你现在就可以尝试（使用你自己的 IP，而不是 10.0.0.8）。如果没有 Ingress，你应该会访问到“默认后端”，只是一个写着“404 page not found”的页面。

我们可以使用以下 Ingress 让 Ingress 控制器将请求路由到我们的 Web 服务器的服务。

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: my-server
spec:
  rules:
    - host: my-server.10.0.0.8.xip.io
      http:
        paths:
          - path: /
            backend:
              serviceName: my-server
              servicePort: 80
```

将以上片段保存到 `my-ingress.yaml` 文件中，然后运行以下命令将其加入集群：

```
kubectl apply -f my-ingress.yaml
```

你现在应该能够在你选择的完全限定域名中访问到 nginx 的默认欢迎页面了。在我的例子中，它是 `my-server.10.0.0.8.xip.io`。Ingress 控制器会通过 Ingress 中包含的信息来路由请求。对 `my-server.10.0.0.8.xip.io` 的请求将被路由到 Ingress 中定义为 `backend` 的服务和端口（在本例中为 `my-server` 和 `80`）。

### 那么，物联网呢？

想象如下场景：你的家或农场周围有很多的设备。它是一个具有各种硬件功能、传感器和执行器的物联网设备的异构集合。也许某些设备拥有摄像头、天气或光线传感器。其它设备可能会被连接起来，用来控制通风、灯光、百叶窗或闪烁的 LED。

这种情况下，你想从所有传感器中收集数据，在最终使用它来制定决策和控制执行器之前，也可能会对其进行处理和分析。除此之外，你可能还想配置一个仪表盘来可视化那些正在发生的事情。那么 Kubernetes 如何帮助我们来管理这样的事情呢？我们怎么保证 Pod 在合适的设备上运行？

简单的答案就是“标签”。你可以根据功能来标记节点，如下所示：

```
kubectl label nodes <node-name> <label-key>=<label-value>
# 举例
kubectl label nodes node2 camera=available
```

一旦它们被打上标签，我们就可以轻松地使用 [nodeSelector][15] 为你的工作负载选择合适的节点。拼图的最后一块：如果你想在*所有*合适的节点上运行 Pod，那应该使用 [DaemonSet][16] 而不是部署。换句话说，应为每个使用唯一传感器的数据收集应用程序创建一个 DaemonSet，并使用 nodeSelector 确保它们仅在具有适当硬件的节点上运行。

服务发现功能允许 Pod 通过服务名称来寻找彼此，这项功能使得这类分布式系统的管理工作变得易如反掌。你不需要为应用配置 IP 地址或自定义端口，也不需要知道它们。相反，它们可以通过集群中的命名服务轻松找到彼此。

#### 充分利用空闲资源

随着集群的启动并运行，收集数据并控制灯光和气候，可能使你觉得你已经把它完成了。不过，集群中还有大量的计算资源可以用于其它项目。这才是 Kubernetes 真正出彩的地方。

你不必担心这些资源的确切位置，或者去计算是否有足够的内存来容纳额外的应用程序。这正是编排系统所解决的问题！你可以轻松地在集群中部署更多的应用，让 Kubernetes 来找出适合运行它们的位置（或是否适合运行它们）。

为什么不运行一个你自己的 [NextCloud][17] 实例呢？或者运行 [gitea][18]？你还可以为你所有的物联网容器设置一套 CI/CD 流水线。毕竟，如果你可以在集群中进行本地构建，为什么还要在主计算机上构建并交叉编译它们呢？

这里的要点是，Kubernetes 可以更容易地利用那些你可能浪费掉的“隐藏”资源。Kubernetes 根据可用资源和容错处理规则来调度 Pod，因此你也无需手动完成这些工作。但是，为了帮助 Kubernetes 做出合理的决定，你绝对应该为你的工作负载添加[资源请求][19]配置。

### 总结

尽管 Kuberenetes 或一般的容器编排平台通常不会与物联网相关联，但在管理分布式系统时，使用一个编排系统肯定是有意义的。你不仅可以使用统一的方式来处理多样化和异构的设备，还可以简化它们的通信方式。此外，Kubernetes 还可以更好地对闲置资源加以利用。

容器技术使构建“随处运行”应用的想法成为可能。现在，Kubernetes 可以更轻松地来负责“随处”的部分。作为构建一切的不可变基础，我们使用 Fedora IoT。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/kubernetes-on-fedora-iot-with-k3s/

作者：[Lennart Jern][a]
选题：[lujun9972][b]
译者：[StdioA](https://github.com/StdioA)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lennartj/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/k3s-1-816x345.png
[2]: https://linux.cn/article-10380-1.html
[3]: https://hub.helm.sh/
[4]: https://k3s.io
[5]: https://docs.fedoraproject.org/en-US/iot/getting-started/
[6]: https://github.com/rancher/k3s#open-ports--network-security
[7]: https://github.com/rancher/k3s#systemd
[8]: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
[9]: https://kubernetes.io/docs/concepts/services-networking/service/
[10]: https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer
[11]: https://kubernetes.io/docs/concepts/services-networking/ingress/
[12]: https://traefik.io/
[13]: https://github.com/rancher/k3s/blob/master/README.md#service-load-balancer
[14]: http://xip.io/
[15]: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
[16]: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
[17]: https://nextcloud.com/
[18]: https://gitea.io/en-us/
[19]: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/
