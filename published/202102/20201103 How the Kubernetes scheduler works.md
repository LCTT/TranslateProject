[#]: collector: (lujun9972)
[#]: translator: (MZqk)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13155-1.html)
[#]: subject: (How the Kubernetes scheduler works)
[#]: via: (https://opensource.com/article/20/11/kubernetes-scheduler)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

Kubernetes 调度器是如何工作的
=====

> 了解 Kubernetes 调度器是如何发现新的吊舱并将其分配到节点。

![](https://img.linux.net.cn/data/attachment/album/202102/26/123446popgvrc0vppptvtk.jpg)

[Kubernetes][2] 已经成为容器和容器化工作负载的标准编排引擎。它提供一个跨公有云和私有云环境的通用和开源的抽象层。

对于那些已经熟悉 Kuberbetes 及其组件的人，他们的讨论通常围绕着如何尽量发挥 Kuberbetes 的功能。但当你刚刚开始学习 Kubernetes 时，尝试在生产环境中使用前，明智的做法是从一些关于 Kubernetes 相关组件（包括 [Kubernetes 调度器][3]） 开始学习，如下抽象视图中所示：

![][4]

Kubernetes 也分为控制平面和工作节点：

  1. **控制平面：** 也称为主控，负责对集群做出全局决策，以及检测和响应集群事件。控制平面组件包括：
   * etcd
   * kube-apiserver 
   * kube-controller-manager
   * 调度器
  2. **工作节点：** 也称节点，这些节点是工作负载所在的位置。它始终和主控联系，以获取工作负载运行所需的信息，并与集群外部进行通讯和连接。工作节点组件包括：
   * kubelet
   * kube-proxy
   * CRI

我希望这个背景信息可以帮助你理解 Kubernetes 组件是如何关联在一起的。

### Kubernetes 调度器是如何工作的

Kubernetes <ruby>[吊舱][5]<rt>pod</rt></ruby> 由一个或多个容器组成组成，共享存储和网络资源。Kubernetes 调度器的任务是确保每个吊舱分配到一个节点上运行。

（LCTT 译注：容器技术领域大量使用了航海比喻，pod 一词，意为“豆荚”，在航海领域指“吊舱” —— 均指盛装多个物品的容器。常不翻译，考虑前后文，可译做“吊舱”。）

在更高层面下，Kubernetes 调度器的工作方式是这样的：

  1. 每个需要被调度的吊舱都需要加入到队列
  2. 新的吊舱被创建后，它们也会加入到队列
  3. 调度器持续地从队列中取出吊舱并对其进行调度

[调度器源码][6]（`scheduler.go`）很大，约 9000 行，且相当复杂，但解决了重要问题：

#### 等待/监视吊舱创建的代码

监视吊舱创建的代码始于 `scheduler.go` 的 8970 行，它持续等待新的吊舱：

```
// Run begins watching and scheduling. It waits for cache to be synced, then starts a goroutine and returns immediately.

func (sched *Scheduler) Run() {
        if !sched.config.WaitForCacheSync() {
                return
        }

        go wait.Until(sched.scheduleOne, 0, sched.config.StopEverything)
```

#### 负责对吊舱进行排队的代码

负责对吊舱进行排队的功能是：

```
// queue for pods that need scheduling
        podQueue *cache.FIFO
```

负责对吊舱进行排队的代码始于 `scheduler.go` 的 7360 行。当事件处理程序触发，表明新的吊舱显示可用时，这段代码将新的吊舱加入队列中：

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

#### 处理错误代码

在吊舱调度中不可避免会遇到调度错误。以下代码是处理调度程序错误的方法。它监听 `podInformer` 然后抛出一个错误，提示此吊舱尚未调度并被终止：

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

换句话说，Kubernetes 调度器负责如下：

  * 将新创建的吊舱调度至具有足够空间的节点上，以满足吊舱的资源需求。
  * 监听 kube-apiserver 和控制器是否创建新的吊舱，然后调度它至集群内一个可用的节点。
  * 监听未调度的吊舱，并使用 `/binding` 子资源 API 将吊舱绑定至节点。

例如，假设正在部署一个需要 1 GB 内存和双核 CPU 的应用。因此创建应用吊舱的节点上需有足够资源可用，然后调度器会持续运行监听是否有吊舱需要调度。

### 了解更多

要使 Kubernetes 集群工作，你需要使以上所有组件一起同步运行。调度器有一段复杂的的代码，但 Kubernetes 是一个很棒的软件，目前它仍是我们在讨论或采用云原生应用程序时的首选。

学习 Kubernetes 需要精力和时间，但是将其作为你的专业技能之一能为你的职业生涯带来优势和回报。有很多很好的学习资源可供使用，而且 [官方文档][7] 也很棒。如果你有兴趣了解更多，建议从以下内容开始：

  * [Kubernetes the hard way][8]
  * [Kubernetes the hard way on bare metal][9]
  * [Kubernetes the hard way on AWS][10]

你喜欢的 Kubernetes 学习方法是什么？请在评论中分享吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/kubernetes-scheduler

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[MZqk](https://github.com/MZqk)
校对：[wxy](https://github.com/wxy)

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
