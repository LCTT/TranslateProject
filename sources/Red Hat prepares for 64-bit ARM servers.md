Red Hat prepares for 64-bit ARM servers
================================================================================
> ARM processors could lead to server racks with thousands of nodes, the Red Hat ARM chief predicts

IDG News Service - Enterprise open-source software vendor Red Hat is keeping an eye on the development of 64-bit ARM processors for servers, building up expertise in case the nascent platform takes hold in the data center.

"You don't see us in the market today with commercial offerings, but what we are building a competency ahead of some of the 64-bit technology that is coming. So further down the line, if we do have a need to respond to the market, we will have the capability to do that," said Jon Masters, chief ARM architect at Red Hat. Masters spoke Friday at the USENIX LISA (Large Installation System Administration) conference in Washington, D.C.

The ARM processor represents a "sea change in computing," Masters said. While already the dominant architecture for smartphone and embedded computing devices, ARM processors could also play a role in the data center. Over the past year, servers based on ARM processors have started to show up in the server market. HP is already selling ARM-based servers with its Moonshot line.

For the data center, because of its low-power design, ARM could bring about an age of hyperscale computing, in which thousands of tiny compute nodes can be packed into a single server rack. "It is a fundamental difference in terms of the sheer scale of what we will be able to build in the near future," Masters said.

The ARM processors may not run at the speed of x86 processors, but they can offer most of the performance with a fraction of the energy usage, meaning more processors can be packed into a smaller space. "You can take the same technology that goes into your cell phone and make that part of a dense server design" Masters said.

Many jobs do not require the fastest processors available, he said. Instead the workloads can be spread across more processors. "It's about how much data I can move, not necessarily how much compute I can do," he said. Cloud computing and Web applications, for instance, would do equally well spread out across multiple servers as they would running on fewer, but faster servers.

ARM's design could also simplify data-center operations. ARM's system on a chip design can eliminate the need for managing many of the external components of servers. For instance, an ARM processor could offer fabric interconnectivity, reducing the need for external cables and top-of-the-rack switches.

"The days of having discrete cabling for every single blade are numbered," he said.

There is still a lot of work that needs to be done to bring about hyperscale computing, Masters said.

ARM licenses its architecture rather than selling processors as Intel does. As a result, there is a fair amount of variation among the different ARM processors from vendors. "There is a lot of gratuitous variation that we don't need to have," Masters said. This can be problematic for data centers that need uniform systems so they can be managed en masse.

[Linaro][1] is an industry group working to build core open-source software for the ARM platform and part of its mission has been to standardize ARM. Red Hat engineers play a major role in the Linaro Enterprise Group, or LEG, which has been working to standardize the software so users can get one version of Linux to run across ARM processors from multiple vendors. "Those are fundamental expectations in the enterprise space," Masters said.

"We do need to focus on how to make them fundamentally compatible so you can add value further up the stack," he said.

Another issue is the support of peripherals, which hasn't been standardized across 32-bit ARM processors. Masters said that LEG is looking into using the ACPI (Advanced Configuration and Power Interface) standard or UEFI (Unified Extensible Firmware Interface) for 64-bit ARM processors. Over time, ARM will offer an automated bus-like capability that will work like PCI buses offer on x86 machines.

Masters said that Red Hat has not made any announcements about when it would release a version of Red Hat Enterprise Linux for ARM, but he did note that the Fedora Project, the community Linux distribution that tests many of the applications that go into RHEL, now offers a distribution for ARM.

--------------------------------------------------------------------------------

via: http://www.computerworld.com/s/article/9243921/Red_Hat_prepares_for_64_bit_ARM_servers?taxonomyId=122

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linaro.org/