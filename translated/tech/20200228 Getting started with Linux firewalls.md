[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Linux firewalls)
[#]: via: (https://opensource.com/article/20/2/firewall-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Linux 防火墙入门教程
======
防火墙是你的计算机防止网络入侵的第一道屏障。为确保你的安全，请下载我们的备忘单。
![Cheat Sheet cover image][1]

合理的防火墙是你的计算机防止网络入侵的第一道屏障。你在家里上网，通常互联网服务提供会在路由中搭建一层防火墙。如果不在家里上网，那么你计算机上的那层防火墙就是仅有的一层，因为配置和控制好你 Linux 电脑上的防火墙很重要。如果你维护一台 Linux 服务器，知道怎么去管理你的防火墙同样重要，只要掌握了这些知识你才能保护你的服务器免于本地或远程非法流量的入侵。

### 安装防火墙

很多 Linux 发行版本已经自带了防火墙，通常是 `iptables`。它很强大并可以自定义，但配置起来有点复杂。幸运的是，有开发者写出了一些前端界面来帮助用户不需要写冗长的 iptables 规则就可以控制防火墙。

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

  * **trusted:** 接受所有的连接。这是最低级别的防火墙设置，只能在一个完全信任的环境中，如测试实验室或网络中相互都认识的家庭网络中。
  * **home, work, internal: **在这三个 zone 中，接受大部分来的连接。它们每个都会拒绝不活跃的端口进来的流量。这三个都适合用于家庭环境中，因为在家庭环境中不会出现端口模糊的网络流量，在家庭网络中你可以基本信任其他的用户。
  * **public:** 用于公共区域内。这是个极端的设置，当你不信任网络中的其他计算机时使用。只能接收经过选择的和基本安全的连接。
  * **dmz:** DMZ 表示隔离区。这个 zone 多用于可公开访问的计算机，属于某个组织的外部网络不能完全访问内网的计算机。对于个人计算机，它没什么用，但是对某类服务器来说它是个很重要的选项。
  * **external:** 用于外部网络，会开启伪装（你私人网络的地址被映射到一个外网 IP 地址，并隐藏起来）。跟 DMZ 类似，仅接受经过选择的连接，包括 SSH。
  * **block:** 仅接收在本系统中初始化的网络连接。接收到的任何网络连接都会被 **icmp-host-prohibited** 信息拒绝。这个一个极度偏激的设置，对于某类服务器或处于不信任或不安全的环境中的个人计算机来说很重要。
      * **drop:** 接收的所有网络包都被丢弃，没有任何回复。仅能有发送出去的网络连接。比这个设置更极端的办法，只有关闭 WiFi 和拔掉网线。



你可以查看你发行版本的所有 zone，或通过配置文件 **/usr/lib/firewalld/zones** 来查看管理员设置。举个例子：下面是 Fefora 31 自带的 FedoraWorkstation zone：


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

### 获取当前的 zone

任何时候你都可以通过 **\--get-active-zones** 选项来查看你是在哪个 zone


```
`$ sudo firewall-cmd --get-active-zones`
```

输出结果中，会有当前活跃的 zone 名字和分配给它的网络接口。笔记本电脑上，在默认 zone 中通常意味着你有个 WiFi 卡：


```
FedoraWorkstation
  interfaces: wlp61s0
```

### 修改你当前的 zone

把你的网络接口分配给另一个 zone，就可以改变 zone。例如，把例子中的 **wlp61s0** 卡修改为 public zone：


```
$ sudo firewall-cmd --change-interface=wlp61s0 \
\--zone=public
```

你可以为一个接口修改活跃的 zone，不管出于什么理由 — 无论你是要出去喝杯咖啡还是感觉有必要增强笔记本电脑的安全策略，无论是你要去工作需要开启某些端口才能进入内联网，还是任何其他的理由。在你凭记忆学会 **firewall-cmd** 命令之前，你只要记住了关键词 ”change“ 和 ”zone“，就可以慢慢掌握，因为按下 **Tab** 时，它的选项会自动补全。

### 更多信息

你可以用你的防火墙干更多的事，比如自定义已存在的 zone，设置默认的 zone，等等。你对防火墙越了解，你在网上的活动就越安全，所以我们创建了一个[备忘单][2]便于速查和参考。

### 下载你的 [防火墙备忘单][2]

David Both分享了他是怎样用树莓派 2 替换他的专用网络防火墙电脑的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/firewall-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://opensource.com/downloads/firewall-cmd-cheat-sheet
