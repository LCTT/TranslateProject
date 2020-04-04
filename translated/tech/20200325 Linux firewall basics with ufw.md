[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux firewall basics with ufw)
[#]: via: (https://www.networkworld.com/article/3533551/linux-firewall-basics-with-ufw.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Linux 防火墙 ufw 简介
======
我们来研究下 ufw - linux 上一个简单的防火墙，它为防火墙更改提供了一些见解和命令。

![][0]

**ufw** （简易防火墙）可以说是 [iptables][1] 的简化版，最近几年，它已经成为 Ubuntu 和 Debian 等系统上的默认防火墙。而且 **ufw** 出乎意料的简单，这对新管理员来说是一个福音，否则他们可能不得不投入大量时间来加快防火墙管理的速度。

**ufw** 也有 GUI 客户端（例如 **gufw**），但是 **ufw** 命令通常在命令行上发出。本文介绍了一些使用 **ufw** 的命令，并研究了它的工作方式。
 
首先，查看 **ufw** 如何配置的一个快速方法是查看其配置文件 -- **/etc/default/ufw**。使用下面的命令可以查看其配置，使用 **grep** 来禁止显示空白行和注释（以 # 开头的行）。
```
$ grep -v '^#\|^$' /etc/default/ufw
IPV6=yes
DEFAULT_INPUT_POLICY="DROP"
DEFAULT_OUTPUT_POLICY="ACCEPT"
DEFAULT_FORWARD_POLICY="DROP"
DEFAULT_APPLICATION_POLICY="SKIP"
MANAGE_BUILTINS=no
IPT_SYSCTL=/etc/ufw/sysctl.conf
IPT_MODULES="nf_conntrack_ftp nf_nat_ftp nf_conntrack_netbios_ns"
```

正如你所看到的，默认策略是丢弃输入但允许输出。如果你想接受专有连接，你需要单独配置。

ufw 命令的基本语法如下所示，但是这个概要并不意味着你只需要输入 "ufw" 就能熟悉它，而是通过一个个错误提示来告诉你需要哪些参数。
```
ufw [--dry-run] [options] [rule syntax]
```

**\--dry-run** 选项意味着 **ufw** 不会运行你指定的命令，但你会看到它是否执行了的结果。如果进行了更改，它将显示整个规则集，因此你要做好多行输出的准备。

运行以下命令来检查 **ufw** 的状态。注意，即使此命令也需要使用 **sudo** 或 root 账户。
```
$ sudo ufw status
Status: active

To                         Action      From
--                         ------      ----
22                         ALLOW       192.168.0.0/24
9090                       ALLOW       Anywhere
9090 (v6)                  ALLOW       Anywhere (v6)
```

否则，你会看到以下内容：
```
$ ufw status
ERROR: You need to be root to run this script
```

"verbose" 选项将提供一些其它细节：
```
$ sudo ufw status verbose
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), disabled (routed)
New profiles: skip

To                         Action      From
--                         ------      ----
22                         ALLOW IN    192.168.0.0/24
9090                       ALLOW IN    Anywhere
9090 (v6)                  ALLOW IN    Anywhere (v6)
```

你可以使用以下命令轻松地通过端口号允许和拒绝连接：
```
$ sudo ufw allow 80         <== 允许 http 访问
$ sudo ufw deny 25              <== 拒绝 smtp 访问
```

你可以查看 **/etc/services** 文件来找到端口号和服务名称之间的联系。
```
$ grep 80/ /etc/services
http            80/tcp          www             # WorldWideWeb HTTP
socks           1080/tcp                        # socks proxy server
socks           1080/udp
http-alt        8080/tcp        webcache        # WWW caching service
http-alt        8080/udp
amanda          10080/tcp                       # amanda backup services
amanda          10080/udp
canna           5680/tcp                        # cannaserver
```

或者，你可以命令中直接使用服务的名称。

```
$ sudo ufw allow http
Rule added
Rule added (v6)
$ sudo ufw allow https
Rule added
Rule added (v6)
```

进行更改后，你应该再次检查状态来查看是否生效：

```
$ sudo ufw status
Status: active

To                         Action      From
--                         ------      ----
22                         ALLOW       192.168.0.0/24
9090                       ALLOW       Anywhere
80/tcp                     ALLOW       Anywhere         <==
443/tcp                    ALLOW       Anywhere         <==
9090 (v6)                  ALLOW       Anywhere (v6)
80/tcp (v6)                ALLOW       Anywhere (v6)    <==
443/tcp (v6)               ALLOW       Anywhere (v6)    <==
```

**ufw** 遵循的规则存储在 **/etc/ufw** 目录中，注意，你需要 root 用户访问权限才能查看这些文件，每个文件都包含大量规则。

```
$ ls -ltr /etc/ufw
total 48
-rw-r--r-- 1 root root 1391 Aug 15  2017 sysctl.conf
-rw-r----- 1 root root 1004 Aug 17  2017 after.rules
-rw-r----- 1 root root  915 Aug 17  2017 after6.rules
-rw-r----- 1 root root 1130 Jan  5  2018 before.init
-rw-r----- 1 root root 1126 Jan  5  2018 after.init
-rw-r----- 1 root root 2537 Mar 25  2019 before.rules
-rw-r----- 1 root root 6700 Mar 25  2019 before6.rules
drwxr-xr-x 3 root root 4096 Nov 12 08:21 applications.d
-rw-r--r-- 1 root root  313 Mar 18 17:30 ufw.conf
-rw-r----- 1 root root 1711 Mar 19 10:42 user.rules
-rw-r----- 1 root root 1530 Mar 19 10:42 user6.rules
```

本文前面所作的更改，为 **http** 访问添加了端口 **80** 和为 **https** 访问添加了端口 **443**，在 **user.rules** 和 **user6.rules** 文件中看起来像这样：
```
# grep " 80 " user*.rules
user6.rules:### tuple ### allow tcp 80 ::/0 any ::/0 in
user6.rules:-A ufw6-user-input -p tcp --dport 80 -j ACCEPT
user.rules:### tuple ### allow tcp 80 0.0.0.0/0 any 0.0.0.0/0 in
user.rules:-A ufw-user-input -p tcp --dport 80 -j ACCEPT
You have new mail in /var/mail/root
# grep 443 user*.rules
user6.rules:### tuple ### allow tcp 443 ::/0 any ::/0 in
user6.rules:-A ufw6-user-input -p tcp --dport 443 -j ACCEPT
user.rules:### tuple ### allow tcp 443 0.0.0.0/0 any 0.0.0.0/0 in
user.rules:-A ufw-user-input -p tcp --dport 443 -j ACCEPT
```

使用 **ufw**，你还可以使用以下命令轻松地阻止来自一个系统的连接：
```
$ sudo ufw deny from 208.176.0.50
Rule added
```

status 命令将显示更改：
```
$ sudo ufw status verbose
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), disabled (routed)
New profiles: skip

To                         Action      From
--                         ------      ----
22                         ALLOW IN    192.168.0.0/24
9090                       ALLOW IN    Anywhere
80/tcp                     ALLOW IN    Anywhere
443/tcp                    ALLOW IN    Anywhere
Anywhere                   DENY IN     208.176.0.50             <== new
9090 (v6)                  ALLOW IN    Anywhere (v6)
80/tcp (v6)                ALLOW IN    Anywhere (v6)
443/tcp (v6)               ALLOW IN    Anywhere (v6)
```

总而言之，**ufw** 不仅容易配置，而且且容易理解。

加入 [Facebook][4] 和 [LinkedIn][5] 上的网络世界社区，评论最火的主题。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3533551/linux-firewall-basics-with-ufw.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出


[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[0]: https://images.idgesg.net/images/article/2019/06/cso_network_security_encryption_automation_by_vertigo3d_gettyimages-597931354_2400x1600-100798880-large.jpg
[1]: https://www.networkworld.com/article/2716098/working-with-iptables.html
[2]: https://www.networkworld.com/article/3143050/linux/linux-hardening-a-15-step-checklist-for-a-secure-linux-server.html#tk.nww-fsb
[3]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
