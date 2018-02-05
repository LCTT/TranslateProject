ANNOUNCING THE GENERAL AVAILABILITY OF CONTAINERD 1.0, THE INDUSTRY-STANDARD RUNTIME USED BY MILLIONS OF USERS
============================================================

Today, we’re pleased to announce that containerd (pronounced Con-Tay-Ner-D), an industry-standard runtime for building container solutions, has reached its 1.0 milestone. containerd has already been deployed in millions of systems in production today, making it the most widely adopted runtime and an essential upstream component of the Docker platform.

Built to address the needs of modern container platforms like Docker and orchestration systems like Kubernetes, containerd ensures users have a consistent dev to ops experience. From [Docker’s initial announcement][22] last year that it was spinning out its core runtime to [its donation to the CNCF][23] in March 2017, the containerd project has experienced significant growth and progress over the past 12 months. .

Within both the Docker and Kubernetes communities, there has been a significant uptick in contributions from independents and CNCF member companies alike including Docker, Google, NTT, IBM, Microsoft, AWS, ZTE, Huawei and ZJU. Similarly, the maintainers have been working to add key functionality to containerd.The initial containerd donation provided everything users need to ensure a seamless container experience including methods for:

*   transferring container images,

*   container execution and supervision,

*   low-level local storage and network interfaces and

*   the ability to work on both Linux, Windows and other platforms. 

Additional work has been done to add even more powerful capabilities to containerd including a:

*   Complete storage and distribution system that supports both OCI and Docker image formats and

*   Robust events system

*   More sophisticated snapshot model to manage container filesystems

These changes helped the team build out a smaller interface for the snapshotters, while still fulfilling the requirements needed from things like a builder. It also reduces the amount of code needed, making it much easier to maintain in the long run.

The containerd 1.0 milestone comes after several months testing both the alpha and version versions, which enabled the  team to implement many performance improvements. Some of these,improvements include the creation of a stress testing system, improvements in garbage collection and shim memory usage.

“In 2017 key functionality has been added containerd to address the needs of modern container platforms like Docker and orchestration systems like Kubernetes,” said Michael Crosby, Maintainer for containerd and engineer at Docker. “Since our announcement in December, we have been progressing the design of the project with the goal of making it easily embeddable in higher level systems to provide core container capabilities. We will continue to work with the community to create a runtime that’s lightweight yet powerful, balancing new functionality with the desire for code that is easy to support and maintain.”

containerd is already being used by Kubernetes for its[ cri-containerd project][24], which enables users to run Kubernetes clusters using containerd as the underlying runtime. containerd is also an essential upstream component of the Docker platform and is currently used by millions of end users. There is also strong alignment with other CNCF projects: containerd exposes an API using [gRPC][25] and exposes metrics in the [Prometheus][26] format. containerd also fully leverages the Open Container Initiative (OCI) runtime, image format specifications and OCI reference implementation ([runC][27]), and will pursue OCI certification when it is available.

Key Milestones in the progress to 1.0 include:

![containerd 1.0](https://i2.wp.com/blog.docker.com/wp-content/uploads/4f8d8c4a-6233-4d96-a0a2-77ed345bf42b-5.jpg?resize=720%2C405&ssl=1)

Notable containerd facts and figures:

*   1994 GitHub stars, 401 forks

*   108 contributors

*   8 maintainers from independents and and member companies alike including Docker, Google, IBM, ZTE and ZJU .

*   3030+ commits, 26 releases

Availability and Resources

To participate in containerd: [github.com/containerd/containerd][28]

*   Getting Started with containerd: [http://mobyproject.org/blog/2017/08/15/containerd-getting-started/][8]

*   Roadmap: [https://github.com/containerd/containerd/blob/master/ROADMAP.md][1]

*   Scope table: [https://github.com/containerd/containerd#scope][2]

*   Architecture document: [https://github.com/containerd/containerd/blob/master/design/architecture.md][3]

*   APIs: [https://github.com/containerd/containerd/tree/master/api/][9].

*   Learn more about containerd at KubeCon by attending Justin Cormack’s [LinuxKit & Kubernetes talk at Austin Docker Meetup][10], Patrick Chanezon’s [Moby session][11] [Phil Estes’ session][12] or the [containerd salon][13]

--------------------------------------------------------------------------------

via: https://blog.docker.com/2017/12/cncf-containerd-1-0-ga-announcement/

作者：[Patrick Chanezon ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/chanezon/
[1]:https://github.com/docker/containerd/blob/master/ROADMAP.md
[2]:https://github.com/docker/containerd#scope
[3]:https://github.com/docker/containerd/blob/master/design/architecture.md
[4]:http://www.linkedin.com/shareArticle?mini=true&url=http://dockr.ly/2ArQe3G&title=Announcing%20the%20General%20Availability%20of%20containerd%201.0%2C%20the%20industry-standard%20runtime%20used%20by%20millions%20of%20users&summary=Today,%20we%E2%80%99re%20pleased%20to%20announce%20that%20containerd%20(pronounced%20Con-Tay-Ner-D),%20an%20industry-standard%20runtime%20for%20building%20container%20solutions,%20has%20reached%20its%201.0%20milestone.%20containerd%20has%20already%20been%20deployed%20in%20millions%20of%20systems%20in%20production%20today,%20making%20it%20the%20most%20widely%20adopted%20runtime%20and%20an%20essential%20upstream%20component%20of%20the%20Docker%20platform.%20Built%20...
[5]:http://www.reddit.com/submit?url=http://dockr.ly/2ArQe3G&title=Announcing%20the%20General%20Availability%20of%20containerd%201.0%2C%20the%20industry-standard%20runtime%20used%20by%20millions%20of%20users
[6]:https://plus.google.com/share?url=http://dockr.ly/2ArQe3G
[7]:http://news.ycombinator.com/submitlink?u=http://dockr.ly/2ArQe3G&t=Announcing%20the%20General%20Availability%20of%20containerd%201.0%2C%20the%20industry-standard%20runtime%20used%20by%20millions%20of%20users
[8]:http://mobyproject.org/blog/2017/08/15/containerd-getting-started/
[9]:https://github.com/docker/containerd/tree/master/api/
[10]:https://www.meetup.com/Docker-Austin/events/245536895/
[11]:http://sched.co/CU6G
[12]:https://kccncna17.sched.com/event/CU6g/embedding-the-containerd-runtime-for-fun-and-profit-i-phil-estes-ibm
[13]:https://kccncna17.sched.com/event/Cx9k/containerd-salon-hosted-by-derek-mcgowan-docker-lantao-liu-google
[14]:https://blog.docker.com/author/chanezon/
[15]:https://blog.docker.com/tag/cloud-native-computing-foundation/
[16]:https://blog.docker.com/tag/cncf/
[17]:https://blog.docker.com/tag/container-runtime/
[18]:https://blog.docker.com/tag/containerd/
[19]:https://blog.docker.com/tag/cri-containerd/
[20]:https://blog.docker.com/tag/grpc/
[21]:https://blog.docker.com/tag/kubernetes/
[22]:https://blog.docker.com/2016/12/introducing-containerd/
[23]:https://blog.docker.com/2017/03/docker-donates-containerd-to-cncf/
[24]:http://blog.kubernetes.io/2017/11/containerd-container-runtime-options-kubernetes.html
[25]:http://www.grpc.io/
[26]:https://prometheus.io/
[27]:https://github.com/opencontainers/runc
[28]:http://github.com/containerd/containerd
