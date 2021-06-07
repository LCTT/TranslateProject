[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 reasons to run Kubernetes on your Raspberry Pi homelab)
[#]: via: (https://opensource.com/article/20/8/kubernetes-raspberry-pi)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 reasons to run Kubernetes on your Raspberry Pi homelab
======
A new free eBook offers step-by-step instructions for creating a private
cloud at home, including what you can do with it when you're done.
![Ship captain sailing the Kubernetes seas][1]

There's a saying about the cloud, and it goes something like this: _The cloud is just somebody else's computer._ While the cloud is actually more complex than that (it's _a lot_ of computers), there's a lot of truth to the sentiment. When you move to the cloud, you're moving data and services and computing power to an entity you don't own or fully control. On the one hand, this frees you from having to perform administrative tasks you don't want to do, but, on the other hand, it could mean you no longer control your own computer.

This is why the open source world likes to talk about an [_open hybrid cloud_][2], a model that allows you to choose your own infrastructure, select your own OS, and orchestrate your workloads as you see fit. However, if you don't happen to have an open hybrid cloud available to you, you can create your own—either to help you learn how the cloud works or to serve your local network.

Building your own cloud requires at least three Raspberry Pi units, an Arm Linux distribution to serve as an OS, and Kubernetes to help you manage the containers your cloud will run. Chris Collins explains every step you need to take to make this happen in our new [eBook][3]. If you've ever built an array of distributed computing nodes, you'll probably be surprised at how simple it is. Sooner than you expect, you'll reach the end of the installation, and you'll inevitably be faced with this question:

Now what?

What's the real-world application of a private cloud running on tiny computers in your office? What do you need Kubernetes for, anyway? I used to ask myself the same questions, and I've come up with enough answers to justify a minor investment in a spare Raspberry Pi or two and the time it takes to follow the instructions in Chris' eBook. Here are some ideas for you.

### Network-attached storage for your home

If you're a hobbyist just looking to try out the latest tech, one of the easiest entry points is improving your network. Since the Raspberry Pi was released, I've never been without a home server—even during the times my home was just a rented room in the suburbs. My home networks weren't always very complicated, but they ran a few services that I enjoyed having available, so it suited me.

By following along with Chris' eBook, I've recently added Kubernetes and a few nodes to my network, which give me the ability to add any number of services. I've finally got Network Filesystem (NFS) running, so my partner and I have an easy backup plan and can access shared files as if they existed locally on any computer we're using. I'm also running the open source [Kodi media server][4], so we can watch movies, listen to music, and view photos (all stored on the NFS share) anywhere in the house. A [Nextcloud][5] installation makes collaboration easy, and it also helps us keep in touch with family members in other countries without resorting to the likes of Facebook.

In short, Kubernetes and the many container images available for easy installs have transformed my local network into my own personal internet or supercomputer. It doesn't provide all services for all people, but it provides exactly the services I want for the people who I want to have access.

If you're duplicating media or applications across several devices or building a home server, you should consider a Kubernetes cluster. It's easy to scale for power and storage, it's easy to maintain, and it's a lot of fun.

### Education and upskilling

Are you considering a career in IT? Are you already in IT but want to grow as a professional? The cloud is a powerful model, and Kubernetes is an easy way to wrangle a lot of potential power. The more you learn about these concepts, the better prepared you'll be to move up in your career.

One of the most frustrating aspects of the cloud in its early days was its inaccessibility. If you didn't own racks of servers, it was difficult to gain experience administering and maintaining a cloud infrastructure. Thanks to open source projects like [Kubernetes][6], [OKD][7], [LXC][8], and [Podman][9], building your own cloud has become possible. Thanks to the Raspberry Pi and other Arm-based system-on-a-chip (SoC) computers, it's also affordable.

### Web server

The internet is one of the most accessible entry points into modern technology. Since the '90s, regular folk have wandered into the strange world of computing by reading HTML in a desperate attempt to understand how to put an animated GIF onto a Myspace or Geocities page. A natural progression from rudimentary HTML and CSS is to run a web server. Admittedly, a Kubernetes cluster probably is overkill for a personal site, but it's a great project to become familiar with how Kubernetes pods work and why they're important. It's also a great way to learn about [routing][10] and load balancing.

### Containers

Linux containers have changed IT and computing as a whole. The original [LXC][11] toolset enabled and inspired hugely popular technologies like Docker, Flatpak, Kubernetes, Podman, and more. Containerization is a new model of running code that's showing up on operating systems for desktops and mobile devices.

The problem is, containers are _different_ from what most users are accustomed to. Traditionally, binaries were compiled according to the operating systems, they were linked to locally available libraries, and they generally had access to everything on the hard drive. [Containers are different][12]. They're miniature runtime environments with binaries run within them, linked to other libraries in the container, and it's all kept separate from the host system unless it's granted a specific exemption. Furthermore, a container is ephemeral. You can create a container and dispose of it arbitrarily. Running a service in a container is a great way to learn how data can be persistent in an environment designed to end and respawn at any moment.

As painful as that learning curve can be, discovering how easy containerized apps are to install opens a whole new world of possibilities. You can run the [Grafana][13] dashboard, the [Prometheus][14] monitoring software, Discourse, Nextcloud, and a dozen others from prebuilt container definitions or [Helm charts][15].

### Web development

If you're a developer delivering apps for the web, [Kubernetes offers many benefits][16]. It can transform your workflow, and most importantly, it can help make your apps resilient. When you're developing for the cloud, you leverage [the best principles of microservices][17] in the context of containers, and you're able to use the advantages of distributed computing, filesystems, and databases.

### Try Kubernetes yourself

If you've learned [the basics][18] of Kubernetes, now's the time to take your knowledge a step further with your very own private cloud. Download our [**free eBook**][3] and start using Kubernetes today. You never know where it will take you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/kubernetes-raspberry-pi

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://www.redhat.com/en/topics/cloud-computing/what-is-hybrid-cloud
[3]: https://opensource.com/downloads/kubernetes-raspberry-pi
[4]: http://kodi.tv
[5]: https://opensource.com/article/17/5/next-big-challenge-open-source-rich-collaboration-software
[6]: https://kubernetes.io
[7]: https://www.okd.io
[8]: https://linuxcontainers.org/lxc/getting-started
[9]: http://podman.io
[10]: https://opensource.com/article/20/3/kubernetes-traefik
[11]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[12]: https://opensource.com/article/19/6/kubernetes-potential-run-anything
[13]: https://opensource.com/article/19/2/deploy-influxdb-grafana-kubernetes
[14]: https://opensource.com/article/19/11/introduction-monitoring-prometheus
[15]: https://opensource.com/article/20/5/helm-charts
[16]: https://opensource.com/article/19/10/kubernetes-complex-business-problem
[17]: https://opensource.com/article/19/11/microservices-cheat-sheet
[18]: https://opensource.com/article/19/6/kubernetes-basics
