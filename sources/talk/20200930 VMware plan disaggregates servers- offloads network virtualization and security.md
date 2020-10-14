[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (VMware plan disaggregates servers; offloads network virtualization and security)
[#]: via: (https://www.networkworld.com/article/3583990/vmware-plan-disaggregates-servers-offloads-network-virtualization-and-security.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

VMware plan disaggregates servers; offloads network virtualization and security
======
VMware Project Monterey includes NVIDIA, Intel and goes a long way to meld bare metal servers, graphics processing units
Henrik5000 / Getty Images

VMware is continuing its effort to remake the data center, cloud and edge to handle the distributed workloads and applications of the future.

At its virtual VMworld 2020 event the company previewed a new architecture called Project Monterey that goes a long way toward melding bare-metal servers, graphics processing units (GPUs), field programmable gate arrays (FPGAs), network interface cards (NICs) and security into a large-scale virtualized environment.

Monterey would extend VMware Cloud Foundation (VCF), which today integrates the company’s vShphere virtualization, vSAN storage, NSX networking and vRealize cloud management systems to support GPUs, FPGAs and NICs into a single platform that can be deployed on-premises or in a public cloud.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

The combination of a rearchitected VCF with Project Monterey will disaggregate server functions, add support for bare-metal servers and let an application running on one physical server consume hardware accelerator resources such as FPGAs from other physical servers, said Kit Colbert vice president and chief technology officer of VMware’s Cloud Platform business unit.

This will also enable physical resources to be dynamically accessed based on policy or via software API, tailored to the needs of the application, Colbert said.  “What we see is that these new apps are using more and more of server CPU cycles. Traditionally, the industry has relied on the CPU for everything--application business logic, processing network packets, specialized work such as 3D modeling, and more,” Colbert wrote in a [blog][2] outlining Project Monterey.

“But as app requirements for compute have continued to grow, hardware accelerators including GPUs, FPGAs, specialized NICs have been developed for processing workloads that could be offloaded from the CPU.  By leveraging these accelerators, organizations can improve performance for the offloaded activities and free up CPU cycles for core app-processing work.”

A key component of Monterey is VMware’s SmartNIC which incorporates a general-purpose CPU, out-of-band management, and virtualized device features. As part of Monterey, VMware has enabled its ESXi hypervisor to run on its SmartNICs which will let customers use a single management framework to manage all their compute infrastructure whether it be virtualized or bare metal.

The idea is that by supporting SmartNICs, VCF will be able to maintain compute virtualization on the server CPU while offloading networking and storage I/O functions to the SmartNIC CPU. Applications can then make use of the available network bandwidth while saving server CPU cycles that will improve application performance, Colbert stated.

As for security, each SmartNIC can run a stateful firewall and an advanced security suite.

“Since this will run in the NIC and not in the host, up to thousands of tiny firewalls will be able to be deployed and automatically tuned to protect specific application services that make up the application--wrapping each service with intelligent defenses that can shield any vulnerability of that specific service,” Colbert stated. “Having an ESXi instance on the SmartNIC provides greater defense-in-depth. Even if the x86 ESXi is somehow compromised, the SmartNIC ESXi can still enforce proper network security and other security policies.”

Part of the Monterey rollout included a broad development agreement between VMware and GPU giant Nvidia to bring its BlueField-2 data-processing unit (DPU) and other technologies into Monterey.  The BlueField-2 offloads network, security, and storage tasks from the CPU.

Nvidia DPUs can run a number of tasks, including network virtualization, load balancing, data compression, packet switching and encryption today across two ports, each carrying traffic at 100Gbps. “That’s an order of magnitude faster than CPUs geared for enterprise apps. The DPU is taking on these jobs so CPU cores can run more apps, boosting vSphere and data-center efficiency,” according to an Nvidia blog “As a result, data centers can handle more apps, and their networks will run faster, too.”

In addition to the Monterey agreement, VMware and Nvidia said they would work together to develop an enterprise platform for AI applications.  Specifically, the companies said GPU-optimized AI software available on the [Nvidia NGC hub][3] will be integrated into VMware vSphere, VMware Cloud Foundation and VMware Tanzu.

[Now see how AI can boost data-center availability and efficiency][4]

This will help accelerate AI adoption, letting customers extend existing infrastructure to support AI and manage all applications with a single set of operations.

Intel and Pensando announced SmartNIC technology integration as part of Project Monterey, and  Dell Technologies, HPE and Lenovo said they, too, would support integrated systems based on Project Monterey.

Project Monterey is a technology preview at this point and VMware did not say when it expects to deliver it.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3583990/vmware-plan-disaggregates-servers-offloads-network-virtualization-and-security.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://blogs.vmware.com/vsphere/2020/09/announcing-project-monterey-redefining-hybrid-cloud-architecture.html
[3]: https://www.nvidia.com/en-us/gpu-cloud/
[4]: https://www.networkworld.com/article/3274654/ai-boosts-data-center-availability-efficiency.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
