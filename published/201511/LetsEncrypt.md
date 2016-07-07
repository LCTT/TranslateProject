# SSL/TLS 加密新纪元 - Let's Encrypt

根据 Let's Encrypt 官方博客消息，Let's Encrypt 服务将在下周（11 月 16 日）正式对外开放。

Let's Encrypt 项目是由互联网安全研究小组（ISRG，Internet Security Research Group）主导并开发的一个新型数字证书认证机构（CA，Certificate Authority）。该项目旨在开发一个自由且开放的自动化 CA 套件，并向公众提供相关的证书免费签发服务以降低安全通讯的财务、技术和教育成本。在过去的一年中，互联网安全研究小组拟定了 [ACME 协议草案][1]，并首次实现了使用该协议的应用套件：服务端 [Boulder][2] 和客户端 [letsencrypt][3]。

至于为什么 Let's Encrypt 让我们如此激动，以及 HTTPS 协议如何保护我们的通讯请参考[浅谈 HTTPS 和 SSL/TLS 协议的背景与基础][4]。

## ACME 协议

Let's Encrypt 的诞生离不开 ACME（Automated Certificate Management Environment，自动证书管理环境）协议的拟定。

说到 ACME 协议，我们不得不提一下传统 CA 的认证方式。Let's Encrypt 服务所签发的证书为域名认证证书（DV，Domain-validated Certificate），签发这类证书需要域名所有者完成以下至少一种挑战（Challenge）以证明自己对域名的所有权：

* 验证申请人对域名的 Whois 信息中邮箱的控制权；
* 验证申请人对域名的常见管理员邮箱（如以 `admin@`、`postmaster@` 开头的邮箱等）的控制权；
* 在 DNS 的 TXT 记录中发布一条 CA 提供的字符串；
* 在包含域名的网址中特定路径发布一条 CA 提供的字符串。

不难发现，其中最容易实现自动化的一种操作必然为最后一条，ACME 协议中的 [Simple HTTP][5] 认证即是用一种类似的方法对从未签发过任何证书的域名进行认证。该协议要求在访问 `http://域名/.well-known/acme-challenge/指定字符串` 时返回特定的字符串。

然而实现该协议的客户端 [letsencrypt][3] 做了更多——它不仅可以通过 ACME 协议配合服务端 [Boulder][2] 的域名进行独立（standalone）的认证工作，同时还可以自动配置常见的服务器软件（目前支持 Nginx 和 Apache）以完成认证。

## Let's Encrypt 免费证书签发服务

对于大多数网站管理员来讲，想要对自己的 Web 服务器进行加密需要一笔不小的支出进行证书签发并且难以配置。根据早些年 SSL Labs 公布的 [2010 年互联网 SSL 调查报告（PDF）][6] 指出超过半数的 Web 服务器没能正确使用 Web 服务器证书，主要的问题有证书不被浏览器信任、证书和域名不匹配、证书过期、证书信任链没有正确配置、使用已知有缺陷的协议和算法等。而且证书过期后的续签和泄漏后的吊销仍需进行繁琐的人工操作。

幸运的是 Let's Encrypt 免费证书签发服务在经历了漫长的开发和测试之后终于来临，在 Let's Encrypt 官方 CA 被广泛信任之前，IdenTrust 的根证书对 Let's Encrypt 的二级 CA 进行了交叉签名使得大部分浏览器已经信任 Let's Encrypt 签发的证书。

## 使用 letsencrypt

由于当前 Let's Encrypt 官方的证书签发服务还未公开，你只能尝试开发版本。这个版本会签发一个 CA 标识为 `happy hacker fake CA` 的测试证书，注意这个证书不受信任。

要获取开发版本请直接 `$ git clone https://github.com/letsencrypt/letsencrypt`。

以下的[使用方法][7]摘自 Let's Encrypt 官方网站。

### 签发证书

`letsencrypt` 工具可以协助你处理证书请求和验证工作。

#### 自动配置 Web 服务器

下面的操作将会自动帮你将新证书配置到 Nginx 和 Apache 中。

```
$ letsencrypt run
```

#### 独立签发证书

下面的操作将会将新证书置于当前目录下。

```
$ letsencrypt -d example.com auth
```

### 续签证书

默认情况下 `letsencrypt` 工具将协助你跟踪当前证书的有效期限并在需要时自动帮你续签。如果需要手动续签，执行下面的操作。

```
$ letsencrypt renew --cert-path example-cert.pem
```

### 吊销证书

列出当前托管的证书菜单以吊销。

```
$ letsencrypt revoke
```

你也可以吊销某一个证书或者属于某个私钥的所有证书。

```
$ letsencrypt revoke --cert-path example-cert.pem
```

```
$ letsencrypt revoke --key-path example-key.pem
```

## Docker 化 letsencrypt

如果你不想让 letsencrypt 自动配置你的 Web 服务器的话，使用 Docker 跑一份独立的版本将是一个不错的选择。你所要做的只是在装有 Docker 的系统中执行：

```
$ sudo docker run -it --rm -p 443:443 -p 80:80 --name letsencrypt \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            quay.io/letsencrypt/letsencrypt:latest auth
```

你就可以快速的为自己的 Web 服务器签发一个免费而且受信任的 DV 证书啦！

## Let's Encrypt 的注意事项

* Let's Encrypt 当前发行的 DV 证书仅能验证域名的所有权，并不能验证其所有者身份；
* Let's Encrypt 不像其他 CA 那样对安全事故有保险赔付；
* Let's Encrypt 目前不提共 Wildcard 证书；
* Let's Encrypt 的有效时间仅为 90 天，逾期需要续签（可自动续签）。

对于 Let's Encrypt 的介绍就到这里，让我们一起目睹这场互联网的安全革命吧。

[1]: https://github.com/letsencrypt/acme-spec
[2]: https://github.com/letsencrypt/boulder
[3]: https://github.com/letsencrypt/letsencrypt
[4]: https://linux.cn/article-5175-1.html
[5]: https://letsencrypt.github.io/acme-spec/#simple-http
[6]: https://community.qualys.com/servlet/JiveServlet/download/38-1636/Qualys_SSL_Labs-State_of_SSL_2010-v1.6.pdf
[7]: https://letsencrypt.org/howitworks/
