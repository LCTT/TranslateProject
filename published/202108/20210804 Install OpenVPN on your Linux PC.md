[#]: subject: "Install OpenVPN on your Linux PC"
[#]: via: "https://opensource.com/article/21/7/openvpn-router"
[#]: author: "D. Greg Scott https://opensource.com/users/greg-scott"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13702-1.html"

如何在免费 WiFi 中保护隐私（二）
======

> 安装完服务器之后，下一步就是安装和配置 0penVPN。

![](https://img.linux.net.cn/data/attachment/album/202108/20/123417yn554549p92ujt54.jpg)

0penVPN 在两点之间创建一个加密通道，阻止第三方访问你的网络流量数据。通过设置你的 “虚拟专用网络” 服务，你可以成为你自己的 “虚拟专用网络” 服务商。许多流行的 “虚拟专用网络” 服务都使用 [0penVPN][2]，所以当你可以掌控自己的网络时，为什么还要将你的网络连接绑定到特定的提供商呢？

本系列的 [第一篇文章][3] 展示了如何安装和配置一台作为你的 0penVPN 服务器的 Linux 计算机。同时也讲述了如何配置你的路由器以便你可以在外部网络连接到你的服务器。

第二篇文章将演示根据 [0penVPN wiki][4] 给定的步骤安装一个 0penVPN 服务软件。

### 安装 0penVPN

首先，使用包管理器安装 0penVPN 和 `easy-rsa` 应用程序（帮助你在服务器上设置身份验证）。本例使用的是 Fedora Linux，如果你选择了不同的发行版，请选用合适的命令。

```
$ sudo dnf install openvpn easy-rsa
```

此操作会创建一些空目录：

  * `/etc/openvpn`
  * `/etc/openvpn/client`
  * `/etc/openvpn/server`

如果这些目录在安装的过程中没有创建，请手动创建它们。

### 设置身份验证

0penVPN 依赖于 `easy-rsa` 脚本，并且应该有自己的副本。复制 `easy-rsa` 脚本和文件：

```
$ sudo mkdir /etc/openvpn/easy-rsa
$ sudo cp -rai /usr/share/easy-rsa/3/* /etc/openvpn/easy-rsa/
```

身份验证很重要，0penVPN 非常重视它。身份验证的理论是，如果 Alice 需要访问 Bob 公司内部的私人信息，那么 Bob 确保 Alice 真的是 Alice 就至关重要。同样的，Alice 也必须确保 Bob 是真正的 Bob。我们称之为相互认证。

现有的最佳实践是从三个可能因素中的选择两个检查属性：

  * 你拥有的
  * 你知道的
  * 你是谁

选择有很多。0penVPN 安装使用如下：

  * **证书**：客户端和服务端都拥有的东西
  * **证书口令**：某人知道的东西

Alice 和 Bob 需要帮助彼此来验证身份。由于他们都相信 Cathy，Cathy 承担了称为 <ruby>证书颁发机构<rt>certificate authority</rt></ruby>（CA）的角色。Cathy 证明 Alice 和 Bob 都是他们自己。因为 Alice 和 Bob 都信任 Cathy，现在他们也相互信任了。

但是是什么让 Cathy 相信 Alice 和 Bob 是真的 Alice 和 Bob？Cathy 在社区的声誉取决于如何正确处理这件事，因此如果她希望 Denielle、Evan、Fiona、Greg 和其他人也信任她，她就需要严格测试 Alice 和 Bob 的宣称内容。当 Alice 和 Bob 向 Cathy 证明了他们是真的 Alice 和 Bob 之后，Cathy 将向 Alice 和 Bob 签署证书，让他们彼此和全世界分享。

Alice 和 Bob 如何知道是 Cathy 签署了证书，而不是某个人冒充她签发了证书？他们使用一项叫做**公钥加密**的技术：

  * 找到一种用一个密钥加密并用另一个密钥解密的加密算法。
  * 将其中一个设为私钥，将另外一个设为公钥。
  * Cathy 与全世界分享她的公钥和她的签名的明文副本。
  * Cathy 用她的私钥加密她的签名，任何人都可以用她分享的公钥解密。
  * 如果 Cathy 的签名解密后与明文副本匹配，Alice 和 Bob 就可以相信 Cathy 确实签署了它。 

每次在线购买商品和服务时，使用的就是这种技术。

### 认证实现

0penVPN 的 [文档][5] 建议在单独的系统上或者至少在 0penVPN 服务器的单独目录上设置 CA。该文档还建议分别从服务端和客户端生成各自的证书。因为这是一个简单的演示设置，你可以使用 0penVPN 服务器设置 CA，并将证书和密钥放入服务器上的指定目录中。

从服务端生成证书，并将证书拷贝到各个客户端，避免客户端再次设置。

此实现使用自签名证书。这是因为服务器信任自己，而客户端信任服务器。因此，服务器是签署证书的最佳 CA。

在 0penVPN 服务器上设置 CA：

```
$ sudo mkdir /etc/openvpn/ca
$ cd /etc/openvpn/ca
$ sudo /etc/openvpn/easy-rsa/easyrsa init-pki
$ sudo /etc/openvpn/easy-rsa/easyrsa build-ca
```

使用一个易记难猜的密码。

设置服务器密钥对和认证请求：

```
$ cd /etc/openvpn/server
$ sudo /etc/openvpn/easy-rsa/easyrsa init-pki
$ sudo /etc/openvpn/easy-rsa/easyrsa gen-req OVPNserver2020 nopass
```

在此例中，`OVPNServer2020` 是你在本系列第一篇文章中为 0penVPN 服务器设置的主机名。 

### 生成和签署证书

现在你必须向 CA 发送服务器请求并生成和签署服务器证书。

此步骤实质上是将请求文件从 `/etc/openvpn/server/pki/reqs/OVPNserver2020.req` 复制到 `/etc/openvpn/ca/pki/reqs/OVPNserver2020.req` 以准备审查和签名：

```
$ cd /etc/openvpn/ca
$ sudo /etc/openvpn/easy-rsa/easyrsa \
  import-req /etc/openvpn/server/pki/reqs/OVPNserver2020.req OVPNserver2020
```

### 审查并签署请求

你已经生成了一个请求，所以现在你必须审查并签署证书：

```
$ cd /etc/openvpn/ca
$ sudo /etc/openvpn/easy-rsa/easyrsa \
  show-req OVPNserver2020
```

以服务器身份签署请求：

```
$ cd /etc/openvpn/ca
$ sudo /etc/openvpn/easy-rsa/easyrsa \
  sign-req server OVPNserver2020
```

将服务器和 CA 证书的副本放在它们所属的位置，以便配置文件获取它们：

```
$ sudo cp /etc/openvpn/ca/pki/issued/OVPNserver2020.crt \
  /etc/openvpn/server/pki/
$ sudo cp /etc/openvpn/ca/pki/ca.crt \
  /etc/openvpn/server/pki/
```

接下来，生成 [Diffie-Hellman][6] 参数，以便客户端和服务器可以交换会话密钥：

```
$ cd /etc/openvpn/server
$ sudo /etc/openvpn/easy-rsa/easyrsa gen-dh
```

### 快完成了

本系列的下一篇文章将演示如何配置和启动你刚刚构建的 0penVPN 服务器。

本文的部分内容改编自 D. Greg Scott 的博客，并经许可重新发布。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/openvpn-router

作者：[D. Greg Scott][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-scott
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openwires_fromRHT_520_0612LL.png?itok=PqZi55Ab (Open ethernet cords.)
[2]: https://openvpn.net/
[3]: https://linux.cn/article-13680-1.html
[4]: https://community.openvpn.net/openvpn/wiki
[5]: https://openvpn.net/community-resources/
[6]: https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange
[7]: https://www.dgregscott.com/how-to-build-a-vpn-in-four-easy-steps-without-spending-one-penny/
