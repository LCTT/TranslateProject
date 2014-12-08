disylee占个坑～
Docker: Present and Future
================================================================================
### Docker - the story so far ###

Docker is a toolset for Linux containers designed to ‘build, ship and run’ distributed applications. It was first released as an open source project by DotCloud in March 2013. The project quickly became popular, leading to DotCloud rebranded as Docker Inc (and ultimately [selling off their original PaaS business][1]). [Docker 1.0][2] was released in June 2014, and the monthly release cadence that led up to the June release has been sustained since.

The 1.0 release marked the point where Docker Inc considered the platform sufficiently mature to be used in production (with the company and partners providing paid for support options). The monthly release of point updates shows that the project is still evolving quickly, adding new features, and addressing issues as they are found. The project has however successfully decoupled ‘ship’ from ‘run’, so images sourced from any version of Docker can be used with any other version (with both forward and backward compatibility), something that provides a stable foundation for Docker use despite rapid change.

The growth of Docker into one of the most popular open source projects could be perceived as hype, but there is a great deal of substance. Docker has attracted support from many brand names across the industry, including Amazon, Canonical, CenturyLink, Google, IBM, Microsoft, New Relic, Pivotal, Red Hat and VMware. This is making it almost ubiquitously available wherever Linux can be found. In addition to the big names many startups are growing up around Docker, or changing direction to be better aligned with Docker. Those partnerships (large and small) are helping to drive rapid evolution of the core project and its surrounding ecosystem.

### A brief technical overview of Docker ###

Docker makes use of Linux kernel facilities such as [cGroups][3], namespaces and [SElinux][4] to provide isolation between containers. At first Docker was a front end for the [LXC][5] container management subsystem, but release 0.9 introduced [libcontainer][6], which is a native Go language library that provides the interface between user space and the kernel.

Containers sit on top of a union file system, such as [AUFS][7], which allows for the sharing of components such as operating system images and installed libraries across multiple containers. The layering approach in the filesystem is also exploited by the [Dockerfile][8] DevOps tool, which is able to cache operations that have already completed successfully. This can greatly speed up test cycles by taking out the wait time usually taken to install operating systems and application dependencies. Shared libraries between containers can also reduce RAM footprint.

A container is started from an image, which may be locally created, cached locally, or downloaded from a registry. Docker Inc operates the [Docker Hub public registry][9], which hosts official repositories for a variety of operating systems, middleware and databases. Organisations and individuals can host public repositories for images at Docker Hub, and there are also subscription services for hosting private repositories. Since an uploaded image could contain almost anything Docker Hub provides an automated build facility (that was previously called ‘trusted build’) where images are constructed from a Dockerfile that serves as a manifest for the contents of the image.

### Containers versus VMs ###

Containers are potentially much more efficient than VMs because they’re able to share a single kernel and share application libraries. This can lead to substantially smaller RAM footprints even when compared to virtualisation systems that can make use of RAM overcommitment. Storage footprints can also be reduced where deployed containers share underlying image layers. IBM’s Boden Russel has done [benchmarking][10] that illustrates these differences.

Containers also present a lower systems overhead than VMs, so the performance of an application inside a container will generally be the same or better versus the same application running within a VM. A team of IBM researchers have published a [performance comparison of virtual machines and Linux containers][11].

One area where containers are weaker than VMs is isolation. VMs can take advantage of ring -1 [hardware isolation][12] such as that provided by Intel’s VT-d and VT-x technologies. Such isolation prevents VMs from ‘breaking out’ and interfering with each other. Containers don’t yet have any form of hardware isolation, which makes them susceptible to exploits. A proof of concept attack named [Shocker][13] showed that Docker versions prior to 1.0 were vulnerable. Although Docker 1.0 fixed the particular issue exploited by Shocker, Docker CTO Solomon Hykes [stated][14], “When we feel comfortable saying that Docker out-of-the-box can safely contain untrusted uid0 programs, we will say so clearly.”. Hykes’s statement acknowledges that other exploits and associated risks remain, and that more work will need to be done before containers can become trustworthy.

For many use cases the choice of containers or VMs is a false dichotomy. Docker works well within a VM, which allows it to be used on existing virtual infrastructure, private clouds and public clouds. It’s also possible to run VMs inside containers, which is something that Google uses as part of its cloud platform. Given the widespread availability of infrastructure as a service (IaaS) that provides VMs on demand it’s reasonable to expect that containers and VMs will be used together for years to come. It’s also possible that container management and virtualisation technologies might be brought together to provide a best of both worlds approach; so a hardware trust anchored micro virtualisation implementation behind libcontainer could integrate with the Docker tool chain and ecosystem at the front end, but use a different back end that provides better isolation. Micro virtualisation (such as Bromium’s [vSentry][15] and VMware’s [Project Fargo][16]) is already used in desktop environments to provide hardware based isolation between applications, so similar approaches could be used along with libcontainer as an alternative to the container mechanisms in the Linux kernel.

### ‘Dockerizing’ applications ###

Pretty much any Linux application can run inside a Docker container. There are no limitations on choice of languages or frameworks. The only practical limitation is what a container is allowed to do from an operating system perspective. Even that bar can be lowered by running containers in privileged mode, which substantially reduces controls (and correspondingly increases risk of the containerised application being able to cause damage to the host operating system).

Containers are started from images, and images can be made from running containers. There are essentially two ways to get applications into containers - manually and Dockerfile..

#### Manual builds ####

A manual build starts by launching a container with a base operating system image. An interactive terminal can then be used to install applications and dependencies using the package manager offered by the chosen flavour of Linux. Zef Hemel provides a walk through of the process in his article ‘[Using Linux Containers to Support Portable Application Deployment][17]’. Once the application is installed the container can be pushed to a registry (such as Docker Hub) or exported into a tar file.

#### Dockerfile ####

Dockerfile is a system for scripting the construction of Docker containers. Each Dockerfile specifies the base image to start from and then a series of commands that are run in the container and/or files that are added to the container. The Dockerfile can also specify ports to be exposed, the working directory when a container is started and the default command on startup. Containers built with Dockerfiles can be pushed or exported just like manual builds. Dockerfiles can also be used in Docker Hub’s automated build system so that images are built from scratch in a system under the control of Docker Inc with the source of that image visible to anybody that might use it.

#### One process? ####

Whether images are built manually or with Dockerfile a key consideration is that only a single process is invoked when the container is launched. For a container serving a single purpose, such as running an application server, running a single process isn’t an issue (and some argue that containers should only have a single process). For situations where it’s desirable to have multiple processes running inside a container a [supervisor][18] process must be launched that can then spawn the other desired processes. There is no init system within containers, so anything that relies on systemd, upstart or similar won’t work without modification.

### Containers and microservices ###

A full description of the philosophy and benefits of using a microservices architecture is beyond the scope of this article (and well covered in the [InfoQ eMag: Microservices][19]). Containers are however a convenient way to bundle and deploy instances of microservices.

Whilst most practical examples of large scale microservices deployments to date have been on top of (large numbers of) VMs, containers offer the opportunity to deploy at a smaller scale. The ability for containers to have a shared RAM and disk footprint for operating systems, libraries common application code also means that deploying multiple versions of services side by side can be made very efficient.

### Connecting containers ###

Small applications will fit inside a single container, but in many cases an application will be spread across multiple containers. Docker’s success has spawned a flurry of new application compositing tools, orchestration tools and platform as a service (PaaS) implementations. Behind most of these efforts is a desire to simplify the process of constructing an application from a set of interconnected containers. Many tools also help with scaling, fault tolerance, performance management and version control of deployed assets.

#### Connectivity ####

Docker’s networking capabilities are fairly primitive. Services within containers can be made accessible to other containers on the same host, and Docker can also map ports onto the host operating system to make services available across a network. The officially sponsored approach to connectivity is [libchan][20], which is a library that provides Go like [channels][21] over the network. Until libchan finds its way into applications there’s room for third parties to provide complementary network services. For example, [Flocker][22] has taken a proxy based approach to make services portable across hosts (along with their underlying storage).

#### Compositing ####

Docker has native mechanisms for linking containers together where metadata about a dependency can be passed into the dependent container and consumed within as environment variables and hosts entries. Application compositing tools like [Fig][23] and [geard][24] express the dependency graph inside a single file so that multiple containers can be brought together into a coherent system. CenturyLink’s [Panamax][25] compositing tool takes a similar underlying approach to Fig and geard, but adds a web based user interface, and integrates directly with GitHub so that applications can be shared.

#### Orchestration ####

Orchestration systems like [Decking][26], New Relic’s [Centurion][27] and Google’s [Kubernetes][28] all aim to help with the deployment and life cycle management of containers. There are also numerous examples (such as [Mesosphere][29]) of [Apache Mesos][30] (and particularly its [Marathon][31] framework for long running applications) being used along with Docker. By providing an abstraction between the application needs (e.g. expressed as a requirement for CPU cores and memory) and underlying infrastructure, the orchestration tools provide decoupling that’s designed to simplify both application development and data centre operations. There is such a variety of orchestration systems because many have emerged from internal systems previously developed to manage large scale deployments of containers; for example Kubernetes is based on Google’s [Omega][32] system that’s used to manage containers across the Google estate.

Whilst there is some degree of functional overlap between the compositing tools and the orchestration tools there are also ways that they can complement each other. For example Fig might be used to describe how containers interact functionally whilst Kubernetes pods might be used to provide monitoring and scaling.

#### Platforms (as a Service) ####

A number of Docker native PaaS implementations such as [Deis][33] and [Flynn][34] have emerged to take advantage of the fact that Linux containers provide a great degree of developer flexibility (rather than being ‘opinionated’ about a given set of languages and frameworks). Other platforms such as CloudFoundry, OpenShift and Apcera Continuum have taken the route of integrating Docker based functionality into their existing systems, so that applications based on Docker images (or the Dockerfiles that make them) can be deployed and managed alongside of apps using previously supported languages and frameworks.

### All the clouds ###

Since Docker can run in any Linux VM with a reasonably up to date kernel it can run in pretty much every cloud offering IaaS. Many of the major cloud providers have announced additional support for Docker and its ecosystem.

Amazon have introduced Docker into their Elastic Beanstalk system (which is an orchestration service over underlying IaaS). Google have Docker enabled ‘managed VMs’, which provide a halfway house between the PaaS of App Engine and the IaaS of Compute Engine. Microsoft and IBM have both announced services based on Kubernetes so that multi container applications can be deployed and managed on their clouds.

To provide a consistent interface to the wide variety of back ends now available the Docker team have introduced [libswarm][35], which will integrate with a multitude of clouds and resource management systems. One of the stated aims of libswarm is to ‘avoid vendor lock-in by swapping any service out with another’. This is accomplished by presenting a consistent set of services (with associated APIs) that attach to implementation specific back ends. For example the Docker server service presents the Docker remote API to a local Docker command line tool so that containers can be managed on an array of service providers.

New service types based on Docker are still in their infancy. London based Orchard labs offered a Docker hosting service, but Docker Inc said that the service wouldn’t be a priority after acquiring Orchard. Docker Inc has also sold its previous DotCloud PaaS business to cloudControl. Services based on older container management systems such as [OpenVZ][36] are already commonplace, so to a certain extent Docker needs to prove its worth to hosting providers.

### Docker and the distros ###

Docker has already become a standard feature of major Linux distributions like Ubuntu, Red Hat Enterprise Linux (RHEL) and CentOS. Unfortunately the distributions move at a different pace to the Docker project, so the versions found in a distribution can be well behind the latest available. For example Ubuntu 14.04 was released with Docker 0.9.1, and that didn’t change on the point release upgrade to Ubuntu 14.04.1 (by which time Docker was at 1.1.2). There are also namespace issues in official repositories since Docker was also the name of a KDE system tray; so with Ubuntu 14.04 the package name and command line tool are both ‘docker.io’.

Things aren’t much different in the Enterprise Linux world. CentOS 7 comes with Docker 0.11.1, a development release that precedes Docker Inc’s announcement of production readiness with Docker 1.0. Linux distribution users that want the latest version for promised stability, performance and security will be better off following the [installation instructions][37] and using repositories hosted by Docker Inc rather than taking the version included in their distribution.

The arrival of Docker has spawned new Linux distributions such as [CoreOS][38] and Red Hat’s [Project Atomic][39] that are designed to be a minimal environment for running containers. These distributions come with newer kernels and Docker versions than the traditional distributions. They also have lower memory and disk footprints. The new distributions also come with new tools for managing large scale deployments such as [fleet][40] ‘a distributed init system’ and [etcd][41] for metadata management. There are also new mechanisms for updating the distribution itself so that the latest versions of the kernel and Docker can be used. This acknowledges that one of the effects of using Docker is that it pushes attention away from the distribution and its package management solution, making the Linux kernel (and Docker subsystem using it) more important.

New distributions might be the best way of running Docker, but traditional distributions and their package managers remain very important within containers. Docker Hub hosts official images for Debian, Ubuntu, and CentOS. There’s also a ‘semi-official’ repository for Fedora images. RHEL images aren’t available in Docker Hub, as they’re distributed directly from Red Hat. This means that the automated build mechanism on Docker Hub is only available to those using pure open source distributions (and willing to trust the provenance of the base images curated by the Docker Inc team).

Whilst Docker Hub integrates with source control systems such as GitHub and Bitbucket for automated builds the package managers used during the build process create a complex relationship between a build specification (in a Dockerfile) and the image resulting from a build. Non deterministic results from the build process isn’t specifically a Docker problem - it’s a result of how package managers work. A build done one day will get a given version, and a build done another time may get a later version, which is why package managers have upgrade facilities. The container abstraction (caring less about the contents of a container) along with container proliferation (because of lightweight resource utilisation) is however likely to make this a pain point that gets associated with Docker.

### The future of Docker ###

Docker Inc has set a clear path on the development of core capabilities (libcontainer), cross service management (libswarm) and messaging between containers (libchan). Meanwhile the company has already shown a willingness to consume its own ecosystem with the Orchard Labs acquisition. There is however more to Docker than Docker Inc, with contributions to the project coming from big names like Google, IBM and Red Hat. With a benevolent dictator in the shape of CTO Solomon Hykes at the helm there is a clear nexus of technical leadership for both the company and the project. Over its first 18 months the project has shown an ability to move fast by using its own output, and there are no signs of that abating.

Many investors are looking at the features matrix for VMware’s ESX/vSphere platform from a decade ago and figuring out where the gaps (and opportunities) lie between enterprise expectations driven by the popularity of VMs and the existing Docker ecosystem. Areas like networking, storage and fine grained version management (for the contents of containers) are presently underserved by the existing Docker ecosystem, and provide opportunities for both startups and incumbents.

Over time it’s likely that the distinction between VMs and containers (the ‘run’ part of Docker) will become less important, which will push attention to the ‘build’ and ‘ship’ aspects. The changes here will make the question of ‘what happens to Docker?’ much less important than ‘what happens to the IT industry as a result of Docker?’.

--------------------------------------------------------------------------------

via: http://www.infoq.com/articles/docker-future

作者：[Chris Swan][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.infoq.com/author/Chris-Swan
[1]:http://blog.dotcloud.com/dotcloud-paas-joins-cloudcontrol
[2]:http://www.infoq.com/news/2014/06/docker_1.0
[3]:https://www.kernel.org/doc/Documentation/cgroups/cgroups.txt
[4]:http://selinuxproject.org/page/Main_Page
[5]:https://linuxcontainers.org/
[6]:http://blog.docker.com/2014/03/docker-0-9-introducing-execution-drivers-and-libcontainer/
[7]:http://aufs.sourceforge.net/aufs.html
[8]:https://docs.docker.com/reference/builder/
[9]:https://registry.hub.docker.com/
[10]:http://bodenr.blogspot.co.uk/2014/05/kvm-and-docker-lxc-benchmarking-with.html?m=1
[11]:http://domino.research.ibm.com/library/cyberdig.nsf/papers/0929052195DD819C85257D2300681E7B/$File/rc25482.pdf
[12]:https://en.wikipedia.org/wiki/X86_virtualization#Hardware-assisted_virtualization
[13]:http://stealth.openwall.net/xSports/shocker.c
[14]:https://news.ycombinator.com/item?id=7910117
[15]:http://www.bromium.com/products/vsentry.html
[16]:http://cto.vmware.com/vmware-docker-better-together/
[17]:http://www.infoq.com/articles/docker-containers
[18]:http://docs.docker.com/articles/using_supervisord/
[19]:http://www.infoq.com/minibooks/emag-microservices
[20]:https://github.com/docker/libchan
[21]:https://gobyexample.com/channels
[22]:http://www.infoq.com/news/2014/08/clusterhq-launch-flocker
[23]:http://www.fig.sh/
[24]:http://openshift.github.io/geard/
[25]:http://panamax.io/
[26]:http://decking.io/
[27]:https://github.com/newrelic/centurion
[28]:https://github.com/GoogleCloudPlatform/kubernetes
[29]:https://mesosphere.io/2013/09/26/docker-on-mesos/
[30]:http://mesos.apache.org/
[31]:https://github.com/mesosphere/marathon
[32]:http://static.googleusercontent.com/media/research.google.com/en/us/pubs/archive/41684.pdf
[33]:http://deis.io/
[34]:https://flynn.io/
[35]:https://github.com/docker/libswarm
[36]:http://openvz.org/Main_Page
[37]:https://docs.docker.com/installation/#installation
[38]:https://coreos.com/
[39]:http://www.projectatomic.io/
[40]:https://github.com/coreos/fleet
[41]:https://github.com/coreos/etcd
