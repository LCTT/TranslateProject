[#]: collector: (lujun9972)
[#]: translator: (MZqk)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How the Kubernetes scheduler works)
[#]: via: (https://opensource.com/article/20/11/kubernetes-scheduler)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

Kubernetes 调度器是如何工作的
=====
了解 Kubernetes 调度器是如何发现新的 pod 并将其分配到节点。
![Parts, modules, containers for software][1]

[Kubernetes][2] 作为容器和容器化工作负载标的准编标准引擎出现。它供提供一个了通用、开放的抽象层，跨公有云和私有云的环境。

对于那些已经熟悉 Kuberbetes 及其组件的人，他们讨论通常围绕着最大化使用 Kuberbetes 的功能。但当您只是 Kubernetes 初学者时或尝试在生产环境中使用前，明智的做法是从一些关于 Kubernetes 相关组件（包括 [Kubernetes 调度器][3]） 开始学习，如下抽象视图中所示。

![][4]

Kubernetes 也分为控制平面和节点。

  1. **控制平面：** 也称为 Master，负责对群集做出全局决策，以及检测和响应集群事件。控制平面组件包括：
   * etcd
   * kube-apiserver 
   * kube-controller-manager
   * scheduler
  2. **工作节点：** 也称 Node，是工作负载所在的位置。它始终和 Master 联系，以获取工作负载运行、集群外部进行通讯和连接所需的信息。工作节点组件包括：
   * kubelet
   * kube-proxy
   * CRI



我希望在这种背景下可以帮助您理解 Kubernetes 组件是如何关联在一起的。

### Kubernetes 调度器是如何工作的

Kubernetes [pod][5] 由一个或多个容器组成组成，共享存储和网络资源。Kubernetes 调度器的任务是确保每个 pod 分配到节点上运行。

在更深层次下，Kubernetes 调度器的工作方式是这样的：

  1. 每个被调度的 pod 都需要加入到队列
  2. 新的 pod 被创建后，它们也会加入到队列
  3. 调度器持续从队列中取出 pod 并对其进行调度



[调度器源码][6] (`scheduler.go`) 很大，约 9000 行，且相当复杂，但解决了重要问题：

  1. **等待/监视 pod 创建的代码**
监视 pod 创建的代码 `scheduler.go` 从 8970 行开始，它持续等待新的 pod：


```
// Run begins watching and scheduling. It waits for cache to be synced, then starts a goroutine and returns immediately.

func (sched *Scheduler) Run() {
        if !sched.config.WaitForCacheSync() {
                return
        }

        go wait.Until(sched.scheduleOne, 0, sched.config.StopEverything)
```

  2. **负责对 pod 进行排队的代码**
负责 pod 进行排队的功能是：


```
// queue for pods that need scheduling
        podQueue *cache.FIFO
```

负责 pod 进行排队的代码从 7360 行开始 `scheduler.go`。当新的 pod 显示可用时事件处理程序触发，这段代码将新的 pod 加入队列中：


```
func (f *ConfigFactory) getNextPod() *v1.Pod {
        for {
                pod := cache.Pop(f.podQueue).(*v1.Pod)
                if f.ResponsibleForPod(pod) {
                        glog.V(4).Infof("About to try and schedule pod %v", pod.Name)
                        return pod
                }
        }
}
```

  3. **处理错误代码**
在 pod 调度中您不可避免会遇到调度错误。以下代码是处理调度程序错误的方法。它监听 `podInformer` 然后抛出一个错误，提示此 pod 尚未调度并被终止：


```
// scheduled pod cache
        podInformer.Informer().AddEventHandler(
                cache.FilteringResourceEventHandler{
                        FilterFunc: func(obj interface{}) bool {
                                switch t := obj.(type) {
                                case *v1.Pod:
                                        return assignedNonTerminatedPod(t)
                                default:
                                        runtime.HandleError(fmt.Errorf("unable to handle object in %T: %T", c, obj))
                                        return false
                                }
                        },
```




I换句话说，Kubernetes 调度器负责如下：

  * 将新创建的 pod 调度至具有足够空间的节点上，以满足 pod 的资源需求。
  * 监听 kube-apiserver 和控制器是否创建新的 pod，然后调度它至集群内一个可用的节点。
  * 监听未安排的 pod，并使用 `/binding` 子资源 API 将 pod 绑定至节点。



例如，假设正在部署一个需要 1 GB 内存和双核 CPU 的应用。因此创建应用 pod 的节点上需有足够资源可用，然后调度器会持续运行监听是否有 pod 需要调度。

### 了解更多

要使 Kubernetes 集群工作，你需要使用以上所有组件一起同步运行。调度器有一段复杂的的代码，但是 Kubernetes 是一个很棒的软件，目前它仍是我们在讨论或采用云原生应用程序时的首选。

学习 Kubernetes 需要精力和时间，但是将其作为您的专业技能之一能为您的职业生涯带来优势和回报。有很多很好的学习资源可供使用，而且[官方文档][7]也很棒。如果您有兴趣了解更多，建议从以下内容开始：

  * [Kubernetes the hard way][8]
  * [Kubernetes the hard way on bare metal][9]
  * [Kubernetes the hard way on AWS][10]



你喜欢的 Kubernetes 学习方法是什么？请在评论中分享吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/kubernetes-scheduler

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/MZqk)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_modules_networking_hardware_parts.png?itok=rPpVj92- (Parts, modules, containers for software)
[2]: https://kubernetes.io/
[3]: https://kubernetes.io/docs/concepts/scheduling-eviction/kube-scheduler/
[4]: https://lh4.googleusercontent.com/egB0SSsAglwrZeWpIgX7MDF6u12oxujfoyY6uIPa8WLqeVHb8TYY_how57B4iqByELxvitaH6-zjAh795wxAB8zenOwoz2YSMIFRqHsMWD9ohvUTc3fNLCzo30r7lUynIHqcQIwmtRo
[5]: https://kubernetes.io/docs/concepts/workloads/pods/
[6]: https://github.com/kubernetes/kubernetes/blob/e4551d50e57c089aab6f67333412d3ca64bc09ae/plugin/pkg/scheduler/scheduler.go
[7]: https://kubernetes.io/docs/home/
[8]: https://github.com/kelseyhightower/kubernetes-the-hard-way
[9]: https://github.com/Praqma/LearnKubernetes/blob/master/kamran/Kubernetes-The-Hard-Way-on-BareMetal.md
[10]: https://github.com/Praqma/LearnKubernetes/blob/master/kamran/Kubernetes-The-Hard-Way-on-AWS.md
