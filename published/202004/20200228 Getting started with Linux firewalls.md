[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12130-1.html)
[#]: subject: (Getting started with Linux firewalls)
[#]: via: (https://opensource.com/article/20/2/firewall-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Linux 防火墙入门教程
======

> 防火墙是你的计算机防止网络入侵的第一道屏障。为确保你的安全，请下载我们的备忘单。

![](https://img.linux.net.cn/data/attachment/album/202004/20/104205paugcytauqctqw6c.jpg)

合理的防火墙是你的计算机防止网络入侵的第一道屏障。你在家里上网，通常互联网服务提供会在路由中搭建一层防火墙。当你离开家时，那么你计算机上的那层防火墙就是仅有的一层，所以配置和控制好你 Linux 电脑上的防火墙很重要。如果你维护一台 Linux 服务器，那么知道怎么去管理你的防火墙同样重要，只要掌握了这些知识你才能保护你的服务器免于本地或远程非法流量的入侵。

### 安装防火墙

很多 Linux 发行版本已经自带了防火墙，通常是 `iptables`。它很强大并可以自定义，但配置起来有点复杂。幸运的是，有开发者写出了一些前端程序来帮助用户控制防火墙，而不需要写冗长的 iptables 规则。

在 Fedora、CentOS、Red Hat 和一些类似的发行版本上，默认安装的防火墙软件是 `firewalld`，通过 `firewall-cmd` 命令来配置和控制。在 Debian 和大部分其他发行版上，可以从你的软件仓库安装 firewalld。Ubuntu 自带的是<ruby>简单防火墙<rt>Uncomplicated Firewall</rt></ruby>（ufw），所以要使用 firewalld，你必须启用 `universe` 软件仓库：

```
$ sudo add-apt-repository universe
$ sudo apt install firewalld
```

你还需要停用 ufw：

```
$ sudo systemctl disable ufw
```

没有理由*不用* ufw。它是一个强大的防火墙前端。然而，本文重点讲 firewalld，因为大部分发行版都支持它而且它集成到了 systemd，systemd 是几乎所有发行版都自带的。

不管你的发行版是哪个，都要先激活防火墙才能让它生效，而且需要在启动时加载：

```
$ sudo systemctl enable --now firewalld
```

### 理解防火墙的域

Firewalld 旨在让防火墙的配置工作尽可能简单。它通过建立<ruby>域<rt>zone</rt></ruby>来实现这个目标。一个域是一组的合理、通用的规则，这些规则适配大部分用户的日常需求。默认情况下有九个域。

  * `trusted`：接受所有的连接。这是最不偏执的防火墙设置，只能用在一个完全信任的环境中，如测试实验室或网络中相互都认识的家庭网络中。
  * `home`、`work`、`internal`：在这三个域中，接受大部分进来的连接。它们各自排除了预期不活跃的端口进来的流量。这三个都适合用于家庭环境中，因为在家庭环境中不会出现端口不确定的网络流量，在家庭网络中你一般可以信任其他的用户。
  * `public`：用于公共区域内。这是个偏执的设置，当你不信任网络中的其他计算机时使用。只能接收选定的常见和最安全的进入连接。
  * `dmz`：DMZ 表示隔离区。这个域多用于可公开访问的、位于机构的外部网络、对内网访问受限的计算机。对于个人计算机，它没什么用，但是对某类服务器来说它是个很重要的选项。
  * `external`：用于外部网络，会开启伪装（你的私有网络的地址被映射到一个外网 IP 地址，并隐藏起来）。跟 DMZ 类似，仅接受经过选择的传入连接，包括 SSH。
  * `block`：仅接收在本系统中初始化的网络连接。接收到的任何网络连接都会被 `icmp-host-prohibited` 信息拒绝。这个一个极度偏执的设置，对于某类服务器或处于不信任或不安全的环境中的个人计算机来说很重要。
  * `drop`：接收的所有网络包都被丢弃，没有任何回复。仅能有发送出去的网络连接。比这个设置更极端的办法，唯有关闭 WiFi 和拔掉网线。

你可以查看你发行版本的所有域，或通过配置文件 `/usr/lib/firewalld/zones` 来查看管理员设置。举个例子：下面是 Fefora 31 自带的 `FedoraWorkstation` 域：

```
$ cat /usr/lib/firewalld/zones/FedoraWorkstation.xml
<?xml version="1.0" encoding="utf-8"?>
<zone>
  <short>Fedora Workstation</short>
  <description>Unsolicited incoming network packets are rejected from port 1 to 1024, except for select network services. Incoming packets that are related to outgoing network connections are accepted. Outgoing network connections are allowed.</description>
  <service name="dhcpv6-client"/>
  <service name="ssh"/>
  <service name="samba-client"/>
  <port protocol="udp" port="1025-65535"/>
  <port protocol="tcp" port="1025-65535"/>
</zone>
```

### 获取当前的域

任何时候你都可以通过 `--get-active-zones` 选项来查看你处于哪个域：

```
$ sudo firewall-cmd --get-active-zones
```

输出结果中，会有当前活跃的域的名字和分配给它的网络接口。笔记本电脑上，在默认域中通常意味着你有个 WiFi 卡：

```
FedoraWorkstation
  interfaces: wlp61s0
```

### 修改你当前的域

要更改你的域，请将网络接口重新分配到不同的域。例如，把例子中的 `wlp61s0` 卡修改为 public 域：

```
$ sudo firewall-cmd --change-interface=wlp61s0 --zone=public
```

你可以在任何时候、任何理由改变一个接口的活动域 —— 无论你是要去咖啡馆，觉得需要增加笔记本的安全策略，还是要去上班，需要打开一些端口进入内网，或者其他原因。在你凭记忆学会 `firewall-cmd` 命令之前，你只要记住了关键词 `change` 和 `zone`，就可以慢慢掌握，因为按下 `Tab` 时，它的选项会自动补全。

### 更多信息

你可以用你的防火墙干更多的事，比如自定义已存在的域，设置默认域，等等。你对防火墙越了解，你在网上的活动就越安全，所以我们创建了一个[备忘单][2]便于速查和参考。

- 下载你的 [防火墙备忘单][2]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/firewall-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://opensource.com/downloads/firewall-cmd-cheat-sheet
