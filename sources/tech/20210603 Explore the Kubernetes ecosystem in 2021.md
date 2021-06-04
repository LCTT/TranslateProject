[#]: subject: (Explore the Kubernetes ecosystem in 2021)
[#]: via: (https://opensource.com/article/21/6/kubernetes-ebook)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Explore the Kubernetes ecosystem in 2021
======
This downloadable guide is full of helpful tutorials to get SREs and
sysadmins comfortable using Kubernetes.
![A ship wheel with someone steering][1]

Kubernetes, the de facto standard for container orchestration, has quickly grown to dominate the container environment both in terms of infrastructure management and application development. As an open source platform with a huge community of enthusiasts and professionals, and being a part of the Cloud Native Computing Foundation, Kubernetes has become not only a powerful and impressive orchestration system itself but it has fostered a huge ecosystem of related tools and services to make it easier to use and extend its functionality with ever more powerful and sophisticated components.

In this new eBook, [_A guide to Kubernetes for SREs and sysadmins_][2], [Jess Cherry][3] (with contribution by Ben Finkel) covers a slew of these related tools and services, for management of and integration with Kubernetes. Cherry and Finkel provide some helpful _getting started_ guides, both for Kubernetes and some of the tools. They even share interview questions to help prepare readers for jobs within this quick-growing, massive ecosystem.

### Getting to know Kubernetes

If you're just getting started with Kubernetes and containers, Ben Finkel's _[Getting started with Kubernetes][4]_ is both appropriately titled and an excellent introduction to the relevant concepts you need to understand in order to jump in. It's also a lightweight quickstart guide for setting up and using a single-node cluster for testing. There's no better way to learn than to get your hands on the technology and dive right in. What's a Pod?  How do you deploy an application on the cluster?  Ben's got you covered.

The primary way to interact with a cluster is the [**kubectl**][5] command—a CLI utility that provides a human-accessible way to interact with the API servers that manage the cluster itself. For example, you can use **kubectl get** to list the aforementioned Pods and Deployments, but as you'd expect with something as complex as Kubernetes, its CLI interface has a ton of power and flexibility. Jess Cherry's [_9 kubectl commands sysadmins need to know_][6] cheat sheet is a great introduction and a good way to get started using **kubectl**.

Similarly, Cherry's _[Kubernetes namespaces for beginners][7]_ does a good job of explaining what namespaces are and how they're used within Kubernetes.

### Simplify working with Kubernetes

Working with a complex system can be difficult, especially with a powerful but minimal CLI tool like **kubectl**. Luckily within the ecosystem surrounding Kubernetes, there are a number of tools available to simplify things and make scaling services and cluster management easier.

The **kubectl** command can be used to deploy and maintain applications and services on Kubernetes, primarily with YAML and JSON. ****Once you begin to manage more than just a few applications; however, doing so with large repositories of YAML can become both repetitive and tedious. A good solution can be to embrace a templated system to handle your deployments. [Helm][8] is one such tool, dubbed _a package manager for Kubernetes_, Helm provides a convenient way to package and share applications. Cherry has written a number of helpful articles about Helm: guides for creating effective [Helm charts][9] and helpful [Helm commands][10].

**Kubectl** also provides you with a lot of information about the cluster itself, what’s running on it, and events that are occurring. These can be seen and interacted with using **kubectl** but sometimes it helps to have a more visual GUI to interact with. [K9s][11] fits between both worlds. While still a terminal application, it provides visual feedback and a way to interact with the cluster without long **kubectl** commands. Cherry has also written a good guide to [getting started with k9s][12].

### Extensions build on Kubernetes power and flexibility

Luckily, despite being complex and powerful, Kubernetes is amazingly flexible and open source. It focuses on its core strength—container orchestration—and has allowed the community of enthusiasts and professionals that surround it to extend its abilities to take on different types of workloads. One such example is [Knative][13], providing components on top of Kubernetes to provide tools for serverless and event-driven services, and taking advantage of Kubernetes’ orchestration prowess to run minimal microservices in containers. This, it turns out, is extremely efficient, providing both the benefits of developing small, easily tested and maintained applications in containers and the cost benefits of running them only as needed, triggered on specific events but otherwise dormant.

In this eBook, Cherry provides a look at both Knative and its eventing system, and why it is worthwhile to investigate using Knative yourself.

### There’s a whole world to explore

Get started with Kubernetes and the ecosystem surrounding it with this new [eBook][2] by Jess Cherry and Ben Finkel. In addition to the topics above, there are a number of other great articles about helpful Kubernetes extensions and third-party tools.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/kubernetes-ebook

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_wheel_gear_devops_kubernetes.png?itok=xm4a74Kv (A ship wheel with someone steering)
[2]: https://opensource.com/downloads/kubernetes-sysadmin
[3]: https://opensource.com/users/cherrybomb
[4]: https://opensource.com/article/17/11/getting-started-kubernetes
[5]: https://kubernetes.io/docs/reference/kubectl/kubectl/
[6]: https://opensource.com/article/20/5/kubectl-cheat-sheet
[7]: https://opensource.com/article/19/12/kubernetes-namespaces
[8]: https://helm.sh/
[9]: https://opensource.com/article/20/5/helm-charts
[10]: https://opensource.com/article/20/2/kubectl-helm-commands
[11]: https://k9scli.io/
[12]: https://opensource.com/article/20/5/kubernetes-administration
[13]: https://cloud.google.com/knative/
