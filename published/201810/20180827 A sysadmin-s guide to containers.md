面向系统管理员的容器手册
======
> 你所需了解的容器如何工作的知识。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/toolbox-learn-draw-container-yearbook.png?itok=xDbwz1pP)

现在人们严重过度使用了“容器”这个术语。另外，对不同的人来说，它可能会有不同的含义，这取决于上下文。

传统的 Linux 容器只是系统上普通的进程。一组进程与另外一组进程是相互隔离的，实现方法包括：资源限制（控制组 [cgoups]）、Linux 安全限制（文件权限，基于 Capability 的安全模块、SELinux、AppArmor、seccomp 等）还有名字空间（进程 ID、网络、挂载等）。

如果你启动一台现代 Linux 操作系统，使用 `cat /proc/PID/cgroup` 命令就可以看到该进程是属于一个控制组的。还可以从 `/proc/PID/status` 文件中查看进程的 Capability 信息，从 `/proc/self/attr/current` 文件中查看进程的 SELinux 标签信息，从 `/proc/PID/ns` 目录下的文件查看进程所属的名字空间。因此，如果把容器定义为带有资源限制、Linux 安全限制和名字空间的进程，那么按照这个定义，Linux 操作系统上的每一个进程都在一个容器里。因此我们常说 [Linux 就是容器，容器就是 Linux][1]。而**容器运行时**是这样一种工具，它调整上述资源限制、安全限制和名字空间，并启动容器。

Docker 引入了**容器镜像**的概念，镜像是一个普通的 TAR 包文件，包含了：

* **rootfs（容器的根文件系统）**：一个目录，看起来像是操作系统的普通根目录（`/`），例如，一个包含 `/usr`, `/var`, `/home` 等的目录。
* **JSON 文件（容器的配置）**：定义了如何运行 rootfs；例如，当容器启动的时候要在 rootfs 里运行什么命令（`CMD`）或者入口（`ENTRYPOINT `），给容器定义什么样的环境变量（`ENV`），容器的工作目录（`WORKDIR `）是哪个，以及其他一些设置。

Docker 把 rootfs 和 JSON 配置文件打包成**基础镜像**。你可以在这个基础之上，给 rootfs 安装更多东西，创建新的 JSON 配置文件，然后把相对于原始镜像的不同内容打包到新的镜像。这种方法创建出来的是**分层的镜像**。

<ruby>[开放容器计划][2]<rt>Open Container Initiative</rt></ruby>（OCI）标准组织最终把容器镜像的格式标准化了，也就是 <ruby>[镜像规范][3]<rt>OCI Image Specification</rt></ruby>（OCI）。

用来创建容器镜像的工具被称为**容器镜像构建器**。有时候容器引擎做这件事情，不过可以用一些独立的工具来构建容器镜像。

Docker 把这些容器镜像（**tar 包**）托管到 web 服务中，并开发了一种协议来支持从 web 拉取镜像，这个 web 服务就叫<ruby>容器仓库<rt>container registry</rt></ruby>。

**容器引擎**是能从镜像仓库拉取镜像并装载到**容器存储**上的程序。容器引擎还能启动**容器运行时**（见下图）。

![](https://opensource.com/sites/default/files/linux_container_internals_2.0_-_hosts.png)

容器存储一般是<ruby>写入时复制<rt>copy-on-write</rt></ruby>（COW）的分层文件系统。从容器仓库拉取一个镜像时，其中的 rootfs 首先被解压到磁盘。如果这个镜像是多层的，那么每一层都会被下载到 COW 文件系统的不同分层。 COW 文件系统保证了镜像的每一层独立存储，这最大化了多个分层镜像之间的文件共享程度。容器引擎通常支持多种容器存储类型，包括 `overlay`、`devicemapper`、`btrfs`、`aufs` 和 `zfs`。

容器引擎将容器镜像下载到容器存储中之后，需要创建一份**容器运行时配置**，这份配置是用户/调用者的输入和镜像配置的合并。例如，容器的调用者可能会调整安全设置，添加额外的环境变量或者挂载一些卷到容器中。

容器运行时配置的格式，和解压出来的 rootfs 也都被开放容器计划 OCI 标准组织做了标准化，称为 [OCI 运行时规范][4]。

最终，容器引擎启动了一个**容器运行时**来读取运行时配置，修改 Linux 控制组、安全限制和名字空间，并执行容器命令来创建容器的 **PID 1** 进程。至此，容器引擎已经可以把容器的标准输入/标准输出转给调用方，并控制容器了（例如，`stop`、`start`、`attach`）。

值得一提的是，现在出现了很多新的容器运行时，它们使用 Linux 的不同特性来隔离容器。可以使用 KVM 技术来隔离容器（想想迷你虚拟机），或者使用其他虚拟机监视器策略（例如拦截所有从容器内的进程发起的系统调用）。既然我们有了标准的运行时规范，这些工具都能被相同的容器引擎来启动。即使在 Windows 系统下，也可以使用 OCI 运行时规范来启动 Windows 容器。

容器编排器是一个更高层次的概念。它是在多个不同的节点上协调容器执行的工具。容器编排工具通过和容器引擎的通信来管理容器。编排器控制容器引擎做容器的启动和容器间的网络连接，它能够监控容器，在负载变高的时候进行容器扩容。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/sysadmins-guide-containers

作者：[Daniel J Walsh][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[belitex](https://github.com/belitex)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rhatdan
[1]:https://www.redhat.com/en/blog/containers-are-linux
[2]:https://www.opencontainers.org/
[3]:https://github.com/opencontainers/image-spec/blob/master/spec.md
[4]:https://github.com/opencontainers/runtime-spec
