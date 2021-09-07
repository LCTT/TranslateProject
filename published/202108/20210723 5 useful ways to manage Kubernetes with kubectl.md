[#]: subject: (5 useful ways to manage Kubernetes with kubectl)
[#]: via: (https://opensource.com/article/21/7/kubectl)
[#]: author: (Alan Smithee https://opensource.com/users/alansmithee)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (turbokernel)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13676-1.html)

用 kubectl 管理 Kubernetes 的 5 种有用方法
======

> 学习 kubectl，提升你与 Kubernetes 的互动方式。

![Ship captain sailing the Kubernetes seas][1]

Kubernetes 可以帮你编排运行有大量容器的软件。Kubernetes 不仅提供工具来管理（或者说 [编排][2]）运行的容器，还帮助这些容器根据需要进行扩展。有了 Kubernetes 作为你的中央<ruby>控制面板<rt>control panel</rt></ruby>（或称 <ruby>控制平面<rt>control plane</rt></ruby>），你需要一种方式来管理 Kubernetes，而这项工作的工具就是 kubectl。`kubectl` 命令让你控制、维护、分析和排查 Kubernetes 集群的故障。与许多使用 `ctl`（“控制”的缩写）后缀的工具一样，如 `systemctl` 和 `sysctl`，`kubectl` 拥有大量的功能和任务权限，所以如果你正在运行 Kubernetes，你肯定会经常使用它。它是一个拥有众多选项的命令，所以下面是 `kubectl` 中简单易用的五个常见任务。

### 1、列出并描述资源

按照设计，容器往往会成倍增加。在某些条件下，它们可以快速增加。如果你只能通过 `podman ps`或 `docker ps` 来查看正在运行的容器，这可能会让你不知所措。通过 `kubectl get` 和 `kubectl describe`，你可以列出正在运行的<ruby>吊舱<rt>pod</rt></ruby>以及它们正在处理的容器信息。更重要的是，你可以通过使用 `--namespace` 或 `name` 或 `--selector`等选项，只列出所需信息。

`get` 子命令不仅仅对吊舱和容器有用。它也有关于节点、命名空间、发布、服务和副本的信息。

### 2、创建资源

如果你只通过类似 OpenShift、OKD 或 Kubernetes 提供的 Web 用户界面（UI）创建过发布，但你想从 Linux 终端控制你的集群，那么可以使用 `kubectl create`。`kubectl create` 命令并不只是实例化一个新的应用发布。Kubernetes 中还有很多其他组件可以创建，比如服务、配额和 [计划任务][3]。

Kubernetes 中的计划任务可以创建一个临时的吊舱，用来在你选择的时间表上执行一些任务。它们并不难设置。下面是一个计划任务，让一个 BusyBox 镜像每分钟打印 “hello world”。

```
$ kubectl create cronjob \
    hello-world \
    --image=busybox \
    --schedule="*/1 * * * *" -- echo "hello world"
```

### 3、编辑文件

Kubernetes 中的对象都有相应的配置文件，但在文件系统中查找相应的文件较为麻烦。有了 `kubectl edit`，你可以把注意力放在对象上，而不是定义文件上。你可以通过 `kubectl` 找到并打开文件（通过 `KUBE_EDITOR` 环境变量，你可以设置成你喜欢的编辑器）。

```
$ KUBE_EDITOR=emacs \
    kubectl edit cronjob/hello-world
```

### 4、容器之间的传输文件

初次接触容器的人往往对无法直接访问的共享系统的概念感到困惑。他们可能会在容器引擎或 `kubectl` 中了解到 `exec` 选项，但当他们不能从容器中提取文件或将文件放入容器中时，容器仍然会显得不透明。使用 `kubectl cp` 命令，你可以把容器当做远程服务器，使主机和容器之间文件传输如 SSH 命令一样简单：

```
$ kubectl cp foo my-pod:/tmp
```

### 5、应用变更

对 Kubernetes 对象进行修改，可以通过 `kubectl apply` 命令完成。你所要做的就是将该命令指向一个配置文件：

```
$ kubectl apply -f ./mypod.json
```

类似于运行 Ansible 剧本或 Bash 脚本，`apply` 使得快速“导入”设置到运行中的 Kubernetes 实例很容易。例如，GitOps 工具 [ArgoCD][4] 由于 `apply` 子命令，安装起来出奇地简单：

```
$ kubectl create namespace argocd
$ kubectl apply -n argocd \
    -f https://raw.githubusercontent.com/argoproj/argo-cd/vx.y.z/manifests/install.yaml
```

### 使用 kubectl

Kubectl 是一个强大的工具，由于它是一个终端命令，它可以写成脚本，并能实现用众多 Web UI 无法实现的功能。学习 `kubectl` 是进一步了解 Kubernetes、容器、吊舱以及围绕这些重要的云计算创新技术的一个好方法。[下载我们的 kubectl 速查表][5]，以获得快速参考，其中包括命令示例，以帮助你学习，并在为你提供注意细节。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/kubectl

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://opensource.com/article/20/11/orchestration-vs-automation
[3]: https://opensource.com/article/20/11/kubernetes-jobs-cronjobs
[4]: https://argoproj.github.io/argo-cd/
[5]: https://opensource.com/downloads/kubectl-cheat-sheet
