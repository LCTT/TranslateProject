[#]: subject: (5 useful ways to manage Kubernetes with kubectl)
[#]: via: (https://opensource.com/article/21/7/kubectl)
[#]: author: (Alan Smithee https://opensource.com/users/alansmithee)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

用 kubectl 管理 Kubernetes 的 5 种有用方法
======
学习kubectl，提升你与 Kubernetes 的互动方式。
![Ship captain sailing the Kubernetes seas][1]

Kubernetes 是帮助你以有组织的方式运行大量容器的软件。除了提供工具来管理（或[编排][2]）运行的容器，Kubernetes 还帮助这些容器根据需要进行扩展。有了 Kubernetes 作为你的中央控制面板（或称 _control plane_），你需要一种方法来管理 Kubernetes，而这项工作的工具就是 kubectl。`kubectl` 命令让你控制、维护、分析和排除 Kubernetes 集群的故障。与许多使用 `ctl`（“控制”的缩写）后缀的工具一样，如 systemctl 和 sysctl，kubectl 拥有大量的功能和任务权限，所以如果你正在运行 Kubernetes，你最终会经常使用它。它是一个有很多选项的大命令，所以下面是 kubectl 使之变得简单的五个常见任务。

### 1\. 列出并描述资源

按照设计，容器往往会成倍增加。在某些条件下，它们可以快速增加。如果你只能通过 `podman ps`或 `docker ps` 来查看正在运行的容器，这可能会让你不知所措。通过 `kubectl get` 和 `kubectl describe`，你可以获得关于哪些 pod 正在运行以及它们正在处理的容器的信息。更重要的是，你可以通过使用 `--namespace` 或 `name` 或 `--selector`等选项，只获得你需要的信息。

`get` 子命令不仅仅对 pod 和容器有用。它有关于节点、命名空间、部署、服务和复制的信息。

### 2\. 创建资源

如果你只通过类似 OpenShift、OKD 或 Kubernetes 提供的 Web 用户界面（UI）创建过部署，但你想从 Linux 终端控制你的集群，那么可以使用 `kubectl create`。`kubectl create` 命令并不只是实例化一个新的应用部署。Kubernetes 中还有很多其他组件可以创建，比如服务、配额和 [CronJob][3]。

Kubernetes 中的 CronJob 可以创建一个临时的 pod，用来在你选择的时间表上执行一些任务。它们并不难设置。下面是一个 CronJob，让一个 BusyBox 镜像每分钟响应 “hello world”。


```
$ kubectl create cronjob \
hello-world \
\--image=busybox \
\--schedule="*/1 * * * *" -- echo "hello world"
```

### 3\. 编辑文件

你可能了解 Kubernetes 中的对象都有相应的配置文件，但在文件系统中查找相应的文件可能很麻烦。有了 `kubectl edit`，你可以把注意力放在对象上，而不是定义它们的文件上。你可以让 `kubectl` 为你找到并打开文件（它遵循 `KUBE_EDITOR` 环境变量，所以你可以把编辑器设置成你喜欢的）。


```
$ KUBE_EDITOR=emacs \
kubectl edit cronjob/hello-world
```

### 4\. 容器之间的交换文件

初次接触容器的人往往对他们直接无法访问的共享系统的概念感到困惑。他们可能会在容器引擎或 kubectl 中了解到 `exec` 选项，但当他们不能从容器中获取文件或将文件放入容器中时，容器仍然会显得不透明。使用 `kubectl cp` 命令，你可以把容器当做远程服务器，使复制文件到容器或从容器复制文件不比 SSH 命令更复杂：


```
`$ kubectl cp foo my-pod:/tmp`
```

### 5\. 应用更改

对 Kubernetes 对象进行修改，可以在任何时候通过 `kubectl apply` 命令完成。你所要做的就是将该命令指向一个配置文件：


```
`$ kubectl apply -f ./mypod.json`
```

类似于运行 Ansible playbook 或 Bash 脚本，`apply` 使得快速“导入”设置到运行中的 Kubernetes 实例很容易。例如，GitOps 工具 [ArgoCD][4] 由于 `apply` 子命令，安装起来出奇地简单：


```
$ kubectl create namespace argocd
$ kubectl apply -n argocd \
-f <https://raw.githubusercontent.com/argoproj/argo-cd/vx.y.z/manifests/install.yaml>
```

### 使用 kubectl

Kubectl 是一个强大的工具，由于它是一个终端命令，它可以写成脚本，并以许多 Web UI 无法实现的方式使用。学习 kubectl 是进一步了解 Kubernetes、容器、pod 以及围绕这些重要的云计算创新的所有技术的一个好方法。[下载我们的 kubectl 速查表][5]，以获得快速参考，其中包括命令示例，以帮助你学习，并在你成为专家后提醒你注意细节。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/kubectl

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://opensource.com/article/20/11/orchestration-vs-automation
[3]: https://opensource.com/article/20/11/kubernetes-jobs-cronjobs
[4]: https://argoproj.github.io/argo-cd/
[5]: https://opensource.com/downloads/kubectl-cheat-sheet
