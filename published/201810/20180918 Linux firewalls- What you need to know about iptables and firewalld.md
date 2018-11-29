Linux 防火墙：关于 iptables 和 firewalld 的那些事
======

> 以下是如何使用 iptables 和 firewalld 工具来管理 Linux 防火墙规则。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openwires_fromRHT_520_0612LL.png?itok=PqZi55Ab)

这篇文章摘自我的书《[Linux in Action][1]》，尚未发布的第二个曼宁出版项目。

### 防火墙

防火墙是一组规则。当数据包进出受保护的网络区域时，进出内容（特别是关于其来源、目标和使用的协议等信息）会根据防火墙规则进行检测，以确定是否允许其通过。下面是一个简单的例子:

![防火墙过滤请求] [3]

*防火墙可以根据协议或基于目标的规则过滤请求。*

一方面， [iptables][4] 是 Linux 机器上管理防火墙规则的工具。

另一方面，[firewalld][5] 也是 Linux 机器上管理防火墙规则的工具。

你有什么问题吗？如果我告诉你还有另外一种工具，叫做 [nftables][6]，这会不会糟蹋你的美好一天呢？

好吧，我承认整件事确实有点好笑，所以让我来解释一下。这一切都从 Netfilter 开始，它在 Linux 内核模块级别控制访问网络栈。几十年来，管理 Netfilter 钩子的主要命令行工具是 iptables 规则集。

因为调用这些规则所需的语法看起来有点晦涩难懂，所以各种用户友好的实现方式，如 [ufw][7] 和 firewalld 被引入，作为更高级别的 Netfilter 解释器。然而，ufw 和 firewalld 主要是为解决单独的计算机所面临的各种问题而设计的。构建全方面的网络解决方案通常需要 iptables，或者从 2014 年起，它的替代品 nftables (nft 命令行工具)。

iptables 没有消失，仍然被广泛使用着。事实上，在未来的许多年里，作为一名管理员，你应该会使用 iptables 来保护的网络。但是 nftables 通过操作经典的 Netfilter 工具集带来了一些重要的崭新的功能。

从现在开始，我将通过示例展示 firewalld 和 iptables 如何解决简单的连接问题。

### 使用 firewalld 配置 HTTP 访问

正如你能从它的名字中猜到的，firewalld 是 [systemd][8] 家族的一部分。firewalld 可以安装在 Debian/Ubuntu 机器上，不过，它默认安装在 RedHat 和 CentOS 上。如果您的计算机上运行着像 Apache 这样的 web 服务器，您可以通过浏览服务器的 web 根目录来确认防火墙是否正在工作。如果网站不可访问，那么 firewalld 正在工作。

你可以使用 `firewall-cmd` 工具从命令行管理 firewalld 设置。添加 `–state` 参数将返回当前防火墙的状态:

```
# firewall-cmd --state
running
```

默认情况下，firewalld 处于运行状态，并拒绝所有传入流量，但有几个例外，如 SSH。这意味着你的网站不会有太多的访问者，这无疑会为你节省大量的数据传输成本。然而，这不是你对 web 服务器的要求，你希望打开 HTTP 和 HTTPS 端口，按照惯例，这两个端口分别被指定为 80 和 443。firewalld 提供了两种方法来实现这个功能。一个是通过 `–add-port` 参数，该参数直接引用端口号及其将使用的网络协议（在本例中为TCP）。 另外一个是通过 `–permanent` 参数，它告诉 firewalld 在每次服务器启动时加载此规则：

```
# firewall-cmd --permanent --add-port=80/tcp
# firewall-cmd --permanent --add-port=443/tcp
```

`–reload` 参数将这些规则应用于当前会话：

```
# firewall-cmd --reload
```

查看当前防火墙上的设置，运行 `–list-services`：

```
# firewall-cmd --list-services
dhcpv6-client http https ssh
```

假设您已经如前所述添加了浏览器访问，那么 HTTP、HTTPS 和 SSH 端口现在都应该是和 `dhcpv6-client` 一样开放的 —— 它允许 Linux 从本地 DHCP 服务器请求 IPv6 IP 地址。

### 使用 iptables 配置锁定的客户信息亭

我相信你已经看到了信息亭——它们是放在机场、图书馆和商务场所的盒子里的平板电脑、触摸屏和 ATM 类电脑，邀请顾客和路人浏览内容。大多数信息亭的问题是，你通常不希望用户像在自己家一样，把他们当成自己的设备。它们通常不是用来浏览、观看 YouTube 视频或对五角大楼发起拒绝服务攻击的。因此，为了确保它们没有被滥用，你需要锁定它们。

一种方法是应用某种信息亭模式，无论是通过巧妙使用 Linux 显示管理器还是控制在浏览器级别。但是为了确保你已经堵塞了所有的漏洞，你可能还想通过防火墙添加一些硬性的网络控制。在下一节中，我将讲解如何使用iptables 来完成。

关于使用 iptables，有两件重要的事情需要记住：你给出的规则的顺序非常关键；iptables 规则本身在重新启动后将无法保持。我会一次一个地在解释这些。

### 信息亭项目 

为了说明这一切，让我们想象一下，我们为一家名为 BigMart 的大型连锁商店工作。它们已经存在了几十年；事实上，我们想象中的祖父母可能是在那里购物并长大的。但是如今，BigMart 公司总部的人可能只是在数着亚马逊将他们永远赶下去的时间。

尽管如此，BigMart 的 IT 部门正在尽他们最大努力提供解决方案，他们向你发放了一些具有 WiFi 功能信息亭设备，你在整个商店的战略位置使用这些设备。其想法是，登录到 BigMart.com 产品页面，允许查找商品特征、过道位置和库存水平。信息亭还允许进入 bigmart-data.com，那里储存着许多图像和视频媒体信息。

除此之外，您还需要允许下载软件包更新。最后，您还希望只允许从本地工作站访问 SSH，并阻止其他人登录。下图说明了它将如何工作：

![信息亭流量IP表] [10] 

*信息亭业务流由 iptables 控制。 *

### 脚本

以下是 Bash 脚本内容：

```
#!/bin/bash
iptables -A OUTPUT -p tcp -d bigmart.com -j ACCEPT
iptables -A OUTPUT -p tcp -d bigmart-data.com -j ACCEPT
iptables -A OUTPUT -p tcp -d ubuntu.com -j ACCEPT
iptables -A OUTPUT -p tcp -d ca.archive.ubuntu.com -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j DROP
iptables -A OUTPUT -p tcp --dport 443 -j DROP
iptables -A INPUT -p tcp -s 10.0.3.1 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -s 0.0.0.0/0 --dport 22 -j DROP
```

我们从基本规则 `-A` 开始分析，它告诉 iptables 我们要添加规则。`OUTPUT` 意味着这条规则应该成为输出链的一部分。`-p` 表示该规则仅使用 TCP 协议的数据包，正如 `-d` 告诉我们的，目的地址是 [bigmart.com][11]。`-j` 参数的作用是当数据包符合规则时要采取的操作是 `ACCEPT`。第一条规则表示允许（或接受）请求。但，往下的规则你能看到丢弃（或拒绝）的请求。

规则顺序是很重要的。因为 iptables 会对一个请求遍历每个规则，直到遇到匹配的规则。一个向外发出的浏览器请求，比如访问 bigmart.com 是会通过的，因为这个请求匹配第一条规则，但是当它到达 `dport 80` 或 `dport 443` 规则时——取决于是 HTTP 还是 HTTPS 请求——它将被丢弃。当遇到匹配时，iptables 不再继续往下检查了。（LCTT 译注：此处原文有误，径改。）

另一方面，向 ubuntu.com 发出软件升级的系统请求，只要符合其适当的规则，就会通过。显然，我们在这里做的是，只允许向我们的 BigMart 或 Ubuntu 发送 HTTP 或 HTTPS 请求，而不允许向其他目的地发送。

最后两条规则将处理 SSH 请求。因为它不使用端口 80 或 443 端口，而是使用 22 端口，所以之前的两个丢弃规则不会拒绝它。在这种情况下，来自我的工作站的登录请求将被接受，但是对其他任何地方的请求将被拒绝。这一点很重要：确保用于端口 22 规则的 IP 地址与您用来登录的机器的地址相匹配——如果不这样做，将立即被锁定。当然，这没什么大不了的，因为按照目前的配置方式，只需重启服务器，iptables 规则就会全部丢失。如果使用 LXC 容器作为服务器并从 LXC 主机登录，则使用主机 IP 地址连接容器，而不是其公共地址。

如果机器的 IP 发生变化，请记住更新这个规则；否则，你会被拒绝访问。

在家玩（是在某种一次性虚拟机上）？太好了。创建自己的脚本。现在我可以保存脚本，使用 `chmod` 使其可执行，并以 `sudo` 的形式运行它。不要担心“igmart-data.com 没找到”之类的错误 —— 当然没找到；它不存在。

```
chmod +X scriptname.sh
sudo ./scriptname.sh
```

你可以使用 `cURL` 命令行测试防火墙。请求 ubuntu.com 奏效，但请求 [manning.com][13] 是失败的 。


```
curl ubuntu.com
curl manning.com
```

### 配置 iptables 以在系统启动时加载

现在，我如何让这些规则在每次信息亭启动时自动加载？第一步是将当前规则保存。使用 `iptables-save` 工具保存规则文件。这将在根目录中创建一个包含规则列表的文件。管道后面跟着 `tee` 命令，是将我的`sudo` 权限应用于字符串的第二部分：将文件实际保存到否则受限的根目录。

然后我可以告诉系统每次启动时运行一个相关的工具，叫做 `iptables-restore` 。我们在上一章节（LCTT 译注：指作者的书）中看到的常规 cron 任务并不适用，因为它们在设定的时间运行，但是我们不知道什么时候我们的计算机可能会决定崩溃和重启。

有许多方法来处理这个问题。这里有一个：

在我的 Linux 机器上，我将安装一个名为 [anacron][14] 的程序，该程序将在 `/etc/` 目录中为我们提供一个名为 `anacrontab` 的文件。我将编辑该文件并添加这个 `iptables-restore` 命令，告诉它加载那个 .rule 文件的当前内容。当引导后，规则每天（必要时）01:01 时加载到 iptables 中（LCTT 译注：anacron 会补充执行由于机器没有运行而错过的 cron 任务，因此，即便 01:01 时机器没有启动，也会在机器启动会尽快执行该任务）。我会给该任务一个标识符（`iptables-restore`），然后添加命令本身。如果你在家和我一起这样，你应该通过重启系统来测试一下。

```
sudo iptables-save | sudo tee /root/my.active.firewall.rules
sudo apt install anacron
sudo nano /etc/anacrontab
1 1 iptables-restore iptables-restore < /root/my.active.firewall.rules
```

我希望这些实际例子已经说明了如何使用 iptables 和 firewalld 来管理基于 Linux 的防火墙上的连接问题。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/linux-iptables-firewalld

作者：[David Clinton][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/remyd
[1]: https://www.manning.com/books/linux-in-action?a_aid=bootstrap-it&a_bid=4ca15fc9&chan=opensource
[2]: /file/409116
[3]: https://opensource.com/sites/default/files/uploads/iptables1.jpg (firewall filtering request)
[4]: https://en.wikipedia.org/wiki/Iptables
[5]: https://firewalld.org/
[6]: https://wiki.nftables.org/wiki-nftables/index.php/Main_Page
[7]: https://en.wikipedia.org/wiki/Uncomplicated_Firewall
[8]: https://en.wikipedia.org/wiki/Systemd
[9]: /file/409121
[10]: https://opensource.com/sites/default/files/uploads/iptables2.jpg (kiosk traffic flow ip tables)
[11]: http://bigmart.com/
[12]: http://youtube.com/
[13]: http://manning.com/
[14]: https://sourceforge.net/projects/anacron/
