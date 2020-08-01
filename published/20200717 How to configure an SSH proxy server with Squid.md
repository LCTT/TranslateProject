[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12476-1.html)
[#]: subject: (How to configure an SSH proxy server with Squid)
[#]: via: (https://fedoramagazine.org/configure-ssh-proxy-server/)
[#]: author: (Curt Warfield https://fedoramagazine.org/author/rcurtiswarfield/)

如何使用 Squid 配置 SSH 代理服务器
======

![](https://img.linux.net.cn/data/attachment/album/202008/01/162730tx0czx60xs6wz00c.jpg)

有时你无法从本地连接到 SSH 服务器。还有时，你可能想为 SSH 连接添加额外的安全层。在这些情况下，通过代理服务器连接到 SSH 服务器是一种解决方式。

[Squid][2] 是提供缓存和代理服务的全功能代理服务器应用。它通常用于在浏览过程中重用和缓存以前请求的网页来帮助缩短响应时间并减少网络带宽。

但是在本篇中，你将配置 Squid 作为 SSH 代理服务器，因为它是强大的受信任代理服务器，易于配置。

### 安装和配置

使用 [sudo][3] 安装 squid 软件包：

```
$ sudo dnf install squid -y
```

squid 配置文件非常庞大，但是我们只需要配置其中一些。Squid 使用访问控制列表来管理连接。

编辑 `/etc/squid/squid.conf` 文件，确保你有下面解释的两行。

首先，指定你的本地 IP 网络。默认配置文件已经列出了最常用的，但是如果没有，你需要添加你的配置。例如，如果你的本地 IP 网络范围是 192.168.1.X，那么这行会是这样：

```
acl localnet src 192.168.1.0/24
```

接下来，添加以下行，将 SSH 端口添加为安全端口：

```
acl Safe_ports port 22
```

保存该文件。现在启用并重启 squid 代理服务：

```
$ sudo systemctl enable squid
$ sudo systemctl restart squid
```

squid 代理默认监听 3128 端口。配置 firewalld 允许此服务：

```
$ sudo firewall-cmd --add-service=squid --perm
$ sudo firewall-cmd --reload
```

### 测试 ssh 代理连接

要通过 ssh 代理服务器连接到服务器，我们将使用 `netcat`。

如果尚未安装 `nmap-ncat`，请安装它：

```
$ sudo dnf install nmap-ncat -y
```

这是标准 ssh 连接示例：

```
$ ssh user@example.com
```

这是使用 squid 代理服务器作为网关连接到该服务器的方式。

此示例假定 squid 代理服务器的 IP 地址为 192.168.1.63。你还可以使用 squid 代理服务器的主机名或 FQDN：

```
$ ssh user@example.com -o "ProxyCommand nc --proxy 192.168.1.63:3128 %h %p"
```

以下是这些选项的含义：

  * `ProxyCommand` – 告诉 ssh 使用代理命令。
  * `nc` – 用于建立与代理服务器连接的命令。这是 netcat 命令。
  * `%h` – 代理服务器的主机名或 IP 地址的占位符。
  * `%p` – 代理服务器端口号的占位符。

有很多方法可以配置 SSH 代理服务器，但这是入门​​的简单方法。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/configure-ssh-proxy-server/

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rcurtiswarfield/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/07/squid_ssh_proxy-816x345.png
[2]: http://www.squid-cache.org/
[3]: https://fedoramagazine.org/howto-use-sudo/
