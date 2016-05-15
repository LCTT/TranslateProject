kylepeng93 is translating
你的地一个LXD容器
==========================================

这是第三篇发布的博客[LXD2.0系列]
由于在管理LXD容器时涉及到大量的命令，所以这篇文章的篇幅是比较长的，如果你更喜欢使用同样的命令来快速的一步步实现整个过程，你可以[尝试我们的在线示例]！
![](https://linuxcontainers.org/static/img/containers.png)

### 创建并启动一个新的容器
正如我在先前的文章中提到的一样，LXD命令行客户端使用了少量的图片来做了一个预配置。Ubuntu的所有发行版和架构平台都拥有最好的官方图片，但是对于其他的发行版仍然有大量的非官方图片，那些图片都是由社区制作并且被LXC上层贡献者所维护。
### Ubuntu
如果你想要支持最为完善的ubuntu版本，你可以按照下面的去做：
```
lxc launch ubuntu:
```
注意，这里所做的解释会随着ubuntu LTS的发布而变化。因此对于你使用的脚本应该取决于下面提到的具体你想要安装的版本：
###Ubuntu14.04 LTS
得到最新的，已经测试过的，稳定的ubuntu14.04 LTS镜像，你可以简单的执行：
```
lxc launch ubuntu:14.04
```
这该模式下，一个任意的容器名将会被指定给它。
如果你更喜欢指定一个你自己的命令，你可以这样做：
```
lxc launch ubuntu:14.04 c1
```

如果你想要指定一个特定的体系架构（非主要的），比如32位Intel镜像，你可以这样做：
```
lxc launch ubuntu:14.04/i386 c2
```

### 当前的Ubuntu开发版本
上面使用的“ubuntu：”远程方式只会给你提供官方的并经过测试的ubuntu镜像。但是如果你想要未经测试过的日常构建版本，开发版可能对你来说是合适的，你将要使用“ubuntu-daily”来远程获取。
```
lxc launch ubuntu-daily:devel c3
```

在这个例子中，最新的ubuntu开发版本将会被选自动选中。
你也可以更加精确，比如你可以使用代号名：
```
lxc launch ubuntu-daily:xenial c4
```

### 最新的Alpine Linux
Alpine镜像在“Images：”远程中可用，可以通过如下命令执行：
```
lxc launch images:alpine/3.3/amd64 c5
```

### And many more
### 其他
所有ubuntu镜像列表可以这样获得：
```
lxc image list ubuntu:
lxc image list ubuntu-daily:
```

所有的非官方镜像：
```
lxc image list images:
```

所有给定的可用远程别名清单可以这样获得（针对“ubuntu：”远程）：
```
lxc image alias list ubuntu:
```


### 创建但不启动一个容器
如果你想创建一个容器或者一批容器，但是你不想马上启动他们，你可以使用“lxc init”替换掉“lxc launch”。所有的选项都是相同的，唯一的不同就是它并不会在你创建完成之后启动容器。
```
lxc init ubuntu:
```

### 关于你的容器的信息
### 列出所有的容器
为了列出你的所有容器，你可以这样这做：
```
lxc list
```
 
有大量的选项供你选择来改变被显示出来的列。在一个拥有大量容器的系统上，默认显示的列可能会有点慢（因为必须获取容器中的网络信息），你可以这样做来避免这种情况：
```
lxc list --fast
```

上面的命令显示了一个不同的列的集合，这个集合在服务器端需要处理的信息更少。
你也可以基于名字或者属性来过滤掉一些东西：
```
stgraber@dakara:~$ lxc list security.privileged=true
+------+---------+---------------------+-----------------------------------------------+------------+-----------+
| NAME |  STATE  |        IPV4         |                       IPV6                    |    TYPE    | SNAPSHOTS |
+------+---------+---------------------+-----------------------------------------------+------------+-----------+
| suse | RUNNING | 172.17.0.105 (eth0) | 2607:f2c0:f00f:2700:216:3eff:fef2:aff4 (eth0) | PERSISTENT | 0         |
+------+---------+---------------------+-----------------------------------------------+------------+-----------+
```

在这个例子中，只有那些有特权（用户命名空间不可用）的容器才会被列出来。
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

在这个例子中，只有在名字中带有“alpine”的容器才会被列出来（支持复杂的正则表达式）。
###  获取容器的详细信息
由于list命令显然不能以一种友好的可读方式显示容器的所有信息，因此你可以使用如下方式来查询单个容器的信息：
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
这些命令对于任何容器或者虚拟机管理器或许都是最普通的命令，但是它们仍然需要被涉及到。
所有的这些命令在批量操作时都能接受多个容器名。
###  启动
启动一个容器就向下面一样简单：
```
lxc start <container>
```

###  停止
停止一个容器可以这样来完成：
```
lxc stop <container>
```

如果容器不合作（即没有对发出的信号产生回应），这时候，你可以使用下面的方式强制执行：
```
lxc stop <container> --force
```

###  重启
通过下面的命令来重启一个容器：
```
lxc restart <container>
```

如果容器不合作（即没有对发出的信号产生回应），你可以使用下面的方式强制执行：
```
lxc restart <container> --force
```

###  暂停
你也可以“暂停”一个容器，在这种模式下，所有的容器任务将会被发送相同的信号，这也意味着他们将仍然是可见的，并且仍然会占用内存，但是他们不会从调度程序中得到任何的CPU时间片。
如果你有一个CPU的饥饿容器，而这个容器需要一点时间来启动，但是你却并 不会经常用到它。这时候，你可以先启动它，然后将它暂停，并在你需要它的时候再启动它。
```
lxc pause <container>
```

###  删除
最后，如果你不需要这个容器了，你可以用下面的命令删除它：
```
lxc delete <container>
```

注意，如果容器还处于运行状态时你将必须使用“-forece”。
### 容器的配置
LXD拥有大量的容器配置设定，包括资源限制，容器启动控制以及对各种设备是否允许访问的配置选项。完整的清单因为太长所以并没有在本文中列出，但是，你可以从[here]获取它。
就设备而言，LXD当前支持下面列出的这些设备：
- 磁盘
既可以是一块物理磁盘，也可以只是一个被挂挂载到容器上的分区，还可以是一个来自主机的绑定挂载路径。
- 网络接口卡
一块网卡。它可以是一块桥接的虚拟网卡，或者是一块点对点设备，还可以是一块以太局域网设备或者一块已经被连接到容器的真实物理接口。
- unix块
一个UNIX块设备，比如/dev/sda
- unix字符
一块UNIX字符设备，比如/dev/kvm
- none
这种特殊类型被用来隐藏那种可以通过profiles文件被继承的设备。

### 配置profiles文件
所有可用的profiles的文件列表可以这样获取：
```
lxc profile list
```

为了看到给定profile文件的内容，最简单的方式是这样做：
```
lxc profile show <profile>
```

你可能想要改变文件里面的内容，可以这样做：
```
lxc profile edit <profile>
```

你可以使用如下命令来改变profiles的列表并将这种变化应用到给定的容器中：
```
lxc profile apply <container> <profile1>,<profile2>,<profile3>,...
```

###  本地配置
For things that are unique to a container and so don’t make sense to put into a profile, you can just set them directly against the container:

```
lxc config edit <container>
```

上面的命令将会完成和“profile edit”命令一样的功能。

即使不在文本编辑器中打开整个文件的内容，你也可以像这样修改单独的键：
```
lxc config set <container> <key> <value>
```
或者添加设备，例如
```
lxc config device add my-container kvm unix-char path=/dev/kvm
```

上面的命令将会为名为“my-container”的容器打开一个/dev/kvm入口。
对一个profile文件使用“lxc profile set”和“lxc profile device add”命令也能实现上面的功能。
#### 读取配置
你可以使用如下命令来阅读容器的本地配置：
```
lxc config show <container>
```

或者得到已经被展开了的配置（包含了所有的键值）：
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
###  实时配置更新
注意，除非在文档中已经被明确指出，否则所有的键值和设备入口都会被应用到受影响的实时容器。这意味着你可以添加和移除某些设备或者在不重启容器的情况下修改正在运行的容器的安全profile配置文件。
### 获得一个shell
LXD允许你对容器中的任务进行直接的操作。最常用的做法是在容器中得到一个shell或者执行一些管理员任务。
和SSH相比，这样做的好处是你可以接触到独立与容器之外的网络或者任何一个软件又或者任何一个能够在容器内可见的文件配置。
执行环境
对比LXD在容器内执行命令的方式，有一点是不同的，那就是它自身并不是在容器中运行。这也意味着它不知道该使用什么样的shell，以及设置什么样的环境变量和哪里是它的家目录。
通过LXD来执行命令必须总是在最小路径环境变量集并且HONE环境变量必须为/root的情况下以容器的超级用户身份来执行（即uid为0,gid为0）。
其他的环境变量可以通过命令行来设置，或者在“environment.<key>”配置文件中设置成永久环境变量。
###  执行命令
在容器中获得一个shell可以简单的执行下列命令得到：
```
lxc exec <container> bash
```

当然，这样做的前提是容器内已经安装了bash。

更多复杂的命令要求有对参数分隔符的合理使用。
```
lxc exec <container> -- ls -lh /
```

如果想要设置或者重写变量，你可以使用“-env”参数，例如：
```
stgraber@dakara:~$ lxc exec zerotier --env mykey=myvalue env | grep mykey
mykey=myvalue
```

### 管理文件
因为LXD可以直接访问容器的文件系统，因此，它可以直接往容器中读取和写入任意文件。当我们需要提取日志文件或者与容器发生交互时，这个特性是很有用的。
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

# 下面的所有行对于支持IPv6的主机是有用的
::1 ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
```

#### 向容器发送一个文件  

发送会简单的以另一种方式完成：
```
lxc file push <source> <container>/<path>
```

#### 直接编辑一个文件
当只是简单的提取一个给定的路径时，编辑是一个很方便的功能，在你的默认文本编辑器中打开它，这样在你关闭编辑器时会自动将编辑的内容保存到容器。
```
lxc file edit <container>/<path>
```

### 快照管理
LXD允许你对容器执行快照功能并恢复它。快照包括了容器在某一时刻的完整状态（如果-stateful被使用的话将会包括运行状态），这也意味着所有的容器配置，容器设备和容器文件系统也会被包保存。
#### 创建一个快照
你可以使用下面的命令来执行快照功能：
```
lxc snapshot <container>
```

命令执行完成之后将会生成名为snapX（X为一个自动增长的数）的记录。
除此之外，你还可以使用如下命令命名你的快照：
```
lxc snapshot <container> <snapshot name>
```

#### 列出所有的快照
一个容器的所有快照的数量可以使用“lxc list”来得到，但是真正的快照列表只能执行“lxc info”命令才能看到。
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
你可以使用快照来创建一个新的容器，而这个新的容器除了一些可变的信息将会被重置之外（例如MAC地址）其余所有信息都将和快照完全相同。
```
lxc copy <source container>/<snapshot name> <destination container>
```

#### 删除一个快照

最后，你可以执行下面的命令来删除一个快照：
```
lxc delete <container>/<snapshot name>
```

### 克隆并重命名
得到一个纯净的发行版镜像总是让人感到愉悦，但是，有时候你想要安装一系列的软件到你的容器中，这时，你需要配置它然后将它分割并分配到多个其他的容器中。
#### 复制一个容器
为了复制一个容器并有效的将它克隆到一个新的容器中，你可以执行下面的命令：
```
lxc copy <source container> <destination container>
```
目标容器在所有方面将会完全和源容器等同。除非它没有
目标容器在所有方面将会完全和源容器等同。除了新的容器没有任何源容器的快照以及一些可变值将会被重置之外（例如MAC地址）。
#### 移除一个快照
LXD允许你复制容器并在主机之间移动它。但是，关于这一点将在后面的文章中介绍。
现在，“move”命令将会被用作给容器重命名。
```
lxc move <old name> <new name>
```

唯一的要求就是当容器被停止时，容器内的任何事情都会被保存成它本来的样子，包括可变化的信息（类似MAC地址等）。
### 结论
这篇如此长的文章介绍了大多数你可能会在日常操作中使用到的命令。
很显然，那些如此之多的命令都会有额外的可以让你的命令更加有效率或者可以让你指定你的LXD容器的某个具体方面的参数。最好的学习这些命令的方式就是深入学习它们的帮助文档，当然。只是对于那些你真正需要用到的命令参数。
### 额外的信息
LXD的主要网站是：<https://linuxcontainers.org/lxd>
Github上的开发说明： <https://github.com/lxc/lxd>
邮件列表支持：<https://lists.linuxcontainers.org>
IRC支持： #lxcontainers on irc.freenode.net
如果你不想或者不能在你的机器上安装LXD，你可以[try it online instead][1]!

--------------------------------------------------------------------------------

来自于：https://www.stgraber.org/2016/03/19/lxd-2-0-your-first-lxd-container-312/
作者：[Stéphane Graber][a]
译者：[kylepeng93](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://linuxcontainers.org/lxd/try-it
[2]: https://github.com/lxc/lxd/blob/master/doc/configuration.md
