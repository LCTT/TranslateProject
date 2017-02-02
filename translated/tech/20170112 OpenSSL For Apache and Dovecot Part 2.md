OpenSSL 在 Apache 和 Dovecot 下的使用（二）
============================================================

 ![OpenSSL](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/key-openssl_0.jpg?itok=FDO3qAOt "OpenSSL") 
 
> 本篇中，Carla Schroder 会解释如何使用 OpenSSL 保护你的 Postfix/Dovecot 邮件服务器

[Creative Commons Zero][1]Pixabay

在[上周][11]，作为我们 OpenSSL 系列的一部分，我们学习了如何配置 Apache 以使用 OpenSSL 并强制所有会话使用 HTTPS。 今天，我们将使用 OpenSSL 保护我们的 Postfix/Dovecot 邮件服务器。这些示例基于前面的教程; 请参阅最后的参考资料部分，了解本系列中以前的所有教程的链接。

你需要配置 Postfix 以及 Dovecot 都使用 OpenSSL，我们将使用我们在[OpenSSL 在 Apache 和 Dovecot 下的使用（一）][12]中创建的密钥和证书。

### Postfix 配置

你必须编辑 `/etc/postfix/main.cf` 以及 `/etc/postfix/master.cf`。实例的 `main.cf` 是完整的配置，基于我们先前的教程。替换成你自己的 OpenSSL 密钥和证书名以及本地网络地址。

```
compatibility_level=2
smtpd_banner = $myhostname ESMTP $mail_name (Ubuntu/GNU)
biff = no
append_dot_mydomain = no

myhostname = localhost
alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases
myorigin = $myhostname
mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128 192.168.0.0/24
mailbox_size_limit = 0
recipient_delimiter = +
inet_interfaces = all

virtual_mailbox_domains = /etc/postfix/vhosts.txt
virtual_mailbox_base = /home/vmail
virtual_mailbox_maps = hash:/etc/postfix/vmaps.txt
virtual_minimum_uid = 1000
virtual_uid_maps = static:5000
virtual_gid_maps = static:5000
virtual_transport = lmtp:unix:private/dovecot-lmtp

smtpd_tls_cert_file=/etc/ssl/certs/test-com.pem
smtpd_tls_key_file=/etc/ssl/private/test-com.key
smtpd_use_tls=yes

smtpd_sasl_auth_enable = yes
smtpd_sasl_type = dovecot
smtpd_sasl_path = private/auth
smtpd_sasl_authenticated_header = yes
```

在 `master.cf` 取消 `submission inet` 部分的注释，并编辑 `smtpd_recipient_restrictions`：

```
#submission inet n  -  y  -  - smtpd
  -o syslog_name=postfix/submission
  -o smtpd_tls_security_level=encrypt
  -o smtpd_sasl_auth_enable=yes
  -o milter_macro_daemon_name=ORIGINATING
  -o smtpd_recipient_restrictions=permit_mynetworks,permit_sasl_authenticated,reject
  -o smtpd_tls_wrappermode=no
```

完成后重新加载 Postfix：

```
$ sudo service postfix reload
```

### Dovecot 配置

在我们以前的教程中，我们为 Dovecot 创建了一个单一配置文件 `/etc/dovecot/dovecot.conf`，而不是使用多个默认配置文件。这是一个基于我们以前的教程的完整配置。再说一次，使用你自己的 OpenSSL 密钥和证书，以及你自己的 `userdb` 的 home 文件：

```
protocols = imap pop3 lmtp
log_path = /var/log/dovecot.log
info_log_path = /var/log/dovecot-info.log
disable_plaintext_auth = no
mail_location = maildir:~/.Mail
pop3_uidl_format = %g
auth_mechanisms = plain

passdb {
  driver = passwd-file
  args = /etc/dovecot/passwd
}

userdb {
  driver = static
  args = uid=vmail gid=vmail home=/home/vmail/studio/%u
}

service lmtp {
 unix_listener /var/spool/postfix/private/dovecot-lmtp {
   group = postfix
   mode = 0600
   user = postfix
  }
}

protocol lmtp {
  postmaster_address = postmaster@studio
}

service lmtp {
  user = vmail
}

service auth {
  unix_listener /var/spool/postfix/private/auth {
    mode = 0660
        user=postfix
        group=postfix
  }
 }

ssl=required
ssl_cert = </etc/ssl/certs/test-com.pem
ssl_key = </etc/ssl/private/test-com.key
```

重启 Dovecot:

```
$ sudo service postfix reload
```

### 用 telnet 测试

就像我们以前一样，现在我们可以通过使用 telnet 发送消息来测试我们的设置。 但是等等，你说 telnet 不支持 TLS/SSL，那么这样怎么办呢？首先通过使用 `openssl s_client` 打开一个加密会话。`openssl s_client` 的输出将显示你的证书及其指纹和大量其它信息，以便你知道你的服务器正在使用正确的证书。会话建立后输入的命令都是不以数字开头的：

```
$ openssl s_client -starttls smtp -connect studio:25
CONNECTED(00000003)
[masses of output snipped]
    Verify return code: 0 (ok)
---
250 SMTPUTF8
EHLO studio
250-localhost
250-PIPELINING
250-SIZE 10240000
250-VRFY
250-ETRN
250-AUTH PLAIN
250-ENHANCEDSTATUSCODES
250-8BITMIME
250-DSN
250 SMTPUTF8
mail from: <carla@domain.com>
250 2.1.0 Ok
rcpt to: <alrac@studio>
250 2.1.5 Ok
data
354 End data with .subject: TLS/SSL test
Hello, we are testing TLS/SSL. Looking good so far.
.
250 2.0.0 Ok: queued as B9B529FE59
quit
221 2.0.0 Bye
```

你应该可以在邮件客户端中看到一条新邮件，并在打开时要求你验证 SSL 证书。你也可以使用 `openssl s_client` 来测试 Dovecot 的 POP3 和 IMAP 服务。此示例测试加密的 POP3，第 5 号消息是我们在 telnet（如上）中创建的：

```
$ openssl s_client -connect studio:995
CONNECTED(00000003)
[masses of output snipped]
    Verify return code: 0 (ok)
---
+OK Dovecot ready
user alrac@studio 
+OK
pass password
+OK Logged in.
list
+OK 5 messages:
1 499
2 504
3 514
4 513
5 565
.
retr 5
+OK 565 octets
Return-Path: <carla@domain.com>
Delivered-To: alrac@studio
Received: from localhost
        by studio.alrac.net (Dovecot) with LMTP id y8G5C8aablgKIQAAYelYQA
        for <alrac@studio>; Thu, 05 Jan 2017 11:13:10 -0800
Received: from studio (localhost [127.0.0.1])
        by localhost (Postfix) with ESMTPS id B9B529FE59
        for <alrac@studio>; Thu,  5 Jan 2017 11:12:13 -0800 (PST)
subject: TLS/SSL test
Message-Id: <20170105191240.B9B529FE59@localhost>
Date: Thu,  5 Jan 2017 11:12:13 -0800 (PST)
From: carla@domain.com

Hello, we are testing TLS/SSL. Looking good so far.
.
quit
+OK Logging out.
closed
```

### 现在做什么？

现在你有一个功能良好的，具有合适的 TLS/SSL 保护的邮件服务器了。我鼓励你深入学习 Postfix 以及 Dovecot； 这些教程中的示例尽可能地简单，不包括对安全性、防病毒扫描程序、垃圾邮件过滤器或任何其他高级功能的调整。我认为当你有一个基本工作系统时更容易学习高级功能。

下周回到 openSUSE 包管理备忘录上。

### 资源

*   [为 Apache 和 Dovecot 使用 OpenSSL][3]
*   [如何在 Ubuntu Linux 上构建电子邮件服务器][4]
*   [在 Ubuntu Linux 上构建电子邮件服务器：第2部分][5]
*   [在 Ubuntu Linux 上构建电子邮件服务器：第3部分][6]
*   [给初学者看的在 Ubuntu Linux 上使用 Apache][7]
*   [给初学者看的在 Ubuntu Linux 上使用 Apache：第二部分][8]
*   [给初学者看的在 CentOS Linux 上使用 Apache][9]
*   [消灭让人害怕的 web 浏览器 SSL 警告][10]

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/openssl-apache-and-dovecot-part-2

作者：[CARLA SCHRODER][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/key-openssljpg-0
[3]:https://linux.cn/article-8167-1.html
[4]:https://linux.cn/article-8071-1.html
[5]:https://linux.cn/article-8077-1.html
[6]:https://linux.cn/article-8088-1.html
[7]:https://www.linux.com/learn/apache-ubuntu-linux-beginners
[8]:https://www.linux.com/learn/apache-ubuntu-linux-beginners-part-2
[9]:https://www.linux.com/learn/apache-centos-linux-beginners
[10]:https://www.linux.com/learn/quieting-scary-web-browser-ssl-alerts
[11]:https://linux.cn/article-8167-1.html
[12]:https://linux.cn/article-8167-1.html
