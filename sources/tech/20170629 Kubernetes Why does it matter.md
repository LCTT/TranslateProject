Kubernetes: Why does it matter?
============================================================

### The Kubernetes platform for running containerized workloads takes on some of the heavy lifting when developing and deploying cloud-native applications.


![Kubernetes: Why does it matter?](https://opensource.com/sites/default/files/styles/image-full-size/public/images/law/freesoftwareway_law3.png?itok=JMOFOYFp "Kubernetes: Why does it matter?")
>Image by : opensource.com

Developing and deploying cloud-native applications has become very popular—for very good reasons. There are clear advantages to a process that allows rapid deployment and continuous delivery of bug fixes and new features, but there's a chicken-and-egg problem no one talks about: How do you get there from here? Building the infrastructure and developing processes to develop and maintain cloud-native applications—all from scratch—are non-trivial, time-intensive tasks.

[Kubernetes][3], a relatively new platform for running containerized workloads, addresses these problems. Originally an internal project within Google, Kubernetes was donated to the [Cloud Native Computing Foundation][4] in 2015 and has attracted developers from the open source community around the world. Kubernetes' design is based on 15 years of experience in running both production and development workloads. Since it is open source, anyone can download and use it and realize its benefits.

So why is such a big fuss being made over Kubernetes? I believe that it hits a sweet spot between an Infrastructure as a Service (IaaS) solution, like OpenStack, and a full Platform as a Service (PaaS) resource where the lower-level runtime implementation is completely controlled by a vendor. Kubernetes provides the benefits of both worlds: abstractions to manage infrastructure, as well as tools and features to drill down to bare metal for troubleshooting.

### IaaS vs. PaaS

OpenStack is classified by most people as an IaaS solution, where pools of physical resources, such as processors, networking, and storage, are allocated and shared among different users. Isolation between users is implemented using traditional, hardware-based virtualization.

OpenStack's REST API allows infrastructure to be created automatically using code, but therein lies the problem. The output of the IaaS product is yet more infrastructure. There's not much in the way of services to support and manage the extra infrastructure once it has been created. After a certain point, it becomes a lot of work to manage the low-level infrastructure, such as servers and IP addresses, produced by OpenStack. One well-known outcome is virtual machine (VM) sprawl, but the same concept applies to networks, cryptographic keys, and storage volumes. This leaves less time for developers to work on building and maintaining an application.

Like other cluster-based solutions, Kubernetes operates at the individual server level to implement horizontal scaling. New servers can be added easily and workloads scheduled on the hardware immediately. Similarly, servers can be removed from the cluster when they're not being utilized effectively or when maintenance is needed. Orchestration activities, such as job scheduling, health monitoring, and maintaining high availability, are other tasks automatically handled by Kubernetes.

Networking is another area that can be difficult to reliably orchestrate in an IaaS environment. Communication of IP addresses between services to link microservices can be particularly tricky. Kubernetes implements IP address management, load balancing, service discovery, and DNS name registration to provide a headache-free, transparent networking environment within the cluster.

### Designed for deployment

Once you have created the environment to run your application, there is the small matter of deploying it. Reliably deploying an application is one of those tasks that's easily said, but not easily done—not in the slightest. The huge advantage that Kubernetes has over other environments is that deployment is a first-class citizen.

There is a single command, using the Kubernetes command-line interface (CLI), that takes a description of the application and installs it on the cluster. Kubernetes implements the entire application lifecycle from initial deployment, rolling out new releases as well as rolling them back—a critical feature when things go wrong. In-progress deployments can also be paused and resumed. The advantage of having existing, built-in tools and support for application deployment, rather than building a deployment system yourself, cannot be overstated. Kubernetes users do not have to reinvent the application deployment wheel nor discover what a difficult task it is.

Kubernetes also has the facility to monitor the status of an in-progress deployment. While you can write this in an IaaS environment, like the deployment process itself, it's a surprisingly difficult task where corner cases abound.

### Designed for DevOps

As you gain more experience in developing and deploying applications for Kubernetes, you will be traveling the same path that Google and others have before you. You'll discover there are several Kubernetes features that are essential to effectively developing and troubleshooting a multi-service application.

First, Kubernetes' ability to easily examine the logs or SSH (secure shell) into a running service is vitally important. With a single command line invocation, an administrator can examine the logs of a service running under Kubernetes. This may sound like a simple task, but in an IaaS environment it's not easy unless you have already put some work into it. Large applications often have hardware and personnel dedicated just for log collection and analysis. Logging in Kubernetes may not replace a full-featured logging and metrics solution, but it provides enough to enable basic troubleshooting.

Second, Kubernetes offers built-in secret management. Another hitch known by teams who have developed their own deployment systems from scratch is that deploying sensitive data, such as passwords and API tokens, securely to VMs is hard. By making secrets first-class citizens, Kubernetes stops your team from inventing its own insecure, buggy secret-distribution system or just hardcoding credentials in deployment scripts.

Finally, there is a slew of features in Kubernetes for automatically scaling, load-balancing, and restarting your application. Again, these features are tempting targets for developers to write when using IaaS or bare metal. Scaling and health checks for your Kubernetes application are declared in the service definition, and Kubernetes ensures that the correct number of instances is running and healthy.

### Conclusion

The differences between IaaS and PaaS systems are enormous, including that PaaS can save a vast amount of development and debugging time. As a PaaS, Kubernetes implements a potent and effective set of features to help you develop, deploy, and debug cloud-native applications. Its architecture and design represent decades of hard-won experience that can your team can take advantage of—for free.

--------------------------------------------------------------------------------

作者简介：

Tim Potter - Tim is a senior software engineer working at Hewlett Packard Enterprise. He has been a contributor to free and open source software for nearly two decades working on a variety of projects including Samba, Wireshark, OpenPegasus, and Docker. Tim blogs at https://elegantinfrastructure.com/ about Docker, Kubernetes and other infrastructure-related topics.

-----


via: https://opensource.com/article/17/6/introducing-kubernetes

作者：[ Tim Potter][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tpot
[1]:https://opensource.com/article/17/6/introducing-kubernetes?rate=RPoUoHXYQXbTb7DHQCDsHgR1ZcfLSoquZ8xVZzfMtxM
[2]:https://opensource.com/user/63281/feed
[3]:https://kubernetes.io/
[4]:https://www.cncf.io/
[5]:https://opensource.com/users/tpot
