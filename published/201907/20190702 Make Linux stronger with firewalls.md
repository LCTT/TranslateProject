[#]: collector: (lujun9972)
[#]: translator: (chen-ni)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11093-1.html)
[#]: subject: (Make Linux stronger with firewalls)
[#]: via: (https://opensource.com/article/19/7/make-linux-stronger-firewalls)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用防火墙让你的 Linux 更加强大
======
> 掌握防火墙的工作原理，以及如何设置防火墙来提高 Linux 的安全性

![](https://img.linux.net.cn/data/attachment/album/201907/13/114424m9clibvi0p128fln.jpg)

所有人都听说过防火墙（哪怕仅仅是在网络犯罪片里看到过相关的情节设定），很多人也知道他们的计算机里很可能正运行着防火墙，但是很少有人明白在必要的时候如何驾驭防火墙。

防火墙被用来拦截那些不请自来的网络流量，然而不同网络需要的安全级别也不尽相同。比如说，和在外面一家咖啡馆里使用公共 WiFi 相比，你在家里的时候可以更加信任网络里的其它计算机和设备。你或许希望计算机能够区分可以信任和不可信任的网络，不过最好还是应该学会自己去管理（或者至少是核实）你的安全设置。

### 防火墙的工作原理

网络里不同设备之间的通信是通过一种叫做<ruby>端口<rt>port</rt></ruby>的网关实现的。这里的端口指的并不是像 USB 端口 或者 HDMI 端口这样的物理连接。在网络术语中，端口是一个纯粹的虚拟概念，用来表示某种类型的数据到达或离开一台计算机时候所走的路径。其实也可以换个名字来称呼，比如叫“连接”或者“门口”，不过 [早在 1981 年的时候][2] 它们就被称作端口了，这个叫法也沿用至今。其实端口这个东西没有任何特别之处，只是一种用来指代一个可能会发生数据传输的地址的方式。

1972 年，发布了一份 [端口号列表][3]（那时候的端口被称为“<ruby>套接字<rt>socket</rt></ruby>”），并且从此演化为一组众所周知的标准端口号，帮助管理特定类型的网络流量。比如说，你每天访问网站的时候都会使用 80 和 443 端口，因为互联网上的绝大多数人都同意（或者是默认）数据从 web 服务器上传输的时候是通过这两个端口的。如果想要验证这一点，你可以在使用浏览器访问网站的时候在 URL 后面加上一个非标准的端口号码。比如说，访问 `example.com:42` 的请求会被拒绝，因为 example.com 在 42 端口上并不提供网站服务。

![Navigating to a nonstandard port produces an error][4]

如果你是通过 80 端口访问同一个网站，就可以（不出所料地）正常访问了。你可以在 URL 后面加上 `:80` 来指定使用 80 端口，不过由于 80 端口是 HTTP 访问的标准端口，所以你的浏览器其实已经默认在使用 80 端口了。

当一台计算机（比如说 web 服务器）准备在指定端口接收网络流量的时候，保持该端口向网络流量开放是一种可以接受的（也是必要的）行为。但是不需要接收流量的端口如果也处在开放状态就比较危险了，这就是需要用防火墙解决的问题。

#### 安装 firewalld

有很多种配置防火墙的方式，这篇文章介绍 [firewalld][5]。在桌面环境下它被集成在<ruby>网络管理器<rt>Network Manager</rt></ruby>里，在终端里则是集成在 `firewall-cmd` 里。很多 Linux 发行版都预装了这些工具。如果你的发行版里没有，你可以把这篇文章当成是管理防火墙的通用性建议，在你所使用的防火墙软件里使用类似的方法，或者你也可以选择安装 `firewalld`。

比如说在 Ubuntu 上，你必须启用 universe 软件仓库，关闭默认的 `ufw` 防火墙，然后再安装 `firewalld`：

```
$ sudo systemctl disable ufw
$ sudo add-apt-repository universe
$ sudo apt install firewalld
```

Fedora、CentOS、RHEL、OpenSUSE，以及其它很多发行版默认就包含了 `firewalld`。

无论你使用哪个发行版，如果希望防火墙发挥作用，就必须保持它在开启状态，并且设置成开机自动加载。你应该尽可能减少在防火墙维护工作上所花费的精力。

```
$ sudo systemctl enable --now firewalld
```

### 使用网络管理器选择区域

或许你每天都会连接到很多不同的网络。在工作的时候使用的是一个网络，在咖啡馆里是另一个，在家里又是另一个。你的计算机可以判断出哪一个网络的使用频率比较高，但是它并不知道哪一个是你信任的网络。

一个防火墙的<ruby>区域<rt>zone</rt></ruby>里包含了端口开放和关闭的预设规则。你可以通过使用区域来选择一个对当前网络最适用的策略。

你可以打开网络管理器里的连接编辑器（可以在应用菜单里找到），或者是使用 `nm-connection-editor &` 命令以获取所有可用区域的列表。

![Network Manager Connection Editor][6]

在网络连接列表中，双击你现在所使用的网络。

在出现的网络配置窗口中，点击“通用”标签页。

在“通用”面板中，点击“防火墙区域”旁边的下拉菜单以获取所有可用区域的列表。

![Firewall zones][7]

也可以使用下面的终端命令以获取同样的列表：

```
$ sudo firewall-cmd --get-zones
```

每个区域的名称已经可以透露出设计者创建这个区域的意图，不过你也可以使用下面这个终端命令获取任何一个区域的详细信息：

```
$ sudo firewall-cmd --zone work --list-all
work
  target: default
  icmp-block-inversion: no
  interfaces:
  sources:
  services: ssh dhcpv6-client
  ports:
  protocols:
  [...]
```

在这个例子中，`work` 区域的配置是允许接收 SSH 和 DHCPv6-client 的流量，但是拒绝接收其他任何用户没有明确请求的流量。（换句话说，`work` 区域并不会在你浏览网站的时候拦截 HTTP 响应流量，但是 **会** 拦截一个针对你计算机上 80 端口的 HTTP 请求。）

你可以依次查看每一个区域，弄清楚它们分别都允许什么样的流量。比较常见的有： 

  * `work`：这个区域应该在你非常信任的网络上使用。它允许 SSH、DHCPv6 和 mDNS，并且还可以添加更多允许的项目。该区域非常适合作为一个基础配置，然后在此之上根据日常办公的需求自定义一个工作环境。
  * `public`： 用在你不信任的网络上。这个区域的配置和工作区域是一样的，但是你不应该再继续添加其它任何允许项目。
  * `drop`： 所有传入连接都会被丢弃，并且不会有任何响应。在不彻底关闭网络的条件下，这已经是最接近隐形模式的配置了，因为只允许传出网络连接（不过随便一个端口扫描器就可以通过传出流量检测到你的计算机，所以这个区域并不是一个隐形装置）。如果你在使用公共 WiFi，这个区域可以说是最安全的选择；如果你觉得当前的网络比较危险，这个区域也一定是最好的选择。
  * `block`： 所有传入连接都会被拒绝，但是会返回一个消息说明所请求的端口被禁用了。只有你主动发起的网络连接是被允许的。这是一个友好版的 `drop` 区域，因为虽然还是没有任何一个端口允许传入流量，但是说明了会拒绝接收任何不是本机主动发起的连接。
  * `home`： 在你信任网络里的其它计算机的情况下使用这个区域。该区域只会允许你所选择的传入连接，但是你可以根据需求添加更多的允许项目。
  * `internal`： 和工作区域类似，该区域适用于内部网络，你应该在基本信任网络里的计算机的情况下使用。你可以根据需求开放更多的端口和服务，同时保持和工作区域不同的一套规则。
  * `trusted`： 接受所有的网络连接。适合在故障排除的情况下或者是在你绝对信任的网络上使用。

### 为网络指定一个区域

你可以为你的任何一个网络连接都指定一个区域，并且对于同一个网络的不同连接方式（比如以太网、WiFi 等等）也可以指定不同的区域。

选择你想要的区域，点击“保存”按钮提交修改。

![Setting a new zone][8]

养成为网络连接指定区域的习惯的最好办法是从你最常用的网络开始。为你的家庭网络指定家庭区域，为工作网络指定工作区域，为你最喜欢的图书馆或者咖啡馆的网络指定公关区域。

一旦你为所有常用的网络都指定了一个区域，在之后加入新的网络的时候（无论是一个新的咖啡馆还是你朋友家的网络），试图也为它指定一个区域吧。这样可以很好地让你意识到不同的网络的安全性是不一样的，你并不会仅仅因为使用了 Linux 而比任何人更加安全。

### 默认区域

每次你加入一个新的网络的时候，`firewalld` 并不会提示你进行选择，而是会指定一个默认区域。你可以在终端里输入下面这个命令来获取你的默认区域：

```
$ sudo firewall-cmd --get-default
public
```

在这个例子里，默认区域是 `public` 区域。你应该保证该区域有非常严格的限制规则，这样在将它指定到未知网络中的时候才比较安全。或者你也可以设置你自己的默认区域。

比如说，如果你是一个比较多疑的人，或者需要经常接触不可信任的网络的话，你可以设置一个非常严格的默认区域：

```
$ sudo firewall-cmd --set-default-zone drop
success
$ sudo firewall-cmd --get-default
drop
```

这样一来，任何你新加入的网络都会被指定使用 `drop` 区域，除非你手动将它制定为另一个没有这么严格的区域。

### 通过开放端口和服务实现自定义区域

Firewalld 的开发者们并不是想让他们设定的区域能够适应世界上所有不同的网络和所有级别的信任程度。你可以直接使用这些区域，也可以在它们基础上进行个性化配置。

你可以根据自己所需要进行的网络活动决定开放或关闭哪些端口，这并不需要对防火墙有多深的理解。

#### 预设服务

在你的防火墙上添加许可的最简单的方式就是添加预设服务。严格来讲，你的防火墙并不懂什么是“服务”，因为它只知道端口号码和使用协议的类型。不过在标准和传统的基础之上，防火墙可以为你提供一套端口和协议的组合。

比如说，如果你是一个 web 开发者并且希望你的计算机对本地网络开放（这样你的同事就可以看到你正在搭建的网站了），可以添加 `http` 和 `https` 服务。如果你是一名游戏玩家，并且在为你的游戏公会运行开源的 [murmur][9] 语音聊天服务器，那么你可以添加 `murmur` 服务。还有其它很多可用的服务，你可以使用下面这个命令查看：

```
$ sudo firewall-cmd --get-services
    amanda-client amanda-k5-client bacula bacula-client \
    bgp bitcoin bitcoin-rpc ceph cfengine condor-collector \
    ctdb dhcp dhcpv6 dhcpv6-client dns elasticsearch \
    freeipa-ldap freeipa-ldaps ftp [...]
```

如果你找到了一个自己需要的服务，可以将它添加到当前的防火墙配置中，比如说：

```
$ sudo firewall-cmd --add-service murmur
```

这个命令 **在你的默认区域里** 添加了指定服务所需要的所有端口和协议，不过在重启计算机或者防火墙之后就会失效。如果想让你的修改永久有效，可以使用 `--permanent` 标志：

```
$ sudo firewall-cmd --add-service murmur --permanent
```

你也可以将这个命令用于一个非默认区域：

```
$ sudo firewall-cmd --add-service murmur --permanent --zone home
```

#### 端口

有时候你希望允许的流量并不在 `firewalld` 定义的服务之中。也许你想在一个非标准的端口上运行一个常规服务，或者就是想随意开放一个端口。

举例来说，也许你正在运行开源的 [虚拟桌游][10] 软件 [MapTool][11]。由于 MapTool 服务器应该使用哪个端口这件事情并没有一个行业标准，所以你可以自行决定使用哪个端口，然后在防火墙上“开一个洞”，让它允许该端口上的流量。

实现方式和添加服务差不多：

```
$ sudo firewall-cmd --add-port 51234/tcp
```

这个命令 **在你的默认区域** 里将 51234 端口向 TCP 传入连接开放，不过在重启计算机或者防火墙之后就会失效。如果想让你的修改永久有效，可以使用 `--permanent` 标志：

```
$ sudo firewall-cmd --add-port 51234/tcp --permanent
```

你也可以将这个命令用于一个非默认区域：

```
$ sudo firewall-cmd --add-port 51234/tcp --permanent --zone home
```

在路由器的防火墙上设置允许流量和在本机上设置的方式是不同的。你的路由器可能会为它的内嵌防火墙提供一个不同的配置界面（原理上是相同的），不过这就超出本文范围了。

### 移除端口和服务

如果你不再需要某项服务或者某个端口了，并且设置的时候没有使用 `--permanent` 标志的话，那么可以通过重启防火墙来清除修改。

如果你已经将修改设置为永久生效了，可以使用 `--remove-port` 或者 `--remove-service` 标志来清除：

```
$ sudo firewall-cmd --remove-port 51234/tcp --permanent
```

你可以通过在命令中指定一个区域以将端口或者服务从一个非默认区域中移除。

```
$ sudo firewall-cmd --remove-service murmur --permanent --zone home
```

### 自定义区域

你可以随意使用 `firewalld` 默认提供的这些区域，不过也完全可以创建自己的区域。比如如果希望有一个针对游戏的特别区域，你可以创建一个，然后只有在玩儿游戏的时候切换到该区域。

如果想要创建一个新的空白区域，你可以创建一个名为 `game` 的新区域，然后重新加载防火墙规则，这样你的新区域就启用了：

```
$ sudo firewall-cmd --new-zone game --permanent
success
$ sudo firewall-cmd --reload
```

一旦创建好并且处于启用状态，你就可以通过添加玩游戏时所需要的服务和端口来实现个性化定制了。

### 勤勉

从今天起开始思考你的防火墙策略吧。不用着急，可以试着慢慢搭建一些合理的默认规则。你也许需要花上一段时间才能习惯于思考防火墙的配置问题，以及弄清楚你使用了哪些网络服务，不过无论是处在什么样的环境里，只要稍加探索你就可以让自己的 Linux 工作站变得更为强大。


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/make-linux-stronger-firewalls

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[chen-ni](https://github.com/chen-ni)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_buildtogether.png?itok=9Tvz64K5 (People working together to build )
[2]: https://tools.ietf.org/html/rfc793
[3]: https://tools.ietf.org/html/rfc433
[4]: https://opensource.com/sites/default/files/uploads/web-port-nonstandard.png (Navigating to a nonstandard port produces an error)
[5]: https://firewalld.org/
[6]: https://opensource.com/sites/default/files/uploads/nm-connection-editor.png (Network Manager Connection Editor)
[7]: https://opensource.com/sites/default/files/uploads/nm-zone.png (Firewall zones)
[8]: https://opensource.com/sites/default/files/uploads/nm-set.png (Setting a new zone)
[9]: https://www.mumble.com/
[10]: https://opensource.com/article/18/5/maptool
[11]: https://github.com/RPTools
