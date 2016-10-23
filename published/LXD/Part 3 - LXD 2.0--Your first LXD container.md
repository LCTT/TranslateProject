LXD 2.0 系列（ 三）：你的第一个 LXD 容器
==========================================

这是 [LXD 2.0 系列][0]的第三篇博客。

由于在管理 LXD 容器时涉及到大量的命令，所以这篇文章的篇幅是比较长的，如果你更喜欢使用同样的命令来快速的一步步实现整个过程，你可以[尝试我们的在线示例][1]！

![](https://linuxcontainers.org/static/img/containers.png)

### 创建并启动一个新的容器

正如我在先前的文章中提到的一样，LXD 命令行客户端预配置了几个镜像源。Ubuntu 的所有发行版和架构平台全都提供了官方镜像，但是对于其他的发行版也有大量的非官方镜像，那些镜像都是由社区制作并且被 LXC 上游贡献者所维护。

#### Ubuntu

如果你想要支持最为完善的 Ubuntu 版本，你可以按照下面的去做：

```
lxc launch ubuntu:
```

注意，这里意味着会随着 Ubuntu LTS 的发布而变化。因此，如果用于脚本，你需要指明你具体安装的版本（参见下面）。

#### Ubuntu14.04 LTS

得到最新更新的、已经测试过的、稳定的 Ubuntu 14.04 LTS 镜像，你可以简单的执行：

```
lxc launch ubuntu:14.04
```

在该模式下，会指定一个随机的容器名。

如果你更喜欢指定一个你自己的名字，你可以这样做：

```
lxc launch ubuntu:14.04 c1
```

如果你想要指定一个特定的体系架构（非主流平台），比如 32 位 Intel 镜像，你可以这样做：

```
lxc launch ubuntu:14.04/i386 c2
```

#### 当前的 Ubuntu 开发版本

上面使用的“ubuntu:”远程仓库只会给你提供官方的并经过测试的 Ubuntu 镜像。但是如果你想要未经测试过的日常构建版本，开发版可能对你来说是合适的，你需要使用“ubuntu-daily:”远程仓库。

```
lxc launch ubuntu-daily:devel c3
```

在这个例子中，将会自动选中最新的 Ubuntu 开发版本。

你也可以更加精确，比如你可以使用代号名：

```
lxc launch ubuntu-daily:xenial c4
```

#### 最新的Alpine Linux

Alpine 镜像可以在“Images:”远程仓库中找到，通过如下命令执行：

```
lxc launch images:alpine/3.3/amd64 c5
```

#### 其他

全部的 Ubuntu 镜像列表可以这样获得：

```
lxc image list ubuntu:
lxc image list ubuntu-daily:
```

全部的非官方镜像：

```
lxc image list images:
```

某个给定的原程仓库的全部别名（易记名称）可以这样获得（比如对于“ubuntu:”远程仓库）：

```
lxc image alias list ubuntu:
```

### 创建但不启动一个容器

如果你想创建一个容器或者一批容器，但是你不想马上启动它们，你可以使用`lxc init`替换掉`lxc launch`。所有的选项都是相同的，唯一的不同就是它并不会在你创建完成之后启动容器。

```
lxc init ubuntu:
```

### 关于你的容器的信息

#### 列出所有的容器

要列出你的所有容器，你可以这样这做：

```
lxc list
```
 
有大量的选项供你选择来改变被显示出来的列。在一个拥有大量容器的系统上，默认显示的列可能会有点慢（因为必须获取容器中的网络信息），你可以这样做来避免这种情况：

```
lxc list --fast
```

上面的命令显示了另外一套列的组合，这个组合在服务器端需要处理的信息更少。

你也可以基于名字或者属性来过滤掉一些东西：

```
stgraber@dakara:~$ lxc list security.privileged=true
+------+---------+---------------------+-----------------------------------------------+------------+-----------+
| NAME |  STATE  |        IPV4         |                       IPV6                    |    TYPE    | SNAPSHOTS |
+------+---------+---------------------+-----------------------------------------------+------------+-----------+
| suse | RUNNING | 172.17.0.105 (eth0) | 2607:f2c0:f00f:2700:216:3eff:fef2:aff4 (eth0) | PERSISTENT | 0         |
+------+---------+---------------------+-----------------------------------------------+------------+-----------+
```

在这个例子中，只有那些特权容器（禁用了用户命名空间）才会被列出来。

```
stgraber@dakara:~$ lxc list --fast alpine
+-------------+---------+--------------+----------------------+----------+------------+
|    NAME     |  STATE  | ARCHITECTURE |      CREATED AT      | PROFILES |    TYPE    |
+-------------+---------+--------------+----------------------+----------+------------+
| alpine      | RUNNING | x86_64       | 2016/03/20 02:11 UTC | default  | PERSISTENT |
+-------------+---------+--------------+----------------------+----------+------------+
| alpine-edge | RUNNING | x86_64       | 2016/03/20 02:19 UTC | default  | PERSISTENT |
+-------------+---------+--------------+----------------------+----------+------------+
```

在这个例子中，只有在名字中带有“alpine”的容器才会被列出来（也支持复杂的正则表达式）。

####  获取容器的详细信息

由于 list 命令显然不能以一种友好的可读方式显示容器的所有信息，因此你可以使用如下方式来查询单个容器的信息：

```
lxc info <container>
```

例如：

```
stgraber@dakara:~$ lxc info zerotier
Name: zerotier
Architecture: x86_64
Created: 2016/02/20 20:01 UTC
Status: Running
Type: persistent
Profiles: default
Pid: 31715
Processes: 32
Ips:
 eth0: inet 172.17.0.101
 eth0: inet6 2607:f2c0:f00f:2700:216:3eff:feec:65a8
 eth0: inet6 fe80::216:3eff:feec:65a8
 lo: inet 127.0.0.1
 lo: inet6 ::1
 lxcbr0: inet 10.0.3.1
 lxcbr0: inet6 fe80::c0a4:ceff:fe52:4d51
 zt0: inet 29.17.181.59
 zt0: inet6 fd80:56c2:e21c:0:199:9379:e711:b3e1
 zt0: inet6 fe80::79:e7ff:fe0d:5123
Snapshots:
 zerotier/blah (taken at 2016/03/08 23:55 UTC) (stateless)
 ```
 
### 生命周期管理命令

这些命令对于任何容器或者虚拟机管理器或许都是最普通的命令，但是它们仍然需要讲到。

所有的这些命令在批量操作时都能接受多个容器名。

#### 启动

启动一个容器就向下面一样简单：

```
lxc start <container>
```

#### 停止

停止一个容器可以这样来完成：

```
lxc stop <container>
```

如果容器不合作（即没有对发出的 SIGPWR 信号产生回应），这时候，你可以使用下面的方式强制执行：

```
lxc stop <container> --force
```

#### 重启

通过下面的命令来重启一个容器：

```
lxc restart <container>
```

如果容器不合作（即没有对发出的 SIGINT 信号产生回应），你可以使用下面的方式强制执行：

```
lxc restart <container> --force
```

#### 暂停

你也可以“暂停”一个容器，在这种模式下，所有的容器任务将会被发送相同的 SIGSTOP 信号，这也意味着它们将仍然是可见的，并且仍然会占用内存，但是它们不会从调度程序中得到任何的 CPU 时间片。

如果你有一个很占用 CPU 的容器，而这个容器需要一点时间来启动，但是你却并不会经常用到它。这时候，你可以先启动它，然后将它暂停，并在你需要它的时候再启动它。

```
lxc pause <container>
```

#### 删除

最后，如果你不需要这个容器了，你可以用下面的命令删除它：

```
lxc delete <container>
```

注意，如果容器还处于运行状态时你将必须使用“-force”。

### 容器的配置

LXD 拥有大量的容器配置设定，包括资源限制，容器启动控制以及对各种设备是否允许访问的配置选项。完整的清单因为太长所以并没有在本文中列出，但是，你可以从[这里]获取它。

就设备而言，LXD 当前支持下面列出的这些设备类型：

- 磁盘 
	既可以是一块物理磁盘，也可以只是一个被挂挂载到容器上的分区，还可以是一个来自主机的绑定挂载路径。
- 网络接口卡
	一块网卡。它可以是一块桥接的虚拟网卡，或者是一块点对点设备，还可以是一块以太局域网设备或者一块已经被连接到容器的真实物理接口。
- unix 块设备
	一个 UNIX 块设备，比如 /dev/sda
- unix 字符设备
	一个 UNIX 字符设备，比如 /dev/kvm
- none
	这种特殊类型被用来隐藏那种可以通过配置文件被继承的设备。

#### 配置 profile 文件

所有可用的配置文件列表可以这样获取：

```
lxc profile list
```

为了看到给定配置文件的内容，最简单的方式是这样做：

```
lxc profile show <profile>
```

你可能想要改变文件里面的内容，可以这样做：

```
lxc profile edit <profile>
```

你可以使用如下命令来改变应用到给定容器的配置文件列表：

```
lxc profile apply <container> <profile1>,<profile2>,<profile3>,...
```

####  本地配置

有些配置是某个容器特定的，你并不想将它放到配置文件中，你可直接对容器设置它们：

```
lxc config edit <container>
```

上面的命令做的和“profile edit”命令是一样。

如果不想在文本编辑器中打开整个文件的内容，你也可以像这样修改单独的配置：

```
lxc config set <container> <key> <value>
```

或者添加设备，例如：

```
lxc config device add my-container kvm unix-char path=/dev/kvm
```

上面的命令将会为名为“my-container”的容器设置一个 /dev/kvm 项。

对一个配置文件使用`lxc profile set`和`lxc profile device add`命令也能实现上面的功能。

#### 读取配置

你可以使用如下命令来读取容器的本地配置：

```
lxc config show <container>
```

或者得到已经被展开了的配置（包含了所有的配置值）：

```
lxc config show --expanded <container>
```

例如：

```
stgraber@dakara:~$ lxc config show --expanded zerotier
name: zerotier
profiles:
- default
config:
 security.nesting: "true"
 user.a: b
 volatile.base_image: a49d26ce5808075f5175bf31f5cb90561f5023dcd408da8ac5e834096d46b2d8
 volatile.eth0.hwaddr: 00:16:3e:ec:65:a8
 volatile.last_state.idmap: '[{"Isuid":true,"Isgid":false,"Hostid":100000,"Nsid":0,"Maprange":65536},{"Isuid":false,"Isgid":true,"Hostid":100000,"Nsid":0,"Maprange":65536}]'
devices:
 eth0:
  name: eth0
  nictype: macvlan
  parent: eth0
  type: nic
  limits.ingress: 10Mbit
  limits.egress: 10Mbit
 root:
  path: /
  size: 30GB
  type: disk
 tun:
  path: /dev/net/tun
  type: unix-char
ephemeral: false
```

这样做可以很方便的检查有哪些配置属性被应用到了给定的容器。

####  实时配置更新

注意，除非在文档中已经被明确指出，否则所有的配置值和设备项的设置都会对容器实时发生影响。这意味着在不重启正在运行的容器的情况下，你可以添加和移除某些设备或者修改安全配置文件。

### 获得一个 shell

LXD 允许你直接在容器中执行任务。最常用的做法是在容器中得到一个 shell 或者执行一些管理员任务。

和 SSH 相比，这样做的好处是你不需要容器是网络可达的，也不需要任何软件和特定的配置。

#### 执行环境

与 LXD 在容器内执行命令的方式相比，有一点是不同的，那就是 shell 并不是在容器中运行。这也意味着容器不知道使用的是什么样的 shell，以及设置了什么样的环境变量和你的家目录在哪里。

通过 LXD 来执行命令总是使用最小的路径环境变量设置，并且 HOME 环境变量必定为 /root，以容器的超级用户身份来执行（即 uid 为 0，gid 为 0）。

其他的环境变量可以通过命令行来设置，或者在“environment.<key>”配置中设置成永久环境变量。

####  执行命令

在容器中获得一个 shell 可以简单的执行下列命令得到：

```
lxc exec <container> bash
```

当然，这样做的前提是容器内已经安装了 bash。

更复杂的命令要求使用分隔符来合理分隔参数。

```
lxc exec <container> -- ls -lh /
```

如果想要设置或者重写变量，你可以使用“-env”参数，例如：

```
stgraber@dakara:~$ lxc exec zerotier --env mykey=myvalue env | grep mykey
mykey=myvalue
```

### 管理文件

因为 LXD 可以直接访问容器的文件系统，因此，它可以直接读取和写入容器中的任意文件。当我们需要提取日志文件或者与容器传递文件时，这个特性是很有用的。

#### 从容器中取回一个文件

想要从容器中获得一个文件，简单的执行下列命令：

```
lxc file pull <container>/<path> <dest>
```

例如：

```
stgraber@dakara:~$ lxc file pull zerotier/etc/hosts hosts
```

或者将它读取到标准输出：

```
stgraber@dakara:~$ lxc file pull zerotier/etc/hosts -
127.0.0.1 localhost

# The following lines are desirable for IPv6 capable hosts
::1 ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
```

#### 向容器发送一个文件  

发送以另一种简单的方式完成：

```
lxc file push <source> <container>/<path>
```

#### 直接编辑一个文件

编辑是一个方便的功能，其实就是简单的提取一个给定的路径，在你的默认文本编辑器中打开它，在你关闭编辑器时会自动将编辑的内容保存到容器。

```
lxc file edit <container>/<path>
```

### 快照管理

LXD 允许你对容器执行快照功能并恢复它。快照包括了容器在某一时刻的完整状态（如果`-stateful`被使用的话将会包括运行状态），这也意味着所有的容器配置，容器设备和容器文件系统也会被保存。

#### 创建一个快照

你可以使用下面的命令来执行快照功能：

```
lxc snapshot <container>
```

命令执行完成之后将会生成名为snapX（X 为一个自动增长的数）的记录。

除此之外，你还可以使用如下命令命名你的快照：

```
lxc snapshot <container> <snapshot name>
```

#### 列出所有的快照

一个容器的所有快照的数量可以使用`lxc list`来得到，但是具体的快照列表只能执行`lxc info`命令才能看到。

```
lxc info <container>
```

#### 恢复快照

为了恢复快照，你可以简单的执行下面的命令：

```
lxc restore <container> <snapshot name>
```

#### 给快照重命名

可以使用如下命令来给快照重命名：

```
lxc move <container>/<snapshot name> <container>/<new snapshot name>
```

#### 从快照中创建一个新的容器

你可以使用快照来创建一个新的容器，而这个新的容器除了一些可变的信息将会被重置之外（例如 MAC 地址）其余所有信息都将和快照完全相同。

```
lxc copy <source container>/<snapshot name> <destination container>
```

#### 删除一个快照

最后，你可以执行下面的命令来删除一个快照：

```
lxc delete <container>/<snapshot name>
```

### 克隆并重命名

得到一个纯净的发行版镜像总是让人感到愉悦，但是，有时候你想要安装一系列的软件到你的容器中，这时，你需要配置它然后将它分支成多个其他的容器。

#### 复制一个容器

为了复制一个容器并有效的将它克隆到一个新的容器中，你可以执行下面的命令：

```
lxc copy <source container> <destination container>
```

目标容器在所有方面将会完全和源容器等同。除了新的容器没有任何源容器的快照以及一些可变值将会被重置之外（例如 MAC 地址）。

#### 移动一个快照

LXD 允许你复制容器并在主机之间移动它。但是，关于这一点将在后面的文章中介绍。

现在，“move”命令将会被用作给容器重命名。

```
lxc move <old name> <new name>
```

唯一的要求就是当容器应该被停止，容器内的任何事情都会被保存成它本来的样子，包括可变化的信息（类似 MAC 地址等）。

### 结论

这篇如此长的文章介绍了大多数你可能会在日常操作中使用到的命令。

很显然，这些如此之多的命令都会有不少选项，可以让你的命令更加有效率或者可以让你指定你的 LXD 容器的某个具体方面的参数。最好的学习这些命令的方式就是深入学习它们的帮助文档（ --help）。

### 更多信息

- LXD 的主要网站是：<https://linuxcontainers.org/lxd>
- Github 上的开发动态： <https://github.com/lxc/lxd>
- 邮件列表支持：<https://lists.linuxcontainers.org>
- IRC 支持： #lxcontainers on irc.freenode.net

如果你不想或者不能在你的机器上安装 LXD，你可以[试试在线版本][1]!

--------------------------------------------------------------------------------

via：https://www.stgraber.org/2016/03/19/lxd-2-0-your-first-lxd-container-312/
作者：[Stéphane Graber][a]
译者：[kylepeng93](https://github.com/kylepeng93)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://linuxcontainers.org/lxd/try-it
[2]: https://github.com/lxc/lxd/blob/master/doc/configuration.md
