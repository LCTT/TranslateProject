[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 reasons to use Kubernetes)
[#]: via: (https://opensource.com/article/19/6/reasons-kubernetes)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

5 reasons to use Kubernetes
======
Kubernetes solves some of the most common problems development and
operations teams see every day.
![][1]

[Kubernetes][2] is the de facto open source container orchestration tool for enterprises. It provides application deployment, scaling, container management, and other capabilities, and it enables enterprises to optimize hardware resource utilization and increase production uptime through fault-tolerant functionality at speed. The project was initially developed by Google, which donated the project to the [Cloud-Native Computing Foundation][3]. In 2018, it became the first CNCF project to [graduate][4].

This is all well and good, but it doesn't explain why development and operations should invest their valuable time and effort in Kubernetes. The reason Kubernetes is so useful is that it helps dev and ops quickly solve the problems they struggle with every day.

Following are five ways Kubernetes' capabilities help dev and ops professionals address their most common problems.

### 1\. Vendor-agnostic

Many public cloud providers not only serve managed Kubernetes services but also lots of cloud products built on top of those services for on-premises application container orchestration. Being vendor-agnostic enables operators to design, build, and manage multi-cloud and hybrid cloud platforms easily and safely without risk of vendor lock-in. Kubernetes also eliminates the ops team's worries about a complex multi/hybrid cloud strategy.

### 2\. Service discovery

To develop microservices applications, Java developers must control service availability (in terms of whether the application is ready to serve a function) and ensure the service continues living, without any exceptions, in response to the client's requests. Kubernetes' [service discovery feature][5] means developers don't have to manage these things on their own anymore.

### 3\. Invocation

How would your DevOps initiative deploy polyglot, cloud-native apps over thousands of virtual machines? Ideally, dev and ops could trigger deployments for bug fixes, function enhancements, new features, and security patches. Kubernetes' [deployment feature][6] automates this daily work. More importantly, it enables advanced deployment strategies, such as [blue-green and canary][7] deployments.

### 4\. Elasticity

Autoscaling is the key capability needed to handle massive workloads in cloud environments. By building a container platform, you can increase system reliability for end users. [Kubernetes Horizontal Pod Autoscaler][8] (HPA) allows a cluster to increase or decrease the number of applications (or Pods) to deal with peak traffic or performance spikes, reducing concerns about unexpected system outages.

### 5\. Resilience

In a modern application architecture, failure-handling codes should be considered to control unexpected errors and recover from them quickly. But it takes a lot of time and effort for developers to simulate all the occasional errors. Kubernetes' [ReplicaSet][9] helps developers solve this problem by ensuring a specified number of Pods are kept alive continuously.

### Conclusion

Kubernetes enables enterprises to solve common dev and ops problems easily, quickly, and safely. It also provides other benefits, such as building a seamless multi/hybrid cloud strategy, saving infrastructure costs, and speeding time to market.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/reasons-kubernetes

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_wheel_gear_devops_kubernetes.png?itok=xm4a74Kv
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://www.cncf.io/projects/
[4]: https://www.cncf.io/blog/2018/03/06/kubernetes-first-cncf-project-graduate/
[5]: https://kubernetes.io/docs/concepts/services-networking/service/
[6]: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
[7]: https://opensource.com/article/17/5/colorful-deployments
[8]: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
[9]: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/
