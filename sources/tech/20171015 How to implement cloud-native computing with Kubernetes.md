How to implement cloud-native computing with Kubernetes
============================================================

![](https://insights.hpe.com/content/hpe-nxt/en/articles/2017/10/how-to-implement-cloud-native-computing-with-kubernetes/_jcr_content/article-image.transform/1043x496-crop/image.jpeg)

Kubernetes and containers can speed up the development process while minimizing programmer and system administration costs, say representatives of the Open Container Initiative and the Cloud Native Computing Foundation. To take advantage of Kubernetes and its related tools to run a cloud-native architecture, start with unappreciated Kubernetes features like namespaces.

[Kubernetes][2] is far more than a cloud-container manager. As Steve Pousty, [Red Hat's][3] lead developer advocate for [OpenShift][4], explained in a presentation at [the Linux Foundation's][5] [Open Source Summit][6], Kubernetes serves as a "common operating plane for cloud-native computing using containers."

What does Pousty mean by that? Let's review the basics.

“Cloud-native computing uses an open source software stack to deploy applications as microservices, package each part into its own container, and dynamically orchestrate those containers to optimize resource utilization,” explains Chris Aniszczyk, executive director of the [Open Container Initiative][7] (OCI) and the [Cloud Native Computing Foundation][8] (CNCF). [Kubernetes takes care of that last element][9] of cloud-native computing. The result is part of a larger transition in IT, moving from servers to virtual machines to buildpacks—and now to [containers][10].

This data center evolution has netted significant cost savings, in part because it requires fewer dedicated staff, conference presenters say. For example, by using Kubernetes, Google needs only one site reliability engineer per 10,000 machines, according to Aniszczyk.

Practically speaking, however, system administrators can take advantage of new Kubernetes-related tools and exploit under-appreciated features.

### Building a native cloud platform

Pousty explained, "For Red Hat, Kubernetes is the cloud Linux kernel. It's this infrastructure that everybody's going to build on."

For an example, let's say you have an application within a container image. How do you know it's safe? Red Hat and other companies use [OpenSCAP][11], which is based on the [Security Content Automation Protocol][12] (SCAP), a specification for expressing and manipulating security data in standardized ways. The OpenSCAP project provides open source hardening guides and configuration baselines. You select an appropriate security policy, then use OpenSCAP-approved security tools to make certain the programs within your Kubernetes-controlled containers comply with those customized security standards.

Unsure how to get started with containers? Yes, we have a guide for that.

[Get Containers for Dummies][1]

Red Hat automated this process further using [Atomic Scan][13]; it works with any OpenSCAP provider to scan container images for known security vulnerabilities and policy configuration problems. Atomic Scan mounts read-only file systems. These are passed to the scanning container, along with a writeable directory for the scanner's output.

This approach has several advantages, Pousty pointed out, primarily, "You can scan a container image without having to actually run it." So, if there is bad code or a flawed security policy within the container, it can't do anything to your system.

Atomic Scan works much faster than running OpenSCAP manually. Since containers tend to be spun up and destroyed in minutes or hours, Atomic Scan enables Kubernetes users to keep containers secure in container time rather than the much-slower sysadmin time.

### Tool time

Another tool that help sysadmins and DevOps make the most of Kubernetes is [CRI-O][14]. This is an OCI-based implementation of the [Kubernetes Container Runtime Interface][15]. CRI-O is a daemon that Kubernetes can use for running container images stored on Docker registries, explains Dan Walsh, a Red Hat consulting engineer and [SELinux][16] project lead. It enables you to launch container images directly from Kubernetes instead of spending time and CPU cycles on launching the [Docker Engine][17]. And it’s image format agnostic.

In Kubernetes, [kubelets][18] manage pods, or containers’ clusters. With CRI-O, Kubernetes and its kubelets can manage the entire container lifecycle. The tool also isn't wedded to Docker images; you can also use the new [OCI Image Format][19] and [CoreOS's rkt][20] container images.

Together, these tools are becoming a Kubernetes stack: the orchestrator, the [Container Runtime Interface][21] (CRI), and CRI-O. Lead Kubernetes engineer Kelsey Hightower says, "We don’t really need much from any container runtime—whether it’s Docker or [rkt][22]. Just give us an API to the kernel." The result, promise these techies, is the power to spin containers faster than ever.

Kubernetes is also speeding up building container images. Until recently, there were [three ways to build containers][23]. The first way is to build container images in place via a Docker or CoreOS. The second approach is to inject custom code into a prebuilt image. Finally, Asset Generation Pipelines use containers to compile assets that are then included during a subsequent image build using Docker's [Multi-Stage Builds][24].

Now, there's a Kubernetes-native method: Red Hat's [Buildah][25], [a scriptable shell tool][26] for efficiently and quickly building OCI-compliant images and containers. Buildah simplifies creating, building, and updating images while decreasing the learning curve of the container environment, Pousty said. You can use it with Kubernetes to create and spin up containers automatically based on an application's calls. Buildah also saves system resources, because it does not require a container runtime daemon.

So, rather than actually booting a container and doing all sorts of steps in the container itself, Pousty said, “you mount the file system, do normal operations on your machine as if it were your normal file system, and then commit at the end."

What this means is that you can pull down an image from a registry, create its matching container, and customize it. Then you can use Buildah within Kubernetes to create new running images as you need them. The end result, he said, is even more speed for running Kubernetes-managed containerized applications, requiring fewer resources.

### Kubernetes features you didn’t know you had

You don’t necessarily need to look for outside tools. Kubernetes has several underappreciated features.

One of them, according to Allan Naim, a Google Cloud global product lead, is [Kubernetes namespaces][27]. In his Open Source Summit speech on Kubernetes best practices, Naim said, "Few people use namespaces—and that's a mistake."

“Namespaces are the way to partition a single Kubernetes cluster into multiple virtual clusters," said Naim. For example, "you can think of namespaces as family names." So, if "Smith" identifies a family, one member, say, Steve Smith, is just “Steve,” but outside the confines of the family, he's "Steve Smith" or perhaps "Steve Smith from Chicago.”

More technically, "namespaces are a logical partitioning capability that enable one Kubernetes cluster to be used by multiple users, teams of users, or a single user with multiple applications without confusion,” Naim explained. “Each user, team of users, or application may exist within its namespace, isolated from every other user of the cluster and operating as if it were the sole user of the cluster.”

Practically speaking, you can use namespaces to mold an enterprise's multiple business/technology entities onto Kubernetes. For example, cloud architects can define the corporate namespace strategy by mapping product, location, team, and cost-center namespaces.

Another approach Naim suggested is to use namespaces to partition software development pipelines into discrete namespaces. These could be such familiar units as testing, quality assurance, staging, and production. Or namespaces can be used to manage separate customers. For instance, you could create a separate namespace for each customer, customer project, or customer business unit. That makes it easier to distinguish between projects and avoid reusing the same names for resources.

However, Kubernetes doesn't currently provide a mechanism to enforce access controls across namespaces. Therefore, Naim recommended you don't externally expose programs using this approach. Also keep in mind that namespaces aren't a management cure-all. For example, you can't nest namespaces within one other. In addition, there's no mechanism to enforce security across namespaces.

Still, used with care, namespaces can be quite useful.

### Human-centered tips

Moving from deep technology to project management, Pousty suggested that, in the move to a cloud-native and microservice architecture, you put an operations person on your microservice team. “If you're going to do microservices, your team will end up doing Ops-y work. And, it's kind of foolish not to bring in someone who already knows operations,” he said. “You need the right core competencies on that team. I don't want developers to reinvent the operations wheel."

Instead, reinvent your work process into one that enables you to make the most from containers and clouds. For that, Kubernetes is great.

### Cloud-native computing with Kubernetes: Lessons for leaders

*   The cloud-native ecosystem is expanding rapidly. Look for tools that can extend the ways you use containers.

*   Explore less well-known Kubernetes features such as namespaces. They can improve your organization and automation.

*   Make sure development teams deploying to containers have an Ops person involved. Otherwise strife will ensue.

--------------------------------------------------------------------------------

作者简介：

Steven J. Vaughan-Nichols, CEO, Vaughan-Nichols & Associates 

Steven J. Vaughan-Nichols, aka sjvn, has been writing about technology and the business of technology since CP/M-80 was the cutting edge, PC operating system; 300bps was a fast Internet connection; WordStar was the state of the art word processor; and we liked it. His work has been published in everything from highly technical publications (IEEE Computer, ACM NetWorker, Byte) to business publications (eWEEK, InformationWeek, ZDNet) to popular technology (Computer Shopper, PC Magazine, PC World) to the mainstream press (Washington Post, San Francisco Chronicle, BusinessWeek).

---------------------


via: https://insights.hpe.com/articles/how-to-implement-cloud-native-computing-with-kubernetes-1710.html

作者：[ Steven J. Vaughan-Nichols][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.hpe.com/contributors/steven-j-vaughan-nichols.html
[1]:https://www.hpe.com/us/en/resources/storage/containers-for-dummies.html?jumpid=in_insights~510287587~Containers_Dummies~sjvn_Kubernetes
[2]:https://kubernetes.io/
[3]:https://www.redhat.com/en
[4]:https://www.openshift.com/
[5]:https://www.linuxfoundation.org/
[6]:http://events.linuxfoundation.org/events/open-source-summit-north-america
[7]:https://www.opencontainers.org/
[8]:https://www.cncf.io/
[9]:https://insights.hpe.com/articles/the-basics-explaining-kubernetes-mesosphere-and-docker-swarm-1702.html
[10]:https://insights.hpe.com/articles/when-to-use-containers-and-when-not-to-1705.html
[11]:https://www.open-scap.org/
[12]:https://scap.nist.gov/
[13]:https://developers.redhat.com/blog/2016/05/02/introducing-atomic-scan-container-vulnerability-detection/
[14]:http://cri-o.io/
[15]:http://blog.kubernetes.io/2016/12/container-runtime-interface-cri-in-kubernetes.html
[16]:https://wiki.centos.org/HowTos/SELinux
[17]:https://docs.docker.com/engine/
[18]:https://kubernetes.io/docs/admin/kubelet/
[19]:http://www.zdnet.com/article/containers-consolidation-open-container-initiative-1-0-released/
[20]:https://coreos.com/rkt/docs/latest/
[21]:http://blog.kubernetes.io/2016/12/container-runtime-interface-cri-in-kubernetes.html
[22]:https://coreos.com/rkt/
[23]:http://chris.collins.is/2017/02/24/three-docker-build-strategies/
[24]:https://docs.docker.com/engine/userguide/eng-image/multistage-build/#use-multi-stage-builds
[25]:https://github.com/projectatomic/buildah
[26]:https://www.projectatomic.io/blog/2017/06/introducing-buildah/
[27]:https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
