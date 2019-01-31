[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10460-1.html)
[#]: subject: (Understanding /etc/services file in Linux)
[#]: via: (https://kerneltalks.com/linux/understanding-etc-services-file-in-linux/)
[#]: author: (kerneltalks https://kerneltalks.com)

理解 Linux 中的 /etc/services 文件
======

这篇文章将帮助你了解 Linux 中 `/etc/services` 文件，包括它的内容，格式以及重要性。

![/etc/services file in Linux][1]

*Linux 中的 /etc/services 文件*

Internet 守护程序（`ineted`）是 Linux 世界中的重要服务。它借助 `/etc/services` 文件来处理所有网络服务。在本文中，我们将向你介绍这个文件的内容，格式以及它对于 Linux 系统的意义。

`/etc/services` 文件包含网络服务和它们映射端口的列表。`inetd` 或 `xinetd` 会查看这些细节，以便在数据包到达各自的端口或服务有需求时，它会调用特定的程序。

作为普通用户，你可以查看此文件，因为文件一般都是可读的。要编辑此文件，你需要有 root 权限。

```
$ ll /etc/services
-rw-r--r--. 1 root root 670293 Jun  7  2013 /etc/services
```

### /etc/services 文件格式

```
service-name    port/protocol   [aliases..]  [#comment]
```

最后两个字段是可选的，因此用 `[` `]` 表示。

其中：

 * `service-name` 是网络服务的名称。例如 [telnet][2]、[ftp][3] 等。
 * `port/protocol` 是网络服务使用的端口（一个数值）和服务通信使用的协议（TCP/UDP）。
 * `alias` 是服务的别名。
 * `comment` 是你可以添加到服务的注释或说明。以 `#` 标记开头。

### /etc/services 文件示例

```
# 每行描述一个服务，形式如下：
#
# service-name  port/protocol  [aliases ...]   [# comment]

tcpmux          1/tcp                           # TCP port service multiplexer
rje             5/tcp                           # Remote Job Entry
echo            7/udp
discard         9/udp           sink null
```

在这里，你可以看到可选的最后两个字段的用处。`discard` 服务的别名为 `sink` 或 `null`。

--------------------------------------------------------------------------------

via: https://kerneltalks.com/linux/understanding-etc-services-file-in-linux/

作者：[kerneltalks][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://kerneltalks.com
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/kerneltalks.com/wp-content/uploads/2019/01/undestanding-etc-service-file-in-linux.png?ssl=1
[2]: https://kerneltalks.com/config/configure-telnet-server-linux/
[3]: https://kerneltalks.com/config/ftp-server-configuration-steps-rhel-6/
