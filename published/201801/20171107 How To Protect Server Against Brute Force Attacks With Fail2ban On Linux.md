如何在 Linux 上用 Fail2Ban 保护服务器免受暴力攻击
======

Linux 管理员的一个重要任务是保护服务器免受非法攻击或访问。 默认情况下，Linux 系统带有配置良好的防火墙，比如iptables、Uncomplicated Firewall（UFW），ConfigServer Security Firewall（CSF）等，可以防止多种攻击。

任何连接到互联网的机器都是恶意攻击的潜在目标。 有一个名为 Fail2Ban 的工具可用来缓解服务器上的非法访问。

### 什么是 Fail2Ban？

[Fail2Ban][1] 是一款入侵防御软件，可以保护服务器免受暴力攻击。 它是用 Python 编程语言编写的。 Fail2Ban 基于auth 日志文件工作，默认情况下它会扫描所有 auth 日志文件，如 `/var/log/auth.log`、`/var/log/apache/access.log` 等，并禁止带有恶意标志的IP，比如密码失败太多，寻找漏洞等等标志。

通常，Fail2Ban 用于更新防火墙规则，用于在指定的时间内拒绝 IP 地址。 它也会发送邮件通知。 Fail2Ban 为各种服务提供了许多过滤器，如 ssh、apache、nginx、squid、named、mysql、nagios 等。

Fail2Ban 能够降低错误认证尝试的速度，但是它不能消除弱认证带来的风险。 这只是服务器防止暴力攻击的安全手段之一。

### 如何在 Linux 中安装 Fail2Ban

Fail2Ban 已经与大部分 Linux 发行版打包在一起了，所以只需使用你的发行包版的包管理器来安装它。

对于 Debian / Ubuntu，使用 [APT-GET 命令][2]或 [APT 命令][3]安装。

```
$ sudo apt install fail2ban
```

对于 Fedora，使用 [DNF 命令][4]安装。

```
$ sudo dnf install fail2ban
```

对于 CentOS/RHEL，启用 [EPEL 库][5]或 [RPMForge][6] 库，使用 [YUM 命令][7]安装。

```
$ sudo yum install fail2ban
```

对于 Arch Linux，使用 [Pacman 命令][8]安装。

```
$ sudo pacman -S fail2ban
```

对于 openSUSE , 使用 [Zypper命令][9]安装。

```
$ sudo zypper in fail2ban
```

### 如何配置 Fail2Ban

默认情况下，Fail2Ban 将所有配置文件保存在 `/etc/fail2ban/` 目录中。 主配置文件是 `jail.conf`，它包含一组预定义的过滤器。 所以，不要编辑该文件，这是不可取的，因为只要有新的更新，配置就会重置为默认值。

只需在同一目录下创建一个名为 `jail.local` 的新配置文件，并根据您的意愿进行修改。

```
# cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

默认情况下，大多数选项都已经配置的很完美了，如果要启用对任何特定 IP 的访问，则可以将 IP 地址添加到 `ignoreip` 区域，对于多个 IP 的情况，用空格隔开 IP 地址。

配置文件中的 `DEFAULT` 部分包含 Fail2Ban 遵循的基本规则集，您可以根据自己的意愿调整任何参数。

```
# nano /etc/fail2ban/jail.local

[DEFAULT]
ignoreip = 127.0.0.1/8 192.168.1.100/24
bantime = 600
findtime = 600
maxretry = 3
destemail = 2daygeek@gmail.com
```

* `ignoreip`：本部分允许我们列出 IP 地址列表，Fail2Ban 不会禁止与列表中的地址匹配的主机
* `bantime`：主机被禁止的秒数
* `findtime`：如果在最近 `findtime` 秒期间已经发生了 `maxretry` 次重试，则主机会被禁止
* `maxretry`：是主机被禁止之前的失败次数

### 如何配置服务

Fail2Ban 带有一组预定义的过滤器，用于各种服务，如 ssh、apache、nginx、squid、named、mysql、nagios 等。 我们不希望对配置文件进行任何更改，只需在服务区域中添加 `enabled = true` 这一行就可以启用任何服务。 禁用服务时将 `true` 改为 `false` 即可。

```
# SSH servers
[sshd]
enabled = true
port = ssh
logpath = %(sshd_log)s
backend = %(sshd_backend)s
```

* `enabled`： 确定服务是打开还是关闭。
* `port`：指明特定的服务。 如果使用默认端口，则服务名称可以放在这里。 如果使用非传统端口，则应该是端口号。
* `logpath`：提供服务日志的位置
* `backend`：指定用于获取文件修改的后端。

### 重启 Fail2Ban

进行更改后，重新启动 Fail2Ban 才能生效。

```
[For SysVinit Systems]
# service fail2ban restart

[For systemd Systems]
# systemctl restart fail2ban.service
```

### 验证 Fail2Ban iptables 规则

你可以使用下面的命令来确认是否在防火墙中成功添加了Fail2Ban iptables 规则。

```
# iptables -L
Chain INPUT (policy ACCEPT)
target prot opt source destination
f2b-apache-auth tcp -- anywhere anywhere multiport dports http,https
f2b-sshd tcp -- anywhere anywhere multiport dports 1234
ACCEPT tcp -- anywhere anywhere tcp dpt:1234

Chain FORWARD (policy ACCEPT)
target prot opt source destination

Chain OUTPUT (policy ACCEPT)
target prot opt source destination

Chain f2b-apache-auth (1 references)
target prot opt source destination
RETURN all -- anywhere anywhere

Chain f2b-sshd (1 references)
target prot opt source destination
RETURN all -- anywhere anywhere
```

### 如何测试 Fail2Ban

我做了一些失败的尝试来测试这个。 为了证实这一点，我要验证 `/var/log/fail2ban.log` 文件。

```
2017-11-05 14:43:22,901 fail2ban.server [7141]: INFO Changed logging target to /var/log/fail2ban.log for Fail2ban v0.9.6
2017-11-05 14:43:22,987 fail2ban.database [7141]: INFO Connected to fail2ban persistent database '/var/lib/fail2ban/fail2ban.sqlite3'
2017-11-05 14:43:22,996 fail2ban.database [7141]: WARNING New database created. Version '2'
2017-11-05 14:43:22,998 fail2ban.jail [7141]: INFO Creating new jail 'sshd'
2017-11-05 14:43:23,002 fail2ban.jail [7141]: INFO Jail 'sshd' uses poller {}
2017-11-05 14:43:23,019 fail2ban.jail [7141]: INFO Initiated 'polling' backend
2017-11-05 14:43:23,019 fail2ban.filter [7141]: INFO Set maxRetry = 5
2017-11-05 14:43:23,020 fail2ban.filter [7141]: INFO Set jail log file encoding to UTF-8
2017-11-05 14:43:23,020 fail2ban.filter [7141]: INFO Added logfile = /var/log/auth.log
2017-11-05 14:43:23,021 fail2ban.actions [7141]: INFO Set banTime = 600
2017-11-05 14:43:23,021 fail2ban.filter [7141]: INFO Set findtime = 600
2017-11-05 14:43:23,022 fail2ban.filter [7141]: INFO Set maxlines = 10
2017-11-05 14:43:23,070 fail2ban.server [7141]: INFO Jail sshd is not a JournalFilter instance
2017-11-05 14:43:23,081 fail2ban.jail [7141]: INFO Jail 'sshd' started
2017-11-05 14:43:23,763 fail2ban.filter [7141]: INFO [sshd] Found 103.5.134.167
2017-11-05 14:43:23,763 fail2ban.filter [7141]: INFO [sshd] Found 103.5.134.167
2017-11-05 14:43:23,764 fail2ban.filter [7141]: INFO [sshd] Found 181.129.54.170
2017-11-05 14:43:23,764 fail2ban.filter [7141]: INFO [sshd] Found 181.129.54.170
2017-11-05 14:43:23,765 fail2ban.filter [7141]: INFO [sshd] Found 181.129.54.170
2017-11-05 14:43:23,765 fail2ban.filter [7141]: INFO [sshd] Found 181.129.54.170
2017-11-05 15:19:06,192 fail2ban.server [7141]: INFO Stopping all jails
2017-11-05 15:19:06,874 fail2ban.jail [7141]: INFO Jail 'sshd' stopped
2017-11-05 15:19:06,879 fail2ban.server [7141]: INFO Exiting Fail2ban
2017-11-05 15:19:07,123 fail2ban.server [8528]: INFO Changed logging target to /var/log/fail2ban.log for Fail2ban v0.9.6
2017-11-05 15:19:07,123 fail2ban.database [8528]: INFO Connected to fail2ban persistent database '/var/lib/fail2ban/fail2ban.sqlite3'
2017-11-05 15:19:07,126 fail2ban.jail [8528]: INFO Creating new jail 'sshd'
2017-11-05 15:19:07,129 fail2ban.jail [8528]: INFO Jail 'sshd' uses poller {}
2017-11-05 15:19:07,141 fail2ban.jail [8528]: INFO Initiated 'polling' backend
2017-11-05 15:19:07,142 fail2ban.actions [8528]: INFO Set banTime = 60
2017-11-05 15:19:07,142 fail2ban.filter [8528]: INFO Set findtime = 60
2017-11-05 15:19:07,142 fail2ban.filter [8528]: INFO Set jail log file encoding to UTF-8
2017-11-05 15:19:07,143 fail2ban.filter [8528]: INFO Set maxRetry = 3
2017-11-05 15:19:07,144 fail2ban.filter [8528]: INFO Added logfile = /var/log/auth.log
2017-11-05 15:19:07,144 fail2ban.filter [8528]: INFO Set maxlines = 10
2017-11-05 15:19:07,189 fail2ban.server [8528]: INFO Jail sshd is not a JournalFilter instance
2017-11-05 15:19:07,195 fail2ban.jail [8528]: INFO Jail 'sshd' started
2017-11-05 15:20:03,263 fail2ban.filter [8528]: INFO [sshd] Found 103.5.134.167
2017-11-05 15:20:05,267 fail2ban.filter [8528]: INFO [sshd] Found 103.5.134.167
2017-11-05 15:20:12,276 fail2ban.filter [8528]: INFO [sshd] Found 103.5.134.167
2017-11-05 15:20:12,380 fail2ban.actions [8528]: NOTICE [sshd] Ban 103.5.134.167
2017-11-05 15:21:12,659 fail2ban.actions [8528]: NOTICE [sshd] Unban 103.5.134.167
```

要查看启用的监狱列表，请运行以下命令。

```
# fail2ban-client status
Status
|- Number of jail:	2
`- Jail list:	apache-auth, sshd
```

通过运行以下命令来获取禁止的 IP 地址。

```
# fail2ban-client status ssh
Status for the jail: ssh
|- filter
| |- File list: /var/log/auth.log
| |- Currently failed: 1
| `- Total failed: 3
`- action
 |- Currently banned: 1
 | `- IP list: 192.168.1.115
 `- Total banned: 1
```

要从 Fail2Ban 中删除禁止的 IP 地址，请运行以下命令。

```
# fail2ban-client set ssh unbanip 192.168.1.115
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-install-setup-configure-fail2ban-on-linux/

作者：[Magesh Maruthamuthu][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://github.com/fail2ban/fail2ban
[2]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[5]:https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[6]:https://www.2daygeek.com/install-enable-repoforge-rpmforge-repository-on-rhel-centos-sl/
[7]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[8]:https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[9]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[10]:/cdn-cgi/l/email-protection
