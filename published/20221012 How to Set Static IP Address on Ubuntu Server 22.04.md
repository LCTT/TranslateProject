[#]: subject: "How to Set Static IP Address on Ubuntu Server 22.04"
[#]: via: "https://www.linuxtechi.com/static-ip-address-on-ubuntu-server/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15181-1.html"

如何在 Ubuntu 服务器 22.04 上设置静态 IP 地址
======

![](https://img.linux.net.cn/data/attachment/album/202210/27/091312aohaix6g6kay68xa.jpg)

> 在这篇文章中，我们将介绍如何在 Ubuntu 服务器 22.04 上设置静态 IP 地址。

强烈建议在 Linux 服务器上使用静态 IP，因为它会在重启后保持不变。静态 IP 对邮件服务器、Web 服务器和文件服务器等服务器起着重要作用。

**准备条件**

* 最小安装的 Ubuntu 服务器 22.04
* 具有 `sudo` 管理员权限的普通用户

在 Ubuntu 服务器 22.04 中，网络由 netplan 程序控制，因此我们将使用 netplan 在 Ubuntu 服务器上配置静态 IP 地址。

注意：我们不能使用 [nmcli 程序][1]，因为它不是 Ubuntu 服务器上默认安装的一部分。

### 在 Ubuntu 服务器 22.04 上设置静态 IP 地址

登录到你的 Ubuntu 服务器 22.04，查找 netplan 配置文件。它位于 `/etc/netplan` 目录下。

```
$ cd /etc/netplan/
$ ls -l
total 4
-rw-r--r-- 1 root root 116 Oct 12 04:03 00-installer-config.yaml
$
```

运行以下 `cat` 命令以查看 `00-installer-config.yaml` 的内容。

注意：配置文件的名称可能因你的设置而异。由于它是一个 yaml 文件，因此请确保在编辑时保持缩进和语法。

```
$ cat 00-installer-config.yaml
```

输出：

![Default-Content-netplan-ubuntu-server][2]

根据上面的输出，它说我们有 `ens33` 接口，它正在从 DHCP 服务器获取 IP。查看接口名称的另一种方法是通过 `ip` 命令。

现在，要配置静态 IP 代替 DHCP，使用 `vi` 或 `nano` 编辑器编辑 netplan 配置文件并添加以下内容。

```
$ sudo vi 00-installer-config.yaml
# This is the network config written by 'subiquity'
network:
  renderer: networkd
  ethernets:
    ens33:
      addresses:
        - 192.168.1.247/24
      nameservers:
        addresses: [4.2.2.2, 8.8.8.8]
      routes:
        - to: default
          via: 192.168.1.1
  version: 2
```

保存并关闭文件。

![Updated-Netplan-Config-File-Content-Ubuntu-Server][3]

在上面的文件中，我们使用了以下内容，

* `ens33` 为接口名称
* 用于设置静态 IP 的地址
* `nameservers` 用于指定 DNS 服务器的 IP
* 用于指定默认网关的路由

注意：根据你的环境更改 IP 详细信息和接口名称。

要是上述修改生效，请使用以下 `netplan` 命令应用这些更改：

```
$ sudo netplan apply
```

运行以下 IP 命令查看接口上的 IP 地址：

```
$ ip addr show ens33
```

要查看默认路由，请运行：

```
$ ip route show
```

上述命令的输出。

![ip-addr-route-command-output-ubuntu-server][4]

完美，以上命令的输出确认静态 IP 和路由配置成功。

这就是这篇文章的全部内容。请在下面的评论部分发表你的问题和反馈。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/static-ip-address-on-ubuntu-server/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/configure-ip-with-nmcli-command-linux/
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/10/Default-Content-netplan-ubuntu-server.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/10/Updated-Netplan-Config-File-Content-Ubuntu-Server.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/10/ip-addr-route-command-output-ubuntu-server.png
