在 Kubernetes 集群中运行 WordPress
============================================================

![](https://cdn.deliciousbrains.com/content/uploads/2017/08/10131149/db-WPKubernetesCluster-1440x699.jpg)

作为一名开发者，我会尝试留意那些我可能不会每天使用的技术的进步。了解这些技术至关重要，因为它们可能会间接影响到我的工作。比如[由 Docker 推动][8]的、近期正在兴起的容器化技术，可用于上规模地托管 Web 应用。从技术层面来讲，我并不是一个 DevOps，但当我每天构建 Web 应用时，多去留意这些技术如何去发展，会对我有所裨益。

这种进步的一个绝佳的例子，是近一段时间高速发展的容器编排平台。它允许你轻松地部署、管理容器化应用，并对它们的规模进行调整。目前看来，容器编排的流行工具有 [Kubernetes （来自 Google）][9]，[Docker Swarm][10] 和 [Apache Mesos][11]。如果你想较好的了解上面那些技术以及它们的区别，我推荐你看一下[这篇文章][12]。

在这篇文章中，我们将会从一些简单的操作开始，了解一下 Kubernetes 平台，看看如何将一个 WordPress 网站部署在本地机器上的一个单节点集群中。

### 安装 Kubernetes

在 [Kubernetes 文档][13]中有一个很好的互动教程，涵盖了很多东西。但出于本文的目的，我只会介绍在 MacOS 中 Kuberentes 的安装和使用。

我们要做的第一件事是在你的本地主机中安装 Kubernetes。我们将使用一个叫做 [MiniKube][14] 的工具，它专门用于在你的机器上方便地设置一个用于测试的 Kubernetes 集群。

根据 Minikube 文档，在我们开始之前，有一些先决条件。首先要保证你已经安装了一个 Hypervisor （我将会使用 Virtualbox）。接下来，我们需要[安装 Kubernetes 命令行工具][15]（也就是 `kubectl`）。如果你在用 Homebrew，这一步非常简单，只需要运行命令：

```
$ brew install kubectl
```

现在我们可以真正 [安装 Minikube][16]  了：

```
$ curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.21.0/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
```

最后，我们要[启动 Minicube][17] 创建一个虚拟机，来作为我们的单节点 Kubernetes 集群。现在我要说一点：尽管我们在本文中只在本地运行它，但是在[真正的服务器][18]上运行 Kubernetes 集群时，后面提到的大多数概念都会适用。在多节点集群上，“主节点”将负责管理其它工作节点（虚拟机或物理服务器），并且 Kubernetes 将会在集群中自动进行容器的分发和调度。

```
$ minikube start --vm-driver=virtualbox
```

### 安装 Helm

现在，本机中应该有一个正在运行的（单节点）Kubernetes 集群了。我们现在可以用任何方式来与 Kubernetes 交互。如果你想现在可以体验一下，我觉得 [kubernetesbyexample.com][19] 可以很好地向你介绍 Kubernetes 的概念和术语。

虽然我们可以手动配置这些东西，但实际上我们将会使用另外的工具，来将我们的 WordPress 应用部署到 Kubernetes 集群中。[Helm][20] 被称为“Kubernetes 的包管理工具”，它可以让你轻松地在你的集群中部署预构建的软件包，也就是“<ruby>图表<rt>chart</rt></ruby>”。你可以把图表看做一组专为特定应用（如 WordPress）而设计的容器定义和配置。首先我们在本地主机上安装 Helm：

```
$ brew install kubernetes-helm
```

然后我们需要在集群中安装 Helm。 幸运的是，只需要运行下面的命令就好：

```
$ helm init
```

### 安装 WordPress

现在 Helm 已经在我们的集群中运行了，我们可以安装 [WordPress 图表][21]。运行：

```
$ helm install --namespace wordpress --name wordpress --set serviceType=NodePort stable/wordpress  
```

这条命令将会在容器中安装并运行 WordPress，并在容器中运行 MariaDB 作为数据库。它在 Kubernetes 中被称为“Pod”。一个 [Pod][22] 基本上可视为一个或多个应用程序容器和这些容器的一些共享资源（例如存储卷，网络等）的组合的抽象。

我们需要给这个部署一个名字和一个命名空间，以将它们组织起来并便于查找。我们同样会将 `serviceType` 设置为 `NodePort` 。这一步非常重要，因为在默认设置中，服务类型会被设置为 `LoadBalancer`。由于我们的集群现在没有负载均衡器，所以我们将无法在集群外访问我们的 WordPress 站点。

在输出数据的最后一部分，你会注意到一些关于访问你的 WordPress 站点的有用的命令。运行那些命令，你可以获取到我们的 WordPress 站点的外部 IP 地址和端口：

```
$ export NODE_PORT=$(kubectl get --namespace wordpress -o jsonpath="{.spec.ports[0].nodePort}" services wordpress-wordpress)
$ export NODE_IP=$(kubectl get nodes --namespace wordpress -o jsonpath="{.items[0].status.addresses[0].address}")
$ echo http://$NODE_IP:$NODE_PORT/admin
```

你现在访问刚刚生成的 URL（忽略 `/admin` 部分），就可以看到 WordPress 已经在你的 Kubernetes 集群中运行了！

### 扩展 WordPress

Kubernetes 等服务编排平台的一个伟大之处，在于它将应用的扩展和管理变得易如反掌。我们看一下应用的部署状态：

```
$ kubectl get deployments --namespace=wordpress
```

 [![kubectl get deployments](https://cdn.deliciousbrains.com/content/uploads/2017/08/07120711/image4.png)][23] 

可以看到，我们有两个部署，一个是 Mariadb 数据库，一个是 WordPress 本身。现在，我们假设你的 WordPress 开始承载大量的流量，所以我们想将这些负载分摊在多个实例上。我们可以通过一个简单的命令来扩展 `wordpress-wordpress` 部署：

```
$ kubectl scale --replicas 2 deployments wordpress-wordpress --namespace=wordpress
```

再次运行 `kubectl get deployments`，我们现在应该会看到下面的场景：

 [![kubectl get deployments](https://cdn.deliciousbrains.com/content/uploads/2017/08/07120710/image2.png)][24] 

你刚刚扩大了你的 WordPress 站点规模！超级简单，对不对？现在我们有了多个 WordPress 容器，可以在它们之中对流量进行负载均衡。想了解 Kubernetes 扩展的更多信息，参见[这篇指南][25]。

### 高可用

Kubernetes 等平台的的另一大特色在于，它不单单能进行方便的扩展，还可以通过自愈组件来提供高可用性。假设我们的一个 WordPress 部署因为某些原因失效了，那 Kubernetes 会立刻自动替换掉这个部署。我们可以通过删除我们 WordPress 部署的一个 pod 来模拟这个过程。

首先运行命令，获取 pod 列表：

```
$ kubectl get pods --namespace=wordpress
```

 [![kubectl get pods](https://cdn.deliciousbrains.com/content/uploads/2017/08/07120711/image3.png)][26] 

然后删除其中一个 pod：

```
$ kubectl delete pod wordpress-wordpress-876183909-jqc8s --namespace=wordpress
```

如果你再次运行 `kubectl get pods` 命令，应该会看到 Kubernetes 立刻换上了新的 pod （`3l167`）。

 [![kubectl get pods](https://cdn.deliciousbrains.com/content/uploads/2017/08/07120709/image1.png)][27] 

### 更进一步

我们只是简单了解了 Kubernetes 能完成工作的表面。如果你想深入研究，我建议你查看以下功能：

* [平行扩展][2]
* [自愈][3]
* [自动更新及回滚][4]
* [密钥管理][5]

你在容器平台上运行过 WordPress 吗？有没有使用过 Kubernetes（或其它容器编排平台），有没有什么好的技巧？你通常会怎么扩展你的 WordPress 站点？请在评论中告诉我们。

--------------------------------------------------------------------------------

作者简介：

Gilbert 喜欢构建软件。从 jQuery 脚本到 WordPress 插件，再到完整的 SaaS 应用程序，Gilbert 一直在创造优雅的软件。 他粗昂做的最有名的的产品，应该是 Nivo Slider.

--------


via: https://deliciousbrains.com/running-wordpress-kubernetes-cluster/

作者：[Gilbert Pellegrom][a]
译者：[StdioA](https://github.com/StdioA)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://deliciousbrains.com/author/gilbert-pellegrom/
[1]:https://deliciousbrains.com/author/gilbert-pellegrom/
[2]:https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
[3]:https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/#what-is-a-replicationcontroller
[4]:https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#what-is-a-deployment
[5]:https://kubernetes.io/docs/concepts/configuration/secret/
[6]:https://deliciousbrains.com/running-wordpress-kubernetes-cluster/
[7]:https://deliciousbrains.com/running-wordpress-kubernetes-cluster/
[8]:http://www.zdnet.com/article/what-is-docker-and-why-is-it-so-darn-popular/
[9]:https://kubernetes.io/
[10]:https://docs.docker.com/engine/swarm/
[11]:http://mesos.apache.org/
[12]:https://mesosphere.com/blog/docker-vs-kubernetes-vs-apache-mesos/ 
[13]:https://kubernetes.io/docs/tutorials/kubernetes-basics/
[14]:https://kubernetes.io/docs/getting-started-guides/minikube/
[15]:https://kubernetes.io/docs/tasks/tools/install-kubectl/
[16]:https://github.com/kubernetes/minikube/releases
[17]:https://kubernetes.io/docs/getting-started-guides/minikube/#quickstart
[18]:https://kubernetes.io/docs/tutorials/kubernetes-basics/
[19]:http://kubernetesbyexample.com/
[20]:https://docs.helm.sh/
[21]:https://kubeapps.com/charts/stable/wordpress
[22]:https://kubernetes.io/docs/tutorials/kubernetes-basics/explore-intro/
[23]:https://cdn.deliciousbrains.com/content/uploads/2017/08/07120711/image4.png
[24]:https://cdn.deliciousbrains.com/content/uploads/2017/08/07120710/image2.png
[25]:https://kubernetes.io/docs/tutorials/kubernetes-basics/scale-intro/
[26]:https://cdn.deliciousbrains.com/content/uploads/2017/08/07120711/image3.png
[27]:https://cdn.deliciousbrains.com/content/uploads/2017/08/07120709/image1.png
