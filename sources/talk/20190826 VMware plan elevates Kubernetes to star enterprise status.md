[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (VMware plan elevates Kubernetes to star enterprise status)
[#]: via: (https://www.networkworld.com/article/3434063/vmware-plan-elevates-kubernetes-to-star-enterprise-status.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

VMware plan elevates Kubernetes to star enterprise status
======
VMware rolls out Tanzu platform to help customer build, run and manage Kubernetes containers
![Daniel Masaoka][1]

San Francisco – VMware has announced an initiative that will help make it easier for current vSphere customers to build and manage Kubernetes containers as the platform evolves.

The company, at its VMworld customer event, announced VMware Tanzu which is made up of myriad new and existing VMware technologies to create a portfolio of products and services aimed at  enterprises looking to more quickly build software in Kubernetes containers.

[Learn how to make hybrid cloud work][2]

VMware believes that Kubernetes has emerged as the infrastructure layer to accommodate a diversity of applications. VMware says that from 2018 to 2023 – with new tools/platforms, more developers, agile methods, and lots of code reuse – 500 million new logical apps will be created serving the needs of many application types and spanning all types of environments.  

“We view Tanzu as a comprehensive environment for customers to bridge between the development and operational world. It’ll be super-powerful, enterprise grade Kubernetes platform. Kubernetes is the main tool for this transition and we now have a lot of work to do to make it work,” said Pat Gelsinger, CEO of VMware at the VMworld event. 

Gelsinger noted that VMware’s investments in Kubernetes technologies, including its buy of Heptio, Bitnami and [now Pivital, ][3]make the company a top-three open-source contributor to Kubernetes.

Key to the grand Tanzu plan is technology VMware calls Project Pacific which will add Kubernetes to vSphere – the company’s flagship virtualization software. By embedding Kubernetes into the control plane of vSphere, it will enable the convergence of containers and VMs onto a single platform. Project Pacific will also add a container runtime into the hypervisor, VMware stated.   

The new native pots for VMware's bare-metal hypervisor ESXi will combine the best properties of Kubernetes pods and VMs to help deliver a secure and high-performance runtime for mission-critical workloads. Additionally, Project Pacific will deliver a native virtual network spanning VMs and containers, VMware stated.   

IT operators will use vSphere tools to deliver Kubernetes clusters to developers, who can then use Kubernetes APIs to access VMware’s [software defined data-center][4] (SDDC) infrastructure. With Project Pacific, both developers and IT operators will gain a consistent view via Kubernetes constructs within vSphere.

“Project Pacific will embed Kubernetes into the control plane of vSphere, for unified access to compute, storage and networking resources, and also converge VMs and containers using the new Native Pods that are high performing, secure and easy to consume," wrote Kit Colbert vice president and CTO of VMware’s Cloud Platform business unit in a [blog about Project Pacific][5]. “Concretely this will mean that IT Ops can see and manage Kubernetes objects (e.g. pods) from the vSphere Client. It will also mean all the various vSphere scripts, third-party tools, and more will work against Kubernetes.”

Tanzu will also feature a single management package – VMware Tanzu Mission Control – which will function as a single point of control where customers can manage Kubernetes clusters regardless of where they are running, the company stated.

Tanzu also utilizes technology VMware bought from Bitnami which offers a catalog of pre-built, scanned, tested and maintained Kubernetes application content. The Bitnami application catalog supports and has been certified for all major Kubernetes platforms, including VMware PKS.

Tanzu also integrates VMware’s own container technology it currently develops with Pivotal, Pivotal Container Service (PKS), which it just last week said it intends to acquire. PKS delivers Kubernetes-based container services for multi-cloud enterprises and service providers.

With Project Pacific, IT will have unified visibility into vCenter Server for Kubernetes clusters, containers and existing VMs, as well as apply enterprise-grade vSphere capabilities (like high availability, Distributed Resource Scheduler, and vMotion) at the app level, Colbert wrote.

VMware didn’t say when Tanzu will become part of vSphere but as features get baked into the platform and tested customers could expect it “soon,” VMware executives said.

“Kubernetes can help organizations achieve consistency and drive developer velocity across a variety of infrastructures, but enterprises also require effective control, policy and security capabilities. Building on its acquisitions, organic innovation and open-source contributions, VMware has staked out its place as a leader in this rapidly evolving cloud-native industry.” said 451 Research Principal Analyst Jay Lyman in a statement.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3434063/vmware-plan-elevates-kubernetes-to-star-enterprise-status.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2017/08/nwin_016_vmwareceo_edge-100733116-large.jpg
[2]: https://www.networkworld.com/article/3119362/hybrid-cloud/how-to-make-hybrid-cloud-work.html#tk.nww-fsb
[3]: https://www.networkworld.com/article/3433916/vmware-spends-48b-to-grab-pivotal-carbon-black-to-secure-develop-integrated-cloud-world.html?nsdr=true
[4]: https://www.networkworld.com/article/3340259/vmware-s-transformation-takes-hold.html
[5]: https://blogs.vmware.com/vsphere/2019/08/introducing-project-pacific.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
