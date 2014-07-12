Red Hat Announces Availability of its OpenStack Platform 5
================================================================================
![](http://farm4.static.flickr.com/3108/3191608123_67e1da2b79_o.jpg)

Red Hat has [announced][1] the general availability of Red Hat Enterprise Linux OpenStack Platform 5, which is the third enterprise release of the company's OpenStack offering. Aside from new features, the platform is clearly being aimed at many types of organizations, including "advanced cloud users, telecommunications companies, Internet service providers (ISPs), and public cloud hosting providers."

OpenStack Platform 5 is based on the latest OpenStack Icehouse release and provides more evidence of how very focused on cloud computing Red Hat has become.

The new release includes a three-year support lifecycle, and [I've made the point before][2] that because of its legendary support for Linux, Red Hat's OpenStack support will be a key differentiator in wooing enterprises.  There has been controversy over whether Red Hat will support OpenStack distributions other than its own, which is significant because a recent OpenStack user survey showed that  [90% of OpenStack deployments today are not running on RHEL][3], but rather use other flavors of Linux and KVM, such as Ubuntu or CentOS.

Other features in Red Hat's new release include:

> **Support for integration with VMware infrastructure**, encompassing virtualization, management, networking and storage. Customers may use existing VMware vSphere resources as virtualization drivers for OpenStack Compute (Nova) nodes, managed from the OpenStack Dashboard (Horizon). Additionally, Red Hat Enterprise Linux OpenStack Platform 5 supports the VMware NSX plugin for OpenStack Networking (Neutron) and the VMware Virtual Machine Disk (VMDK) plugin for OpenStack Block Storage (Cinder).
> 
> **Better placement of workloads across cloud resources**. "Server groups enable workloads to be spread broadly across the OpenStack cloud for enhanced resiliency of distributed applications, or located proximately for lower communications latency and better performance of complex applications."
> 
> **Improved support for virtual machines, supporting new cryptographic security requirements from the United States and United Kingdom**. Using the para-virtualized random number generator device added in Red Hat Enterprise Linux 7, cryptographic routines in guest applications will have access to better quality encryption and experience improved performance.
> 
> **Improved interoperability of networking stacks**. Red Hat claims that the new modular plugin architecture for Neutron eases the addition of new networking technologies to OpenStack deployments. The new architecture provides a path for customers with heterogeneous networking environments who want to use a mix of networking solutions in their OpenStack environment. 

Radhesh Balakrishnan, general manager, Virtualization and OpenStack, Red Hat, said in a statement: 

> “We see momentum behind OpenStack as a private cloud platform of choice from enterprise customers and service providers alike. Red Hat Enterprise Linux OpenStack Platform 5 not only offers a production-ready, supported version of OpenStack Icehouse, but it brings a number of features that will simplify its use, and enhance dependability for enterprise users. Alongside those new features, we’re extending our support lifecycle for Red Hat Enterprise Linux OpenStack Platform, giving users confidence that the solution they deploy will be supported by our global team for the next three years.” 

You can bet on that last point--a three-year support plan--as a key reason why some enterprises will go with Red Hat in the increasingly competitive OpenStack race. And, clearly, Red Hat is tying its future to cloud computing and the OpenStack platform.

--------------------------------------------------------------------------------

via: http://ostatic.com/blog/red-hat-announces-availability-of-its-openstack-platform-5

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.marketwatch.com/story/red-hat-announces-general-availability-of-red-hat-enterprise-linux-openstack-platform-5-2014-07-08
[2]:http://ostatic.com/blog/why-red-hats-openstack-support-must-be-as-inclusive-as-possible
[3]:http://www.openstack.org/blog/2013/11/openstack-user-survey-october-2013/