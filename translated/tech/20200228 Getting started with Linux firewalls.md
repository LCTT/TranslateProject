[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "Getting started with Linux firewalls"
[#]: via: "https://opensource.com/article/20/2/firewall-cheat-sheet"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"

Linux 防火墙入门教程
======
防火墙是你的计算机防止网络入侵的第一道屏障。为确保你的安全，请下载我们的备忘单。
![Cheat Sheet cover image][1]

合理的防火墙是你的计算机防止网络入侵的第一道屏障。你在家里上网，通常互联网服务提供会在路由中搭建了一层防火墙。如果不在家里上网，那么你计算机上的那层防火墙就是仅有的一层，因为配置和控制好你 Linux 电脑上的防火墙很重要。如果你维护一台 Linux 服务器，知道怎么去管理你的防火墙同样重要，只要掌握了这些知识你才能保护你的服务器免于本地或远程非法流量的入侵。

### 安装防火墙

很多 Linux 发行版本已经自带了防火墙，通常是 `iptables`。它很有效并可以自定义，但配置起来有点复杂。幸运的是，有开发者写出了一些前端界面来帮助用户不需要写冗长的 iptables 规则就可以控制防火墙。

在 Fedora，CentOS，Red Hat 和一些类似的发行版本上，默认安装的防火墙软件是 `firewalld`，是用 **firewall-cmd** 命令来配置和控制的。在 Debian 和大部分其他发行版上，可以从你的软件仓库安装 firewalld。Ubuntu 自带的是 Uncomplicated Firewall（ufw），所以你必须打开 **universe** 库才能使用 firewalld：


```
$ sudo add-apt-repository universe
$ sudo apt install firewalld
```

你还需要停用 ufw：


```
`$ sudo systemctl disable ufw`
```

没有理由*不*用 ufw。它是一个强大的防火墙前端。然而，本文重点讲 firewalld，因为大部分发行版都支持它而且它集成到了 systemd，systemd 是几乎所有发行版都自带的。

不管你的发行版是哪个，都要先激活防火墙才能让它生效，激活需要在启动时加载：


```
`$ sudo systemctl enable --now firewalld`
```

### 理解防火墙的 zone

Firewalld 旨在让防火墙的配置工作尽可能简单。它通过建立 *zone* 来实现这个目标。一个 zone 是一类型的合理、通用的规则，这些规则适配大部分用户的日常需求。

  * **trusted:** All network connections are accepted. This is the least paranoid firewall setting and should only be used in a trusted environment, such as a test lab or in a family home where everyone on the local network is known to be friendly.
  * **home, work, internal:** In these three zones, most incoming connections are accepted. They each exclude traffic on ports that usually expect no activity. Any of them is a reasonable setting for use in a home setting where there is no reason to expect network traffic to obscure ports, and you generally trust the other users on the network.
  * **public:** For use in public areas. This is a paranoid setting, intended for times when you do not trust other computers on the network. Only selected common and mostly safe incoming connections are accepted.
  * **dmz:** DMZ stands for demilitarized zone. This zone is intended for computers that are publically accessible, located on an organization's external network with limited access to the internal network. For personal computers, this is usually not a useful zone, but it is an important option for certain types of servers.
  * **external:** For use on external networks with masquerading enabled (meaning the addresses of your private network are mapped to and hidden behind a public IP address). Similar to the dmz zone, only selected incoming connections are accepted, including SSH.
  * **block:** Only network connections initiated within this system are possible, and all incoming network connections are rejected with an **icmp-host-prohibited** message. This is an extremely paranoid setting and is an important option for certain types of servers or personal computers in an untrusted or hostile environment.
  * **drop:** Any and all incoming network packets are dropped with no reply. Only outgoing network connections are possible. The only setting more paranoid than this one is turning off your WiFi and unplugging your Ethernet cable.



You can read about each zone and any other zones defined by your distribution or sysadmin by looking at the configuration files in **/usr/lib/firewalld/zones**. For instance, here's the FedoraWorkstation zone that ships with Fedora 31:


```
$ cat /usr/lib/firewalld/zones/FedoraWorkstation.xml
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;zone&gt;
  &lt;short&gt;Fedora Workstation&lt;/short&gt;
  &lt;description&gt;Unsolicited incoming network packets are rejected from port 1 to 1024, except for select network services. Incoming packets that are related to outgoing network connections are accepted. Outgoing network connections are allowed.&lt;/description&gt;
  &lt;service name="dhcpv6-client"/&gt;
  &lt;service name="ssh"/&gt;
  &lt;service name="samba-client"/&gt;
  &lt;port protocol="udp" port="1025-65535"/&gt;
  &lt;port protocol="tcp" port="1025-65535"/&gt;
&lt;/zone&gt;
```

### Getting your current zone

You can see what zone you're in at any time with the **\--get-active-zones** option:


```
`$ sudo firewall-cmd --get-active-zones`
```

In response, you receive the name of the active zone along with the network interface assigned to it. On a laptop, that usually means you have a WiFi card in the default zone:


```
FedoraWorkstation
  interfaces: wlp61s0
```

### Change your current zone

To change your zone, reassign your network interface to a different zone. For instance, to change the example **wlp61s0** card to the public zone:


```
$ sudo firewall-cmd --change-interface=wlp61s0 \
\--zone=public
```

You can change the active zone for an interface any time you please and for any reason—whether you're going out to a café and feel the need to increase your laptop's security policy, or you're going to work and need to open up some ports to get on the intranet, or for any other reason. The options for **firewall-cmd** auto-complete when you press the **Tab** key, so as long as you remember the keywords "change" and "zone," you can stumble through the command until you learn it by memory.

### Learn more

There's a lot more you can do with your firewall, including customizing existing zones, setting a default zone, and more. The more comfortable with firewalls you get, the more secure your online activities are, so we've created a [cheat sheet][2] for quick and easy reference.

### Download your [firewall cheat sheet][2]

David Both shares how he replaced his dedicated network firewall computer with a Raspberry Pi 2.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/firewall-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP "Cheat Sheet cover image"
[2]: https://opensource.com/downloads/firewall-cmd-cheat-sheet
