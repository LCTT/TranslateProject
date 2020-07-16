[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12421-1.html)
[#]: subject: (Build a Kubernetes cluster with the Raspberry Pi)
[#]: via: (https://opensource.com/article/20/6/kubernetes-raspberry-pi)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

用树莓派构建 Kubernetes 集群
======

> 将 Kubernetes 安装在多个树莓派上，实现自己的“家庭私有云”容器服务。

![](https://img.linux.net.cn/data/attachment/album/202007/15/234152ivw1y2wwhmhmpuvo.jpg)

[Kubernetes][2] 从一开始就被设计为云原生的企业级容器编排系统。它已经成长为事实上的云容器平台，并由于接受了容器原生虚拟化和无服务器计算等新技术而继续发展。

从微型的边缘计算到大规模的容器环境，无论是公有云还是私有云环境，Kubernetes 都可以管理其中的容器。它是“家庭私有云”项目的理想选择，既提供了强大的容器编排，又让你有机会了解一项这样的技术 —— 它的需求如此之大，与云计算结合得如此彻底，以至于它的名字几乎就是“云计算”的代名词。

没有什么比 Kubernetes 更懂“云”，也没有什么能比树莓派更合适“集群起来”！在廉价的树莓派硬件上运行本地的 Kubernetes 集群是获得在真正的云技术巨头上进行管理和开发的经验的好方法。

### 在树莓派上安装 Kubernetes 集群

本练习将在三个或更多运行 Ubuntu 20.04 的树莓派 4 上安装 Kubernetes 1.18.2 集群。Ubuntu 20.04（Focal Fossa）提供了针对 64 位 ARM（ARM64）的树莓派镜像（64 位内核和用户空间）。由于目标是使用这些树莓派来运行 Kubernetes 集群，因此运行 AArch64 容器镜像的能力非常重要：很难找到 32 位的通用软件镜像乃至于标准基础镜像。借助 Ubuntu 20.04 的 ARM64 镜像，可以让你在 Kubernetes 上使用 64 位容器镜像。

#### AArch64 vs. ARM64；32 位 vs. 64 位；ARM vs. x86

请注意，AArch64 和 ARM64 实际上是同一种东西。不同的名称源于它们在不同社区中的使用。许多容器镜像都标为 AArch64，并能在标为 ARM64 的系统上正常运行。采用 AArch64/ARM64 架构的系统也能够运行 32 位的 ARM 镜像，但反之则不然：32 位的 ARM 系统无法运行 64 位的容器镜像。这就是 Ubuntu 20.04 ARM64 镜像如此有用的原因。

这里不会太深入地解释不同的架构类型，值得注意的是，ARM64/AArch64 和 x86\_64 架构是不同的，运行在 64 位 ARM 架构上的 Kubernetes 节点无法运行为 x86\_64 构建的容器镜像。在实践中，你会发现有些镜像没有为两种架构构建，这些镜像可能无法在你的集群中使用。你还需要在基于 Arch64 的系统上构建自己的镜像，或者跳过一些限制以让你的常规的 x86\_64 系统构建 Arch64 镜像。在“家庭私有云”项目的后续文章中，我将介绍如何在常规系统上构建 AArch64 镜像。

为了达到两全其美的效果，在本教程中设置好 Kubernetes 集群后，你可以在以后向其中添加 x86\_64 节点。你可以通过使用 [Kubernetes 的<ruby>污点<rt>taint</rt></ruby> 和<ruby>容忍<rt>toleration</rt></ruby>][3] 能力，由 Kubernetes 的调度器将给定架构的镜像调度到相应的节点上运行。

关于架构和镜像的内容就不多说了。是时候安装 Kubernetes 了，开始吧！

#### 前置需求

这个练习的要求很低。你将需要：

* 三台（或更多）树莓派 4（最好是 4GB 内存的型号）。
* 在全部树莓派上安装 Ubuntu 20.04 ARM64。

为了简化初始设置，请阅读《[修改磁盘镜像来创建基于树莓派的家庭实验室][4]》，在将 Ubuntu 镜像写入 SD 卡并安装在树莓派上之前，添加一个用户和 SSH 授权密钥（`authorized_keys`）。

### 配置主机

在 Ubuntu 被安装在树莓派上，并且可以通过 SSH 访问后，你需要在安装 Kubernetes 之前做一些修改。

#### 安装和配置 Docker

截至目前，Ubuntu 20.04 在 base 软件库中提供了最新版本的 Docker，即 v19.03，可以直接使用 `apt` 命令安装它。请注意，包名是 `docker.io`。请在所有的树莓派上安装 Docker：

```
# 安装 docker.io 软件包
$ sudo apt install -y docker.io
```

安装好软件包后，你需要做一些修改来启用 [cgroup][5]（控制组）。cgroup 允许 Linux 内核限制和隔离资源。实际上，这可以让 Kubernetes 更好地管理其运行的容器所使用的资源，并通过让容器彼此隔离来增加安全性。

在对所有树莓派进行以下修改之前，请检查 `docker info` 的输出：

```
# 检查 `docker info`
# 省略了某些输出
$ sudo docker info
(...)
 Cgroup Driver: cgroups
(...)
WARNING: No memory limit support
WARNING: No swap limit support
WARNING: No kernel memory limit support
WARNING: No kernel memory TCP limit support
WARNING: No oom kill disable support
```

上面的输出突出显示了需要修改的部分：cgroup 驱动和限制支持。

首先，将 Docker 使用的默认 cgroup 驱动从 `cgroups` 改为 `systemd`，让 systemd 充当 cgroup 管理器，确保只有一个 cgroup 管理器在使用。这有助于系统的稳定性，这也是 Kubernetes 所推荐的。要做到这一点，请创建 `/etc/docker/daemon.json` 文件或将内容替换为：

```
# 创建或替换 /etc/docker/daemon.json 以启用 cgroup 的 systemd 驱动

$ sudo cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
```

#### 启用 cgroup 限制支持

接下来，启用限制支持，如上面的 `docker info` 输出中的警告所示。你需要修改内核命令行以在引导时启用这些选项。对于树莓派 4，将以下内容添加到 `/boot/firmware/cmdline.txt` 文件中：

```
cgroup_enable=cpuset
cgroup_enable=memory
cgroup_memory=1
swapaccount=1
```

确保它们被添加到 `cmdline.txt` 文件的行末。这可以通过使用 `sed` 在一行中完成。

```
# 将 cgroup 和交换选项添加到内核命令行中
# 请注意 "cgroup_enable=cpuset" 前的空格，以便在该行的最后一个项目后添加一个空格
$ sudo sed -i '$ s/$/ cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1 swapaccount=1/' /boot/firmware/cmdline.txt
```

`sed` 命令匹配该行的终止符（由第一个 `$` 代表），用列出的选项代替它（它实际上是将选项附加到该行）。

有了这些改变，Docker 和内核应该按照 Kubernetes 的需要配置好了。重新启动树莓派，当它们重新启动后，再次检查 `docker info` 的输出。现在，`Cgroups driver` 变成了 `systemd`，警告也消失了。

#### 允许 iptables 查看桥接流量

根据文档，Kubernetes 需要配置 iptables 来查看桥接网络流量。你可以通过修改 `sysctl` 配置来实现。

```
# 启用 net.bridge.bridge-nf-call-iptables 和 -iptables6
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
$ sudo sysctl --system
```

#### 安装 Ubuntu 的 Kubernetes 包

由于你使用的是 Ubuntu，你可以从 Kubernetes.io 的 apt 仓库中安装 Kubernetes 软件包。目前没有 Ubuntu 20.04（Focal）的仓库，但最近的 Ubuntu LTS 仓库 Ubuntu 18.04（Xenial） 中有 Kubernetes 1.18.2。最新的 Kubernetes 软件包可以从那里安装。

将 Kubernetes 软件库添加到 Ubuntu 的源列表之中：

```
# 添加 packages.cloud.google.com 的 atp 密钥
$ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# 添加 Kubernetes 软件库
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
```

当 Kubernetes 添加了 Ubuntu 20.04（Focal）仓库时 —— 也许是在下一个 Kubernetes 版本发布时 —— 请确保切换到它。

将仓库添加到源列表后，安装三个必要的 Kubernetes 包：kubelet、kubeadm 和 kubectl：

```
# 更新 apt 缓存并安装 kubelet、kubeadm kubectl
# （输出略）
$ sudo apt update &amp;&amp; sudo apt install -y kubelet kubeadm kubectl
```

最后，使用 `apt-mark hold` 命令禁用这三个包的定期更新。升级到 Kubernetes 需要比一般的更新过程更多的手工操作，需要人工关注。

```
# 禁止（标记为保持）Kubernetes 软件包的更新
$ sudo apt-mark hold kubelet kubeadm kubectl
kubelet set on hold.
kubeadm set on hold.
kubectl set on hold.
```

主机配置就到这里了! 现在你可以继续设置 Kubernetes 本身了。

### 创建 Kubernetes 集群

在安装了 Kubernetes 软件包之后，你现在可以继续创建集群了。在开始之前，你需要做一些决定。首先，其中一个树莓派需要被指定为控制平面节点（即主节点）。其余的节点将被指定为计算节点。

你还需要选择一个 [CIDR][6]（无类别域间路由）地址用于 Kubernetes 集群中的 Pod。在集群创建过程中设置 `pod-network-cidr` 可以确保设置了 `podCIDR` 值，它以后可以被<ruby>容器网络接口<rt>Container Network Interface</rt></ruby>（CNI）加载项使用。本练习使用的是 [Flannel][7] CNI。你选择的 CIDR 不应该与你的家庭网络中当前使用的任何 CIDR 重叠，也不应该与你的路由器或 DHCP 服务器管理的 CIDR 重叠。确保使用一个比你预期需要的更大的子网：**总是**有比你最初计划的更多的 Pod！在这个例子中，我将使用 CIDR 地址 `10.244.0.0/16`，但你可以选择一个适合你的。

有了这些决定，你就可以初始化控制平面节点了。用 SSH 或其他方式登录到你为控制平面指定的节点。

#### 初始化控制平面

Kubernetes 使用一个引导令牌来验证被加入集群的节点。当初始化控制平面节点时，需要将此令牌传递给 `kubeadm init` 命令。用 `kubeadm token generate` 命令生成一个令牌：

```
# 生成一个引导令牌来验证加入集群的节点
$ TOKEN=$(sudo kubeadm token generate)
$ echo $TOKEN
d584xg.xupvwv7wllcpmwjy
```

现在你可以使用 `kubeadm init` 命令来初始化控制平面了：

```
# 初始化控制平面
#（输出略）
$ sudo kubeadm init --token=${TOKEN} --kubernetes-version=v1.18.2 --pod-network-cidr=10.244.0.0/16
```

如果一切顺利，你应该在输出的最后看到类似这样的东西：

```
Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 192.168.2.114:6443 --token zqqoy7.9oi8dpkfmqkop2p5 \
    --discovery-token-ca-cert-hash sha256:71270ea137214422221319c1bdb9ba6d4b76abfa2506753703ed654a90c4982b
```

注意两点：第一，Kubernetes 的 `kubectl` 连接信息已经写入到 `/etc/kubernetes/admin.conf`。这个 kubeconfig 文件可以复制到用户的 `~/.kube/config` 中，可以是主节点上的 root 用户或普通用户，也可以是远程机器。这样你就可以用 `kubectl` 命令来控制你的集群。

其次，输出中以 `kubernetes join` 开头的最后一行是你可以运行的命令，你可以运行这些命令加入更多的节点到集群中。

将新的 kubeconfig 复制到你的用户可以使用的地方后，你可以用 `kubectl get nodes` 命令来验证控制平面是否已经安装：

```
# 显示 Kubernetes 集群中的节点
# 你的节点名称会有所不同
$ kubectl get nodes
NAME         STATUS   ROLES    AGE     VERSION
elderberry   Ready    master   7m32s   v1.18.2
```

#### 安装 CNI 加载项

CNI 加载项负责 Pod 网络的配置和清理。如前所述，这个练习使用的是 Flannel CNI 加载项，在已经设置好 `podCIDR` 值的情况下，你只需下载 Flannel YAML 并使用 `kubectl apply` 将其安装到集群中。这可以用 `kubectl apply -f -` 从标准输入中获取数据，用一行命令完成。这将创建管理 Pod 网络所需的 ClusterRoles、ServiceAccounts 和 DaemonSets 等。

下载并应用 Flannel YAML 数据到集群中：

```
# 下载 Flannel YAML 数据并应用它
# （输出略）
$ curl -sSL https://raw.githubusercontent.com/coreos/flannel/v0.12.0/Documentation/kube-flannel.yml | kubectl apply -f -
```

#### 将计算节点加入到集群中

有了 CNI 加载项，现在是时候将计算节点添加到集群中了。加入计算节点只需运行 `kube init` 命令末尾提供的 `kubeadm join` 命令来初始化控制平面节点。对于你想加入集群的其他树莓派，登录主机，运行命令即可：

```
# 加入节点到集群，你的令牌和 ca-cert-hash 应各有不同
$ sudo kubeadm join 192.168.2.114:6443 --token zqqoy7.9oi8dpkfmqkop2p5 \
    --discovery-token-ca-cert-hash sha256:71270ea137214422221319c1bdb9ba6d4b76abfa2506753703ed654a90c4982b
```

一旦你完成了每个节点的加入，你应该能够在 `kubectl get nodes` 的输出中看到新节点：

```
# 显示 Kubernetes 集群中的节点
# 你的节点名称会有所不同
$ kubectl get nodes
NAME         STATUS   ROLES    AGE     VERSION
elderberry   Ready    master   7m32s   v1.18.2
gooseberry    Ready    &lt;none&gt;   2m39s   v1.18.2
huckleberry   Ready    &lt;none&gt;   17s     v1.18.2
```

#### 验证集群

此时，你已经拥有了一个完全正常工作的 Kubernetes 集群。你可以运行 Pod、创建部署和作业等。你可以使用[服务][8]从集群中的任何一个节点访问集群中运行的应用程序。你可以通过 NodePort 服务或入口控制器实现外部访问。

要验证集群正在运行，请创建一个新的命名空间、部署和服务，并检查在部署中运行的 Pod 是否按预期响应。此部署使用 `quay.io/clcollins/kube-verify:01` 镜像，这是一个监听请求的 Nginx 容器（实际上，与文章《[使用 Cloud-init 将节点添加到你的私有云][9]》中使用的镜像相同）。你可以在[这里][10]查看镜像的容器文件。

为部署创建一个名为 `kube-verify` 的命名空间：

```
# 创建一个新的命名空间
$ kubectl create namespace kube-verify
# 列出命名空间
$ kubectl get namespaces
NAME              STATUS   AGE
default           Active   63m
kube-node-lease   Active   63m
kube-public       Active   63m
kube-system       Active   63m
kube-verify       Active   19s
```

现在，在新的命名空间创建一个部署：

```
# 创建一个新的部署
$ cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kube-verify
  namespace: kube-verify
  labels:
    app: kube-verify
spec:
  replicas: 3
  selector:
    matchLabels:
      app: kube-verify
  template:
    metadata:
      labels:
        app: kube-verify
    spec:
      containers:
      - name: nginx
        image: quay.io/clcollins/kube-verify:01
        ports:
        - containerPort: 8080
EOF
deployment.apps/kube-verify created
```

Kubernetes 现在将开始创建部署，它由三个 Pod 组成，每个 Pod 都运行 `quay.io/clcollins/kube-verify:01` 镜像。一分钟左右后，新的 Pod 应该运行了，你可以用 `kubectl get all -n kube-verify` 来查看它们，以列出新命名空间中创建的所有资源：

```
# 检查由该部署创建的资源
$ kubectl get all -n kube-verify
NAME                               READY   STATUS              RESTARTS   AGE
pod/kube-verify-5f976b5474-25p5r   0/1     Running             0          46s
pod/kube-verify-5f976b5474-sc7zd   1/1     Running             0          46s
pod/kube-verify-5f976b5474-tvl7w   1/1     Running             0          46s

NAME                          READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/kube-verify   3/3     3            3           47s

NAME                                     DESIRED   CURRENT   READY   AGE
replicaset.apps/kube-verify-5f976b5474   3         3         3       47s
```

你可以看到新的部署、由部署创建的复制子集，以及由复制子集创建的三个 Pod，以满足部署中的 `replicas: 3` 的要求。你可以看到 Kubernetes 内部工作正常。

现在，创建一个服务来暴露在三个 Pod 中运行的 Nginx “应用程序”（在本例中是“欢迎”页面）。这将作为一个单一端点，你可以通过它连接到 Pod：

```
# 为该部署创建服务
$ cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Service
metadata:
  name: kube-verify
  namespace: kube-verify
spec:
  selector:
    app: kube-verify
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
EOF
service/kube-verify created
```

创建服务后，你可以对其进行检查并获取新服务的 IP 地址：

```
# 检查新服务
$ kubectl get -n kube-verify service/kube-verify
NAME          TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
kube-verify   ClusterIP   10.98.188.200   &lt;none&gt;        80/TCP    30s
```

你可以看到 `kube-verify` 服务已经被分配了一个 ClusterIP（仅对集群内部）`10.98.188.200`。这个 IP 可以从你的任何节点到达，但不能从集群外部到达。你可以通过在这个 IP 上连接到部署内部的容器来验证它们是否在工作：

```
# 使用 curl 连接到 ClusterIP：
# （简洁期间，输出有删节）
$ curl 10.98.188.200
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
```

成功了！你的服务正在运行，容器内的 Nginx 正在响应你的请求。你的服务正在运行，容器内的 Nginx 正在响应你的请求。

此时，你的树莓派上有一个正在运行的 Kubernetes 集群，安装了一个 CNI 加载项（Flannel），并有一个运行 Nginx Web 服务器的测试部署和服务。在大型公有云中，Kubernetes 有不同的入口控制器来与不同的解决方案交互，比如最近报道的 [Skipper][12] 项目。同样，私有云也有与硬件负载均衡器设备（如 F5 Networks 的负载均衡器）交互的入口控制器，或用于处理进入节点的流量的 Nginx 和 HAProxy 控制器。

在以后的文章中，我将通过安装自己的入口控制器来解决将集群中的服务暴露给外界的问题。我还将研究动态存储供应器和 StorageClasses，以便为应用程序分配持久性存储，包括利用你在上一篇文章《[将树莓派家庭实验室变成网络文件系统][13]》中设置的 NFS 服务器来为你的 Pod 创建按需存储。

### 去吧，Kubernetes

“Kubernetes”（κυβερνήτης）在希腊语中是飞行员的意思 —— 但这是否意味着驾驶船只以及引导船只的人？诶，不是。“Kubernan”（κυβερνάω）是希腊语“驾驶”或“引导”的意思，因此，去吧，Kubernan，如果你在会议上或其它什么活动上看到我，请试着给我一个动词或名词的通行证，以另一种语言 —— 我不会说的语言。

免责声明：如前所述，我不会读也不会讲希腊语，尤其是古希腊语，所以我选择相信我在网上读到的东西。你知道那是怎么一回事。我对此有所保留，放过我吧，因为我没有开“对我来说都是希腊语”这种玩笑。然而，只是提一下，虽然我可以开玩笑，但是实际上没有，所以我要么偷偷摸摸，要么聪明，要么两者兼而有之。或者，两者都不是。我并没有说这是个好笑话。

所以，去吧，像专业人员一样在你的家庭私有云中用自己的 Kubernetes 容器服务来试运行你的容器吧！当你越来越得心应手时，你可以修改你的 Kubernetes 集群，尝试不同的选项，比如前面提到的入口控制器和用于持久卷的动态 StorageClasses。

这种持续学习是 [DevOps][14] 的核心，持续集成和新服务交付反映了敏捷方法论，当我们学会了处理云实现的大规模扩容，并发现我们的传统做法无法跟上步伐时，我们就接受了这两种方法论。

你看，技术、策略、哲学、一小段希腊语和一个可怕的原始笑话，都汇聚在一篇文章当中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/kubernetes-raspberry-pi

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberrypi_cartoon.png?itok=m3TcBONJ (Cartoon graphic of Raspberry Pi board)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/
[4]: https://linux.cn/article-12277-1.html
[5]: https://en.wikipedia.org/wiki/Cgroups
[6]: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing
[7]: https://github.com/coreos/flannel
[8]: https://kubernetes.io/docs/concepts/services-networking/service/
[9]: https://linux.cn/article-12407-1.html
[10]: https://github.com/clcollins/homelabCloudInit/blob/master/simpleCloudInitService/data/Containerfile
[11]: http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
[12]: https://opensource.com/article/20/4/http-kubernetes-skipper
[13]: https://linux.cn/article-12413-1.html
[14]: https://opensource.com/tags/devops
