什么是 CGManager？[][1]
============================================================

CGManager 是一个核心的特权守护进程，通过一个简单的 D-Bus API 管理你所有的 cgroup。它被设计用来处理嵌套的 LXC 容器以及接受无特权的请求，包括解析用户名称空间的 UID/GID。

# 组件[][2]

### cgmanager[][3]

这个守护进程在主机上运行，​​将 cgroupfs 挂载到一个独立的挂载名称空间（所以它不能从主机上看到），绑定 /sys/fs/cgroup/cgmanager/sock 用于传入的 D-Bus 查询，并通常处理主机上直接运行的所有客户端。

cgmanager 同时接受使用 D-Bus + SCM 凭证的身份验证请求，用于在命名空间之间转换 uid、gid 和 pid，或者使用简单的 “unauthenticated”（只是初始的 ucred）D-Bus 来查询来自主机级别的查询。

### cgproxy[][4]

你可能会在两种情况下看到这个守护进程运行。在主机上，如果你的内核小于 3.8（没有 pidns 连接支持）或在容器中（只有 cgproxy 运行）。

cgproxy 本身并不做任何 cgroup 配置更改，而是如其名称所示，代理请求给主 cgmanager 进程。

这是必要的，所以一个进程可以直接使用 D-Bus（例如使用 dbus-send）与 /sys/fs/cgroup/cgmanager/sock 进行通信。

之后 cgproxy 将从该查询中得到 ucred，并对真正的 cgmanager 套接字进行经过身份验证的 SCM 查询，并通过 ucred 结构体传递参数，使它们能够正确地转换为 cgmanager 可以理解的主机命名空间 。

### cgm[][5]

一个简单的命令行工具，与 D-Bus 服务通信，并允许你从命令行执行所有常见的 cgroup 操作。

# 通信协议[][6]

如上所述，cgmanager 和 cgproxy 使用 D-Bus。建议外部客户端（所以不要是 cgproxy）使用标准的 D-Bus API，不要试图实现 SCM creds 协议，因为它是不必要的，并且容易出错。

相反，只要简单假设与 /sys/fs/cgroup/cgmanager/sock 的通信总是正确的。

cgmanager API 仅在独立的 D-Bus 套接字上可用，cgmanager 本身不连接到系统总线，所以 cgmanager/cgproxy 不要求有运行中的 dbus 守护进程。

你可以在[这里][7]阅读更多关于 D-Bus API。

# Licensing[][8]

CGManager 是免费软件，大部分代码是根据 GNU LGPLv2.1+ 许可条款发布的，一些二进制文件是在 GNU GPLv2 许可下发布的。

该项目的默认许可证是 GNU LGPLv2.1+

# Support[][9]

CGManager 的稳定版本支持依赖于 Linux 发行版以及它们自己承诺推出稳定修复和安全更新。

你可以从 [Canonical Ltd][10] 获得对 Ubuntu LTS 版本的 CGManager 的商业支持。

--------------------------------------------------------------------------------

via: https://linuxcontainers.org/cgmanager/introduction/

作者：[Canonical Ltd. ][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.canonical.com/
[1]:https://linuxcontainers.org/cgmanager/introduction/#whats-cgmanager
[2]:https://linuxcontainers.org/cgmanager/introduction/#components
[3]:https://linuxcontainers.org/cgmanager/introduction/#cgmanager
[4]:https://linuxcontainers.org/cgmanager/introduction/#cgproxy
[5]:https://linuxcontainers.org/cgmanager/introduction/#cgm
[6]:https://linuxcontainers.org/cgmanager/introduction/#communication-protocol
[7]:https://linuxcontainers.org/cgmanager/dbus-api/
[8]:https://linuxcontainers.org/cgmanager/introduction/#licensing
[9]:https://linuxcontainers.org/cgmanager/introduction/#support
[10]:http://www.canonical.com/
