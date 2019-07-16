[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bringing Kubernetes to the bare-metal edge)
[#]: via: (https://opensource.com/article/19/3/bringing-kubernetes-bare-metal-edge)
[#]: author: (John Studarus https://opensource.com/users/studarus)

Bringing Kubernetes to the bare-metal edge
======
New Kubespray features enable Kubernetes clusters to be deployed across
next-generation edge locations.
![cubes coming together to create a larger cube][1]

[Kubespray][2], a community project that provides Ansible playbooks for the deployment and management of Kubernetes clusters, recently added support for the bare-metal cloud [Packet][3]. This allows Kubernetes clusters to be deployed across next-generation edge locations, including [cell-tower based micro datacenters][4].

Packet, which is unique in its bare-metal focus, expands Kubespray's support beyond the usual clouds—Amazon Web Services, Google Compute Engine, Azure, OpenStack, vSphere, and Oracle Cloud Infrastructure. Kubespray removes the complexities of standing up a Kubernetes cluster through automation using Terraform and Ansible. Terraform provisions the infrastructure and installs the prerequisites for the Ansible installation. Terraform provider plugins enable support for a variety of different cloud providers. The Ansible playbook then deploys and configures Kubernetes.

Since there are already [detailed instructions online][5] for deploying with Kubespray on Packet, I'll focus on why bare-metal support is important for Kubernetes and what's required to make it happen.

### Why bare metal?

Historically, Kubernetes deployments relied upon the "creature comforts" of a public cloud or a fully managed private cloud to provide virtual machines and networking infrastructure for running Kubernetes. This adds a layer of abstraction (e.g., a hypervisor with virtual machines) that Kubernetes doesn't necessarily need. In fact, Kubernetes began its life on bare metal as Google's Borg.

As we move workloads closer to the end user (in the form of edge computing) and deploy to more diverse environments (including hybrid and on-premises infrastructure of different architectures and sizes), relying on a homogenous public cloud substrate isn't always possible or ideal. For instance, with edge locations being resource constrained, it is more efficient and practical to run Kubernetes directly on bare metal.

### Mind the gaps

Without a full-featured public cloud underneath a bare-metal cluster, some traditional capabilities, such as load balancing and storage orchestration, will need to be managed directly within the Kubernetes cluster. Luckily there are projects, such as [MetalLB][6] and [Rook][7], that provide this support for Kubernetes.

MetalLB, a Layer 2 and Layer 3 load balancer, is integrated into Kubespray, and it's easy to install support for Rook, which orchestrates Ceph to provide distributed and replicated storage for a Kubernetes cluster, on a bare-metal cluster. In addition to enabling full functionality, this "bring your own" approach to storage and load balancing removes reliance upon specific cloud services, helping you avoid lock-in with an approach that can be installed anywhere.

Kubespray has support for ARM64 processors. The ARM architecture (which is starting to show up regularly in datacenter-grade hardware, SmartNICs, and other custom accelerators) has a long history in mobile and embedded devices, making it well-suited for edge deployments.

Going forward, I hope to see deeper integration with MetalLB and Rook as well as bare-metal continuous integration (CI) of daily builds atop a number of different hardware configurations. Access to automated bare metal at Packet enables testing and maintaining support across various processor types, storage options, and networking setups. This will help ensure that Kubespray-powered Kubernetes can be deployed and managed confidently across public clouds, bare metal, and edge environments.

### It takes a village

Kubespray is an open source project driven by the community, indebted to its core developers and contributors as well as the folks that assisted with the Packet integration. Contributors include [Maxime Guyot][8] and [Aivars Sterns][9] for the initial commits and code reviews, [Rong Zhang][10] and [Ed Vielmetti][11] for document reviews, as well as [Tomáš Karásek][12] (who maintains the Packet Go library and Terraform provider).

* * *

_John Studarus will present[The Open Micro Edge Data Center][13] at the [Open Infrastructure Summit][14], April 29-May 1 in Denver._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/bringing-kubernetes-bare-metal-edge

作者：[John Studarus][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/studarus
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cube_innovation_process_block_container.png?itok=vkPYmSRQ (cubes coming together to create a larger cube)
[2]: https://kubespray.io/
[3]: https://www.packet.com/
[4]: https://twitter.com/packethost/status/1062147355108085760
[5]: https://github.com/kubernetes-sigs/kubespray/blob/master/docs/packet.md
[6]: https://metallb.universe.tf/
[7]: https://rook.io/
[8]: https://twitter.com/Miouge
[9]: https://github.com/Atoms
[10]: https://github.com/riverzhang
[11]: https://twitter.com/vielmetti
[12]: https://t0mk.github.io/
[13]: https://www.openstack.org/summit/denver-2019/summit-schedule/events/23153/the-open-micro-edge-data-center
[14]: https://openstack.org/summit
