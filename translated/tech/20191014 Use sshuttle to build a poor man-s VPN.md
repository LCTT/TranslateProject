[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use sshuttle to build a poor man’s VPN)
[#]: via: (https://fedoramagazine.org/use-sshuttle-to-build-a-poor-mans-vpn/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

使用 shuttle 构建一个穷人的 VPN
======

![][1]

如今，企业网络经常使用 VPN（虚拟专用网络）[来保证员工通信安全][2]。但是，使用的协议有时会降低性能。如果你可以使用 SSH 连接远程主机，那么你可以设置端口转发。但这可能会很痛苦，尤其是在你需要与该网络上的许多主机一起使用的情况下。试试 **sshuttle**，它可以通过 SSH 访问来设置快速简易的 VPN。请继续阅读以获取有关如何使用它的更多信息。

sshuttle 正是针对上述情况而设计的。远程端的唯一要求是主机必须有可用的 Python。这是因为 sshuttle 会构造并运行一些 Python 代码来帮助传输数据。

### 安装 sshuttle

sshuttle 被打包在官方仓库中，因此很容易安装。打开一个终端，并使用[使用 sudo][3] 运行以下命令：

```
$ sudo dnf install sshuttle
```

安装后，你可能会发现手册页很有趣：

```
$ man sshuttle
```

### 设置 VPN

最简单的情况就是将所有流量转发到远程网络。这不一定是一个疯狂的想法，尤其是如果你不在自己家里这样的受信任的本地网络中。将 _-r_ 选项与 SSH 用户名和远程主机名一起使用：

```
$ sshuttle -r username@remotehost 0.0.0.0/0
```

但是，你可能希望将 VPN 限制为特定子网，而不是所有网络流量。 （有关子网的完整讨论超出了本文的范围，但是你可以在 [Wikipedia][4] 上阅读更多内容。）假设你的办公室内部使用了预留的 A 类子网 10.0.0.0 和预留的 B 类子网 172.16.0.0。上面的命令变为：

```
$ sshuttle -r username@remotehost 10.0.0.0/8 172.16.0.0/16
```

这非常适合通过 IP 地址访问远程网络的主机。但是，如果你的办公室是一个拥有大量主机的大型网络，该怎么办？名称可能更方便，甚至是必须的。不用担心，sshuttle 还可以使用 _–dns_ 选项转发 DNS 查询：

```
$ sshuttle --dns -r username@remotehost 10.0.0.0/8 172.16.0.0/16
```

要使 sshuttle 已守护进程运行，请加上 _-D_ 选项。它会以 syslog 兼容的日志格式发送到 systemd 日志中。

根据本地和远程系统的功能，可以将 shuttle 用于基于 IPv6 的 VPN。如果需要，你还可以设置配置文件并将其与系统启动集成。如果你想阅读更多有关 sshuttle 及其工作方式的信息，请[查看官方文档][5]。要查看代码，请[进入 GitHub 页面][6]。

* * *

_由 _[_Kurt Cotoaga_][7]_ 拍摄并发表在 _[_Unsplash_][8]_ 上。_

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-sshuttle-to-build-a-poor-mans-vpn/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/sshuttle-816x345.jpg
[2]: https://en.wikipedia.org/wiki/Virtual_private_network
[3]: https://fedoramagazine.org/howto-use-sudo/
[4]: https://en.wikipedia.org/wiki/Subnetwork
[5]: https://sshuttle.readthedocs.io/en/stable/index.html
[6]: https://github.com/sshuttle/sshuttle
[7]: https://unsplash.com/@kydroon?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/s/photos/shuttle?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
