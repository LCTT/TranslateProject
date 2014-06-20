Red Hat designs RHEL for a decade-long run
================================================================================
> The newly released RHEL 7 includes Docker containers and the new terabyte-scaled XFS file system

IDG News Service - Knowing how system administrators enjoy continuity, Red Hat has designed the latest release of its flagship Linux distribution to be run, with support, until 2024.

Red Hat Enterprise Linux 7 (RHEL 7), the completed version of which was shipped Tuesday, also features a number of new technologies that the company sees as instrumental for the next decade, including the Docker Linux Container system and the advanced XFS file system.

"XFS opens the door for a new class of business analytics, big data and data analytics," said Mark Coggin, Red Hat senior director of product marketing.

The last major update to RHEL, RHEL 6, was released in November 2010. Since then, server software has been used in an increasingly wide variety of operational scenarios, including providing the basis for bare metal servers, virtual machines, IaaS (infrastructure-as-a-service) and PaaS (platform-as-a-service) cloud packages.

Red Hat will support RHEL 7 with bug fixes and commercial support for up to 10 years. The company generally releases a major version of RHEL every three years.

In contrast, Canonical's Ubuntu LTS (long-term support) distributions are supported for five years. Suse Enterprise Linux [is also supported][1], in most aspects, for up to 10 years,

This is the first edition to include Docker, a container technology [that could act as a nimbler replacement][2] to full virtual machines used in cloud operations. Docker provides a way to package an application in a virtual container so that it can be run across different Linux servers.

Red Hat expects that containers will be widely deployed over the next few years as a way to package and run applications, thanks to their portable nature.

"Customers have told us they are looking for a lighter weight version of developing applications. The applications themselves don't need a full operating system or a virtual machine," Coggin said. The system calls are answered by the server's OS and the container includes only the necessary support libraries and the application. "We only put into that container what we need," he said.

Containers are also easier to maintain because users don't have to worry about updating or patching the full OS within a virtual machine, Coggin said.

Red Hat is also planning a special stripped-down release of RHEL, now code-named RHEL Atomic, which will be a distribution for just running containers. Containers that run on the regular RHEL can easily be transferred to RHEL Atomic, once that OS is available. They will also run on Red Hat OpenShift PaaS.

Red Hat is also supporting Docker through its switch in RHEL 7 to the systemd process manager, replacing Linux's long used init process manager. Systemd "gives the administrator a lot of additional flexibility in managing the underlying processes inside of RHEL. It also has a tie back to the container initiative and is very integral to the way the processes are stood up and managed in containers," Coggin said.

Red Hat has switched the default file system in RHEL 7 to XFS, which is able to keep track of up to 500TBs on a single partition. The previous default file system, ext4, was only able to support 50TBs. Ext4 is still available as an option, as well as another of other file systems such as GFS2 and Btrfs (under technology preview).

Red Hat has added greater interoperability with the Microsoft Windows environment. Organizations can now use Microsoft Active Directory to securely authenticate users on Red Hat systems. Tools are also included in RHEL 7 to offer Red Hat credentials for Windows servers.

"Customers have thousands of Windows servers and thousands of RHEL servers, and they to need ways to integrate the two," Coggin said.

The installation process has been sped up as well, thanks to an update to the Anaconda installer, which now allows administrators to preselect server configurations on the start of the installation process. The inclusion of the industry standard OpenLMI (Open Linux Management Infrastructure), which allows the administrator to manage services at a granular level through a standardized API (application programming interface).

"OpenLMI is another important way of improving stability and efficiency by helping to manage systems better," Coggin said.

--------------------------------------------------------------------------------

via: http://www.computerworld.com/s/article/9248988/Red_Hat_designs_RHEL_for_a_decade_long_run?taxonomyId=122

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.suse.com/support/policy.html
[2]:http://www.infoworld.com/d/virtualization/docker-all-geared-the-enterprise-244020