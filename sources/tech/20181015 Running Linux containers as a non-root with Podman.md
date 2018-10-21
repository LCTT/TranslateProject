translating---geekpi

Running Linux containers as a non-root with Podman
======

![](https://fedoramagazine.org/wp-content/uploads/2018/10/podman-816x345.jpg)

Linux containers are processes with certain isolation features provided by a Linux kernel — including filesystem, process, and network isolation. Containers help with portability — applications can be distributed in container images along with their dependencies, and run on virtually any Linux system with a container runtime.

Although container technologies exist for a very long time, Linux containers were widely popularized by Docker. The word “Docker” can refer to several different things, including the container technology and tooling, the community around that, or the Docker Inc. company. However, in this article, I’ll be using it to refer to the technology and the tooling that manages Linux containers.

### What is Docker

[Docker][1] is a daemon that runs on your system as root, and manages running containers by leveraging features of the Linux kernel. Apart from running containers, it also makes it easy to manage container images — interacting with container registries, storing images, managing container versions, etc. It basically supports all the operations you need to run individual containers.

But even though Docker is very a handy tool for managing Linux containers, it has two drawbacks: it is a daemon that needs to run on your system, and it needs to run with root privileges which might have certain security implications. Both of those, however, are being addressed by Podman.

### Introducing Podman

[Podman][2] is a container runtime providing a very similar features as Docker. And as already hinted, it doesn’t require any daemon to run on your system, and it can also run without root privileges. So let’s have a look at some examples of using Podman to run Linux containers.

#### Running containers with Podman

One of the simplest examples could be running a Fedora container, printing “Hello world!” in the command line:

```
    $ podman run --rm -it fedora:28 echo "Hello world!"
```

Building an image using the common Dockerfile works the same way as it does with Docker:

```
    $ cat Dockerfile
    FROM fedora:28
    RUN dnf -y install cowsay

    $ podman build . -t hello-world
    ... output omitted ...

    $ podman run --rm -it hello-world cowsay "Hello!"
```

To build containers, Podman calls another tool called Buildah in the background. You can read a recent [post about building container images with Buildah][3] — not just using the typical Dockerfile.

Apart from building and running containers, Podman can also interact with container registries. To log in to a container registry, for example the widely used Docker Hub, run:

```
    $ podman login docker.io
```

To push the image I just built, I just need to tag so it refers to the specific container registry and my personal namespace, and then simply push it.

```
    $ podman -t hello-world docker.io/asamalik/hello-world
    $ podman push docker.io/asamalik/hello-world
```

By the way, have you noticed how I run everything as a non-root user? Also, there is no big fat daemon running on my system!

#### Installing Podman

Podman is available by default on [Silverblue][4] — a new generation of Linux Workstation for container-based workflows. To install it on any Fedora release, simply run:

```
    $ sudo dnf install podman
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/running-containers-with-podman/

作者：[Adam Šamalík][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/asamalik/
[b]: https://github.com/lujun9972
[1]: https://docs.docker.com/
[2]: https://podman.io/
[3]: https://fedoramagazine.org/daemon-less-container-management-buildah/
[4]: https://silverblue.fedoraproject.org/
