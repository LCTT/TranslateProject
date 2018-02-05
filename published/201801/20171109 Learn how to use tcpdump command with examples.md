通过实例学习 tcpdump 命令
======

`tcpdump` 是一个很常用的网络包分析工具，可以用来显示通过网络传输到本系统的 TCP/IP 以及其他网络的数据包。`tcpdump` 使用 libpcap 库来抓取网络报，这个库在几乎在所有的 Linux/Unix 中都有。

`tcpdump` 可以从网卡或之前创建的数据包文件中读取内容，也可以将包写入文件中以供后续使用。必须是 root 用户或者使用 sudo 特权来运行 `tcpdump`。

在本文中，我们将会通过一些实例来演示如何使用 `tcpdump` 命令，但首先让我们来看看在各种 Linux 操作系统中是如何安装 `tcpdump` 的。

- 推荐阅读：[使用 iftop 命令监控网络带宽 ][1]

### 安装

`tcpdump` 默认在几乎所有的 Linux 发行版中都可用，但若你的 Linux 上没有的话，使用下面方法进行安装。

#### CentOS/RHEL

使用下面命令在 CentOS 和 RHEL 上安装 `tcpdump`，

```
$ sudo yum install tcpdump*
```

#### Fedora

使用下面命令在 Fedora 上安装 `tcpdump`：

```
$ dnf install tcpdump
```

#### Ubuntu/Debian/Linux Mint

在 Ubuntu/Debain/Linux Mint 上使用下面命令安装 `tcpdump`：

```
$ apt-get install tcpdump
```

安装好 `tcpdump` 后，现在来看一些例子。

### 案例演示

#### 从所有网卡中捕获数据包

运行下面命令来从所有网卡中捕获数据包：

```
$ tcpdump -i any
```

#### 从指定网卡中捕获数据包

要从指定网卡中捕获数据包，运行：

```
$ tcpdump -i eth0
```

#### 将捕获的包写入文件

使用 `-w` 选项将所有捕获的包写入文件：

```
$ tcpdump -i eth1 -w packets_file
```

#### 读取之前产生的 tcpdump 文件

使用下面命令从之前创建的 tcpdump 文件中读取内容：

```
$ tcpdump -r packets_file
```

#### 获取更多的包信息，并且以可读的形式显示时间戳

要获取更多的包信息同时以可读的形式显示时间戳，使用：

```
$ tcpdump -ttttnnvvS
```

#### 查看整个网络的数据包

要获取整个网络的数据包，在终端执行下面命令：

```
$ tcpdump net 192.168.1.0/24
```

#### 根据 IP 地址查看报文

要获取指定 IP 的数据包，不管是作为源地址还是目的地址，使用下面命令：

```
$ tcpdump host 192.168.1.100
```

要指定 IP 地址是源地址或是目的地址则使用：

```
$ tcpdump src 192.168.1.100
$ tcpdump dst 192.168.1.100
```

#### 查看某个协议或端口号的数据包

要查看某个协议的数据包，运行下面命令：

```
$ tcpdump ssh
```

要捕获某个端口或一个范围的数据包，使用：

```
$ tcpdump port 22
$ tcpdump portrange 22-125
```

我们也可以与 `src` 和 `dst` 选项连用来捕获指定源端口或指定目的端口的报文。

我们还可以使用“与” （`and`，`&&`）、“或” （`or`，`||` ) 和“非”（`not`，`!`） 来将两个条件组合起来。当我们需要基于某些条件来分析网络报文是非常有用。

#### 使用“与”

可以使用 `and` 或者符号 `&&` 来将两个或多个条件组合起来。比如：

```
$ tcpdump src 192.168.1.100 && port 22 -w ssh_packets
```

#### 使用“或”

“或”会检查是否匹配命令所列条件中的其中一条，像这样：

```
$ tcpdump src 192.168.1.100 or dst 192.168.1.50 && port 22 -w ssh_packets
$ tcpdump port 443 or 80 -w http_packets
```

#### 使用“非”

当我们想表达不匹配某项条件时可以使用“非”，像这样：

```
$ tcpdump -i eth0 src port not 22
```

这会捕获 eth0 上除了 22 号端口的所有通讯。

我们的教程至此就结束了，在本教程中我们讲解了如何安装并使用 `tcpdump` 来捕获网络数据包。如有任何疑问或建议，欢迎留言。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/learn-use-tcpdump-command-examples/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/monitoring-network-bandwidth-iftop-command/
