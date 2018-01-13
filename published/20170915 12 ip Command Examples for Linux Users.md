12 个 ip 命令范例
======

一年又一年，我们一直在使用 `ifconfig` 命令来执行网络相关的任务，比如检查和配置网卡信息。但是 `ifconfig` 已经不再被维护，并且在最近版本的 Linux 中被废除了！ `ifconfig` 命令已经被 `ip` 命令所替代了。

`ip` 命令跟 `ifconfig` 命令有些类似，但要强力的多，它有许多新功能。`ip` 命令完成很多 `ifconfig` 命令无法完成的任务。

![IP-command-examples-Linux][2]

本教程将会讨论 `ip` 命令的 12 中最常用法，让我们开始吧。

### 案例 1：检查网卡信息

检查网卡的诸如 IP 地址，子网等网络信息，使用 `ip addr show` 命令：

```
[linuxtechi@localhost]$ ip addr show

或

[linuxtechi@localhost]$ ip a s
```

这会显示系统中所有可用网卡的相关网络信息，不过如果你想查看某块网卡的信息，则命令为：

```
[linuxtechi@localhost]$ ip addr show enp0s3
```

这里 `enp0s3` 是网卡的名字。

![IP-addr-show-commant-output][4]

### 案例 2：启用/禁用网卡

使用 `ip` 命令来启用一个被禁用的网卡：

```
[linuxtechi@localhost]$ sudo ip link set enp0s3 up
```

而要禁用网卡则使用 `down` 触发器：

```
[linuxtechi@localhost]$ sudo ip link set enp0s3 down
```

### 案例 3：为网卡分配 IP 地址以及其他网络信息

要为网卡分配 IP 地址，我们使用下面命令：

```
[linuxtechi@localhost]$ sudo ip addr add 192.168.0.50/255.255.255.0 dev enp0s3
```

也可以使用 `ip` 命令来设置广播地址。默认是没有设置广播地址的，设置广播地址的命令为：

```
[linuxtechi@localhost]$ sudo  ip addr add broadcast 192.168.0.255 dev enp0s3
```

我们也可以使用下面命令来根据 IP 地址设置标准的广播地址：

```
[linuxtechi@localhost]$  sudo ip addr add 192.168.0.10/24 brd + dev enp0s3
```

如上面例子所示，我们可以使用 `brd` 代替 `broadcast` 来设置广播地址。

### 案例 4：删除网卡中配置的 IP 地址

若想从网卡中删掉某个 IP，使用如下 `ip` 命令：

```
[linuxtechi@localhost]$ sudo ip addr del 192.168.0.10/24 dev enp0s3
```

### 案例 5：为网卡添加别名（假设网卡名为 enp0s3）

添加别名，即为网卡添加不止一个 IP，执行下面命令：

```
[linuxtechi@localhost]$  sudo ip addr add 192.168.0.20/24 dev enp0s3 label enp0s3:1
```

![ip-command-add-alias-linux][6]

### 案例 6：检查路由/默认网关的信息

查看路由信息会给我们显示数据包到达目的地的路由路径。要查看网络路由信息，执行下面命令：

```
[linuxtechi@localhost]$  ip route show
```

![ip-route-command-output][8]

在上面输出结果中，我们能够看到所有网卡上数据包的路由信息。我们也可以获取特定 IP 的路由信息，方法是：

```
[linuxtechi@localhost]$ sudo ip route get 192.168.0.1
```

### 案例 7：添加静态路由

我们也可以使用 IP 来修改数据包的默认路由。方法是使用 `ip route` 命令：

```
[linuxtechi@localhost]$ sudo ip route add default via 192.168.0.150/24
```

这样所有的网络数据包通过 `192.168.0.150` 来转发，而不是以前的默认路由了。若要修改某个网卡的默认路由，执行：

```
[linuxtechi@localhost]$ sudo ip route add 172.16.32.32 via 192.168.0.150/24 dev enp0s3
```

### 案例 8：删除默认路由

要删除之前设置的默认路由，打开终端然后运行：

```
[linuxtechi@localhost]$  sudo ip route del 192.168.0.150/24
```

**注意：** 用上面方法修改的默认路由只是临时有效的，在系统重启后所有的改动都会丢失。要永久修改路由，需要修改或创建 `route-enp0s3` 文件。将下面这行加入其中：

```
[linuxtechi@localhost]$  sudo vi /etc/sysconfig/network-scripts/route-enp0s3

172.16.32.32 via 192.168.0.150/24 dev enp0s3
```

保存并退出该文件。

若你使用的是基于 Ubuntu 或 debian 的操作系统，则该要修改的文件为 `/etc/network/interfaces`，然后添加 `ip route add 172.16.32.32 via 192.168.0.150/24 dev enp0s3` 这行到文件末尾。

### 案例 9：检查所有的 ARP 记录

ARP，是<ruby>地址解析协议<rt>Address Resolution Protocol</rt></ruby>的缩写，用于将 IP 地址转换为物理地址（也就是 MAC 地址）。所有的 IP 和其对应的 MAC 明细都存储在一张表中，这张表叫做 ARP 缓存。

要查看 ARP 缓存中的记录，即连接到局域网中设备的 MAC 地址，则使用如下 ip 命令：

```
[linuxtechi@localhost]$  ip neigh
```

![ip-neigh-command-linux][10]

### 案例 10：修改 ARP 记录

删除 ARP 记录的命令为：

```
[linuxtechi@localhost]$ sudo ip neigh del 192.168.0.106 dev enp0s3
```

若想往 ARP 缓存中添加新记录，则命令为：

```
[linuxtechi@localhost]$ sudo ip neigh add 192.168.0.150 lladdr 33:1g:75:37:r3:84 dev enp0s3 nud perm
```

这里 `nud` 的意思是 “neghbour state”（网络邻居状态），它的值可以是：

  * `perm` - 永久有效并且只能被管理员删除
  * `noarp` - 记录有效，但在生命周期过期后就允许被删除了
  * `stale` - 记录有效，但可能已经过期
  * `reachable` - 记录有效，但超时后就失效了

### 案例 11：查看网络统计信息

通过 `ip` 命令还能查看网络的统计信息，比如所有网卡上传输的字节数和报文数，错误或丢弃的报文数等。使用 `ip -s link` 命令来查看：

```
[linuxtechi@localhost]$ ip -s link
```

![ip-s-command-linux][12]

### 案例 12：获取帮助

若你想查看某个上面例子中没有的选项，那么你可以查看帮助。事实上对任何命令你都可以寻求帮助。要列出 `ip` 命令的所有可选项，执行：

```
[linuxtechi@localhost]$ ip help
```

记住，`ip` 命令是一个对 Linux 系统管理来说特别重要的命令，学习并掌握它能够让配置网络变得容易。本教程就此结束了，若有任何建议欢迎在下面留言框中留言。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/ip-command-examples-for-linux-users/

作者：[Pradeep Kumar][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxtechi.com/author/pradeep/
[1]:https://www.linuxtechi.com/wp-content/plugins/lazy-load/images/1x1.trans.gif
[2]:https://www.linuxtechi.com/wp-content/uploads/2017/09/IP-command-examples-Linux.jpg
[3]:https://www.linuxtechi.com/wp-content/uploads/2017/09/IP-command-examples-Linux.jpg 
[4]:https://www.linuxtechi.com/wp-content/uploads/2017/09/IP-addr-show-commant-output.jpg
[5]:https://www.linuxtechi.com/wp-content/uploads/2017/09/IP-addr-show-commant-output.jpg
[6]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-command-add-alias-linux.jpg
[7]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-command-add-alias-linux.jpg 
[8]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-route-command-output.jpg
[9]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-route-command-output.jpg
[10]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-neigh-command-linux.jpg
[11]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-neigh-command-linux.jpg
[12]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-s-command-linux.jpg
[13]:https://www.linuxtechi.com/wp-content/uploads/2017/09/ip-s-command-linux.jpg
