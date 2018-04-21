使用 Let's Encrypt 保护你的网站
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/lock-1920.jpg?itok=7sjbOYkU)
曾几何时，通过证书授权机构搭建基本的HTTPS网站需要每年花费数百美元，而且搭建的过程复杂且容易出错。现在我们免费使用 [Let's Encrypt][1]，而且搭建过程也只需要几分钟。


### 为何进行加密？

为什么要加密网站呢？这是因为未经加密的 HTTP 会话可以被多种方式滥用：

 +  窃听用户数据包
 +  捕捉用户登录
 +  注入广告和“重要”消息
 +  注入木马
 +  注入 SEO 垃圾邮件和链接
 +  注入挖矿脚本

网络服务提供商就是最大的代码注入者。那么如何挫败它们的非法行径呢？你最好的防御手段就是HTTPS。让我们回顾一下HTTPS的工作原理。

### 信任链

你可以在你的网站和每个授权访问用户之间建立非对称加密。这是一种非常强的保护：GPG(GNU Privacy Guard, 参考[如何在 Linux 中加密邮件][2])和 OpenSSH 是非对称加密的通用工具。它们依赖于公钥-私钥对，其中公钥可以任意共享，但私钥必须受到保护且不能共享。公钥用于加密，私钥用于解密。

但上述方法无法适用于随机的网页浏览，因为建立会话之前需要交换公钥，你需要生成并管理密钥对。HTTPS 会话可以自动完成公钥分发，而且购物或银行之类的敏感网站还会使用第三方证书颁发机构 (CA) 验证证书，例如 Comodo, Verisign 和 Thawte。

当你访问一个HTTPS网站时，网站给你的网页浏览器返回了一个数字证书。这个证书说明你的会话被强加密，而且提供了网站信息，包括组织名称，颁发证书的组织和证书颁发机构名称等。你可以点击网页浏览器地址栏的小锁头来查看这些信息（图1），也包括了证书本身。


![页面信息][4]

图1: 点击网页浏览器地址栏上的锁头标记查看信息

[已获授权使用][5]

包括 Opera, Chromium 和 Chrome 在内的主流浏览器，验证网站数字证书的合法性都依赖于证书颁发机构。小锁头标记可以让你一眼看出证书状态；绿色意味着使用强 SSL 加密且运营实体经过验证。网页浏览器还会对恶意网站、SSL 证书配置有误的网站和不被信任的自签名证书网站给出警告。

那么网页浏览器如何判断网站是否可信呢？浏览器自带根证书库，包含了一系列根证书，存储在`/usr/share/ca-certificates/mozilla/`。网站证书是否可信可以通过根证书库进行检查。就像你 Linux 系统上其它软件那样，根证书库也由包管理器维护。对于 Ubuntu，对应的包是 `ca-certificates`。Linux 根证书库本身[由 Mozilla 维护][6]。

可见，整个工作流程需要复杂的基础设施才能完成。在你进行购物或金融等敏感在线操作时，你信任了无数陌生人对你的保护。

### 无处不加密

Let's Encrypt 是一家全球证书颁发机构，类似于其它商业根证书颁发机构。Let's Encrpt 由非营利性组织因特网安全研究小组 (Internet Security Research Group, ISRG) 创立，目标是简化网站的安全加密。在我看来，出于后面我会提到的原因，该证书不足以胜任购物及银行网站的安全加密，但很适合加密博客、新闻和信息门户这类不涉及金融操作的网站。

使用 Let's Encrypt 有三种方式。推荐使用电子前沿基金会 (Electronic Frontier Foundation, EFF) 开发的 [Cerbot 客户端][7]。使用该客户端需要在网站服务器上执行 shell 操作。

如果你使用的是共享托管主机，你很可能无法执行 shell 操作。这种情况下，最简单的方法是使用[支持 Let's Encrpt 的托管主机][8]。

如果你的托管主机不支持 Let's Encrypt，但支持自定义证书，那么你可以使用 Certbot [手动创建并上传你的证书][8]。这是一个复杂的过程，你需要彻底地研究文档。

安装证书后，测试使用[ SSL 服务器测试][9]。

Let's Encrypt 的电子证书有效期为90天。Certbot 安装过程中添加了一个证书自动续期的计划任务，也提供了测试证书自动续期是否成功的命令。允许使用已有的私钥或证书签名请求 (certificate signing request, CSR)，允许创建通配符证书。

### 限制

Let's Encrypt 有如下限制：它只执行域名验证，即只要有域名控制权就可以获得证书。这是比较基础的 SSL。它不支持组织验证(Organization Validation, OV) 或扩展验证(Extended Validation, EV)，因为运营实体验证无法自动完成。我不会信任使用 Let's Encrypt 证书的购物或银行网站，它们应该购买支持运营实体验证的完整版本。

作为非营利性组织提供的免费服务，不提供商业支持，只提供不错的文档和社区支持。

因特网中恶意无处不在，一切数据都应该加密。从使用 [Let's Encrypt][10] 保护你的网站用户开始吧。

想要学习更多 Linux 知识，请参考 Linux 基金会和 edX 提供的免费课程 ["Linux 入门"][11]。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/3/protect-your-websites-lets-encrypt

作者：[CARLA SCHRODER][a]
译者：[pinewall](https://github.com/pinewall)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://letsencrypt.org
[2]:https://www.linux.com/learn/how-encrypt-email-linux
[3]:https://www.linux.com/files/images/fig-11png-0
[4]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-1_1_1.png?itok=_PPiSNx6 (页面信息)
[5]:https://www.linux.com/licenses/category/used-permission
[6]:https://www.mozilla.org/en-US/about/governance/policies/security-group/certs/policy/
[7]:https://certbot.eff.org/
[8]:https://community.letsencrypt.org/t/web-hosting-who-support-lets-encrypt/6920
[9]:https://www.ssllabs.com/ssltest/
[10]:https://letsencrypt.org/
[11]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
