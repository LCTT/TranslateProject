如何在 Ubuntu 上搭建一台 Email 服务器（三）
============================================================

 ![Mail server](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/mail-server.jpg?itok=Ox1SCDsV "Mail server") 

在本系列的最后，我们将详细介绍如何在 Dovecot 和 Postfix 中设置虚拟用户和邮箱。

欢迎回来，热心的 Linux 系统管理员们！ 在本系列的[第一部分][3]和[第二部分][4]中，我们学习了如何将 Postfix 和 Dovecot 组合在一起，搭建一个不错的 IMAP 和 POP3 邮件服务器。 现在我们将学习设置虚拟用户，以便我们可以管理所有 Dovecot 中的用户。

### 抱歉，还不能配置 SSL

我知道我答应过教你们如何设置一个受 SSL 保护的服务器。 不幸的是，我低估了这个话题的范围。 所以，我会下个月再写一个全面的教程。

今天，在本系列的最后一部分中，我们将详细介绍如何在 Dovecot 和 Postfix 中设置虚拟用户和邮箱。 在你看来这是有点奇怪，所以我尽量让下面的例子简单点。我们将使用纯文本文件和纯文本来进行身份验证。 你也可以选择使用数据库后端和较强的加密认证形式，具体请参阅文末链接了解有关这些的更多信息。

### 虚拟用户

我们希望邮件服务器上用的是虚拟用户而不是 Linux 系统用户。使用 Linux 系统用户不能扩展，并且它们会暴露系统登录账号，给你的服务器带来不必要的风险。 设置虚拟用户需要在 Postfix 和 Dovecot 中编辑配置文件。我们将从 Postfix 开始。首先，我们将从一个干净、简化的 `/etc /postfix/main.cf` 开始。移动你原始的 `main.cf` 到别处做个备份，创建一个新的干净的文件，内容如下：

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
virtual_transport = lmtp:unix:private/dovecot-lmtp0
```

你可以直接拷贝这份文件，除了 `mynetworks` 参数的设置 `192.168.0.0/24`，它应该是你的本地子网掩码。

接下来，创建用户和组 `vmail` 来拥有你的虚拟邮箱。虚拟邮箱保存在  `vmail` 的家目录下。

```
$ sudo groupadd -g 5000 vmail
$ sudo useradd -m -u 5000 -g 5000 -s /bin/bash vmail
```

接下来重新加载 Postfix 配置：

```
$ sudo postfix reload
[sudo] password for carla: 
postfix/postfix-script: refreshing the Postfix mail system
```

### Dovecot 虚拟用户

我们会使用 Dovecot 的 `lmtp` 协议来连接到 Postfix。你可以这样安装：

```
$ sudo apt-get install dovecot-lmtpd
```

`main.cf` 的最后一行涉及到 `lmtp`。复制这个 `/etc/dovecot/dovecot.conf` 示例文件来替换已存在的文件。再说一次，我们只使用这一个文件，而不是 `/etc/dovecot/conf.d` 内的所有文件。

```
protocols = imap pop3 lmtp
log_path = /var/log/dovecot.log
info_log_path = /var/log/dovecot-info.log
ssl = no
disable_plaintext_auth = no
mail_location = maildir:~/.Mail
pop3_uidl_format = %g
auth_verbose = yes
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
```

最后，你可以创建一个含有用户和密码的文件 `/etc/dovecot/passwd`。对于纯文本验证，我们只需要用户的完整邮箱地址和密码：

```
alrac@studio:{PLAIN}password
layla@studio:{PLAIN}password
fred@studio:{PLAIN}password
molly@studio:{PLAIN}password
benny@studio:{PLAIN}password
```

Dovecot 虚拟用户独立于 Postfix 虚拟用户，因此你需要管理 Dovecot 中的用户。保存所有的设置并重启 Postfix 和 Dovecot：

```
$ sudo service postfix restart
$ sudo service dovecot restart
```

现在让我们使用老朋友 telnet 来看下 Dovecot 是否设置正确。

```
$ telnet studio 110
Trying 127.0.1.1...
Connected to studio.
Escape character is '^]'.
+OK Dovecot ready.
user molly@studio
+OK
pass password
+OK Logged in.
quit
+OK Logging out.
Connection closed by foreign host.
```

现在一切都好！让我们用 `mail` 命令，发送测试消息给我们的用户。确保使用用户的完整电子邮箱地址而不只是用户名。

```
$ mail benny@studio
Subject: hello and welcome!
Please enjoy your new mail account!
.
```

最后一行的**英文句点**表示发送消息。让我们看下它是否到达了正确的邮箱。

```
$ sudo ls -al /home/vmail/studio/benny@studio/.Mail/new
total 16
drwx------ 2 vmail vmail 4096 Dec 14 12:39 .
drwx------ 5 vmail vmail 4096 Dec 14 12:39 ..
-rw------- 1 vmail vmail  525 Dec 14 12:39 1481747995.M696591P5790.studio,S=525,W=540
```

找到了。这是一封我们可以阅读的纯文本文件：

```
$ less 1481747995.M696591P5790.studio,S=525,W=540
Return-Path: <carla@localhost>
Delivered-To: benny@studio
Received: from localhost
        by studio (Dovecot) with LMTP id V01ZKRuuUVieFgAABiesew
        for <benny@studio>; Wed, 14 Dec 2016 12:39:55 -0800
Received: by localhost (Postfix, from userid 1000)
        id 9FD9CA1F58; Wed, 14 Dec 2016 12:39:55 -0800 (PST)
Date: Wed, 14 Dec 2016 12:39:55 -0800
To: benny@studio
Subject: hello and welcome!
User-Agent: s-nail v14.8.6
Message-Id: <20161214203955.9FD9CA1F58@localhost>
From: carla@localhost (carla)

Please enjoy your new mail account!
```

你还可以使用 telnet 进行测试，如本系列前面部分所述，并在你最喜欢的邮件客户端中设置帐户，如 Thunderbird，Claws-Mail 或 KMail。

### 故障排查

当邮件工作不正常时，请检查日志文件（请参阅配置示例），然后运行 `journalctl -xe`。 这时会提供定位输入错误、未安装包和可以 Google 的短语等所有需要的信息。

### 接下来？

假设你的 LAN 名称服务配置正确，你现在有一台很好用的 LAN 邮件服务器。 显然，以纯文本发送消息不是最佳的，不支持互联网的邮件也是绝对不可以的。 请参阅 [Dovecot SSL 配置][5]和 [Postfix TLS 支持][6]，[VirtualUserFlatFilesPostfix][7] 涵盖了 TLS 和数据库后端。并请期待我之后的 SSL 指南。这次我说的是真的。


--------------------------------------------------------------------------------

via: https://www.linux.com/learn/sysadmin/building-email-server-ubuntu-linux-part-3

作者：[CARLA SCHRODER][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/mail-serverjpg
[3]:https://linux.cn/article-8071-1.html
[4]:https://linux.cn/article-8077-1.html
[5]:http://wiki.dovecot.org/SSL/DovecotConfiguration
[6]:http://www.postfix.org/TLS_README.html
[7]:http://wiki2.dovecot.org/HowTo/VirtualUserFlatFilesPostfix
