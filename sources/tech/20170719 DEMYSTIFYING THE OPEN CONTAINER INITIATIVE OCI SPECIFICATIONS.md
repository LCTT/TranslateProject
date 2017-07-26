DEMYSTIFYING THE OPEN CONTAINER INITIATIVE (OCI) SPECIFICATIONS
============================================================


The Open Container Initiative (OCI) announced the completion of the first versions of the container runtime and image specifications this week. The OCI is an effort under the auspices of the Linux Foundation to develop specifications and standards to support container solutions. A lot of effort has gone into the [building of these specifications][12] over the past two years. With that in mind, let’s take a look at some of the myths that have arisen over the past two years.

![OCI](https://i1.wp.com/blog.docker.com/wp-content/uploads/logo_oci.png?resize=800%2C180&ssl=1)

Myth: The OCI is a replacement for Docker

Standards are important, but they are far from a complete production platform. Take for example, the World Wide Web. It  has evolved over the last 25 years and was built on core dependable standards like TCP/IP, HTTP and HTML. Using TCP/IP as an example, when enterprises coalesced around TCP/IP as a common protocol, it fueled the growth of routers and in particular – Cisco. However, Cisco became a leader in its market by focusing on differentiated features on its routing platform. We believe the parallel exists with the OCI specifications and Docker.

[Docker is a complete production platform][13] for developing, distributing, securing and orchestrating container-based solutions. The OCI specification is used by Docker, but it represents only about five percent of our code and a small part of the Docker platform concerned with the runtime behavior of a container and the layout of a container image. 

Myth: Products and projects already are certified to the OCI specifications

The runtime and image specifications have just released as 1.0 this week. However, the OCI certification program is still in development so companies cannot claim compliance, conformance or compatibility until certification is formally rolled out later this year.

The OCI [certification working group][14] is currently defining the standard so that products and open source projects can demonstrate conformance to the specifications. Standards and specifications are important for engineers implementing solutions, but formal certification is the only way to reassure customers that the technology they are working with is truly conformant to the standard.

Myth: Docker doesn’t support the OCI specifications work

Docker has a long history with contributing to the OCI. We developed and donated a majority of the OCI code and have been instrumental in defining the OCI runtime and image specifications as maintainers of the project. When the Docker runtime and image format quickly became the de facto standards after being released as open source in 2013, we thought it would be beneficial to donate the code to a neutral governance body to avoid fragmentation and encourage innovation. The goal was to provide a dependable and standardized specification so Docker contributed runc, a simple container runtime, as the basis of the runtime specification work, and later contributed the Docker V2 image specification as the basis for the OCI image specification work.

Docker developers like Michael Crosby and Stephen Day have been key contributors from the beginning of this work, ensuring Docker’s experience hosting and running billions of container images carries through to the OCI. When the certification working group completes its work, Docker will bring its products through the OCI certification process to demonstrate OCI conformance.

Myth: The OCI specifications are about Linux containers 

There is a misperception that the OCI is only applicable to Linux container technologies because it is under the aegis of the Linux Foundation. The reality is that although Docker technology started in the Linux world, Docker has been collaborating with Microsoft to bring our container technology, platform and tooling to the world of Windows Server. Additionally, the underlying technology that Docker has donated to the OCI is broadly applicable to  multi-architecture environments including Linux, Windows and Solaris and covers x86, ARM and IBM zSeries. 

Myth: Docker was just one of many contributors to the OCI

The OCI as an organization has a lot of supporting members representing the breadth of the container industry. That said, it has been a small but dedicated group of individual technologists that have contributed the time and technology to the efforts that have produced the initial specifications. Docker was a founding member of the OCI, contributing the initial code base that would form the basis of the runtime specification and later the reference implementation itself. Likewise, Docker contributed the Docker V2 Image specification to act as the basis of the OCI image specification.

Myth: CRI-O is an OCI project

CRI-O is an open source project in the Kubernetes incubator in the Cloud Native Computing Foundation (CNCF) – it is not an OCI project. It is based on an earlier version of the Docker architecture, whereas containerd is a direct CNCF project that is a larger container runtime that includes the runc reference implementation. containerd is responsible for image transfer and storage, container execution and supervision, and low-level functions to support storage and network attachments. Docker donated containerd to the CNCF with the support of the five largest cloud providers: Alibaba Cloud, AWS, Google Cloud Platform, IBM Softlayer and Microsoft Azure with a charter of being a core container runtime for multiple container platforms and orchestration systems.  

Myth: The OCI specifications are now complete 

While the release of the runtime and image format specifications is an important milestone, there’s still work to be done. The initial scope of the OCI was to define a narrow specification on which developers could depend for the runtime behavior of a container, preventing fragmentation in the industry, and still allowing innovation in the evolving container domain. This was later expanded to include a container image specification.

As the working groups complete the first stable specifications for runtime behavior and image format, new work is under consideration. Ideas for future work include distribution and signing. The next most important work for the OCI, however, is delivering on a certification process backed by a test suite now that the first specifications are stable.

**Learn more about OCI and Open Source at Docker:**

*   Read the blog post about the [OCI Release of v1.0 Runtime and Image Format Specifications][1]

*   Visit the [Open Container Initiative website][2]

*   Visit the [Moby Project website][3]

*   Attend [DockerCon Europe 2017][4]

*   Attend the [Moby Summit LA][5] alongside OSS NA

--------------------------------------------------------------------------------

作者简介：

Stephen is Director, Open Source Programs at Docker. He has been a Director and Distinguished Technologist at Hewlett-Packard Enterprise. He blogs about open source software and business at “Once More Unto The Breach” (http://stephesblog.blogs.com) and opensource.com.



-----------------

via: https://blog.docker.com/2017/07/demystifying-open-container-initiative-oci-specifications/

作者：[Stephen ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:https://blog.docker.com/2017/07/oci-release-of-v1-0-runtime-and-image-format-specifications
[2]:https://www.opencontainers.org/join
[3]:http://mobyproject.org/
[4]:https://europe-2017.dockercon.com/
[5]:https://www.eventbrite.com/e/moby-summit-los-angeles-tickets-35930560273
[6]:https://blog.docker.com/author/stephen-walli/
[7]:https://blog.docker.com/tag/containerd/
[8]:https://blog.docker.com/tag/cri-o/
[9]:https://blog.docker.com/tag/linux-containers/
[10]:https://blog.docker.com/tag/linux-foundation/
[11]:https://blog.docker.com/tag/oci/
[12]:https://blog.docker.com/2017/07/oci-release-of-v1-0-runtime-and-image-format-specifications
[13]:https://www.docker.com/
[14]:https://github.com/opencontainers/certification
