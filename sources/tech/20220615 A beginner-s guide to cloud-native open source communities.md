[#]: subject: "A beginner's guide to cloud-native open source communities"
[#]: via: "https://opensource.com/article/22/6/cloud-native-open-source-communities"
[#]: author: "Anita Ihuman https://opensource.com/users/anita-ihuman"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A beginner's guide to cloud-native open source communities
======
Start participating in the cloud-native ecosystem, even if you're a complete beginner.

![Remote people connected on clouds][1]

Image by: Opensource.com

Some people think the cloud-native ecosystem has a high barrier to entry. At first glance, that looks like a logical assumption. Some of the technologies used in cloud-native projects are complex and challenging, if you're not familiar with them, so you might think you need proven expertise to get involved.

However, looks can be deceiving. This article provides a detailed roadmap to breaking into the cloud-native ecosystem as an open source contributor. I'll cover the pillars of cloud-native architecture, the Cloud Native Computing Foundation (CNCF), and ways to earn more.

Most importantly, after grounding you in the basics of cloud-native practices and communities, the article provides a three-step guide for getting started.

### What is cloud native?

A program is cloud native when it's explicitly developed to be integrated, hosted, and run on a cloud computing platform. Such an application possesses the cloud's inherent characteristics, such as portability, modularity, and isolation, and it adapts to the cloud deployment models of cloud service providers (CSPs).

Cloud computing is a general term for anything that delivers hosted services over the internet. It usually implies clusters of computers, a distributed file system, and containers. A cloud can be private or public. Cloud computing comes in three major categories: Platform-as-a-Service (PaaS), Software-as-a-Service (SaaS), and Infrastructure-as-a-Service (IaaS).

From a business perspective, cloud computing means that rather than investing heavily in databases, software, and hardware, companies opt for IT services over the internet, or cloud, and pay for them as they use them.

### Cloud-native infrastructure

Cloud-native infrastructure includes datacenters, operating systems, deployment pipelines, configuration management, and any system or software needed to complete the lifecycle of applications. These solutions enable engineers to make rapid, high-impact modifications with little effort, implement new designs, and execute scalable applications on public, personal, and hybrid clouds.

### Cloud-native architecture

Cloud architecture is a system designed to utilize cloud services. It leverages the cloud development model's distributed, reliable, scalable, and flexible nature. Networking, servers, datacenters, operating systems, and firewalls are abstracted. It enables enterprises to design applications as loosely coupled components and execute them on dynamic platforms using microservices architecture.

There are a few technologies that can be considered pillars of cloud-native architecture.

[Microservices][2] is an architectural system in which software systems are made up of small, independent services that communicate through well-defined application programming interfaces (APIs). This development method makes applications faster to develop and more scalable, encouraging innovation and accelerating time-to-market for new features. Microservices enable communication among applications using RESTful APIs and support independent deployment, updates, scaling, and restarts.

[DevOps][3] refers to the philosophy, practices, and tools that promote better communication and collaboration between application development and IT operations teams. The benefits of DevOps processes include:

* Enabling automated release pipelines and integration
* Ensuring quick deployment to production
* Encouraging collaboration between development and other departments

Continuous integration and continuous delivery (CI/CD) refers to a set of practices that encompass the culture, operating principles, and procedures for software development. CI/CD practices focus on automation and continuous monitoring throughout the lifecycle of apps, from integration and testing phases to delivery and deployment. The benefits of CI/CD include:

* Enabling frequent releases
* Shipping software more quickly
* Receiving prompt feedback
* Reducing the risk of release

A [container][4] is a software package that contains all of the components (binaries, libraries, programming language versions, and so on) needed to run in any environment, making it possible for them to run on a laptop, in the cloud, or in an on-premises datacenter. A container is the optimal carrier for microservices.

### What is CNCF?

[CNCF][5] is a Linux Foundation project founded in 2015 to help advance container technology and align the tech industry around its evolution. A sub-organization of the Linux Foundation, it consists of a[collection of open-source projects][6] supported by ongoing contributions courtesy of a vast, vibrant community of programmers.

Founding members of the CNCF community include companies like Google, IBM, Red Hat, Docker, Huawei, Intel, Cisco, and others. Today, CNCF is supported by over 450 members. Its mission is to foster and sustain open source, vendor-neutral projects around cloud native.

Perhaps the most well-known project to come from CNCF is Kubernetes. The project was contributed to the Linux Foundation by Google as a seed technology and has since proven its worth by automating container-technology-based applications' deployment, scaling, and management.

### Learn cloud native

There are numerous resources to help you understand the basics of cloud-native architecture and technologies. You could start with these:

* Cloud-native glossary: The [Cloud Native Glossary][7], a project led by the CNCF Business Value Subcommittee, is a reference for common terms when talking about cloud-native applications. It was put together to help explain cloud-native concepts in clear and straightforward language, especially for those without previous technical knowledge.

**[[ More resources: Kubernetes glossary ]][8]**

##### Cloud-native communities

Outside the CNCF projects, some other cloud-native communities and initiatives aim toward sustaining and maintaining these cloud-based projects. They include:

* Special interest groups (SIGs) and working groups (WGs): SIGs are formed around different cloud-native elements in training and development. These groups meet weekly and discuss the community activity. You could also start a [new SIG][9].
* Cloud-native community groups: There are [numerous meetup groups][10] focused on expanding the cloud-native community on a global scale. Many have regular meetings that you can be a part of.
* CNCF TAG Network: TAG (for Technical Advisory Group) Network's mission is to enable widespread and successful development, deployment, and operation of resilient and intelligent network systems in cloud-native environments

##### Free training courses

Some training courses are available from the Linux Foundation to give beginners preliminary knowledge of cloud technologies. Some of these courses include:

* [Introduction to Kubernetes (LFS158)][11]
* [Introduction to Cloud Infrastructure Technologies (LFS151)][12]

##### Paid certifications

There are also paid certification programs from CNCF that test and boost your knowledge of cloud-native technologies from zero to expert. These certifications have proven to be a great addition to practitioners' careers.

* Kubernetes and Cloud-Native Associate (KCNA): The KCNA certification prepares candidates to work with cloud-native technologies and pursue further CNCF certifications like CKA, CKAD, and CKS (see below).
* Certified Kubernetes Application Developer (CKAD): A Kubernetes-certified application developer can design, build, configure, and expose cloud-native applications for Kubernetes, define application resources, and use core primitives to create, monitor, and troubleshoot scalable applications and tools in Kubernetes.
* Certified Kubernetes Administrator (CKA): A certified Kubernetes administrator has demonstrated the ability to do the basic installation, configuration, and management of production-grade Kubernetes clusters. They understand critical concepts such as Kubernetes networking, storage, security, maintenance, logging and monitoring, application lifecycle, troubleshooting, and API primitives. A CKA can also establish primary use cases for end users.
* Certified Kubernetes Security Specialist (CKS): Obtaining a CKS demonstrates possession of the requisite abilities to secure container-based applications and Kubernetes platforms during build, deployment, and runtime. A CKS is qualified to perform these tasks in a professional setting.
* Cloud Foundry Certified Developer (CFCD) : CFCD certification is ideal for candidates who want to validate their skill set using the Cloud Foundry platform to deploy and manage applications.
* FinOps Certified Practitioner (FOCP) :  An FOCP will bring a strong understanding of FinOps, an operational framework combining technology, finance, and business to realize business and financial goals through cloud transformation. The practitioner supports and manages the FinOps lifecycle and manages the cost and usage of cloud resources in an organization.

All of these can be found in the [Linux Foundation training and certification catalog][13].

### Start your cloud-native journey in three steps

Now that you're equipped with all this information, you can choose the direction you want to take. If you're overwhelmed by the options, just go step by step:

1. Understand the basics: Due to the complex nature of most cloud-native technologies, someone new to this ecosystem should have preliminary knowledge of the core concepts. Basic knowledge of containerization, orchestration, cloud/infrastructure, and both monolithic and microservices architecture is a good start.
2. Identify a cloud-native community or project: There are over [300 cloud-native communities][14] that exist today. It is a lot easier to break into the cloud-native community through these established groups. While some of these communities are initiatives to sustain cloud-native projects, others have projects that offer cloud-native services. You can begin your journey by participating in any of these communities. Research the groups and projects that align with your interest, then follow the onboarding steps and get familiar with the projects behind them.
3. Find a niche within the community: Since most cloud-native communities are open source, the diverse skill of the community comes in handy. Explore the various opportunities that align with your skills and interest, whether that's frontend, backend, developer relations (DevRel), operations, documentation, program management, or community relations. It is easier to contribute to cloud-native projects with a well-defined niche according to your skills and experiences.

You now have a basic understanding of the cloud-native ecosystem, both from a technological and community point of view. You can further extend your knowledge now and get involved. And once you do, remember to share your journey with others in the spirit of open source!

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/cloud-native-open-source-communities

作者：[Anita Ihuman][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/anita-ihuman
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/people_remote_teams_world.png
[2]: https://opensource.com/article/19/11/microservices-cheat-sheet
[3]: https://opensource.com/tags/devops
[4]: https://opensource.com/resources/what-are-linux-containers
[5]: https://www.cncf.io/
[6]: https://landscape.cncf.io/
[7]: https://glossary.cncf.io/
[8]: https://enterprisersproject.com/kubernetes-glossary
[9]: https://www.cncf.io/blog/2020/07/13/announcing-the-new-special-interest-group-on-contributor-strategy/
[10]: https://community.cncf.io/
[11]: https://training.linuxfoundation.org/training/introduction-to-kubernetes/
[12]: https://training.linuxfoundation.org/training/introduction-to-cloud-infrastructure-technologies/
[13]: https://training.linuxfoundation.org/full-catalog/
[14]: https://landscape.cncf.io/?zoom=40
