[#]: subject: "A guide to container orchestration with Kubernetes"
[#]: via: "https://opensource.com/article/22/6/container-orchestration-kubernetes"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A guide to container orchestration with Kubernetes
======
To learn all about container orchestration with Kubernetes, download our new eBook.

![CC-BY-SA William Kenlon  http://www.williamkenlon.com][1]

Image by: William Kenlon. CC BY-SA 4.0

The term orchestration is relatively new to the IT industry, and it still has nuance that eludes or confuses people who don't spend all day orchestrating. When I describe orchestration to someone, it usually sounds like I'm just describing automation. That's not quite right. In fact, I wrote a whole article differentiating [automation and orchestration][2].

An easy way to think about it is that orchestration is just a form of automation. To understand how you can benefit from orchestration, it helps to understand what specifically it automates.

### Understanding containers

A container is an image of a file system containing only what's required to run a specific task. Most people don't build containers from scratch, although reading about [how it's done][3] can be elucidating. Instead, it's more common to pull an existing image from a public container hub.

A container engine is an application that runs a container. When a container is run, it's launched with a kernel mechanism called a `cgroup`, which keeps processes within the container separate from processes running outside the container.

### Run a container

You can run a container on your own Linux computer easily with [Podman][4], [Docker][5], or [LXC][6]. They all use similar commands. I recommend Podman, as it's daemonless, meaning a process doesn't have to be running all the time for a container to launch. With Podman, your container engine runs only when necessary. Assuming you have a container engine installed, you can run a container just by referring to a container image you know to exist on a public container hub.

For instance, to run an Nginx web server:

```
$ podman run -p 8080:80 nginx
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
[...]
```

Open a separate terminal to test it using [curl][7]:

```
$ curl --no-progress-meter localhost:8080 | html2text
# Welcome to nginx!

If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.

For online documentation and support please refer to
[nginx.org](http://nginx.org/).  
Commercial support is available at [nginx.com](http://nginx.com/).

_Thank you for using nginx._
```

As web server installs go, that's pretty easy.

Now imagine that the website you've just deployed gets an unexpected spike in traffic. You hadn't planned for that, and even though Nginx is a very resilient web server, everything has its limits. With enough simultaneous traffic, even Nginx can crash. Now what?

### Sustaining containers

Containers are cheap. In other words, as you've just experienced, they're trivial to launch.

You can use systemd to make a container resilient, too, so that a container automatically relaunches even in the event of a crash. This is where using Podman comes in handy. Podman has a command to generate a systemd service file based on an existing container:

```
$ podman create --name mynginx -p 8080:80 nginx
$ podman generate systemd mynginx \
--restart-policy=always -t 5 -f -n
```

You can launch your container service as a regular user:

```
$ mkdir -p ~/.config/systemd/user
$ mv ./container-mynginx.service ~/.config/systemd/user/
$ systemctl enable --now --user container-mynginx.service
$ curl --head localhost:8080 | head -n1
HTTP/1.1 200 OK
```

### Run pods of containers

Because containers are cheap, you can readily launch more than one container to meet the demand for your service. With two (or more) containers offering the same service, you increase the likelihood that better distribution of labor will successfully manage incoming requests.

You can group containers together in pods, which Podman (as its name suggests) can create:

```
$ systemctl stop --user container-myngnix
$ podman run -dt --pod new:mypod -p 8080:80 nginx
$ podman pod ps
POD ID     NAME   STATUS  CREATED  INFRA ID  # OF CONTAINERS
26424cc... mypod  Running 22m ago  e25b3...   2
```

This can also be automated using systemd:

```
$ podman generate systemd mypod \
--restart-policy=always -t 5 -f -n
```

### Clusters of pods and containers

It's probably clear that containers offer diverse options for how you deploy networked applications and services, especially when you use the right tools to manage them. Both Podman and systemd integrate with containers very effectively, and they can help ensure that your containers are available when they're needed.

But you don't really want to sit in front of your servers all day and all night just so you can manually add containers to pods any time the whole internet decides to pay you a visit. Even if you could do that, containers are only as robust as the computer they run on. Eventually, containers running on a single server do exhaust that server's bandwidth and memory.

The solution is a Kubernetes cluster: lots of servers, with one acting as a "control plane" where all configuration is entered and many, many others acting as compute nodes to ensure your containers have all the resources they need. Kubernetes is a big project, and there are many other projects, like [Terraform][8], [Helm][9], and [Ansible][10], that interface with Kubernetes to make common tasks scriptable and easy. It's an important topic for all levels of systems administrators, architects, and developers.

To learn all about container orchestration with Kubernetes, download our free eBook: **[A guide to orchestration with Kubernetes][11]**. The guide teaches you how to set up a local virtual cluster, deploy an application, set up a graphical interface, understand the YAML files used to configure Kubernetes, and more.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/container-orchestration-kubernetes

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/kenlon-music-conducting-orchestra.png
[2]: https://opensource.com/article/20/11/orchestration-vs-automation
[3]: https://opensource.com/article/22/2/build-your-own-container-linux-buildah
[4]: https://opensource.com/article/18/12/podman-and-user-namespaces
[5]: https://opensource.com/business/14/8/docker-beginner-guide
[6]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[7]: https://opensource.com/article/20/5/curl-cheat-sheet
[8]: https://opensource.com/article/20/7/terraform-kubernetes
[9]: https://opensource.com/article/20/3/helm-kubernetes-charts
[10]: https://opensource.com/article/22/1/learn-ansible
[11]: https://opensource.com/downloads/guide-orchestration-kubernetes
