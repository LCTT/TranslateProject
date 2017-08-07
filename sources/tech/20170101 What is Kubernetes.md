What is Kubernetes?
============================================================

This page is an overview of Kubernetes.

*   [Kubernetes is][6]

*   [Why containers?][7]
    *   [Why do I need Kubernetes and what can it do?][1]

    *   [How is Kubernetes a platform?][2]

    *   [What Kubernetes is not][3]

    *   [What does  _Kubernetes_  mean? K8s?][4]

*   [What’s next][8]

Kubernetes is an [open-source platform for automating deployment, scaling, and operations of application containers][25] across clusters of hosts, providing container-centric infrastructure.

With Kubernetes, you are able to quickly and efficiently respond to customer demand:

*   Deploy your applications quickly and predictably.

*   Scale your applications on the fly.

*   Roll out new features seamlessly.

*   Limit hardware usage to required resources only.

Our goal is to foster an ecosystem of components and tools that relieve the burden of running applications in public and private clouds.

#### Kubernetes is

*   **Portable**: public, private, hybrid, multi-cloud

*   **Extensible**: modular, pluggable, hookable, composable

*   **Self-healing**: auto-placement, auto-restart, auto-replication, auto-scaling

Google started the Kubernetes project in 2014\. Kubernetes builds upon a [decade and a half of experience that Google has with running production workloads at scale][26], combined with best-of-breed ideas and practices from the community.

### Why containers?

Looking for reasons why you should be using [containers][27]?

![Why Containers?](https://d33wubrfki0l68.cloudfront.net/e7b766e0175f30ae37f7e0e349b87cfe2034a1ae/3e391/images/docs/why_containers.svg)

The  _Old Way_  to deploy applications was to install the applications on a host using the operating system package manager. This had the disadvantage of entangling the applications’ executables, configuration, libraries, and lifecycles with each other and with the host OS. One could build immutable virtual-machine images in order to achieve predictable rollouts and rollbacks, but VMs are heavyweight and non-portable.

The  _New Way_  is to deploy containers based on operating-system-level virtualization rather than hardware virtualization. These containers are isolated from each other and from the host: they have their own filesystems, they can’t see each others’ processes, and their computational resource usage can be bounded. They are easier to build than VMs, and because they are decoupled from the underlying infrastructure and from the host filesystem, they are portable across clouds and OS distributions.

Because containers are small and fast, one application can be packed in each container image. This one-to-one application-to-image relationship unlocks the full benefits of containers. With containers, immutable container images can be created at build/release time rather than deployment time, since each application doesn’t need to be composed with the rest of the application stack, nor married to the production infrastructure environment. Generating container images at build/release time enables a consistent environment to be carried from development into production. Similarly, containers are vastly more transparent than VMs, which facilitates monitoring and management. This is especially true when the containers’ process lifecycles are managed by the infrastructure rather than hidden by a process supervisor inside the container. Finally, with a single application per container, managing the containers becomes tantamount to managing deployment of the application.

Summary of container benefits:

*   **Agile application creation and deployment**: Increased ease and efficiency of container image creation compared to VM image use.

*   **Continuous development, integration, and deployment**: Provides for reliable and frequent container image build and deployment with quick and easy rollbacks (due to image immutability).

*   **Dev and Ops separation of concerns**: Create application container images at build/release time rather than deployment time, thereby decoupling applications from infrastructure.

*   **Environmental consistency across development, testing, and production**: Runs the same on a laptop as it does in the cloud.

*   **Cloud and OS distribution portability**: Runs on Ubuntu, RHEL, CoreOS, on-prem, Google Container Engine, and anywhere else.

*   **Application-centric management**: Raises the level of abstraction from running an OS on virtual hardware to run an application on an OS using logical resources.

*   **Loosely coupled, distributed, elastic, liberated [micro-services][5]**: Applications are broken into smaller, independent pieces and can be deployed and managed dynamically – not a fat monolithic stack running on one big single-purpose machine.

*   **Resource isolation**: Predictable application performance.

*   **Resource utilization**: High efficiency and density.

#### Why do I need Kubernetes and what can it do?

At a minimum, Kubernetes can schedule and run application containers on clusters of physical or virtual machines. However, Kubernetes also allows developers to ‘cut the cord’ to physical and virtual machines, moving from a **host-centric** infrastructure to a **container-centric** infrastructure, which provides the full advantages and benefits inherent to containers. Kubernetes provides the infrastructure to build a truly **container-centric** development environment.

Kubernetes satisfies a number of common needs of applications running in production, such as:

*   [Co-locating helper processes][9], facilitating composite applications and preserving the one-application-per-container model

*   [Mounting storage systems][10]

*   [Distributing secrets][11]

*   [Checking application health][12]

*   [Replicating application instances][13]

*   [Using Horizontal Pod Autoscaling][14]

*   [Naming and discovering][15]

*   [Balancing loads][16]

*   [Rolling updates][17]

*   [Monitoring resources][18]

*   [Accessing and ingesting logs][19]

*   [Debugging applications][20]

*   [Providing authentication and authorization][21]

This provides the simplicity of Platform as a Service (PaaS) with the flexibility of Infrastructure as a Service (IaaS), and facilitates portability across infrastructure providers.

#### How is Kubernetes a platform?

Even though Kubernetes provides a lot of functionality, there are always new scenarios that would benefit from new features. Application-specific workflows can be streamlined to accelerate developer velocity. Ad hoc orchestration that is acceptable initially often requires robust automation at scale. This is why Kubernetes was also designed to serve as a platform for building an ecosystem of components and tools to make it easier to deploy, scale, and manage applications.

[Labels][28] empower users to organize their resources however they please. [Annotations][29]enable users to decorate resources with custom information to facilitate their workflows and provide an easy way for management tools to checkpoint state.

Additionally, the [Kubernetes control plane][30] is built upon the same [APIs][31] that are available to developers and users. Users can write their own controllers, such as [schedulers][32], with [their own APIs][33] that can be targeted by a general-purpose [command-line tool][34].

This [design][35] has enabled a number of other systems to build atop Kubernetes.

#### What Kubernetes is not

Kubernetes is not a traditional, all-inclusive PaaS (Platform as a Service) system. It preserves user choice where it is important.

Kubernetes:

*   Does not limit the types of applications supported. It does not dictate application frameworks (e.g., [Wildfly][22]), restrict the set of supported language runtimes (for example, Java, Python, Ruby), cater to only [12-factor applications][23], nor distinguish  _apps_  from  _services_ . Kubernetes aims to support an extremely diverse variety of workloads, including stateless, stateful, and data-processing workloads. If an application can run in a container, it should run great on Kubernetes.

*   Does not provide middleware (e.g., message buses), data-processing frameworks (for example, Spark), databases (e.g., mysql), nor cluster storage systems (e.g., Ceph) as built-in services. Such applications run on Kubernetes.

*   Does not have a click-to-deploy service marketplace.

*   Does not deploy source code and does not build your application. Continuous Integration (CI) workflow is an area where different users and projects have their own requirements and preferences, so it supports layering CI workflows on Kubernetes but doesn’t dictate how layering should work.

*   Allows users to choose their logging, monitoring, and alerting systems. (It provides some integrations as proof of concept.)

*   Does not provide nor mandate a comprehensive application configuration language/system (for example, [jsonnet][24]).

*   Does not provide nor adopt any comprehensive machine configuration, maintenance, management, or self-healing systems.

On the other hand, a number of PaaS systems run  _on_  Kubernetes, such as [Openshift][36], [Deis][37], and [Eldarion][38]. You can also roll your own custom PaaS, integrate with a CI system of your choice, or use only Kubernetes by deploying your container images on Kubernetes.

Since Kubernetes operates at the application level rather than at the hardware level, it provides some generally applicable features common to PaaS offerings, such as deployment, scaling, load balancing, logging, and monitoring. However, Kubernetes is not monolithic, and these default solutions are optional and pluggable.

Additionally, Kubernetes is not a mere  _orchestration system_ . In fact, it eliminates the need for orchestration. The technical definition of  _orchestration_  is execution of a defined workflow: first do A, then B, then C. In contrast, Kubernetes is comprised of a set of independent, composable control processes that continuously drive the current state towards the provided desired state. It shouldn’t matter how you get from A to C. Centralized control is also not required; the approach is more akin to  _choreography_ . This results in a system that is easier to use and more powerful, robust, resilient, and extensible.

#### What does  _Kubernetes_  mean? K8s?

The name **Kubernetes** originates from Greek, meaning  _helmsman_  or  _pilot_ , and is the root of  _governor_  and [cybernetic][39].  _K8s_  is an abbreviation derived by replacing the 8 letters “ubernete” with “8”.

--------------------------------------------------------------------------------

via: https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/

作者：[kubernetes.io][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kubernetes.io/
[1]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#why-do-i-need-kubernetes-and-what-can-it-do
[2]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#how-is-kubernetes-a-platform
[3]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#what-kubernetes-is-not
[4]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#what-does-kubernetes-mean-k8s
[5]:https://martinfowler.com/articles/microservices.html
[6]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#kubernetes-is
[7]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#why-containers
[8]:https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/#whats-next
[9]:https://kubernetes.io/docs/concepts/workloads/pods/pod/
[10]:https://kubernetes.io/docs/concepts/storage/volumes/
[11]:https://kubernetes.io/docs/concepts/configuration/secret/
[12]:https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/
[13]:https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/
[14]:https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
[15]:https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/
[16]:https://kubernetes.io/docs/concepts/services-networking/service/
[17]:https://kubernetes.io/docs/tasks/run-application/rolling-update-replication-controller/
[18]:https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/
[19]:https://kubernetes.io/docs/concepts/cluster-administration/logging/
[20]:https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application-introspection/
[21]:https://kubernetes.io/docs/admin/authorization/
[22]:http://wildfly.org/
[23]:https://12factor.net/
[24]:https://github.com/google/jsonnet
[25]:http://www.slideshare.net/BrianGrant11/wso2con-us-2015-kubernetes-a-platform-for-automating-deployment-scaling-and-operations
[26]:https://research.google.com/pubs/pub43438.html
[27]:https://aucouranton.com/2014/06/13/linux-containers-parallels-lxc-openvz-docker-and-more/
[28]:https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
[29]:https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/
[30]:https://kubernetes.io/docs/concepts/overview/components/
[31]:https://kubernetes.io/docs/reference/api-overview/
[32]:https://git.k8s.io/community/contributors/devel/scheduler.md
[33]:https://git.k8s.io/community/contributors/design-proposals/extending-api.md
[34]:https://kubernetes.io/docs/user-guide/kubectl-overview/
[35]:https://github.com/kubernetes/community/blob/master/contributors/design-proposals/principles.md
[36]:https://www.openshift.org/
[37]:http://deis.io/
[38]:http://eldarion.cloud/
[39]:http://www.etymonline.com/index.php?term=cybernetics
