> translating by rieon

DOCKER LEADS OCI RELEASE OF V1.0 RUNTIME AND IMAGE FORMAT SPECIFICATIONS
============================================================


Today marks an important milestone for the Open Container Initiative (OCI) with the release of the OCI v1.0 runtime and image specifications – a journey that Docker has been central in driving and navigating over the last two years. It has been our goal to provide low-level standards as building blocks for the community, customers and the broader industry. To understand the significance of this milestone, let’s take a look at the history of Docker’s growth and progress in developing industry-standard container technologies.

The History of Docker Runtime and Image Donations to the OCI

Docker’s image format and container runtime quickly emerged as the de facto standard following its release as an open source project in 2013\. We recognized the importance of turning it over to a neutral governance body to fuel innovation and prevent fragmentation in the industry. Working together with a broad group of container technologists and industry leaders, the Open Container Project was formed to create a set of container standards and was launched under the auspices of the Linux Foundation in June 2015 at DockerCon. It became the Open Container Initiative (OCI) as the project evolved that Summer.

Docker contributed runc, a reference implementation for the container runtime software that had grown out of Docker employee [Michael Crosby’s][17] libcontainer project. runc is the basis for the runtime specification describing the life-cycle of a container and the behavior of a container runtime. runc is used in production across tens of millions of nodes, which is an order of magnitude more than any other code base. runc became the reference implementation for the runtime specification project itself, and continued to evolve with the project.  

Almost a year after work began on the runtime specification, a new working group formed to specify a container image format. Docker donated the Docker V2 Image Format to the OCI as the basis for the image specification. With this donation, the OCI defines the data structures — the primitives — that make up a container image. Defining the container image format is an important step for adoption, but it takes a platform like Docker to activate its value by defining and providing tooling on how to build images, manage them and ship them around. For example, things such as the Dockerfile are not included in the OCI specifications.

Title: Docker’s History of Contribution to the OCI

![Docker and OCI](https://i2.wp.com/blog.docker.com/wp-content/uploads/OCI.png?resize=938%2C1491&ssl=1)

The Journey to Open Container Standards

The specifications have continued to evolve for two years now. Smaller projects have been spun out of the runc reference implementation as the code has been refactored, as well as support testing tools that will become the test suite for certification.

See the timeline above for details about Docker’s involvement in shaping OCI, which includes: creating runc, iterating on the runtime specification with the community, creating containerd to integrate runc in Docker 1.11, donating the Docker V2 Image Format to OCI as a base for the image format specification, implementing that specification in [containerd][18] so that this core container runtime covers both the runtime and image format standards, and finally donating containerd to the Cloud Native Computing Foundation (CNCF) and iterating on it towards a 1.0 alpha release this month.

Maintainers [Michael Crosby][19] and [Stephen Day][20] have lead the development of these specifications and have been instrumental in bringing v1.0 to fruition, alongside contributions from Alexander Morozov, Josh Hawn, Derek McGown and Aaron Lehmann, as well as Stephen Walli participating in the certification working group.

Docker remains committed to driving container standards, building a strong base at the layers where everyone agrees so that the industry can innovate at the layers that are still very differentiated.

Open Standards are Only a Piece of the Puzzle

Docker is a complete platform for creating, managing, securing, and orchestrating containers and container images. The vision has always been a base of industry standard specifications that support open source components or the plumbing of a container solution. The Docker platform sits above this layer – providing users and customers with a secure container management solution from development through production.  

The OCI runtime and image specifications become the dependable standards base that allow and encourage the greatest number of container solutions and at the same time, they do not restrict product innovation or shutout major contributors. To draw a comparison, TCP/IP, HTTP and HTML became the dependable standards base upon which the World Wide Web was built over the past 25 years. Companies continue to innovate with new tools, technologies and browsers on these standards. The OCI specifications provide the similar foundation for containers solutions going forward.

Open source projects also play a role in providing components for product development. The OCI runc reference implementation is used by the containerd project, a larger container runtime responsible for image transfer and storage, container execution and supervision, and low-level functions to support storage and network attachments. The containerd project was contributed by Docker to the CNCF and sits alongside other important projects to support cloud native computing solutions.

Docker uses containerd and more of its own core open source infrastructure elements like the LinuxKit, InfraKit and Notary projects to build and secure container solutions that become the Docker Community Edition tools. Users and organizations looking for complete container platforms that are holistic and provide container management, security, orchestration, networking and more can look to Docker Enterprise Edition.

![Docker Stack](https://i0.wp.com/blog.docker.com/wp-content/uploads/243938a0-856b-4a7f-90ca-2452a69a385c-1.jpg?resize=1019%2C511&ssl=1)

> This diagram highlights that the OCI specifications provide a layer of standards, implemented by a container runtime: containerd and runc. To assemble a full container platform such as Docker with full container lifecycle workflow, many other components are brought together: to manage infrastructure (InfraKit), provide an operating system (LinuxKit), deliver orchestration (SwarmKit), ensure security (Notary).

What’s Next for the OCI

We should celebrate the efforts of the developers as the runtime and image specifications are published. The next critical work to be done by the Open Container Initiative is to deliver a certification program to validate claims from implementers that their products and projects do indeed conform to the runtime and image specifications. The [Certification Working Group][21] has been putting together a program that in conjunction with a developing suite of test tools for both the [runtime][22] and [image][23] specifications will show how implementations fare against the standards.

At the same time, the developers of the current specifications are considering the next most important areas of container technology to specify. Work is underway around a common networking interface for containers in the Cloud Native Computing Foundation, but work to support signing and distribution are areas under consideration for the OCI.

Alongside the OCI and its members, Docker remains committed to standardizing container technology. The OCI’s mission is to give users and companies the baseline on which they can innovate in the areas of developer tooling, image distribution, container orchestration, security, monitoring and management. Docker will continue to lead the charge in innovation – not only with tooling that increases productivity and increases efficiencies, but also by empowering users, partners and customers to innovate as well.

**Learn more about OCI and Open Source at Docker:**

*   Read about the [OCI specifications Myths][1]

*   Visit the [Open Container Initiative website][2]

*   Visit the [Moby Project website][3]

*   Attend [DockerCon Europe 2017][4]

*   Attend the [Moby Summit LA][5] alongside OSS NA

--------------------------------------------------------------------------------

作者简介：

Patrick Chanezon is member of technical staff at Docker Inc. He helps to build Docker, an open platform for distributed applications for developers and sysadmins. Software developer and storyteller, he spent 10 years building platforms at Netscape & Sun, then 10 years evangelizing platforms at Google, VMware & Microsoft. His main professional interest is in building and kickstarting the network effect for these wondrous two-sided markets called Platforms. He has worked on platforms for Portals, Ads, Commerce, Social, Web, Distributed Apps, and Cloud. More information is available at linkedin.com/in/chanezon. Patrick tweets at @chanezon.



------

via: https://blog.docker.com/2017/07/oci-release-of-v1-0-runtime-and-image-format-specifications/

作者：[Patrick Chanezon ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/chanezon/
[1]:https://blog.docker.com/2017/07/demystifying-open-container-initiative-oci-specifications/
[2]:https://www.opencontainers.org/join
[3]:http://mobyproject.org/
[4]:https://europe-2017.dockercon.com/
[5]:https://www.eventbrite.com/e/moby-summit-los-angeles-tickets-35930560273
[6]:https://blog.docker.com/author/chanezon/
[7]:https://blog.docker.com/tag/cncf/
[8]:https://blog.docker.com/tag/containerd/
[9]:https://blog.docker.com/tag/containers/
[10]:https://blog.docker.com/tag/docker/
[11]:https://blog.docker.com/tag/docker-image-format/
[12]:https://blog.docker.com/tag/docker-runtime/
[13]:https://blog.docker.com/tag/infrakit/
[14]:https://blog.docker.com/tag/linux-foundation/
[15]:https://blog.docker.com/tag/oci/
[16]:https://blog.docker.com/tag/open-containers/
[17]:https://github.com/crosbymichael
[18]:https://containerd.io/
[19]:https://github.com/crosbymichael
[20]:https://github.com/stevvooe
[21]:https://github.com/opencontainers/certification
[22]:https://github.com/opencontainers/runtime-tools
[23]:https://github.com/opencontainers/image-tools
