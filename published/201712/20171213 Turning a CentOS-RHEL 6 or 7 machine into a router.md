将安装了 CentOS/RHEL 6/7 的机器转变成路由器
======

在本文中，我们将学习通过使用 NAT 技术将安装有 RHEL/CentOS 6 & 7 的机器转变成路由器来用。 我们都知道，路由器是一个工作在第三层的网络设备，用于将两个或多个网络连接在一起，即，将局域网连接上广域网上或者局域网直接互联。 路由器非常昂贵，尤其对于小型组织来说更是如此，这可能是我们关注路由器的一个原因。 与其使用专用硬件，不如让我们用 Linux 机器转换成路由器来用。

RHEL/CentOS 6 和 7 上的操作过程我们都会讲。但在开始之前， 让我们先看看需要准备那些东西。

### 前期条件

1、 一台装有 RHEL/CentOS 6 或 7 的机器

2、两块分别配有本地 IP 和外网 IP 的网卡

我们需要为两个网卡都分配 IP 地址，一个本地网络的 IP（由我们的网络管理员提供），另一个是互联网 IP（由 ISP 提供）。 像这样：

```
Ifcfg-en0s3 192.168.1.1 (LAN IP address)
Ifcfg-en0s5 10.1.1.1  (WAN IP address)
```

**注意**  不同 Linux 发行版的网卡名是不一样的。

现在准备工作完成了，可以进行配置了。

### 步骤 1 启用 IP 转发

第一步，我们启用 IP 转发。 这一步在 RHEL/CentOS 6 和 7 上是相同的。 运行

```
$ sysctl -w net.ipv4.ip_forward=1
```

但是这样会在系统重启后恢复。要让重启后依然生效需要打开

```
$ vi /etc/sysctl.conf
```

然后输入下面内容，

```
net.ipv4.ip_forward = 1
```

保存并退出。现在系统就启用 IP 转发了。

### 步骤 2 配置 IPtables/Firewalld 的规则

下一步我们需要启动 IPtables/firewalld 服务并配置 NAT 规则，

```
$ systemctl start firewalld (For Centos/RHEL 7)
$ service iptables start  (For Centos/RHEL 6)
```

然后运行下面命令来配置防火墙的 NAT 规则：

```
CentOS/RHEL 6
$ iptables -t nat -A POSTROUTING -o XXXX -j MASQUERADE
$ service iptables restart 
CentOS/RHEL 7
$ firewall-cmd  -permanent -direct -passthrough ipv4 -t nat -I POSTROUTING -o XXXX -j MASQUERADE -s 192.168.1.0/24
$ systemctl restart firewalld
```
这里，`XXXX` 是配置有外网 IP 的那个网卡名称。 这就将 Linux 机器配置成了路由器了， 下面我们就可以配置客户端然后测试路由器了。

### 步骤 3 配置客户端

要测试路由器，我们需要在客户端的网关设置成内网 IP， 本例中就是 192.168.1.1。 因此不管客户机是 Windows 还是 Linux， 请先确保网关是 192.168.1.1。 完成后， 打开终端或命令行并 `ping` 一个网站来测试客户端是否能访问互联网了：

```
$ ping google.com
```

我们也可以通过网络浏览器访问网站的方式来检查。


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/turning-centosrhel-6-7-machine-router/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:https://www.facebook.com/linuxtechlab/
[2]:https://twitter.com/LinuxTechLab
[3]:https://plus.google.com/+linuxtechlab
