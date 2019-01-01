使用 Podman 以非 root 用户身份运行 Linux 容器
======

![](https://fedoramagazine.org/wp-content/uploads/2018/10/podman-816x345.jpg)

Linux 容器是由 Linux 内核所提供的具有特定隔离功能的进程 —— 包括文件系统、进程和网络的隔离。容器有助于实现可移植性 —— 应用可以在容器镜像中与其依赖项一起分发，并可在几乎任何有容器运行时环境的 Linux 系统上运行。

虽然容器技术存在了很长时间，但 Linux 容器是由 Docker 而得到了广泛推广。 “Docker” 这个词可以指几个不同的东西，包括容器技术和工具，周围的社区，或者 Docker Inc. 公司。但是，在本文中，我将用来指管理 Linux 容器的技术和工具。

### 什么是 Docker

[Docker][1] 是一个以 root 身份在你的系统上运行的守护程序，它利用 Linux 内核的功能来管理正在运行的容器。除了运行容器之外，它还可以轻松管理容器镜像 —— 与容器注册库交互、存储映像、管理容器版本等。它基本上支持运行单个容器所需的所有操作。

但即使 Docker 是管理 Linux 容器的一个非常方便的工具，它也有两个缺点：它是一个需要在你的系统上运行的守护进程，并且需要以 root 权限运行，这可能有一定的安全隐患。然而，Podman 在解决这两个问题。

### Podman 介绍

[Podman][2] 是一个容器运行时环境，提供与 Docker 非常相似的功能。正如已经提示的那样，它不需要在你的系统上运行任何守护进程，并且它也可以在没有 root 权限的情况下运行。让我们看看使用 Podman 运行 Linux 容器的一些示例。

#### 使用 Podman 运行容器

其中一个最简单的例子可能是运行 Fedora 容器，在命令行中打印 “Hello world!”：

```
$ podman run --rm -it fedora:28 echo "Hello world!"
```

使用通用 Dockerfile 构建镜像的方式与 Docker 相同：

```
$ cat Dockerfile
FROM fedora:28
RUN dnf -y install cowsay

$ podman build . -t hello-world
... output omitted ...

$ podman run --rm -it hello-world cowsay "Hello!"
```

为了构建容器，Podman 在后台调用另一个名为 Buildah 的工具。你可以阅读最近一篇[关于使用 Buildah 构建容器镜像的文章][3] —— 它不仅仅是使用典型的 Dockerfile。

除了构建和运行容器外，Podman 还可以与容器托管进行交互。要登录容器注册库，例如广泛使用的 Docker Hub，请运行：

```
$ podman login docker.io
```

为了推送我刚刚构建的镜像，我只需打上标记来代表特定的容器注册库，然后直接推送它。

```
$ podman -t hello-world docker.io/asamalik/hello-world
$ podman push docker.io/asamalik/hello-world
```

顺便说一下，你是否注意到我如何以非 root 用户身份运行所有内容？此外，我的系统上没有运行又大又重的守护进程！

#### 安装 Podman

Podman 默认在 [Silverblue][4] 上提供 —— 一个基于容器的工作流的新一代 Linux 工作站。要在任何 Fedora 版本上安装它，只需运行：

```
$ sudo dnf install podman
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/running-containers-with-podman/

作者：[Adam Šamalík][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/asamalik/
[b]: https://github.com/lujun9972
[1]: https://docs.docker.com/
[2]: https://podman.io/
[3]: https://fedoramagazine.org/daemon-less-container-management-buildah/
[4]: https://silverblue.fedoraproject.org/
