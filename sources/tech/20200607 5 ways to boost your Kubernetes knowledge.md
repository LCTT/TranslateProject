[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 ways to boost your Kubernetes knowledge)
[#]: via: (https://opensource.com/article/20/6/kubernetes-anniversary)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 ways to boost your Kubernetes knowledge
======
On its anniversary, get to know Kubernetes with these deep-dives and
hands-on projects.
![Ship captain sailing the Kubernetes seas][1]

When the cloud was still in its formative years, developers discovered that it was convenient to write applications in small, atomic, minimal Linux images that shared resources with the server they ran on. Technically based on kernel namespaces, these small environment definitions came to be called [containers][2]. As containers proliferated, sysadmins quickly realized it was becoming essential to develop a tool that could help them manage not only containers but also the virtualized infrastructure underneath. And that's when [Kubernetes][3] was born.

Kubernetes is an extensible open source platform for wrangling containers. It helps administrators and developers manage workloads, services, and processes around containers. It facilitates declarative configuration and easy automation. In its relatively short lifespan, it has fostered a rapidly growing ecosystem with services, support, and tools from many companies and projects.

If you're looking to get better acquainted with this important cloud technology, here are a few articles to help you dive deep and five projects to help you try out what you learn.

### Containing container chaos

In 2016, we published [Containing the container chaos with Kubernetes][4], an introductory article by Terry Ryan about how Kubernetes is helping admins and architects grapple with containers. If you need a ground-level introduction to what containers do and how Kubernetes makes it easy, then this is the article to read first. It assumes no prior knowledge and explains all the most important concepts, so you can get up to speed fast.

For an advanced look into some of the magic happening at the kernel level, read Jessica Cherry's explanation of [Kubernetes namespaces][5].

### Kubernetes: Why does it matter?

Kubernetes provides the benefits of an Infrastructure-as-a-Service (IaaS) solution (like OpenStack) and a full Platform as a Service (PaaS). It gives you abstractions for managing infrastructure and the tools you need to troubleshoot at the base level of bare metal. If you have the impulse to cling to a single bare-metal server, you might want to read Tim Potter's take on [why Kubernetes matters][6]. His article compares IaaS and PaaS and gives his perspective on why Kubernetes has been so widely adopted. You don't always need Kubernetes or containers, but it's important to know when you do.

### Run it on a Raspberry Pi

There's no better way to get familiar with Kubernetes than to run it yourself. Unfortunately, not everyone has a cloud (nor the money to rent time on one) at their disposal. Luckily, Chris Collins has provided a guide for running [Kubernetes on a Pi][7]. Combined with his equally elucidating tutorials about [Cloud-init][8] and [Cloud-init services][9] (also on a Pi), you can build whatever kind of homelab you want so that you can learn how to manage your very own open hybrid cloud.

### Kubernetes commands

Once you have Kubernetes up and running, take a look at Jessica Cherry's article and accompanying cheat sheet that provides you with all the [essential Kubernetes commands][10]. In her article, she explains the syntax of `kubectl` commands and provides an overview of what each command and subcommand is meant to do.

### Fun Kubernetes projects

Nothing's more frustrating than having access to technology but not knowing what to do with it. For instance, it's one thing to have a Raspberry Pi on your desk, but it's an entirely different matter to decide what it ought to spend its CPU cycles doing. We've published plenty of articles to give some guidance to your Kubernetes explorations:

  * [Helm][11] is a package manager for Kubernetes. Exploring it is an easy way to get comfortable with living in Kubernetes.
  * Learn all about [Operator SDK][12] to get familiar with Kubernetes objects and operators.
  * Provide a [network file system (NFS) on top of Kubernetes.][13]
  * Learn how to route traffic with [Skipper][14] or [Traefik.][15]



Most importantly, take the time to get comfortable with containers and Kubernetes. Whether you first embrace containerized apps on the server, cloud, or desktop, they're an important paradigm to understand, because they're a powerful construct that's made applications on Linux better, stronger, more robust, and easier. Invest time to learn more about them. You'll be glad you did.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/kubernetes-anniversary

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[3]: https://opensource.com/resources/what-is-kubernetes
[4]: https://opensource.com/life/16/9/containing-container-chaos-kubernetes
[5]: https://opensource.com/article/19/12/kubernetes-namespaces
[6]: https://opensource.com/article/17/6/introducing-kubernetes
[7]: https://opensource.com/article/20/6/kubernetes-raspberry-pi
[8]: https://opensource.com/article/20/5/cloud-init-raspberry-pi-homelab
[9]: https://opensource.com/article/20/5/create-simple-cloud-init-service-your-homelab
[10]: https://opensource.com/article/20/5/kubectl-cheat-sheet
[11]: https://opensource.com/article/20/2/kubectl-helm-commands
[12]: https://opensource.com/article/20/3/kubernetes-operator-sdk
[13]: https://opensource.com/article/20/6/kubernetes-nfs-client-provisioning
[14]: https://opensource.com/article/20/4/http-kubernetes-skipper
[15]: https://opensource.com/article/20/3/kubernetes-traefik
