What you need to know about hybrid cloud
============================================================

### Learn the ins and outs of hybrid cloud, including what it is and how to use it.

![What you need to know about hybrid cloud](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/bus_cloud_database.png?itok=xd6EcK2u "What you need to know about hybrid cloud")
Image by : 

[Jason Baker][10]. [CC BY-SA 4.0][11].

Of the many technologies that have emerged over the past decade, cloud computing is notable for its rapid advance from a niche technology to global domination. On its own, cloud computing has created a lot of confusion, arguments, and debates, and "hybrid" cloud, which blends several types of cloud computing, has created even more uncertainty. Read on for answers to some of the most common questions about hybrid cloud.

### What is a hybrid cloud?

Basically, a hybrid cloud is a flexible and integrated combination of on-premises infrastructure, private cloud, and public (i.e., third-party) cloud platforms. Even though public and private cloud services are bound together in a hybrid cloud, in practice they remain unique and separate entities with services that can be orchestrated together. The choice to use both public and private cloud infrastructure is based on several factors, including cost, load flexibility, and data security.

Advanced features, such as scale-up and scale-out, can quickly expand a cloud application's infrastructure on demand, making hybrid cloud a popular choice for services with seasonal or other variable resource demands. (Scaling up means to increase compute resources, such as CPU cores and memory, on a specific Linux instance, whereas scaling out means to provision multiple instances with similar configurations and distribute them into a cluster.)

Explore the open source cloud

*   [What is the cloud?][1]

*   [What is OpenStack?][2]

*   [What is Kubernetes?][3]

*   [﻿Why the operating system matters for containers][4]

*   [Keeping Linux containers safe and secure][5]

At the center of hybrid cloud solutions sits open source software, such as [OpenStack][12], that deploys and manages large networks of virtual machines. Since its initial release in October 2010, OpenStack has been thriving globally. Some of its integrated projects and tools handle core cloud computing services, such as compute, networking, storage, and identity, while dozens of other projects can be bundled together with OpenStack to create unique and deployable hybrid cloud solutions.

### Components of the hybrid cloud

As illustrated in the graphic below, a hybrid cloud consists of private cloud, public cloud, and the internal network connected and managed through orchestration, system management, and automation tools.

### [hybridcloud1.jpg][6]

![Hybrid cloud model diagram](https://opensource.com/sites/default/files/u128651/hybridcloud1.jpg "Hybrid cloud model diagram")

Model of the hybrid cloud

### Public cloud infrastructure:

*   **Infrastructure as a Service (IaaS) **provides compute resources, storage, networking, firewall, intrusion prevention services (IPS), etc. from a remote data center. These services can be monitored and managed using a graphical user interface (GUI) or a command line interface (CLI). Rather than purchasing and building their own infrastructure, public IaaS users consume these services as needed and pay based on usage.

*   **Platform as a Service (PaaS)** allows users to develop, test, manage, and run applications and servers. These include the operating system, middleware, web servers, database, and so forth. Public PaaS provides users with predefined services in the form of templates that can be easily deployed and replicated, instead of manually implementing and configuring infrastructure.

*   **Software as a Service (SaaS)** delivers software through the internet. Users can consume these services under a subscription or license model or at the account level, where they are billed as active users. SaaS software is low cost, low maintenance, painless to upgrade, and reduces the burden of buying new hardware, software, or bandwidth to support growth.

### Private cloud infrastructure:

*   Private **IaaS and PaaS** are hosted in isolated data centers and integrated with public clouds that can consume the infrastructure and services available in remote data centers. This enables a private cloud owner to leverage public cloud infrastructure to expand applications and utilize their compute, storage, networking, and so forth across the globe.

*   **SaaS** is completely monitored, managed, and controlled by public cloud providers. SaaS is generally not shared between public and private cloud infrastructure and remains a service provided through a public cloud.

### Cloud orchestration and automation tools:

A cloud orchestration tool is necessary for planning and coordinating private and public cloud instances. This tool should inherit intelligence, including the capability to streamline processes and automate repetitive tasks. Further, an integrated automation tool is responsible for automatically scaling up and scaling out when a set threshold is crossed, as well as performing self-healing if any fractional damage or downtime occurs.

### System and configuration management tools:

In a hybrid cloud, system and configuration tools, such as [Foreman][13], manage the complete lifecycles of the virtual machines provisioned in private and public cloud data centers. These tools give system administrators the power to easily control users, roles, deployments, upgrades, and instances and to apply patches, bugfixes, and enhancements in a timely manner. Including [Puppet][14] in the Foreman tool enables administrators to manage configurations and define a complete end state for all provisioned and registered hosts.

### Hybrid cloud features

The hybrid cloud makes sense for most organizations because of these key features:

*   **Scalability:** In a hybrid cloud, integrated private and public cloud instances share a pool of compute resources for each provisioned instance. This means each instance can scale up or out anytime, as needed.

*   **Rapid response:** Hybrid clouds' elasticity supports rapid bursting of instances in the public cloud when private cloud resources exceed their threshold. This is especially valuable when peaks in demand produce significant and variable increases in load and capacity for a running application (e.g., online retailers during the holiday shopping season).

*   **Reliability:** Organizations can choose among public cloud providers based on the cost, efficiency, security, bandwidth, etc. that match their needs. In a hybrid cloud, organizations can also decide where to store sensitive data and whether to expand instances in a private cloud or to expand geographically through public infrastructure. Also, the hybrid model's ability to store data and configurations across multiple sites supports backup, disaster recovery, and high availability.

*   **Management:** Managing networking, storage, instances, and/or data can be tedious in non-integrated cloud environments. Traditional orchestration tools, in comparison to hybrid tools, are extremely modest and consequently limit decision making and automation for complete end-to-end processes and tasks. With hybrid cloud and an effective management application, you can keep track of every component as their numbers grow and, by regularly optimizing those components, minimize annual expense. 

*   **Security:** Security and privacy are critical when evaluating whether to place applications and data in the cloud. The IT department must verify all compliance requirements and deployment policies. Security in the public cloud is improving and continues to mature. And, in the hybrid cloud model, organizations can store highly sensitive information in the private cloud and integrate it with less sensitive data stored in the public cloud.

*   **Pricing:** Cloud pricing is generally based on the infrastructure and service level agreement required. In the hybrid cloud model, users can compare costs at a granular level for compute resources (CPU/memory), bandwidth, storage, networking, public IP address, etc. Prices are either fixed or variable and can be metered monthly, hourly, or even per second. Therefore, users can always shop for the best pricing among public cloud providers and deploy their instances accordingly.

### Where hybrid cloud is today

Although there is a large and growing demand for public cloud offerings and migrating systems from on-premises to the public cloud, most large organizations remain concerned. Most still keep critical applications and data in corporate data centers and legacy systems. They fear losing control, security threats, data privacy, and data authenticity in public infrastructure. Because hybrid cloud minimizes these problems and maximizes benefits, it's the best solution for most large organizations.

### Where we'll be five years from now

I expect that the hybrid cloud model will be highly accepted globally, and corporate "no-cloud" policies will be rare, within only a handful of years. Here is what else I think we will see:

*   Since hybrid cloud acts as a shared responsibility, there will be increased coordination between corporate and public cloud providers for implementing security measures to curb cyber attacks, malware, data leakage, and other threats.

*   Bursting of instances will be rapid, so customers can spontaneously meet load requirements or perform self-healing.

*   Further, orchestration or automation tools (such as [Ansible][8]) will play a significant role by inheriting intelligence for solving critical situations.

*   Metering and the concept of "pay-as-you-go" will be transparent to customers, and tools will enable users to make decisions by monitoring fluctuating prices, safely destroy existing instances, and provision new instances to get the best available pricing.

What predictions do you have for hybrid cloud—and cloud computing in general—over the next five years? Please share your opinions in the comments.

--------------------------------------------------------------------------------

作者简介：

Amit Das - Amit works as an engineer in Red Hat, and is passionate about Linux, Cloud computing, DevOps etc. He is a strong believer that new innovation and technology, in a open way which makes world more open, can positively impact the society and change many lives.



-----------------

via: https://opensource.com/article/17/7/what-is-hybrid-cloud

作者：[Amit Das  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/amit-das
[1]:https://opensource.com/resources/cloud?src=cloud_resource_menu1
[2]:https://opensource.com/resources/what-is-openstack?src=cloud_resource_menu2
[3]:https://opensource.com/resources/what-is-kubernetes?src=cloud_resource_menu3
[4]:https://opensource.com/16/12/yearbook-why-operating-system-matters?src=cloud_resource_menu4
[5]:https://opensource.com/business/16/10/interview-andy-cathrow-anchore?src=cloud_resource_menu5
[6]:https://opensource.com/file/364211
[7]:https://opensource.com/article/17/7/what-is-hybrid-cloud?rate=TwB_2KyXM7iqrwDPGZpe6WultoCajdIVgp8xI4oZkTw
[8]:https://opensource.com/life/16/8/cloud-ansible-gateway
[9]:https://opensource.com/user/157341/feed
[10]:https://opensource.com/users/jason-baker
[11]:https://creativecommons.org/licenses/by-sa/4.0/
[12]:https://opensource.com/resources/openstack
[13]:https://github.com/theforeman
[14]:https://github.com/theforeman/puppet-foreman
[15]:https://opensource.com/users/amit-das
[16]:https://opensource.com/users/amit-das
