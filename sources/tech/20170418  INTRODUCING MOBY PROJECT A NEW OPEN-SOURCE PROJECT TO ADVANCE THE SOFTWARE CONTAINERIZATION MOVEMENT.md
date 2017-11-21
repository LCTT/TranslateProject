translating---geekpi

INTRODUCING MOBY PROJECT: A NEW OPEN-SOURCE PROJECT TO ADVANCE THE SOFTWARE CONTAINERIZATION MOVEMENT
============================================================

![Moby Project](https://i0.wp.com/blog.docker.com/wp-content/uploads/1-2.png?resize=763%2C275&ssl=1)

Since Docker democratized software containers four years ago, a whole ecosystem grew around containerization and in this compressed time period it has gone through two distinct phases of growth. In each of these two phases, the model for producing container systems evolved to adapt to the size and needs of the user community as well as the project and the growing contributor ecosystem.

The Moby Project is a new open-source project to advance the software containerization movement and help the ecosystem take containers mainstream. It provides a library of components, a framework for assembling them into custom container-based systems and a place for all container enthusiasts to experiment and exchange ideas.

Let’s review how we got where we are today. In 2013-2014 pioneers started to use containers and collaborate in a monolithic open source codebase, Docker and few other projects, to help tools mature.

![Docker Open Source](https://i0.wp.com/blog.docker.com/wp-content/uploads/2-2.png?resize=975%2C548&ssl=1)

Then in 2015-2016, containers were massively adopted in production for cloud-native applications. In this phase, the user community grew to support tens of thousands of deployments that were backed by hundreds of ecosystem projects and thousands of contributors. It is during this phase, that Docker evolved its production model to an open component based approach. In this way, it allowed us to increase both the surface area of innovation and collaboration.

What sprung up were new independent Docker component projects that helped spur growth in the partner ecosystem and the user community. During that period, we extracted and rapidly innovated on components out of the Docker codebase so that systems makers could reuse them independently as they were building their own container systems: [runc][7], [HyperKit][8], [VPNKit][9], [SwarmKit][10], [InfraKit][11], [containerd][12], etc..

![Docker Open Components](https://i1.wp.com/blog.docker.com/wp-content/uploads/3-2.png?resize=975%2C548&ssl=1)

Being at the forefront of the container wave, one trend we see emerging in 2017 is containers going mainstream, spreading to every category of computing, server, data center, cloud, desktop, Internet of Things and mobile.  Every industry and vertical market, finance, healthcare, government, travel, manufacturing. And every use case, modern web applications, traditional server applications, machine learning, industrial control systems, robotics. What many new entrants in the container ecosystem have in common is that they build specialized systems, targeted at a particular infrastructure, industry or use case.

As a company Docker uses open source as our innovation lab, in collaboration with a whole ecosystem. Docker’s success is tied to the success of the container ecosystem: if the ecosystem succeeds, we succeed. Hence we have been planning for the next phase of the container ecosystem growth: what production model will help us scale the container ecosystem to fulfill the promise of making containers mainstream?

Last year, our customers started to ask for Docker on many platforms beyond Linux: Mac and Windows desktop, Windows Server, cloud platforms like Amazon Web Services (AWS), Microsoft Azure or Google Cloud Platform, and we created a [dozen Docker editions][13] specialized for these platforms. In order to be able to build and ship these specialized editions is a relatively short time, with small teams, in a scalable way, without having to reinvent the wheel; it was clear we needed a new approach.  We needed our teams to collaborate not only on components, but also on assemblies of components, borrowing [an idea from the car industry][14] where assemblies of components are reused to build completely different cars.

![Docker production model](https://i1.wp.com/blog.docker.com/wp-content/uploads/4-2.png?resize=975%2C548&ssl=1)

We think the best way to scale the container ecosystem to the next level to get containers mainstream is to collaborate on assemblies at the ecosystem level.

![Moby Project](https://i0.wp.com/blog.docker.com/wp-content/uploads/5-2.png?resize=975%2C548&ssl=1)

In order to enable this new level of collaboration, today we are announcing the Moby Project, a new open-source project to advance the software containerization movement. It provides a “Lego set” of dozens of components, a framework for assembling them into custom container-based systems, and a place for all container enthusiasts to experiment and exchange ideas. Think of Moby as the “Lego Club” of container systems.

Moby is comprised of:

1.  A **library** of containerized backend components (e.g., a low-level builder, logging facility, volume management, networking, image management, containerd, SwarmKit, …)

2.  A **framework** for assembling the components into a standalone container platform, and tooling to build, test and deploy artifacts for these assemblies.

3.  A reference assembly, called **Moby Origin**, which is the open base for the Docker container platform, as well as examples of container systems using various components from the Moby library or from other projects.

Moby is designed for system builders, who want to build their own container based systems, not for application developers, who can use Docker or other container platforms. Participants in the Moby project can choose from the library of components derived from Docker or they can elect to “bring your own components” (BYOC) packaged as containers with the option to mix and match among all of the components to create a customized container system.

Docker uses the Moby Project as an open R&D lab, to experiment, develop new components, and collaborate with the ecosystem on the future of container technology. All our open source collaboration will move to the Moby project. Docker is, and will remain, a open source product that lets you build, ship and run containers. It is staying exactly the same from a user’s perspective. Users can continue to download Docker from the docker.com website. See[ more information about the respective roles of Docker and Moby on the Moby website][15].

Please join us in helping take software containers mainstream, and grow our ecosystem and our user community to the next level by collaborating on components and assemblies.

--------------------------------------------------------------------------------

via: https://blog.docker.com/2017/04/introducing-the-moby-project/

作者：[Solomon Hykes ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/solomon/
[1]:https://blog.docker.com/author/solomon/
[2]:https://blog.docker.com/tag/containerization/
[3]:https://blog.docker.com/tag/moby-library/
[4]:https://blog.docker.com/tag/moby-origin/
[5]:https://blog.docker.com/tag/moby-project/
[6]:https://blog.docker.com/tag/open-source/
[7]:https://github.com/opencontainers/runc
[8]:https://github.com/docker/hyperkit
[9]:https://github.com/docker/vpnkit
[10]:https://github.com/docker/swarmkit
[11]:https://github.com/docker/infrakit
[12]:https://github.com/containerd/containerd
[13]:https://blog.docker.com/2017/03/docker-enterprise-edition/
[14]:https://en.wikipedia.org/wiki/List_of_Volkswagen_Group_platforms
[15]:https://mobyproject.org/#moby-and-docker
