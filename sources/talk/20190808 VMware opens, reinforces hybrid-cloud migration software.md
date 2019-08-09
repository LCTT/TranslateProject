[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (VMware opens, reinforces hybrid-cloud migration software)
[#]: via: (https://www.networkworld.com/article/3431142/vmware-opens-reinforces-hybrid-cloud-migration-software.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

VMware opens, reinforces hybrid-cloud migration software
======
VMware opens HCX app mobility software to non-vSphere virtual environments
![Getty / VMware][1]

VMware customers can now  migrate non-vSphere as well as incresed amounts of on-premises application workloads to a variety of cloud services with a new release of the company’s Hybrid Cloud Extension (HCX) application-mobility software.

Introduced in 2017, [VMware HCX][2] lets vSphere customers tie together on-premises systems and applications with a variety of cloud services.  vSphere VMware's flagship virtualization platform. 

**More about backup and recovery:**

  * [Backup vs. archive: Why it’s important to know the difference][3]
  * [How to pick an off-site data-backup method][4]
  * [Tape vs. disk storage: Why isn’t tape dead yet?][5]
  * [The correct levels of backup save time, bandwidth, space][6]



HCX includes services such as routing and WAN optimization and can utilize other VMware products and services such as the firm’s core networking software, NSX. NSX is targeted at organizations looking to support multivendor cloud-native applications, [bare-metal][7] workloads, [hypervisor][8] environments and the growing hybrid and multicloud worlds.  HCX is also included in other VMware packages such as its VMware Cloud on AWS.

The main idea with HCX is to simplify the process of migrating, connecting, populating and safeguarding applications in a hybrid cloud environment, VMware stated.

“Enterprises cannot realize the promise of a modern data center or hybrid cloud until they can freely move applications and workloads between environments,” VMware stated. “VMware HCX enables data center and cloud transformations by simplifying the process of connecting, populating and continually optimizing application placement in modern cloud infrastructures.”

In the latest release, called HCX VMware Enterprise, the company has expanded the software’s reach by adding [support for non-vSphere workloads][9] – such as applications running on RedHat OpenStack/KVM, and Microsoft Hyper-V environments.

The current HCX Enterprise release supports the following KVM guest VM operating systems for migrating into a vSphere environment: RHEL 6.x (64-bit), RHEL 7.x, CentOS 6.x, CentOS 7.x, Windows Server 2012, and Windows Server 2012 R2. The list will continue to grow with future releases, according to VMware. 

In addition, VMware is adding support for its [vMotion package][10] that allows the  the live migration of a VM's file system from one storage system to another.  The idea is to allow the replication of VMs in bulk and and scheduling when migration will be completed, letting customers control application cutover to minimize business risk.

“For the first time VMware HCX combines the benefits of vSphere replication and vMotion in a single VM migration option,” [wrote][11] Ninad Desai, Director of Product Management for VMware HCX. “It immensely simplifies the planning, execution, and operationalization of large-scale mobility to public or private clouds.”

Lastly, VMware said HCX Enterprise will integrate with VMware Site Recovery Manager (SRM) to offer customers secure backup and disaster-recovery capabilities. 

“We see hybrid cloud and multicloud becoming a reality for customers with modernization projects encompassing public clouds, private clouds, telco clouds, and even spanning to the edge,” wrote [Allwyn Sequeira][12], VMware senior vice president, and general manager of its Hybrid Service business unit.  “HCX provides a mobility platform across all of these domains by abstracting the underlying infrastructure, automating the creation of connectivity across them, and extending the ability to do replication and vMotion to enable the freedom of movement that is needed to support evolving strategies for applications and platform investments.”

VMware HCX Enterprise is available now.

The HCX announcement is part of VMware’s continued evolution into cloud technologies. In July the company teamed with [Google][13] to natively support VMware workloads in its Google Cloud service, giving customers more options for deploying enterprise applications.

The hybrid-cloud service called Google Cloud VMware Solution by CloudSimple will use VMware software-defined data center (SDCC) technologies including VMware vSphere, NSX and vSAN software deployed on a platform administered by CloudSimple for GCP.

VMware also has a hybrid cloud partnership with Microsoft’s Azure cloud service.  That package, called Azure VMware Solutions is built on VMware Cloud Foundation, which  is a packaging of the company’s traditional compute virtualization software vSphere with its NSX network virtualization product and its VSAN software-defined storage area network product.

Also recently [VMware bulked up its cloud][14] offerings by buying Avi Networks' load-balancing, analytics and application-delivery technology for an undisclosed amount.

Join the Network World communities on [Facebook][15] and [LinkedIn][16] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3431142/vmware-opens-reinforces-hybrid-cloud-migration-software.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/08/vmware_vmworld_sharpen-focus-100770521-large.jpg
[2]: https://docs.vmware.com/en/VMware-HCX/services/rn/VMware-HCX-Release-Notes.html
[3]: https://www.networkworld.com/article/3285652/storage/backup-vs-archive-why-its-important-to-know-the-difference.html
[4]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[5]: https://www.networkworld.com/article/3315156/storage/tape-vs-disk-storage-why-isnt-tape-dead-yet.html
[6]: https://www.networkworld.com/article/3302804/storage/the-correct-levels-of-backup-save-time-bandwidth-space.html
[7]: https://www.networkworld.com/article/3261113/why-a-bare-metal-cloud-provider-might-be-just-what-you-need.html?nsdr=true
[8]: https://www.networkworld.com/article/3243262/what-is-a-hypervisor.html?nsdr=true
[9]: https://cloud.vmware.com/community/2019/08/08/vmware-hcx-enterprise-non-vsphere-vsphere-workload-migration/
[10]: https://cloud.vmware.com/community/2019/08/08/hcx-enterprise-replication-assisted-vmotion/
[11]: https://cloud.vmware.com/community/author/ninaddesai/
[12]: https://cloud.vmware.com/community/2019/08/08/introducing-hcx-enterprise/
[13]: https://www.networkworld.com/article/3428497/google-cloud-to-offer-vmware-data-center-tools-natively.html
[14]: https://www.networkworld.com/article/3402981/vmware-eyes-avi-networks-for-data-center-software.html
[15]: https://www.facebook.com/NetworkWorld/
[16]: https://www.linkedin.com/company/network-world
