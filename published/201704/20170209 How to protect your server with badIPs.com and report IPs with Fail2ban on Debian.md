使用 badIPs.com 保护你的服务器，并通过 Fail2ban 报告恶意 IP
============================================================

这篇指南向你介绍使用 badips 滥用追踪器（abuse tracker） 和 Fail2ban 保护你的服务器或计算机的步骤。我已经在 Debian 8 Jessie 和 Debian 7 Wheezy 系统上进行了测试。

**什么是 badIPs？**

BadIps 是通过 [fail2ban][8] 报告为不良 IP 的列表。

这个指南包括两个部分，第一部分介绍列表的使用，第二部分介绍数据注入。

### 使用 badIPs 列表

#### 定义安全等级和类别

你可以通过使用 REST API 获取 IP 地址列表。

* 当你使用 GET 请求获取 URL：[https://www.badips.com/get/categories][9] 后，你就可以看到服务中现有的所有不同类别。
*	第二步，决定适合你的等级。 参考 badips 应该有所帮助（我个人使用 `scope = 3`）：
*	如果你想要编译一个统计信息模块或者将数据用于实验目的，那么你应该用等级 0 开始。
*	如果你想用防火墙保护你的服务器或者网站，使用等级 2。可能也要和你的结果相结合，尽管它们可能没有超过 0 或 1 的情况。
*	如果你想保护一个网络商店、或高流量、赚钱的电子商务服务器，我推荐你使用值 3 或 4。当然还是要和你的结果相结合。
*	如果你是偏执狂，那就使用 5。

现在你已经有了两个变量，通过把它们两者连接起来获取你的链接。

```
http://www.badips.com/get/list/{{SERVICE}}/{{LEVEL}}
```

注意：像我一样，你可以获取所有服务。在这种情况下把服务的名称改为 `any`。

最终的 URL 就是：

```
https://www.badips.com/get/list/any/3
```

### 创建脚本

所有都完成了之后，我们就会创建一个简单的脚本。

1、	把你的列表放到一个临时文件。

2、	在 iptables 中创建一个链（chain）（只需要创建一次）。（LCTT 译注：iptables 可能包括多个表（tables），表可能包括多个链（chains），链可能包括多个规则（rules））

3、	把所有链接到该链的数据（旧条目）刷掉。

4、	把每个 IP 链接到这个新的链。

5、	完成后，阻塞所有链接到该链的 INPUT / OUTPUT /FORWARD 请求。

6、	删除我们的临时文件。

为此，我们创建脚本：

```
cd /home/<user>/
vi myBlacklist.sh
```

把以下内容输入到文件。

```
#!/bin/sh
### based on this version http://www.timokorthals.de/?p=334
### adapted by Stéphane T.

_ipt=/sbin/iptables    ### iptables 路径（应该是这个）
_input=badips.db       ### 数据库的名称（会用这个名称下载）
_pub_if=eth0           ### 连接到互联网的设备（执行 $ifconfig 获取）
_droplist=droplist     ### iptables 中链的名称（如果你已经有这么一个名称的链，你就换另外一个）
_level=3               ### Blog（LCTT 译注：Bad log）等级：不怎么坏（0）、确认坏（3）、相当坏（5）（从 www.badips.com 获取详情）
_service=any           ### 记录日志的服务（从 www.badips.com 获取详情）

# 获取不良 IPs
wget -qO- http://www.badips.com/get/list/${_service}/$_level > $_input || { echo "$0: Unable to download ip list."; exit 1; }

### 设置我们的黑名单 ###
### 首先清除该链
$_ipt --flush $_droplist

### 创建新的链
### 首次运行时取消下面一行的注释
# $_ipt -N $_droplist

### 过滤掉注释和空行
### 保存每个 ip 到 $ip
for ip in `cat $_input`
do
	### 添加到 $_droplist
	$_ipt -A $_droplist -i ${_pub_if} -s $ip -j LOG --log-prefix "Drop Bad IP List "
	$_ipt -A $_droplist -i ${_pub_if} -s $ip -j DROP
done

### 最后，插入或者追加到我们的黑名单列表
$_ipt -I INPUT -j $_droplist
$_ipt -I OUTPUT -j $_droplist
$_ipt -I FORWARD -j $_droplist

### 删除你的临时文件
rm $_input
exit 0
```

完成这些后，你应该创建一个定时任务定期更新我们的黑名单。

为此，我使用 crontab 在每天晚上 11:30（在我的延迟备份之前） 运行脚本。

```
crontab -e
```
```
23 30 * * * /home/<user>/myBlacklist.sh #Block BAD IPS
```

别忘了更改脚本的权限：

````
chmod + x myBlacklist.sh
```

现在终于完成了，你的服务器/计算机应该更安全了。

你也可以像下面这样手动运行脚本：

```
cd /home/<user>/
./myBlacklist.sh
```

它可能要花费一些时间，因此期间别中断脚本。事实上，耗时取决于该脚本的最后一行。

### 使用 Fail2ban 向 badIPs 报告 IP 地址

在本篇指南的第二部分，我会向你展示如何通过使用 Fail2ban 向 badips.com 网站报告不良 IP 地址。

#### Fail2ban >= 0.8.12

通过 Fail2ban 完成报告。取决于你 Fail2ban 的版本，你要使用本章的第一或第二节。

如果你 fail2ban 的版本是 0.8.12 或更新版本。

```
fail2ban-server --version
```

在每个你要报告的类别中，添加一个 action。

```
[ssh]
enabled = true
action = iptables-multiport
         badips[category=ssh]
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry= 6
```

正如你看到的，类别是 SSH，从 ([https://www.badips.com/get/categories][11]) 查找正确类别。

#### Fail2ban < 0.8.12

如果版本是 0.8.12 之前，你需要新建一个 action。你可以从 [https://www.badips.com/asset/fail2ban/badips.conf][12] 下载。

```
wget https://www.badips.com/asset/fail2ban/badips.conf -O /etc/fail2ban/action.d/badips.conf
```

在上面的 badips.conf 中，你可以像前面那样激活每个类别，也可以全局启用它：

```
cd /etc/fail2ban/
vi jail.conf
```

```
[DEFAULT]
...

banaction = iptables-multiport
            badips
```

现在重启 fail2ban - 从现在开始它就应该开始报告了。

	service fail2ban restart

### 你的 IP 报告统计信息

最后一步 - 没那么有用。你可以创建一个密钥。  但如果你想看你的数据，这一步就很有帮助。  

复制/粘贴下面的命令，你的控制台中就会出现一个 JSON 响应。

```
wget https://www.badips.com/get/key -qO -

{
  "err":"",
  "suc":"new key 5f72253b673eb49fc64dd34439531b5cca05327f has been set.",
  "key":"5f72253b673eb49fc64dd34439531b5cca05327f"
}
```

到 [badips][13] 网站，输入你的 “key” 并点击 “statistics”。

现在你就可以看到不同类别的统计信息。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/

作者：[Stephane T][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/
[1]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#define-your-security-level-and-category
[2]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#failban-gt-
[3]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#failban-ltnbsp
[4]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#use-the-badips-list
[5]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#lets-create-the-script
[6]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#report-ip-addresses-to-badips-with-failban
[7]:https://www.howtoforge.com/tutorial/protect-your-server-computer-with-badips-and-fail2ban/#statistics-of-your-ip-reporting
[8]:http://www.fail2ban.org/
[9]:https://www.badips.com/get/categories
[10]:http://www.timokorthals.de/?p=334
[11]:https://www.badips.com/get/categories
[12]:https://www.badips.com/asset/fail2ban/badips.conf
[13]:https://www.badips.com/
