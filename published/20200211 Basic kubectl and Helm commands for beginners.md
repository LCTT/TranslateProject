[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12007-1.html)
[#]: subject: (Basic kubectl and Helm commands for beginners)
[#]: via: (https://opensource.com/article/20/2/kubectl-helm-commands)
[#]: author: (Jessica Cherry https://opensource.com/users/jrepka)

适用于初学者的基本 kubectl 和 Helm 命令
======

> 去杂货店“采购”这些命令，你需要用这些 Kubernetes 工具来入门。

![](https://img.linux.net.cn/data/attachment/album/202003/18/113120adp34myy90eb944b.jpg)

最近，我丈夫告诉我他即将要去参加一个工作面试，面试时他需要在计算机上运行一些基本命令。他对这场面试感到焦虑，但是对于他来说，学习和记住事情的最好方法是将不了解的事物比喻为非常熟悉的事物。因为我们的谈话是在我逛杂货店试图决定当晚要烹饪的食物之后进行的，所以这启发我用一次去杂货店的行程来介绍 `kubectl` 和 `helm` 命令。

[Helm][2]（“舵轮”）是在 Kubernetes（来自希腊语，意思是“舵手” 或 “领航员”）中管理应用程序的工具。你可以轻松地使用你的应用程序信息来部署“<ruby>海图<rt>chart</rt></ruby>”，从而可以在你的 Kubernetes 环境中几分钟之内让它们就绪并预配置好。在学习新知识时，查看示例的“海图”以了解其用法总是很有帮助的，因此，如果有时间，请查看这些成型的“[海图][3]”。（LCTT 译注：Kubernetes 生态中大量使用了和航海有关的比喻，因此本文在翻译时也采用了这些比喻）

[kubectl][4] 是与 Kubernetes 环境交互的命令行界面，允许你配置和管理集群。它需要一些配置才能在环境中工作，因此请仔细阅读其[文档][5]以了解你需要做什么。

我会在示例中使用命名空间，你可以在我的文章《[Kubernetes 命名空间入门][6]》中了解它。

现在我们已经准备好了，让我们开始 `kubectl`和 `helm` 基本命令的购物之旅！

### 用 Helm 列出清单

你去商店之前要做的第一件事是什么？好吧，如果你做事有条理，会创建一个“清单”。同样，这是我将解释的第一个基本的 Helm 命令。

在一个用 Helm 部署的应用程序中，`list` 命令提供有关应用程序当前版本的详细信息。在此示例中，我有一个已部署的应用程序：Jenkins CI/CD 应用程序。运行基本的 `list` 命令总是会显示默认的命名空间。由于我没有在默认的命名空间中部署任何内容，因此不会显示任何内容：

```
$helm list
NAME    NAMESPACE    REVISION    UPDATED    STATUS    CHART    APP VERSION
```

但是，如果运行带有额外标志的命令，则会显示我的应用程序和信息：

```
$helm list --all-namespaces
NAME     NAMESPACE  REVISION  UPDATED                   STATUS      CHART           APP  VERSION
jenkins  jenkins        1         2020-01-18 16:18:07 EST   deployed    jenkins-1.9.4   lts
```

最后，我可以指示 `list` 命令只检查我想从中获取信息的命名空间：

```
$helm list --namespace jenkins
NAME     NAMESPACE  REVISION  UPDATED                   STATUS    CHART          APP VERSION
jenkins    jenkins      1              2020-01-18 16:18:07 EST  deployed  jenkins-1.9.4  lts    
```

现在我有了一个清单，并且知道该清单上有什么，我可以使用 `get` 命令来“获取”我的物品！我会从 Kubernetes 集群开始，看看我能从中获取到什么？

### 用 Kubectl 获取物品

`kubectl get` 命令提供了有关 Kubernetes 中许多事物的信息，包括“<ruby>吊舱<rt>Pod</rt></ruby>”、节点和命名空间。同样，如果没有指定命名空间标志，就会使用默认的命名空间。首先，我获取集群中的命名空间以查看正在运行的命名空间：

```
$kubectl get namespaces
NAME             STATUS   AGE
default          Active   53m
jenkins          Active   44m
kube-node-lease  Active   53m
kube-public      Active   53m
kube-system      Active   53m
```

现在我已经知道了在我的环境中运行的有哪些命名空间了，接下来获取节点并查看有多少个节点正在运行：

```
$kubectl get nodes
NAME       STATUS   ROLES       AGE   VERSION
minikube   Ready    master  55m   v1.16.2
```

我有一个节点正在运行，这主要是因为我的 Minikube 运行在一台小型服务器上。要得到在我的这一个节点上运行的“吊舱”可以这样：

```
$kubectl get pods
No resources found in default namespace.
```

啊哦，它是空的。我将通过以下方式获取 Jenkins 命名空间中的内容：

```
$kubectl get pods --namespace jenkins
NAME                      READY  STATUS   RESTARTS  AGE
jenkins-7fc688c874-mh7gv  1/1    Running  0         40m
```

好消息！这里发现了一个“吊舱”，它还没有重新启动过，已运行了 40 分钟了。好的，如今我知道“吊舱”已经装好，所以我想看看用 Helm 命令可以得到什么。

### 用 Helm 获取信息

`helm get` 命令稍微复杂一点，因为这个“获取”命令所需要的不仅仅是一个应用程序名称，而且你可以从应用程序中请求多个内容。我会从获取用于制作该应用程序的值开始，然后展示“获取全部”的操作结果的片段，该操作将提供与该应用程序相关的所有数据。

```
$helm get values jenkins -n jenkins
USER-SUPPLIED VALUES:
null
```

由于我只安装了最小限度的稳定版，因此配置没有更改。如果我运行“获取全部”命令，我将得到所有的“海图”：

```
$helm get all jenkins -n jenkins
```

![output from helm get all command][7]

这会产生大量数据，因此我始终建议保留一份 Helm “海图”的副本，以便你可以查看“海图”中的模板。我还创建自己的值来了解自己所拥有的。

现在，我把所有的商品都放在购物车中了，我会检查一下“描述”它们包含什么的标签。这些示例仅与 `kubectl` 命令有关，它们描述了我通过 Helm 部署的内容。

### 用 kubectl 查看描述

正如我使用“获取”命令（该命令可以描述 Kubernetes 中的几乎所有内容）所做的那样，我将示例限定到命名空间、“吊舱”和节点上。由于我知道它们每一个是什么，因此这很容易。

```
$kubectl describe ns jenkins
Name:           jenkins
Labels:         &lt;none&gt;
Annotations:  &lt;none&gt;
Status:         Active
No resource quota.
No resource limits.
```

我可以看到我的命名空间的名称，并且它是活动的，没有资源或限额限制。

`describe pods` 命令会产生大量信息，因此我这里提供的是一小段输出。如果你在不使用“吊舱”名称的情况下运行该命令，它将返回名称空间中所有“吊舱”的信息，这可能会很麻烦。因此，请确保在此命令中始终包含“吊舱”名称。例如：

```
$kubectl describe pods jenkins-7fc688c874-mh7gv --namespace jenkins
```

![output of kubectl-describe-pods][8]

这会提供容器的状态、管理方式、标签以及“吊舱”中所使用的镜像（还有很多其它信息）。没有在这个简化过的输出中包括的数据有：在 Helm 配置值文件中应用的各种条件下的资源请求和限制、初始化容器和存储卷信息。如果你的应用程序由于资源不足而崩溃，或者是一个需要运行前置脚本进行配置的初始配置容器，或者生成不应该存储于纯文本 YAML 文件中的隐藏密码，则此数据很有用。

最后，我将使用 `describe node` 命令，当然，它是用来描述节点的。由于本示例只有一个名为 Minikube 的示例，因此我将使用这个名字。如果你的环境中有多个节点，则必须包含你想查找的的节点名称。

与“吊舱”一样，这个节点的命令会产生大量数据，因此我将仅包括输出片段。

```
$kubectl describe node minikube
```

![output of kubectl describe node][9]

注意，`describe node` 是更重要的基本命令之一。如此图所示，该命令返回统计信息，该信息指示节点何时资源用尽，并且该数据非常适合在需要扩展时（如果你的环境中没有自动扩展）向你发出警报。此输出片段中未包含的其它内容包括：对所有资源和限制的请求所占的百分比，以及资源的使用期限和分配（例如，对于我的应用程序而言）。

### 买单

使用这些命令，我完成了“购物”并得到了我想要的一切。希望这些基本命令也能在你使用 Kubernetes 的日常工作中提供帮助。

我鼓励你经常使用命令行并学习“帮助”部分中的速记标志，你可以通过运行以下命令来查看这些标志：

```
$helm --help
```

或

```
$kubectl -h
```

### 花生酱和果冻

有些东西像花生酱和果冻一样混在一起。Helm 和 `kubectl` 就有点像那样交错在一起。

我经常在自己的环境中使用这些工具。因为它们在很多地方都有很多相似之处，所以在使用其中一个之后，我通常需要跟进另一个。例如，我可以进行 Helm 部署，并使用 `kubectl` 观察它是否失败。一起试试它们，看看它们能为你做什么。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/kubectl-helm-commands

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jrepka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003784_02_os.comcareers_os_rh2x.png?itok=jbRfXinl (A person working.)
[2]: https://helm.sh/
[3]: https://github.com/helm/charts/tree/master/stable
[4]: https://kubernetes.io/docs/reference/kubectl/kubectl/
[5]: https://kubernetes.io/docs/reference/kubectl/overview/
[6]: https://linux.cn/article-11749-1.html
[7]: https://opensource.com/sites/default/files/uploads/helm-get-all.png (output from helm get all command)
[8]: https://opensource.com/sites/default/files/uploads/kubectl-describe-pods.png (output of kubectl-describe-pods)
[9]: https://opensource.com/sites/default/files/uploads/kubectl-describe-node.png (output of kubectl describe node)
