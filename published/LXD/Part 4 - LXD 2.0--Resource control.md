LXD 2.0 系列（四）：资源控制
======================================

这是 [LXD 2.0 系列介绍文章][0]的第四篇。

因为 LXD 容器管理有很多命令，因此这篇文章会很长。 如果你想要快速地浏览这些相同的命令，你可以[尝试下我们的在线演示][1]！

![](https://linuxcontainers.org/static/img/containers.png)

### 可用资源限制

LXD 提供了各种资源限制。其中一些与容器本身相关，如内存配额、CPU 限制和 I/O 优先级。而另外一些则与特定设备相关，如 I/O 带宽或磁盘用量限制。

与所有 LXD 配置一样，资源限制可以在容器运行时动态更改。某些可能无法启用，例如，如果设置的内存值小于当前内存用量，但 LXD 将会试着设置并且报告失败。

所有的限制也可以通过配置文件继承，在这种情况下每个受影响的容器将受到该限制的约束。也就是说，如果在默认配置文件中设置 `limits.memory=256MB`，则使用默认配置文件（通常是全都使用）的每个容器的内存限制为 256MB。

我们不支持资源限制池，将其中的限制由一组容器共享，因为我们没有什么好的方法通过现有的内核 API 实现这些功能。

#### 磁盘

这或许是最需要和最明显的需求。只需设置容器文件系统的大小限制，并对容器强制执行。

LXD 确实可以让你这样做！

不幸的是，这比它听起来复杂得多。 Linux 没有基于路径的配额，而大多数文件系统只有基于用户和组的配额，这对容器没有什么用处。

如果你正在使用 ZFS 或 btrfs 存储后端，这意味着现在 LXD 只能支持磁盘限制。也有可能为 LVM 实现此功能，但这取决于与它一起使用的文件系统，并且如果结合实时更新那会变得棘手起来，因为并不是所有的文件系统都允许在线增长，而几乎没有一个允许在线收缩。

#### CPU

当涉及到 CPU 的限制，我们支持 4 种不同的东西：

* 只给我 X 个 CPU 核心

  在这种模式下，你让 LXD 为你选择一组核心，然后为更多的容器和 CPU 的上线/下线提供负载均衡。
  
  容器只看到这个数量的 CPU 核心。

* 给我一组特定的 CPU 核心（例如，核心1、3 和 5）

   类似于第一种模式，但是不会做负载均衡，你会被限制在那些核心上，无论它们有多忙。

* 给我你拥有的 20％ 处理能力

  在这种模式下，你可以看到所有的 CPU，但调度程序将限制你使用 20％ 的 CPU 时间，但这只有在负载状态才会这样！所以如果系统不忙，你的容器可以跑得很欢。而当其他的容器也开始使用 CPU 时，它会被限制用量。

* 每测量 200ms，给我 50ms（并且不超过）

  此模式与上一个模式类似，你可以看到所有的 CPU，但这一次，无论系统可能是多么空闲，你只能使用你设置的极限时间下的尽可能多的 CPU 时间。在没有过量使用的系统上，这可使你可以非常整齐地分割 CPU，并确保这些容器的持续性能。

另外还可以将前两个中的一个与最后两个之一相结合，即请求一组 CPU，然后进一步限制这些 CPU 的 CPU 时间。

除此之外，我们还有一个通用的优先级调节方式，可以告诉调度器当你处于负载状态时，两个争夺资源的容器谁会取得胜利。

#### 内存

内存听起来很简单，就是给我多少 MB 的内存！

它绝对可以那么简单。 我们支持这种限制以及基于百分比的请求，比如给我 10％ 的主机内存！

另外我们在上层支持一些额外的东西。 例如，你可以选择在每个容器上打开或者关闭 swap，如果打开，还可以设置优先级，以便你可以选择哪些容器先将内存交换到磁盘！

内存限制默认是“hard”。 也就是说，当内存耗尽时，内核将会开始杀掉你的那些进程。

或者，你可以将强制策略设置为“soft”，在这种情况下，只要没有别的进程的情况下，你将被允许使用尽可能多的内存。一旦别的进程想要这块内存，你将无法分配任何内存，直到你低于你的限制或者主机内存再次有空余。

#### 网络 I/O

网络 I/O 可能是我们看起来最简单的限制，但是相信我，实现真的不简单！

我们支持两种限制。 第一个是对网络接口的速率限制。你可以设置入口和出口的限制，或者只是设置“最大”限制然后应用到出口和入口。这个只支持“桥接”和“p2p”类型接口。

第二种是全局网络 I/O 优先级，仅当你的网络接口趋于饱和的时候再使用。

#### 块 I/O

我把最古怪的放在最后。对于用户看起来它可能简单，但有一些情况下，它的结果并不会和你的预期一样。

我们在这里支持的基本上与我在网络 I/O 中描述的相同。

你可以直接设置磁盘的读写 IO 的频率和速率，并且有一个全局的块 I/O 优先级，它会通知 I/O 调度程序更倾向哪个。

古怪的是如何设置以及在哪里应用这些限制。不幸的是，我们用于实现这些功能的底层使用的是完整的块设备。这意味着我们不能为每个路径设置每个分区的 I/O 限制。

这也意味着当使用可以支持多个块设备映射到指定的路径（带或者不带 RAID）的 ZFS 或 btrfs 时，我们并不知道这个路径是哪个块设备提供的。

这意味着，完全有可能，实际上确实有可能，容器使用的多个磁盘挂载点（绑定挂载或直接挂载）可能来自于同一个物理磁盘。

这就使限制变得很奇怪。为了使限制生效，LXD 具有猜测给定路径所对应块设备的逻辑，这其中包括询问 ZFS 和 btrfs 工具，甚至可以在发现一个文件系统中循环挂载的文件时递归地找出它们。

这个逻辑虽然不完美，但通常会找到一组应该应用限制的块设备。LXD 接着记录并移动到下一个路径。当遍历完所有的路径，然后到了非常奇怪的部分。它会平均你为相应块设备设置的限制，然后应用这些。

这意味着你将在容器中“平均”地获得正确的速度，但这也意味着你不能对来自同一个物理磁盘的“/fast”和一个“/slow”目录应用不同的速度限制。 LXD 允许你设置它，但最后，它会给你这两个值的平均值。

### 它怎么工作？

除了网络限制是通过较旧但是良好的“tc”实现的，上述大多数限制是通过 Linux 内核的 cgroup API 来实现的。

LXD 在启动时会检测你在内核中启用了哪些 cgroup，并且将只应用你的内核支持的限制。如果你缺少一些 cgroup，守护进程会输出警告，接着你的 init 系统将会记录这些。

在 Ubuntu 16.04 上，默认情况下除了内存交换审计外将会启用所有限制，内存交换审计需要你通过`swapaccount = 1`这个内核引导参数来启用。

### 应用这些限制

上述所有限制都能够直接或者用某个配置文件应用于容器。容器范围的限制可以使用：

```
lxc config set CONTAINER KEY VALUE
```

或对于配置文件设置：

```
lxc profile set PROFILE KEY VALUE
```

当指定特定设备时：

```
lxc config device set CONTAINER DEVICE KEY VALUE
```

或对于配置文件设置：

```
lxc profile device set PROFILE DEVICE KEY VALUE
```

有效配置键、设备类型和设备键的完整列表可以[看这里][1]。

#### CPU

要限制使用任意两个 CPU 核心可以这么做：

```
lxc config set my-container limits.cpu 2
```

要指定特定的 CPU 核心，比如说第二和第四个：

```
lxc config set my-container limits.cpu 1,3
```

更加复杂的情况还可以设置范围：

```
lxc config set my-container limits.cpu 0-3,7-11
```

限制实时生效，你可以看下面的例子：

```
stgraber@dakara:~$ lxc exec zerotier -- cat /proc/cpuinfo | grep ^proces
processor : 0
processor : 1
processor : 2
processor : 3
stgraber@dakara:~$ lxc config set zerotier limits.cpu 2
stgraber@dakara:~$ lxc exec zerotier -- cat /proc/cpuinfo | grep ^proces
processor : 0
processor : 1
```

注意，为了避免完全混淆用户空间，lxcfs 会重排 `/proc/cpuinfo` 中的条目，以便没有错误。

就像 LXD 中的一切，这些设置也可以应用在配置文件中：

```
stgraber@dakara:~$ lxc exec snappy -- cat /proc/cpuinfo | grep ^proces
processor : 0
processor : 1
processor : 2
processor : 3
stgraber@dakara:~$ lxc profile set default limits.cpu 3
stgraber@dakara:~$ lxc exec snappy -- cat /proc/cpuinfo | grep ^proces
processor : 0
processor : 1
processor : 2
```

要限制容器使用 10% 的 CPU 时间，要设置下 CPU allowance：

```
lxc config set my-container limits.cpu.allowance 10%
```

或者给它一个固定的 CPU 时间切片：

```
lxc config set my-container limits.cpu.allowance 25ms/200ms
```

最后，要将容器的 CPU 优先级调到最低：

```
lxc config set my-container limits.cpu.priority 0
```

#### 内存

要直接应用内存限制运行下面的命令：

```
lxc config set my-container limits.memory 256MB
```

（支持的后缀是 KB、MB、GB、TB、PB、EB）

要关闭容器的内存交换（默认启用）：

```
lxc config set my-container limits.memory.swap false
```

告诉内核首先交换指定容器的内存：

```
lxc config set my-container limits.memory.swap.priority 0
```

如果你不想要强制的内存限制：

```
lxc config set my-container limits.memory.enforce soft
```

#### 磁盘和块 I/O

不像 CPU 和内存，磁盘和 I/O 限制是直接作用在实际的设备上的，因此你需要编辑原始设备或者屏蔽某个具体的设备。

要设置磁盘限制（需要 btrfs 或者 ZFS）：

```
lxc config device set my-container root size 20GB
```

比如：

```
stgraber@dakara:~$ lxc exec zerotier -- df -h /
Filesystem                        Size Used Avail Use% Mounted on
encrypted/lxd/containers/zerotier 179G 542M  178G   1% /
stgraber@dakara:~$ lxc config device set zerotier root size 20GB
stgraber@dakara:~$ lxc exec zerotier -- df -h /
Filesystem                       Size  Used Avail Use% Mounted on
encrypted/lxd/containers/zerotier 20G  542M   20G   3% /
```

要限制速度，你可以：

```
lxc config device set my-container root limits.read 30MB
lxc config device set my-container root.limits.write 10MB
```

或者限制 IO 频率：

```
lxc config device set my-container root limits.read 20Iops
lxc config device set my-container root limits.write 10Iops
```

最后你在一个过量使用的繁忙系统上，你或许想要：

```
lxc config set my-container limits.disk.priority 10
```

将那个容器的 I/O 优先级调到最高。

#### 网络 I/O

只要机制可用，网络 I/O 基本等同于块 I/O。

比如：

```
stgraber@dakara:~$ lxc exec zerotier -- wget http://speedtest.newark.linode.com/100MB-newark.bin -O /dev/null
--2016-03-26 22:17:34-- http://speedtest.newark.linode.com/100MB-newark.bin
Resolving speedtest.newark.linode.com (speedtest.newark.linode.com)... 50.116.57.237, 2600:3c03::4b
Connecting to speedtest.newark.linode.com (speedtest.newark.linode.com)|50.116.57.237|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 104857600 (100M) [application/octet-stream]
Saving to: '/dev/null'

/dev/null 100%[===================>] 100.00M 58.7MB/s in 1.7s 

2016-03-26 22:17:36 (58.7 MB/s) - '/dev/null' saved [104857600/104857600]

stgraber@dakara:~$ lxc profile device set default eth0 limits.ingress 100Mbit
stgraber@dakara:~$ lxc profile device set default eth0 limits.egress 100Mbit
stgraber@dakara:~$ lxc exec zerotier -- wget http://speedtest.newark.linode.com/100MB-newark.bin -O /dev/null
--2016-03-26 22:17:47-- http://speedtest.newark.linode.com/100MB-newark.bin
Resolving speedtest.newark.linode.com (speedtest.newark.linode.com)... 50.116.57.237, 2600:3c03::4b
Connecting to speedtest.newark.linode.com (speedtest.newark.linode.com)|50.116.57.237|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 104857600 (100M) [application/octet-stream]
Saving to: '/dev/null'

/dev/null 100%[===================>] 100.00M 11.4MB/s in 8.8s 

2016-03-26 22:17:56 (11.4 MB/s) - '/dev/null' saved [104857600/104857600]
```

这就是如何将一个千兆网的连接速度限制到仅仅 100Mbit/s 的！

和块 I/O 一样，你可以设置一个总体的网络优先级：

```
lxc config set my-container limits.network.priority 5
```

### 获取当前资源使用率

[LXD API][2] 可以导出目前容器资源使用情况的一点信息，你可以得到：

* 内存：当前、峰值、目前内存交换和峰值内存交换
* 磁盘：当前磁盘使用率
* 网络：每个接口传输的字节和包数。

另外如果你使用的是非常新的 LXD（在写这篇文章时的 git 版本），你还可以在`lxc info`中得到这些信息：

```
stgraber@dakara:~$ lxc info zerotier
Name: zerotier
Architecture: x86_64
Created: 2016/02/20 20:01 UTC
Status: Running
Type: persistent
Profiles: default
Pid: 29258
Ips:
 eth0: inet 172.17.0.101
 eth0: inet6 2607:f2c0:f00f:2700:216:3eff:feec:65a8
 eth0: inet6 fe80::216:3eff:feec:65a8
 lo: inet 127.0.0.1
 lo: inet6 ::1
 lxcbr0: inet 10.0.3.1
 lxcbr0: inet6 fe80::f0bd:55ff:feee:97a2
 zt0: inet 29.17.181.59
 zt0: inet6 fd80:56c2:e21c:0:199:9379:e711:b3e1
 zt0: inet6 fe80::79:e7ff:fe0d:5123
Resources:
 Processes: 33
 Disk usage:
  root: 808.07MB
 Memory usage:
  Memory (current): 106.79MB
  Memory (peak): 195.51MB
  Swap (current): 124.00kB
  Swap (peak): 124.00kB
 Network usage:
  lxcbr0:
   Bytes received: 0 bytes
   Bytes sent: 570 bytes
   Packets received: 0
   Packets sent: 0
  zt0:
   Bytes received: 1.10MB
   Bytes sent: 806 bytes
   Packets received: 10957
   Packets sent: 10957
  eth0:
   Bytes received: 99.35MB
   Bytes sent: 5.88MB
   Packets received: 64481
   Packets sent: 64481
  lo:
   Bytes received: 9.57kB
   Bytes sent: 9.57kB
   Packets received: 81
   Packets sent: 81
Snapshots:
 zerotier/blah (taken at 2016/03/08 23:55 UTC) (stateless)
```
 
### 总结

LXD 团队花费了几个月的时间来迭代我们使用的这些限制的语言。 它是为了在保持强大和功能明确的基础上同时保持简单。

实时地应用这些限制和通过配置文件继承，使其成为一种非常强大的工具，可以在不影响正在运行的服务的情况下实时管理服务器上的负载。

### 更多信息

LXD 的主站在: <https://linuxcontainers.org/lxd>

LXD 的 GitHub 仓库: <https://github.com/lxc/lxd>

LXD 的邮件列表: <https://lists.linuxcontainers.org>

LXD 的 IRC 频道: #lxcontainers on irc.freenode.net

如果你不想在你的机器上安装LXD，你可以[在线尝试下][3]。


--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/03/26/lxd-2-0-resource-control-412/

作者：[Stéphane Graber][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://github.com/lxc/lxd/blob/master/doc/configuration.md
[2]: https://github.com/lxc/lxd/blob/master/doc/rest-api.md
[3]: https://linuxcontainers.org/lxd/try-it
