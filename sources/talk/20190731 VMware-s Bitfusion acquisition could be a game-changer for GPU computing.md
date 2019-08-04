[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (VMware’s Bitfusion acquisition could be a game-changer for GPU computing)
[#]: via: (https://www.networkworld.com/article/3429036/vmwares-bitfusion-acquisition-could-be-a-game-changer-for-gpu-computing.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

VMware’s Bitfusion acquisition could be a game-changer for GPU computing
======
VMware will integrate Bitfusion technology into vSphere, bolstering VMware’s strategy of supporting AI- and ML-based workloads by virtualizing hardware accelerators.
![Vladimir Timofeev / Getty Images][1]

In a low-key move that went under the radar of a lot of us, last week VMware snapped up a startup called Bitfusion, which makes virtualization software for accelerated computing. It improves performance of virtual machines by offloading processing to accelerator chips, such as GPUs, FPGAs, or other custom ASICs.

Bitfusion provides sharing of GPU resources among isolated GPU compute workloads, allowing workloads to be shared across the customer’s network. This way workloads are not tied to one physical server but shared as a pool of resources, and if multiple GPUs are brought to bear, performance naturally increases.

“In many ways, Bitfusion offers for hardware acceleration what VMware offered to the compute landscape several years ago. Bitfusion also aligns well with VMware’s ‘Any Cloud, Any App, Any Device’ vision with its ability to work across AI frameworks, clouds, networks, and formats such as virtual machines and containers,” said Krish Prasad, senior vice president and general manager of the Cloud Platform Business Unit at VMware, in a [blog post][2] announcing the deal.

**[ Also read: [After virtualization and cloud, what's left on premises?][3] ]**

When the acquisition closes, VMware will integrate Bitfusion technology into vSphere. Prasad said the inclusion of Bitfusion will bolster VMware’s strategy of supporting artificial intelligence- and machine learning-based workloads by virtualizing hardware accelerators.

“Multi-vendor hardware accelerators and the ecosystem around them are key components for delivering modern applications. These accelerators can be used regardless of location in the environment—on-premises and/or in the cloud,” he wrote. The platform can be extended to support other accelerator chips, such as FGPAs and ASICs, he wrote.

Prasad noted that hardware accelerators today are deployed “with bare-metal practices, which force poor utilization, poor efficiencies, and limit organizations from sharing, abstracting, and automating the infrastructure. This provides a perfect opportunity to virtualize them—providing increased sharing of resources and lowering costs.”

He added: “The platform can share GPUs in a virtualized infrastructure as a pool of network-accessible resources rather than isolated resources per server.”

This is a real game-changer, much the way VMware added storage virtualization and software-defined networks (SDN) to expand the use of vSphere. It gives them a major competitive advantage over Microsoft Hyper-V and Linux’s KVM now as well.

By virtualizing and pooling GPUs, it lets users bring multiple GPUs to bear rather than locking one physical processor to a server and application. The same applies to FPGAs and the numerous AI processor chips either on or coming to market.

### VMware also buys Uhana

That wasn’t VMware’s only purchase. The company also acquired Uhana, which provides an AI engine specifically for telcos and other carriers that discovers anomalies in the network or application, prioritizes them based on their potential impact, and automatically recommends optimization strategies. That means improved network operations and operational efficiently.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3429036/vmwares-bitfusion-acquisition-could-be-a-game-changer-for-gpu-computing.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/08/clouded_view_of_data_center_server_virtualization_by_vladimir_timofeev_gettyimages-600404124_1200x800-100768156-large.jpg
[2]: https://blogs.vmware.com/vsphere/2019/07/vmware-to-acquire-bitfusion.html
[3]: https://https//www.networkworld.com/article/3232626/virtualization/extreme-virtualization-impact-on-enterprises.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
