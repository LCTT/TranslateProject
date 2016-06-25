[Translating by itsang]
4 Container Networking Tools to Know
=======================================

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/network-crop.jpeg?itok=Na1tb9aR)
>[Creative Commons Zero][1]

With so many new cloud computing technologies, tools, and techniques to keep track of, it can be hard to know where to start learning new skills. This series on [next-gen cloud technologies][2] aims to help you get up to speed on the important projects and products in emerging and rapidly changing areas such as software-defined networking (SDN) , containers, and the space where they coincide: container networking.

The relationship between containers and networks remains challenging for enterprise container deployment. Containers need networking functionality to connect distributed applications. Part of the challenge, according to a recent [Enterprise Networking Planet][3] article, is “to deploy containers in a way that provides the isolation they need to function as their own self-contained data environments while still maintaining effective connectivity.”

[Docker][4], the popular container platform, uses software-defined virtual networks to connect containers with the local network. Additionally, it uses Linux bridging features and virtual extensible LAN (VXLAN) technology so containers can communicate with each other in the same Swarm, or cluster. Docker’s plug-in architecture also allows other network management tools, such as those listed below, to control containers.

Innovation in container networking has enabled containers to connect with other containers across hosts. This enables developers to start an application in a container on a host in a development environment and transition it across testing and then into a production environment enabling continuous integration, agility, and rapid deployment.

Container networking tools help accomplish container networking scalability, mainly by:

1) enabling complex, multi-host systems to be distributed across multiple container hosts.

2) enabling orchestration for container systems spanning a tremendous number of hosts across multiple public and private cloud platforms.

![](https://www.linux.com/sites/lcom/files/styles/floated_images/public/john-willis_k.jpg?itok=lTsH9eqI)
>John Willis speaking at Open Networking Summit 2016.

For more information, check out the [Docker Networking Tutorial][5] video, which was presented by Brent Salisbury and John Willis at the recent [Open Networking Summit (ONS)][6]. This and many other ONS keynotes and presentations can be found [here][7].

Container networking tools and projects you should know about include:

[Calico][8] -- The Calico project (from [Metaswitch][9]) leverages Border Gateway Protocol (BGP) and integrates with cloud orchestration systems for secure IP communication between virtual machines and containers.

[Flannel][10] -- Flannel (previously called rudder) from [CoreOS][11] provides an overlay network that can be used as an alternative to existing SDN solutions.

[Weaveworks][12] -- The Weaveworks projects for managing containers include [Weave Net][13], Weave Scope, and Weave Flux. Weave Net is a tool for building and deploying Docker container networks.

[Canal][14] -- Just this week, CoreOS and Tigera announced the formation of a new open source project called Canal. According to the announcement, the Canal project aims to combine aspects of Calico and Flannel, "weaving security policy into both the network fabric and the cloud orchestrator."

You can learn more about container management, software-defined networking, and other next-gen cloud technologies through The Linux Foundation’s free “Cloud Infrastructure Technologies” course -- a massively open online course being offered through edX. [Registration for this course is open now][15], and course content will be available in June.

--------------------------------------------------------------------------------

via: https://www.linux.com/news/4-container-networking-tools-know

作者：[AMBER ANKERHOLZ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/aankerholz
[1]: https://www.linux.com/licenses/category/creative-commons-zero
[2]: https://www.linux.com/news/5-next-gen-cloud-technologies-you-should-know
[3]: http://www.enterprisenetworkingplanet.com/datacenter/datacenter-blog/container-networking-challenges-for-the-enterprise.html
[4]: https://docs.docker.com/engine/userguide/networking/dockernetworks/
[5]: https://youtu.be/Le0bEg4taak
[6]: http://events.linuxfoundation.org/events/open-networking-summit
[7]: https://www.linux.com/watch-videos-from-ons2016
[8]: https://www.projectcalico.org/
[9]: http://www.metaswitch.com/cloud-network-virtualization
[10]: https://coreos.com/blog/introducing-rudder/
[11]: https://coreos.com/
[12]: https://www.weave.works/
[13]: https://www.weave.works/products/weave-net/
[14]: https://github.com/tigera/canal
[15]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-cloud-infrastructure-technologies?utm_source=linuxcom&utm_medium=article&utm_campaign=cloud%20mooc%20article%201
