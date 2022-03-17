[#]: subject: "How I migrated a WordPress website to a new host"
[#]: via: "https://opensource.com/article/21/9/migrate-wordpress"
[#]: author: "David Both https://opensource.com/users/dboth"
[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何把 WordPress 网站迁移到新主机
======

使用这个简单的方法来迁移一个网站以及管理防火墙配置。
![Text editor on a browser, in blue][1]

你曾经需要把一个 WordPress 网站迁移到一台新主机上吗？我曾经迁移过好多次，迁移过程相当简单。当然，我不会用很多事都通用的推荐的方法，这次也不例外 —— 我用更简单的方法，这才是我推荐的方法。

这个迁移方法没有破坏性，因此如果出于某些原因你需要还原到原来的服务器上，很容易可以实现。

### 一个 WordPress 网站的组成部分

运行一个基于 [WordPress][2] 的网站有三个重要组成部分：WordPress 本身，一个 web 服务器，如 [Apache][3]（我正在用），以及 [MariaDB][4]。MariaDB 是 MySQL 的一个分支，功能相似。

业界有大量的 web 服务器，由于我使用了 Apache 很长时间因此我推荐用 Apache。你可能需要把 Apache 的配置方法改成你用的 web 服务器的方法。

### 初始配置

我使用一台 Linux 主机作为防火墙和网络路由。在我的网络中 web 服务器是另一台主机。我的内部网络使用的是 C 类私有网络地址范围，在 [<ruby>无类别域间路由<rt>Classless Internet Domain Routing</rt></ruby> (CIDR)][5] 方法论中被简单地声明为 192.168.0.0/24。

对于防火墙，相比于更复杂的 `firewalld`，我更喜欢用非常简单的 [IPTables][6]。这个防火墙配置中的每一行都会把 80 端口（HTTP）接收到的包发送给 web 服务器。在 `/etc/sysconfig/iptables` 文件中，你可以在注释中看到，我添加了能把其他入站服务器连接转发到同一台服务器上合适的端口的规则。


```
# Reroute ports for inbound connections to the appropriate web/email/etc server.
# HTTPD goes to 192.168.0.75
-A PREROUTING -d 45.20.209.41/255.255.255.248 -p tcp -m tcp --dport 80 \

  -j DNAT --to-destination 192.168.0.75:80
```

我使用虚拟主机来配置原来的 Apache web 服务器，因为我在这个 HTTPD 实例上运行着多个网站。使用虚拟主机配置是个不错的方法，因为（像我一样）未来你可能会在运行其他的网站，这个方法可以使其变得容易。

`/etc/httpd/conf/httpd.conf` 中需要迁移的虚拟主机的网站相关部分请参考下面代码。这个片段中不涉及到 IP 地址的修改，因此在新服务器上不需要修改使用方法。


```
&lt;VirtualHost *:80&gt;
   ServerName [www.website1.org][7]
   ServerAlias server.org

DocumentRoot "/var/website1/html"
   ErrorLog "logs/error_log"
   ServerAdmin [me@website1.org][8]
 
&lt;Directory "/var/website1/html"&gt;
      Options Indexes FollowSymLinks
 
AllowOverride None
      Require all granted
 
&lt;/Directory&gt;
&lt;/VirtualHost&gt;
```

在迁移之前，你需要在 `httpd.conf` 的最顶端附近找到 `Listen` 声明并修改成类似下面这样。这个地址是服务器的真实私有 IP 地址，不是公开 IP 地址。


```
`Listen 192.168.0.75:80`
```

你需要修改新主机上 `Listen` 的 IP 地址。

### 前期工作

准备工作分为以下三步：

  * 安装服务
  * 配置防火墙
  * 配置 web 服务器



#### 安装 Apache 和 MariaDB

如果你的新服务器上还没有 Apache 和 MariaDB，那么就安装它们。WordPress 的安装不是必要的。


```
`dnf -y install httpd mariadb`
```

#### 新服务器防火墙配置

确认下新服务器上的防火墙允许访问 80 端口。你_每台_电脑上都有一个防火墙，对吗？大部分现代发行版本使用的初始化配置包含的防火墙会阻止所有进来的网络流量，以此来提高安全等级。

下面片段的第一行内容可能已经在你的 IPTables 或其他基于防火墙的网络过滤器中存在了。它标识已经被识别为来自可接受来源的入站包，不关心后面的 INPUT 过滤规则，这样可以节省时间和 CPU 周期。片段中最后一行标识并放行 80 端口新进来的请求到 HTTPD 的连接。


```
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
&lt;snip&gt;
# HTTP
-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
```

下面的示例 `/etc/sysconfig/iptables` 文件是 IPTables 最少的规则例子，可以允许 SSH（端口 22）和 HTTPD（端口 80）连接。


```
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
# SSHD
-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
# HTTP
-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT

# Final disposition for unmatched packets
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT
```

在新服务器主机上我需要做的就是在 `/etc/sysconfig/iptables` 文件的防火墙规则里添加上面片段的最后一行，然后重新加载修改后的规则集。


```
`iptables-restore /etc/sysconfig/iptables`
```

大部分基于红帽的发行版本，如 Fedora，使用的是 `firewalld`。我发现对于它的适用场景（如家用、小到中型企业）而言，它过于复杂，因此我不用它。我建议你参照 [firewalld 网页][9] 来向 `firewalld` 添加入站端口 80。

你的防火墙及其配置可能跟这个有些差异，但最终的目的是允许新 web 服务器 80 端口接收 HTTPD 连接。

#### HTTPD 配置

在 `/etc/httpd/conf/httpd.conf` 文件中配置 HTTPD。像下面一样在 Listen 片段中设置 IP 地址。我的新 web 服务器 IP 地址是 192.168.0.125。


```
`Listen 192.168.0.125:80`
```

复制VirtualHost  片段（对应要迁移的网站的 ），粘贴到新服务器上 `httpd.conf` 文件的末尾。

### 迁移过程

只有两组数据需要迁移到新服务器 —— 数据库本身和网站目录结构。把两个目录打包成 `tar` 文档。


```
cd /var ; tar -cvf /tmp/website.tar website1/
cd /var/lib ; tar -cvf /tmp/database.tar mysql/
```

把两个 tar 文件复制到新服务器。我通常会把这类文件放到 `/tmp` 下，这个目录就是用来做这种事的。在新服务器上运行下面的命令，把 tar 文档解压到正确的目录。


```
cd /var ; tar -xvf /tmp/website.tar
cd /var/lib ; tar -xvf /tmp/database.tar
```

WordPress 的所有文件都在 `/var/website1` 下，因此不需要在新服务器上安装。新服务器上不需要执行 WrodPress 安装过程。

这个目录就是需要迁移到新服务器上的全部内容。

最后一步是启动（或重启）`mysqld` 和 `httpd` 服务守护进程。WrodPress 不是一个服务，因此不使用守护进程的方式来启动。


```
`systemctl start mysqld ; systemctl start httpd`
```

启动之后，你应该检查下这些服务的状态。


```
systemctl status mysqld
● mariadb.service - MariaDB 10.5 database server
    Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled; vendor preset: disabled)
    Active: active (running) since Sat 2021-08-21 14:03:44 EDT; 4 days ago
        Docs: man:mariadbd(8)

<https://mariadb.com/kb/en/library/systemd/>
   Process: 251783 ExecStartPre=/usr/libexec/mariadb-check-socket (code=exited, status=0/SUCCESS)
   Process: 251805 ExecStartPre=/usr/libexec/mariadb-prepare-db-dir mariadb.service (code=exited, status=0/SUCCESS)
   Process: 251856 ExecStartPost=/usr/libexec/mariadb-check-upgrade (code=exited, status=0/SUCCESS)
 Main PID: 251841 (mariadbd)
      Status: "Taking your SQL requests now..."
      Tasks: 15 (limit: 19003)
    Memory: 131.8M
        CPU: 1min 31.793s
    CGroup: /system.slice/mariadb.service
└─251841 /usr/libexec/mariadbd --basedir=/usr

Aug 21 14:03:43 simba.stmarks-ral.org systemd[1]: Starting MariaDB 10.5 database server...
Aug 21 14:03:43 simba.stmarks-ral.org mariadb-prepare-db-dir[251805]: Database MariaDB is probably initialized in /var/lib/mysql already, n&gt;
Aug 21 14:03:43 simba.stmarks-ral.org mariadb-prepare-db-dir[251805]: If this is not the case, make sure the /var/lib/mysql is empty before&gt;
Aug 21 14:03:44 simba.stmarks-ral.org mariadbd[251841]: 2021-08-21 14:03:44 0 [Note] /usr/libexec/mariadbd (mysqld 10.5.11-MariaDB) startin&gt;
Aug 21 14:03:44 simba.stmarks-ral.org systemd[1]: Started MariaDB 10.5 database server.

systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
   Drop-In: /usr/lib/systemd/system/httpd.service.d
└─php-fpm.conf
      Active: active (running) since Sat 2021-08-21 14:08:39 EDT; 4 days ago
        Docs: man:httpd.service(8)
   Main PID: 252458 (httpd)
      Status: "Total requests: 10340; Idle/Busy workers 100/0;Requests/sec: 0.0294; Bytes served/sec: 616 B/sec"
        Tasks: 278 (limit: 19003)
      Memory: 44.7M
        CPU: 2min 31.603s
   CGroup: /system.slice/httpd.service
├─252458 /usr/sbin/httpd -DFOREGROUND
├─252459 /usr/sbin/httpd -DFOREGROUND
├─252460 /usr/sbin/httpd -DFOREGROUND
├─252461 /usr/sbin/httpd -DFOREGROUND
├─252462 /usr/sbin/httpd -DFOREGROUND
└─252676 /usr/sbin/httpd -DFOREGROUND

Aug 21 14:08:39 simba.stmarks-ral.org systemd[1]: Starting The Apache HTTP Server...
Aug 21 14:08:39 simba.stmarks-ral.org httpd[252458]: AH00112: Warning: DocumentRoot [/var/teststmarks-ral/html] does not exist
Aug 21 14:08:39 simba.stmarks-ral.org httpd[252458]: Server configured, listening on: port 80
Aug 21 14:08:39 simba.stmarks-ral.org systemd[1]: Started The Apache HTTP Server.
```

### 最终的修改

现在所需的服务都已经运行了，你可以把 `/etc/sysconfig/iptables` 文件中 HTTDP 的防火墙规则改成下面的样子：


```
-A PREROUTING -d 45.20.209.41/255.255.255.248 -p tcp -m tcp --dport 80 \
  -j DNAT --to-destination 192.168.0.125:80
```

然后重新加载设置的 IPTables 规则。


```
`iptables-restore /etc/sysconfig/iptables`
```

由于防火墙会确定防火墙的主机，因此不需要把外部 DNS 入口改成指向新服务器。如果你使用的是内部 DNS 服务器，那么你需要把 IP 地址改成内部 DNS 数据库里的 A 记录。如果你没有用内部 DNS 服务器，那么请确保主机 `/etc/hosts` 文件里新服务器地址设置得没有问题。

### 测试和清理

请确保对新配置进行测试。首先，停止旧服务器上的 `mysqld` 和 `httpd` 服务。然后通过浏览器访问网站。如果一切符合预期，那么你可以关掉旧服务器上的 `mysqld` 和 `httpd`。如果有失败，你可以把 IPTables 的路由规则改回去到旧服务器上，直到问题解决。

之后我把 MySQL 和 HTTPD 从旧服务器上删除了，这样来确保它们不会意外地被启动。

### 总结

就是这么简单。不需要执行数据库导出和导入的过程，因为 `mysql` 目录下所有需要的东西都已经复制过去了。需要执行导出/导入过程的场景：有网站自己的数据库之外的数据库；MariaDB 实例上还有其他网站，而你不想把这些网站复制到新服务器上。

迁移旧服务器上的其他网站也很容易。其他网站依赖的所有数据库都已经随着 MariaDB 的迁移被转移到了新服务器上。你只需要把 `/var/website` 目录迁移到新服务器，添加合适的虚拟主机片段，然后重启 HTTPD。

我遵循这个过程把很多个网站从一个服务器迁移到另一个服务器，每次都没有问题。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/migrate-wordpress

作者：[David Both][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 "Text editor on a browser, in blue"
[2]: https://wordpress.org/
[3]: https://opensource.com/article/18/2/how-configure-apache-web-server
[4]: https://mariadb.org/
[5]: https://opensource.com/article/16/12/cidr-network-notation-configuration-linux
[6]: https://en.wikipedia.org/wiki/Iptables
[7]: http://www.website1.org
[8]: mailto:me@website1.org
[9]: https://firewalld.org/documentation/howto/open-a-port-or-service.html
