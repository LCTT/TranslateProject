LinuxBars 翻译中
8 best practices for building containerized applications
====

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/containers_2015-2-osdc-lead.png?itok=0yid3gFY)

Containers are a major trend in deploying applications in both public and private clouds. But what exactly are containers, why have they become a popular deployment mechanism, and how will you need to modify your application to optimize it for a containerized environment?

### What are containers?

The technology behind containers has a long history beginning with SELinux in 2000 and Solaris zones in 2005. Today, containers are a combination of several kernel features including SELinux, Linux namespaces, and control groups, providing isolation of end user processes, networking, and filesystem space.

### Why are they so popular?

The recent widespread adoption of containers is largely due to the development of standards aimed at making them easier to use, such as the Docker image format and distribution model. This standard calls for immutable images, which are the launching point for a container runtime. Immutable images guarantee that the same image the development team releases is what gets tested and deployed into the production environment.

The lightweight isolation that containers provide creates a better abstraction for an application component. Components running in containers won't interfere with each other the way they might running directly on a virtual machine. They can be prevented from starving each other of system resources, and unless they are sharing a persistent volume won't block attempting to write to the same files. Containers have helped to standardize practices like logging and metric collection, and they allow for increased multi-tenant density on physical and virtual machines, all of which leads to lower deployment costs.

### How do you build a container-ready application?

Changing your application to run inside of a container isn't necessarily a requirement. The major Linux distributions have base images that can run anything that runs on a virtual machine. But the general trend in containerized applications is following a few best practices:

- 1. Instances are disposable

Any given instance of your application shouldn't need to be carefully kept running. If one system running a bunch of containers goes down, you want to be able to spin up new containers spread out across other available systems.

- 2. Retry instead of crashing

When one service in your application depends on another service, it should not crash when the other service is unreachable. For example, your API service is starting up and detects the database is unreachable. Instead of failing and refusing to start, you design it to retry the connection. While the database connection is down the API can respond with a 503 status code, telling the clients that the service is currently unavailable. This practice should already be followed by applications, but if you are working in a containerized environment where instances are disposable, then the need for it becomes more obvious.

- 3. Persistent data is special

Containers are launched based on shared images using a copy-on-write (COW) filesystem. If the processes the container is running choose to write out to files, then those writes will only exist as long as the container exists. When the container is deleted, that layer in the COW filesystem is deleted. Giving a container a mounted filesystem path that will persist beyond the life of the container requires extra configuration, and extra cost for the physical storage. Clearly defining the abstraction for what storage is persisted promotes the idea that instances are disposable. Having the abstraction layer also allows a container orchestration engine to handle the intricacies of mounting and unmounting persistent volumes to the containers that need them.

- 4. Use stdout not log files

You may now be thinking, if persistent data is special, then what do I do with log files? The approach the container runtime and orchestration projects have taken is that processes should instead [write to stdout/stderr][1], and have infrastructure for archiving and maintaining [container logs][2].

- 5. Secrets (and other configurations) are special too

You should never hard-code secret data like passwords, keys, and certificates into your images. Secrets are typically not the same when your application is talking to a development service, a test service, or a production service. Most developers do not have access to production secrets, so if secrets are baked into the image then a new image layer will have to be created to override the development secrets. At this point, you are no longer using the same image that was created by your development team and tested by quality engineering (QE), and have lost the benefit of immutable images. Instead, these values should be abstracted away into environment variables or files that are injected at container startup.

- 6. Don't assume co-location of services

In an orchestrated container environment you want to allow the orchestrator to send your containers to whatever node is currently the best fit. Best fit could mean a number of things: it could be based on whichever node has the most space right now, the quality of service the container is requesting, whether the container requires persistent volumes, etc. This could easily mean your frontend, API, and database containers all end up on different nodes. While it is possible to force an API container to each node (see [DaemonSets][3] in Kubernetes), this should be reserved for containers that perform tasks like monitoring the nodes themselves.

- 7. Plan for redundancy / high availability

Even if you don't have enough load to require an HA setup, you shouldn't write your service in a way that prevents you from running multiple copies of it. This will allow you to use rolling deployments, which make it easy to move load off one node and onto another, or to upgrade from one version of a service to the next without taking any downtime.

- 8. Implement readiness and liveness checks

It is common for applications to have startup time before they are able to respond to requests, for example, an API server that needs to populate in-memory data caches. Container orchestration engines need a way to check that your container is ready to serve requests. Providing a readiness check for new containers allows a rolling deployment to keep an old container running until it is no longer needed, preventing downtime. Similarly, a liveness check is a way for the orchestration engine to continue to check that the container is in a healthy state. It is up to the application creator to decide what it means for their container to be healthy, or "live". A container that is no longer live will be killed, and a new container created in its place.

### Want to find out more?

I'll be at the Grace Hopper Celebration of Women in Computing in October, come check out my talk: [Containerization of Applications: What, Why, and How][4]. Not headed to GHC this year? Then read on about containers, orchestration, and applications on the [OpenShift][5] and [Kubernetes][6] project sites.

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/9/8-best-practices-building-containerized-applications

作者：[Jessica Forrester ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jwforres
[1]: https://docs.docker.com/engine/reference/commandline/logs/
[2]: http://kubernetes.io/docs/getting-started-guides/logging/
[3]: http://kubernetes.io/docs/admin/daemons/
[4]: https://www.eiseverywhere.com/ehome/index.php?eventid=153076&tabid=351462&cid=1350690&sessionid=11443135&sessionchoice=1&
[5]: https://www.openshift.org/
[6]: http://kubernetes.io/
