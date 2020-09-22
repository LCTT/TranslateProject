[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Challenges and Trends of Cloud Infrastructure: A Q&A with Ying Xiong, Cloud Lab, Futurewei Technologies, Inc.)
[#]: via: (https://www.linux.com/news/challenges-and-trends-of-cloud-infrastructure-a-qa-with-ying-xiong-cloud-lab-futurewei-technologies-inc/)
[#]: author: (Linux.com Editorial Staff https://www.linux.com/author/linuxdotcom/)

Challenges and Trends of Cloud Infrastructure: A Q&A with Ying Xiong, Cloud Lab, Futurewei Technologies, Inc.
======

Ahead of Open Networking &amp; Edge Summit 2020 (being held virtually next week on September 28-30), Linux.com hosted a Q&amp;A with Ying Xiong of Futurewei — a Diamond Sponsor of ONES 2020, where he discussed addressing the challenges and trends of cloud infrastructure in the enterprise digital transformation journey and for the new types of workloads such as AI, 5G and IoT apps.

We hope you enjoy the interview! If you are interested in attending Open Networking &amp; Edge Summit 2020, where you can learn more about the future of Networking, Edge and Cloud, click here to register for just US$50: <https://bit.ly/32F8LXX>. View the full schedule here: <https://bit.ly/33Ct4Vh>. 

**Linux.com: Tell us a bit about your open source journey in Networking, Edge, and Cloud, and specifically help people understand how Futurewei operates independently from Huawei**

**Ying Xiong:** At Futurewei cloud lab, we are actively involved in open source communities and contribute to many open source projects including Kubernetes + KubeEdge, Akraino Edge Stack, Cloud Foundry, and OpenStack. We have attended CNCF conferences, Open Source Summit, Embedded Linux conferences, and Cloud Foundry Summit almost every year since 2015 and delivered keynotes and session talks at many of these conferences or summits. Individually, some of us served as board members in LF, CNCF, and LF Edge as well as OpenStack foundations. Currently, Futurewei is an independent member of LF, CNCF, and LF Edge.

**Linux.com: Digital Transformation and Cloud Infrastructure are two important topics being discussed in the community. Please tell us some key challenges you see in these.**

**Ying Xiong:** In today’s transformational digital journey, Cloud infrastructure and services have been established as the core part of Enterprise’s IT and their digital transformation. More and more enterprises are leveraging cloud computing technologies to accelerate their business innovations by either migrating their applications and data to a public cloud or building their own private cloud or using a hybrid cloud model. The rise of emerging 5G, AI, Edge Computing, and IoT application landscape is offering Cloud Computing further exciting opportunities as well as challenges to meet today’s and tomorrow’s enterprise digitization needs. The following is a list of challenges and trends we’ve observed that face enterprises and cloud technologies themself:

  * As more and more applications move to the cloud, there is an increasing demand for cloud infrastructure to manage the ever-increasing pool of compute nodes with scale and provision and deploy ever-increasing workloads with consistent speed.



This challenge has been driving the new development and/or optimization of distributed cluster management platforms, new cloud networking solutions, and lightweight virtualization technologies such as Container and Serverless.  Current and future compute cluster management platforms will be continuously challenged to manage 100K+ compute nodes in a cluster and be able to provision and startup hundreds and even thousands of application instances within a minute.  There is very limited support for extremely high scalable networking in the virtualized cloud environment, primarily because contemporary cloud networking virtualization solutions are still cobbled together on top of age-old static networking designs. Such solutions are incapable of provisioning &amp; management scale of 10M+ network dynamic endpoints in the cloud.

  * Both Cloud providers and Enterprises have been asking for a “unified ” resource management and orchestration capability as a single pane of glass in order to provide support for managing heterogeneous resource types (bare-metal, VMs, containers, Serverless, Uni-Kernels, etc.) seamlessly.



Modern cloud-native applications are mostly designed for scale-out architectures that are more suited for containerized environments. A typical enterprise cloud environment isn’t just about containers only as containers may not be appropriate for all enterprise workloads and use cases. Most enterprises still run a large number of legacy apps that run on bare metal and traditional VM environments. As a result, the future cloud infrastructure needs to be a “unified” platform in order to meet this challenge and at the same time reduce the management cost for both cloud providers and enterprise customers. 

  * With the convergence of traditional cloud computing and edge computing, and the emergence of new types of workloads such as 5G, AI and IoT applications, customers and the cloud infrastructure platforms are being challenged to manage not only data center resources but also the edge compute nodes to support the new types of distributed applications cross data center and edge site.



The current open source cloud platforms mostly treat Edge and AI as an afterthought. The new open source cloud platform needs to be architected with Edge as part of the overall architecture from day one. For example, AI modeling can be done on the Cloud, while AI inferencing can be done on the Edge connecting to billions of IoT devices and sensors running 5G speed networks. Cloud-Edge computing combined with the optimized latency performance of 5G Core processing can reduce round-trip-time by up to two orders of magnitude in situations where there is tight control over all parts of the communication chain. This has enabled a brand-new class of intelligent cloud applications in the areas of industrial robotic/drone automation, V2X, and AR/VR infotainment, associated innovative business models, etc.

  * Hybrid cloud and multi-cloud trends have become the cornerstone of Enterprise cloud strategy, and application portability cross-cloud becomes a requirement to many companies. Open API and compatibility with the industry cloud ecosystem challenge the new generation of cloud infrastructure technology development.



**Linux.com: What are the key Technology building blocks you envision to help accelerate the journey of Telecom and Cloud Service Providers?**

**Ying Xiong:** With these challenges and trends I mentioned above, we believe that as an industry and an open source community, there is a need for building the next generation open source, hyper-scale and unified cloud infrastructure that works with existing cloud technologies and APIs, and can help enterprises, as well as cloud providers, meet the continuously growing technology challenges. We believe the following are technology building blocks that will help accelerate cloud service providers’ journeys, including Telecom cloud.

  * _Unified Infrastructure_ — Provision and manage cloud resources such as VMs, containers, bare metals as well as serverless compute units. A single infrastructure platform allows cloud providers to simplify cloud compute and network management and significantly reduce manage cost. It also accelerates new cloud services development and manager.


  * _True multi-tenant &amp; strong isolation cloud_ – Provide trusted computing to both customers and service providers.  This building block, including hardware isolation technologies such as SGX, is especially important for the future of cloud computing


  * _Hyper-scale cloud networking_ – Provide fast &amp; large-scale provisioning and management of virtual networks such as VPCs and subnets and network endpoints for cloud applications and services.  Cloud network is the bottleneck for high scalability and high-performance cloud for many cloud providers currently. It is one of basic and critical building blocks for service providers that need millions of virtual network provisioning within a region.


  * _Distributed cloud-edge infrastructure_ – Extend traditional cloud computing to the edge and provide capabilities to provision and manage compute, network resources, and workloads at edge nodes that are closer to the customers and customer data. Sometimes we call this distributed cloud to support new types of distributed applications such as AI, 5G, and IoT apps.


  * _Intelligent cloud infrastructure_ – We believe that future cloud technologies are increasingly building intelligence into the infrastructure to serve better and manage new types of applications while increasing resource utilization for the operators. For example, intelligent scheduling and/or placement of where to run workloads between cloud and edge to achieve better user experience with extremely low latency is increasingly important in building new cloud infrastructure.



**Linux.com: Can you highlight a few open source projects that help resolve some of the challenges you have outlined?**

**Ying Xiong:** An open source cloud, the cloud built by open source technologies such as _**Openstack**_ and _**Kubernetes**_, has led the way in the innovation of cloud computing technology, and we have seen more and more companies leveraging these cloud technologies to accelerate their business innovations. Simultaneously, as we discussed previously, new types of applications and/or workloads pose new challenges to the cloud platforms. 

One of the most recent key initiatives from us is the _**Centaurus**_ open source project aiming to address some of the challenges I mentioned earlier.  The project is a cloud infrastructure platform that can be used to build public or private clouds. It unifies the orchestration, network provisioning, and management of cloud compute and network resources at a regional scale. It offers the same API experience to provide and manage virtual machines, containers, serverless and other types of cloud resources. Centaurus combines traditional IaaS and PaaS layers into one infrastructure platform that can simplify cloud management and reduce cloud providers’ management costs. 

The Centaurus project currently includes the following two open source projects:

  * [_**Arktos**_][1] is a compute cluster management system designed for large scale clouds. It is evolved from Kubernetes and addresses key challenges such as scalability, hard multi-tenancy, and unified runtime to take cloud-native infrastructure to the next level.
  * [_**Mizar**_][2] is an open-source high-performance cloud-network powered by eXpress Data Path (XDP) and Geneve protocol for a highly scalable cloud. It is a simple and efficient solution that lets you create a multi-tenant overlay network of many endpoints with extensible network functions.



**Linux.com: What is Project Centaurus trying to solve? What is the status and where can people find more information?**

**Ying Xiong:** The vision of the Centaurus open source project is to build a unified and large-scale distributed cloud infrastructure platform meeting the challenges discussed in the previous sections. With innovations in high-performance cloud network solutions, unified runtime environment, and hyper-scale cluster management, Centaurus is designed to meet the infrastructure requirements for the new types of cloud workloads such as 5G, AI, Edge, and IoT applications.  Specifically, the Centaurus project is trying to achieve:

  * Unified infrastructure for managing various cloud resources (such as VMs, containers, serverless, bare-metal machines, and others) natively.
  * High-performance cloud network data plane for extremely low latency network traffic forwarding and routing in the cloud.
  * Hyper-scale compute cluster management supports 50K+ compute nodes in a single cluster and 10M+ network endpoint provisioning in a region.
  * Natively support of edge cloud, the cloud extension to manage compute and network resources at edge sites from the cloud.



We would like to invite the open source community to join us to realize the vision of the Centaurus project and to build the ecosystem for the benefits of open source communities.  You can find more information regarding the project documentation and relevant collateral (white paper, blogs, etc.) from the Centaurus website at <https://www.centauruscloud.io/>. There are currently two sub-projects currently under Centaurus project, [_**Arktos**_][1], and [_**Mizar**_][2], that are already open source with a few releases.

**Linux.com: How is this project complementary to projects in CNCF, LF Edge or LF Networking umbrella? **

**Ying Xiong:** We are targeting to launch Centaurus as an independent project under The Linux Foundation since it is trying to solve different sets of challenges or problems than other cloud computing projects in LF. With that being said, we are still looking at potential options and trying to find the best place to donate and host the Centaurus project, which can deliver max benefits for the open source communities and the industry.

Technically, as you may see, Centaurus has compute, network, and edge components and focuses on a complete IaaS+ platform. In contrast, CNCF focuses on container orchestration, LF Edge focusing on Edge infrastructure, and LF networking on network architecture and solution. However, Centaurus is designed with cloud-native architecture, and its components are independent projects that can be used independently with other cloud technologies. Vice versa, we welcome and expect that components from projects in CNCF, LF Edge, and LF Networking and other open source foundations can be plugged into Centaurus as well.   

**Linux.com: Anything else you want to add to help grow participation and support? **

**Ying Xiong:** As a quick recap, Centaurus is an open source Distributed Cloud Native Infrastructure + umbrella project for the 5G, AI, and Edge era. Centaurus currently includes the two core open source projects, a Compute project ([Arktos][1]) and a Networking project ([Mizar][2]).

With the open source community’s participation and support, the Centaurus platform can offer enterprises the hyper-scale and unified management capabilities that will dramatically change the economics of enterprise IT.

We hope the information we have provided here helps pique community interest. We invite all of the open source community members to join us in making Centaurus a viable open cloud infrastructure platform for the future of Enterprise IT digitization journey. It is still in the early stage for Centaurus, and we hope the community can join us and make it a reality. By being part of the most popular open source foundation, a neutral place for hosting the Centaurus project under the umbrella of Linux Foundation will definitely garner tremendous interest from the open source community. We look forward to making all this a great success for the community as a whole.

--------------------------------------------------------------------------------

via: https://www.linux.com/news/challenges-and-trends-of-cloud-infrastructure-a-qa-with-ying-xiong-cloud-lab-futurewei-technologies-inc/

作者：[Linux.com Editorial Staff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/linuxdotcom/
[b]: https://github.com/lujun9972
[1]: https://github.com/futurewei-cloud/arktos
[2]: https://github.com/futurewei-cloud/mizar
