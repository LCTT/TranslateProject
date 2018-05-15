在 KVM 中测试 IPv6 网络：第 2 部分
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner_4.png?itok=yZBHylwd)
我们又见面了，在上一篇 [在 KVM 中测试 IPv6 网络：第 1 部分][1] 中，我们学习了有关 IPv6 私有地址的内容。今天，我们将使用 KVM 创建一个网络，去测试上一星期学习的 IPv6 的内容。

如果你想重新温习如何使用 KVM，可以查看 [在 KVM 中创建虚拟机：第 1 部分][2] 和 [在 KVM 中创建虚拟机：第 2 部分— 网络][3]。

### 在 KVM 中创建网络

在 KVM 中你至少需要两个虚拟机。当然了，如果你愿意，也可以创建更多的虚拟机。在我的系统中有 Fedora、Ubuntu、以及 openSUSE。去创建一个新的 IPv6 网络，在主虚拟机管理窗口中打开 Edit > Connection Details > Virtual Networks。点击左下角的绿色十字按钮去创建一个新的网络（图 1）。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/kvm-fig-1_0.png?itok=ruqjPXxd)
图 1：创建一个网络

给新网络输入一个名字，然后，点击 Forward 按钮。如果你愿意，也可以不创建 IPv4 网络。当你创建一个新的 IPv4 网络时，虚拟机管理器将不让你创建重复网络，或者是使用了一个无效地址。在我的宿主机 Ubuntu 系统上，有效的地址是以绿色高亮显示的，而无效地址是使用高亮的玫瑰红色调。在我的 openSUSE 机器上没有高亮颜色。启用或不启用 DHCP，以及创建或不创建一个静态路由，然后进入下一个窗口。

选中 "Enable IPv6 network address space definition"，然后输入你的私有地址范围。你可以使用任何你希望的 IPv6 地址类，但是要注意，不能将你的实验网络泄漏到公网上去。我们将使用非常好用的 IPv6 唯一本地地址（ULA），并且使用在 [Simple DNS Plus][4] 上的在线地址生成器，去创建我们的网络地址。拷贝 "Combined/CID" 地址到网络框中（图 2）。


![network address][6]

图 2：拷贝 "Combined/CID" 地址到网络框中

[使用已获授权][7]

虚拟机认为我的地址是无效的，因为，它显示了高亮的玫瑰红色。它做的对吗？我们使用 ipv6calc 去验证一下：
```
$ ipv6calc -qi fd7d:844d:3e17:f3ae::/64
Address type: unicast, unique-local-unicast, iid, iid-local
Registry for address: reserved(RFC4193#3.1)
Address type has SLA: f3ae
Interface identifier: 0000:0000:0000:0000
Interface identifier is probably manual set

```

ipv6calc 认为没有问题。如果感兴趣，你可以改变其中一个数字为无效的东西，比如字母 g，然后再试一次。（问 “如果…？”，试验和错误是最好的学习方法）。

我们继续进行，启用 DHCPv6（图 3）。你可以接受缺省值，或者输入一个你自己的设置值。

![](https://www.linux.com/sites/lcom/files/styles/floated_images/public/kvm-fig-3.png?itok=F-oAAtN9)

我们将跳过缺省路由定义这一步，继续进入下一屏，在那里我们将启用 “Isolated Virtual Network" 和 "Enable IPv6 internal routing/networking"。

### 虚拟机网络选择

现在，你可以配置你的虚拟机去使用新的网络。打开你的虚拟机，然后点击顶部左侧的 "i" 按钮去打开 "Show virtual hardware details" 屏幕。在 "Add Hardware" 列点击 NIC 按钮去打开网络选择器，然后选择你喜欢的新的 IPv6 网络。点击 Apply，然后重新启动。（或者使用你喜欢的方法去重新启动网络，或者更新你的 DHCP 租期。）

### 测试

ifconfig 告诉我们它做了什么？
```
$ ifconfig
ens3: flags=4163 UP,BROADCAST,RUNNING,MULTICAST mtu 1500
 inet 192.168.30.207 netmask 255.255.255.0
 broadcast 192.168.30.255
 inet6 fd7d:844d:3e17:f3ae::6314
 prefixlen 128 scopeid 0x0
 inet6 fe80::4821:5ecb:e4b4:d5fc
 prefixlen 64 scopeid 0x20

```

这是我们新的 ULA，fd7d:844d:3e17:f3ae::6314，它是自动生成的本地链路地址。如果你有兴趣，可以 ping 一下，ping 网络上的其它虚拟机：
```
vm1 ~$ ping6 -c2 fd7d:844d:3e17:f3ae::2c9f
PING fd7d:844d:3e17:f3ae::2c9f(fd7d:844d:3e17:f3ae::2c9f) 56 data bytes
64 bytes from fd7d:844d:3e17:f3ae::2c9f: icmp_seq=1 ttl=64 time=0.635 ms
64 bytes from fd7d:844d:3e17:f3ae::2c9f: icmp_seq=2 ttl=64 time=0.365 ms

vm2 ~$ ping6 -c2 fd7d:844d:3e17:f3ae:a:b:c:6314
PING fd7d:844d:3e17:f3ae:a:b:c:6314(fd7d:844d:3e17:f3ae:a:b:c:6314) 56 data bytes
64 bytes from fd7d:844d:3e17:f3ae:a:b:c:6314: icmp_seq=1 ttl=64 time=0.744 ms
64 bytes from fd7d:844d:3e17:f3ae:a:b:c:6314: icmp_seq=2 ttl=64 time=0.364 ms

```

当你努力去理解子网时，这是一个提供给你的快速、易用的尝试不同地址是否可以正常工作的方法。你可以给单个接口分配多个 IP 地址，然后 ping 它们去看一下会发生什么。在一个 ULA 中，接口，或者主机是 IP 地址的最后四部分，因此，你可以在那里做任何事情，只要它们在同一个子网中即可，在那个例子中是 f3ae。在我的其中一个虚拟机上，我只改变了这个示例的接口 ID，以展示使用这四个部分，你可以做任何你想做的事情：
```
vm1 ~$ sudo /sbin/ip -6 addr add fd7d:844d:3e17:f3ae:a:b:c:6314 dev ens3

vm2 ~$ ping6 -c2 fd7d:844d:3e17:f3ae:a:b:c:6314
PING fd7d:844d:3e17:f3ae:a:b:c:6314(fd7d:844d:3e17:f3ae:a:b:c:6314) 56 data bytes
64 bytes from fd7d:844d:3e17:f3ae:a:b:c:6314: icmp_seq=1 ttl=64 time=0.744 ms
64 bytes from fd7d:844d:3e17:f3ae:a:b:c:6314: icmp_seq=2 ttl=64 time=0.364 ms

```

现在，尝试使用不同的子网，在下面的示例中使用了 f4ae 代替 f3ae：
```
$ ping6 -c2 fd7d:844d:3e17:f4ae:a:b:c:6314
PING fd7d:844d:3e17:f4ae:a:b:c:6314(fd7d:844d:3e17:f4ae:a:b:c:6314) 56 data bytes
From fd7d:844d:3e17:f3ae::1 icmp_seq=1 Destination unreachable: No route
From fd7d:844d:3e17:f3ae::1 icmp_seq=2 Destination unreachable: No route

```

这也是练习路由的好机会，以后，我们将专门做一期，如何在不使用 DHCP 情况下实现自动寻址。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/11/testing-ipv6-networking-kvm-part-2

作者：[CARLA SCHRODER][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/learn/intro-to-linux/2017/11/testing-ipv6-networking-kvm-part-1
[2]:https://www.linux.com/learn/intro-to-linux/2017/5/creating-virtual-machines-kvm-part-1
[3]:https://www.linux.com/learn/intro-to-linux/2017/5/creating-virtual-machines-kvm-part-2-networking
[4]:http://simpledns.com/private-ipv6.aspx
[5]:/files/images/kvm-fig-2png
[6]:https://www.linux.com/sites/lcom/files/styles/floated_images/public/kvm-fig-2.png?itok=gncdPGj- "network address"
[7]:https://www.linux.com/licenses/category/used-permission
