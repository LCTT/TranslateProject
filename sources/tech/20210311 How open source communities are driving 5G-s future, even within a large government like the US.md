[#]: subject: (How open source communities are driving 5G’s future, even within a large government like the US)
[#]: via: (https://www.linux.com/news/how-open-source-communities-are-driving-5gs-future-even-within-a-large-government-like-the-us/)
[#]: author: (Jason Perlow https://www.linux.com/author/jperlow/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How open source communities are driving 5G’s future, even within a large government like the US
======

![][1]

In mid-February, the [Linux Foundation announced][2] it had signed a collaboration agreement with the [Defense Advanced Research Projects Agency][3] (DARPA), enabling US Government suppliers to collaborate on a common open source platform that will enable the adoption of 5G wireless and edge technologies by the government. Governments face similar issues to enterprise end-users — if all their suppliers deliver incompatible solutions, the integration burden escalates exponentially.

The first collaboration, [Open Programmable Secure 5G][4] (OPS-5G), currently in the formative stages, will be used to create open source software and systems enabling end-to-end 5G and follow-on mobile networks.

### The road to open source influencing 5G: The First, Second, and Third Waves of Open Source

If we examine the history of open source, it is informative to observe it from the perspective of evolutionary waves. Many open-source projects began as single technical projects, with specific objectives, such as building an operating system kernel or an application. This isolated, single project approach can be viewed as the first wave of open source.

We can view the second wave of open source as creating platforms seeking to address a broad horizontal solution, such as a cloud or networking stack or a machine learning and data platform.

The third wave of open source collaboration goes beyond isolated projects and integrates them for a common platform for a specific industry vertical. Additionally, the third wave often focuses on reducing fragmentation — you commonly will see a conformance program or a specification or standard that anyone in the industry can cite in procurement contracts.

Industry conformance becomes important as specific solutions are taken to market and how cross-industry solutions are being built — especially now that we have technologies requiring cross-industry interaction, such as end-to-end 5G, the edge, or even cloud-native applications and environments that span any industry vertical.

The third wave of open source also seeks to provide comprehensive end-to-end solutions for enterprises and verticals, large institutional organizations, and government agencies. In this case, the community of government suppliers will be building an open source 5G stack used in enterprise networking applications. The end-to-end open source integration and collaboration supported by commercial investment with innovative products, services, and solutions accelerate the technology adoption and transformation.

### Why DARPA chose to partner with the Linux Foundation

DARPA at the US Department of Defense has tens of thousands of contractors supplying networking solutions for government facilities and remote locations. However, it doesn’t want dozens, hundreds, or thousands of unique and incompatible hardware and software solutions originating from its large contractor and supplier ecosystem. Instead, it desires a portable and open access standard to provide transparency to enable advanced software tools and systems to be applied to a common code base various groups in the government could build on. The goal is to have a common framework that decouples hardware and software requirements and enabling adoption by more groups within the government.

Naturally, as a large end-user, the government wants its suppliers to focus on delivering secure solutions. A common framework can ideally decrease the security complexity versus having disparate, fragmented systems.

The Linux Foundation is also the home of nearly all the important open source projects in the 5G and networking space. [Out of the $54B of the Linux Foundation community software projects that have been valued using the COCOMO2 model][5], the open source projects assisting with building a 5G stack are estimated to be worth about $25B in shared technology investment. The LF Networking projects have been valued at $7.4B just by themselves.

The support programs at Linux Foundation provide the key foundations for a shared community innovations pool. These programs include IP structure and legal frameworks, an open and transparent development process, neutral governance, conformance, and DevOps infrastructure for end-to-end project lifecycle and code management. Therefore, it is uniquely suited to be the home for a community-driven effort to define an open source 5G end-to-end architecture, create and run the open source projects that embody that architecture, and support its integration for scaling-out and accelerating adoption.

### The foundations of a complete open source 5G stack

The Linux Foundation worked in the telecommunications industry early on in its existence, starting with the [Carrier Grade Linux][6] initiatives to identify requirements and building features to enable the Linux kernel to address telco requirements. In 2013, The Linux Foundation’s open source networking platform started with bespoke projects such as [OpenDaylight][7], the software-defined networking controller. [OPNFV][8] (now [Anuket][9]), the network function virtualization stack, was introduced in 2014-2015, followed by the first release of [Tungsten Fabric][10], the automated software-defined networking stack. [FD.io][11], the secure networking data plane, was announced in 2016, a sister project of the [Data Plane Development Kit][12] (DPDK) released into open source in 2010.

![Linux Foundation & Other Open Source Component Projects for 5G][13]

At the time, the telecom/network and wireless carrier industry sought to commoditize and accelerate innovation across a specific piece of the stack as software-defined networking became part of their digital transformation. Since the introduction of these projects at LFN, the industry has seen heavy adoption and significant community contribution by the largest telecom carriers and service providers worldwide. This history is chronicled in detail in our whitepaper, [Software-Defined Vertical Industries: Transformation Through Open Source][5].

The work that the member companies will focus on will require robust frameworks for ensuring changes to these projects are contributed back upstream into the source projects. Upstreaming, which is a key benefit to open source collaboration, allows the contributions specific to this 5G effort to roll back into their originating projects, thus improving the software for every end-user and effort that uses them.

The Linux Foundation networking stack continues to evolve and expand into additional projects due to an increased desire to innovate and commoditize across key technology areas through shared investments among its members. In February of 2021, Facebook contributed the [Magma project][14], which transcends platform infrastructure such as the others listed above. Instead, it is a network function application that is core to 5G network operations.

The E2E 5G Super Blueprint is being developed by the LFN Demo working group. This is an open collaboration and we encourage you to join us. [Learn more here][15]

### Building through organic growth and cross-pollination of the open source networking and cloud community

Tier 2 operators, rural operators, and governments worldwide want to reap the benefits of economic innovation as well as potential cost-savings from 5G. How is this accomplished?

With this joint announcement and its DARPA supplier community collaboration, the Linux Foundation’s existing projects can help serve the requirements of other large end-users. Open source communities are advancing and innovating some of the most important and exciting technologies of our time. It’s always interesting to have an opportunity to apply the results of these communities to new use cases.

The Linux Foundation understands the critical dynamic of cross-pollination between community-driven open source projects needed to help make an ecosystem successful. Its proven governance model has demonstrated the ability to maintain and mature open source projects over time and make them all work together in one single, cohesive ecosystem.

As a broad set of contributors work on components of an open source stack for 5G, there will be cross-community interactions. For example, that means that [Project EVE][16], the cloud-native edge computing platform, will potentially be working with [Project Zephyr][17], the scalable real-time operating system (RTOS) kernel, so that Eve can potentially orchestrate Zephyr devices. It’s all based on contributors’ self-interests and motivations to contribute functionality that enables these projects to work together. Similarly, [ONAP][18], the network automation/orchestration platform, is tightly integrated with [Akraino][19] so that it has architectural deployment templates built around network edge clouds and multi-edge clouds.

An open source platform has implications not just for new business opportunities for government suppliers but also for other institutions. The projects within an open source platform have open interfaces that can be integrated and used with other software so that other large end-users like the World Bank, can have validated and tested architectural blueprints, with which can go ahead and deploy effective 5G solutions in the marketplace in many host countries, providing them a turnkey stack. This will enable them to encourage providers through competition or challenges native to their in-country commercial ecosystem to implement those networks.

This is a true solutions-oriented open source for 5G stack for enterprises, governments, and the world.

The post [How open source communities are driving 5G’s future, even within a large government like the US][20] appeared first on [Linux Foundation][21].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/how-open-source-communities-are-driving-5gs-future-even-within-a-large-government-like-the-us/

作者：[Jason Perlow][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/jperlow/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2021/03/HowOpenSourceCommunitiesAreDriving-031021-2.png
[2]: https://www.linuxfoundation.org/en/resources/announcements/
[3]: https://www.darpa.mil/
[4]: https://usgovops.org/
[5]: https://www.linuxfoundation.org/en/resources/publications/software-defined-vertical-industries-transformation-through-open-source/
[6]: https://wiki.linuxfoundation.org/cgl/start
[7]: https://www.opendaylight.org/
[8]: https://www.opnfv.org/
[9]: https://anuket.io/
[10]: https://tungsten.io/
[11]: https://fd.io/
[12]: https://www.dpdk.org/
[13]: https://www.linuxfoundation.org/wp-content/uploads/5g-landscape-arpit.png
[14]: https://www.magmacore.org/
[15]: https://www.lfnetworking.org/e2e-5g-super-blueprint/
[16]: https://www.lfedge.org/projects/eve/
[17]: https://www.zephyrproject.org/
[18]: https://www.onap.org/
[19]: https://www.lfedge.org/projects/akraino/
[20]: https://www.linuxfoundation.org/en/blog/how-open-source-communities-are-driving-5gs-future-even-within-a-large-government-like-the-us/
[21]: https://www.linuxfoundation.org/
