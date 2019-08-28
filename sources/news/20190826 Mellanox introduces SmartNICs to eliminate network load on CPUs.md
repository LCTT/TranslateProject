[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Mellanox introduces SmartNICs to eliminate network load on CPUs)
[#]: via: (https://www.networkworld.com/article/3433924/mellanox-introduces-smartnics-to-eliminate-network-load-on-cpus.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Mellanox introduces SmartNICs to eliminate network load on CPUs
======
Mellanox unveiled two processors designed to offload network workloads from the CPU -- ConnectX-6 Dx and BlueField-2 – freeing the CPU to do its processing job.
![Natali Mis / Getty Images][1]

If you were wondering what prompted Nvidia to [shell out nearly $7 billion for Mellanox Technologies][2], here’s your answer: The networking hardware provider has introduced a pair of processors for offloading network workloads from the CPU.

ConnectX-6 Dx and BlueField-2 are cloud SmartNICs and I/O Processing Unit (IPU) solutions, respectively, designed to take the work of network processing off the CPU, freeing it to do its processing job.

**[ Learn more about SDN: Find out [where SDN is going][3] and learn the [difference between SDN and NFV][4]. | Get regularly scheduled insights: [Sign up for Network World newsletters][5]. ]**

The company promises up to 200Gbit/sec throughput with ConnectX and BlueField. It said the market for 25Gbit and faster Ethernet was 31% of the total market last year and will grow to 61% next year. With the internet of things (IoT) and artificial intelligence (AI), a lot of data needs to be moved around and Ethernet needs to get a lot faster.

“The whole vision of [software-defined networking] and NVMe-over-Fabric was a nice vision, but as soon as people tried it in the data center, performance ground to a halt because CPUs couldn’t handle all that data,” said Kevin Deierling, vice president of marketing for Mellanox. “As you do more complex networking, the CPUs are being asked to do all that work on top of running the apps and the hypervisor. It puts a big burden on CPUs if you don’t unload that workload.”

CPUs are getting larger, with AMD introducing a 64-core Epyc processor and Intel introducing a 56-core Xeon. But keeping those giant CPUs fed is a real challenge. You can’t use a 100Gbit link because the CPU has to look at all that traffic and it gets overwhelmed, argues Deierling.

“Suddenly 100-200Gbits becomes possible because a CPU doesn’t have to look at every packet and decide which core needs it,” he said.

The amount of CPU load depends on workload. A telco can have a situation where it’s as much as 70% packet processing. At a minimum workload, 30% of it would be packet processing.

“Our goal is to bring that to 0% packet processing so the CPU can do what it does best, which is process apps,” he said. Bluefield-2 can process up to 215 million packets per second, Deierling added.

### ConnectX-6 Dx and BlueField-2 also provide security features

The two are also focused on offering secure, high-speed interconnects inside the firewall. With standard network security, you have a firewall but minimal security inside the network. So once a hacker breaches your firewall, he often has free reign inside the network.

With ConnectX-6 Dx and BlueField-2, the latter of which contains a ConnectX-6 Dx processor on the NIC, your internal network communications are also protected, so even if someone breaches your firewall, they can’t get at your data.

ConnectX-6 Dx SmartNICs provide up to two ports of 25, 50 or 100Gb/s, or a single port of 200Gb/s, Ethernet connectivity powered by 50Gb/s PAM4 SerDes technology and PCIe 4.0 host connectivity. The ConnectX-6 Dx innovative hardware offload engines include IPsec and TLS inline data-in-motion crypto, advanced network virtualization, RDMA over Converged Ethernet (RoCE), and NVMe over Fabrics (NVMe-oF) storage accelerations. 

The BlueField-2 IPU integrates a ConnectX-6 Dx, plus an ARM processor for a single System-on-Chip (SoC), supporting both Ethernet and InfiniBand connectivity up to 200Gb/sec. BlueField-2-based SmartNICs act as a co-processor that puts a computer in front of the computer to transform bare-metal and virtualized environments using advanced software-defined networking, NVMe SNAP storage disaggregation, and enhanced security capabilities.

Both ConnectX6 Dx and BlueField-2 are due in the fourth quarter.

### Partnering with Nvidia

Mellanox is in the process of being acquired by Nvidia, but the two suitors are hardly waiting for government approval. At VMworld, Mellanox announced that its Remote Direct Memory Access (RDMA) networking solutions for VMware vSphere will enable virtualized machine learning with better GPU utilization and efficiency.

Benchmarks found Nvidia’s virtualized GPUs see a two-fold increase in efficiency by using VMware’s paravirtualized RDMA (PVRDMA) technology than when using traditional networking protocols. And that was when connecting Nvidia T4 GPUs with Mellanox’s ConnectX-5 100 GbE SmartNICs, the older generation that is supplanted by today’s announcement.

The PVRDMA Ethernet solution enables VM-to-VM communication over RDMA, which boosts data communication performance in virtualized environments while achieving significantly higher efficiency compared with legacy TCP/IP transports. This translates into optimized server and GPU utilization, reduced machine learning training time, and improved scalability.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3433924/mellanox-introduces-smartnics-to-eliminate-network-load-on-cpus.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/08/cso_identity_access_management_abstract_network_connections_circuits_reflected_in_eye_by_natali_mis_gettyimages-654791312_2400x1600-100808178-large.jpg
[2]: https://www.networkworld.com/article/3356444/nvidia-grabs-mellanox-out-from-under-intels-nose.html
[3]: https://www.networkworld.com/article/3209131/lan-wan/what-sdn-is-and-where-its-going.html
[4]: https://www.networkworld.com/article/3206709/lan-wan/what-s-the-difference-between-sdn-and-nfv.html
[5]: https://www.networkworld.com/newsletters/signup.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
