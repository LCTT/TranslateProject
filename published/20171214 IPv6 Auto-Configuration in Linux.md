在 Linux 中自动配置 IPv6 地址
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner_5.png?itok=3kN83IjL)

在 [KVM 中测试 IPv6 网络：第 1 部分][1] 一文中，我们学习了关于<ruby>唯一本地地址<rt>unique local addresses</rt></ruby>（ULA）的相关内容。在本文中，我们将学习如何为 ULA 自动配置 IP 地址。

### 何时使用唯一本地地址

<ruby>唯一本地地址<rt>unique local addresses</rt></ruby>（ULA）使用 `fd00::/8` 地址块，它类似于我们常用的 IPv4 的私有地址：`10.0.0.0/8`、`172.16.0.0/12`、以及 `192.168.0.0/16`。但它们并不能直接替换。IPv4 的私有地址分类和网络地址转换（NAT）功能是为了缓解 IPv4 地址短缺的问题，这是个明智的解决方案，它延缓了本该被替换的 IPv4 的生命周期。IPv6 也支持 NAT，但是我想不出使用它的理由。IPv6 的地址数量远远大于 IPv4；它是不一样的，因此需要做不一样的事情。

那么，ULA 存在的意义是什么呢？尤其是在我们已经有了<ruby>本地链路地址<rt>link-local addresses</rt></ruby>（`fe80::/10`）时，到底需不需要我们去配置它们呢？它们之间（LCTT 译注：指的是唯一本地地址和本地链路地址）有两个重要的区别。一是，本地链路地址是不可路由的，因此，你不能跨子网使用它。二是，ULA 是你自己管理的；你可以自己选择它用于子网的地址范围，并且它们是可路由的。

使用 ULA 的另一个好处是，如果你只是在局域网中“混日子”的话，你不需要为它们分配全局单播 IPv6 地址。当然了，如果你的 ISP 已经为你分配了 IPv6 的<ruby>全局单播地址<rt>global unicast addresses</rt></ruby>，就不需要使用 ULA 了。你也可以在同一个网络中混合使用全局单播地址和 ULA，但是，我想不出这样使用的一个好理由，并且要一定确保你不使用网络地址转换（NAT）以使 ULA 可公共访问。在我看来，这是很愚蠢的行为。

ULA 是仅为私有网络使用的，并且应该阻止其流出你的网络，不允许进入因特网。这很简单，在你的边界设备上只要阻止整个 `fd00::/8` 范围的 IPv6 地址即可实现。

### 地址自动配置

ULA 不像本地链路地址那样自动配置的，但是使用 radvd 设置自动配置是非常容易的，radva 是路由器公告守护程序。在你开始之前，运行 `ifconfig` 或者 `ip addr show` 去查看你现有的 IP 地址。

在生产系统上使用时，你应该将 radvd 安装在一台单独的路由器上，如果只是测试使用，你可以将它安装在你的网络中的任意 Linux PC 上。在我的小型 KVM 测试实验室中，我使用 `apt-get install radvd` 命令把它安装在 Ubuntu 上。安装完成之后，我先不启动它，因为它还没有配置文件：

```
$ sudo systemctl status radvd
● radvd.service - LSB: Router Advertising Daemon
   Loaded: loaded (/etc/init.d/radvd; bad; vendor preset: enabled)
   Active: active (exited) since Mon 2017-12-11 20:08:25 PST; 4min 59s ago
     Docs: man:systemd-sysv-generator(8)

Dec 11 20:08:25 ubunut1 systemd[1]: Starting LSB: Router Advertising Daemon...
Dec 11 20:08:25 ubunut1 radvd[3541]: Starting radvd:
Dec 11 20:08:25 ubunut1 radvd[3541]: * /etc/radvd.conf does not exist or is empty.
Dec 11 20:08:25 ubunut1 radvd[3541]: * See /usr/share/doc/radvd/README.Debian
Dec 11 20:08:25 ubunut1 radvd[3541]: * radvd will *not* be started.
Dec 11 20:08:25 ubunut1 systemd[1]: Started LSB: Router Advertising Daemon.
```

这些所有的消息有点让人困惑，实际上 radvd 并没有运行，你可以使用经典命令 `ps | grep radvd` 来验证这一点。因此，我们现在需要去创建 `/etc/radvd.conf` 文件。拷贝这个示例，将第一行的网络接口名替换成你自己的接口名字：

```
interface ens7 {
  AdvSendAdvert on;
  MinRtrAdvInterval 3;
  MaxRtrAdvInterval 10;
  prefix fd7d:844d:3e17:f3ae::/64
        {
                AdvOnLink on;
                AdvAutonomous on;
        };

};
```

前缀（`prefix`）定义了你的网络地址，它是地址的前 64 位。前两个字符必须是 `fd`，前缀接下来的剩余部分你自己定义它，最后的 64 位留空，因为 radvd 将去分配最后的 64 位。前缀后面的 16 位用来定义子网，剩余的地址定义为主机地址。你的子网必须总是 `/64`。RFC 4193 要求地址必须随机生成；查看 [在 KVM 中测试 IPv6 Networking：第 1 部分][1] 学习创建和管理 ULAs 的更多知识。

### IPv6 转发

IPv6 转发必须要启用。下面的命令去启用它，重启后生效：

```
$ sudo sysctl -w net.ipv6.conf.all.forwarding=1
```

取消注释或者添加如下的行到 `/etc/sysctl.conf` 文件中，以使它永久生效：

```
net.ipv6.conf.all.forwarding = 1
```

启动 radvd 守护程序：

```
$ sudo systemctl stop radvd
$ sudo systemctl start radvd
```

这个示例在我的 Ubuntu 测试系统中遇到了一个怪事；radvd 总是停止，我查看它的状态却没有任何问题，做任何改变之后都需要重新启动 radvd。

启动成功后没有任何输出，并且失败也是如此，因此，需要运行 `sudo systemctl status radvd` 去查看它的运行状态。如果有错误，`systemctl` 会告诉你。一般常见的错误都是 `/etc/radvd.conf` 中的语法错误。

在 Twitter 上抱怨了上述问题之后，我学到了一件很酷的技巧：当你运行 ` journalctl -xe --no-pager` 去调试 `systemctl` 错误时，你的输出会被换行，然后，你就可以看到错误信息。

现在检查你的主机，查看它们自动分配的新地址：

```
$ ifconfig
ens7      Link encap:Ethernet  HWaddr 52:54:00:57:71:50  
          [...]
          inet6 addr: fd7d:844d:3e17:f3ae:9808:98d5:bea9:14d9/64 Scope:Global
          [...]
```

本文到此为止，下周继续学习如何为 ULA 管理 DNS，这样你就可以使用一个合适的主机名来代替这些长长的 IPv6 地址。

通过来自 Linux 基金会和 edX 的 [“Linux 入门”][2] 免费课程学习更多 Linux 的知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/12/ipv6-auto-configuration-linux

作者：[Carla Schroder][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/learn/intro-to-linux/2017/11/testing-ipv6-networking-kvm-part-1
[2]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
