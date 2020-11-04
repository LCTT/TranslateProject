[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How the Kubernetes scheduler works)
[#]: via: (https://opensource.com/article/20/11/kubernetes-scheduler)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

How the Kubernetes scheduler works
======
Understand how the Kubernetes scheduler discovers new pods and assigns
them to nodes.
![Parts, modules, containers for software][1]

[Kubernetes][2] has emerged as the standard orchestration engine for containers and containerized workloads. It provides a common, open source abstraction layer that spans public and private cloud environments.

For those already familiar with Kubernetes and its components, the conversation is usually around maximizing Kubernetes' power. But when you're just learning Kubernetes, it's wise to begin with some general knowledge about Kubernetes and its components (including the [Kubernetes scheduler][3]), as shown in this high-level view, before trying to use it in production.

![][4]

Kubernetes also uses control planes and nodes.

  1. **Control plane:** Also known as master, these nodes are responsible for making global decisions about the clusters and detecting or responding to cluster events. The control plane components are:
    * etcd
    * kube-apiserver 
    * kube-controller-manager
    * scheduler
  2. **Nodes:** Also called worker nodes, these sets of nodes are where a workload resides. They should always talk to the control plane to get the information necessary for the workload to run and to communicate and connect outside the cluster. Worker nodes' components are:
    * kubelet
    * kube-proxy
    * container runtime Interface.



I hope this background helps you understand how the Kubernetes components are stacked together.

### How Kubernetes scheduler works

A Kubernetes [pod][5] is comprised of one or more containers with shared storage and network resources. The Kubernetes scheduler's task is to ensure that each pod is assigned to a node to run on.

At a high level, here is how the Kubernetes scheduler works:

  1. Every pod that needs to be scheduled is added to a queue
  2. When new pods are created, they are also added to the queue
  3. The scheduler continuously takes pods off that queue and schedules them



The [scheduler's code][6] (`scheduler.go`) is large, around 9,000 lines, and fairly complex, but the important bits to tackle are:

  1. **Code that waits/watches for pod creation**
The code that watches for pod creation begins on line 8970 of `scheduler.go`; it waits indefinitely for new pods:


```
// Run begins watching and scheduling. It waits for cache to be synced, then starts a goroutine and returns immediately.

func (sched *Scheduler) Run() {
        if !sched.config.WaitForCacheSync() {
                return
        }

        go wait.Until(sched.scheduleOne, 0, sched.config.StopEverything)
```

  2. **Code that is responsible for queuing the pod**
The function responsible for pod queuing is:


```
// queue for pods that need scheduling
        podQueue *cache.FIFO
```

The code responsible for queuing the pod begins on line 7360 of `scheduler.go`. When the event handler is triggered to indicate that a new pod is available, this piece of code automatically puts the new pod in the queue:


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

  3. **Code that handles errors**
You will inevitably encounter scheduling errors in pod scheduling. The following code is how the scheduler handles the errors. It listens to `podInformer` and then spits out an error that the pod was not scheduled and terminates:


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




In other words, the Kubernetes scheduler is responsible for:

  * Scheduling the newly created pods on nodes with enough space to satisfy the pod's resource needs
  * Listening to the kube-apiserver and the controller for the presence of newly created pods and then scheduling them to an available node on the cluster
  * Watching for unscheduled pods and binding them to nodes by using the `/binding` pod sub-resource API.



For example, imagine an application is being deployed that requires 1GB of memory and two CPU cores. Therefore, the pods for the application are created on a node that has enough resources available. Then, the scheduler continues to run forever, watching to see if there are pods that need to be scheduled.

### Learn more

To have a working Kubernetes cluster, you need to get all the components above working together in sync. The scheduler is a complex piece of code, but Kubernetes is awesome software, and currently, it's the default choice when talking about adopting cloud-native applications.

Learning Kubernetes requires time and effort, but having it as one of your skills will give you an edge that should bring rewards in your career. There are a lot of good learning resources available, and the [documentation][7] is good. If you are interested in learning more, I recommend starting with:

  * [Kubernetes the hard way][8]
  * [Kubernetes the hard way on bare metal][9]
  * [Kubernetes the hard way on AWS][10]



What are your favorite ways to learn about Kubernetes? Please share in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/kubernetes-scheduler

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
