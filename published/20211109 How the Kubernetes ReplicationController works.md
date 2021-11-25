[#]: subject: "How the Kubernetes ReplicationController works"
[#]: via: "https://opensource.com/article/21/11/kubernetes-replicationcontroller"
[#]: author: "Mike Calizo https://opensource.com/users/mcalizo"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14018-1.html"

Kubernetes 复制控制器如何工作
======

> 复制控制器负责管理吊舱的生命周期并确保在任何时候运行着所需的指定数量的吊舱。

![](https://img.linux.net.cn/data/attachment/album/202111/25/131052ltjaz53jqkfamthh.jpg)

你有没有想过，谁负责监督和管理 Kubernetes 集群内运行的“<ruby>吊舱<rt>pod</rt></ruby>”的确切数量？Kubernetes 可以通过多种方式做到这一点，但一个常见的方法是使用 “<ruby>复制控制器<rt>ReplicationController</rt></ruby>（RC）”。RC 负责管理吊舱的生命周期，并确保在任何时候运行着所需的指定数量的吊舱。但另一方面，它不负责高级的集群能力，如执行自动扩展、准备度和活跃探测以及其他高级的复制能力。Kubernetes 集群中的其他组件可以更好地执行这些功能。

简而言之，RC 的职责有限，通常用于不需要复杂逻辑就能达到某些要求的具体实现（例如，确保所需的吊舱数量总是与指定的数量相符）。如果超过了所需的数量，RC 会删除多余的，并确保即使在节点故障或吊舱终止的情况下，也有相同数量的存在。

简单的事情不需要复杂的解决方案，对我来说，这就是 RC 如何被使用的一个完美的比喻。

### 如何创建一个 RC

像大多数 Kubernetes 资源一样，你可以使用 YAML 或 JSON 格式创建一个 RC，然后将其发布到 Kubernetes API 端点。

```
$ kubectl create -f rcexample.yaml
 replicationcontroller/rcexample created
```

现在，我将深入一下 `rcexample.yaml` 的样子。

```
apiVersion: v1
kind: ReplicationController   →  RC 描述符    
metadata:
 name: rcexample            →  复制控制器名字              
spec:
 replicas: 3                 → 预期的吊舱数量      
 selector:                  → 这个 RC 的吊舱选择器
   app: nginx                        
 template:                  → 用于创建新吊舱的模板    
   metadata:                        
     labels:                        
       app: nginx                    
   spec:                            
     containers:                    
     - name: nginx                  
       image: nginx
```

进一步解释，这个文件在执行时创建了一个名为 `rcexample` 的 RC，确保三个名为 `nginx` 的吊舱实例一直在运行。如果一个或所有的 `app=nginx` 吊舱没有运行，新的吊舱将根据定义的吊舱模板创建。

一个 RC 有三个部分：

  * 复制品：`3`
  * 吊舱模板：`app=nginx`
  * 吊舱选择器：`app=nginx`

注意，吊舱模板要与吊舱选择器相匹配，以防止 RC 一直创建吊舱。如果你创建的 RC 的吊舱选择器与模板不匹配，Kubernetes API 服务器会给你一个错误。

为了验证 RC `rcexample` 是否被创建：

```
$ kubectl get po
NAME     READY   STATUS       RESTARTS  AGE
rcexample-53thy  0/1  Running         0     10s
rcexample-k0xz6  0/1  Running         0     10s
rcexample-q3vkg  0/1  Running         0     10s
```

要删除 RC：

```
$ kubectl delete rc rcexample
 replicationcontroller "rcexample" deleted
```

注意，你可以对 RC 中的服务使用 [滚动更新][2] 策略，逐个替换吊舱。

### 其他复制容器的方法

在 Kubernetes 部署中，有多种方法可以实现容器的复制。Kubernetes 成为容器平台的主要选择的主要原因之一是复制容器以获得可靠性、负载平衡和扩展的原生能力。

我在上面展示了你如何轻松地创建一个 RC，以确保在任何时候都有一定数量的吊舱可用。你可以通过更新副本的数量来手动扩展吊舱。

另一种可能的方法是通过使用 “<ruby>[复制集][3]<rt>ReplicaSet</rt></ruby>（RS）”来达到复制的目的。

```
(kind: ReplicaSet)
```

RS 的功能几乎与 RC 相同。主要区别在于，RS 不允许滚动更新策略。

另一种实现复制的方法是通过使用 “<ruby>[部署][4]<rt>Deployments</rt></ruby>”。

```
(kind: Deployment)
```

部署是一种更高级的容器复制方法。从功能上讲，部署提供了相同的功能，但在需要时可以推出和回滚变化。这种功能之所以能够实现，是因为部署有 “<ruby>策略类型<rt>StrategyType</rt></ruby>” 规范来用新的吊舱替换旧的吊舱。你可以定义两种类型的部署策略：“<ruby>重新创建<rt>Recreate</rt></ruby>” 和 “<ruby>滚动更新<rt>RollingUpdate</rt></ruby>”。你可以如下指定部署策略：

```
StrategyType: RollingUpdate
```

### 总结

容器的复制功能是大多数企业考虑采用 Kubernetes 的主要原因之一。复制可以让你达到大多数关键应用程序需要的可靠性和可扩展性，作为生产的最低要求。

了解在 Kubernetes 集群中使用哪些方法来实现复制，对于决定哪种方法最适合你的应用架构考虑非常重要。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/kubernetes-replicationcontroller

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/kubernetes_containers_ship_lead.png?itok=9EUnSwci (Ships at sea on the web)
[2]: https://kubernetes.io/docs/tutorials/kubernetes-basics/update/update-intro/
[3]: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/
[4]: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
