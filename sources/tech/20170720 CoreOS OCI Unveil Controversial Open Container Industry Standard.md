translating---LHRchina
CoreOS, OCI Unveil Controversial Open Container Industry Standard
============================================================
![coreos-oci-open-container-industry-standard](http://www.linuxinsider.com/article_images/story_graphics_xlarge/xl-2017-core-os-1.jpg)


[**Managing Your Intellectual Property Integrity During M&A Transactions**][12]
[][13]Flexera Software presents best practices and methodology for the technical due diligence auditing process.
**[Download the White Paper][3]**

[CoreOS][4] and the [Open Container Initiative][5] on Wednesday introduced image and runtime specifications largely based on Docker's image format technology.

However, OCI's decision to model the standard on Docker's de facto platform has raised questions. Some critics have argued for other options.

Version 1.0 provides a stable standard for application containers, according to Brandon Philips, CTO at CoreOS and chair of the OCI Technical Oversight Board.

Having a standard created by industry leaders should spur OCI partners to develop further standards and innovation, he said.

Reaching the 1.0 mark means that the OCI Runtime Spec and the OCI Image Format Spec now are ready for broad use. Further, this achievement will push the OCI community to help stabilize a growing market of interoperable pluggable tools, Philips added.

The industry-supported standards also will provide a sense of confidence that containers are here to stay, he said, and that Kubernetes users can expect future support.

"The outcome is really good. The certification process is under way now," Philips told LinuxInsider.

### Collaboration Challenges

Open standards are key to the success of the container ecosystem, said Philips, and the best way to achieve standards is by working closely with the community. However, reaching agreement on version 1.0 was more time consuming than expected.

"Early on, the biggest challenge was coming to terms with the model of how the project releases would work and how to get the project off the ground," Philips recalled. "Everyone underestimated how much time that would take."

Coalition members dealt with mismatched expectations about what they wanted to do, he said, but in the last year or so, the group got the referencing expectations done and more testing came through.

### Quest for Standards

CoreOS officials began discussing the idea for an industry-approved open standard for the container image and runtime specifications several years ago. That early quest led to the realization that agreeing on a standard image format was critical, Phillips said.

CoreOS and container technology creator [Docker][6] announced OCI's formation in June 2015\. The coalition started with 21 industry leaders forming the Open Container Project (OCP) as a non-profit organization seeking minimal common standards for software containers for cloud storage.

The coalition includes leaders in the container industry -- among them, Docker, Microsoft, Red Hat, IBM, Google and The Linux Foundation.

OCI's goal is to give high confidence to application developers that the software deployed in their containers will continue to work when newer specifications come out and people develop new tools. That confidence must be met for both proprietary and open source software.

It does not matter if the tools and applications are proprietary or open source. With the specifications in place, the products can be designed to work with any container configuration, Philips said.

"You need a conscious effort to create standards outside of people writing code. It is a separate effort," he added.

As part of the coalition, Docker donated its de facto image format standard technology to the OCP.

It included the company's container format, runtime code and specifications. Work on creating an Open Container Initiative Image Specification began last year.

The standards milestone gives container users the capability to develop, package and sign application containers. They also can run the containers in a variety of container engines, noted Philips.

### A Choice of One?

The coalition faced two ways to pursue open standards, observed Charles King, principal analyst at [Pund-IT][7]. The first option was to gather like-minded people to hash out differences and build standards from scratch.

The coalition members seemed to settle for the second option, which involved adopting a powerful, market leading platform as an effective standard, he said.

"Docker's contributions to The [Linux Foundation][8] put the OCI firmly on the second path -- but those who are concerned about Docker's approach or its market position may feel there are better options," King told LinuxInsider.

In fact, one OCI member -- CoreOS -- leveled some strong criticism of the group's general direction at the beginning of the effort, he said, "so it will be interesting to see how V1.0 does/doesn't address those concerns."

### Faster Path

Docker's widely deployed runtime implementation is a suitable foundation for building an open standard. It already was a defacto standard, according to David Linthicum, senior vice president at [Cloud Technology Partners][9].

"It's also important that we get this working for us quickly. The waves of standards meetings, dealing with politics and things such as that, just waste time," he told LinuxInsider.

Right now, though, there are no better options, Linthicum added.

The runtime Docker uses is runC, which is an implementation of the OCI runtime standard, according to Joe Brockmeier, senior evangelist for Linux Containers at Red Hat.

"So, runC is a suitable foundation for a runtime standard, yes. It is broadly accepted and forms the basis for most container implementations today," he told LinuxInsider.

OCI is far more than Docker. While Docker did commit the underlying code from which the OCI specification is derived, the lineage stops there, said Brockmeier, and no truly viable alternatives exist.

### Docking the Question

Adopting an industry-wide standard likely will simplify and speed container adoption and management for many companies, suggested Pund-IT's King. It also is likely that some key vendors will continue to focus on their own proprietary container technologies.

"They'll argue that theirs is a superior path -- but that will effectively prevent the OCI from achieving market-wide leadership," he said. "Starting out with a standard that's more or less complete, as OCI has, may not perfectly please everyone, but it's likely to move forward to completion more quickly and effectively than other options."

Containers have standardized deployment to cloud, with Docker clearly leading the way, said Marko Anastasov, cofounder of [Semaphore][10].

Docker's de facto standard container does represent the best foundation for developing an open standard, he said.

"How Docker's commercial interests will influence the scale of its involvement in OCI remains to be seen," he told LinuxInsider.

### Opposing Viewpoint

An open standard is not the end-all for adopting more containers in cloud deployment, contended Nic Cheneweth, principal consultant with[ThoughtWorks][11]. A better approach is to look at the impact of the server virtualization segment of the IT industry.

"The principal driver for continued growth and widespread adoption was not in the statement of an industry standard but in the potential and realized efficiencies obtained by use of any of the competing technologies, such as VMware, Xen, etc.," Cheneweth told LinuxInsider.

Aspects of container technology, such as the container itself, lend themselves to definition of a standard. Until then, healthy competition guided by deep open source software involvement will contribute to be a better standard, he said.

A standard around the orchestration of containers is not particularly important to the continued growth of the space, according to Cheneweth.

However, if the industry insists on locking into a de facto container standard, the model OCI chose is a good starting point, he said. "I don't know that better options are available, but certainly worse ones exist."

--------------------------------------------------------------------------------

作者简介：

Jack M. Germain has been an ECT News Network reporter since 2003. His main areas of focus are enterprise IT, Linux and open source technologies. He has written numerous reviews of Linux distros and other open source software. Email Jack.


----

via: http://www.linuxinsider.com/story/84689.html

作者：[Jack M. Germain ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:jack.germain@newsroom.ectnews.comm
[1]:http://www.linuxinsider.com/story/84689.html?rss=1#
[2]:http://www.linuxinsider.com/perl/mailit/?id=84689
[3]:http://www.linuxinsider.com/story/84689.html?rss=1
[4]:https://coreos.com/
[5]:https://www.opencontainers.org/
[6]:https://www.docker.com/
[7]:http://www.pund-it.com/
[8]:http://www.linuxfoundation.org/
[9]:https://www.cloudtp.com/
[10]:http://www.semaphoreci.com/
[11]:https://www.thoughtworks.com/
[12]:http://www.linuxinsider.com/story/84689.html?rss=1
[13]:http://www.linuxinsider.com/story/84689.html?rss=1
