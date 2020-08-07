[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12496-1.html)
[#]: subject: (Easy DNS configuration with PowerDNS for nameservers)
[#]: via: (https://opensource.com/article/20/5/powerdns)
[#]: author: (Jonathan Garrido https://opensource.com/users/jgarrido)

使用 PowerDNS 轻松配置 DNS 名称服务器
======

> 使用 PDNS 为你的项目提供稳定可靠的域名系统（DNS）服务器。

![](https://img.linux.net.cn/data/attachment/album/202008/07/202953copoqjmkefkdf3j4.jpg)

几个月前，我们接到了一个要求，为一个新项目提供一个稳定可靠的域名系统（[DNS][2]）服务器。该项目使用容器进行自动部署，每个新环境都会生成唯一的随机 URL。在对可能的方案进行了大量研究之后，我们决定尝试一下 [PowerDNS][3]（PDNS）。

一开始，我们发现 PowerDNS 在所有主流 Linux 发行版中都得到了支持，它采用 GPL 许可，且仓库保持更新。我们还在官方网站上发现了整洁、组织良好的[文档][4]，以及大量来自真正喜欢和使用该产品的人在网络上的使用方法。看了一些并学习了一些基本命令之后，安装了 PDNS，启动并运行，我们的旅程开始了。

### 数据库驱动

PowerDNS 将记录保存在 SQL 数据库中。这对我们来说是新变化，不必使用文本文件来保存记录是一个不错的更改。我们选择 MariaDB 作为首选的强大工具，由于有大量的正确地设置来安装名称服务器的信息，我们可以完美地设置和加固我们的数据库。

### 简单配置

其次使我们感兴趣的是 PDNS 的所有功能都在配置文件中。`pdns.conf` 有许多选项，你可以通过添加或删除 `＃` 号来启用或禁用这些选项。这真是太神奇了，因为它使我们有机会将这项新的服务集成到我们现有的基础架构中，并且只有我们想要的功能，不多也不少。一个简单的例子：

谁可以访问你的网络服务器？

```
webserver-allow-from=172.10.0.1,172.10.1.2
```

我可以转发基于域的请求吗？当然！

```
forward-zones=mylocal.io=127.0.0.1:5300
forward-zones+=example.com=172.10.0.5:53
forward-zones+=lucky.tech=172.10.1.5:53
```

### 包含 API

我们可以使用配置文件进行激活 API 服务，解决了我们开发团队的第一个需求，让我们见识到了 PDNS 的强大。这个功能让我们通过发送请求，简单、干净地创建、修改或删除 DNS 服务器中的记录。

这个 API 有一些基本的安全性参数，因此，只需几步，你就可以基于 IP 地址和预共享密钥验证的组合来控制谁有权与名称服务器进行交互。这是配置文件的样子：

```
api=yes
api-key=lkjdsfpoiernf
webserver-allow-from=172.10.7.13,172.10.7.5
```

### 日志

在日志方面，PDNS 做得非常出色。你可以使用日志文件和一个简单的内置 Web 服务器来监控服务器并查看计算机的运行状况。你可以使用浏览器查看服务器不同类型的统计信息，例如 CPU 使用率和收到的 DNS 查询。这非常有价值。例如，我们能够检测到一些“不太健康”的 PC，它们正在向我们的服务器发送与恶意流量相关的站点的 DNS 请求。深入查看日志后，我们可以看到流量来自何处，并对这些 PC 进行清理操作。

### 其他功能

这只是你使用 PowerDNS 可以做的所有事情的一点点。它还有更多的功能。它是一个拥有很多功能和特性的完整名称服务器，因此值得一试。

目前，我们尚未部署 [DNSSEC][5]，但似乎只需点击一下即可将其快速投入生产环境。另外，在将递归服务与名称服务器分离时，PowerDNS 有个不错的方法。我了解到它还支持 [DNS RPZ][6]（响应策略区域），并且还提供了非常不错且设计良好的前端，可让你使用 Web 浏览器来管理服务器，如下图。

![PowerDNS frontend][7]

信不信由你，你只需花费几个小时了解 PDNS，就可以大大提高你对 DNS 和 IT 操作的了解。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/powerdns

作者：[Jonathan Garrido][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jgarrido
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://en.wikipedia.org/wiki/Domain_Name_System
[3]: https://www.powerdns.com/opensource.html
[4]: https://doc.powerdns.com/
[5]: https://en.wikipedia.org/wiki/Domain_Name_System_Security_Extensions
[6]: https://dnsrpz.info/
[7]: https://opensource.com/sites/default/files/uploads/pdns.jpg (PowerDNS frontend)
