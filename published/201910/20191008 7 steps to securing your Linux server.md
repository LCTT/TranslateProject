[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11444-1.html)
[#]: subject: (7 steps to securing your Linux server)
[#]: via: (https://opensource.com/article/19/10/linux-server-security)
[#]: author: (Patrick H. Mullins https://opensource.com/users/pmullins)

安全强化你的 Linux 服务器的七个步骤
======

> 通过七个简单的步骤来加固你的 Linux 服务器。

![](https://img.linux.net.cn/data/attachment/album/201910/11/094107k8skl8wwxq62pzld.jpg)

这篇入门文章将向你介绍基本的 Linux 服务器安全知识。虽然主要针对 Debian/Ubuntu，但是你可以将此处介绍的所有内容应用于其他 Linux 发行版。我也鼓励你研究这份材料，并在适用的情况下进行扩展。

### 1、更新你的服务器

保护服务器安全的第一件事是更新本地存储库，并通过应用最新的修补程序来升级操作系统和已安装的应用程序。

在 Ubuntu 和 Debian 上：

```
$ sudo apt update && sudo apt upgrade -y
```

在 Fedora、CentOS 或 RHEL：

```
$ sudo dnf upgrade
```

### 2、创建一个新的特权用户

接下来，创建一个新的用户帐户。永远不要以 root 身份登录服务器，而是创建你自己的帐户（用户），赋予它 `sudo` 权限，然后使用它登录你的服务器。

首先创建一个新用户：

```
$ adduser <username>
```

通过将 `sudo` 组（`-G`）附加（`-a`）到用户的组成员身份里，从而授予新用户帐户 `sudo` 权限：

```
$ usermod -a -G sudo <username>
```

### 3、上传你的 SSH 密钥

你应该使用 SSH 密钥登录到新服务器。你可以使用 `ssh-copy-id` 命令将[预生成的 SSH 密钥][2]上传到你的新服务器：

```
$ ssh-copy-id <username>@ip_address
```

现在，你无需输入密码即可登录到新服务器。

### 4、安全强化 SSH

接下来，进行以下三个更改：

* 禁用 SSH 密码认证
* 限制 root 远程登录
* 限制对 IPv4 或 IPv6 的访问

使用你选择的文本编辑器打开 `/etc/ssh/sshd_config` 并确保以下行：

```
PasswordAuthentication yes
PermitRootLogin yes
```

改成这样：

```
PasswordAuthentication no
PermitRootLogin no
```

接下来，通过修改 `AddressFamily` 选项将 SSH 服务限制为 IPv4 或 IPv6。要将其更改为仅使用 IPv4（对大多数人来说应该没问题），请进行以下更改：

```
AddressFamily inet
```

重新启动 SSH 服务以启用你的更改。请注意，在重新启动 SSH 服务之前，与服务器建立两个活动连接是一个好主意。有了这些额外的连接，你可以在重新启动 SSH 服务出错的情况下修复所有问题。

在 Ubuntu 上：

```
$ sudo service sshd restart
```

在 Fedora 或 CentOS 或任何使用 Systemd 的系统上：

```
$ sudo systemctl restart sshd
```

### 5、启用防火墙

现在，你需要安装防火墙、启用防火墙并对其进行配置，以仅允许你指定的网络流量通过。（Ubuntu 上的）[简单的防火墙][3]（UFW）是一个易用的 iptables 界面，可大大简化防火墙的配置过程。

你可以通过以下方式安装 UFW：

```
$ sudo apt install ufw
```

默认情况下，UFW 拒绝所有传入连接，并允许所有传出连接。这意味着服务器上的任何应用程序都可以访问互联网，但是任何尝试访问服务器的内容都无法连接。

首先，确保你可以通过启用对 SSH、HTTP 和 HTTPS 的访问来登录：

```
$ sudo ufw allow ssh
$ sudo ufw allow http
$ sudo ufw allow https
```

然后启用 UFW：

```
$ sudo ufw enable
```

你可以通过以下方式查看允许和拒绝了哪些服务：

```
$ sudo ufw status
```

如果你想禁用 UFW，可以通过键入以下命令来禁用：

```
$ sudo ufw disable
```

你还可以（在 RHEL/CentOS 上）使用 [firewall-cmd][4]，它已经安装并集成到某些发行版中。

### 6、安装 Fail2ban

[Fail2ban][5] 是一种用于检查服务器日志以查找重复或自动攻击的应用程序。如果找到任何攻击，它会更改防火墙以永久地或在指定的时间内阻止攻击者的 IP 地址。

你可以通过键入以下命令来安装 Fail2ban：

```
$ sudo apt install fail2ban -y
```

然后复制随附的配置文件：

```
$ sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

重启 Fail2ban：

```
$ sudo service fail2ban restart
```

这样就行了。该软件将不断检查日志文件以查找攻击。一段时间后，该应用程序将建立相当多的封禁的 IP 地址列表。你可以通过以下方法查询 SSH 服务的当前状态来查看此列表：

```
$ sudo fail2ban-client status ssh
```

### 7、移除无用的网络服务

几乎所有 Linux 服务器操作系统都启用了一些面向网络的服务。你可能希望保留其中大多数，然而，有一些你或许希望删除。你可以使用 `ss` 命令查看所有正在运行的网络服务：（LCTT 译注：应该是只保留少部分，而所有确认无关的、无用的服务都应该停用或删除。）

```
$ sudo ss -atpu
```

`ss` 的输出取决于你的操作系统。下面是一个示例，它显示 SSH（`sshd`）和 Ngnix（`nginx`）服务正在侦听网络并准备连接：

```
tcp LISTEN 0 128 *:http *:* users:(("nginx",pid=22563,fd=7))
tcp LISTEN 0 128 *:ssh *:* users:(("sshd",pid=685,fd=3))
```

删除未使用的服务的方式因你的操作系统及其使用的程序包管理器而异。

要在 Debian / Ubuntu 上删除未使用的服务：

```
$ sudo apt purge <service_name>
```

要在 Red Hat/CentOS 上删除未使用的服务：

```
$ sudo yum remove <service_name>
```

再次运行 `ss -atup` 以确认这些未使用的服务没有安装和运行。

### 总结

本教程介绍了加固 Linux 服务器所需的最起码的措施。你应该根据服务器的使用方式启用其他安全层。这些安全层可以包括诸如各个应用程序配置、入侵检测软件（IDS）以及启用访问控制（例如，双因素身份验证）之类的东西。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/linux-server-security

作者：[Patrick H. Mullins][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pmullins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/server_data_system_admin.png?itok=q6HCfNQ8 (computer servers processing data)
[2]: https://opensource.com/article/19/4/ssh-keys-seahorse
[3]: https://launchpad.net/ufw
[4]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[5]: https://www.fail2ban.org/wiki/index.php/Main_Page
