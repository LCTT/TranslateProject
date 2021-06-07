Minikube 入门：笔记本上的 Kubernetes
======

> 运行 Minikube 的分步指南。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cube_innovation_process_block_container.png?itok=vkPYmSRQ)

在 [Hello Minikube][1] 教程页面上 Minikube 被宣传为基于 Docker 运行 Kubernetes 的一种简单方法。 虽然该文档非常有用，但它主要是为 MacOS 编写的。 你可以深入挖掘在 Windows 或某个  Linux 发行版上的使用说明，但它们不是很清楚。 许多文档都是针对 Debian / Ubuntu 用户的，比如[安装 Minikube 的驱动程序][2]。

这篇指南旨在使得在基于 RHEL/Fedora/CentOS 的操作系统上更容易安装 Minikube。

### 先决条件

1. 你已经[安装了 Docker][3]。
2. 你的计算机是一个基于 RHEL / CentOS / Fedora 的工作站。
3. 你已经[安装了正常运行的 KVM2 虚拟机管理程序][4]。
4. 你有一个可以工作的 docker-machine-driver-kvm2。 以下命令将安装该驱动程序：

```
curl -Lo docker-machine-driver-kvm2 https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2 \
chmod +x docker-machine-driver-kvm2 \
&& sudo cp docker-machine-driver-kvm2 /usr/local/bin/ \
&& rm docker-machine-driver-kvm2
```

### 下载、安装和启动Minikube

1、为你要即将下载的两个文件创建一个目录，两个文件分别是：[minikube][5] 和 [kubectl][6]。

2、打开终端窗口并运行以下命令来安装 minikube。

```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```

请注意，minikube 版本（例如，minikube-linux-amd64）可能因计算机的规格而有所不同。

3、`chmod` 加执行权限。

```
chmod +x minikube
```

4、将文件移动到 `/usr/local/bin` 路径下，以便你能将其作为命令运行。

```
mv minikube /usr/local/bin
```

5、使用以下命令安装 `kubectl`（类似于 minikube 的安装过程）。

```
curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
```

使用 `curl` 命令确定最新版本的Kubernetes。

6、`chmod` 给 `kubectl` 加执行权限。

```
chmod +x kubectl
```

7、将 `kubectl` 移动到 `/usr/local/bin` 路径下作为命令运行。

```
mv kubectl /usr/local/bin
```

8、 运行 `minikube start` 命令。 为此，你需要有虚拟机管理程序。 我使用过 KVM2，你也可以使用 Virtualbox。 确保是以普通用户而不是 root 身份运行以下命令，以便为用户而不是 root 存储配置。

```
minikube start --vm-driver=kvm2
```

这可能需要一段时间，等一会。

9、 Minikube 应该下载并启动。 使用以下命令确保成功。

```
cat ~/.kube/config
```

10、 执行以下命令以运行 Minikube 作为上下文环境。 上下文环境决定了 `kubectl` 与哪个集群交互。 你可以在 `~/.kube/config` 文件中查看所有可用的上下文环境。

```
kubectl config use-context minikube
```

11、再次查看 `config` 文件以检查 Minikube 是否存在上下文环境。

```
cat ~/.kube/config
```

12、最后，运行以下命令打开浏览器查看 Kubernetes 仪表板。

```
minikube dashboard
```

现在 Minikube 已启动并运行，请阅读[通过 Minikube 在本地运行 Kubernetes][7] 这篇官网教程开始使用它。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/getting-started-minikube

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://kubernetes.io/docs/tutorials/hello-minikube
[2]: https://github.com/kubernetes/minikube/blob/master/docs/drivers.md
[3]: https://docs.docker.com/install
[4]: https://github.com/kubernetes/minikube/blob/master/docs/drivers.md#kvm2-driver
[5]: https://github.com/kubernetes/minikube/releases
[6]: https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-binary-using-curl
[7]: https://kubernetes.io/docs/setup/minikube
