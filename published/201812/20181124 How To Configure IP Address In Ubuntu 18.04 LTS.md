[#]: collector: (lujun9972)
[#]: translator: (chenxinlong)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (How To Configure IP Address In Ubuntu 18.04 LTS)
[#]: via: (https://www.ostechnix.com/how-to-configure-ip-address-in-ubuntu-18-04-lts/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)
[#]: url: (https://linux.cn/article-10324-1.html)

如何在 Ubuntu 18.04 LTS 中配置 IP 地址
======

![](https://www.ostechnix.com/wp-content/uploads/2018/11/configure-ip-address-720x340.jpg)


在 Ubuntu 18.04 LTS 中配置 IP 地址的方法和以往使用的配置方法有很大的不同。和旧版本的不同之处在于，Ubuntu 18.04 使用 **Netplan** 来配置 IP 地址，**Netplan** 是一个新的命令行网络配置工具。其实在 Ubuntu 17.10 的时候 Ubuntu 开发者就已经介绍过 Netplan 了。接下来要介绍的新的 IP 配置方法不会再用到 `/etc/network/interfaces` 这个文件，取而代之的是一个 YAML 文件。默认的 Netplan 配置文件一般在 `/etc/netplan` 目录下。 在这篇教程中，我们会去学习在 **Ubuntu 18.04 LTS** 的最小化服务器中配置静态 IP 和动态 IP 。

### 在 Ubuntu 18.04 LTS 中配置静态 IP 地址

首先先找到 Netplan 默认的网络配置文件所在之处：

```
$ ls /etc/netplan/
50-cloud-init.yaml
```

我们可以看到，默认的网络配置文件是 `50-cloud-init.yaml` ，这是一个 YAML 文件。

然后我们再看一下这个文件的内容是什么：

```
$ cat /etc/netplan/50-cloud-init.yaml
```

我在之前安装 Ubuntu 18.04 的时候为了从 DHCP 服务器获取 IP 地址已经已经做过了网卡的相关配置，所以详细配置直接看下图：

![](https://www.ostechnix.com/wp-content/uploads/2018/11/configure-network.png)

可以看到这边有两个网卡，分别是 `enp0s3` 和 `enp0s8` ，并且这两个网卡都配置为从 DHCP 服务器中获取 IP。 

现在我们给这两个网卡都配置为静态 IP 地址，先用任意一种编辑器来编辑配置文件。

```
$ sudo nano /etc/netplan/50-cloud-init.yaml
```

接下来我们分别添加 IP 地址、子网掩码、网关、DNS 服务器等配置。分别用 `192.168.225.50` 作为网卡 `enp0s3` 的 IP 地址， `192.168.225.51` 作为网卡 `enp0s8` 的 IP 地址， `192.168.225.1` 作为网关地址， `255.255.255.0` 作为子网掩码。然后用 `8.8.8.8` 、 `8.8.4.4` 这两个 DNS 服务器 IP。

![](https://www.ostechnix.com/wp-content/uploads/2018/11/configure-static-ip.png)

要注意的一点是，在 Ubuntu 18.04 里，这个配置文件的每一行都必须靠空格来缩进，不能用 `TAB` 来代替，否则配置会不起作用。如上图所示的配置文件中每行的缩进都是靠空格键实现的。

同时，在 Ubuntu 18.04 中，我们定义子网掩码的时候不是像旧版本的那样把 IP 和子网掩码分成两项配置。在旧版本的 Ubuntu 里，我们一般配置的 IP 和子网掩码是这样的：

```
address = 192.168.225.50
netmask = 255.255.255.0
```

而在 netplan 中，我们把这两项合并成一项，就像这样：

```
addresses : [192.168.225.50/24]
```

配置完成之后保存并关闭配置文件。然后用下面这行命令来应用刚才的配置：

```
$ sudo netplan apply
```

如果在应用配置的时候有出现问题的话，可以通过如下的命令来查看刚才配置的内容出了什么问题。

```
$ sudo netplan --debug apply
```

这行命令会输出这些 debug 信息：

```
** (generate:1556): DEBUG: 09:14:47.220: Processing input file //etc/netplan/50-cloud-init.yaml..
** (generate:1556): DEBUG: 09:14:47.221: starting new processing pass
** (generate:1556): DEBUG: 09:14:47.221: enp0s8: setting default backend to 1
** (generate:1556): DEBUG: 09:14:47.222: enp0s3: setting default backend to 1
** (generate:1556): DEBUG: 09:14:47.222: Generating output files..
** (generate:1556): DEBUG: 09:14:47.223: NetworkManager: definition enp0s8 is not for us (backend 1)
** (generate:1556): DEBUG: 09:14:47.223: NetworkManager: definition enp0s3 is not for us (backend 1)
DEBUG:netplan generated networkd configuration exists, restarting networkd
DEBUG:no netplan generated NM configuration exists
DEBUG:device enp0s3 operstate is up, not replugging
DEBUG:netplan triggering .link rules for enp0s3
DEBUG:device lo operstate is unknown, not replugging
DEBUG:netplan triggering .link rules for lo
DEBUG:device enp0s8 operstate is up, not replugging
DEBUG:netplan triggering .link rules for enp0s8
```

如果配置正常且生效的话，我们可以用下面这个命令来查看一下 ip：

```
$ ip addr
```

在我的 Ubuntu 18.04 中配置完之后执行命令输出的信息如下：

![](https://www.ostechnix.com/wp-content/uploads/2018/11/Check-IP-address.png)

到此为止，我们已经成功地在 Ubuntu 18.04 LTS 中用 Netplan 完成了静态 IP 的配置。

更多关于 Netplan 的信息，可以在用 man 命令在手册中查看：

```
$ man netplan
```

### 在 Ubuntu 18.04 LTS 中配置动态 IP 地址

其实配置文件中的初始配置就是动态 IP 的配置，所以你想要使用动态 IP 的话不需要再去做任何的配置操作。如果你已经配置了静态 IP 地址，想要恢复之前动态 IP 的配置，就把在上面静态 IP 配置中所添加的相关配置项删除，把整个配置文件恢复成上面的图 1 所示的样子就行了。

现在你已经学会在 Ubuntu 18.04 中配置静态和动态 IP 地址了。个人而言，我其实不太喜欢这种方式，旧的配置方式反而来得简单。你们觉得呢 ？


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-configure-ip-address-in-ubuntu-18-04-lts/

作者：[SK][a]
选题：[lujun9972][b]
译者：[chenxinlong](https://github.com/chenxinlong)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
