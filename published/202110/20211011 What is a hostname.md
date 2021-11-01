[#]: subject: "What is a hostname?"
[#]: via: "https://opensource.com/article/21/10/what-hostname"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13897-1.html"

浅谈主机名
======

> 主机名是人类用来指代特定计算机的标签。

![](https://img.linux.net.cn/data/attachment/album/202110/19/134329lwni9tlq9h3u4f4o.jpg)

计算机有网络地址，但人类通常很难记住它们。主机名是帮助人类参考特定计算机的标签。例如，你可能不会导航到 `192.168.1.4`，而是导航到 `linuxlaptop` 或 `linuxlaptop.local`。

### 地址和名称

所有联网的计算机（也被称为<ruby>主机<rt>host</rt></ruby>）都需要一个地址：一个与之相关的唯一数字，以使数据报文能够在它们之间进行正确的数据通信。这就是所谓的<ruby>互联网协议<rt>Internet Protocol</rt></ruby>（IP）地址。数字 `54.204.39.132` 是一个<ruby>互联网协议第四版<rt>Internet Protocol version 4</rt></ruby>（IPv4）地址。较新的 IPv6 地址要长得多，像这样：`2001:0db6:3c4d:0017:0000:0000:2a2f:1a2b`。 哇！这将是很难记住的！

```
$ ip addr show
```

计算机也可以被赋予标签。被称为<ruby>主机名<rt>hostname</rt></ruby>，这些是友好的名称，便于参考。我可以把我的计算机的主机名设置为 `copperhead`。只要这个名字在网络上是唯一的，所有其他用户和计算机都可以把 `copperhead` 作为地址，而不是 IP 地址。

```
$ hostname -s
```

你可以更新你的计算机的主机名。

阅读 Seth Kenlon 的文章 [如何在 Linux 上更改主机名][2]，了解如何在 Linux 上这样做。

#### 完全限定域名

从技术上讲，主机名包括一个域名。如果我的域名是 `mycompany.com`，那么我的计算机的主机名是 `copperhead.mycompany.com`，以句点分隔。这就形成了一个<ruby>完全限定域名<rt>fully qualified domain name</rt></ruby>（FQDN）。这很重要，因为 IP 地址可以解析为 FQDN。

```
host.domain.topleveldomain
```

例如：`www.example.com` 是一个完全限定域名。

你的域名一般已经确定了，所以你只负责提供主机部分。本文的重点是主机。

#### 名称解析

将 IP 地址转换为相应的主机名的过程被称为名称解析。这个过程首先发生在本地主机表中。Linux 使用文件 `/etc/hosts` 来存储这个表。

```
cat /etc/hosts
```

还有一个分层的、去中心化的基于网络的系统提供解析，称为<ruby>域名系统<rt>Domain Name System</rt></ruby>（DNS）。这时 FQDN 变得非常重要。


```
$ dig www.opensource.com
```

### 名称的乐趣

为我们的计算机起名字可能很有趣。如果你有很多，你可以使用一个主题。我曾经为一家公司工作，该公司将所有的服务器都以蛇命名。

后来我工作的一家公司，我是一个数据中心经理，使用啤酒品牌。当我们收到一个新的服务器时，这很令人兴奋，因为我会给开发团队发邮件征求建议。我们大约有 100 台服务器。这些提供了一个有趣的清单，反映了公司的多样性。我们有从库尔斯和百威到阿姆斯特尔和浅粉象的一切。我们有虎牌啤酒、胜狮啤酒和札幌啤酒等等！

我们认为这很酷！然后，想象一下，当你试图记住卢云堡是拥有最多内存的虚拟化服务器，佩罗尼是 SQL 数据库服务器，喜力是新的域控制器时，会发生什么，特别是对于一个快速发展的公司的新员工。

### 惯例

当然，主机名是所有者的选择，所以请尽情发挥。然而，根据环境的不同，使用容易记忆的名字或基于命名惯例的名字可能更有意义，因为这些名字有利于描述主机。

#### 有用的名字

如果你想放弃有趣的东西，并对你的系统进行有益的命名，也许可以考虑它们的功能。数据库服务器可以被命名为 `database1`、`database2`、`database3` 等等。Web 服务器可以命名为 `webserver1`、`webserver2` 等等。

#### 位置名称

我在许多客户那里使用了一种技术，用一组字符的位置来命名服务器主机，这些字符描述了该系统的一个方面，有助于识别。例如，如果我正在为内政部（DOI）开发一个业务流程管理（BPM）系统，我就会在命名规则中加入他们的缩写词。

此外，就像许多大型企业、金融机构和政府一样，他们可能有不同的数据中心，位于不同的地理位置，以达到性能或灾难恢复的目的。因此，比如说，位于北美大陆东海岸的数据中心被称为 ED（East Data center），而位于西海岸的数据中心则是 WD（West Data center）。

所有这些信息将汇集到一个名称中，如 `doibpm1ed` 或 `doibpm1wd`。因此，虽然这些名字看起来不长，但在这个项目上工作的人可以很容易地识别它们的目的和位置，而且这个名字甚至可以对潜在的恶意者混淆它们的用途。换句话说，业主可以选择只对内部人员有意义的命名方式 

### 互联网标准

有几个标准管理着主机名。你可以在<ruby>互联网工程任务组<rt>Internet Engineering Task Force</rt></ruby>（IETF）维护的<ruby>意见征求<rt>Requests for Comment</rt></ruby>（RFC）中找到这些标准。由此，请遵守以下规定：

  * 主机名的长度应该在 1 到 63 个 ASCII 字符之间
  * 一个 FQDN 的最大长度为 253 个 ASCII 字符
  * 不区分大小写
  * 允许的字符：`a` 到 `z`，`0` 到 `9`，`-`（连字符），和 `_`（下划线）。

我希望这篇文章能帮助你澄清主机名。玩得开心，发挥创意。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/what-hostname

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://opensource.com/article/21/10/how-change-hostname-linux
