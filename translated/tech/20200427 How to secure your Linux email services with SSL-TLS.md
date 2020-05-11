[#]: collector: (lujun9972)
[#]: translator: (Acceleratorrrr)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to secure your Linux email services with SSL/TLS)
[#]: via: (https://opensource.com/article/20/4/securing-linux-email)
[#]: author: (Marc Skinner https://opensource.com/users/marc-skinner)

如何利用 SSL/TLS 保护你的Linux邮箱服务
======

通过理解安全证书来保护你的Linux邮箱服务。
![email or newsletters via inbox and browser][1]

通常，不管你是通过简单邮件传输协议（SMTP）或者邮局协议（POP）发送或者接受邮件，邮箱服务默认使用无保护明文来传输数据。近来随着数据加密成为越来越多程序的共识，你需要传输层安全性协议 / 安全套接层（SSL/TLS）的安全证书来保护你的邮箱服务。

首先，快速回顾一下邮箱服务和协议的基本流程。邮件通过简单邮件传输协议从端口25发出。这个协议依靠DNS邮件交换服务器里的地址信息来传输邮件。当邮件到达邮件服务器后，可以被以下两种服务中的任意一种检索：因特网信息访问协议（IMAP）使用端口143，或者邮局协议第3版本（POP3）使用端口110。然而，以上服务默认默认使用明文传输邮件和验证信息。这非常的不安全！

以上服务已经添加了安全功能来保护邮件内容和验证信息，使它们可以利用SSL/TLS证书包裹和加密数据流。SSL/TLS如何加密数据的细节不在本文讨论范围，有兴趣的话可以阅读[布莱恩特关于网络安全的文章][2]。概括的说，SSL/TLS 加密本质是一种基于公钥和私钥的算法。

通过加入新的安全功能后，这些服务可以监听新的TCP端口：

服务 | 默认TCP端口 | SSL/TLS 端口
---|---|---
SMTP | 25 | 587
IMAP | 143 | 993
POP3 | 110 | 995

### 生成 SSL/TLS 证书

[OpenSSL][3] 可以生成免费的 SSL/TLS 证书，或者你也可以从根证书颁发机构购买。过去，生成自签发证书十分简单而且通用，但是由于安全被日益重视，大部分的邮箱客户端是不信任自签发证书的，除非手动设置。

如果你只是自己使用或者做做测试，那就使用自签发证书省点钱吧。但是如果很多人或者客户也需要使用的话，那最好还是从受信任的根证书颁发机构购买。

总之，Linux 系统里的 OpenSSL 工具需要一个证书来生成凭证签发请求文件（CSR）：

```
`$ openssl req -new -newkey rsa:2048 -nodes -keyout mail.mydomain.key -out mail.mydomain.csr`
```

这个命令会为你想保护的服务同时生成一个新的 CSR 文件和一个私匙。它会询问你一些证书相关的问题，如：路径，服务器的完整网络域名，邮件联系信息等等。当你输入完这些信息后，密匙和CSR文件就生成完毕了。

#### 如果你想生成自签发证书

如果你想要生成自签发证书的话，在运行以上 CSR 命令之前，你必须先创建一个[自签发证书机构][4]。

```
`$ openssl genrsa -des3 -out myCA.key 2048`
```

命令行会提示你输入密码。请输入一个复杂点的密码而且不要弄丢了，因为这将会是自签发证书机构的密码，并且决定了其签发证书的受信任度。

接下来，生成自签发证书机构：

```
`$ openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem`
```

在回答完一些问题后，你就拥有一个有效期为5年的自签发证书机构了。

用之前生成的 CSR 文件，你可以向刚生成的自签发证书机构请求生成一个新的证书。

```
`$ openssl x509 -req -in mail.mydomain.csr -CA myCA.pem -CAkey myCA.key -CAcreateserial -out mail.mydomain.pem -days 1825 -sha256`
```

输入自签发证书机构的密码来生成和签发证书。

现在你还需要两个文件来设置你的邮箱服务安全：私匙文件 **mail.mydomain.key**， 和证书文件 **mail.mydomain.pem**。

#### 如果你愿意购买证书

If you purchase a certificate from a vendor, it will ask you to upload that CSR to its system, as it is used as the input to generate the SSL/TLS certificate. The certificate will be accessible as a file (such as **mail.mydomain.pem**). Many SSL vendors also require you to download an intermediate certificate. If this is the case, you must combine the two certificate files into one, so the email service can process them both in combination. You can combine your certificate with a third-party intermediate certificate with:
如果你愿意从机构购买证书，则需要上传 CSR 文件到机构的系统中，它将会被用于生成 SSL/TLS 证书。证书可作为文件下载，比如 **mail.mydomain.pem**。很多SSL机构也需要你下载一个中间证书。这样的话，你必须把这个两个证书合并称一个，邮件服务才能够正常运行。可以使用以下命令把你的证书和第三方中间证书合并在一起：

```
`$ cat mail.mydomain.pem gd_bundle-g2-g1.crt > mail.mydomain.pem`
```

值得一提的是 **.pem** 文件后缀代表隐私增强邮件。

Now you have the two files you need to configure your email services for enhanced security: the private key file, **mail.mydomain.key**, and the public combined certificate file, **mail.mydomain.pem**.
现在你就有全部的设置邮箱服务安全所需文件了：私匙文件 **mail.mydomain.key**， 和证书文件 **mail.mydomain.pem**。

### 为你的文件生成一个安全的文件夹

不管你是的证书是自签发的或者从机构购买，你都需要生成一个安全的，管理员权限级别的文件夹用于保存这两个文件。可以使用以下命令来生成：

```
$ mkdir /etc/pki/tls
$ chown root:root /etc/pki/tls
$ chmod 700 /etc/pki/tls
```

在复制文件到 **/etc/pki/tls** 后，再次设置这些文件的权限：

```
`$ chmod 600 /etc/pki/tls/*`
```

### 配置你的 SMTP 和 IMAP 服务

接下来，让 SMTP 和 IMAP 服务使用新的安全证书。我们用 **postfix** and **dovecot** 来作为例子。

Edit ***/_****etc****_/*****postfix/main.cf** in your preferred text editor. Add the following lines:
用你顺手的编辑器来编辑 ***/_etc_/postfix/main.cf** 文件。添加以下几行：

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

**/etc/dovecot/dovecot.conf** 文件添加以下三行：

```
ssl = required
ssl_cert = &lt;/etc/pki/tls/mail.mydomain.pem
ssl_key = &lt;/etc/pki/tls/mail.mydomain.key
```

添加更多选项来启用或禁用各种加密算法，协议等等（可选）：

```
ssl_cipher_list = EECDH+ECDSA+AESGCM:EECDH+aRSA+AESGCM:EECDH+ECDSA+SHA384:EECDH+ECDSA+SHA256:EECDH+aRSA+SHA384:EECDH+aRSA+SHA256:EECDH+aRSA+RC4:EECDH:EDH+aRSA:ALL:!aNULL:!eNULL:!LOW:!3DES:!MD5:!EXP:!PSK:!SRP:!DSS:!RC4:!SSLv2
ssl_prefer_server_ciphers = yes
ssl_protocols = !SSLv2 !SSLv3 !TLSv1 !TLSv1.1
ssl_min_protocol = TLSv1.2
```

### 安全增强式Linux上下文设置

如果使用安全增强式Linux发行版，你需要给新证书文件配置正确的安全上下文。

Postfix SELinux 用户：

```
`$ chcon -u system_u -t cert_t mail.mydomain.*`
```

Dovecot SELinux 用户：

```
`$ chcon -u system_u -t dovecot_cert_t mail.mydomain.*`
```

Restart both services and connect with your updated email client configurations. Some email clients will auto-detect the new port numbers; others will require you to update them.
重启这些服务，然后联接上更新后的邮箱客户端。有些邮箱客户端会自动探测到新的端口，有些则需要你手动升级。

### 测试

用 **openssl** 命令行和 **s_client** 插件来简单测试一下：

```
$ openssl s_client -connect mail.mydomain.com:993
$ openssl s_client -starttls imap -connect mail.mydomain.com:143
$ openssl s_client -starttls smtp -connect mail.mydomain.com:587
```

These test commands will show a plethora of data about the connection, certificate, cipher, session, and protocol you're using. This is not only a good way to validate that the new configuration is working but also to confirm you're using the appropriate certificate and security settings you defined in the **postfix** or **dovecot** configuration files.
这些测试命令会打印出很多信息，关于你使用的联接，证书，加密算法，会话和协议。这不仅是一个验证新设置的好方法，也可以检查你是否使用了适当的证书，以及 **postfix** 或者 **dovecot** 配置文件里的安全设置是否生效。

Stay secure!
保持安全！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/securing-linux-email

作者：[Marc Skinner][a]
选题：[lujun9972][b]
译者：[Acceleratorrrr](https://github.com/Acceleratorrrr)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/marc-skinner
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/newsletter_email_mail_web_browser.jpg?itok=Lo91H9UH (email or newsletters via inbox and browser)
[2]: https://opensource.com/article/19/11/internet-security-tls-ssl-certificate-authority
[3]: https://www.openssl.org/
[4]: https://en.wikipedia.org/wiki/Root_certificate
