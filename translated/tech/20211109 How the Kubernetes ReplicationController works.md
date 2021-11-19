[#]: subject: "How the Kubernetes ReplicationController works"
[#]: via: "https://opensource.com/article/21/11/kubernetes-replicationcontroller"
[#]: author: "Mike Calizo https://opensource.com/users/mcalizo"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Kubernetes ReplicationController 如何工作
======
ReplicationController 负责管理 pod 的生命周期并确保所需的指定数量的 pod 在任何时候都在运行。
![Ships at sea on the web][1]

你有没有想过，谁负责监督和管理 Kubernetes 集群内运行的 pod 的确切数量？Kubernetes 可以通过多种方式做到这一点，但一个常见的方法是使用 ReplicationController（rc）。ReplicationController 负责管理 pod 的生命周期，并确保在任何时候都能运行所需的指定数量的 pod。另一方面，它不负责高级的集群能力，如执行自动扩展、准备度和活跃探测以及其他高级的复制能力。Kubernetes 集群中的其他组件可以更好地执行这些功能。

简而言之，ReplicationController 的职责有限，通常用于不需要复杂逻辑就能达到某些要求的具体实现（例如，确保所需的 pod 数量总是与指定的数量相符）。如果超过了所需的数量，ReplicationController 会删除多余的，并确保即使在节点故障或 pod 终止的情况下，也有相同数量的 pod 存在。

简单的事情不需要复杂的解决方案，对我来说，这就是 ReplicationController 如何被使用的一个完美的比喻。

### 如何创建一个 ReplicationController

像大多数 Kubernetes 资源一样，你可以使用 YAML 或 JSON 格式创建一个 ReplicationController，然后将其发布到 Kubernetes API 端点。


```


$ kubectl create -f rcexample.yaml
 replicationcontroller/rcexample created

```

现在，我将深入一下 `rcexample.yaml` 的样子。


```


apiVersion: v1
kind: ReplicationController  → rc descriptor  
metadata:
name: rcexample      → Name of the replication controller       
spec:
replicas: 3         → Desired number of pods   
selector:         → The pod selector for this rc    
 app: nginx            
template:         → The template for creating a new pod    
 metadata:            
  labels:            
   app: nginx          
 spec:              
  containers:          
  - name: nginx         
   image: nginx

```

为了进一步解释，这个文件在执行时创建了一个名为 `rcexample` 的 ReplicationController，确保三个名为 `nginx` 的 pod 实例一直在运行。如果一个或所有的pod `app=nginx` 没有运行，新的 pod 将根据定义的 pod 模板创建。

一个 ReplicationController 有三个部分：

  * Replica：3
  * Pod Template：app=nginx
  * Pod Selector：app=nginx



注意，Pod Template 要与 Pod Selector 相匹配，以防止 ReplicationController 无限期地创建 pod。如果你创建的 ReplicationController 的 pod selector 与 template 不匹配，Kubernetes API 服务器会给你一个错误。

为了验证 ReplicationController `rcexample` 是否被创建：


```


$ kubectl get po
NAME     READY   STATUS       RESTARTS  AGE
rcexample-53thy  0/1  Running         0     10s
rcexample-k0xz6  0/1  Running         0     10s
rcexample-q3vkg  0/1  Running         0     10s

```

要删除 ReplicationController：


```


$ kubectl delete rc rcexample
 replicationcontroller "rcexample" deleted

```

注意，你可以对 ReplicationController 中的服务使用[滚动更新][2]策略，逐个替换 pod。

### 其他复制容器的方法

在 Kubernetes 部署中，有多种方法可以实现容器的复制。Kubernetes 成为容器平台的主要选择的主要原因之一是复制容器以获得可靠性、负载平衡和扩展的原生能力。

我在上面展示了你如何轻松地创建一个 ReplicationController，以确保在任何时候都有一定数量的 pod 可用。你可以通过更新副本的数量来手动扩展 pod。

另一种可能的方法是通过使用 [ReplicaSet][3] 来达到复制的目的。


```
`(kind: ReplicaSet)`
```

ReplicaSet（rs） 的功能几乎与 ReplicationController 相同。主要区别在于，ReplicaSet 不允许滚动更新策略。

另一种实现复制的方法是通过使用 [Deployments][4]。


```
`(kind: Deployment)`
```

Deployments 是一种更高级的容器复制方法。从功能上讲，Deployments 提供了相同的功能，但在需要时可以推出和回滚变化。这种功能之所以能够实现，是因为 Deployments 有 StrategyType 规范来用新的 pod 替换旧的 pod。你可以定义两种类型的部署策略：Recreate 和 RollingUpdate。你可以如下指定部署策略：


```
`StrategyType: RollingUpdate`
```

### 总结

容器的复制是大多数企业考虑采用 Kubernetes 的主要原因之一。复制可以让你达到大多数关键应用程序需要的可靠性和可扩展性，作为生产的最低要求。

了解在 Kubernetes 集群中使用哪些方法来实现复制对于决定哪种方法最适合你的应用架构考虑非常重要。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/kubernetes-replicationcontroller

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kubernetes_containers_ship_lead.png?itok=9EUnSwci (Ships at sea on the web)
[2]: https://kubernetes.io/docs/tutorials/kubernetes-basics/update/update-intro/
[3]: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/
[4]: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
