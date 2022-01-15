[#]: subject: "A guide to Kubernetes pod eviction"
[#]: via: "https://opensource.com/article/21/12/kubernetes-pod-eviction"
[#]: author: "Orit Wasserman https://opensource.com/users/owassermredhatcom"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A guide to Kubernetes pod eviction
======
Understanding how Kubernetes prioritizes pods for eviction can help
balance resources more effectively.
![Parts, modules, containers for software][1]

One of the strengths of Kubernetes is scheduling. It handles application pod placement across nodes in a cluster and their resource allocation, so you don't have to worry about balancing resources yourself. When it runs out of resources, Kubernetes can evict pods—but how does Kubernetes decide which pod to evict?

### Kubernetes pods and resources

While a pod can hold multiple containers, for the purpose of this article, I will discuss them as a single object.

In Kubernetes, you can define the pod requirements for CPU (compute) and memory. CPU is measured in units: 1 CPU equals 1 single cloud vCPU or 1 hyperthread on bare metal. Memory is measured in bytes (e.g., Mi ****for megabytes, Gi for gigabytes, and so on).

The minimum amount of resources required for pod execution is defined in the _requests_ section of the YAML. To prevent using all the node's resources, the _limits_ section of the YAML defines the maximum resource usage. Here is an example:


```


apiVersion: v1
kind: Pod
metadata:
  name: frontend
spec:
  containers:
  - name: app
    image: images.my-company.example/app:v4
    resources:
      requests:
        memory: "64Mi"
        cpu: "250m"
      limits:
        memory: "128Mi"
        cpu: "500m"

```

When the Kubernetes scheduler wants to place the pod on a node, it first confirms which node has the available resources to fulfill its requests. Note: if you have pods on a node without defined requests, Kubernetes won't take them into account, and this may cause failures.

There are two types of resources: flexible and exact. CPU is a flexible resource and can be overprovisioned. Applications can continue to function even if they don't get the requested CPU resources but will be less performant. On the other hand, memory is an exact resource: An application cannot run without the requested amount. If my pod requests 1G of memory and can only get 0.8G, it fails with a memory allocation error when it tries to allocate the full amount.

Limits function differently than requests. Limits apply to CPUs only when the node CPU is loaded (i.e., at 100% CPU usage). This is a common scenario, and the local node operating system can handle it. But if a pod exceeds its memory limit, it will be terminated by the out-of-memory (OOM) killer.

### When does eviction happen?

This difference pertains to the way Kubernetes handles resource pressure. Kubernetes needs to evict pods if the node resources are running out, an event referred to as node-pressure eviction. When a CPU is fully utilized, the node scheduler can handle it, so eviction won't occur. However, if there is not enough available memory, it needs to evict pods from the node and try to place them in another node. This is referred to as eviction due to memory pressure. Running out of disk space can also cause node-pressure eviction.

### How does Kubernetes decide which pods to evict?

Pods are evicted according to the resource, like memory or disk space, causing the node pressure. The first pods to be evicted are those in a failed state, since they are not running but could still be using resources. After this, Kubernetes evaluates the running pods.

Evicting the pod that consumes most of the memory won't work, as most likely it is an active pod, and it will be harder to place. Instead, Kubernetes looks at two different classes to make this decision: QoS (Quality of Service) class and Priority class.

#### QoS Class

Kubernetes has three QoS classes that can be assigned to a pod:

**Guaranteed**: For every container in the pod:

  * There must be a memory limit and a memory request.
  * The memory limit must equal the memory request.
  * There must be a CPU limit and a CPU request.
  * The CPU limit must equal the CPU request.



**Burstable**: The pod does not meet the criteria for QoS class Guaranteed, but has at least one container in the pod has with a memory or CPU request

**BestEffort**: The pod must not have any containers with memory or CPU limits or requests.

The pod QoS class is determined by its lowest container QoS class.

#### Priority Class

A pod's priority class defines the importance of the pod compared to other pods running in the cluster: the higher the priority, the more important the pod. Kubernetes uses the priority class when it tries to schedule the pod. If it cannot be scheduled, it will evict a lower priority pod to make room for it.

You can set the pod preempting (eviction) policy with these categories:

  * **Never:** This pod has high priority, but Kubernetes should not evict other pods to run it. This pod can be evicted to run higher priority pods.
  * **PreemptLowerPriority:** Evict pods of a lower priority class to run this pod



The pod priority class is determined by its lowest container priority class.

The cloud platform [OKD][2] (formerly known as Minishift, and the foundation for Red Hat OpenShift) has three built-in priority classes:

  * **system-node-critical:** Pods that should never be evicted from a node
  * **system-cluster-critical**: Pods that are important to the cluster and can be evicted from the node, but only in certain circumstances
  * **cluster-logging**: Pods that must be scheduled over other apps



#### Using classes to order evictions

For disk pressure, Kubernetes uses only the pods' priority class to order their eviction, because there is no mechanism to prerequest the amount of resources before scheduling the pods. For this reason, it is important to use local persistent volumes that are CSI-based instead of host path for a pod's data.

For memory pressure, Kubernetes will try to evict pods whose usage exceeds the requests while taking into account the pod's priority class, in this order:

  1. Pods with a QoS class of BestEffort don't have any requests, so they are always considered for eviction.
  2. If pressure remains after evicting BestEffort class pods, pods are then evicted according to their priority class. Pods with the same priority are evicted according to the amount their usage level exceeds the request.
  3. If there is still pressure, Kubernetes will look to evict Guaranteed pods and Burstable pods that do not exceed requests. These pods are evicted according to their priority.



### Preventing pod eviction

How can you reduce the chance that your essential pods will be evicted?

  * Always assign priority class, as Kubernetes considers both for memory and disk pressure.
  * Avoid having pods with a BestEffort QoS class.
  * For pods with fixed memory usage, use the Guaranteed QoS class. I don't recommend using it for every pod, as it can cause inefficient memory usage. Most applications utilize the most memory when they are being loaded. Setting requests equal to limits can mean either setting higher requests to allow the pod to get the maximum amount of memory or reducing the limits so your application won't get more memory.



If you are interested in learning more about pod scheduling and eviction, you can explore the Kubernetes documentation:

  * [Scheduling, preemption, and eviction][3]
  * [Node-pressure eviction][4]
  * [Configure out of resource handling][5]



--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/kubernetes-pod-eviction

作者：[Orit Wasserman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/owassermredhatcom
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_modules_networking_hardware_parts.png?itok=rPpVj92- (Parts, modules, containers for software)
[2]: https://opensource.com/article/18/11/local-okd-cluster-linux
[3]: https://kubernetes.io/docs/concepts/scheduling-eviction/
[4]: https://kubernetes.io/docs/concepts/scheduling-eviction/node-pressure-eviction/
[5]: https://v1-20.docs.kubernetes.io/docs/tasks/administer-cluster/out-of-resource/
