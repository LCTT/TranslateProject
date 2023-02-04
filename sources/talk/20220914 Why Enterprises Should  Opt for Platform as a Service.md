[#]: subject: "Why Enterprises Should  Opt for Platform as a Service"
[#]: via: "https://www.opensourceforu.com/2022/09/why-enterprises-should-opt-for-platform-as-a-service/"
[#]: author: "Gopala Krishna Behara https://www.opensourceforu.com/author/gopalakrishna-behara/"
[#]: collector: "lkxed"
[#]: translator: "onionstalgia"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Why Enterprises Should  Opt for Platform as a Service
======
*Platform as a Service enables quick and easy creation of Web applications without the necessity of buying and maintaining the software and infrastructure underneath it. This article explains why it’s useful.*

Platform as a Service (PaaS) refers to cloud computing services that provide a platform for customers to develop, run and manage applications without the complexity of building and maintaining the infrastructure associated with developing and launching them. This is the core platform on which cloud native applications and supporting systems are based.

PaaS typically involves diverse application software infrastructure capabilities including application platforms, integration platforms, business analytics platforms, event-streaming services and mobile back-end services. In addition, it includes a set of monitoring, management, deployment and related capabilities.

Developers are keen on getting their environments up without waiting, while operations teams care about performance and stability. This often gives rise to some conflict between them. PaaS creates a peaceful environment for both groups. An application platform delivered as a service is described as PaaS, and is used to deploy the user code. Cloud Foundry, Cloudify and OpenShift open source environments can be used as PaaS.

### PaaS adoption pattern

Cloud computing must satisfy five essential characteristics — on demand service, access network, resource pooling, elasticity and measured services. To achieve these, cloud computing provides three kinds of service models: Software as a Service (SaaS), Platform as a Service (PaaS) and Infrastructure as a Service (IaaS).

The key business drivers of PaaS adoption are:

* Reduction of capex and opex to deliver business services
* Minimising IT costs by improving the delivery time and quality of the application development and delivery
* Increasing the flexibility and integration between middleware components

**Simple PaaS** is the entry point into the PaaS space. It allows provisioning of application services and exposes them into a self-service catalogue; it automates the deployment and meters the resources used by this service.

*Manage PaaS* manages the SLA and QoS aspects of the provisioned applications such as resiliency, application performance, security, etc.

*Programming PaaS* allows applications to integrate with external applications or public clouds, and to implement auto-scaling and cloud-bursting scenarios.

*Process-oriented PaaS* allows implementation of a DevOps process by creating a continuous delivery flow that automates the build, test and delivery of applications into a cloud environment.

In addition to these adoption patterns, there are other variations of PaaS, as listed below. These variations might align to one of the patterns explained above.

**iPaaS:** Integration Platform as a Service (iPaaS) is a suite of cloud services that enables development, execution and governance of integration flows connecting any combination of on-premises and cloud-based processes, services, applications and data within individuals or across multiple organisations. Examples are MuleSoft CloudHub and BizTalk.

**mPaaS:** Mobile Platform as a Service (mPaaS) is a provision of an interactive development environment (IDE) for the creation of mobile apps. It supports multiple mobile operating platforms.

**dbPaaS:** Database Platform as a Service (dbPaas) is an on-demand, secure and scalable self-service database platform that automates the provisioning and administration of databases. dbPaaS makes it easier to scale databases and makes them more reliable.

**IoTPaaS:** This provides common infrastructure to enable communication, security, analytics and management for heterogeneous IoT topologies. It provides simpler and agile models for building IoT solutions.

**bpmPaaS:** Business process management PaaS (bpmPaaS) is a complete pre-integrated BPM platform hosted in the cloud and delivered as a service. It is leveraged for the development and execution of business processes and workflow-centric applications across enterprises. Examples are Pega cloud, and OpenText Cordys cloud.

Some basic characteristics of PaaS are:

* Services to develop, test, deploy, host and maintain applications in the same integrated development environment
* Multi-tenant architecture, in which multiple concurrent users use the same development application
* Built-in scalability of deployed software, including load balancing and failover
* Integration with heterogeneous platforms and systems
* Support for development team collaboration
* Tools to handle billing and subscription management

### Key open source Platforms as a Service

Before choosing a PaaS, enterprises must consider the following:

* Deployment flexibility
* Ease of operations
* Choice of application stacks
* Language, database and framework support
* Scaling capabilities
* QoS
* Tooling for development and operations
* How well it fits your business

Let’s now take a quick look at some popular open source PaaS.

**Cloud Foundry:** This PaaS provides a choice of clouds, developer frameworks and application services. Cloud Foundry makes it faster and easier to build, test, deploy and scale applications.

It has different distributions, of which the popular ones are Pivotal and IBM. It contains application runtime and container runtime. It also has Pivotal application service and Pivotal container service.

**OpenShift:** This is Red Hat’s cloud computing PaaS offering. It is an application platform in the cloud, where application developers and teams can build, test, deploy and run their applications.

**Cloudify:** Cloudify was developed and designed on the principles of openness to power the IT transformation revolution. It enables organisations to design, build and deliver various business applications and network services. The latest version of Cloudify is 4.3, which incorporates enhanced features like advanced security, control and true self-service. Cloudify 4.3 introduced a totally new concept for container orchestration with Kubernetes.

| Functionality | Cloud Foundry | Cloudify | OpenShift | 
| :- | :- | :- | :- |
| Core functionality | Cloud controller | Manager | Broker | 
| Providing third party database services | Service broker | Agent | Cartridge | 
| Routing of incoming traffic | Router | Manager | REST API | 
| Querying the state of apps | Cloud controller | CLI client | Broker | 
| Messaging | Message bus | Manager | Broker | 
| App instance management | Droplet execution agent | Agent | Node | 
| Application state management | Health manager | Manager | Broker | 
| Broker | Warden | Agent | Gear | 
| Load balancing of user requests | Droplet execution agent | Manager | Broker | 
| Framework provider | Blob store | Agent | Cartridge | 
| Technology | 
| Languages | Java, Ruby, Scala, Node.js, Groovy, Grails, PHP, Go, Python | Java, PHP, Ruby | Java, Ruby, Node.js, PHP, Python, Perl, JavaScript | 
| Databases | MongoDB, MySQL,
PostgreSQL | MySQL, MongoDB | MongoDB, MySQL, PostgreSQL | 
| Frameworks | Spring, Rails, Grails, Play Sinatra | JavaScript, Node.js | Rails, Flask, Django, Drupal, Vertx | 
| Horizontal scaling | Yes | Yes | Yes | 
| Vertical scaling | Yes | No | Yes | 
| Auto scaling | Yes | Yes | Yes |

Table 1 lists the basic functionality and its corresponding Cloud Foundry, Cloudify and OpenShift architectural components. This is purely based on my views and the authenticity of the features supported needs to be validated with the cloud provider.

From the industry adoption statistics we can clearly make out that PaaS adoption is picking up very rapidly. PaaS enables enterprise applications to be cloud-agnostic, so that they can run on any cloud platform — whether public or private. This means that a PaaS application developed on Amazon AWS can easily be ported to Microsoft Azure, to VMWare vSphere, to Red Hat RHEV, etc.

PaaS is useful when multiple developers are working on a development project or when external users need to collaborate with the development process. So it is best suited for agile software development, because it eases the difficulties around rapid development and iteration of software.

### Acknowledgements

The author thanks Kiran M.R. and Raju Alluri of the digital architecture practice of Wipro Ltd for giving their time and support to this article.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/why-enterprises-should-opt-for-platform-as-a-service/

作者：[Gopala Krishna Behara][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/gopalakrishna-behara/
[b]: https://github.com/lkxed
