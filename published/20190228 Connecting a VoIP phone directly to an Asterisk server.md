[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10620-1.html)
[#]: subject: (Connecting a VoIP phone directly to an Asterisk server)
[#]: via: (https://feeding.cloud.geek.nz/posts/connecting-voip-phone-directly-to-asterisk-server/)
[#]: author: (François Marier https://fmarier.org/)

将 VoIP 电话直接连接到 Asterisk 服务器
======

在我的 [Asterisk][1] 服务器上正好有张以太网卡。由于我只用了其中一个，因此我决定将我的 VoIP 电话从本地网络交换机换成连接到 Asterisk 服务器。

主要的好处是这台运行着未知质量的专有软件的电话，在我的一般家庭网络中不能用了。最重要的是，它不再能访问互联网，因此无需手动配置防火墙。

以下是我配置的方式。

### 私有网络配置

在服务器上，我在 `/etc/network/interfaces` 中给第二块网卡分配了一个静态 IP：

```
auto eth1
iface eth1 inet static
    address 192.168.2.2
    netmask 255.255.255.0
```

在 VoIP 电话上，我将静态 IP 设置成 `192.168.2.3`，DNS 服务器设置成 `192.168.2.2`。我接着将 SIP 注册 IP 地址设置成 `192.168.2.2`。

DNS 服务器实际上是一个在 Asterisk 服务器上运行的 [unbound 守护进程][2]。我唯一需要更改的配置是监听第二张网卡，并允许 VoIP 电话进入：

```
server:
    interface: 127.0.0.1
    interface: 192.168.2.2
    access-control: 0.0.0.0/0 refuse
    access-control: 127.0.0.1/32 allow
    access-control: 192.168.2.3/32 allow
```

最后，我在 `/etc/network/iptables.up.rules` 中打开了服务器防火墙上的正确端口：

```
-A INPUT -s 192.168.2.3/32 -p udp --dport 5060 -j ACCEPT
-A INPUT -s 192.168.2.3/32 -p udp --dport 10000:20000 -j ACCEPT
```

### 访问管理页面

现在 VoIP 电话不能在本地网络上用了，因此无法访问其管理页面。从安全的角度来看，这是一件好事，但它有点不方便。

因此，在通过 ssh 连接到 Asterisk 服务器之后，我将以下内容放在我的 `~/.ssh/config` 中以便通过 `http://localhost:8081` 访问管理页面：

```
Host asterisk
    LocalForward 8081 192.168.2.3:80
```

--------------------------------------------------------------------------------

via: https://feeding.cloud.geek.nz/posts/connecting-voip-phone-directly-to-asterisk-server/

作者：[François Marier][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fmarier.org/
[b]: https://github.com/lujun9972
[1]: https://www.asterisk.org/
[2]: https://feeding.cloud.geek.nz/posts/setting-up-your-own-dnssec-aware/
