[#]: subject: "How to Install Kubernetes Cluster on Debian 11 with Kubeadm"
[#]: via: "https://www.linuxtechi.com/install-kubernetes-cluster-on-debian/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: "lxbwolf"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何用 Kubeadm 在 Debian 11 上安装 Kubernetes 集群
======
你是否在寻找一份在 Debian 11 (Bullseye) 上安装 Kubernetes 集群的简易指南？

本页的分步指南将向您展示如何使用 Kubeadm 工具在 Debian 11 上安装 Kubernetes 集群。

Kubernetes（k8s）集群包含主节点和工作节点，用于运行容器化的应用程序。主节点作为控制平面，工作节点为实际工作负载提供环境。

##### 前置条件

* 已安装 Debian 11
* 2 CPU / vCPU
* 2 GB RAM
* 20 GB 空闲硬盘空间
* 有管理员权限的 sudo 用户
* 稳定的网络连接

##### Lab 配置

在本文中，我使用了 3 个 Debian 11 系统的节点，配置如下

* Master Node (k8s-master) – 192.168.1.236
* Worker Node 1 (k8s-worker1) – 192.168.1.237
* Worker Node 2 (k8s-worker2) – 192.168.1.238

事不宜迟，我们直接进入安装步骤。

### 1 ) 设置主机名和更新 /etc/hosts 文件

在主节点和工作节点上使用 hostnamectl 命令来设置主机名。

```
$ sudo hostnamectl set-hostname "k8s-master"       // Run on master node
$ sudo hostnamectl set-hostname "k8s-worker1"      // Run on 1st worker node
$ sudo hostnamectl set-hostname "k8s-worker2"      // Run on 2nd worker node
```

在所有节点的 /etc/hosts 文件末尾添加下面几行内容，

```
192.168.1.236       k8s-master
192.168.1.237       k8s-worker1
192.168.1.238       k8s-worker2
```

### 2) 在所有节点上关闭交换分区

我推荐关闭交换分区，以便更丝滑地使用 kubelet。在所有节点上执行以下命令来关闭交换分区。

```
$ sudo swapoff -a
$ sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
```

### 3) 配置 Kubernetes 集群相关的防火墙规则

如果你的操作系统防火墙是打开的，请分别在主节点和工作节点允许以下的端口。

在主节点，执行

```
$ sudo ufw allow 6443/tcp
$ sudo ufw allow 2379/tcp
$ sudo ufw allow 2380/tcp
$ sudo ufw allow 10250/tcp
$ sudo ufw allow 10251/tcp
$ sudo ufw allow 10252/tcp
$ sudo ufw allow 10255/tcp
$ sudo ufw reload
```

在工作节点，执行

```
$ sudo ufw allow 10250/tcp
$ sudo ufw allow 30000:32767/tcp
$ sudo ufw reload
```

注意：如果你的 Debian 11系统防火墙是关闭的，可以跳过此步骤。

### 4) 在所有节点安装 Containerd 运行时

Containerd 是容器运行时的行业标准，所有节点必须安装 containerd。

先在所有节点上配置如下的核心参数，再安装 containerd。

```
$ cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

$ sudo modprobe overlay
$ sudo modprobe br_netfilter

$ cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-k8s.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
```

运行如下命令，以使上面的更改生效

```
$ sudo sysctl --system
```

现在，在所有节点上运行如下 apt 命令来安装 conatinerd。

```
$ sudo apt  update
$ sudo apt -y install containerd
```

在所有节点上运行如下命令来配置 containerd

```
$ containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
```

在所有节点上设置 cgroupdriver 为 systemd，

编辑 “/etc/containerd/config.toml” 文件，找到 ‘[plugins.”io.containerd.grpc.v1.cri”.containerd.runtimes.runc.options]’ 部分，添加一行内容：SystemdCgroup = true

```
$ sudo vi /etc/containerd/config.toml
```

![systemdCgroup-true-containerd-config-toml][1]

保存并退出文件。

在所有节点上重启并打开 containerd service。

```
$ sudo systemctl restart containerd
$ sudo systemctl enable containerd
```

### 5) 添加 Kubernetes Apt 库

执行以下命令，添加 Kubernetes Apt 库

```
$ sudo apt install gnupg gnupg2 curl software-properties-common -y
$ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/cgoogle.gpg
$ sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
```

### 6) 在所有节点上安装 Kubelet， Kubectl 和 Kubeadm

在所有节点上执行以下 apt 命令，安装 Kubernetes 集群组件，如 kubelet，kubectl 以及 Kubeadm。

```
$ sudo apt update
$ sudo apt install kubelet kubeadm kubectl -y
$ sudo apt-mark hold kubelet kubeadm kubectl
```

### 7) 使用 Kubeadm 创建 Kubernetes 集群

现在我们可以创建 Kubernetes  集群了，在主节点上执行以下命令

```
$ sudo kubeadm init --control-plane-endpoint=k8s-master
```

命令输出

![Kubernetes-Control-Plane-Initialization-Debian11][2]

出现以上内容，说明控制平面初始化成功。在输出中，有普通用户与集群交互的命令，也有把任何工作节点加入到集群的命令。

要开始与集群进行交互，请在主节点上运行以下命令。

```
$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

执行以下 kubectl 命令来获取节点和集群的信息，

```
$ kubectl get nodes
$ kubectl cluster-info
```

以上命令的输出

![Nodes-Cluster-Info-Kubectl][3]

通过执行 ‘Kubeadm join’ 命令来把两个工作节点加入到集群。

注意：请从 ‘kubeadm init’ 命令的输出中复制完整的命令。在我的例子中，命令如下：

```
$ sudo kubeadm join k8s-master:6443 --token ta622t.enl212euq7z87mgj \

   --discovery-token-ca-cert-hash sha256:2be58f54458d0e788c96b8841f811069019161f9a3dd8502a38c773e5c6ead17
```

在工作节点 1 上的输出如下

![Worker-Node1-Join-Kunernetes-Cluster][4]

在工作节点 2 上的输出如下

![Worker-Node2-Join-Kubernetes-Cluster][5]

在主节点上执行以下命令，检查节点的状态：

```
$ kubectl get nodes
NAME          STATUS     ROLES           AGE     VERSION
k8s-master    NotReady   control-plane   23m     v1.25.0
k8s-worker1   NotReady   <none>          9m27s   v1.25.0
k8s-worker2   NotReady   <none>          2m19s   v1.25.0
$
```

为了使节点状态变为 ready，我们需要安装 POD 网络插件，如 Calico 或 flannel。

### 8) 安装 Calico Pod 网络插件

在主节点上执行以下命令安装 calico：

```
$ kubectl apply -f https://projectcalico.docs.tigera.io/manifests/calico.yaml
```

输出

![Install-calico-pod-network-addon-debian11][6]

在所有节点上执行以下命令，配置防火墙允许 Calico 的端口，

```
$ sudo ufw allow 179/tcp
$ sudo ufw allow 4789/udp
$ sudo ufw allow 51820/udp
$ sudo ufw allow 51821/udp
$ sudo ufw allow 4789/udp
$ sudo ufw reload
```

执行以下命令检查下 Calico 的状态

```
$ kubectl get pods -n kube-system
```

![Calico-Pods-Status-Kuberenetes-Debian11][7]

完美！现在再检查下节点状态。

![Nodes-status-after-calico-Installation][8]

非常棒！上面的输出说明主节点和工作节点的状态都是 ready。现在这个集群可以正常工作了。

### 9) 检查 Kubernetes 集群安装是否正确

我们尝试通过 deployment 命令来部署基于 nginx 的应用程序，来验证Kubernetes 集群的安装是否正确。执行以下命令：

```
$ kubectl create deployment nginx-app --image=nginx --replicas 2
$ kubectl expose deployment nginx-app --name=nginx-web-svc --type NodePort --port 80 --target-port 80
$ kubectl describe svc nginx-web-svc
```

以上命令的输出：

![Nginx-Based-App-Kubernetes-Cluster-Debian11][9]

使用以下的 curl 命令通过节点端口 30036 来访问基于 nginx 的应用程序。

注意：在 curl 命令中，两个工作节点的主机名都可以使用

```
$ curl http://k8s-worker1:30036
```

![Access-Nginx-Based-App-via-NodePort-Kubernetes-Debian11][10]

以上的输出说明我们可以正常访问基于 nginx 的应用程序了。

以上为全部内容。希望本文对你有用，参照本文可以在 Debian 11 上正常安装 Kubernetes 集群。如有任何问题，请在下面评论区告诉我。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-kubernetes-cluster-on-debian/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/wp-content/uploads/2022/09/systemdCgroup-true-containerd-config-toml.png
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Kubernetes-Control-Plane-Initialization-Debian11.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Nodes-Cluster-Info-Kubectl.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Worker-Node1-Join-Kunernetes-Cluster.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Worker-Node2-Join-Kubernetes-Cluster.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Install-calico-pod-network-addon-debian11.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Calico-Pods-Status-Kuberenetes-Debian11.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Nodes-status-after-calico-Installation.png
[9]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Nginx-Based-App-Kubernetes-Cluster-Debian11.png
[10]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Access-Nginx-Based-App-via-NodePort-Kubernetes-Debian11.png
