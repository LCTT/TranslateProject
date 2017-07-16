How Linux containers have evolved
============================================================

### Containers have come a long way in the past few years. We walk through the timeline.


![How Linux containers have evolved](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/containers_2015-3-osdc-lead.png?itok=yOKCc8ze "How Linux containers have evolved")
Image credits : 

[Daniel Ramirez][11]. [CC BY-SA 4.0][12]

In the past few years, containers have become a hot topic among not just developers, but also enterprises. This growing interest has caused an increased need for security improvements and hardening, and preparing for scaleability and interoperability. This has necessitated a lot of engineering, and here's the story of how much of that engineering has happened at an enterprise level at Red Hat.

When I first met up with representatives from Docker Inc. (Docker.io) in the fall of 2013, we were looking at how to make Red Hat Enterprise Linux (RHEL) use Docker containers. (Part of the Docker project has since been rebranded as  _Moby_ .) We had several problems getting this technology into RHEL. The first big hurdle was getting a supported Copy On Write (COW) file system to handle container image layering. Red Hat ended up contributing a few COW implementations, including [Device Mapper][13], [btrfs][14], and the first version of [OverlayFS][15]. For RHEL, we defaulted to Device Mapper, although we are getting a lot closer on OverlayFS support.

Linux Containers

*   [What are Linux containers?][1]

*   [What is Docker?][2]

*   [What is Kubernetes?][3]

*   [An introduction to container terminology][4]

The next major hurdle was on the tooling to launch the container. At that time, upstream docker was using [LXC][16]tools for launching containers, and we did not want to support LXC tools set in RHEL. Prior to working with upstream docker, I had been working with the [libvirt][17] team on a tool called [virt-sandbox][18], which used **libvirt-lxc** for launching containers.

At the time, some people at Red Hat thought swapping out the LXC tools and adding a bridge so the Docker daemon would communicate with libvirt using **libvirt-lxc** to launch containers was a good idea. There were serious concerns with this approach. Consider the following example of starting a container with the Docker client (**docker-cli**) and the layers of calls before the container process (**pid1OfContainer**) is started:

**docker-cli → docker-daemon → libvirt-lxc → pid1OfContainer**

I did not like the idea of having two daemons between your tool to launch containers and the final running container.

My team worked hard with the upstream docker developers on a native [Go programming language][19] implementation of the container runtime, called [libcontainer][20]. This library eventually got released as the initial implementation of the [OCI Runtime Specification][21]along with runc.

**docker- ****cli**** → docker-daemon @ pid1OfContainer**

Although most people mistakenly think that when they execute a container, the container process is a child of the **docker-cli**, they actually have executed a client/server operation and the container process is running as a child of a totally separate environment. This client/server operation can lead to instability and potential security concerns, and it blocks useful features. For example, [systemd][22] has a feature called socket activation, where you can set up a daemon to run only when a process connects to a socket. This means your system uses less memory and only has services executing when they are needed. The way socket activation works is systemd listens at a TCP socket, and when a packet arrives for the socket, systemd activates the service that normally listens on the socket. Once the service is activated, systemd hands the socket to the newly started daemon. Moving this daemon into a Docker-based container causes issues. The unit file would start the container using the Docker CLI and there was no easy way for systemd to pass the connected socket to the Docker daemon through the Docker CLI.

Problems like this made us realize that we needed alternate ways to run containers.

### The container orchestration problem

The upstream docker project made using containers easy, and it continues to be a great tool for learning about Linux containers. You can quickly experience launching a container by running a simple command like **docker run -ti fedora sh** and instantly you are in a container.

The real power of containers comes about when you start to run many containers simultaneously and hook them together into a more powerful application. The problem with setting up a multi-container application is the complexity quickly grows and wiring it up using simple Docker commands falls apart. How do you manage the placement or orchestration of container applications across a cluster of nodes with limited resources? How does one manage their lifecycle, and so on?

At the first DockerCon, at least seven different companies/open source projects showed how you could orchestrate containers. Red Hat's [OpenShift][23] had a project called [geard][24], loosely based on OpenShift v2 containers (called "gears"), which we were demonstrating. Red Hat decided that we needed to re-look at orchestration and maybe partner with others in the open source community.

Google was demonstrating [Kubernetes][25] container orchestration based on all of the knowledge Google had developed in orchestrating their own internal architecture. OpenShift decided to drop our Gear project and start working with Google on Kubernetes. Kubernetes is now one of the largest community projects on GitHub.

#### Kubernetes

Kubernetes was developed to use Google's [lmctfy][26] container runtime. Lmctfy was ported to work with Docker during the summer of 2014\. Kubernetes runs a daemon on each node in the Kubernetes cluster called a [kubelet][27]. This means the original Kubernetes with Docker 1.8 workflow looked something like:

**kubelet → dockerdaemon @ PID1**

Back to the two-daemon system.

But it gets worse. With every release of Docker, Kubernetes broke.Docker 1.10 Switched the backing store causing a rebuilding of all images.Docker 1.11 started using **runc** to launch containers:

**kubelet → dockerdaemon @ runc @PID1**

Docker 1.12 added a container daemon to launch containers. Its main purpose was to satisfy Docker Swarm (a Kubernetes competitor):

**kubelet → dockerdaemon → containerd @runc @ pid1**

As was stated previously,  _every_  Docker release has broken Kubernetes functionality, which is why Kubernetes and OpenShift require us to ship older versions of Docker for their workloads.

Now we have a three-daemon system, where if anything goes wrong on any of the daemons, the entire house of cards falls apart.

### Toward container standardization

### CoreOS, rkt, and the alternate runtime

Due to the issues with the Docker runtime, several organizations were looking at alternative runtimes. One such organization was CoreOS. CoreOS had offered an alternative container runtime to upstream docker, called  _rkt_  (rocket). They also introduced a standard container specification called  _appc_  (App Container). Basically, they wanted to get everyone to use a standard specification for how you store applications in a container image bundle.

This threw up red flags. When I first started working on containers with upstream docker, my biggest fear is that we would end up with multiple specifications. I did not want an RPM vs. Debian-like war to affect the next 20 years of shipping Linux software. One good outcome from the appc introduction was that it convinced upstream docker to work with the open source community to create a standards body called the [Open Container Initiative][28] (OCI).

The OCI has been working on two specifications:

**[OCI Runtime Specification][6]**: The OCI Runtime Specification "aims to specify the configuration, execution environment, and lifecycle of a container." It defines what a container looks like on disk, the JSON file that describes the application(s) that will run within the container, and how to spawn and execute the container. Upstream docker contributed the libcontainer work and built runc as a default implementation of the OCI Runtime Specification.

**[OCI Image Format Specification][7]**: The Image Format Specification is based mainly on the upstream docker image format and defines the actual container image bundle that sits at container registries. This specification allows application developers to standardize on a single format for their applications. Some of the ideas described in appc, although it still exists, have been added to the OCI Image Format Specification. Both of these OCI specifications are nearing 1.0 release. Upstream docker has agreed to support the OCI Image Specification once it is finalized. Rkt now supports running OCI images as well as traditional upstream docker images.

The Open Container Initiative, by providing a place for the industry to standardize around the container image and the runtime, has helped free up innovation in the areas of tooling and orchestration.

### Abstracting the runtime interface

One of the innovations taking advantage of this standardization is in the area of Kubernetes orchestration. As a big supporter of the Kubernetes effort, CoreOS submitted a bunch of patches to Kubernetes to add support for communicating and running containers via rkt in addition to the upstream docker engine. Google and upstream Kubernetes saw that adding these patches and possibly adding new container runtime interfaces in the future was going to complicate the Kubernetes code too much. The upstream Kubernetes team decided to implement an API protocol specification called the Container Runtime Interface (CRI). Then they would rework Kubernetes to call into CRI rather than to the Docker engine, so anyone who wants to build a container runtime interface could just implement the server side of the CRI and they could support Kubernetes. Upstream Kubernetes created a large test suite for CRI developers to test against to prove they could service Kubernetes. There is an ongoing effort to remove all of Docker-engine calls from Kubernetes and put them behind a shim called the docker-shim.

### Innovations in container tooling

### Container registry innovations with skopeo

A few years ago, we were working with the Project Atomic team on the [atomic CLI][29] . We wanted the ability to examine a container image when it sat on a container registry. At that time, the only way to look at the JSON data associated with a container image at a container registry was to pull the image to the local server and then you could use **docker inspect** to read the JSON files. These images can be huge, up to multiple gigabytes. Because we wanted to allow users to examine the images and decide not to pull them, we wanted to add a new **--remote** interface to **docker inspect**. Upstream docker rejected the pull request, telling us that they did not want to complicate the Docker CLI, and that we could easily build our own tooling to do the same.

My team, led by [Antonio Murdaca][30], ran with the idea and created [skopeo][31]. Antonio did not stop at just pulling the JSON file associated with the image—he decided to implement the entire protocol for pulling and pushing container images from container registries to/from the local host.

Skopeo is now used heavily within the atomic CLI for things such as checking for new updates for containers and inside of [atomic scan][32]. Atomic also uses skopeo for pulling and pushing images, instead of using the upstream docker daemon.

### Containers/image

We had been talking to CoreOS about potentially using skopeo with rkt, and they said that they did not want to **exec** out to a helper application, but would consider using the library that skopeo used. We decided to split skopeo apart into a library and executable and created **[image][8]**.

The [containers/image][33] library and skopeo are used in several other upstream projects and cloud infrastructure tools. Skopeo and containers/image have evolved to support multiple storage backends in addition to Docker, and it has the ability to move container images between container registries and many cool features. A [nice thing about skopeo][34]is it does not require any daemons to do its job. The breakout of containers/image library has also allowed us to add enhancements such as [container image signing][35].

### Innovations in image handling and scanning

I mentioned the **atomic** CLI command earlier in this article. We built this tool to add features to containers that did not fit in with the Docker CLI, and things that we did not feel we could get into the upstream docker. We also wanted to allow flexibility to support additional container runtimes, tools, and storage as they developed. Skopeo is an example of this.

One feature we wanted to add to atomic was **atomic mount**. Basically we wanted to take content that was stored in the Docker image store (upstream docker calls this a graph driver), and mount the image somewhere, so that tools could examine the image. Currently if you use upstream docker, the only way to look at an image is to start the container. If you have untrusted content, executing code inside of the container to look at the image could be dangerous. The second problem with examining an image by starting it is that the tools to examine the container are probably not in the container image.

Most container image scanners seem to have the following pattern: They connect to the Docker socket, do a **docker save** to create a tarball, then explode the tarball on disk, and finally examine the contents. This is a slow operation.

With **atomic mount**, we wanted to go into the Docker graph driver and mount the image. If the Docker daemon was using device mapper, we would mount the device. If it was using overlay, we would mount the overlay. This is an incredibly quick operation and satisfies our needs. You can now do:

```
# atomic mount fedora /mnt
# cd /mnt
```

And start examining the content. When you are done, do a:

```
# atomic umount /mnt
```

We use this feature inside of **atomic scan**, which allows you to have some of the fastest container scanners around.

#### **Issues with tool coordination**

One big problem is that **atomic mount** is doing this under the covers. The Docker daemon does not know that another process is using the image. This could cause problems (for example, if you mounted the Fedora image above and then someone went and executed **docker rmi fedora**, the Docker daemon would fail weirdly when trying to remove the Fedora image saying it was busy). The Docker daemon could get into a weird state.

### Containers storage

To solve this issue, we started looking at pulling the graph driver code out of the upstream docker daemon into its own repository. The Docker daemon did all of its locking in memory for the graph driver. We wanted to move this locking into the file system so that we could have multiple distinct processes able to manipulate the container storage at the same time, without having to go through a single daemon process.

We created a project called [container/storage][36], which can do all of the COW features required for running, building, and storing containers, without requiring one process to control and monitor it (i.e., no daemon required). Now skopeo and other tools and projects can take advantage of the storage. Other open source projects have begun to use containers/storage, and at some point we would like to merge this project back into the upstream docker project.

### Undock and let's innovate

If you think about what happens when Kubernetes runs a container on a node with the Docker daemon, first Kubernetes executes a command like:

```
kubelet run nginx –image=nginx
```

This command tells the kubelet to run the NGINX application on the node. The kubelet calls into the CRI and asks it to start the NGINX application. At this point, the container runtime that implemented the CRI must do the following steps:

1.  Check local storage for a container named **nginx**. If not local, the container runtime will search for a standardized container image at a container registry.

2.  If the image is not in local storage, download it from the container registry to the local system.

3.  Explode the the download container image on top of container storage—usually a COW storage—and mount it up.

4.  Execute the container using a standardized container runtime.

Let's look at the features described above:

1.  OCI Image Format Specification defines the standard image format for images stored at container registries.

2.  Containers/image is the library that implements all features needed to pull a container image from a container registry to a container host.

3.  Containers/storage provides a library to exploding OCI Image Formats onto COW storage and allows you to work with the image.

4.  OCI Runtime Specification and **runc** provide tools for executing the containers (the same tool that the Docker daemon uses for running containers).

This means we can use these tools to implement the ability to use containers without requiring a big container daemon.

In a moderate- to large-scale DevOps-based CI/CD environment, efficiency, speed, and security are important. And as long as your tools conform to the OCI specifications, then a developer or an operator should be using the best tools for automation through the CI/CD pipeline and into production. Most of the container tooling is hidden beneath orchestration or higher-up container platform technology. We envision a time in which runtime or image bundle tool selection perhaps becomes an installation option of the container platform.

### System (standalone) containers

On Project Atomic we introduced the **atomic host**, a new way of building an operating system in which the software can be "atomicly" updated and most of the applications that run on it will be run as containers. Our goal with this platform is to prove that most software can be shipped in the future in OCI Image Format, and use standard protocols to get images from container registries and install them on your system. Providing software as container images allows you to update the host operating system at a different pace than the applications that run on it. The traditional RPM/yum/DNF way of distributing packages locks the applications to the live cycle of the host operating systems.

One problem we see with shipping most of the infrastructure as containers is that sometimes you must run an application before the container runtime daemon is executing. Let's look at our Kubernetes example running with the Docker daemon: Kubernetes requires a network to be set up so that it can put its pods/containers into isolated networks. The default daemon we use for this currently is **[flanneld][9]**, which must be running before the Docker daemon is started in order to hand the Docker daemon the network interfaces to run the Kubernetes pods. Also, flanneld uses [**etcd**][37] for its data store. This daemon is required to be run before flanneld is started.

If we want to ship etcd and flanneld as container images, we have a chicken and egg situation. We need the container runtime daemon to start the containerized applications, but these applications need to be running before the container runtime daemon is started. I have seen several hacky setups to try to handle this situation, but none of them are clean. Also, the Docker daemon currently has no decent way to configure the priority order that containers start. I have seen suggestions on this, but they all look like the old SysVInit way of starting services (and we know the complexities that caused).

### systemd

One reason for replacing SysVInit with systemd was to handle the priority and ordering of starting services, so why not take advantage of this technology? In Project Atomic, we decided that we wanted to run containers on the host without requiring a container runtime daemon, especially for early boot. We enhanced the atomic CLI to allow you to install container images. If you execute** atomic install --system etcd**, it uses skopeo to go out to a container registries and pulls down the etcd OCI Image. Then it explodes (or expands) the image onto an OSTree backing store. Because we are running etcd in production, we treat the image as read-only. Next the **atomic** command grabs the systemd unit file template from the container image and creates a unit file on disk to start the image. The unit file actually uses **runc** to start the container on the host (although **runc** is not necessary).

Similar things happen if you execute **atomic install --system flanneld**, except this time the flanneld unit file specifies that it needs etcd unit running before it starts.

When the system boots up, systemd ensures that etcd is running before flanneld, and that the container runtime is not started until after flanneld is started. This allows you to move the Docker daemon and Kubernetes into system containers. This means you can boot up an atomic host or a traditional rpm-based operating system that runs the entire container orchestration stack as containers. This is powerful because we know customers want to continue to patch their container hosts independently of these components. Furthermore, it keeps the host's operating system footprint to a minimum.

There even has been discussion about putting traditional applications into containers that can run either as standalone/system containers or as an orchestrated container. Consider an Apache container that you could install with the **atomic install --system httpd** command. This container image would be started the same way you start an rpm-based httpd service (**systemctl start httpd** except httpd will be started in a container). The storage could be local, meaning /var/www from the host gets mounted into the container, and the container listens on the local network at port 80\. This shows that you could run traditional workloads on a host inside of a container without requiring a container runtime daemon.

### Building container images

From my perspective, one of the saddest things about container innovation over the past four years has been the lack of innovation on mechanisms to build container images. A container image is nothing more than a tarball of tarballs and some JSON files. The base image of a container is a rootfs along with an JSON file describing the base image. Then as you add layers, the difference between the layers gets tar’d up along with changes to the JSON file. These layers and the base file get tar'd up together to form the container image.

Almost everyone is building with the **docker build** and the Dockerfile format. Upstream docker stopped accepting pull requests to modify or improve Dockerfile format and builds a couple of years ago. The Dockerfile played an important part in the evolution of containers. Developers or administrators/operators could build containers in a simple and straightforward manner; however, in my opinion, the Dockerfile is really just a poor man’s bash script and creates several problems that have never been solved. For example:

*   To build a container image, Dockerfile requires a Docker daemon to be running.
    *   No one has built standard tooling to create the OCI image outside of executing Docker commands.

    *   Even tools such as **ansible-containers** and OpenShift S2I (Source2Image) use **docker-engine** under the covers.

*   Each line in a Dockerfile creates a new image, which helps in the development process of creating the container because the tooling is smart enough to know that the lines in the Dockerfile have not changed, so the existing images can be used and the lines do not need to be reprocessed. This can lead to a  _huge_  number of layers.
    *   Because of these, several people have requested mechanisms to squash the images eliminating the layers. I think upstream docker finally has accepted something to satisfy the need.

*   To pull content from secured sites to put into your container image, often you need some form of secrets. For example you need access to the RHEL certificates and subscriptions in order to add RHEL content to an image.
    *   These secrets can end up in layers stored in the image. And the developer needs to jump through hoops to remove the secrets.

    *   To allow volumes to be mounted in during Docker build, we have added a **-v** volume switch to the projectatomic/docker package that we ship, but upstream docker has not accepted these patches.

*   Build artifacts end up inside of the container image. So although Dockerfiles are great for getting started or building containers on a laptop while trying to understand the image you may want to build, they really are not an effective or efficient means to build images in a high-scaled enterprise environment. And behind an automated container platform, you shouldn't care if you are using a more efficient means to build OCI-compliant images.

### Undock with Buildah

At DevConf.cz 2017, I asked [Nalin Dahyabhai][38] on my team to look at building what I called **containers-coreutils**, basically, to use the containers/storage and containers/image libraries and build a series of command-line tools that could mimic the syntax of the Dockerfile. Nalin decided to call it [buildah][39], making fun of my Boston accent. With a few buildah primitives, you can build a container image:

*   One of the main concepts of security is to keep the amount of content inside of an OS image as small as possible to eliminate unwanted tools. The idea is that a hacker might need tools to break through an application, and if the tools such as **gcc**, **make**, **dnf** are not present, the attacker can be stopped or confined.

*   Because these images are being pulled and pushed over the internet, shrinking the size of the container is always a good idea.

*   How Docker build works is commands to install software or compile software have to be in the **uildroot** of the container.

*   Executing the **run** command requires all of the executables to be inside of the container image. Just using **dnf** inside of the container image requires that the entire Python stack be present, even if you never use Python in the application.

*   **ctr=$(buildah from fedora)**:
    *   Uses containers/image to pull the Fedora image from a container registry.

    *   Returns a container ID (**ctr**).

*   **mnt=$(buildah mount $ctr)**:
    *   Mounts up the newly created container image (**$ctr**).

    *   Returns the path to the mount point.

    *   You can now use this mount point to write content.

*   **dnf install httpd –installroot=$mnt**:
    *   You can use commands on the host to redirect content into the container, which means you can keep your secrets on the host, you don't have to put them inside of the container, and your build tools can be kept on the host.

    *   You don't need **dnf** inside of the container or the Python stack unless your application is going to use it.

*   **cp foobar $mnt/dir**:
    *   You can use any command available in bash to populate the container.

*   **buildah commit $ctr**:
    *   You can create a layer whenever you decide. You control the layers rather than the tool.

*   **buildah config --env container=oci --entrypoint /usr/bin/httpd $ctr**:
    *   All of the commands available inside of Dockerfile can be specified.

*   **buildah run $ctr dnf -y install httpd**:
    *   Buildah **run** is supported, but instead of relying on a container runtime daemon, buildah executes **runc** to run the command inside of a locked down container.

*   **buildah build-using-dockerfile -f Dockerfile .**:

    We want to move tools like **ansible-containers** and OpenShift S2I to use **buildah**rather than requiring a container runtime daemon.

    Another big issue with building in the same container runtime that is used to run containers in production is that you end up with the lowest common denominator when it comes to security. Building containers tends to require a lot more privileges than running containers. For example, we allow the **mknod** capability by default. The **mknod** capability allows processes to create device nodes. Some package installs attempt to create device nodes, yet in production almost no applications do. Removing the **mknod** capability from your containers in production would make your systems more secure.

    Another example is that we default container images to read/write because the install process means writing packages to **/usr**. Yet in production, I argue that you really should run all of your containers in read-only mode. Only allow the containers to write to **tmpfs** or directories that have been volume mounted into the container. By splitting the running of containers from the building, we could change the defaults and make for a much more secure environment.

    *   And yes, buildah can build a container image using a Dockerfile.

### CRI-O a runtime abstraction for Kubernetes

Kubernetes added an API to plug in any runtime for the pods called Container Runtime Interface (CRI). I am not a big fan of having lots of daemons running on my system, but we have added another. My team led by [Mrunal Patel][40] started working on [CRI-O][41] daemon in late 2016\. This is a Container Runtime Interface daemon for running OCI-based applications. Theoretically, in the future we could compile in the CRI-O code directly into the kubelet to eliminate the second daemon.

Unlike other container runtimes, CRI-O's only purpose in life is satisfying Kubernetes' needs. Remember the steps described above for what Kubernetes need to run a container.

Kubernetes sends a message to the kubelet that it wants it to run the NGINX server:

1.  The kubelet calls out to the CRI-O to tell it to run NGINX.

2.  CRI-O answers the CRI request.

3.  CRI-O finds an OCI Image at a container registry.

4.  CRI-O uses containers/image to pull the image from the registry to the host.

5.  CRI-O unpacks the image onto local storage using containers/storage.

6.  CRI-O launches a OCI Runtime Specification, usually **runc**, and starts the container. As I stated previously, the Docker daemon launches its containers using **runc**, in exactly the same way.

7.  If desired, the kubelet could also launch the container using an alternate runtime, such as Clear Containers **runv**.

CRI-O is intended to be a stable platform for running Kubernetes, and we will not ship a new version of CRI-O unless it passes the entire Kubernetes test suite. All pull requests that go to [https://github.com/Kubernetes-incubator/cri-o][42] run against the entire Kubernetes test suite. You can not get a pull request into CRI-O without passing the tests. CRI-O is fully open, and we have had contributors from several different companies, including Intel, SUSE, IBM, Google, Hyper.sh. As long as a majority of maintainers agree to a patch to CRI-O, it will get accepted, even if the patch is not something that Red Hat wants.

### Conclusion

I hope this deep dive helps you understand how Linux containers have evolved. At one point, Linux containers were an every-vendor-for-themselves situation. Docker helped focus on a de facto standard for image creation and simplifying the tools used to work with containers. The Open Container Initiative now means that the industry is working around a core image format and runtime, which fosters innovation around making tooling more efficient for automation, more secure, highly scalable, and easier to use. Containers allow us to examine installing software in new and novel ways—whether they are traditional applications running on a host, or orchestrated micro-services running in the cloud. In many ways, this is just the beginning.

--------------------------------------------------------------------------------

作者简介：

Daniel J Walsh - Daniel Walsh has worked in the computer security field for almost 30 years. Dan joined Red Hat in August 2001.

via: https://opensource.com/article/17/7/how-linux-containers-evolved

作者：[ Daniel J Walsh (Red Hat)][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rhatdan
[1]:https://opensource.com/resources/what-are-linux-containers?utm_campaign=containers&intcmp=70160000000h1s6AAA
[2]:https://opensource.com/resources/what-docker?utm_campaign=containers&intcmp=70160000000h1s6AAA
[3]:https://opensource.com/resources/what-is-kubernetes?utm_campaign=containers&intcmp=70160000000h1s6AAA
[4]:https://developers.redhat.com/blog/2016/01/13/a-practical-introduction-to-docker-container-terminology/utm_campaign=containers&intcmp=70160000000h1s6AAA
[5]:https://opensource.com/article/17/7/how-linux-containers-evolved?rate=k1UcW7wzh6axaB_z8ScE-U8cux6fLXXgW_vboB5tIwk
[6]:https://github.com/opencontainers/runtime-spec/blob/master/spec.md
[7]:https://github.com/opencontainers/image-spec/blob/master/spec.md
[8]:https://github.com/containers/imagehttps://github.com/containers/image
[9]:https://github.com/coreos/flannel
[10]:https://opensource.com/user/16673/feed
[11]:https://www.flickr.com/photos/danramarch/
[12]:https://creativecommons.org/licenses/by-sa/4.0/
[13]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Logical_Volume_Manager_Administration/device_mapper.html
[14]:https://btrfs.wiki.kernel.org/index.php/Main_Page
[15]:https://www.kernel.org/doc/Documentation/filesystems/overlayfs.txt
[16]:https://linuxcontainers.org/
[17]:https://libvirt.org/
[18]:http://sandbox.libvirt.org/
[19]:https://opensource.com/article/17/6/getting-started-go
[20]:https://github.com/opencontainers/runc/tree/master/libcontainer
[21]:https://github.com/opencontainers/runtime-spec
[22]:https://opensource.com/business/15/10/lisa15-interview-alison-chaiken-mentor-graphics
[23]:https://www.openshift.com/
[24]:https://openshift.github.io/geard/
[25]:https://opensource.com/resources/what-is-kubernetes
[26]:https://github.com/google/lmctfy
[27]:https://kubernetes.io/docs/admin/kubelet/
[28]:https://www.opencontainers.org/
[29]:https://github.com/projectatomic/atomic
[30]:https://twitter.com/runc0m
[31]:https://github.com/projectatomic/skopeohttps://github.com/projectatomic/skopeo
[32]:https://developers.redhat.com/blog/2016/05/02/introducing-atomic-scan-container-vulnerability-detection/
[33]:https://github.com/containers/image
[34]:http://rhelblog.redhat.com/2017/05/11/skopeo-copy-to-the-rescue/
[35]:https://access.redhat.com/articles/2750891
[36]:https://github.com/containers/storage
[37]:https://github.com/coreos/etcd
[38]:https://twitter.com/nalind
[39]:https://github.com/projectatomic/buildah
[40]:https://twitter.com/mrunalp
[41]:https://github.com/Kubernetes-incubator/cri-o
[42]:https://github.com/Kubernetes-incubator/cri-o
[43]:https://opensource.com/users/rhatdan
[44]:https://opensource.com/users/rhatdan
[45]:https://opensource.com/article/17/7/how-linux-containers-evolved#comments
