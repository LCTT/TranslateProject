An executive's guide to containers
============================================================

 ![An executive's guide to containers](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/containers_2015-1-osdc-lead.png?itok=E1imOYe4 "An executive's guide to containers") 
Image credits : [Maersk Line][1]. [CC SA-BY 4.0][2]

Discussions with IT leaders about "[containers][4]" can often be summarized as this:

_As a CxO, I face the constant challenge of doing more with less. IT budgets continue to decrease and I have less resources, yet the amount of work to deliver is greater than ever before. I spend far too many hours dedicated to resolving budgetary constraints. In addition, the IT landscape is undergoing a rapid change and new technologies are being introduced all the time. The latest topic I hear from my trusted advisors is the implementation of a "container strategy." I want to understand:_

1.  _What are containers?_
2.  _What is the enterprise value to transitioning to containers?_
3.  _Why should I shift to containers now? Are there disadvantages if we don't adopt?_
4.  _Are containers mature enough for enterprise consumption?_
5.  _How do I get my enterprise up to speed with container adoption?_

Let's start at the beginning.

### Containers

In the past 10 years or so, enterprises have moved from physical infrastructure to virtual machines (VMs). The key advantage of moving towards VMs is a reduction in the datacenter footprint. You can fit more applications on a fewer number of physical machines by running multiple VMs on the same physical box. Using containers is another way of packing applications in a much lighter weight and with a much faster delivery model. They are a fancy way of running multiple application processes on a single box, regardless of whether that box is a VM or a physical machine. In addition, containers also play a major role in the context of fulfilling DevOps, microservices, and cloud strategy.

### Containers versus VMs

Containers differ from VMs in a few simple ways. A VM, while not a physical machine, behaves just like one. It is an isolated environment that includes everything, starting with a complete (guest) operating system. On the other hand, containers are processes that share the resources on the same machine, which could be physical or virtual. Containers are notably interesting because:

*   VMs are heavy, comparatively. Containers are light because they only include those libraries needed by the applications they run.
*   VMs take minutes to start up. Containers start up in seconds.
*   Typically, many more containers fit into your infrastructure than VMs.

 ![Containers versus VMs](https://opensource.com/sites/default/files/containersvmvscontainers.png "Containers versus VMs") 

The technology has evolved enough to keep these containers secure, isolated from each other, and "with right design choices" to make sure that bad containers don't affect the performance of other containers running on the same box. In fact, operating systems are built to optimize and run containers natively.

Still, you need to make the right choices when moving toward containers. You need to do enough due diligence so you choose the right technology partners and vendors to enable containers. Open source technologies play a key role. The open source [Docker project][5] has made containers with a layering format that is easy to build and use. The [Open Container Initiative][6] (OCI) has become an open source standard for containers supported by all major technology vendors. Open source technology providers like Red Hat make container-ready, secure operating systems available. For example, Red Hat Enterprise Linux 7.x , including Red Hat Enterprise Linux Atomic Host, are optimized to run containers natively and also provide tools to monitor and manage containers. Other open source projects such as CoreOS from Tectonic are also coming into the market. Indeed, containers are ready for adoption by enterprises.

### Container platforms

Container platforms make containers enterprise-consumable. You may have dealt with VM sprawl in your enterprises over the past decade, and container sprawl can be many times worse. Running your containers at scale across the various hosts in your datacenter, ensuring high availability for your applications despite container failure, automated health checks, automated scaling of containers based on incoming workloads, etc., are some of the key features you can expect from a container platform.

While running containers on such a platform is positioned as Container-as-a-Service model (CaaS), some additional features of these platforms, such as build and deployment automation, make this platform a full-fledged Platform-as-a-Service (PaaS). While CaaS can run containers for you at scale, PaaS would take your source code, build it, create containers, and run those containers for you. In addition, these platforms provide complete operations management features, such as management and monitoring of the cluster, detection of security flaws with the containers and run safe containers, tracking logs and metrics, etc.

While some vendors are using their proprietary technologies to build container platforms, in general, companies are standardizing them around open source technologies built around [Kubernetes][7] (or K8S in short). K8S is an open source project that was started by Google, and many large platform vendors now support it. K8S is also part of [Cloud Native Computing Foundation][8] (CNCF), which is evolving as a standards body for cloud-centric technologies. Standardization around open source orchestration technologies is very important when you make your choices on a container platform. It basically allows you be portable across container platforms if you don't like the choice you made the first time. K8S also allows your container workloads to be portable across different public clouds. These are the reasons why we see more and more technology companies using Kubernetes.

A few enterprises are trying to build their own DIY container platforms by stitching together several open source projects that include K8S. This is definitely a better solution than going with proprietary technologies, but it also includes lot of plumbing to get it to work. However, an enterprise's ability to sustain and maintain such DIY platforms should be considered seriously. Many enterprises are not in the job of creating IT Platforms, rather they wish to run their mainstream business. There are many K8S-based solutions available, such as [Red Hat's OpenShift Container Platform][9], [Apprenda][10], [Deis][11], [Rancher][12], etc., which provide enterprise-ready versions of a platform, each with different levels of maturity in terms of features they provide.

These solutions are certified and supported by vendors. Some of these are comprehensive open source PaaS solutions, while others may be CaaS. Based on your enterprise needs, these solutions may serve as better alternatives than a DIY container platform.

### Enterprise concerns and their relationship to containers

Today, almost every enterprise is dealing with a digital transformation that impacts multiple areas, including strategies for DevOps, microservices, and the cloud. Containers play a particular role in each of these areas.

### DevOps strategy

IT organizations are divided into operations and application development. They operate as two separate teams, and each has its own set of goals. Most of the enterprises are moving in the direction of DevOps to bring these two teams together.

Containers have a major role to play in the success of DevOps initiatives. One of the key success criteria in DevOps is to increase the developer's stake in operations. Developers should not only hand off code to operations, but also, they should be concerned about how their code runs in the production. The common technique is to treat "infrastructure as code." Rather than provide pages of installation instructions that are error prone, the development team should provide the environment setup as code.

This is the exact problem that containers solve. Container images, which are templates for containers, include the entire stack, starting from the base operating system through to the application code. With containers, developers would not just build an application artifact (such as a .jar file) from Dev to QA to Prod; instead, they would pass a versioned container image that includes both the built artifact and the environment in which the artifact runs. The container is all inclusive, with everything from operating system libraries to middleware to the application bundled into one image. Therefore, the way the container runs in Development is the same exact way it runs in QA and Production. Containers are essential ingredients for DevOps success.

 ![Container-based model](https://opensource.com/sites/default/files/containerbasedmodel.png "Container-based model") 

In addition, container platforms are going a step further. Typical Continuous Integration and Delivery (CICD) tools, such as [Jenkins][13], are available as containers that run the entire CICD process on the container platform itself without the need for additional infrastructure. Now, you can use the PaaS platform to build and run your CICD pipelines.

### Microservices strategy

[Microservices][14] are another hot topic in IT today. Breaking down applications into discrete, small services, each of which do a small job, pretty well, is how applications are being designed. Each of these microservices could be written in a different language based on the technology suitable. They would be created and managed by small (two-pizza fed) teams and they can be changed fast. All these requirements again allude to containers. Containers are small enough to be the foundation for microservices. Containers can support any technology and language of your choice. They are easy to create and run and can be changed fast. Microservices and containers are considered married now, and if people talk of implementing microservices without using containers, they are often given a strange look.

The reality is that while microservices promise simplicity, their proliferation also increases complexity. Several microservices design and deployment patterns are coming up to ease their implementation. This means developers are now in need of a platform where they can deploy and orchestrate these microservices with ease and that:

*   Implements these microservices design patterns, in a language agnostic way
*   Does not increase the complexity of code with code intrusion so that developers have to include a great deal of pattern code into their business logic
*   Is flexible enough to deploy on the infrastructure of your choice and not does not tie you to particular clouds

This is where choosing a right container platform comes into play. Implementing these microservices on specific infrastructures in a particular vendor's way will tie your applications to those vendor platforms. Containerizing microservices using standard technologies such as OCI-compliant containers will ensure your microservices can be run on any OCI-compliant platform.

Choosing the right container platform to run your microservices is another important decision to make. Today there are very few choices and a lot of FUD. Some of these choices would take you down the non-standard, vendor-specific route if you are not diligent enough when making this choice.

### Cloud strategy

Cloud strategy is one more hot topic in IT. Whether you like it or not, the "as-a-Service" model is an inevitable change. If you don't provide this as a service from IT, your development teams will probably find ways to create shadow IT to get to the cloud. In addition, while using the cloud will move you from capital expenditure to operating expenditure, managing cloud expenditure is a constant challenge.

Cloud provides VMs, and you want to make sure that the CPU, memory and network resources on this cloud are used optimally before you spin up additional VMs. Containers play an important role here. Because containers are much smaller than VMs, and if your applications are run in containers, you can fit more containers in VMs than running one application component per VM.

Public cloud vendors are numerous, with Amazon Web Services (AWS), Microsoft Azure, and Google Cloud being a few of the more popular ones. In addition, you may want your own private cloud in your datacenter based on OpenStack. Each of these cloud environments have their own protocols, APIs, and tools. While you want your applications to run on the cloud, you don't want to make your application orchestration be cloud vendor specific and you don't want to maintain any cloud-specific code. Locking in your technology with a specific cloud vendor is like signing blank checks to the vendor for years to come.

Portability across the cloud is important to your cloud strategy. You can write your applications without worrying about where they run, and the container platform shields you from specific cloud vendor protocols, preventing you from being locked in with one cloud vendor.

### Legacy systems

The pluses brought to development by the microservices architecture are many, but not every application can be refactored into them and some only in part. Traditional applications are here to stay and they need to be maintained and managed. While containers enable microservices, containers are not _just_ microservices. Conceivably, you can run large applications and non-microservices as containers, so as long as you choose the right container technology and the right application platform, you can run many, if not all, legacy applications as containers.

### Wrapping up

I hope this deep dive into various strategies and containers helps your company evaluate your next step. Let me know in the comments lessons your company has learned or if they haven't taken the leap, what information they need I haven't provided.

--------------------------------------------------------------------------------

作者简介：

Veer Muchandi - Open source enthusiast. Container and PaaS advocate. Loves to learn and share.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/container-strategy-for-executives

作者：[Veer Muchandi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/veermuchandi
[1]:https://www.flickr.com/photos/maerskline/6955071566
[2]:https://creativecommons.org/licenses/by-sa/4.0/
[3]:https://opensource.com/article/17/1/container-strategy-for-executives?rate=DuiecCOvGMj-GXcdlJsN8xdZJ82yPUX1M3M9ZNkT99A
[4]:https://opensource.com/resources/what-are-linux-containers
[5]:https://opensource.com/resources/what-docker
[6]:https://opensource.com/business/16/8/inside-look-future-linux-containers
[7]:https://opensource.com/resources/what-is-kubernetes
[8]:https://www.cncf.io/
[9]:https://www.openshift.com/container-platform/
[10]:https://apprenda.com/
[11]:http://deis.io/
[12]:http://rancher.com/
[13]:https://jenkins.io/
[14]:https://opensource.com/resources/what-are-microservices
[15]:https://opensource.com/user/92826/feed
[16]:https://opensource.com/article/17/1/container-strategy-for-executives#comments
[17]:https://opensource.com/users/veermuchandi
