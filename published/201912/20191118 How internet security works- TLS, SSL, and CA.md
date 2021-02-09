[#]: collector: (lujun9972)
[#]: translator: (hopefully2333)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11699-1.html)
[#]: subject: (How internet security works: TLS, SSL, and CA)
[#]: via: (https://opensource.com/article/19/11/internet-security-tls-ssl-certificate-authority)
[#]: author: (Bryant Son https://opensource.com/users/brson)

互联网的安全是如何保证的：TLS、SSL 和 CA
======

> 你的浏览器里的锁的图标的后面是什么？

![Lock][1]

每天你都会重复这件事很多次，访问网站，网站需要你用你的用户名或者电子邮件地址和你的密码来进行登录。银行网站、社交网站、电子邮件服务、电子商务网站和新闻网站。这里只在使用了这种机制的网站中列举了其中一小部分。

每次你登录进一个这种类型的网站时，你实际上是在说：“是的，我信任这个网站，所以我愿意把我的个人信息共享给它。”这些数据可能包含你的姓名、性别、实际地址、电子邮箱地址，有时候甚至会包括你的信用卡信息。

但是你怎么知道你可以信任这个网站？换个方式问，为了让你可以信任它，网站应该如何保护你的交易？

本文旨在阐述使网站变得安全的机制。我会首先论述 web 协议 http 和 https，以及<ruby>传输层安全<rt>Transport Layer Security</rt></ruby>（TLS）的概念，后者是<ruby>互联网协议<rt>Internet Protocol</rt></ruby>（IP）层中的加密协议之一。然后，我会解释<ruby>证书颁发机构<rt>certificate authority</rt></ruby>和自签名证书，以及它们如何帮助保护一个网站。最后，我会介绍一些开源的工具，你可以使用它们来创建和管理你的证书。

### 通过 https 保护路由

了解一个受保护的网站的最简单的方式就是在交互中观察它，幸运的是，在今天的互联网上，发现一个安全的网站远远比找到一个不安全的网站要简单。但是，因为你已经在 Opensource.com 这个网站上了，我会使用它来作为案例，无论你使用的是哪个浏览器，你应该在你的地址栏旁边看到一个像锁一样的图标。点击这个锁图标，你应该会看见一些和下面这个类似的东西。

![Certificate information][2]

默认情况下，如果一个网站使用的是 http 协议，那么它是不安全的。为通过网站主机的路由添加一个配置过的证书，可以把这个网站从一个不安全的 http 网站变为一个安全的 https 网站。那个锁图标通常表示这个网站是受 https 保护的。

点击证书来查看网站的 CA，根据你的浏览器，你可能需要下载证书来查看它。

![Certificate information][3]

在这里，你可以了解有关 Opensource.com 证书的信息。例如，你可以看到 CA 是 DigiCert，并以 Opensource.com 的名称提供给 Red Hat。

这个证书信息可以让终端用户检查该网站是否可以安全访问。

> 警告：如果你没有在网站上看到证书标志，或者如果你看见的标志显示这个网站不安全——请不要登录或者做任何需要你个人数据的操作。这种情况非常危险！

如果你看到的是警告标志，对于大多数面向公众开放的网站来说，这很少见，它通常意味着该证书已经过期或者是该证书是自签名的，而非通过一个受信任的第三方来颁发。在我们进入这些主题之前，我想解释一下 TLS 和 SSL。

### 带有 TLS 和 SSL 的互联网协议

TLS 是旧版<ruby>安全套接字层协议<rt>Secure Socket Layer</rt></ruby>（SSL）的最新版本。理解这一点的最好方法就是仔细理解互联网协议的不同协议层。

![IP layers][4]

我们知道当今的互联网是由 6 个层面组成的：物理层、数据链路层、网络层、传输层、安全层、应用层。物理层是基础，这一层是最接近实际的硬件设备的。应用层是最抽象的一层，是最接近终端用户的一层。安全层可以被认为是应用层的一部分，TLS 和 SSL，是被设计用来在一个计算机网络中提供通信安全的加密协议，它们位于安全层中。

这个过程可以确保终端用户使用网络服务时，通信的安全性和保密性。

### 证书颁发机构和自签名证书

<ruby>证书颁发机构<rt>Certificate authority</rt></ruby>（CA）是受信任的组织，它可以颁发数字证书。

TLS 和 SSL 可以使连接更安全，但是这个加密机制需要一种方式来验证它；这就是 SSL/TLS 证书。TLS 使用了一种叫做非对称加密的加密机制，这个机制有一对称为私钥和公钥的安全密钥。（这是一个非常复杂的主题，超出了本文的讨论范围，但是如果你想去了解这方面的东西，你可以阅读“[密码学和公钥密码基础体系简介][5]”）你要知道的基础内容是，证书颁发机构们，比如 GlobalSign、DigiCert 和 GoDaddy，它们是受人们信任的可以颁发证书的供应商，它们颁发的证书可以用于验证网站使用的 TLS/SSL 证书。网站使用的证书是导入到主机服务器里的，用于保护网站。

然而，如果你只是要测试一下正在开发中的网站或服务，CA 证书可能对你而言太昂贵或者是太复杂了。你必须有一个用于生产目的的受信任的证书，但是开发者和网站管理员需要有一种更简单的方式来测试网站，然后他们才能将其部署到生产环境中；这就是自签名证书的来源。

自签名证书是一种 TLS/SSL 证书，是由创建它的人而非受信任的 CA 机构颁发的。用电脑生成一个自签名证书很简单，它可以让你在无需购买昂贵的 CA 颁发的证书的情况下测试一个安全网站。虽然自签名证书肯定不能拿到生产环境中去使用，但对于开发和测试阶段来说，这是一种简单灵活的方法。

### 生成证书的开源工具

有几种开源工具可以用来管理 TLS/SSL 证书。其中最著名的就是 openssl，这个工具包含在很多 Linux 发行版中和 MacOS 中。当然，你也可以使用其他开源工具。

| 工具名 | 描述                                                                    | 许可证                           |
| --------- | ------------------------------------------------------------------------------ | --------------------------------- |
| [OpenSSL][7]   | 实现 TLS 和加密库的最著名的开源工具 | Apache License 2.0                        |
| [EasyRSA][8]   | 用于构建 PKI CA 的命令行实用工具                                                | GPL v2                            |
| [CFSSL][9]     | 来自 cloudflare 的 PKI/TLS 瑞士军刀                                            | BSD 2-Clause "Simplified" License |
| [Lemur][10]     | 来自<ruby>网飞<rt>Netflix</rt></ruby>的 TLS 创建工具                                                         | Apache License 2.0                |

如果你的目的是扩展和对用户友好，网飞的 Lemur 是一个很有趣的选择。你在[网飞的技术博客][6]上可以查看更多有关它的信息。

### 如何创建一个 Openssl 证书

你可以靠自己来创建证书，下面这个案例就是使用 Openssl 生成一个自签名证书。

1、使用 `openssl` 命令行生成一个私钥：

```
openssl genrsa -out example.key 2048
```

![](https://opensource.com/sites/default/files/uploads/4_openssl_generatekey.jpg)

2、使用在第一步中生成的私钥来创建一个<ruby>证书签名请求<rt>certificate signing request</rt></ruby>（CSR）：

```
openssl req -new -key example.key -out example.csr -subj "/C=US/ST=TX/L=Dallas/O=Red Hat/OU=IT/CN=test.example.com"
```

![](https://opensource.com/sites/default/files/uploads/5_openssl_generatecsr.jpg)

3、使用你的 CSR 和私钥创建一个证书：

```
openssl x509 -req -days 366 -in example.csr -signkey example.key -out example.crt
```

![](https://opensource.com/sites/default/files/uploads/6_openssl_generatecert.jpg)

### 了解更多关于互联网安全的知识

如果你想要了解更多关于互联网安全和网站安全的知识，请看我为这篇文章一起制作的 Youtube 视频。

- <https://youtu.be/r0F1Hlcmjsk>

你有什么问题？发在评论里让我们知道。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/internet-security-tls-ssl-certificate-authority

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum
[2]: https://opensource.com/sites/default/files/uploads/1_certificatecheckwebsite.jpg
[3]: https://opensource.com/sites/default/files/uploads/2_certificatedisplaywebsite.jpg
[4]: https://opensource.com/sites/default/files/uploads/3_internetprotocol.jpg
[5]: https://opensource.com/article/18/5/cryptography-pki
[6]: https://medium.com/netflix-techblog/introducing-lemur-ceae8830f621
[7]: https://www.openssl.org/
[8]: https://github.com/OpenVPN/easy-rsa
[9]: https://github.com/cloudflare/cfssl
[10]: https://github.com/Netflix/lemur
