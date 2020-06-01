[#]: collector: (lujun9972)
[#]: translator: (Acceleratorrrr)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12217-1.html)
[#]: subject: (How to secure your Linux email services with SSL/TLS)
[#]: via: (https://opensource.com/article/20/4/securing-linux-email)
[#]: author: (Marc Skinner https://opensource.com/users/marc-skinner)

如何利用 SSL/TLS 保护你的 Linux 邮件服务
======

> 通过理解安全证书来保护你的 Linux 邮件服务。

![](https://img.linux.net.cn/data/attachment/album/202005/13/215637khaogmririavnrlk.jpg)

通常，不管你是通过<ruby>简单邮件传输协议<rt>Simple Mail Transport Protocol</rt></ruby>（SMTP）或者<ruby>互联网消息访问协议<rt>Internet Message Access Protocol</rt></ruby>（IMAP）或<ruby>邮局协议<rt>Post Office Protocol</rt></ruby>（POP）发送或者接受邮件，邮件服务默认都是以无保护的明文来传输数据。近来随着数据加密成为越来越多程序的共识，你需要<ruby>安全套接层<rt>Secure Sockets Layer</rt></ruby>/<ruby>传输层安全性<rt>Transport Layer Security</rt></ruby>（SSL/TLS）的安全证书来保护你的邮件服务。

首先，快速回顾一下邮件服务和协议的基本流程。邮件通过 SMTP 从 TCP 端口 25 发出。这个协议依靠 DNS <ruby>邮件交换服务器<rt>Mail eXchanger</rt></ruby>（MX）记录的地址信息来传输邮件。当邮件到达邮件服务器后，可以被以下两种服务中的任意一种检索：使用 TCP 端口 143 的 IMAP，或者使用 TCP 端口 110 的 POP3（邮局协议第 3 版）。然而，以上服务都默认使用明文传输邮件和认证信息。这非常的不安全！

为了保护电子邮件数据和认证，这些服务都增加了一个安全功能，使它们可以利用 SSL/TLS 证书对数据流和通讯进行加密封装。SSL/TLS 是如何加密数据的细节不在本文讨论范围，有兴趣的话可以阅读 [Bryant Son 关于互联网安全的文章][2]了解更多细节。概括的说，SSL/TLS 加密是一种基于公钥和私钥的算法。

通过加入这些安全功能后，这些服务将监听在新的 TCP 端口：

服务 | 默认 TCP 端口 | SSL/TLS 端口
---|---|---
SMTP | 25 | 587
IMAP | 143 | 993
POP3 | 110 | 995

### 生成 SSL/TLS 证书

[OpenSSL][3] 可以生成免费的 SSL/TLS 证书，或者你也可以从公共<ruby>证书颁发机构<rt>Certificate Authoritie</rt></ruby>（CA）购买。过去，生成自签发证书十分简单而且通用，但是由于安全被日益重视，大部分的邮件客户端是不信任自签发证书的，除非手动设置。

如果你只是自己使用或者做做测试，那就使用自签发证书省点钱吧。但是如果很多人或者客户也需要使用的话，那最好还是从受信任的证书颁发机构购买。

不管是哪种情况，开始请求新证书的过程是使用 Linux 系统上的 OpenSSL 工具来创建一个<ruby>证书签发请求<rt>Certificate Signing Request</rt></ruby（CSR）：

```
$ openssl req -new -newkey rsa:2048 -nodes -keyout mail.mydomain.key -out mail.mydomain.csr
```

这个命令会为你想保护的服务同时生成一个新的 CSR 文件和一个私匙。它会询问你一些证书相关的问题，如：位置、服务器的<ruby>完全合规域名<rt>Fully Qualified Domain Name</rt></ruby>（FQDN）、邮件联系信息等等。当你输入完这些信息后，私钥和 CSR 文件就生成完毕了。

#### 如果你想生成自签发证书

如果你想要生成自签发证书的话，在运行以上 CSR 命令之前，你必须先创建一个[自己的根 CA][4]。你可以通过以下方法创建自己的根 CA。

```
$ openssl genrsa -des3 -out myCA.key 2048
```

命令行会提示你输入一个密码。请输入一个复杂点的密码而且不要弄丢了，因为这将会是根 CA 私钥的密码，正如其名称所示，它是你的证书中所有信任关系的根。

接下来，生成根 CA 证书：

```
$ openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem
```

在回答完一些问题后，你就拥有一个有效期为 5 年的根 CA 证书了。

用之前生成的 CSR 文件，你可以请求生成一个新证书，并由您刚才创建的根 CA 签名。

```
$ openssl x509 -req -in mail.mydomain.csr -CA myCA.pem -CAkey myCA.key -CAcreateserial -out mail.mydomain.pem -days 1825 -sha256
```

输入你的根 CA 私钥的密码来创建和签署证书。

现在你有了配置电子邮件服务以增强安全性所需的两个文件：私匙文件 `mail.mydomain.key` 和公开证书文件 `mail.mydomain.pem`。

#### 如果你愿意购买证书

如果你愿意从机构购买证书，则需要上传 CSR 文件到证书颁发机构的系统中，它将会被用于生成 SSL/TLS 证书。证书可作为文件下载，比如 `mail.mydomain.pem`。很多 SSL 机构也需要你下载一个中间证书。如果是这样的话，你必须把这个两个证书合并成一个，这样电子邮件服务就可以将这两个证书结合起来处理。可以使用以下命令把你的证书和第三方中间证书合并在一起：

```
$ cat mail.mydomain.pem gd_bundle-g2-g1.crt > mail.mydomain.pem
```

值得一提的是 `.pem` 文件后缀代表<ruby>隐私增强邮件<rt>Privacy-Enhanced Mail</rt></ruby>。

现在你就有全部的设置邮件服务安全所需文件了：私匙文件 `mail.mydomain.key` 和组合的公开证书文件 `mail.mydomain.pem`。

### 为你的文件生成一个安全的文件夹

不管你是的证书是自签发的或者从机构购买，你都需要生成一个安全的，管理员拥有的文件夹用于保存这两个文件。可以使用以下命令来生成：

```
$ mkdir /etc/pki/tls
$ chown root:root /etc/pki/tls
$ chmod 700 /etc/pki/tls
```

在复制文件到 `/etc/pki/tls` 后，再次设置这些文件的权限：

```
$ chmod 600 /etc/pki/tls/*
```

### 配置你的 SMTP 和 IMAP 服务

接下来，让 SMTP 和 IMAP 服务使用新的安全证书。我们用 `postfix` 和 `dovecot` 来作为例子。

用你顺手的编辑器来编辑 `/etc/postfix/main.cf` 文件。添加以下几行：

```
smtpd_use_tls = yes
smtpd_tls_cert_file = /etc/pki/tls/mail.mydomain.pem
smtpd_tls_key_file = /etc/pki/tls/mail.mydomain.key
```

### 自定义选项

以下选项可以启用或禁用各种加密算法，协议等等：

```
smtpd_tls_eecdh_grade = strong
smtpd_tls_protocols= !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtpd_tls_mandatory_protocols= !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtpd_tls_mandatory_ciphers = high
smtpd_tls_security_level=may
smtpd_tls_ciphers = high
tls_preempt_cipherlist = yes
smtpd_tls_mandatory_exclude_ciphers = aNULL, MD5 , DES, ADH, RC4, PSD, SRP, 3DES, eNULL
smtpd_tls_exclude_ciphers = aNULL, MD5 , DES, ADH, RC4, PSD, SRP, 3DES, eNULL
smtp_tls_mandatory_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtp_tls_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
```

编辑 `/etc/dovecot/dovecot.conf` 文件，添加以下三行：

```
ssl = required
ssl_cert = &lt;/etc/pki/tls/mail.mydomain.pem
ssl_key = &lt;/etc/pki/tls/mail.mydomain.key
```

添加下列更多选项来启用或禁用各种加密算法、协议等等（我把这些留给你来理解）：

```
ssl_cipher_list = EECDH+ECDSA+AESGCM:EECDH+aRSA+AESGCM:EECDH+ECDSA+SHA384:EECDH+ECDSA+SHA256:EECDH+aRSA+SHA384:EECDH+aRSA+SHA256:EECDH+aRSA+RC4:EECDH:EDH+aRSA:ALL:!aNULL:!eNULL:!LOW:!3DES:!MD5:!EXP:!PSK:!SRP:!DSS:!RC4:!SSLv2
ssl_prefer_server_ciphers = yes
ssl_protocols = !SSLv2 !SSLv3 !TLSv1 !TLSv1.1
ssl_min_protocol = TLSv1.2
```

### 设置 SELinux 上下文

如果你的 Linux 发行版启用了 SELinux，请为你的新证书文件设置正确的 SELinux 上下文。

对于 Postfix 设置 SELinux：

```
$ chcon -u system_u -t cert_t mail.mydomain.*
```

对于 Dovecot 设置 SELinux：

```
$ chcon -u system_u -t dovecot_cert_t mail.mydomain.*
```

重启这些服务，并与你相应更新过的电子邮件客户端配置连接。有些电子邮件客户端会自动探测到新的端口，有些则需要你手动更新。

### 测试配置

用 `openssl` 命令行和 `s_client` 插件来简单测试一下：

```
$ openssl s_client -connect mail.mydomain.com:993
$ openssl s_client -starttls imap -connect mail.mydomain.com:143
$ openssl s_client -starttls smtp -connect mail.mydomain.com:587
```

这些测试命令会打印出很多信息，关于你使用的连接、证书、加密算法、会话和协议。这不仅是一个验证新设置的好方法，也可以确认你使用了适当的证书，以及在 postfix 或 dovecot 配置文件中定义的安全设置正确。

保持安全！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/securing-linux-email

作者：[Marc Skinner][a]
选题：[lujun9972][b]
译者：[Acceleratorrrr](https://github.com/Acceleratorrrr)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/marc-skinner
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/newsletter_email_mail_web_browser.jpg?itok=Lo91H9UH (email or newsletters via inbox and browser)
[2]: https://linux.cn/article-11699-1.html
[3]: https://www.openssl.org/
[4]: https://en.wikipedia.org/wiki/Root_certificate
