如何在 Ubuntu 环境下搭建邮件服务器（二）
============================================================

![Dovecot email](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/dovecot-email.jpg?itok=tY4veggw "Dovecot email") 

本教程的第 2 部分将介绍如何使用 Dovecot 将邮件从 Postfix 服务器移动到用户的收件箱。以[Creative Commons Zero][2] 方式授权发布

在[第一部分][5]中，我们安装并测试了 Postfix SMTP 服务器。Postfix 或任何 SMTP 服务器都不是一个完整的邮件服务器，因为它所做的只是在 SMTP 服务器之间移动邮件。我们需要 Dovecot 将邮件从 Postfix 服务器移动到用户的收件箱中。

Dovecot 支持两种标准邮件协议：IMAP（Internet 邮件访问协议）和 POP3（邮局协议）。 IMAP 服务器会在服务器上保留所有邮件。您的用户可以选择将邮件下载到计算机或仅在服务器上访问它们。 IMAP 对于有多台机器的用户是方便的。但对你而言需要更多的工作，因为你必须确保你的服务器始终可用，而且 IMAP 服务器需要大量的存储和内存。

POP3 是较旧的协议。POP3 服务器可以比 IMAP 服务器服务更多的用户，因为邮件会下载到用户的计算机。大多数邮件客户端可以选择在服务器上保留一定天数的邮件，因此 POP3 的行为有点像 IMAP。但它又不是 IMAP，当你像 IMAP 那样（在多台计算机上使用它时）那么常常会下载多次或意外删除。

### 安装 Dovecot

启动你的 Ubuntu 系统并安装 Dovecot：

```
$ sudo apt-get install dovecot-imapd dovecot-pop3d
```

它会安装可用的配置，并在完成后自动启动，你可以用 `ps ax | grep dovecot` 确认：

```
$ ps ax | grep dovecot
15988 ?  Ss 0:00 /usr/sbin/dovecot
15990 ?  S  0:00 dovecot/anvil
15991 ?  S  0:00 dovecot/log
```

打开你的 Postfix 配置文件 `/etc/postfix/main.cf`，确保配置了maildir 而不是 mbox 的邮件存储方式，mbox 是给每个用户一个单一大文件，而 maildir 是每条消息都存储为一个文件。大量的小文件比一个庞大的文件更稳定且易于管理。添加如下两行，第二行告诉 Postfix 你需要 maildir 格式，并且在每个用户的家目录下创建一个 `.Mail` 目录。你可以取任何名字，不一定要是 `.Mail`：

```
mail_spool_directory = /var/mail
home_mailbox = .Mail/
```

现在调整你的 Dovecot 配置。首先把原始的 `dovecot.conf` 文件重命名放到一边，因为它会调用存放在 `conf.d` 中的文件，在你刚刚开始学习时把配置放一起更简单些：

```
$ sudo mv /etc/dovecot/dovecot.conf /etc/dovecot/dovecot-oldconf
```

现在创建一个新的 `/etc/dovecot/dovecot.conf`：

```
disable_plaintext_auth = no
mail_location = maildir:~/.Mail
namespace inbox {
  inbox = yes
  mailbox Drafts {
    special_use = \Drafts
  }
  mailbox Sent {
    special_use = \Sent
  }
  mailbox Trash {
    special_use = \Trash
  }
}
passdb {
  driver = pam
}
protocols = " imap pop3"
ssl = no
userdb {
  driver = passwd
}
```

注意 `mail_location = maildir` 必须和 `main.cf` 中的 `home_mailbox` 参数匹配。保存你的更改并重新加载 Postfix 和 Dovecot 配置：

```
$ sudo postfix reload
$ sudo dovecot reload
```

### 快速导出配置

使用下面的命令来快速查看你的 Postfix 和 Dovecot 配置：

```
$ postconf -n
$ doveconf -n
```

### 测试 Dovecot

现在再次启动 telnet，并且给自己发送一条测试消息。粗体显示的是你输入的命令。`studio` 是我服务器的主机名，因此你必须用自己的：

```
$ telnet studio 25
Trying 127.0.1.1...
Connected to studio.
Escape character is '^]'.
220 studio.router ESMTP Postfix (Ubuntu)
EHLO studio
250-studio.router
250-PIPELINING
250-SIZE 10240000
250-VRFY
250-ETRN
250-STARTTLS
250-ENHANCEDSTATUSCODES
250-8BITMIME
250-DSN
250 SMTPUTF8
mail from: tester@test.net
250 2.1.0 Ok
rcpt to: carla@studio
250 2.1.5 Ok
data
354 End data with .Date: November 25, 2016
From: tester
Message-ID: first-test
Subject: mail server test
Hi carla,
Are you reading this? Let me know if you didn't get this.
.
250 2.0.0 Ok: queued as 0C261A1F0F
quit
221 2.0.0 Bye                                                                   
Connection closed by foreign host.
```

现在请求 Dovecot 来取回你的新消息，使用你的 Linux 用户名和密码登录：

```

$ telnet studio 110                                            
Trying 127.0.0.1...                                                             
Connected to studio.                                                         
Escape character is '^]'.                                                       
+OK Dovecot ready.                                                              
user carla
+OK
pass password
+OK Logged in.
stat
+OK 2 809
list
+OK 2 messages:
1 383
2 426
.
retr 2
+OK 426 octets
Return-Path: <tester@test.net>
X-Original-To: carla@studio
Delivered-To: carla@studio
Received: from studio (localhost [127.0.0.1])
        by studio.router (Postfix) with ESMTP id 0C261A1F0F
        for <carla@studio>; Wed, 30 Nov 2016 17:18:57 -0800 (PST)
Date: November 25, 2016
From: tester@studio.router
Message-ID: first-test
Subject: mail server test

Hi carla,
Are you reading this? Let me know if you didn't get this.
.
quit
+OK Logging out.
Connection closed by foreign host.
```

花一点时间比较第一个例子中输入的消息和第二个例子中接收的消息。 返回地址和日期是很容易伪造的，但 Postfix 不会被愚弄。大多数邮件客户端默认显示一个最小的标头集，但是你需要读取完整的标头才能查看真实的回溯。

你也可以在你的 `~/Mail/cur` 目录中查看你的邮件，它们是普通文本，我已经有两封测试邮件：

```
$ ls .Mail/cur/
1480540325.V806I28e0229M351743.studio:2,S
1480555224.V806I28e000eM41463.studio:2,S
```

### 测试 IMAP

我们 Dovecot 同时启用了 POP3 和 IMAP 服务，因此让我们使用 telnet 测试 IMAP。

```
$ telnet studio imap2   
Trying 127.0.1.1...
Connected to studio.
Escape character is '^]'.
* OK [CAPABILITY IMAP4rev1 LITERAL+ SASL-IR LOGIN-REFERRALS 
ID ENABLE IDLE AUTH=PLAIN] Dovecot ready.
A1 LOGIN carla password
A1 OK [CAPABILITY IMAP4rev1 LITERAL+ SASL-IR LOGIN-REFERRALS 
ID ENABLE IDLE SORT SORT=DISPLAY THREAD=REFERENCES THREAD=REFS 
THREAD=ORDEREDSUBJECT MULTIAPPEND URL-PARTIAL CATENATE UNSELECT 
CHILDREN NAMESPACE UIDPLUS LIST-EXTENDED I18NLEVEL=1 CONDSTORE 
QRESYNC ESEARCH ESORT SEARCHRES WITHIN CONTEXT=SEARCH LIST-STATUS 
BINARY MOVE SPECIAL-USE] Logged in
A2 LIST "" "*"
* LIST (\HasNoChildren) "." INBOX
A2 OK List completed (0.000 + 0.000 secs).
A3 EXAMINE INBOX
* FLAGS (\Answered \Flagged \Deleted \Seen \Draft)
* OK [PERMANENTFLAGS ()] Read-only mailbox.
* 2 EXISTS
* 0 RECENT
* OK [UIDVALIDITY 1480539462] UIDs valid
* OK [UIDNEXT 3] Predicted next UID
* OK [HIGHESTMODSEQ 1] Highest
A3 OK [READ-ONLY] Examine completed (0.000 + 0.000 secs).
A4 logout
* BYE Logging out
A4 OK Logout completed.
Connection closed by foreign host
```

### Thunderbird 邮件客户端

图 1 中的屏幕截图显示了我局域网上另一台主机上的图形邮件客户端中的邮件。

![thunderbird mail](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/thunderbird-mail.png?itok=IkWK5Ti_ "thunderbird mail") 

*图1： Thunderbird mail*

此时，你已有一个可以工作的 IMAP 和 POP3 邮件服务器，并且你也知道该如何测试你的服务器。你的用户可以在他们设置邮件客户端时选择要使用的协议。如果您只想支持一个邮件协议，那么只需要在您的 Dovecot 配置中留下你要的协议名字。

然而，这还远远没有完成。这是一个非常简单、没有加密的、大门敞开的安装。它也只适用于与邮件服务器在同一系统上的用户。这是不可扩展的，并具有一些安全风险，例如没有密码保护。 我们会在[下篇][6]了解如何创建与系统用户分开的邮件用户，以及如何添加加密。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/sysadmin/building-email-server-ubuntu-linux-part-2

作者：[CARLA SCHRODER][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/thunderbird-mailpng
[4]:https://www.linux.com/files/images/dovecot-emailjpg
[5]:https://linux.cn/article-8071-1.html
[6]:https://www.linux.com/learn/sysadmin/building-email-server-ubuntu-linux-part-3
