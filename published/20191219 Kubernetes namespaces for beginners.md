[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11749-1.html)
[#]: subject: (Kubernetes namespaces for beginners)
[#]: via: (https://opensource.com/article/19/12/kubernetes-namespaces)
[#]: author: (Jessica Cherry https://opensource.com/users/jrepka)

Kubernetes 命名空间入门
======

> 命名空间是什么？你为什么需要它？

![](https://img.linux.net.cn/data/attachment/album/202001/05/094542qnq3qc3nrkkrjanh.jpg)

kubernetes <ruby>命名空间<rt>namespace</rt></ruby>是什么？正如 Shakespeare 以前写过的，我们所谓的命名空间，或者任何其他名字，就是虚拟集群。通过虚拟集群，意味着 kubernetes 可以在单个集群上提供多个 kubernetes 的集群，类似一个在其主机抽象出来的虚拟机。[kubernetes 文档][2] 中的解释：

> kubernetes 在一个物理集群上提供了多个虚拟集群。这些虚拟集群被称为命名空间。

你为什么需要命名空间？一言以蔽之：隔离。

隔离有很多优点，如它提供了安全和干净的环境。如果你是基础设施的所属者，并且要为开发者提供环境，隔离就相当重要。你最不需要的就是，一个不熟悉你集群是如何搭建的人去修改系统配置 —— 这可能导致所有人都无法登录。

### 初始命名空间

一个集群的三个初始命名空间：`default`、`kube-system` 和 `kube-public`。虽然技术上你可以用这三个命名空间作部署，但我还是推荐你把这三个命名空间留作系统配置用，而不是你的项目。

* `Default` 用于某些没有指明命名空间的部署，这是一种快速创建混乱的做法，如果你在没有正确信息的情况下做了很多部署，将很难清理。我不会去动它，因为它只有这一个用途，而且在不止一种情况下误导过我。
* `Kube-system` 是 Kubernetes 系统相关的所有对象组成的命名空间。任何对此命名空间的部署都可能是危险的操作，可能对系统本身造成不可挽回的破坏。没错，我试过；所以我不推荐。
* `Kube-public` 所有人可读，但是这个命名空间是为系统保留的。

### 用命名空间来实现隔离

我用了多种方式通过命名空间来实现隔离。我经常用命名空间来把多个用户项目分割到不同的环境。这种方式可以有效防止跨项目的污染，因为命名空间提供了独立的环境。例如，用户可以安装不同版本的 Jenkins，如果它们的环境变量是在不同的命名空间，就不会冲突。

这种隔离对于清理也很有帮助。如果开发小组的多个项目突然被废弃，你可以用命令 `kubectl delete ns <$NAMESPACENAME>` 一键删除命名空间，清理命名空间内的所有东西。（请确认被删除的是正确的命名空间。我曾经在生产环境删除了错误的命名空间，这很不好。）

如果你是基础设施所有者，请谨慎操作，因为这可能会引发其他团队的的故障或引发其他问题。例如，如果你创建了一个特定的命名空间，里面有特殊的额外安全的 DNS 功能，但是其他人删除了它，那么命名空间内的所有 pod 和它们运行的应用都会被清空。所有的**删除**操作在真正实施之前都应该由同事（通过 [GitOps][3]）评审一下。

虽然官方文档不建议 [10 人以下团队][2] 使用多个命名空间，但出于架构需要，在我自己的集群上还是用了多个命名空间。集群越干净越好。

### 关于命名空间管理员应该知道的

首先，命名空间不能嵌套。部署只能在一个命名空间中进行。对于版本化项目，你不一定要用命名空间，你可以使用标签来区分有相同名字的版本化应用。命名空间使用配额来为不同的用户划分资源；例如，*某个命名空间最多能有 x 个节点*。最后，所有的命名空间对于该资源类型只能使用一个独一无二的名字。

### 命名空间命令操作

你需要安装 [Minikube][4]、[Helm][5] 和 [kubectl][6] 命令行，才能使用下面的命名空间命令。我的文章《[安全扫描你的 DevOps 流水线][7]》中有它们的安装教程，你也可以去每个项目的官方主页去找安装教程。我使用的是最新的 Minikube。手动安装很快，第一次就能成功运行。

获取你的第一组命名空间：

```
jess@Athena:~$ kubectl get namespace
NAME            STATUS   AGE
default         Active   5m23s
kube-public     Active   5m24s
kube-system     Active   5m24s
```

创建一个命名空间：

```
jess@Athena:~$ kubectl create namespace athena
namespace/athena created
```

现在开发者可以部署到你创建的命名空间了；例如，这里是一个简短的 Helm chart：

```
jess@Athena:~$ helm install teset-deploy stable/redis --namespace athena
NAME: teset-deploy
LAST DEPLOYED: Sat Nov 23 13:47:43 2019
NAMESPACE: athena
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
` Please be patient while the chart is being deployed `
Redis can be accessed via port 6379 on the following DNS names from within your cluster:

teset-deploy-redis-master.athena.svc.cluster.local for read/write operations
teset-deploy-redis-slave.athena.svc.cluster.local for read-only operations
```

获取你的密码：

```
export REDIS_PASSWORD=$(kubectl get secret --namespace athena teset-deploy-redis -o jsonpath="{.data.redis-password}" | base64 --decode)
```

连接你的 redis 服务：

1. 运行一个你可以作为客户端用的 Redis pod：

   ```bash
   kubectl run --namespace athena teset-deploy-redis-client --rm --tty -i --restart='Never' \
           --env REDIS_PASSWORD=$REDIS_PASSWORD \
           --image docker.io/bitnami/redis:5.0.7-debian-9-r0 -- bash 
   ```

2. 使用 Redis CLI 连接：

    ```bash
    redis-cli -h teset-deploy-redis-master -a $REDIS_PASSWORD
    redis-cli -h teset-deploy-redis-slave -a $REDIS_PASSWORD
    ```

从集群外连接你的数据库：

```bash
kubectl port-forward --namespace athena svc/teset-deploy-redis-master 6379:6379 &
redis-cli -h 127.0.0.1 -p 6379 -a $REDIS_PASSWORD
```

现在这一套部署已经完成了，你有一个在命名空间 `test-deploy` 中部署的 chart。

查看你的命名空间中有哪些 pod：

```
jess@Athena:~$ kubectl get pods --namespace athena
NAME                            READY   STATUS  RESTARTS   AGE
teset-deploy-redis-master-0   1/1       Running   0             2m38s
teset-deploy-redis-slave-0      1/1     Running   0             2m38s
teset-deploy-redis-slave-1      1/1     Running   0             90s
```

现在，你已经正式把你的应用隔离到了一个命名空间，创建了一个只在内部通信的虚拟集群。

一键删除所有东西：

```bash
jess@Athena:~$ kubectl delete namespace athena
namespace "athena" deleted
```

因为这会删除应用的所有内部配置，所以这个删除操作可能会持续一段时间，持续时间取决于你的部署到底有多大。

再次检查一下所有东西是否被删除了：

```bash
jess@Athena:~$ kubectl get pods --all-namespaces
NAMESPACE       NAME                            READY   STATUS  RESTARTS   AGE
kube-system   coredns-5644d7b6d9-4vxv6          1/1     Running   0             32m
kube-system   coredns-5644d7b6d9-t5wn7          1/1     Running   0             32m
kube-system   etcd-minikube                     1/1     Running   0             31m
kube-system   kube-addon-manager-minikube       1/1     Running   0             32m
kube-system   kube-apiserver-minikube           1/1     Running   0             31m
kube-system   kube-controller-manager-minikube  1/1     Running   0             31m
kube-system   kube-proxy-5tdmh                  1/1     Running   0             32m
kube-system   kube-scheduler-minikube           1/1     Running   0             31m
kube-system   storage-provisioner               1/1     Running   0             27m
```

这是一个所有 pod 及它们存在于的已知命名空间的列表。你可以看到，之前创建的应用和命名空间现在已经不在了。

### 命名空间实践

当前我是出于安全考虑才使用命名空间，如限制用户的权限。你可以限制所有的东西 —— 从哪些角色可以访问命名空间，到命名空间可使用的集群资源（CPU 等）的配额等级。例如，我通过资源配额和<ruby>基于角色的访问控制<rt>role-based access control</rt></ruby>（RBAC）配置来确保只有允许的服务账号可以访问命名空间。

对于隔离方面的安全，我不希望我的私人 Jenkins 应用可以通过一个信任的本地网络被当做一个有公共 IP 地址的安全镜像来访问（我不得不假定，可能会被侵袭）。

如果你很难提前计算出到底要在你的云平台上部署多少节点（或者，就我而言，是在[搞崩][8]我的家庭服务器之前我能部署多少个），那么命名空间在预算方面也很有用。虽然这超出了本文的讨论范围，而且很复杂，但值得你去调研和使用来防止你的集群过分扩展。

### 总结

命名空间是一个很好的隔离项目和应用的方法。本文仅是一个关于命名空间的简短介绍，所以我建议你更深入地研究下命名空间，在你的实践中更多地去使用它们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/kubernetes-namespaces

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jrepka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
[3]: https://www.weave.works/blog/gitops-operations-by-pull-request
[4]: https://kubernetes.io/docs/tasks/tools/install-minikube/
[5]: https://helm.sh/
[6]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[7]: https://opensource.com/article/19/7/security-scanning-your-devops-pipeline
[8]: https://en.wikipedia.org/wiki/Segmentation_fault
