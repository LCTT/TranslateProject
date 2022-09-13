[#]: subject: "Cloud Workspaces: An Overview"
[#]: via: "https://www.opensourceforu.com/2022/09/cloud-workspaces-an-overview/"
[#]: author: "K. Narasimha Sekhar https://www.opensourceforu.com/author/k-narasimha-sekhar/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Cloud Workspaces: An Overview
======
*The demand for virtual workspaces that enable access to applications, services and information from anywhere has increased manifold due to the global pandemic. Cloud computing has changed the way companies do business today. Rapid technological developments in a cloud-centric digital workspace are enabling a streamlined strategy to support geographically distributed employees in global enterprises. This article looks deeper into cloud workspaces.*

Cloud-centric digital workspaces help improve the performance, productivity, agility and scalability of a business, and are excellent for infrastructure management and automation. The success of a shift to a cloud workspace depends on how well it is aligned and customised to the enterprise’s use cases and user personas.

### Benefits of cloud workspaces

Like most other cloud services, cloud workspaces offer many benefits. Some key ones are:

* Cloud workspace service costs are predictable and the subscription model is easy to manage. There is little or no on-premises infrastructure that a business has to invest in to get started with cloud workspaces, and there is no costly hardware to maintain.
* With cloud-hosted desktops, you can deliver applications to any computing device, including desktop computers, laptops, tablets, and smartphones. It gives employees the freedom of choice. They can be given secure access from anywhere on any device at any time.
* Because devices and data are stored in secured locations, even if employees lose their laptop or phone, there is nothing to steal from it, and so there is no security breach.
* Cloud workspaces make remote working much simpler. They help IT teams to support work from home.
* Collaboration and file sharing is much simpler as all the infrastructure is on the cloud.
* IT teams can spin up new cloud desktops faster. Users quickly get access to desktops and apps when they need them, making them more efficient and IT more agile.
* Availability is much better and disaster recovery faster with cloud workspaces. The underlying cloud platform offers availability sets, zones, and regional pairs that improve availability.
* Flexibility and scalability are two major benefits of cloud desktops, as they allow businesses, whether large or small, to grow at their own pace, adding and taking away licences as they’re required.
* It’s also much more straightforward to roll out updates for software or add new applications, without having to worry about updates and security fixes on individual machines.
* Setting up and scaling DevOps environments for the enterprise product teams is simpler and faster with cloud workspaces. Usage of readily available cloud services for development, testing, and analytics makes IT agile.
* Cloud vendors offer IaaS, PaaS, and SaaS services that enterprises can choose from based on their need, comfort, strategy, and policies.
* By unifying all of a business groups’s cloud tools, IT departments can take advantage of a ‘single pane of glass’ approach to management and administration, ensuring that performance remains smooth. Integration between apps is seamless.
* With cloud workspaces, security, data governance and compliance can be easily enforced and monitored.

### The challenges

Cloud desktops can be a challenge if the Internet connection is not reliable and patchy. In case the applications are resource-intensive, cloud workspaces can be costlier than on-premises in the long run. Other challenges include cloud vendor lock-in unless enterprises plan carefully and take a vendor-neutral approach. Enterprises should evaluate cloud costs on a continuous basis to optimise consumption, and should be aware of hidden charges. IT departments need to ensure that they avoid cloud sprawl, and keep their digital tools as unified and streamlined as possible.

### Cloud workspace deployment

A cloud workspace is virtual desktop infrastructure that can be used in multiple ways:

* Greenfield public cloud deployment with Microsoft Windows virtual desktop, Windows 365, Amazon WorkSpaces, Google Workspace, etc.
* Migration of on-premises remote desktop services (RDS)/VDI deployments to cloud workspaces.
* Hybrid deployments by separating control plane and workload layers, making use of cloud service brokers such as Citrix Cloud, VMware Cloud, etc. Workload can be hosted in the cloud or even on-premises.
* A cloud workspace can also be a unified platform that allows an organisation to monitor multiple projects across different accounts, and even different cloud providers, all in one location.

To facilitate a smooth transition to a robust cloud workspace environment, IT teams should focus on the activities across five phases, as listed in Table 1.

| - | - |
| :- | :- |
| Phase | Activity | 
| Assessment | Identification of the requirements is an important step, based on which we can choose the right VM instance type, enabling optimisation with multi-session operating systems, persistence, access models, etc. The existing environment must be assessed to understand the user landscape, including personas, access methods and experience levels, data landscape, as well as the application and infrastructure landscape. Cloud vendors provide monitoring tools, the data trends from which can be used to find resource demands, application utilisation, etc. | 
| Design | Design a secure and resilient cloud workspace environment, including networking, storage, virtual machine (VM) instances and security, based on business needs and requirements. Most of the cloud vendors provide well-architected frameworks — best practices that help in planning and designing the cloud workspaces. | 
| Build | Build and deploy user persona based cloud workspace host pools and Windows 11/10/RDS images with base applications and application layering as per the approved design. Persona analysis is very important to size properly and to meet end user demands. | 
| Migration | Plan and perform a phased migration to the new environment with pilot testing, change management and end user training. | 
| Support | After successful deployment and migration, provide managed support to monitor and maintain the health of the solution as well as perform ongoing optimisation. Cloud vendors offer native services for monitoring, self-healing, self-service, alert triggers, security, and compliance. Enterprises can quickly customise these to suit their needs. |

### Microsoft workspace offerings

Microsoft offers two cloud workspace models:

* Azure Virtual Desktop, which is optimised for flexibility
* Windows 365, which is optimised for simplicity

**Azure Virtual Desktop** (formerly known as Windows Virtual Desktop) is a flexible cloud virtual desktop infrastructure (VDI) platform that securely delivers virtual desktops and remote apps. Enterprises can use it to set up a scalable and flexible environment:

![Figure 1: Azure Virtual Desktop][1]

* Create a full desktop virtualisation environment in your Azure subscription without running any gateway servers.
* Publish host pools as you need to accommodate diverse workloads.
* Bring your own image for production workloads or tests from the Azure Gallery.
* Reduce costs with pooled, multi-session resources. With the new Windows 11 and Windows 10 Enterprise multi-session capability, exclusive to Azure Virtual Desktop and remote desktop session host (RDSH) roles on Windows Server, you can greatly reduce the number of virtual machines and operating system overhead while still providing the same resources to your users.
* Provide individual ownership through personal (persistent) desktops.
* Use an auto scale to automatically increase or decrease capacity based on time of day, specific days of the week, or as demand changes, thus helping to manage cost.
* Provide full control over management and deployment, plus options for Citrix and VMware integration.

**Windows 365** is a complete software-as-service (SaaS) solution that securely streams your personalised Windows experience – all your apps, content and settings – to any device.
It offers:

* Windows 10 and Windows 11 personalised desktops
* Management and deployment with familiar desktop tools and skills Predictable per user pricing

### Amazon WorkSpaces

Amazon WorkSpaces is a managed, secure cloud desktop service. You can use it to provision either Windows or Linux desktops in just a few minutes and quickly scale to provide thousands of desktops to workers across the globe. WorkSpaces eliminates the need to procure and deploy hardware or install complex software. You can quickly add or remove users as your needs change. Users can access their virtual desktops from multiple devices or Web browsers.

Amazon WorkSpaces uses PCIOP or WorkSpaces Streaming Protocol (WSP) for pixel streaming workspaces. Figure 2 shows its architecture. For authentication, we can create a standalone managed directory, or connect to a corporate on-premises directory so that existing credentials can be used to obtain seamless access to corporate resources. We can use multi-factor authentication (MFA) for additional security. We can also use AWS Key Management Service (AWS KMS) to encrypt data at rest, for disk I/O, and for volume snapshots.

![Figure 2: AWS WorkSpaces architecture][2]

### Google Workspace

Google Workspace (earlier known as Google Apps and later G Suite) is a collection of cloud computing, productivity and collaboration tools, software and products developed and marketed by Google. It consists of Gmail, Contacts, Calendar, Meet and Chat for communication; Currents for employee engagement; Drive for storage; and the Google Docs suite for content creation. An Admin Panel is provided for managing users and services.

![Figure 3: Google Workspace][3]

Google Workspace adds enterprise features such as custom email addresses at a domain (e.g., *@yourcompany.com*), an option for unlimited Drive storage, additional administrative tools and advanced settings, as well as 24/7 phone and email support.

It gives flexible tools that enable agility, interoperability, customisation and seamless work at scale—across companies, software, devices and distances.

Google Workspace is built with the security, reliability, and cloud infrastructure necessary to keep information, identities, applications, and devices safe. It provides encryption at-rest and in-transit, and automatic protection against sophisticated phishing attacks and emerging malware threats. It helps admins streamline authentication, asset protection, and operational control—all from one dashboard.

### Multi-cloud workspaces

Enterprises may prefer hybrid or multi-cloud scenarios for various reasons — to avoid vendor lock-in, to leverage unique services, to optimise costs, etc. To enable such capability with a single management console and seamless operations, a desktop management fabric service can be leveraged. Vendors such as Citrix, VMware and Workspot are offering such cloud broker/management fabric services.

![Figure 4: Hybrid/multi-cloud workspaces with a common management service][4]

Even though public cloud vendors relieve enterprises from infrastructure management, the latter are still responsible for their tenant management, image management, OS and applications management, user profile and data management, migration from on-premises, choice of VM instances, etc. There are many open source tools available to help enterprises perform these operations. Many of these tools are cloud vendor neutral and provide standard interfaces.

For orchestration and automation, open source tools such as Terraform, Ansible, Jenkins, Chef, etc, can be leveraged. For monitoring, open source tools such as Prometheus, Logillizer, Istio, etc, can be used. Visualisation tools such as Grafana are useful for dashboards.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/cloud-workspaces-an-overview/

作者：[K. Narasimha Sekhar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/k-narasimha-sekhar/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-1-Azure-Virtual-Desktop.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-2-AWS-WorkSpaces-architecture-1.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-3-Google-Workspace-1.jpg
[4]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-4-workspaces-with-a-common-management-service.jpg
