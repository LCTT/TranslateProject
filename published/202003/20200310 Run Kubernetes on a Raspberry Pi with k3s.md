[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12049-1.html)
[#]: subject: (Run Kubernetes on a Raspberry Pi with k3s)
[#]: via: (https://opensource.com/article/20/3/kubernetes-raspberry-pi-k3s)
[#]: author: (Lee Carpenter https://opensource.com/users/carpie)

使用 K3s 在树莓派上运行 Kubernetes 集群
======

> 跟随接下来的介绍，自己搭建一个三节点的 Kubernetes 集群。

![](https://img.linux.net.cn/data/attachment/album/202003/29/121559p44e3dfrerf3zver.jpg)

我对在树莓派上搭建 [Kubernetes][2] 集群已经感兴趣很长时间了，只要照着网上的教程，我可以在由三个树莓派组成的集群中搭建一套 Kubernetes 并正常运行。但在这种情况下，主节点上的内存和 CPU 资源捉襟见肘，执行 Kubernetes 任务的时候往往性能不佳，想要升级 Kubernetes 就更不可能了。

这个时候，我非常激动地发现了 [K3s][3] 这个项目。K3s 被誉为在可用于资源受限环境下的轻量级 Kubernetes，它还针对 ARM 处理器做出了优化，这让 Kubernetes 集群可以在树莓派上运行得更好。在下文中，我们将会使用 K3s 来创建一个 Kubernetes 集群。

- [video](https://youtu.be/6PqxJhV-t1s)

### 准备

要按照本文介绍的方式创建 Kubernetes 集群，首先需要准备：

* 至少一个树莓派（包括 SD 卡和电源）
* 网线
* 将所有树莓派连接到一起的交换机或路由器

我们会通过在线安装的方式安装 K3s，因此还需要可以连接到互联网。

### 集群概览

在这个集群里，我们会使用三个树莓派。其中一个树莓派作为主节点，我们将它命名为 `kmaster`，并为其分配一个静态 IP `192.168.0.50`（注：假设使用的私有网段是 192.168.0.0/24），而另外两个树莓派作为工作节点，分别命名为 `knode1` 和 `knode2`，也分别分配 `192.168.0.51` 和 `192.168.0.52` 两个 IP 地址。

当然，如果你实际的网络布局和上面不同，只要将文中所提及到的 IP 替换成你实际可用的 IP 就可以了。

为了不需要通过 IP 来引用某一个节点，我们将每个节点的主机名记录到 PC 的 `/etc/hosts` 文件当中：

```
echo -e "192.168.0.50\tkmaster" | sudo tee -a /etc/hosts
echo -e "192.168.0.51\tknode1" | sudo tee -a /etc/hosts
echo -e "192.168.0.52\tknode2" | sudo tee -a /etc/hosts
```

### 部署主节点

我们首先部署主节点。最开始的步骤当然是使用镜像安装最新的 Raspbian，这个步骤可以参考我的[另一篇文章][4]，在这里就不展开介绍了。在安装完成之后，启动 SSH 服务，将主机名设置为 `kmaster`，然后分配静态 IP `192.168.0.50`。

在主节点上安装 Raspbian 完成后，启动树莓派并通过 `ssh` 连接上去：

```
ssh pi@kmaster
```

在主节点上执行以下命令安装 K3s：

```
curl -sfL https://get.k3s.io | sh -
```

等到命令跑完以后，一个单节点集群就已经运行起来了。让我们检查一下，还在这个树莓派上执行：

```
sudo kubectl get nodes
```

就会看到这样的输出：

```
NAME     STATUS   ROLES    AGE    VERSION
kmaster  Ready    master   2m13s  v1.14.3-k3s.1
```

### 获取<ruby>连接令牌<rt>join token</rt></ruby>

之后我们需要部署工作节点。在工作节点上安装 K3s 的时候，会需要用到连接令牌，它放置在主节点的文件系统上。首先把连接令牌保存出来以便后续使用：

```
sudo cat /var/lib/rancher/k3s/server/node-token
```

### 部署工作节点

通过 SD 卡在每个作为工作节点的树莓派上安装 Raspbian。在这里，我们把其中一个树莓派的主机名设置为 `knode1`，为其分配 IP 地址 `192.168.0.51`，另一个树莓派的主机名设置为 `knode2`，分配 IP 地址 `192.168.0.52`。接下来就可以安装 K3s 了。

启动主机名为 `knode1` 的树莓派，通过 `ssh` 连接上去：

```
ssh pi@knode1
```

在这个树莓派上，安装 K3s 的过程和之前差不多，但需要另外加上一些参数，表示它是一个工作节点，需要连接到一个已有的集群上：

```
curl -sfL http://get.k3s.io | K3S_URL=https://192.168.0.50:6443 \
K3S_TOKEN=刚才保存下来的连接令牌 sh -
```

`K3S_TOKEN` 的值需要替换成刚才保存下来的实际的连接令牌。完成之后，在主机名为 `knode2` 的树莓派上重复这个安装过程。

### 通过 PC 访问集群

现在如果我们想要查看或者更改集群，都必须 `ssh` 到集群的主节点才能使用 `kubectl`，这是比较麻烦的。因此我们会将 `kubectl` 放到 PC 上使用。首先，在主节点上获取一些必要的配置信息，`ssh` 到 `kmaster` 上执行：

```
sudo cat /etc/rancher/k3s/k3s.yaml
```

复制上面命令的输出，然后在你的 PC 上创建一个目录用来放置配置文件：

```
mkdir ~/.kube
```

将复制好的内容写入到 `~/.kube/config` 文件中，然后编辑该文件，将

```
server: https://localhost:6443
```

改为

```
server: https://kmaster:6443
```

出于安全考虑，只对自己保留这个配置文件的读写权限：

```
chmod 600 ~/.kube/config
```

如果 PC 上还没有安装 `kubectl` 的话，就可以开始安装了。Kubernetes 官方网站上有各种平台安装 `kubectl` 的[方法说明][5]，我使用的是 Ubuntu 的衍生版 Linux Mint，所以我的安装方法是这样的：

```
sudo apt update && sudo apt install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt install kubectl
```

上面几个命令的作用是添加了一个包含 Kubernetes 的 Debian 软件库，获取 GPG 密钥以确保安全，然后更新软件包列表并安装 `kubectl`。如果 `kubectl` 有更新，我们将会通过<ruby>标准软件更新机制<rt>standard software update mechanism</rt></ruby>收到通知。

现在在 PC 上就可以查看 Kubernetes 集群了：

```
kubectl get nodes
```

输出大概会是这样：

```
NAME     STATUS  ROLES   AGE   VERSION
kmaster  Ready   master  12m   v1.14.3-k3s.1
knode1   Ready   worker  103s  v1.14.3-k3s.1
knode1   Ready   worker  103s  v1.14.3-k3s.1
```

至此，我们已经搭建了一个三节点的 Kubernetes 集群。

### K3s 的彩蛋

如果执行 `kubectl get pods --all-namespaces`，就会看到其它服务的一些 Pod，比如 [Traefik][6]。Traefik 在这里起到是反向代理和负载均衡器的作用，它可以让流量从单个入口进入集群后引导到集群中的各个服务。Kubernetes 支持这种机制，但 Kubernetes 本身不提供这个功能，因此 Traefik 是一个不错的选择，K3s 安装后立即可用的优点也得益于此。

在后续的文章中，我们会继续探讨 Traefik 在 Kubernetes ingress 中的应用，以及在集群中部署其它组件。敬请关注。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/kubernetes-raspberry-pi-k3s

作者：[Lee Carpenter][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/carpie
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_wheel_gear_devops_kubernetes.png?itok=xm4a74Kv (A ship wheel with someone steering)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://k3s.io/
[4]: https://carpie.net/articles/headless-pi-with-static-ip-wired-edition
[5]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[6]: https://traefik.io/
