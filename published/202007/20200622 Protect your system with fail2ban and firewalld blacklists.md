[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12417-1.html)
[#]: subject: (Protect your system with fail2ban and firewalld blacklists)
[#]: via: (https://fedoramagazine.org/protect-your-system-with-fail2ban-and-firewalld-blacklists/)
[#]: author: (hobbes1069 https://fedoramagazine.org/author/hobbes1069/)

使用 fail2ban 和 FirewallD 黑名单保护你的系统
======

![][1]

如果你运行的服务器有面向公众的 SSH 访问，你可能遇到过恶意登录尝试。本文介绍了如何使用两个实用程序来防止入侵者进入我们的系统。

为了防止反复的 ssh 登录尝试，我们来看看 fail2ban。而且，如果你不经常旅行，基本上停留在一两个国家，你可以将 FirewallD 配置为只允许[从你选择的国家访问][2]。

首先，让我们为不熟悉这些应用程序的人员介绍一些术语，以完成这项工作：

**fail2ban**：一个守护进程，用于禁止发生多次认证错误的主机。fail2ban 将监控 SystemD 日志，以查找对任何已启用的“<ruby>监狱<rt>jail</rt></ruby>”的失败的验证尝试。在达到指定失败次数后，它将添加一个防火墙规则，在配置的时间内阻止该特定 IP 地址。

**FirewallD**：一个带有 D-Bus 接口的防火墙守护进程，提供动态防火墙。除非你另行决定使用传统的 iptables，否则你已经在所有支持的 Fedora 和 CentOS 上安装了 FirewallD。

### 假定前提

* 主机系统有一个互联网连接，并且要么是直接暴露在互联网上，要么是通过 DMZ（这两个都是非常糟糕的想法，除非你知道你在做什么），要么是有一个端口从路由器转发过来。
* 虽然大部分的内容可能适用于其他系统，但本文假设当前系统是 Fedora（31 及以上）或 RHEL/CentOS 8 版本。在 CentOS 上，你必须用 `sudo dnf install epel-release` 启用 Fedora EPEL 仓库。

### 安装与配置

#### Fail2Ban

很有可能已经有某个 Firewalld 区已经允许 SSH 访问，但 sshd 服务本身默认没有启用。要手动启动它，并且不在启动时永久启用它：

```
$ sudo systemctl start sshd
```

或者在系统启动时启用，并同时启动它：

```
$ sudo systemctl enable --now sshd
```

下一步就是安装、配置、启用 fail2ban。和往常一样，安装可以通过命令行完成：

```
$ sudo dnf install fail2ban
```

安装完毕后，下一步就是配置“监狱”（你要以设置的任何阈值监视并禁止的服务）。默认情况下，IP 会被禁止 1 小时（这其实不够长）。最好的做法是使用 `*.local` 文件覆盖系统默认值，而不是直接修改 `*.config` 文件。如果我们查看我的 `jail.local`，我们可以看到：

```
# cat /etc/fail2ban/jail.local
[DEFAULT]

# "bantime" is the number of seconds that a host is banned.
bantime  = 1d

# A host is banned if it has generated "maxretry" during the last "findtime"
findtime  = 1h

# "maxretry" is the number of failures before a host get banned.
maxretry = 5
```

换成通俗的语言讲，就是在过去一小时内尝试 5 次后，该 IP 将被封禁 1 天。对于多次被封的 IP，也可以选择增加封禁时间，但这是另一篇文章的主题。

下一步是配置“监狱”。在本教程中显示的是 `sshd`，但其他服务的步骤大致相同。在 `/etc/fail2ban/jail.d` 中创建一个配置文件。这是我的文件：

```
# cat /etc/fail2ban/jail.d/sshd.local
[sshd]
enabled = true
```

就这么简单! 很多配置已经在为 Fedora 构建的软件包中处理了（提示：我是当前的维护者）。接下来启用并启动 fail2ban 服务：

```
$ sudo systemctl enable --now fail2ban
```

希望没有立即出错，如果没有，请使用下面的命令检查 fail2ban 的状态：

```
$ sudo systemctl status fail2ban
```

如果它没有错误地启动，应该是这样的：

```
$ systemctl status fail2ban
● fail2ban.service - Fail2Ban Service
Loaded: loaded (/usr/lib/systemd/system/fail2ban.service; disabled; vendor preset: disabled)
Active: active (running) since Tue 2020-06-16 07:57:40 CDT; 5s ago
Docs: man:fail2ban(1)
Process: 11230 ExecStartPre=/bin/mkdir -p /run/fail2ban (code=exited, status=0/SUCCESS)
Main PID: 11235 (f2b/server)
Tasks: 5 (limit: 4630)
Memory: 12.7M
CPU: 109ms
CGroup: /system.slice/fail2ban.service
└─11235 /usr/bin/python3 -s /usr/bin/fail2ban-server -xf start
Jun 16 07:57:40 localhost.localdomain systemd[1]: Starting Fail2Ban Service…
Jun 16 07:57:40 localhost.localdomain systemd[1]: Started Fail2Ban Service.
Jun 16 07:57:41 localhost.localdomain fail2ban-server[11235]: Server ready
```

如果是刚刚启动的，fail2ban 不太可能显示任何有意思的信息，但要检查 fail2ban 的状态，并确保“监狱”被启用，请输入：

```
$ sudo fail2ban-client status
Status
|- Number of jail:      1
`- Jail list:   sshd
```

sshd “监狱”的上级状态也会显示出来。如果启用了多个“监狱”，它们会在这里显示出来。

要查看一个“监狱”的详细状态，只需在前面的命令中添加“监狱”名称。下面是我的系统的输出，它已经运行了一段时间。我已经从输出中删除了被禁止的 IP：

```
$ sudo fail2ban-client status sshd
Status for the jail: sshd
|- Filter
|  |- Currently failed: 8
|  |- Total failed:     4399
|  `- Journal matches:  _SYSTEMD_UNIT=sshd.service + _COMM=sshd
`- Actions
   |- Currently banned: 101
   |- Total banned:     684
   `- Banned IP list:   ...
```

监控 fail2ban 日志文件是否有入侵尝试，可以通过“尾随”日志来实现：

```
$ sudo tail -f /var/log/fail2ban.log
```

`tail` 是一个很好的命令行工具，默认情况下，它可以显示一个文件的最后 10 行。添加 `-f` 告诉它尾随文件，这是个观察一个仍在被写入的文件的很好方式。

由于输出的内容中有真实的 IP，所以这里不会提供样本，但它的可读性很高。`INFO` 行通常是登录的尝试。如果从一个特定的 IP 地址进行了足够多的尝试，你会看到一个 `NOTICE` 行显示一个 IP 地址被禁止。在达到禁止时间后，你会看到一个 `NOTICE` 解禁行。

注意几个警告行。最常见的情况是，当添加了一个禁止后，fail2ban 发现该 IP 地址已经在其禁止数据库中，这意味着禁止可能无法正常工作。如果是最近安装的 fail2ban 包，它应该被设置为 FirewallD 的富规则。这个包在 fail2ban-0.11.1-6 版本时从 ipset 方式切换到了富规则方式，所以如果你的 fail2ban 安装时间较早，它可能还在尝试使用 ipset 方式，这种方式使用的是传统的 iptables，不是很可靠。

#### FirewallD 配置

##### 被动还是主动？

有两种策略可以分开或一起使用：**被动**地将单个 IP 地址或**主动**地根据来源国将子网永久列入黑名单。

对于被动方式，一旦 fail2ban 运行了一段时间，最好再运行 `sudo fail2ban-client status sshd` 来看看有哪些坏蛋。很可能会有很多被禁止的 IP 地址。选择一个，然后试着对它运行 `whois`。在输出结果中可能会有很多有趣的信息，但是对于这个方法来说，只有来源国是重要的。为了保持简单，让我们过滤掉除了国家以外的所有信息。

在这个例子中，我们将使用一些著名的域名：

```
$ whois google.com | grep -i country
Registrant Country: US
Admin Country: US
Tech Country: US
```

```
$ whois rpmfusion.org | grep -i country
Registrant Country: FR
```

```
$ whois aliexpress.com | grep -i country
Registrant Country: CN
```

使用 `grep -i` 的原因是为了使 `grep` 不区分大小写，而大多数条目都使用的是 “Country”，而有些条目则是全小写的 “country”，所以这种方法无论如何都能匹配。

现在知道了尝试入侵的来源国，问题是，“是否有来自这个国家的人有合法的理由连接到这台计算机？”如果答案是否定的，那么封锁整个国家应该是可以接受的。

从功能上看，主动式方法它与被动式方法没有太大区别，然而，来自有些国家的入侵企图是非常普遍的。如果你的系统既不放在这些国家里，也没有任何源自这些国家的客户，那么为什么不现在就把它们加入黑名单而是等待呢？（LCTT 译注：我的经验是，动辄以国家的范畴而列入黑名单有些过于武断。建议可以将该 IP 所属的 WHOIS 网段放入到黑名单，因为这些网段往往具有相同的使用性质，如都用于用户接入或 IDC 托管，其安全状况也大致相同，因此，如果有来自该网段的某个 IP 的恶意尝试，可以预期该网段内的其它 IP 也可能被利用来做这样的尝试。）

##### 黑名单脚本和配置

那么如何做到这一点呢？用 FirewallD ipset。我开发了下面的脚本来尽可能地自动化这个过程：

```
#!/bin/bash
# Based on the below article
# https://www.linode.com/community/questions/11143/top-tip-firewalld-and-ipset-country-blacklist

# Source the blacklisted countries from the configuration file
. /etc/blacklist-by-country

# Create a temporary working directory
ipdeny_tmp_dir=$(mktemp -d -t blacklist-XXXXXXXXXX)
pushd $ipdeny_tmp_dir

# Download the latest network addresses by country file
curl -LO http://www.ipdeny.com/ipblocks/data/countries/all-zones.tar.gz
tar xf all-zones.tar.gz

# For updates, remove the ipset blacklist and recreate
if firewall-cmd -q --zone=drop --query-source=ipset:blacklist; then
    firewall-cmd -q --permanent --delete-ipset=blacklist
fi

# Create the ipset blacklist which accepts both IP addresses and networks
firewall-cmd -q --permanent --new-ipset=blacklist --type=hash:net \
    --option=family=inet --option=hashsize=4096 --option=maxelem=200000 \
    --set-description="An ipset list of networks or ips to be dropped."

# Add the address ranges by country per ipdeny.com to the blacklist
for country in $countries; do
    firewall-cmd -q --permanent --ipset=blacklist \
        --add-entries-from-file=./$country.zone && \
        echo "Added $country to blacklist ipset."
done

# Block individual IPs if the configuration file exists and is not empty
if [ -s "/etc/blacklist-by-ip" ]; then
    echo "Adding IPs blacklists."
    firewall-cmd -q --permanent --ipset=blacklist \
        --add-entries-from-file=/etc/blacklist-by-ip && \
        echo "Added IPs to blacklist ipset."
fi

# Add the blacklist ipset to the drop zone if not already setup
if firewall-cmd -q --zone=drop --query-source=ipset:blacklist; then
    echo "Blacklist already in firewalld drop zone."
else
    echo "Adding ipset blacklist to firewalld drop zone."
    firewall-cmd --permanent --zone=drop --add-source=ipset:blacklist
fi

firewall-cmd -q --reload

popd
rm -rf $ipdeny_tmp_dir
```

这个应该安装到 `/usr/local/sbin`，不要忘了让它可执行！

```
$ sudo chmod +x /usr/local/sbin/firewalld-blacklist
```

然后创建一个配置文件 `/etc/blacklist-by-country`：

```
# Which countries should be blocked?
# Use the two letter designation separated by a space.
countries=""
```

而另一个配置文件 `/etc/blacklist-by-ip`，每行只有一个 IP，没有任何额外的格式化。

在这个例子中，从 ipdeny 的区文件中随机选择了 10 个国家：

```
# ls | shuf -n 10 | sed "s/\.zone//g" | tr '\n' ' '
nl ee ie pk is sv na om gp bn
```

现在只要在配置文件中加入至少一个国家，就可以运行了！

```
$ sudo firewalld-blacklist
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   142  100   142    0     0   1014      0 --:--:-- --:--:-- --:--:--  1014
100  662k  100  662k    0     0   989k      0 --:--:-- --:--:-- --:--:--  989k
Added nl to blacklist ipset.
Added ee to blacklist ipset.
Added ie to blacklist ipset.
Added pk to blacklist ipset.
Added is to blacklist ipset.
Added sv to blacklist ipset.
Added na to blacklist ipset.
Added om to blacklist ipset.
Added gp to blacklist ipset.
Added bn to blacklist ipset.
Adding ipset blacklist to firewalld drop zone.
success
```

要验证 FirewallD 黑名单是否成功，请检查 `drop` 区和 `blacklist` ipset。

```
$ sudo firewall-cmd --info-zone=drop
drop (active)
  target: DROP
  icmp-block-inversion: no
  interfaces:
  sources: ipset:blacklist
  services:
  ports:
  protocols:
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:

$ sudo firewall-cmd --info-ipset=blacklist | less
blacklist
  type: hash:net
  options: family=inet hashsize=4096 maxelem=200000
  entries:
```

第二条命令将输出所有的子网，这些子网是基于被封杀的国家而添加的，可能会相当长。

### 那么现在我该怎么做？

虽然在开始的时候，监控的频率会比较高，但随着时间的推移，入侵尝试的次数应该会随着黑名单的增加而减少。那么目标应该是维护而不是主动监控。

为此，我创建了一个 SystemD 服务文件和定时器，这样每月都会刷新由 ipdeny 维护的每个国家的子网。事实上，这里讨论的所有内容都可以从我的 [pagure.io](https://pagure.io/firewalld-blacklist) 项目中下载。

是不是很高兴你看完了整篇文章？现在只要把服务文件和定时器下载到 `/etc/systemd/system/`，并启用定时器就行了：

```
$ sudo systemctl daemon-reload
$ sudo systemctl enable --now firewalld-blacklist.timer
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/protect-your-system-with-fail2ban-and-firewalld-blacklists/

作者：[hobbes1069][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hobbes1069/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/06/fail2ban-and-firewalld-816x345.png
[2]: https://www.linode.com/community/questions/11143/top-tip-firewalld-and-ipset-country-blacklist
