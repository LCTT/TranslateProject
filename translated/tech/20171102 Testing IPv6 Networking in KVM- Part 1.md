在 KVM 中测试 IPv6 网络（第 1 部分）
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ipv6-networking.png?itok=swQPV8Ey)

要理解 IPv6 地址是如何工作的，没有比亲自动手去实践更好的方法了，在 KVM 中配置一个小的测试实验室非常容易 —— 也很有趣。这个系列的文章共有两个部分，我们将学习关于 IPv6 私有地址的知识，以及如何在 KVM 中配置测试网络。

### QEMU/KVM/虚拟机管理器

我们先来了解什么是 KVM。在这里，我将使用 KVM 来表示 QEMU、KVM、以及虚拟机管理器的一个组合，虚拟机管理器在 Linux 发行版中一般内置了。简单解释就是，QEMU 模拟硬件，而 KVM 是一个内核模块，它在你的 CPU 上创建一个 “访客领地”，并去管理它们对内存和 CPU 的访问。虚拟机管理器是一个涵盖虚拟化和管理程序的图形工具。

但是你不能被图形界面下 “点击” 操作的方式 "缠住" ，因为，它们也有命令行工具可以使用 —— 比如 virsh 和 virt-install。

如果你在使用 KVM 方面没有什么经验，你可以从 [在 KVM 中创建虚拟机：第 1 部分][1] 和 [在 KVM 中创建虚拟机：第 2 部分 - 网络][2] 开始学起。

### IPv6 唯一本地地址

在 KVM 中配置 IPv6 网络与配置 IPv4 网络很类似。它们的主要不同在于这些怪异的长地址。[上一次][3]，我们讨论了 IPv6 地址的不同类型。其中有一个 IPv6 单播地址类，fc00::/7（详细情况请查阅 [RFC 4193][4]），它类似于 IPv4 中的私有地址 —— 10.0.0.0/8、172.16.0.0/12、和 192.168.0.0/16。

下图解释了这个唯一本地地址空间的结构。前 48 位定义了前缀和全局 ID，随后的 16 位是子网，剩余的 64 位是接口 ID：
```
| 7 bits |1| 40 bits | 16 bits | 64 bits |
+--------|-+------------|-----------|----------------------------+
| Prefix |L| Global ID | Subnet ID | Interface ID |
+--------|-+------------|-----------|----------------------------+

```

下面是另外一种表示方法，它可能更有助于你理解这些地址是如何管理的：
```
| Prefix | Global ID | Subnet ID | Interface ID |
+--------|--------------|-------------|----------------------+
| fd | 00:0000:0000 | 0000 | 0000:0000:0000:0000 |
+--------|--------------|-------------|----------------------+

```

fc00::/7 共分成两个 /8 地址块，fc00::/8 和 fd00::/8。fc00::/8 是为以后使用保留的。因此，唯一本地地址通常都是以 fd 开头的，而剩余部分是由你使用的。L 位，也就是第八位，它总是设置为 1，这样它可以表示为 fd00::/8。设置为 0 时，它就表示为 fc00::/8。你可以使用 `subnetcalc` 来看到这些东西：
```
$ subnetcalc fd00::/8 -n
Address = fd00::
 fd00 = 11111101 00000000

$ subnetcalc fc00::/8 -n
Address = fc00::
 fc00 = 11111100 00000000

```

RFC 4193 要求地址必须随机产生。你可以用你选择的任何方法来造出个地址，只要它们以 `fd` 打头就可以，因为 IPv6 范围非常大，它不会因为地址耗尽而无法使用。当然，最佳实践还是按 RFCs 的要求来做。地址不能按顺序分配或者使用众所周知的数字。RFC 4193 包含一个构建伪随机地址生成器的算法，或者你可以在线找到任何生成器产生的数字。

唯一本地地址不像全局单播地址（它由你的因特网服务提供商分配）那样进行中心化管理，即使如此，发生地址冲突的可能性也是非常低的。当你需要去合并一些本地网络或者想去在不相关的私有网络之间路由时，这是一个非常好的优势。

在同一个子网中，你可以混用唯一本地地址和全局单播地址。唯一本地地址是可路由的，并且它并不会因此要求对路由器做任何调整。但是，你应该在你的边界路由器和防火墙上配置为不允许它们离开你的网络，除非是在不同位置的两个私有网络之间。

RFC4193 建议，不要混用全局单播地址的 AAAA 和 PTR 记录，因为虽然它们重复的机率非常低，但是并不能保证它们就是独一无二的。就像我们使用的 IPv4 地址一样，要保持你本地的私有名称服务和公共名称服务的独立。将本地名称服务使用的 Dnsmasq 和公共名称服务使用的 BIND 组合起来，是一个在 IPv4 网络上经过实战检验的可靠组合，这个组合也同样适用于 IPv6 网络。

### 伪随机地址生成器

在线地址生成器的一个示例是 [本地 IPv6 地址生成器][5]。你可以在线找到许多这样很酷的工具。你可以使用它来为你创建一个新地址，或者使用它在你的现有全局 ID 下为你创建子网。

下周我们将讲解如何在 KVM 中配置这些 IPv6 的地址，并现场测试它们。

通过来自 Linux 基金会和 edX 的免费在线课程 ["Linux 入门" ][6] 学习更多的 Linux 知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/11/testing-ipv6-networking-kvm-part-1

作者：[Carla Schroder][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/learn/intro-to-linux/2017/5/creating-virtual-machines-kvm-part-1
[2]:https://www.linux.com/learn/intro-to-linux/2017/5/creating-virtual-machines-kvm-part-2-networking
[3]:https://www.linux.com/learn/intro-to-linux/2017/10/calculating-ipv6-subnets-linux
[4]:https://tools.ietf.org/html/rfc4193
[5]:https://www.ultratools.com/tools/rangeGenerator
[6]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
