AGL Outlines Virtualization Scheme for the Software Defined Vehicle
============================================================

![AGL](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/agl.jpg?itok=Vtrn52vk "AGL")
AGL outlines the architecture of a “virtualized software defined vehicle architecture” for UCB codebase in new white paper.[The Linux Foundation][2]

Last August when The Linux Foundation’s Automotive Grade Linux (AGL) project released version 4.0 of its Linux-based Unified Code Base (UCB) reference distribution for automotive in-vehicle infotainment, it also launched a Virtualization Expert Group (EG-VIRT). The workgroup has now [released][5] a white paper outlining a “virtualized software defined vehicle architecture” for AGL’s UCB codebase.

The paper explains how virtualization is the key to expanding AGL from IVI into instrument clusters, HUDs, and telematics. Virtualization technology can protect these more safety-critical functions from less secure infotainment applications, as well as reduce costs by replacing electronic hardware components with virtual instances. Virtualization can also enable runtime configurability for sophisticated autonomous and semi-autonomous ADAS applications, as well as ease software updates and streamline compliance with safety critical standards.

The paper also follows several recent AGL announcements including the [addition of seven new members][6]: Abalta Technologies, Airbiquity, Bose, EPAM Systems, HERE, Integrated Computer Solutions, and its first Chinese car manufacturer -- Sitech Electric Automotive. These new members bring the AGL membership to more than 120. 

AGL also [revealed][7] that Mercedes-Benz Vans is using its open source platform as a foundation for a new onboard OS for commercial vehicles. AGL will play a key role in the Daimler business unit’s “adVANce” initiative for providing “holistic transport solutions.” These include technologies for integrating connectivity, IoT, innovative hardware, on-demand mobility and rental concepts, and fleet management solutions for both goods and passengers.

The Mercedes-Benz deal follows last year’s announcement that AGL would appear in 2018 Toyota Camry cars. AGL has since expanded to other Toyota cars including the 2018 Prius PHV.

### An open-ended approach to virtualization

Originally, the AGL suggested that EG-VIRT would identify a single hypervisor for an upcoming AGL virtualization platform that would help consolidate infotainment, cluster, HUD, and rear-seat entertainment applications over a single multicore SoC. A single hypervisor (such as the new ACRN) may yet emerge as the preferred technology, but the paper instead outlines an architecture that can support multiple, concurrent virtualization schemes. These include hypervisors, system partitioners, and to a lesser extent, containers.

### Virtualization benefits for the software defined vehicle

Virtualization will enable what the AGL calls the “software defined vehicle” -- a flexible, scalable “autonomous connected automobile whose functions can be customized at run-time.” In addition to boosting security, the proposed virtualization platform offers benefits such as cost reductions, run-time flexibility for the software-defined car, and support for mixed criticality systems:

*   **Software defined autonomous car** -- AGL will use virtualization to enable runtime configurability and software updates that can be automated and performed remotely. The system will orchestrate multiple applications, including sophisticated autonomous driving software, based on different licenses, security levels, and operating systems.

*   **Cost reductions** -- The number of electronic control units (ECUs) -- and wiring complexity -- can be reduced by replacing many ECUs with virtualized instances in a single multi-core powered ECU. In addition, deployment and maintenance can be automated and performed remotely. EG-VIRT cautions, however, that there’s a limit to how many virtual instances can be deployed and how many resources can be shared between VMs without risking software integration complexity.

*   **Security** -- By separating execution environments such as the CPU, memory, or interfaces, the framework will enable multilevel security, including protection of telematics components connected to the CAN bus. With isolation technology, a security flaw in one application will not affect others. In addition, security can be enhanced with remote patch updates.

*   **Mixed criticality** -- One reason why real-time operating systems (RTOSes) such as QNX have held onto the lead in automotive telematics is that it’s easier to ensure high criticality levels and comply with Automotive Safety Integrity Level (ASIL) certification under ISO 26262\. Yet, Linux can ably host virtualization technologies to coordinate components with different levels of criticality and heterogeneous levels of safety, including RTOS driven components. Because many virtualization techniques have a very limited footprint, they can enable easier ASIL certification, including compliance for concurrent execution of systems with different certification levels.

IVI typically requires the most basic ASIL A certification at most. Instrument cluster and telematics usually need ASIL B, and more advanced functions such as ADAS and digital mirrors require ASIL C or D. At this stage, it would be difficult to develop open source software that is safety-certifiable at the higher levels, says EG-VIRT. Yet, AGL’s virtualization framework will enable proprietary virtualization solutions that can meet these requirements. In the long-term, the [Open Source Automation Development Lab][8] is working on potential solutions for Safety Critical Linux that might help AGL meet the requirements using only open source Linux.</ul>

### Building an open source interconnect

The paper includes the first architecture diagrams for AGL’s emerging virtualization framework. The framework orchestrates different hypervisors, VMs, AGL Profiles, and automotive functions as interchangeable modules that can be plugged in at compilation time, and where possible, at runtime. The framework emphasizes open source technologies, but also supports interoperability with proprietary components.

### [agl-arch.jpg][3]

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/agl-arch.jpg?itok=r53h3iE1)

AGL virtualization approach integrated in the AGL architecture.[Used with permission][1]

The AGL application framework already supports application isolation based on namespaces, cgroups, and SMACK. The framework “relies on files/processes security attributes that are checked by the Linux kernel each time an action processes and that work well combined with secure boot techniques,” says EG-VIRT. However, when multiple applications with different security and safety requirements need to be executed, “the management of these security attributes becomes complex and there is a need of an additional level of isolation to properly isolate these applications from each other…This is where the AGL virtualization platform comes into the picture.”

To meet EG-VIRT’s requirements, compliant hardware virtualization solutions must enable CPU, cache, memory, and interrupts to create execution environments (EEs) such as Arm Virtualization Extensions, Intel VT-x, AMD SVM, and IOMMU. The hardware must also support a trusted computing module to isolate safety-security critical applications and assets. These include Arm TrustZone, Intel Trusted Execution Technology, and others. I/O virtualization ​support for GPU and connectivity sharing is optional.

The AGL virtualization platform does not need to invent new hypervisors and EEs, but it does need a way to interconnect them. EG-VIRT is now beginning to focus on the development of an open source communication bus architecture that comprises both critical and non-critical buses. The architecture will enable communications between different virtualization technologies such as hypervisors and different virtualized EEs such as VT-x while also enabling direct communication between different types of EEs.

### Potential AGL-compliant hypervisors and partitioners

The AGL white paper describes several open source and proprietary candidates for hypervisor and system partitioners. It does not list any containers, which create abstraction starting from the layers above the Linux kernel.

Containers are not ideal for most connected car functions. They lack guaranteed hardware isolation or security enforcement, and although they can run applications, they cannot run a full OS. As a result, AGL will not consider containers for safety and real time workloads, but only within non-safety critical systems, such as for IVI application isolation.

Hypervisors, however, can meet all these requirements and are also optimized for particular multi-core SoCs. “Virtualization provides the best performance in terms of security, isolation and overhead when supported directly by the hardware platform,” says the white paper.

For hypervisors, the open source options listed by EG-VIRT include Xen, Kernel-based Virtual Machine (KVM), the L4Re Micro-Hypervisor, and ACRN. The latter was [announced][9] as a new Linux Foundation embedded reference hypervisor project in March. The Intel-backed, BSD-licensed ACRN hypervisor provides workload prioritization and supports real-time and safety-criticality functions. The lightweight ACRN supports other embedded applications in addition to automotive.

Commercial hypervisors that will likely receive support in the AGL virtualization stack include the COQOS Hypervisor SDK, SYSGO PikeOS, and the Xen-based Crucible and Nautilus. The latter was first presented by the Xen Project as a potential solution for AGL virtualization [back in 2014][10]. There’s also the Green Hills Software Integrity Multivisor. Green Hills [announced AGL support for][11] Integrity earlier this month.

Unlike hypervisors, system partitioners do not tap specific virtualization functions within multi-core SoCs, and instead run as bare-metal solutions. Only two open source options were listed: Jailhouse and the Arm TrustZone based Arm Trusted Firmware (ATF). The only commercial solution included is the TrustZone based VOSYSmonitor.

In conclusion, EG-VIRT notes that this initial list of potential virtualization solutions is “non-exhaustive,” and that “the role of EG-VIRT has been defined as virtualization technology integrator, identifying as key next contribution the development of a communication bus reference implementation…” In addition: “Future EG-VIRT activities will focus on this communication, on extending the AGL support for virtualization (both as a guest and as a host), as well as on IO devices virtualization (e.g., GPU).”

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/7/agl-outlines-virtualization-scheme-software-defined-vehicle

作者：[ERIC BROWN ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/ericstephenbrown
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/linux-foundation
[3]:https://www.linux.com/files/images/agl-archjpg
[4]:https://www.linux.com/files/images/agljpg
[5]:https://www.automotivelinux.org/blog/2018/06/20/agl-publishes-virtualization-white-paper
[6]:https://www.automotivelinux.org/announcements/2018/06/05/automotive-grade-linux-welcomes-seven-new-members
[7]:http://linuxgizmos.com/automotive-grade-linux-joins-the-van-life-with-mercedes-benz-vans-deal/
[8]:https://www.osadl.org/Safety-Critical-Linux.safety-critical-linux.0.html
[9]:http://linuxgizmos.com/open-source-project-aims-to-build-embedded-linux-hypervisor/
[10]:http://linuxgizmos.com/xen-hypervisor-targets-automotive-virtualization/
[11]:https://www.ghs.com/news/2018061918_automotive_grade_linux.html
