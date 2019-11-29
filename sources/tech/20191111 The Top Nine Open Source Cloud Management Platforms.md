[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Top Nine Open Source Cloud Management Platforms)
[#]: via: (https://opensourceforu.com/2019/11/the-top-nine-open-source-cloud-management-platforms/)
[#]: author: (Dr Anand Nayyar https://opensourceforu.com/author/anand-nayyar/)

The Top Nine Open Source Cloud Management Platforms
======

[![][1]][2]

_A cloud management platform (CMP) is a comprehensive software suite with integrated tools that an enterprise can use to monitor and control cloud computing resources. There are many CMPs out there, both open source and proprietary. This article explores how cloud platforms work, their capabilities, as well as a selection of the top open source cloud platforms of the day._

In recent times, all the enterprises that have started or have adopted cloud computing face new challenges with regard to ensuring the same visibility in cloud applications as they have with their on-premise apps. With any cloud-based full implementation, the issues that users face include preserving the integrity, usability and security of all the data migrated online. According to John Webster, senior partner and analyst for the Evaluator Group, and whose research area is the hybrid cloud and Big Data, “As enterprise IT operations start to expand our capabilities and resources into the cloud, we now want to manage cloud resources with the same policy, procedure, guidance and expectations that we have over our existing IT environment.”

The only solution to all the issues arising from cloud-based implementations is a cloud management platform (CMP). This provides a rich set of capabilities for discovery, template-based provisioning, orchestration and automation. It also enables operational monitoring and management, governance and cost optimisation across multiple public and private clouds as well as virtual and bare-metal servers.

A CMP is a comprehensive suite with integrated software tools that an enterprise can use to monitor and control cloud computing resources. An enterprise can use a CMP for either a private or public cloud, but CMPs facilitate toolsets for hybrid and multi-cloud models to centralise the control of various cloud-based infrastructures.

A wide range of tools is available to deal with these challenges and help companies efficiently operate applications and services in the cloud. Vendors offer a variety of cloud management tools that enable IT organisations to build, purchase, manage, monitor, track and optimise their cloud resources. With the help of these tools, organisations can save time and effort while allowing IT staff to focus on more strategic goals. These tools also help in monitoring users’ interactions with the cloud infrastructure and in managing resource allocation.

In the cloud marketplace, different tools have unique feature sets. Capabilities include unified management across multiple clouds, integration with third-party tools for configuration and monitoring purposes, dashboards and reports for detailed information about resource consumption, notifications and alerts when predefined thresholds are reached, and controlled access to resources to avoid over usage or unauthorised access. By simplifying the management of cloud environments and reducing the complexity and cost of managing multiple activities, the right cloud management tool can bring speed, flexibility, security and cost efficiency to any organisation.

![Figure 1: Cloudstack architecture][3]

So the important question is, “Which CMP is the best?” Well, there are both commercial and open source options. Nowadays, open source technology has become a central facet of cloud computing for many users around the world. In this article, we discuss the top open source cloud management platforms to assist admins, systems analysts, network security as well as cloud computing professionals select the best platform, based on the requirements of the enterprise.

Before we dive into the types of open source CMPs, let’s discuss some of their broad capabilities and how they work.

According to analysis by Market Research Future (MRF), the global CMP market was valued at US$ 8.18 billion in 2018 and is expected to reach US$ 26.77 billion by 2022, registering a CAGR of 18.4 per cent during the forecast period. The market growth is attributed to the rising need for enterprises to have greater control over IT spending, the surge in the adoption of heterogeneous and multi-modal IT service delivery environments, the rapid deployment of virtualised workloads, and improved operational efficiency. On the other hand, insufficient technical expertise and the rising security concerns for platforms developed in-house are some of the factors expected to hinder the market growth during the assessment period.

**How cloud management platforms work**
A CMP is deployed into existing cloud environments as a virtual machine (VM) consisting of a database and server. The server communicates with application programming interfaces (APIs) to connect the database and virtual resources held in the cloud. The database collects the information on how the virtual infrastructure is performing and sends an analysis to the Web interface, where systems administrators can analyse the cloud performance. The whole interconnectivity relies on the operating system, which commands all the different technologies that make up clouds and also deploys cloud management tools.

A CMP should be capable of the following things.

  * **Strong integration with IT infrastructure:** CMPs should be customised as per the enterprise’s needs, and must meet the requirements of the operating systems, apps, storage frameworks and anything else running in the cloud.
  * **Automating manual tasks:** CMPs should have self-service capabilities to automate everything, with no human involvement.
  * **Cost management:** CMPs should assist organisations with precision cost forecasting and reporting to easily use and manage all sorts of cloud services.
  * **Service management:** They should assist the IT team to monitor cloud-based services to help in capacity planning, workload deployment, asset management and incident management.
  * **Governance and security:** CMPs should enable administrators to enforce policy-based control of cloud resources, and offer security features like encryption as well as identity and access management.



**Top open source CMPs**
The following are the top open source cloud management platform providers.

**Apache CloudStack**
Apache CloudStack is an open source, multi-hypervisor, multi-tenant, high-availability Infrastructure-as-a-Service CMP, which facilitates creating, deploying and managing cloud services by providing a complete stack of features and components for cloud environments. It uses existing hypervisors such as KVM, VMware vSphere, VMware ESXi, VMware vCenter and XenServer/XCP for virtualisation. CloudStack can also orchestrate the non-technical elements of service delivery such as billing and metering. It presents a range of APIs, allowing it to be integrated with any other platform.

The main components of CloudStack are:

  1. Compute nodes (CNs), which are servers when VM instances are instantiated.
  2. A cluster, which is composed of several CNs that share the same hypervisor and primary storage system.
  3. Pod is a rack of hardware including Layer-2 switches and one or more clusters. It is responsible for storing the VM files, which represent the primary storage.
  4. The Availability Zone is made up of one or more pods, with secondary storage forming a zone. This is equivalent to a single data centre, representing geographic allocations. The secondary storage stores VM templates, ISO images and disk volume snapshots.
  5. The management server is a single point of configuration that provides Web user interfaces and APIs, and manages the assignment of VM instances to particular hosts and of public and private IP addresses to particular accounts, as well as the allocation of storage.



_**Features**_

  * _Self-service user interface:_ AJAX console access, multi-role support, network virtualisation, hypervisor agnostic, usage metering, virtual routers.
  * _LVM support:_ Block storage volumes, NetScaler support, OpenStack Swift integration, LDAP integration, domains and delegated administration.



_**Official website:**_ _<https://cloudstack.apache.org/>_
_**Latest version:**_ 4.12.0.0

![Figure 2: Openstack components][4]

**OpenStack**
OpenStack consists of a set of software tools for building and managing cloud computing platforms for public and private clouds using pooled virtual resources. The tools comprising the OpenStack platform are called projects. They handle core cloud computing services of compute, networking, storage, identity and image services. OpenStack software controls large pools of compute, storage and networking resources throughout a data centre, and is managed through a dashboard or via the OpenStack API.

OpenStack consists of the following nine components.

  * **Nova:** This is the primary computing engine used for deploying and managing a large number of virtual machines and instances to handle computing tasks.
  * **Swift:** This is a storage system for objects and files.
  * **Cinder:** This is a persistent block storage component for compute instances.
  * **Neutron:** This provides networking capability so that all components can communicate quickly.
  * **Horizon:** This is a GUI interface for OpenStack.
  * **Keystone:** This provides identity services for OpenStack.
  * **Glance:** This provides image services and allows images (virtual copies of hard disks) to be used as templates for deploying new virtual machine instances.
  * **Ceilometer:** This provides telemetry services, and billing services to individuals.
  * **Heat:** This is an orchestration component that allows developers to store the requirements of cloud applications in files.



_**Features**_

  * _Services:_ Messaging, clustering, containers, compute, identity, app data protection as a service, events, metadata indexing as service, workflows, DNS, database as a service, bare metal provisioning, optimisation and deployment, governance, and benchmarking.
  * Web front-end, Big Data processing framework, container orchestration engine, key management, and NFV orchestration.



_**Official website:** <http://www.openstack.org>_
**Latest version:** Stein

**ManageIQ**
This is an open source CMP for hybrid IT environments, with a mix of public and private clouds. It provides tools for managing small and large environments as well as supports multiple technologies like virtual machines, public clouds and containers. It allows users to download any virtual appliance and deploy copies of it into virtualisation platforms like OpenStack or VMware. Three main variants of ManageIQ are available: Vagrant, Docker and Public Cloud.

ManageIQ is written in Ruby and uses the Ruby on Rails framework. The ManageIQ software is shipped as a pre-built virtual appliance, roughly 1GB in size. The appliance is based on the CentOS operating system and includes an embedded PostgreSQL database. Since the Darga release, a container based version has also been made available. An appliance can be used on its own, or it can be part of a three-tier federated architecture. In the latter case, the operator configures zones, regions and a single super-region. Appliances can be assigned to a specific zone or region and are configured with specific roles so that work is coordinated within the region. Most roles are multi-master and distribute work automatically in a queue, but some roles like the database are singletons.

**Features**

  * Offers insights through discovery, monitoring, utilisation, performance, reporting, analytics, chargeback and trending.
  * Controls security, compliance, alerting, policy-based resource and configuration management.
  * Automates IT processes, tasks and events, provisioning, workload management and orchestration.
  * Integrates systems management, tools and processes, event consoles, CMDB, RBA and Web services.



_**Official website:** <http://manageiq.org>_
**Latest version:** Hammer-10

**Cloudify**
Cloudify is an open source software cloud and NFV orchestration product that uses OASIS TOSCA technology. It is designed using Python. Cloudify allows users to model and automate an application’s entire life cycle. This includes deployment to a cloud or data centre environment, the management of the deployed application, failure detection and ongoing maintenance. The platform is ideal for users who want to launch prebuilt applications in the cloud without handling the technical aspects.

_**How it works:**_ It translates applications into a blueprint configuration written in the YAML format and describes how the application should be deployed, managed and automated. It identifies the resources and events for every application tier. The cloud orchestrator uses blueprints to install applications in the cloud using a cloud API, which creates VMs and installs Cloudify agents, and is used to orchestrate, install and start the application. Cloudify monitors the application for any pre-defined metrics and displays results on the dashboard.

Cloudify enables users to deploy applications using two main methods — by using the CLI and by using a Cloudify manager. The latter is a dedicated environment comprising an open source stack which enables the user to:

  * Use plugins (such as Docker, Script, Chef and Puppet plugins) to manage application hosts.
  * Keep a directory of the user’s blueprints.
  * Create multiple deployments for each blueprint and install them.
  * Execute healing, scaling and other custom workflows on installed applications.
  * Run multiple workflows concurrently.
  * View an application’s topology.
  * Perform different tasks using the Cloudify Web UI view metrics.



Cloudify performs the following tasks.

  * _Application modelling:_ This describes the application with all its resources.
  * _Orchestration:_ This maintains and runs an application, and performs ongoing operations such as scaling, healing and maintenance.
  * _Pluggability:_ This provides reusable component abstraction for the system.
  * _Security:_ This provides secure communication via SSL, which enables clients to ensure that the data set received is encrypted.



_**Features**_
Easy orchestration, built-in node types, a blueprints catalogue, role-based access control, IT security and governance, network and TOSCA orchestration, new NFV capabilities, custom widgets and LDAP integration.

_**Official website:**_ <http://www.cloudify.co>
_**Latest version:**_ 5.0

**Mist.io**
Mist.io is a platform that simplifies cloud management and helps users prevent vendor and complexity lock-in. It offers cost and usage reporting, RBAC, management, provisioning, orchestration, monitoring and automation for servers across public and private clouds, Docker containers and KVM hypervisors. It gives actionable alerts so users can address operational issues from anywhere, using any Web-connected device.

Mist.io offers a unified interface for performing common management tasks like provisioning, orchestration, monitoring and automation. It works from any device, including laptops, tablets and phones, to help users take action from where ever they are. Due to the RESTful API and command line tools, it’s easy to integrate it in the user’s existing workflow. Because Mist.io abstracts the infrastructure level, users can replicate the entire setup across providers in a matter of seconds. It’s a freemium service with an open source component that aims to become the de facto standard for multi-cloud management and a broker of cloud computing services. It’s targeted at developers, systems administrators and any organisation that performs on-premise, remote, or hybrid computing.

_**Features**_

  * Controls public and private clouds, containers, bare metal servers and more.
  * Has fine grained controls for delegating access to team members.
  * Enables cost and usage reporting across the whole infrastructure.
  * Orchestrates repeatable deployments, and automates common responses.
  * Enforces policies consistently, across any computing platform.



_**Official website:** <http://www.mist.io>_

**VirtEngine**
VirtEngine is an open source CMP that can be used to build private or public clouds, which support IaaS, PaaS and SaaS. This Platform as a Service system allows customers to deploy applications in a few clicks. VirtEngine has a wide range of applications and a simple user interface for customers to self-serve their needs. It helps users build both public and private clouds within very little time, and supports infrastructure platforms and other storage devices. It is also very scalable and comes with automation tools that provide companies a competitive advantage. VirtEngine by DET.io is available as two different solutions for the public and private cloud. The public cloud allows users to build their own cloud and offer servers to customers. It is available as a mini edition as well as a complete solution. The private cloud is available as an open source and free solution as well as a powerful solution for enterprises that supports HA and other enterprise features.

_**Features**_

  * Access control, demand and supply monitoring, cost management, multi-cloud management, one-click apps, and automatic launch.
  * DNS support, self-healing, cloud-native, multi-locations, Docker containers, cloud virtual machines and migration tools.



_**Official website:**_ _<http://www.virtengine.com>_

![Figure 3: OpenNebula components][5]

**openQRM**
openQRM is a free and open source cloud computing management platform for managing heterogeneous data centre infrastructures. It provides a complete, automated workflow engine for all bare metal and VM deployment, as well as for all IT sub-systems, enabling professional management and monitoring of the data centre and cloud capacities. The openQRM platform manages a data centre’s infrastructure to build private, public and hybrid Infrastructure as a Service clouds. openQRM orchestrates storage, networks, virtualisation, monitoring and security implementation technologies to deploy multi-tier services as virtual machines on distributed infrastructures, combining both data centre resources and remote cloud resources, according to allocation policies.

openQRM provides a Web-based, open source data centre management and cloud platform with the help of which various internal and external technologies can be abstracted and grouped within a common management tool. This management system also takes care of provisioning, high availability and the monitoring of services offered. Instead of providing individual tools for individual tasks, such as configuration management and system monitoring, openQRM integrates proven open source management tools such as Nagios and Zabbix.

_**Architecture:**_ The openQRM system architecture comprises three components — data centre management and cloud platform, the plugin API, and the hybrid cloud connector.

The data centre management and cloud platform provides the basic functionality of openQRM, and uses the plugin API to communicate with the data centre’s resources that are also installed on the local network (hypervisor, storage and network). openQRM comes with support for five virtualisation environments — VMware ESX, Citrix XenServer, KVM, LXC and OpenVZ.

openQRM can handle LVM, iSCSI, NFS, ATA over Ethernet, SAN Boot and Tmpfs storage. For the network configuration, openQRM integrates critical network services such as DNS, DHCP, TFTP and Wake-on-LAN. The network manager included with the package helps administrators configure the network bridges required for these services. The hybrid cloud connector takes care of connecting with external data centre resources, such as Amazon Web Services, Eucalyptus, or OpenStack cloud.
The openQRM cloud portal provides a Web interface that internal or external users can access to compile IT resources, as needed.

_**Features**_

  * Supports P2V, P2P, V2P, V2V migrations and high availability.
  * Integrates with all major open and commercial storage technologies.
  * Integrated billing system that maps CCU/h (cloud computing units) to real currency.
  * Self-service portal for end users provisions new servers and application stacks in minutes!



_**Official website:** <http://openqrm-enterprise.com>_

**OpenNebula**
OpenNebula is a simple yet powerful and flexible turnkey open source solution to build private clouds and manage data centre virtualisation. The OpenNebula platform manages a data centre’s virtual infrastructure to build private, public and hybrid implementations of Infrastructure as a Service. The two primary uses of the OpenNebula platform are data centre virtualisation solutions and cloud infrastructure solutions.

OpenNebula was designed to help companies build simple, cost-effective, reliable, open enterprise clouds on existing IT infrastructure. It provides flexible tools that orchestrate storage, network and virtualisation technologies to enable the dynamic placement of services. The design of OpenNebula is flexible and modular, to allow integration with different storage and network infrastructure and hypervisor technologies.

OpenNebula components include the following three layers:

1\. The driver layer is responsible for the creation, start-up and shutdown of virtual machines (VMs), for allocating storage to VMs, and for monitoring the operational status of physical machines (PMs).
2\. The core layer manages the VMs’ full life cycle, including setting up virtual networks dynamically, dynamic IP address allocation for VMs and managing VMs’ storage.
3\. The tool layer provides interfaces, such as the command line interface (CLI), to communicate with users.

_**Features**_

  * Supports numerous APIs like AWS EC2, EBS and OGF OCCI.
  * Powerful UNIX based CLI for administration.
  * GUI for cloud customers and data centre professionals.
  * Resource allocation via fine-grained ACLs; load balancing, high availability, high performance computing.
  * Powerful scheduling for task management.
  * Supports integration with LDAP and Active directory.
  * Supports SSH and X.509 for security, and even supports login token functionality.



_**Official website:** <http://www.opennebula.org>_
_**Latest version:**_ 5.8.4

**Eucalyptus**
Eucalyptus is an acronym for Elastic Utility Computing Architecture for Linking Your Programs to Useful Systems. It is an open source software framework that provides the platform for private cloud computing implementation on computer clusters. Eucalyptus implements Infrastructure as a Service (IaaS) methodology for solutions in private and hybrid clouds.

Eucalyptus provides a platform for a single interface so that users can calculate the resources available in private clouds and the resources available externally in public cloud services. It is designed with extensible and modular architecture for Web services. It also implements the industry standard Amazon Web Services (AWS) API.

![Figure 4: Eucalyptus architecture][6]

The Eucalyptus user console provides an interface for users to provision and configure compute, network and storage resources on their own. Eucalyptus can run multiple versions of Windows and Linux virtual machine images. Users can build a library of Eucalyptus machine images (EMIs) with application metadata that is decoupled from infrastructure details to allow them to run on Eucalyptus clouds.

Amazon Machine Images are also compatible with Eucalyptus clouds. VMware images and vApps can be converted to run on Eucalyptus clouds and AWS public clouds. Eucalyptus user identity management can be integrated with existing Microsoft Active Directory or LDAP systems to have fine-grained role-based access control over cloud resources. Eucalyptus supports storage area network devices to take advantage of storage arrays, thus improving performance and reliability. Eucalyptus machine images can be backed by EBS-like persistent storage volumes, improving the performance of image launch time and enabling fully persistent virtual machine instances. Eucalyptus also supports direct-attached storage.

_**Architecture:**_ The Eucalyptus architecture has the following five main components.

  * **Cloud controller (CLC):** CLC acts as the administrative interface for cloud management and performs high-level resource scheduling and system accounting. The CLC accepts user API requests from command-line interfaces like euca2ools or GUI-based tools like the Eucalyptus management console, and manages the underlying computer storage and network resources.
  * **Scalable object storage (SOS):** This is a pluggable service that allows infrastructure administrators the flexibility to implement scale-out storage on top of commodity resources using open source and commercial solutions that implement the S3 interface.
  * **Cluster controller (CC):** Written in C, this acts as the front-end for clusters within the Eucalyptus cloud and communicates with the storage and node controllers.
  * **Storage controller (SC):** Written in Java, this communicates with the cluster controller and the node controller, managing Eucalyptus block volumes and snapshots to instances within its specific cluster. It interfaces with storage systems including Local, NFS, iSCSI and SAN.
  * **Node controller (NC):** This is written in C, hosts the virtual machine instances and manages the virtual network endpoints. It caches images from scalable object storage, and creates and caches instances.



_**Features**_

  * Works with multiple hypervisors including VMware, Xen and KVM.
  * Communication within internal processes is secured through SOAP and WS-Security.
  * Offers administrative features such as user and group management, and reports.
  * Well-defined interfaces (via WSDL, since they are Web services) and thus can be easily swapped out for custom components.
  * Flexible and can be installed on a very minimal setup.



_**Official website:** <https://www.eucalyptus.cloud/>_
_**Latest version:**_ 4.4.3

![Avatar][7]

[Dr Anand Nayyar][8]

The author works in a Graduate School, Duy Tan University in
Vietnam. He loves to work and research on open source technologies,
sensor communications, network security, Internet of Things etc. He
can be reached at [anandnayyar@duytan.edu.vn][9]. YouTube channel:
Gyaan with Anand Nayyar at [www.youtube.com/anandnayyar][10].

[![][11]][12]

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/11/the-top-nine-open-source-cloud-management-platforms/

作者：[Dr Anand Nayyar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/anand-nayyar/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Young-man-with-the-head-in-the-clouds-thinking_15259762_xl.jpg?resize=505%2C487&ssl=1 (Young-man-with-the-head-in-the-clouds-thinking_15259762_xl)
[2]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Young-man-with-the-head-in-the-clouds-thinking_15259762_xl.jpg?fit=505%2C487&ssl=1
[3]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-1-CloudStack-architecture.jpg?resize=350%2C250&ssl=1
[4]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-2-OpenStack-components.jpg?resize=350%2C226&ssl=1
[5]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-3-OpenNebula-components.jpg?resize=350%2C196&ssl=1
[6]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/11/Figure-4-Eucalyptus-architecture.jpg?resize=350%2C241&ssl=1
[7]: https://secure.gravatar.com/avatar/ab87a2bd63788f386c2d815c0f7d2d29?s=100&r=g
[8]: https://opensourceforu.com/author/anand-nayyar/
[9]: mailto:anandnayyar@duytan.edu.vn
[10]: http://www.youtube.com/anandnayyar
[11]: https://opensourceforu.com/wp-content/uploads/2019/11/assoc.png
[12]: https://feedburner.google.com/fb/a/mailverify?uri=LinuxForYou&loc=en_US
