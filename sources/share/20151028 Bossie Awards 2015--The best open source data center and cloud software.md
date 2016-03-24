Bossie Awards 2015: The best open source data center and cloud software
================================================================================
InfoWorld's top picks of the year in open source platforms, infrastructure, management, and orchestration software 

![](http://images.techhive.com/images/article/2015/09/bossies-2015-data-center-cloud-100613986-orig.jpg)

### The best open source data center and cloud software ###

You might have heard about this new thing called Docker containers. Developers love them because you can build them with a script, add services in layers, and push them right from your MacBook Pro to a server for testing. It works because they're superlightweight, unlike those now-archaic virtual machines. Containers -- and other lightweight approaches to deliver services -- are changing the shape of operating systems, applications, and the tools to manage them. Our Bossie winners in data center and cloud are leading the charge.

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-docker-100613987-orig.jpg)

### Docker Machine, Compose, and Swarm ###

Docker’s open source container technology has been adopted by the major public clouds and is being built into the next version of Windows Server. Allowing developers and operations teams to separate applications from infrastructure, Docker is a powerful data center automation tool.

However, containers are only part of the Docker story. Docker also provides a series of tools that allow you to use the Docker API to automate the entire container lifecycle, as well as handling application design and orchestration.

[Machine][1] allows you to automate the provisioning of Docker Containers. Starting with a command line, you can use a single line of code to target one or more hosts, deploy the Docker engine, and even join it to a Swarm cluster. There’s support for most hypervisors and cloud platforms – all you need are your access credentials.

[Swarm][2] handles clustering and scheduling, and it can be integrated with Mesos for more advanced scheduling capabilities. You can use Swarm to build a pool of container hosts, allowing your apps to scale out as demand increases. Applications and all of their dependencies can be defined with [Compose][3], which lets you link containers together into a distributed application and launch them as a group. Compose descriptions work across platforms, so you can take a developer configuration and quickly deploy in production.

-- Simon Bisson

![](http://images.techhive.com/images/article/2015/09/bossies-2015-coreos-rkt-100613985-orig.jpg)

### CoreOS and Rkt ###

A thin, lightweight server OS, [CoreOS][4] is based on Google’s Chromium OS. Instead of using a package manager to install functions, it’s designed to be used with Linux containers. By using containers to extend a thin core, CoreOS allows you to quickly deploy applications, working well on cloud infrastructures.

CoreOS’s container management tooling, fleet, is designed to treat a cluster of CoreOS servers as a single unit, with tools for managing high availability and for deploying containers to the cluster based on resource availability. A cross-cluster key/value store, etcd, handles device management and supports service discovery. If a node fails, etcd can quickly restore state on a new replica, giving you a distributed configuration management platform that’s linked to CoreOS’s automated update service.

While CoreOS is perhaps best known for its Docker support, the CoreOS team is developing its own container runtime, rkt, with its own container format, the App Container Image. Also compatible with Docker containers, rkt has a modular architecture that allows different containerization systems (even hardware virtualization, in a proof of concept from Intel) to be plugged in. However, rkt is still in the early stages of development, so isn’t quite production ready.

-- Simon Bisson

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-rancheros-100613997-orig.jpg)

### RancherOS ###

As we abstract more and more services away from the underlying operating system using containers, we can start thinking about what tomorrow’s operating system will look like. Similar to our applications, it’s going to be a modular set of services running on a thin kernel, self-configuring to offer only the services our applications need.

[RancherOS][5] is a glimpse of what that OS might look like. Blending the Linux kernel with Docker, RancherOS is a minimal OS suitable for hosting container-based applications in cloud infrastructures. Instead of using standard Linux packaging techniques, RancherOS leverages Docker to host Linux user-space services and applications in separate container layers. A low-level Docker instance is first to boot, hosting system services in their own containers. Users' applications run in a higher-level Docker instance, separate from the system containers. If one of your containers crashes, the host keeps running.

RancherOS is only 20MB in size, so it's easy to replicate across a data center. It’s also designed to be managed using automation tools, not manually, with API-level access that works with Docker’s management tools as well as with Rancher Labs’ own cloud infrastructure and management tools.

-- Simon Bisson

![](http://images.techhive.com/images/article/2015/09/bossies-2015-kubernetes-100613991-orig.jpg)

### Kubernetes ###

Google’s [Kubernetes][6] container orchestration system is designed to manage and run applications built in Docker and Rocket containers. Focused on managing microservice applications, Kubernetes lets you distribute your containers across a cluster of hosts, while handling scaling and ensuring managed services run reliably.

With containers providing an application abstraction layer, Kubernetes is an application-centric management service that supports many modern development paradigms, with a focus on user intent. That means you launch applications, and Kubernetes will manage the containers to run within the parameters you set, using the Kubernetes scheduler to make sure it gets the resources it needs. Containers are grouped into pods and managed by a replication engine that can recover failed containers or add more pods as applications scale.

Kubernetes powers Google’s own Container Engine, and it runs on a range of other cloud and data center services, including AWS and Azure, as well as vSphere and Mesos. Containers can be either loosely or tightly coupled, so applications not designed for cloud PaaS operations can be migrated to the cloud as a tightly coupled set of containers. Kubernetes also supports rapid deployment of applications to a cluster, giving you an endpoint for a continuous delivery process.

-- Simon Bisson

![](http://images.techhive.com/images/article/2015/09/bossies-2015-mesos-100613993-orig.jpg)

### Mesos ###

Turning a data center into a private or public cloud requires more than a hypervisor. It requires a new operating layer that can manage the data center resources as if they were a single computer, handling resources and scheduling. Described as a “distributed systems kernel,” [Apache Mesos][7] allows you to manage thousands of servers, using containers to host applications and APIs to support parallel application development.

At the heart of Mesos is a set of daemons that expose resources to a central scheduler. Tasks are distributed across nodes, taking advantage of available CPU and memory. One key approach is the ability for applications to reject offered resources if they don’t meet requirements. It’s an approach that works well for big data applications, and you can use Mesos to run Hadoop and Cassandra distributed databases, as well as Apache’s own Spark data processing engine. There’s also support for the Jenkins continuous integration server, allowing you to run build and test workers in parallel on a cluster of servers, dynamically adjusting the tasks depending on workload.

Designed to run on Linux and Mac OS X, Mesos has also recently been ported to Windows to support the development of scalable parallel applications on Azure.

-- Simon Bisson

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-smartos-100614849-orig.jpg)

### SmartOS and SmartDataCenter ###

Joyent’s [SmartDataCenter][8] is the software that runs its public cloud, adding a management platform on top of its [SmartOS][9] thin server OS. A descendent of OpenSolaris that combines Zones containers and the KVM hypervisor, SmartOS is an in-memory operating system, quick to boot from a USB stick and run on bare-metal servers.

Using SmartOS, you can quickly deploy a set of lightweight servers that can be programmatically managed via a set of JSON APIs, with functionality delivered via virtual machines, downloaded by built-in image management tools. Through the use of VMs, all userland operations are isolated from the underlying OS, reducing the security exposure of both the host and guests.

SmartDataCenter runs on SmartOS servers, with one server running as a dedicated management node, and the rest of a cluster operating as compute nodes. You can get started with a Cloud On A Laptop build (available as a VMware virtual appliance) that lets you experiment with the management server. In a live data center, you’ll deploy SmartOS on your servers, using ZFS to handle storage – which includes your local image library. Services are deployed as images, with components stored in an object repository.

The combination of SmartDataCenter and SmartOS builds on the experience of Joyent’s public cloud, giving you a tried and tested set of tools that can help you bootstrap your own cloud data center. It’s an infrastructure focused on virtual machines today, but laying the groundwork for tomorrow. A related Joyent project, [sdc-docker][10], exposes an entire SmartDataCenter cluster as a single Docker host, driven by native Docker commands.

-- Simon Bisson

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-sensu-100614850-orig.jpg)

### Sensu ###

Managing large-scale data centers isn’t about working with server GUIs, it’s about automating scripts based on information from monitoring tools and services, routing information from sensors and logs, and then delivering actions to applications. One tool that’s beginning to offer this functionality is [Sensu][11], often described as a “monitoring router.”

Scripts running across your data center deliver information to Sensu, which then routes it to the appropriate handler, using a publish-and-subscribe architecture based on RabbitMQ. Servers can be distributed, delivering published check results to handler code. You might see results in email, or in a Slack room, or in Sensu’s own dashboards. Message formats are defined in JSON files, or mutators used to format data on the fly, and messages can be filtered to one or more event handlers.

Sensu is still a relatively young tool, but it’s one that shows a lot of promise. If you’re going to automate your data center, you’re going to need a tool like this not only to show you what’s happening, but to deliver that information where it’s most needed. A commercial option adds support for integration with third-party applications, but much of what you need to manage a data center is in the open source release.

-- Simon Bisson

![](http://images.techhive.com/images/article/2015/09/bossies-2015-prometheus-100613996-orig.jpg)

### Prometheus ###

Managing a modern data center is a complex task. Racks of servers need to be treated like cattle rather than pets, and you need a monitoring system designed to handle hundreds and thousands of nodes. Monitoring applications presents special challenges, and that’s where [Prometheus][12] comes in to play. A service monitoring system designed to deliver alerts to operators, Prometheus can run on everything from a single laptop to a highly available cluster of monitoring servers.

Time series data is captured and stored, then compared against patterns to identify faults and problems. You’ll need to expose data on HTTP endpoints, using a YAML file to configure the server. A browser-based reporting tool handles displaying data, with an expression console where you can experiment with queries. Dashboards can be created with a GUI builder, or written using a series of templates, letting you deliver application consoles that can be managed using version control systems such as Git.

Captured data can be managed using expressions, which make it easy to aggregate data from several sources -- for example, letting you bring performance data from a series of Web endpoints into one store. An experimental alert manager module delivers alerts to common collaboration and devops tools, including Slack and PagerDuty. Official client libraries for common languages like Go and Java mean it’s easy to add Prometheus support to your applications and services, while third-party options extend Prometheus to Node.js and .Net.

-- Simon Bisson

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-elk-100613988-orig.jpg)

### Elasticsearch, Logstash, and Kibana ###

Running a modern data center generates a lot of data, and it requires tools to get information out of that data. That’s where the combination of Elasticsearch, Logstash, and Kibana, often referred to as the ELK stack, comes into play.

Designed to handle scalable search across a mix of content types, including structured and unstructured documents, [Elasticsearch][13] builds on Apache’s Lucene information retrieval tools, with a RESTful JSON API. It’s used to provide search for sites like Wikipedia and GitHub, using a distributed index with automated load balancing and routing.

Under the fabric of a modern cloud is a physical array of servers, running as VM hosts. Monitoring many thousands of servers needs centralized logs. [Logstash][14] harvests and filters the logs generated by those servers (and by the applications running on them), using a forwarder on each physical and virtual machine. Logstash-formatted data is then delivered to Elasticsearch, giving you a search index that can be quickly scaled as you add more servers.

At a higher level, [Kibana][15] adds a visualization layer to Elasticsearch, providing a Web dashboard for exploring and analyzing the data. Dashboards can be created around custom searches and shared with your team, providing a quick, easy-to-digest devops information feed.

-- Simon Bisson

![](http://images.techhive.com/images/article/2015/09/bossies-2015-ansible-100613984-orig.jpg)

### Ansible ###

Managing server configuration is a key element of any devops approach to managing a modern data center or a cloud infrastructure. Configuration management tooling that takes a desired state approach to simplifies systems management at cloud scale, using server and application descriptions to handle server and application deployment.

[Ansible][16] offers a minimal management service, using SSH to manage Unix nodes and PowerShell to work with Windows servers, with no need to deploy agents. An Ansible Playbook describes the state of a server or service in YAML, deploying Ansible modules to servers that handle configuration and removing them once the service is running. You can use Playbooks to orchestrate tasks -- for example, deploying several Web endpoints with a single script.

It’s possible to make module creation and Playbook delivery part of a continuous delivery process, using build tools to deliver configurations and automate deployment. Ansible can pull in information from cloud service providers, simplifying management of virtual machines and networks. Monitoring tools in Ansible are able to trigger additional deployments automatically, helping manage and control cloud services, as well as working to manage resources used by large-scale data platforms like Hadoop.

-- Simon Bisson

![](http://images.techhive.com/images/article/2015/09/bossies-2015-jenkins-100613990-orig.jpg)

### Jenkins ###

Getting continuous delivery right requires more than a structured way of handling development; it also requires tools for managing test and build. That’s where the [Jenkins][17] continuous integration server comes in. Jenkins works with your choice of source control, your test harnesses, and your build server. It’s a flexible tool, initially designed for working with Java but now extended to support Web and mobile development and even to build Windows applications.

Jenkins is perhaps best thought of as a switching network, shunting files through a test and build process, and responding to signals from the various tools you’re using – thanks to a library of more than 1,000 plug-ins. These include tools for integrating Jenkins with both local Git instances and GitHub so that it's possible to extend a continuous development model into your build and delivery processes.

Using an automation tool like Jenkins is as much about adopting a philosophy as it is about implementing a build process. Once you commit to continuous integration as part of a continuous delivery model, you’ll be running test and build cycles as soon as code is delivered to your source control release branch – and delivering it to users as soon as it’s in the main branch.

-- Simon Bisson

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-nodejs-iojs-100613995-orig.jpg)

### Node.js and io.js ###

Modern cloud applications are built using different design patterns from the familiar n-tier enterprise and Web apps. They’re distributed, event-driven collections of services that can be quickly scaled and can support many thousands of simultaneous users. One key technology in this new paradigm is [Node.js][18], used by many major cloud platforms and easy to install as part of a thin server or container on cloud infrastructure.

Key to the success of Node.js is the Npm package format, which allows you to quickly install extensions to the core Node.js service. These include frameworks like Express and Seneca, which help build scalable applications. A central registry handles package distribution, and dependencies are automatically installed.

While the [io.js][19] fork exposed issues with project governance, it also allowed a group of developers to push forward adding ECMAScript 6 support to an Npm-compatible engine. After reconciliation between the two teams, the Node.js and io.js codebases have been merged, with new releases now coming from the io.js code repository.

Other forks, like Microsoft’s io.js fork to add support for its 64-bit Chakra JavaScript engine alongside Google’s V8, are likely to be merged back into the main branch over the next year, keeping the Node.js platform evolving and cementing its role as the preferred host for cloud-scale microservices.

-- Simon Bisson

![](http://images.techhive.com/images/article/2015/09/bossies-2015-seneca-100613998-orig.jpg)

### Seneca ###

The developers of the [Seneca][20] microservice framework have a motto: “Build it now, scale it later!” It’s an apt maxim for anyone thinking about developing microservices, as it allows you to start small, then add functionality as your service grows.

Seneca is at heart an implementation of the [actor/message design pattern][21], focused on using Node.js as a switching engine that takes in messages, processes their contents, and sends an appropriate response, either to the message originator or to another service. By focusing on the message patterns that map to business use cases, it’s relatively easy to take Seneca and quickly build a minimum viable product for your application. A plug-in architecture makes it easy to integrate Seneca with other tools and to quickly add functionality to your services.

You can easily add new patterns to your codebase or break existing patterns into separate services as the needs of your application grow or change. One pattern can also call another, allowing quick code reuse. It’s also easy to add Seneca to a message bus, so you can use it as a framework for working with data from Internet of things devices, as all you need to do is define a listening port where JSON data is delivered.

Services may not be persistent, and Seneca gives you the option of using a built-in object relational mapping layer to handle data abstraction, with plug-ins for common databases.

-- Simon Bisson

![](http://images.techhive.com/images/article/2015/09/bossies-2015-netcore-aspnet-100613994-orig.jpg)

### .Net Core and ASP.Net vNext ###

Microsoft’s [open-sourcing of .Net][22] is bringing much of the company’s Web platform into the open. The new [.Net Core][23] release runs on Windows, on OS X, and on Linux. Currently migrating from Microsoft’s Codeplex repository to GitHub, .Net Core offers a more modular approach to .Net, allowing you to install the functions you need as you need them.

Currently under development is [ASP.Net 5][24], an open source version of the Web platform, which runs on .Net Core. You can work with it as the basis of Web apps using Microsoft’s MVC 6 framework. There’s also support for the new SignalR libraries, which add support for WebSockets and other real-time communications protocols.

If you’re planning on using Microsoft’s new Nano server, you’ll be writing code against .Net Core, as it’s designed for thin environments. The new DNX, the .Net Execution environment, simplifies deployment of ASP.Net applications on a wide range of platforms, with tools for packaging code and for booting a runtime on a host. Features are added using the NuGet package manager, letting you use only the libraries you want.

Microsoft’s open source .Net is still very young, but there’s a commitment in Redmond to ensure it’s successful. Support in Microsoft’s own next-generation server operating systems means it has a place in both the data center and the cloud.

-- Simon Bisson

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-glusterfs-100613989-orig.jpg)

### GlusterFS ###

[GlusterFS][25] is a distributed file system. Gluster aggregates various storage servers into one large parallel network file system. You can [even use it in place of HDFS in a Hadoop cluster][26] or in place of an expensive SAN system -- or both. While HDFS is great for Hadoop, having a general-purpose distributed file system that doesn’t require you to transfer data to another location to analyze it is a key advantage.

In an era of commoditized hardware, commoditized computing, and increased performance and latency requirements, buying a big, fat expensive EMC SAN and hoping it fits all of your needs (it won’t) is no longer your sole viable option. GlusterFS was acquired by Red Hat in 2011.

-- Andrew C. Oliver

![](http://images.techhive.com/images/article/2015/09/bossies-2015-main-100613992-orig.jpg)

### Read about more open source winners ###

InfoWorld's Best of Open Source Awards for 2014 celebrate more than 100 open source projects, from the bottom of the stack to the top. Follow these links to more open source winners:

[Bossie Awards 2015: The best open source applications][27]

[Bossie Awards 2015: The best open source application development tools][28]

[Bossie Awards 2015: The best open source big data tools][29]

[Bossie Awards 2015: The best open source data center and cloud software][30]

[Bossie Awards 2015: The best open source desktop and mobile software][31]

[Bossie Awards 2015: The best open source networking and security software][32]

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/2982923/open-source-tools/bossie-awards-2015-the-best-open-source-data-center-and-cloud-software.html

作者：[InfoWorld staff][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/InfoWorld-staff/
[1]:https://www.docker.com/docker-machine
[2]:https://www.docker.com/docker-swarm
[3]:https://www.docker.com/docker-compose
[4]:https://coreos.com/
[5]:http://rancher.com/rancher-os/
[6]:http://kubernetes.io/
[7]:https://mesos.apache.org/
[8]:https://github.com/joyent/sdc
[9]:https://smartos.org/
[10]:https://github.com/joyent/sdc-docker
[11]:https://sensuapp.org/
[12]:http://prometheus.io/
[13]:https://www.elastic.co/products/elasticsearch
[14]:https://www.elastic.co/products/logstash
[15]:https://www.elastic.co/products/kibana
[16]:http://www.ansible.com/home
[17]:https://jenkins-ci.org/
[18]:https://nodejs.org/en/
[19]:https://iojs.org/en/
[20]:http://senecajs.org/
[21]:http://www.infoworld.com/article/2976422/application-development/how-to-use-actors-in-distributed-applications.html
[22]:http://www.infoworld.com/article/2846450/microsoft-net/microsoft-open-sources-server-side-net-launches-visual-studio-2015-preview.html
[23]:https://dotnet.github.io/core/
[24]:http://www.asp.net/vnext
[25]:http://www.gluster.org/
[26]:http://www.gluster.org/community/documentation/index.php/Hadoop
[27]:http://www.infoworld.com/article/2982622/bossie-awards-2015-the-best-open-source-applications.html
[28]:http://www.infoworld.com/article/2982920/bossie-awards-2015-the-best-open-source-application-development-tools.html
[29]:http://www.infoworld.com/article/2982429/bossie-awards-2015-the-best-open-source-big-data-tools.html
[30]:http://www.infoworld.com/article/2982923/bossie-awards-2015-the-best-open-source-data-center-and-cloud-software.html
[31]:http://www.infoworld.com/article/2982630/bossie-awards-2015-the-best-open-source-desktop-and-mobile-software.html
[32]:http://www.infoworld.com/article/2982962/bossie-awards-2015-the-best-open-source-networking-and-security-software.html