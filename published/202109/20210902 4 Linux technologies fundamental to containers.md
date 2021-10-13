[#]: subject: "4 Linux technologies fundamental to containers"
[#]: via: "https://opensource.com/article/21/8/container-linux-technology"
[#]: author: "Nived V https://opensource.com/users/nivedv"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "turbokernel"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13792-1.html"

容器的四大基础技术
======

> 命名空间、控制组、seccomp 和 SELinux 构成了在系统上构建和运行一个容器进程的 Linux 技术基础。

![](https://img.linux.net.cn/data/attachment/album/202109/17/085439ye0iq5ynzyhpusy5.jpg)

在以前的文章中，我介绍过 [容器镜像][2] 及其 [运行时][3]。在本文中，我研究了容器是如何在一些特殊的 Linux 技术基础上实现的，这其中包括命名空间和控制组。

![容器技术的层次][4]

*图1：对容器有贡献的 Linux 技术（Nived Velayudhan, [CC BY-SA 4.0][5]）*

这些 Linux 技术构成了在系统上构建和运行容器进程的基础：

  1. 命名空间
  2. 控制组（cgroups）
  3. Seccomp
  4. SELinux

### 命名空间

<ruby>命名空间<rt>namespace</rt></ruby> 为容器提供了一个隔离层，给容器提供了一个看起来是独占的 Linux 文件系统的视图。这就限制了进程能访问的内容，从而限制了它所能获得的资源。

在创建容器时，Docker 或 Podman 和其他容器技术使用了 Linux 内核中的几个命名空间：

```
[nivedv@homelab ~]$ docker container run alpine ping 8.8.8.8
[nivedv@homelab ~]$ sudo lsns -p 29413

        NS TYPE   NPROCS   PID USER COMMAND
4026531835 cgroup    299     1 root /usr/lib/systemd/systemd --switched...
4026531837 user      278     1 root /usr/lib/systemd/systemd --switched...
4026533105 mnt         1 29413 root ping 8.8.8.8
4026533106 uts         1 29413 root ping 8.8.8.8
4026533107 ipc         1 29413 root ping 8.8.8.8
4026533108 pid         1 29413 root ping 8.8.8.8
4026533110 net         1 29413 root ping 8.8.8.8
```
#### 用户

用户（`user`）命名空间将用户和组隔离在一个容器内。这是通过分配给容器与宿主系统有不同的 UID 和 GID 范围来实现的。用户命名空间使软件能够以 root 用户的身份在容器内运行。如果入侵者攻击容器，然后逃逸到宿主机上，他们就只能以受限的非 root 身份运行了。

#### 挂载

挂载（`mnt`）命名空间允许容器有自己的文件系统层次结构视图。你可以在 Linux 系统中的 `/proc/<PID>/mounts` 位置找到每个容器进程的挂载点。

#### UTS

<ruby>Unix 分时系统<rt>Unix Timeharing System</rt></ruby>（UTS）命名空间允许容器拥有一个唯一主机名和域名。当你运行一个容器时，即使使用 `- name` 标签，也会使用一个随机的 ID 作为主机名。你可以使用 [unshare 命令][6] 来了解一下这个工作原理。

```
nivedv@homelab ~]$ docker container run -it --name nived alpine sh
/ # hostname 
9c9a5edabdd6
/ # 
nivedv@homelab ~]$ sudo unshare -u sh
sh-5.0# hostname isolated.hostname 
sh-5.0# hostname
isolated.hostname
sh-5.0# 
sh-5.0# exit
exit
[nivedv@homelab ~]$ hostname
homelab.redhat.com
```

#### IPC

<ruby>进程间通信<rt>Inter-Process Communication</rt></ruby>（IPC）命名空间允许不同的容器进程之间，通过访问共享内存或使用共享消息队列来进行通信。

```
[root@demo /]# ipcmk -M 10M
Shared memory id: 0
[root@demo /]# ipcmk -M 20M
Shared memory id: 1
[root@demo /]# 
[root@demo /]# ipcs
------ Message Queues --------
key        msqid      owner      perms      used-bytes   messages    
------ Shared Memory Segments --------
key        shmid      owner      perms      bytes      nattch     status      
0xd1df416a 0          root       644        10485760   0                       
0xbd487a9d 1          root       644        20971520   0                       
------ Semaphore Arrays --------
key        semid      owner      perms      nsems
```

#### PID

<ruby>进程 ID<rt>Process ID</rt></ruby>（PID）命名空间确保运行在容器内的进程与外部隔离。当你在容器内运行 `ps` 命令时，由于这个命名空间隔离的存在，你只能看到在容器内运行的进程，而不是在宿主机上。

#### 网络

网络（`net`）命名空间允许容器有自己网络接口、IP 地址、路由表、端口号等视图。容器如何能够与外部通信？你创建的所有容器都会被附加到一个特殊的虚拟网络接口上进行通信。

```
[nivedv@homelab ~]$ docker container run --rm -it alpine sh
/ # ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8): 56 data bytes
64 bytes from 8.8.8.8: seq=0 ttl=119 time=21.643 ms
64 bytes from 8.8.8.8: seq=1 ttl=119 time=20.940 ms
^C
[root@homelab ~]# ip link show veth84ea6fc
veth84ea6fc@if22: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue 
master docker0 state UP mode DEFAULT group default
```

### 控制组

控制组（`cgroup`）是组成一个容器的基本模块。控制组会分配和限制容器所使用的资源，如 CPU、内存、网络 I/O 等。容器引擎会自动创建每种类型的控制组文件系统，并在容器运行时为每个容器设置配额。

```
[root@homelab ~]# lscgroup | grep docker
cpuset:/docker
net_cls,net_prio:/docker
cpu,cpuacct:/docker
hugetlb:/docker
devices:/docker
freezer:/docker
memory:/docker
perf_event:/docker
blkio:/docker
pids:/docker
```

容器运行时为每个容器设置了控制组值，所有信息都存储在 `/sys/fs/cgroup/*/docker`。下面的命令将确保容器可以使用 50000 微秒的 CPU 时间片，并将内存的软、硬限制分别设置为 500M 和 1G。

```
[root@homelab ~]# docker container run -d --name test-cgroups --cpus 0.5 --memory 1G --memory-reservation 500M httpd
[root@homelab ~]# lscgroup cpu,cpuacct:/docker memory:/docker
cpu,cpuacct:/docker/
cpu,cpuacct:/docker/c3503ac704dafea3522d3bb82c77faff840018e857a2a7f669065f05c8b2cc84
memory:/docker/
memory:/docker/c3503ac704dafea3522d3bb82c77faff840018e857a2a7f669065f05c8b2cc84
[root@homelab c....c84]# cat cpu.cfs_period_us 
100000
[root@homelab c....c84]# cat cpu.cfs_quota_us 
50000
[root@homelab c....c84]# cat memory.soft_limit_in_bytes 
524288000
[root@homelab c....c84]# cat memory.limit_in_bytes 
1073741824
```

### SECCOMP

Seccomp 意思是“<ruby>安全计算<rt>secure computing</rt></ruby>”。它是一项 Linux 功能，用于限制应用程序进行的系统调用的集合。例如，Docker 的默认 seccomp 配置文件禁用了大约 44 个系统调用（总计超过 300 个）。

这里的思路是让容器只访问所必须的资源。例如，如果你不需要容器改变主机上的时钟时间，你可能不会使用 `clock_adjtime` 和 `clock_settime` 系统调用，屏蔽它们是合理的。同样地，你不希望容器改变内核模块，所以没有必要让它们使用 `create_module`、 `delete_module` 系统调用。

### SELinux

SELinux 是“<ruby>安全增强的 Linux<rt>security-enhanced Linux</rt></ruby>”的缩写。如果你在你的宿主机上运行的是 Red Hat 发行版，那么 SELinux 是默认启用的。SELinux 可以让你限制一个应用程序只能访问它自己的文件，并阻止任何其他进程访问。因此，如果一个应用程序被破坏了，它将限制该应用程序可以影响或控制的文件数量。通过为文件和进程设置上下文环境以及定义策略来实现，这些策略将限制一个进程可以访问和更改的内容。

容器的 SELinux 策略是由 `container-selinux` 包定义的。默认情况下，容器以 `container_t` 标签运行，允许在 `/usr` 目录下读取（`r`）和执行（`x`），并从 `/etc` 目录下读取大部分内容。标签`container_var_lib_t` 是与容器有关的文件的通用标签。

### 总结

容器是当今 IT 基础设施的一个重要组成部分，也是一项相当有趣的技术。即使你的工作不直接涉及容器化，了解一些基本的容器概念和方法，也能让你体会到它们如何帮助你的组织。容器是建立在开源的 Linux 技术之上的，这使它们变得更加美好。

本文基于 [techbeatly][7] 的文章，并经授权改编。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/container-linux-technology

作者：[Nived V][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nivedv
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: https://linux.cn/article-13766-1.html
[3]: https://linux.cn/article-13772-1.html
[4]: https://opensource.com/sites/default/files/1linuxtechs.png (layers of linux technologies)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/article/19/10/namespaces-and-containers-linux
[7]: https://nivedv.medium.com/container-internals-deep-dive-5cc424957413
