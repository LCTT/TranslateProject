A tour of containerd 1.0
======
XiaochenCui translating

![containerd][1]

We have done a few talks in the past on different features of containerd, how it was designed, and some of the problems that we have fixed along the way. Containerd is used by Docker, Kubernetes CRI, and a few other projects but this is a post for people who may not know what containerd actually does within these platforms.  I would like to do more posts on the feature set and design of containerd in the future but for now, we will start with the basics.

I think the container ecosystem can be confusing at times. Especially with the terminology that we use. Whats this? A runtime. And this? A runtime… containerd (pronounced " _container-dee "_) as the name implies, not contain nerd as some would like to troll me with, is a container daemon.  It was originally built as an integration point for OCI runtimes like runc but over the past six months it has added a lot of functionality to bring it up to par with the needs of modern container platforms like Docker and orchestration systems like Kubernetes.

So what do you actually get using containerd?  You get push and pull functionality as well as image management.  You get container lifecycle APIs to create, execute, and manage containers and their tasks. An entire API dedicated to snapshot management and an openly governed project to depend on.  Basically everything that you need to build a container platform without having to deal with the underlying OS details.  I think the most important part of containerd is having a versioned and stable API that will have bug fixes and security patches backported.

![containerd][2]

Since there is no such thing as Linux containers in the kernel, containers are various kernel features tied together, when you are building a large platform or distributed system you want an abstraction layer between your management code and the syscalls and duct tape of features to run a container.  That is where containerd lives.  It provides a client a layer of stable types that platforms can build on top of without ever having to drop down to the kernel level.  It's so much nicer to work with Container, Task, and Snapshot types than it is to manage calls to clone() or mount(). Balanced with the flexibility to directly interact with the runtime or host-machine, these objects avoid the sacrifice of capabilities that typically come with higher-level abstractions. The result is that easy tasks are simple to complete and hard tasks are possible.

![containerd][3]Containerd was designed to be used by Docker and Kubernetes as well as any other container system that wants to abstract away syscalls or OS specific functionality to run containers on Linux, Windows, Solaris, or other Operating Systems.  With these users in mind, we wanted to make sure that containerd has only what they need and nothing that they don't.  Realistically this is impossible but at least that is what we try for.  While networking is out of scope for containerd, what it doesn't do lets higher level systems have full control.  The reason for this is, when you are building a distributed system, networking is a very central aspect.  With SDN and service discovery today, networking is way more platform specific than abstracting away netlink calls on linux.  Most of the new overlay networks are route based and require routing tables to be updated each time a new container is created or deleted.  Service discovery, DNS, etc all have to be notified of these changes as well.  It would be a large chunk of code to be able to support all the different network interfaces, hooks, and integration points to support this if we added networking to containerd.  What we did instead is opted for a robust events system inside containerd so that multiple consumers can subscribe to the events that they care about.  We also expose a [Task API ][4]that lets users create a running task, have the ability to add interfaces to the network namespace of the container, and then start the container's process without the need for complex hooks in various points of a container's lifecycle.

Another area that has been added to containerd over the past few months is a complete storage and distribution system that supports both OCI and Docker image formats.  You have a complete content addressed storage system across the containerd API that works not only for images but also metadata, checkpoints, and arbitrary data attached to containers.

We also took the time to [rethink how "graphdrivers" work][5].  These are the overlay or block level filesystems that allow images to have layers and you to perform efficient builds.  Graphdrivers were initially written by Solomon and I when we added support for devicemapper.  Docker only supported AUFS at the time so we modeled the graphdrivers after the overlay filesystem.  However, making a block level filesystem such as devicemapper/lvm act like an overlay filesystem proved to be much harder to do in the long run.  The interfaces had to expand over time to support different features than what we originally thought would be needed.  With containerd, we took a different approach, make overlay filesystems act like a snapshotter instead of vice versa.  This was much easier to do as overlay filesystems provide much more flexibility than snapshotting filesystems like BTRFS, ZFS, and devicemapper as they don't have a strict parent/child relationship.  This helped us build out [a smaller interface for the snapshotters][6] while still fulfilling the requirements needed from things [like a builder][7] as well as reduce the amount of code needed, making it much easier to maintain in the long run.

![][8]

You can find more details about the architecture of containerd in [Stephen Day's Dec 7th 2017 KubeCon SIG Node presentation][9].

In addition to the technical and design changes in the 1.0 codebase, we also switched the containerd [governance model from the long standing BDFL to a Technical Steering Committee][10] giving the community an independent third party resource to rely on.


--------------------------------------------------------------------------------

via: https://blog.docker.com/2017/12/containerd-ga-features-2/

作者：[Michael Crosby][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/michael/
[1]:https://i0.wp.com/blog.docker.com/wp-content/uploads/950cf948-7c08-4df6-afd9-cc9bc417cabe-6.jpg?resize=400%2C120&ssl=1
[2]:https://i1.wp.com/blog.docker.com/wp-content/uploads/4a7666e4-ebdb-4a40-b61a-26ac7c3f663e-4.jpg?resize=906%2C470&ssl=1 (containerd)
[3]:https://i1.wp.com/blog.docker.com/wp-content/uploads/2a73a4d8-cd40-4187-851f-6104ae3c12ba-1.jpg?resize=1140%2C680&ssl=1
[4]:https://github.com/containerd/containerd/blob/master/api/services/tasks/v1/tasks.proto
[5]:https://blog.mobyproject.org/where-are-containerds-graph-drivers-145fc9b7255
[6]:https://github.com/containerd/containerd/blob/master/api/services/snapshots/v1/snapshots.proto
[7]:https://blog.mobyproject.org/introducing-buildkit-17e056cc5317
[8]:https://i1.wp.com/blog.docker.com/wp-content/uploads/d0fb5eb9-c561-415d-8d57-e74442a879a2-1.jpg?resize=1140%2C556&ssl=1
[9]:https://speakerdeck.com/stevvooe/whats-happening-with-containerd-and-the-cri
[10]:https://github.com/containerd/containerd/pull/1748
