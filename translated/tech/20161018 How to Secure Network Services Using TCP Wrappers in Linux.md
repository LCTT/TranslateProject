在 Linux 下使用 TCP 封装器来加密网络服务
===========


在这篇文章中，我们将会讲述什么是 TCP 封装器以及如何在一台 Linux 服务器上配置他们来[限制网络服务的权限][7]。在开始之前，我们必须澄清 TCP 封装器并不能消除对于正确[配置防火墙][6]的需要。

就这一点而言，你可以把这个工具看作是一个[基于主机的访问控制列][5]，而且并不能作为你的系统的[终极安全措施][4]。通过使用一个防火墙和 TCP 封装器，而不是只喜爱其中的一个，你将会确保你的服务不会被出现单点故障。

### 正确理解 hosts.allow 和 hosts.deny 文件

当一个网络请求到达你的主机的时候，TCP 封装器会使用 hosts.allow 和 hosts.deny （按照这样的顺序）来决定客户端是否应该被允许使用一个提供的服务。.

在默认情况下，这些文件内容是空的，或者被注释掉，或者根本不存在。所以，任何请求都会被允许通过 TCP 过滤器而且你的系统被置于依靠防火墙来提供所有的保护。因为这并不是我们想要的。由于在一开始我们就介绍过的原因，清确保下面两个文件都存在：

```
# ls -l /etc/hosts.allow /etc/hosts.deny

```

两个文件的编写语法规则是一样的：

```
<services> : <clients> [: <option1> : <option2> : ...]

```

在文件中，

1.  1.services 是一个逗号分割的当前规则应该被应用的服务的列表。
2.  clients 代表逗号分割的被规则影响的主机名或者 IP 地址。下面的通配符也可以接受：
    1.  ALL 表示所有事物，应用于客户端和服务器。
    2.  LOCAL 表示匹配在正式域名中没有分段的机器，例如 localhost。
    3.  KNOWN 表示主机名，主机地址，或者用户是已知的。
    4.  UNKNOWN 和 KNOWN 相反。
    5.  PARANOID 如果进行反向 DNS 查找，那么连接就会被断开（首先根据 IP 去决定主机名，然后根据主机名去获得 IP 地址）每次都返回不同的地址。
3.  最后，一个逗号分割的动作表示了当一个规则被触发的时候会发生什么事情。

你可能会记住 /etc/hosts.allow 文件中允许一个服务接入的规则要优先于 /etc/hosts.deny中的规则。另外还有，如果两个规则应用于同一个服务，只有第一个规则会被纳入考虑。

不幸的是，不是所有的网络服务都支持 TCP 过滤器，为了查看一个给定的服务是否支持他们，可以执行以下命令：

```
# ldd /path/to/binary | grep libwrap

```

如果以上命令执行以后得到了以下结果，那么他就可以支持 TCP 过滤器，sshd 和 vsftpd 作为例子，输出如下所示。

[![Find Supported Services in TCP Wrapper](http://www.tecmint.com/wp-content/uploads/2016/10/Find-Supported-Services-in-TCP-Wrapper.png)][3]

查找 TCP 过滤器支持的服务。

### 如何使用 TCP 过滤器去限制服务的权限

当你编辑 /etc/hosts.allow 和 /etc/hosts.deny 的时候，确保你在最后一个非空行后面通过回车键来添加一个新的行。

为了使得 [SSH 和 FTP][2] 服务只允许 localhost 和 192.168.0.102 并且拒绝所有其他用户，在 /etc/hosts.deny 添加如下内容：

```
sshd,vsftpd : ALL
ALL : ALL

```

而且在 /etc/hosts.allow 文件中添加如下内容：

```
sshd,vsftpd : 192.168.0.102,LOCAL

```

TCP Wrappers -hosts.deny 文件
```
#
# hosts.deny	This file contains access rules which are used to
#		deny connections to network services that either use
#		the tcp_wrappers library or that have been
#		started through a tcp_wrappers-enabled xinetd.
#
#		The rules in this file can also be set up in
#		/etc/hosts.allow with a 'deny' option instead.
#
#		See 'man 5 hosts_options' and 'man 5 hosts_access'
#		for information on rule syntax.
#		See 'man tcpd' for information on tcp_wrappers
#
sshd,vsftpd : ALL
ALL : ALL

```

TCP wrappers -hosts.allow 文件
```
#
# hosts.allow	This file contains access rules which are used to
#		allow or deny connections to network services that
#		either use the tcp_wrappers library or that have been
#		started through a tcp_wrappers-enabled xinetd.
#
#		See 'man 5 hosts_options' and 'man 5 hosts_access'
#		for information on rule syntax.
#		See 'man tcpd' for information on tcp_wrappers
#
sshd,vsftpd : 192.168.0.102,LOCAL

```

这些更改会立刻生效并且不需要重新启动。

在下图中你会看到，在最后一行中删掉 LOCAL 后，FTP 服务器会对于 localhost 不可用。在我们添加了通配符以后，服务又变得可用了。

[![确认 FTP 权限 ](http://www.tecmint.com/wp-content/uploads/2016/10/Verify-FTP-Access.png)][1]
>确认 FTP 权限

为了允许所有服务对于主机名中含有 example.com 都可用，在 hosts.allow 中添加如下一行：

```
ALL : .example.com

```

而且为了禁止 10.0.1.0/24 的机器访问 vsftpd 服务，在 hosts.deny 文件中添加如下一行：
```
vsftpd : 10.0.1.

```

在最后的两个例子中，注意到客户端列表每行开头和结尾的逗号。这是用来表示 “所有主机或者客户端的名字或者 IP 中含有那个字符串的主机”

这篇文章对你有用吗？你有什么问题或者评论吗？请你尽情在下面留言交流。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/secure-linux-tcp-wrappers-hosts-allow-deny-restrict-access/

作者：[Gabriel Cánepa][a]

译者：[LinuxBars](https://LinuxBar.org

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/wp-content/uploads/2016/10/Verify-FTP-Access.png
[2]:http://www.tecmint.com/block-ssh-and-ftp-access-to-specific-ip-and-network-range/
[3]:http://www.tecmint.com/wp-content/uploads/2016/10/Find-Supported-Services-in-TCP-Wrapper.png
[4]:http://www.tecmint.com/linux-server-hardening-security-tips/
[5]:http://www.tecmint.com/secure-files-using-acls-in-linux/
[6]:http://www.tecmint.com/configure-firewalld-in-centos-7/
[7]:http://www.tecmint.com/mandatory-access-control-with-selinux-or-apparmor-linux/
