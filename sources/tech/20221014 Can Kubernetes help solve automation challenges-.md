[#]: subject: "Can Kubernetes help solve automation challenges?"
[#]: via: "https://opensource.com/article/22/10/kubernetes-solve-automation-challenges"
[#]: author: "Rom Adams https://opensource.com/users/romdalf"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Can Kubernetes help solve automation challenges?
======
Automation at the organization level has been an elusive goal, but Kubernetes might be able to change all that.

I started my automation journey when I adopted Gentoo Linux as my primary operating system in 2002. Twenty years later, automation is not yet a done deal. When I meet with customers and partners, they share automation wins within teams, but they also describe the challenges to achieving similar success at an organizational level.

Most IT organizations have the ability to provision a virtual machine end to end, reducing what used to be a four-week lead time to just five minutes. That level of automation is itself a complex workflow, requiring networking (IP address management, DNS, proxy, networking zones, and so on), identity access management, [hypervisor][2], storage, backup, updating the operating system, applying the latest configuration files, monitoring, security and hardening, and compliance benchmarking. Wow!

It's not easy to address the business need for high velocity, scaling, and on-demand automation. For instance, consider the classic webshop or an online government service to file tax returns. The workload has well-defined peaks that need to be absorbed.

A common approach for handling such a load is having an oversized server farm, ready to be used by a specialized team of IT professionals, monitoring the seasonal influx of customers or citizens. Everybody wants a just-in-time deployment of an entire stack. They want infrastructure running workloads within the context of a hybrid cloud scenario, using the model of "build-consume-trash" to optimize costs while benefiting from infinite elasticity.

In other words, everybody wants the utopian "cloud experience."

### Can the cloud really deliver?

All is not lost, thanks mainly to the way [Kubernetes][3] has been designed. The exponential adoption of Kubernetes fuels innovation, displacing standard legacy practices for managing platforms and applications. Kubernetes requires the use of Everything-as-Code (EaC) to define the desired state of all resources, from simple compute nodes to TLS certificates. Kubernetes compels the use of three major design constructs:

* A standard interface to reduce integration friction between internal and external components
* An API-first and API-only approach to standardize the CRUD (Create, Read, Update, Delete) operations of all its components
* Use of [YAML][4] as a common language to define all desired states of these components in a simple and readable way

These three key components are essentially the same requirements for choosing an automation platform, at least if you want to ease adoption by cross-functional teams. This also blurs the separation of duties between teams, helping to improve collaboration across silos, which is a good thing!

As a matter of fact, customers and partners adopting Kubernetes are ramping up to a state of hyper-automation. Kubernetes organically drives teams to adopt multiple [DevOps foundations and practices][5]—like EaC, [version control with Git][6], peer reviews, [documentation as code][7]—and encourages cross-functional collaboration. These practices help mature a team's automation skills, and they help a team get a good start in GitOps and CI/CD pipelines dealing with both application lifecycle and infrastructure.

### Making automation a reality

You read that right! The entire stack for complex systems like a webshop or government reporting can be defined in clear, understandable, universal terms that can be executed on any on-prem or cloud provider. An autoscaler with custom metrics can be defined to trigger a just-in-time deployment of your desired stack to address the influx of customers or citizens during seasonal peaks. When metrics are back to normal, and cloud compute resources don't have a reason to exist anymore, you trash them and return to regular operations, with a set of core assets on-prem taking over the business until the next surge.

### The chicken and the egg paradox

Considering Kubernetes and cloud-native patterns, automation is a must. But it raises an important question: Can an organization adopt Kubernetes before addressing the automation strategy?

It might seem that starting with Kubernetes could inspire better automation, but that's not a foregone conclusion. A tool is not an answer to the problem of skills, practices, and culture. However, a well-designed platform can be a catalyst for learning, change, and cross-functional collaboration within an IT organization.

### Get started with Kubernetes

Even if you feel you missed the automation train, don't be afraid to start with Kubernetes on an easy, uncomplicated stack. Embrace the simplicity of this fantastic orchestrator and iterate with more complex needs once you've [mastered the initial steps][8].

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/10/kubernetes-solve-automation-challenges

作者：[Rom Adams][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/romdalf
[b]: https://github.com/lkxed
[2]: https://www.redhat.com/en/topics/virtualization/what-is-a-hypervisor?intcmp=7013a000002qLH8AAM
[3]: https://www.redhat.com/en/topics/containers/what-is-kubernetes?intcmp=7013a000002qLH8AAM
[4]: https://opensource.com/article/21/9/yaml-cheat-sheet
[5]: https://opensource.com/resources/devops
[6]: https://opensource.com/life/16/7/stumbling-git
[7]: https://opensource.com/article/21/3/devops-documentation
[8]: https://opensource.com/article/17/11/getting-started-kubernetes
