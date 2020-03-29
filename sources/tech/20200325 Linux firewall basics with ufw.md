[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux firewall basics with ufw)
[#]: via: (https://www.networkworld.com/article/3533551/linux-firewall-basics-with-ufw.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Linux firewall basics with ufw
Linux 防火墙 ufw 简介
======
We take a look at ufw - the uncomplicated firewall - on Linux, providing some insights and commands for making changes.
Vertigo3D / Getty Images
我们来看看 ufw - linux 上一个简单的防火墙，它提供了一些见解和进行更改的命令。

The **ufw** (uncomplicated firewall) represents a serious simplification to [iptables][1] and, in the years that it’s been available, has become the default firewall on systems such as Ubuntu and Debian. And, yes, **ufw** is surprisingly uncomplicated – a boon for newer admins who might otherwise have to invest a lot of time to get up to speed on firewall management.
**ufw** 可以说是 [iptables][1] 的简化版，在未来几年，它已经成为 Ubuntu 和 Debian 等系统上的默认防火墙。而且它并不复杂，这对新管理员来说是一个福音，否则他们可能不得不投入大量时间来加快防火墙管理的速度。

GUIs are available for **ufw** (like **gufw**), but **ufw** commands are generally issued on the command line. This post examines some commands for using **ufw** and looks into how it works.
**ufw** 也有 GUI（例如 **gufw**），但是 **ufw** 命令通常在命令行上发布。这篇文章检查了一些使用 **ufw** 的命令，并研究了它的工作方式。

First, one quick way to see how **ufw** is configured is to look at its configuration file – **/etc/default/ufw**. In the command below, we display the settings, using **grep** to suppress the display of both blank lines and comments (line starting with #).
首先，查看 **ufw** 配置方式的一种快速方法是查看其配置文件 **/etc/default/ufw**。在下面的命令中，我们显示设置，使用 **grep** 禁止显示空白行和注释（以 # 开头的行），

[RELATED: Linux hardening: a 15-step checklist for a secure Linux server][2]

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

As you can see, the default policy is to drop input and allow output. Additional rules that allow the connections that you specifically want to be accept are configured separately.
正如你所看到的，默认策略是删除输入并允许输入。允许你专门接受的连接的其它规则是单独配置的。

The basic syntax for ufw commands might look like thee below, though this synopsis is not meant to imply that typing only “ufw” will get you further than a quick error telling you that arguments are required.
ufw 命令的基本语法如下所示，尽管该提要并不意味着仅输入 ufw 将使你走的更远，而不是一个快速的错误提示你需要参数。

```
ufw [--dry-run] [options] [rule syntax]
```

The **\--dry-run** option means that **ufw** won’t run the command you specify, but will show you the results that you would see if it did. It will, however, display the entire set of rules as they would exist if the change were made, so be prepared for more than a few lines of output.

To check the status of **ufw**, run a command like the following. Note that even this command requires use of **sudo** or use of the root account.

[][3]

```
$ sudo ufw status
Status: active

To                         Action      From
--                         ------      ----
22                         ALLOW       192.168.0.0/24
9090                       ALLOW       Anywhere
9090 (v6)                  ALLOW       Anywhere (v6)
```

Otherwise, you will see something like this:

```
$ ufw status
ERROR: You need to be root to run this script
```

Adding "verbose" provides a few additional details:

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

You can easily allow and deny connections by port number with commands like these:

```
$ sudo ufw allow 80         <== allow http access
$ sudo ufw deny 25              <== deny smtp access
```

You can check out the **/etc/services** file to find the connections between port numbers and service names.

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

Alternately, you can use service names like in these commands.

```
$ sudo ufw allow http
Rule added
Rule added (v6)
$ sudo ufw allow https
Rule added
Rule added (v6)
```

After making changes, you should check the status again to see that those changes have been made:

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

The rules that **ufw** follows are stored in the **/etc/ufw** directory. Note that you need root access to view these files and that each contains a large number of rules.

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

The changes made earlier in this post (the addition of port **80** for **http** access and **443** for **https** (encrypted http) access will look like this in the **user.rules** and **user6.rules** files:

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

With **ufw**, you can also easily block connections from a system using a command like this:

```
$ sudo ufw deny from 208.176.0.50
Rule added
```

The status command will show the change:

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

All in all, **ufw** is both easy to configure and easy to understand.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3533551/linux-firewall-basics-with-ufw.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/2716098/working-with-iptables.html
[2]: https://www.networkworld.com/article/3143050/linux/linux-hardening-a-15-step-checklist-for-a-secure-linux-server.html#tk.nww-fsb
[3]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
