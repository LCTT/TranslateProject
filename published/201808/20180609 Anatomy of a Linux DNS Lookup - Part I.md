Linux DNS 查询剖析（第一部分）
======

我经常与虚拟机集群打交道（[文1][3]、[文2][4]、[文3][5]、[文4][6]、[文5][7]、[文6][8]），因此最终花费了大量时间试图掌握 [DNS 查询][9]的工作原理。遇到问题时，我只是不求甚解的使用 StackOverflow 上的“解决方案”，而不知道它们为什么有时工作，有时不工作。

最终我对此感到了厌倦，决定一并找出所有问题的原因。我没有在网上找到完整的指南，我问过一些同事，他们不知所以然（或许是问题太具体了）。

既然如此，我开始自己写这样的手册。

结果发现，“Linux 执行一次 DNS 查询”这句话的背后有相当多的工作。

![linux-dns-0](https://zwischenzugs.files.wordpress.com/2018/06/linux-dns-0.png?w=121)

_“究竟有多难呢？”_

**本系列文章试图将 Linux 主机上程序获取（域名对应的） IP 地址的过程及期间涉及的组件进行分块剖析。**如果不理解这些块的协同工作方式，调试解决 `dnsmasq`、`vagrant landrush` 和 `resolvconf` 等相关的问题会让人感到眼花缭乱。

同时这也是一份有价值的说明，指出原本很简单的东西是如何随着时间的推移变得相当复杂。在弄清楚 DNS 查询的原理的过程中，我了解了大量不同的技术及其发展历程。

我甚至编写了一些[自动化脚本][10]，可以让我在虚拟机中进行实验。欢迎读者参与贡献或勘误。

**请注意，本系列主题并不是“DNS 工作原理”**，而是与查询 Linux 主机配置的真实 DNS 服务器（这里假设查询了一台 DNS 服务器，但后面你会看到有时并不需要）相关的内容，以及如何确定使用哪个查询结果，或者如何使用其它方式确定 IP 地址。

### 1) 其实并没有名为“DNS 查询”的系统调用

![linux-dns-1](https://zwischenzugs.files.wordpress.com/2018/06/linux-dns-1.png?w=121)

_工作方式并非如此_ 

**首先要了解的一点是，Linux 上并没有一个单独的方法可以完成 DNS 查询工作**；没有一个有这样的明确接口的核心<ruby>系统调用<rt>system call</rt></ruby>。

不过，有一个标准 C 库函数调用 [`getaddrinfo`][2]，不少程序使用了该调用；但不是所有程序或应用都使用该调用！

让我们看一下两个简单的标准程序：`ping` 和 `host`：

```
root@linuxdns1:~# ping -c1 bbc.co.uk | head -1
PING bbc.co.uk (151.101.192.81) 56(84) bytes of data.
```

```
root@linuxdns1:~# host bbc.co.uk | head -1
bbc.co.uk has address 151.101.192.81
```

对于同一个域名，两个程序得到的 IP 地址是相同的；那么它们是使用同样的方法得到结果的吧？

事实并非如此。

下面文件给出了我主机上 `ping` 对应的 DNS 相关的系统调用：

```
root@linuxdns1:~# strace -e trace=open -f ping -c1 google.com
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
open("/lib/x86_64-linux-gnu/libcap.so.2", O_RDONLY|O_CLOEXEC) = 3
open("/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/etc/resolv.conf", O_RDONLY|O_CLOEXEC) = 4
open("/etc/resolv.conf", O_RDONLY|O_CLOEXEC) = 4
open("/etc/nsswitch.conf", O_RDONLY|O_CLOEXEC) = 4
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 4
open("/lib/x86_64-linux-gnu/libnss_files.so.2", O_RDONLY|O_CLOEXEC) = 4
open("/etc/host.conf", O_RDONLY|O_CLOEXEC) = 4
open("/etc/hosts", O_RDONLY|O_CLOEXEC)  = 4
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 4
open("/lib/x86_64-linux-gnu/libnss_dns.so.2", O_RDONLY|O_CLOEXEC) = 4
open("/lib/x86_64-linux-gnu/libresolv.so.2", O_RDONLY|O_CLOEXEC) = 4
PING google.com (216.58.204.46) 56(84) bytes of data.
open("/etc/hosts", O_RDONLY|O_CLOEXEC)  = 4
64 bytes from lhr25s12-in-f14.1e100.net (216.58.204.46): icmp_seq=1 ttl=63 time=13.0 ms
[...]
```

下面是 `host` 对应的系统调用:

```
$ strace -e trace=open -f host google.com
[...]
[pid  9869] open("/usr/share/locale/en_US.UTF-8/LC_MESSAGES/libdst.cat", O_RDONLY) = -1 ENOENT (No such file or directory)
[pid  9869] open("/usr/share/locale/en/libdst.cat", O_RDONLY) = -1 ENOENT (No such file or directory)
[pid  9869] open("/usr/share/locale/en/LC_MESSAGES/libdst.cat", O_RDONLY) = -1 ENOENT (No such file or directory)
[pid  9869] open("/usr/lib/ssl/openssl.cnf", O_RDONLY) = 6
[pid  9869] open("/usr/lib/x86_64-linux-gnu/openssl-1.0.0/engines/libgost.so", O_RDONLY|O_CLOEXEC) = 6[pid  9869] open("/etc/resolv.conf", O_RDONLY) = 6
google.com has address 216.58.204.46
[...]
```

可以看出 `ping` 打开了 `nsswitch.conf` 文件，但 `host` 没有；但两个程序都打开了 `/etc/resolv.conf` 文件。

下面我们依次查看这两个 `.conf` 扩展名的文件。

### 2) NSSwitch 与 `/etc/nsswitch.conf`

我们已经确认应用可以自主决定选用哪个 DNS 服务器。很多应用（例如 `ping`）通过配置文件 `/etc/nsswitch.conf` （根据具体实现[^1] ）参考 NSSwitch 完成选择。

[^1]: `ping` 实现的变种之多令人惊叹。我 _不_ 希望在这里讨论过多。

NSSwitch 不仅用于 DNS 查询，例如，还用于密码与用户信息查询。

NSSwitch 最初是 Solaris OS 的一部分，可以让应用无需硬编码查询所需的文件或服务，而是在其它集中式的、无需应用开发人员管理的配置文件中找到。

下面是我的 `nsswitch.conf`：

```
passwd:         compat
group:          compat
shadow:         compat
gshadow:        files
hosts: files dns myhostname
networks:       files
protocols:      db files
services:       db files
ethers:         db files
rpc:            db files
netgroup:       nis
```

我们需要关注的是 `hosts` 行。我们知道 `ping` 用到 `nsswitch.conf` 文件，那么我们修改这个文件（的 `hosts` 行），看看能够如何影响 `ping`。

#### 修改 `nsswitch.conf`， `hosts` 行仅保留 `files`

如果你修改 `nsswitch.conf`，将 `hosts` 行仅保留 `files`：

```
hosts: files
```

此时， `ping` 无法获取 google.com 对应的 IP 地址：

```
$ ping -c1 google.com
ping: unknown host google.com
```

但 `localhost` 的解析不受影响：

```
$ ping -c1 localhost
PING localhost (127.0.0.1) 56(84) bytes of data.
64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.039 ms
```

此外，`host` 命令正常返回：

```
$ host google.com
google.com has address 216.58.206.110
```

毕竟如我们之前看到的那样，`host` 不受 `nsswitch.conf` 影响。

#### 修改 `nsswitch.conf`， `hosts` 行仅保留 `dns`

如果你修改 `nsswitch.conf`，将 `hosts` 行仅保留 `dns`：

```
hosts: dns
```

此时，google.com 的解析恢复正常：

```
$ ping -c1 google.com
PING google.com (216.58.198.174) 56(84) bytes of data.
64 bytes from lhr25s10-in-f174.1e100.net (216.58.198.174): icmp_seq=1 ttl=63 time=8.01 ms
```

但 `localhost` 无法解析：

```
$ ping -c1 localhost
ping: unknown host localhost
```

下图给出默认 NSSwitch 中 `hosts` 行对应的查询逻辑：

![linux-dns-2 (1)](https://zwischenzugs.files.wordpress.com/2018/06/linux-dns-2-11.png?w=525)

_我的 `hosts:` 配置是 `nsswitch.conf` 给出的默认值_ 

### 3) `/etc/resolv.conf`

我们已经知道 `host` 和 `ping` 都使用 `/etc/resolv.conf` 文件。

下面给出我主机的 `/etc/resolv.conf` 文件内容：

```
# Dynamic resolv.conf(5) file for glibc resolver(3) generated by resolvconf(8)
#     DO NOT EDIT THIS FILE BY HAND -- YOUR CHANGES WILL BE OVERWRITTEN
nameserver 10.0.2.3
```

先忽略前两行，后面我们会回过头来看这部分（它们很重要，但你还需要一些知识储备）。

其中 `nameserver` 行指定了查询用到的 DNS 服务器。

如果将该行注释掉：

```
#nameserver 10.0.2.3
```

再次运行：

```
$ ping -c1 google.com
ping: unknown host google.com
```

解析失败了，这是因为没有可用的名字服务器 [^2]。

[^2]: 另一个需要注意的地方： `host` 在没有指定 nameserver 的情况下会尝试 127.0.0.1:53。

该文件中还可以使用其它选项。例如，你可以在 `resolv.conf` 文件中增加如下行：

```
search com
```

然后执行 `ping google` （不写 `.com`）

```
$ ping google
PING google.com (216.58.204.14) 56(84) bytes of data.
```

程序会自动为你尝试 `.com` 域。

### 第一部分总结

第一部分到此结束，下一部分我们会了解 `resolv.conf` 文件是如何创建和更新的。

下面总结第一部分涵盖的内容：

*   操作系统中并不存在“DNS 查询”这个系统调用
*   不同程序可能采用不同的策略获取名字对应的 IP 地址
    *   例如, `ping` 使用 `nsswitch`，后者进而使用（或可以使用） `/etc/hosts`、`/etc/resolv.conf` 以及主机名得到解析结果
*   `/etc/resolv.conf` 用于决定：
    *   查询什么地址（LCTT 译注：这里可能指 `search` 带来的影响）
    *   使用什么 DNS 服务器执行查询

如果你曾认为 DNS 查询很复杂，请跟随这个系列学习吧。

--------------------------------------------------------------------------------

via: https://zwischenzugs.com/2018/06/08/anatomy-of-a-linux-dns-lookup-part-i/

作者：[dmatech][a]
译者：[pinewall](https://github.com/pinewall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/dmatech2
[1]:https://zwischenzugs.com/2018/06/18/anatomy-of-a-linux-dns-lookup-part-ii/
[2]:http://man7.org/linux/man-pages/man3/getaddrinfo.3.html
[3]:https://zwischenzugs.com/2017/10/31/a-complete-chef-infrastructure-on-your-laptop/
[4]:https://zwischenzugs.com/2017/03/04/a-complete-openshift-cluster-on-vagrant-step-by-step/
[5]:https://zwischenzugs.com/2017/03/04/migrating-an-openshift-etcd-cluster/
[6]:https://zwischenzugs.com/2017/03/04/1-minute-multi-node-vm-setup/
[7]:https://zwischenzugs.com/2017/03/18/clustered-vm-testing-how-to/
[8]:https://zwischenzugs.com/2017/10/27/ten-things-i-wish-id-known-before-using-vagrant/
[9]:https://zwischenzugs.com/2017/10/21/openshift-3-6-dns-in-pictures/
[10]:https://github.com/ianmiell/shutit-linux-dns/blob/master/linux_dns.py
