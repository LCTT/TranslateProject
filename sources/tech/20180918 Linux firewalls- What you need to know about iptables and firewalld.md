heguangzhi  translating

Linux 防火墙: 关于 iptables 和 firewalld，你需要知道些什么
======

以下是如何使用 iptables 和 firewalld 工具来管理 Linux 防火墙规则。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openwires_fromRHT_520_0612LL.png?itok=PqZi55Ab)
这篇文章摘自我的书[Linux in Action][1]，第二 Manning project  尚未发布。

### 防火墙

A firewall is a set of rules. When a data packet moves into or out of a protected network space, its contents (in particular, information about its origin, target, and the protocol it plans to use) are tested against the firewall rules to see if it should be allowed through. Here’s a simple example:

防火墙是一组规则。当数据包进出受保护的网络时，进出内容(特别是关于其来源、目标和使用的协议等信息)会根据防火墙规则进行检测，以确定是否允许其通过。下面是一个简单的例子:


![防火墙过滤请求] [3]

防火墙可以根据协议或基于目标的规则过滤请求。

一方面， [iptables][4] 是 Linux 机器上管理防火墙规则的工具。

另一方面，[firewalld][5]也是 Linux 机器上管理防火墙规则的工具。

你有什么问题吗？如果我告诉你还有另外一种工具，叫做 [nftables][6]，这会不会糟蹋你的一天呢？

好吧，我承认整件事确实有点好笑，所以让我解释一下了。这一切都从 Netfilter 开始，在 Linux 内核模块级别， Netfilter 控制访问网络栈。几十年来，管理 Netfilter 钩子的主要命令行工具是 iptables 规则集。

因为调用这些规则所需的语法看起来有点晦涩难懂，所以各种用户友好的实现方式，如[ufw][7] 和 firewalld 被引入作，并为更高级别的 Netfilter 解释器。然而，Ufw 和 firewalld 主要是为解决独立计算机面临的各种问题而设计的。构建全方面的网络解决方案通常需要 iptables，或者从2014年起，它的替代品 nftables (nft 命令行工具)。


iptables 没有消失，仍然被广泛使用着。事实上，在未来的许多年里，作为一名管理员，你应该会使用 iptables 来保护的网络。但是nftables 通过操作经典的 Netfilter 工具集带来了一些重要的崭新的功能。


从现在开始，我将通过示例展示 firewalld 和 iptables 如何解决简单的连接问题。

### 使用 firewalld 配置 HTTP 访问

正如你能从它的名字中猜到的，firewalld 是 [systemd][8] 家族的一部分。Firewalld 可以安装在 Debian/Ubuntu 机器上，不过， 它默认安装在 RedHat 和 CentOS 上。如果您的计算机上运行着像 Apache 这样的 web 服务器，您可以通过浏览服务器的 web 根目录来确认防火墙是否正在工作。如果网站不可访问，那么 firewalld 正在工作。

你可以使用 `firewall-cmd` 工具从命令行管理 firewalld 设置。添加 `–state`  参数将返回当前防火墙的状态:

```
# firewall-cmd --state
running
```

默认情况下，firewalld 将处于运行状态，并将拒绝所有传入流量，但有几个例外，如 SSH。这意味着你的网站不会有太多的访问者，这无疑会为你节省大量的数据传输成本。然而，这不是你对 web 服务器的要求，你希望打开 HTTP 和 HTTPS 端口，按照惯例，这两个端口分别被指定为80和443。firewalld 提供了两种方法来实现这个功能。一个是通过 `–add-port` 参数，该参数直接引用端口号及其将使用的网络协议(在本例中为TCP )。 另外一个是通过`–permanent` 参数，它告诉 firewalld 在每次服务器启动时加载此规则:


```
# firewall-cmd --permanent --add-port=80/tcp
# firewall-cmd --permanent --add-port=443/tcp
```

 `–reload` 参数将这些规则应用于当前会话:

```
# firewall-cmd --reload
```

查看当前防火墙上的设置, 运行 `–list-services` :

```
# firewall-cmd --list-services
dhcpv6-client http https ssh
```

假设您已经如前所述添加了浏览器访问，那么 HTTP、HTTPS 和 SSH 端口现在都应该是开放的—— `dhcpv6-client` ，它允许 Linux 从本地 DHCP 服务器请求 IPv6 IP地址。

### 使用 iptables 配置锁定的客户信息亭

我相信你已经看到了信息亭——它们是放在机场、图书馆和商务场所的盒子里的平板电脑、触摸屏和ATM类电脑，邀请顾客和路人浏览内容。大多数信息亭的问题是，你通常不希望用户像在自己家一样，把他们当成自己的设备。它们通常不是用来浏览、观看 YouTube 视频或对五角大楼发起拒绝服务攻击的。因此，为了确保它们没有被滥用，你需要锁定它们。


一种方法是应用某种信息亭模式，无论是通过巧妙使用Linux显示管理器还是在浏览器级别。但是为了确保你已经堵塞了所有的漏洞，你可能还想通过防火墙添加一些硬网络控制。在下一节中，我将讲解如何使用iptables 来完成。


关于使用iptables，有两件重要的事情需要记住:你给规则的顺序非常关键，iptables 规则本身在重新启动后将无法存活。我会一次一个地在解释这些。

### 信息亭项目 

为了说明这一切，让我们想象一下，我们为一家名为 BigMart 的大型连锁商店工作。它们已经存在了几十年；事实上，我们想象中的祖父母可能是在那里购物并长大的。但是这些天，BigMart 公司总部的人可能只是在数着亚马逊将他们永远赶下去的时间。


Nevertheless, BigMart’s IT department is doing its best, and they’ve just sent you some WiFi-ready kiosk devices that you’re expected to install at strategic locations throughout your store. The idea is that they’ll display a web browser logged into the BigMart.com products pages, allowing them to look up merchandise features, aisle location, and stock levels. The kiosks will also need access to bigmart-data.com, where many of the images and video media are stored.


尽管如此，BigMart 的IT部门正在尽他们最大努力提供解决方案，他们向你发放了一些具有 WiFi 功能信息亭设备，你在整个商店的战略位置使用这些设备。其想法是，登录到 BigMart.com 产品页面，允许查找商品特征、过道位置和库存水平。信息亭还允许进入 bigmart-data.com，那里储存着许多图像和视频媒体信息。

除此之外，您还需要允许下载软件包更新。最后，您还希望只允许从本地工作站访问SSH，并阻止其他人登录。下图说明了它将如何工作:


![信息亭流量IP表] [10] 

信息亭业务流由 iptables 控制。 

### The script

Here’s how that will all fit into a Bash script:

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

The basic anatomy of our rules starts with `-A`, telling iptables that we want to add the following rule. `OUTPUT` means that this rule should become part of the OUTPUT chain. `-p` indicates that this rule will apply only to packets using the TCP protocol, where, as `-d` tells us, the destination is [bigmart.com][11]. The `-j` flag points to `ACCEPT` as the action to take when a packet matches the rule. In this first rule, that action is to permit, or accept, the request. But further down, you can see requests that will be dropped, or denied.

Remember that order matters. And that’s because iptables will run a request past each of its rules, but only until it gets a match. So an outgoing browser request for, say, [youtube.com][12] will pass the first four rules, but when it gets to either the `–dport 80` or `–dport 443` rule—depending on whether it’s an HTTP or HTTPS request—it’ll be dropped. iptables won’t bother checking any further because that was a match.

On the other hand, a system request to ubuntu.com for a software upgrade will get through when it hits its appropriate rule. What we’re doing here, obviously, is permitting outgoing HTTP or HTTPS requests to only our BigMart or Ubuntu destinations and no others.

The final two rules will deal with incoming SSH requests. They won’t already have been denied by the two previous drop rules since they don’t use ports 80 or 443, but 22. In this case, login requests from my workstation will be accepted but requests for anywhere else will be dropped. This is important: Make sure the IP address you use for your port 22 rule matches the address of the machine you’re using to log in—if you don’t do that, you’ll be instantly locked out. It's no big deal, of course, because the way it’s currently configured, you could simply reboot the server and the iptables rules will all be dropped. If you’re using an LXC container as your server and logging on from your LXC host, then use the IP address your host uses to connect to the container, not its public address.

You’ll need to remember to update this rule if my machine’s IP ever changes; otherwise, you’ll be locked out.

Playing along at home (hopefully on a throwaway VM of some sort)? Great. Create your own script. Now I can save the script, use `chmod` to make it executable, and run it as `sudo`. Don’t worry about that `bigmart-data.com not found` error—of course it’s not found; it doesn’t exist.

```
chmod +X scriptname.sh
sudo ./scriptname.sh
```

You can test your firewall from the command line using `cURL`. Requesting ubuntu.com works, but [manning.com][13] fails.

```
curl ubuntu.com
curl manning.com
```

### Configuring iptables to load on system boot

Now, how do I get these rules to automatically load each time the kiosk boots? The first step is to save the current rules to a .rules file using the `iptables-save` tool. That’ll create a file in the root directory containing a list of the rules. The pipe, followed by the tee command, is necessary to apply my `sudo` authority to the second part of the string: the actual saving of a file to the otherwise restricted root directory.

I can then tell the system to run a related tool called `iptables-restore` every time it boots. A regular cron job of the kind we saw in the previous module won’t help because they’re run at set times, but we have no idea when our computer might decide to crash and reboot.

There are lots of ways to handle this problem. Here’s one:

On my Linux machine, I’ll install a program called [anacron][14] that will give us a file in the /etc/ directory called anacrontab. I’ll edit the file and add this `iptables-restore` command, telling it to load the current values of that .rules file into iptables each day (when necessary) one minute after a boot. I’ll give the job an identifier (`iptables-restore`) and then add the command itself. Since you’re playing along with me at home, you should test all this out by rebooting your system.

```
sudo iptables-save | sudo tee /root/my.active.firewall.rules
sudo apt install anacron
sudo nano /etc/anacrontab
1 1 iptables-restore iptables-restore < /root/my.active.firewall.rules

```

I hope these practical examples have illustrated how to use iptables and firewalld for managing connectivity issues on Linux-based firewalls.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/linux-iptables-firewalld

作者：[David Clinton][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[校对者ID](https://github.com/校对者ID)

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
