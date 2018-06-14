底层 Linux 容器运行时之发展史
======

> “容器运行时”是一个被过度使用的名词。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/running-containers-two-ship-container-beach.png?itok=wr4zJC6p)

在 Red Hat，我们乐意这么说，“容器即 Linux，Linux 即容器”。下面解释一下这种说法。传统的容器是操作系统中的进程，通常具有如下 3 个特性：

1. 资源限制
	
	当你在系统中运行多个容器时，你肯定不希望某个容器独占系统资源，所以我们需要使用资源约束来控制 CPU、内存和网络带宽等资源。Linux 内核提供了 cgroup 特性，可以通过配置控制容器进程的资源使用。

2. 安全性配置

	一般而言，你不希望你的容器可以攻击其它容器或甚至攻击宿主机系统。我们使用了 Linux 内核的若干特性建立安全隔离，相关特性包括 SELinux、seccomp 和 capabilities。

	（LCTT 译注：从 2.2 版本内核开始，Linux 将特权从超级用户中分离，产生了一系列可以单独启用或关闭的 capabilities）

3. 虚拟隔离

	容器外的任何进程对于容器而言都应该不可见。容器应该使用独立的网络。不同的容器对应的进程应该都可以绑定 80 端口。每个容器的<ruby>内核映像<rt>image</rt></ruby>、<ruby>根文件系统<rt>rootfs</rt>（rootfs）都应该相互独立。在 Linux 中，我们使用内核的<ruby>名字空间<rt>namespace</rt></ruby>特性提供<ruby>虚拟隔离<rt>virtual separation</rt></ruby>。

那么，具有安全性配置并且在 cgroup 和名字空间下运行的进程都可以称为容器。查看一下 Red Hat Enterprise Linux 7 操作系统中的 PID 1 的进程 systemd，你会发现 systemd 运行在一个 cgroup 下。

```
# tail -1 /proc/1/cgroup
1:name=systemd:/
```

`ps` 命令让我们看到 systemd 进程具有 SELinux 标签：

```
# ps -eZ | grep systemd
system_u:system_r:init_t:s0             1 ?     00:00:48 systemd
```

以及 capabilities：

```
# grep Cap /proc/1/status
...
CapEff: 0000001fffffffff
CapBnd: 0000001fffffffff
CapBnd:    0000003fffffffff
```

最后，查看 `/proc/1/ns` 子目录，你会发现 systemd 运行所在的名字空间。

```
ls -l /proc/1/ns
lrwxrwxrwx. 1 root root 0 Jan 11 11:46 mnt -> mnt:[4026531840]
lrwxrwxrwx. 1 root root 0 Jan 11 11:46 net -> net:[4026532009]
lrwxrwxrwx. 1 root root 0 Jan 11 11:46 pid -> pid:[4026531836]
...
```

如果 PID 1 进程（实际上每个系统进程）具有资源约束、安全性配置和名字空间，那么我可以说系统上的每一个进程都运行在容器中。

容器运行时工具也不过是修改了资源约束、安全性配置和名字空间，然后 Linux 内核运行起进程。容器启动后，容器运行时可以在容器内监控 PID 1 进程，也可以监控容器的标准输入/输出，从而进行容器进程的生命周期管理。

### 容器运行时

你可能自言自语道，“哦，systemd 看起来很像一个容器运行时”。经过若干次关于“为何容器运行时不使用 `systemd-nspawn` 工具来启动容器”的邮件讨论后，我认为值得讨论一下容器运行时及其发展史。

[Docker][1] 通常被称为容器运行时，但“<ruby>容器运行时<rt>container runtime</rt></ruby>”是一个被过度使用的词语。当用户提到“容器运行时”，他们其实提到的是为开发人员提供便利的<ruby>上层<rt>high-level</rt></ruby>工具，包括 Docker，[CRI-O][2] 和 [RKT][3]。这些工具都是基于 API 的，涉及操作包括从容器仓库拉取容器镜像、配置存储和启动容器等。启动容器通常涉及一个特殊工具，用于配置内核如何运行容器，这类工具也被称为“容器运行时”，下文中我将称其为“底层容器运行时”以作区分。像 Docker、CRI-O 这样的守护进程及形如 [Podman][4]、[Buildah][5] 的命令行工具，似乎更应该被称为“容器管理器”。

早期版本的 Docker 使用 `lxc` 工具集启动容器，该工具出现在 `systemd-nspawn` 之前。Red Hat 最初试图将 [libvirt][6] （`libvirt-lxc`）集成到 Docker 中替代 `lxc` 工具，因为 RHEL 并不支持 `lxc`。`libvirt-lxc` 也没有使用 `systemd-nspawn`，在那时 systemd 团队仅将 `systemd-nspawn` 视为测试工具，不适用于生产环境。

与此同时，包括我的 Red Hat 团队部分成员在内的<ruby>上游<rt>upstream</rt></ruby> Docker 开发者，认为应该采用 golang 原生的方式启动容器，而不是调用外部应用。他们的工作促成了 libcontainer 这个 golang 原生库，用于启动容器。Red Hat 工程师更看好该库的发展前景，放弃了 `libvirt-lxc`。

后来成立 <ruby>[开放容器组织][7]<rt>Open Container Initiative</rt></ruby>（OCI）的部分原因就是人们希望用其它方式启动容器。传统的基于名字空间隔离的容器已经家喻户晓，但人们也有<ruby>虚拟机级别隔离<rt>virtual machine-level isolation</rt></ruby>的需求。Intel 和 [Hyper.sh][8] 正致力于开发基于 KVM 隔离的容器，Microsoft 致力于开发基于 Windows 的容器。OCI 希望有一份定义容器的标准规范，因而产生了 [OCI <ruby>运行时规范<rt>Runtime Specification</rt></ruby>][9]。

OCI 运行时规范定义了一个 JSON 文件格式，用于描述要运行的二进制，如何容器化以及容器根文件系统的位置。一些工具用于生成符合标准规范的 JSON 文件，另外的工具用于解析 JSON 文件并在该根文件系统（rootfs）上运行容器。Docker 的部分代码被抽取出来构成了 libcontainer 项目，该项目被贡献给 OCI。上游 Docker 工程师及我们自己的工程师创建了一个新的前端工具，用于解析符合 OCI 运行时规范的 JSON 文件，然后与 libcontainer 交互以便启动容器。这个前端工具就是 [runc][10]，也被贡献给 OCI。虽然 `runc` 可以解析 OCI JSON 文件，但用户需要自行生成这些文件。此后，`runc` 也成为了最流行的底层容器运行时，基本所有的容器管理工具都支持 `runc`，包括 CRI-O、Docker、Buildah、Podman 和 [Cloud Foundry Garden][11] 等。此后，其它工具的实现也参照 OCI 运行时规范，以便可以运行 OCI 兼容的容器。

[Clear Containers][12] 和 Hyper.sh 的 `runV` 工具都是参照 OCI 运行时规范运行基于 KVM 的容器，二者将其各自工作合并到一个名为 [Kata][12] 的新项目中。在去年，Oracle 创建了一个示例版本的 OCI 运行时工具，名为 [RailCar][13]，使用 Rust 语言编写。但该 GitHub 项目已经两个月没有更新了，故无法判断是否仍在开发。几年前，Vincent Batts 试图创建一个名为 [nspawn-oci][14] 的工具，用于解析 OCI 运行时规范文件并启动 `systemd-nspawn`；但似乎没有引起大家的注意，而且也不是原生的实现。

如果有开发者希望实现一个原生的 `systemd-nspawn --oci OCI-SPEC.json` 并让 systemd 团队认可和提供支持，那么CRI-O、Docker 和 Podman 等容器管理工具将可以像使用 `runc` 和 Clear Container/runV （[Kata][15]） 那样使用这个新的底层运行时。（目前我的团队没有人参与这方面的工作。）

总结如下，在 3-4 年前，上游开发者打算编写一个底层的 golang 工具用于启动容器，最终这个工具就是 `runc`。那时开发者有一个使用 C 编写的 `lxc` 工具，在 `runc` 开发后，他们很快转向 `runc`。我很确信，当决定构建 libcontainer 时，他们对 `systemd-nspawn` 或其它非原生（即不使用 golang）的运行 namespaces 隔离的容器的方式都不感兴趣。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/history-low-level-container-runtimes

作者：[Daniel Walsh][a]
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rhatdan
[1]:https://github.com/docker
[2]:https://github.com/kubernetes-incubator/cri-o
[3]:https://github.com/rkt/rkt
[4]:https://github.com/projectatomic/libpod/tree/master/cmd/podman
[5]:https://github.com/projectatomic/buildah
[6]:https://libvirt.org/
[7]:https://www.opencontainers.org/
[8]:https://www.hyper.sh/
[9]:https://github.com/opencontainers/runtime-spec
[10]:https://github.com/opencontainers/runc
[11]:https://github.com/cloudfoundry/garden
[12]:https://clearlinux.org/containers
[13]:https://github.com/oracle/railcar
[14]:https://github.com/vbatts/nspawn-oci
[15]:https://github.com/kata-containers
