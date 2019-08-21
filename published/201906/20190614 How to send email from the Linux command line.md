[#]: collector: (lujun9972)
[#]: translator: (Modrisco)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11020-1.html)
[#]: subject: (How to send email from the Linux command line)
[#]: via: (https://www.networkworld.com/article/3402027/how-to-send-email-from-the-linux-command-line.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何用 Linux 命令行发电子邮件
======

> Linux 提供了几个可以让你通过终端发送电子邮件的命令，下面来展示一些有趣的方法。

![Molnia/iStock][1]

Linux 可以用多种方式通过命令行发送电子邮件。有一些方法十分简单，有一些相对会复杂一些，不过仍旧提供了很多有用的特性。选择哪一种方式取决于你想要什么 —— 向同事快速发送消息，还是向一批人群发带有附件的更复杂的信息。接下来看一看几种可行方案：

### mail

发送一条简单消息最便捷的 Linux 命令是 `mail`。假设你需要提醒老板你今天得早点走，你可以使用这样的一条命令：

```
$ echo "Reminder: Leaving at 4 PM today" | mail -s "early departure" myboss
```

另一种方式是从一个文件中提取出你想要发送的文本信息：

```
$ mail -s "Reminder:Leaving early" myboss < reason4leaving
```

在以上两种情况中，你都可以通过 `-s` 来为邮件添加标题。

### sendmail

使用 `sendmail` 命令可以发送一封不包含标题的快信。（用目标收件人替换 `recip`）：

```
$ echo "leaving now" | sendmail recip
```

你可以用这条命令发送一条只有标题，没有内容的信息：

```
$ echo "Subject: leaving now" | sendmail recip
```

你也可以用 `sendmail` 发送一条包含一条标题行的完整信息。不过使用这个方法时，你的标题行会被添加到要发送的文件中，如下例所示：

```
Subject: Requested lyrics
I would just like to say that, in my opinion, longer hair and other flamboyant
affectations of appearance are nothing more ...
```

你也可以发送这样的文件（`lyric` 文件包含标题和正文）：

```
$ sendmail recip < lyrics
```

`sendmain` 的输出也可以很冗长。如果你感到好奇并希望查看发送系统和接收系统之间的交互，请添加 `-v` （verbose）选项。

```
$ sendmail -v recip@emailsite.com < lyrics
```

### mutt

`mutt` 是通过命令行发送邮件的一个很好的工具，在使用前你需要安装它。`mutt` 的一个很方便的优势就是它允许你在邮件中添加附件。

使用 `mutt` 发送一条快速信息：

```
$ echo "Please check last night's backups" | mutt -s "backup check" recip
```

从文件中获取内容：

```
$ mutt -s "Agenda" recip < agenda
```

使用 `-a` 选项在 `mutt` 中添加附件。你甚至可以添加不止一个附件 —— 如下一条命令所示：

```
$ mutt -s "Agenda" recip -a agenda -a speakers < msg
```

在以上的命令中，`msg` 文件包含了邮件中的正文。如果你没有其他补充的内容，你可以这样来代替之前的命令：

```
$ echo "" | mutt -s "Agenda" recip -a agenda -a speakers
```

`mutt` 另一个有用的功能是可以添加抄送（`-c`）和密送（`-b`）。

```
$ mutt -s "Minutes from last meeting" recip@somesite.com -c myboss < mins
```

### telnet

如果你想深入了解发送电子邮件的细节，你可以使用 `telnet` 来进行电子邮件交互操作。但正如所说的那样，你需要“学习术语”。邮件服务器期望一系列命令，其中包括自我介绍（`EHLO` 命令）、提供发件人（`MAIL FROM` 命令）、指定收件人（`RCPT TO` 命令），然后添加消息（`DATA`）并以 `.` 结束消息。并不是所有的电子邮件服务器都会响应这些请求。此方法通常仅用于故障排除。

```
$ telnet emailsite.org 25
Trying 192.168.0.12...
Connected to emailsite.
Escape character is '^]'.
220 localhost ESMTP Sendmail 8.15.2/8.15.2/Debian-12; Wed, 12 Jun 2019 16:32:13 -0400; (No UCE/UBE) logging access from: mysite(OK)-mysite [192.168.0.12]
EHLO mysite.org                <== introduce yourself
250-localhost Hello mysite [127.0.0.1], pleased to meet you
250-ENHANCEDSTATUSCODES
250-PIPELINING
250-EXPN
250-VERB
250-8BITMIME
250-SIZE
250-DSN
250-ETRN
250-AUTH DIGEST-MD5 CRAM-MD5
250-DELIVERBY
250 HELP
MAIL FROM: me@mysite.org       <== 指定发件人
250 2.1.0 shs@mysite.org... Sender ok
RCPT TO: recip             <== 指定收件人
250 2.1.5 recip... Recipient ok
DATA                   <== 邮件内容开始
354 Enter mail, end with "." on a line by itself
This is a test message. Please deliver it for me.
.                  <== 内容结束
250 2.0.0 x5CKWDds029287 Message accepted for delivery
quit                   <== 结束交互
```

### 向多个收件人发送电子邮件

如果你希望通过 Linux 命令行向一大组收件人发送电子邮件，你可以使用一个循环来帮助你完成任务，如下面应用在 `mutt` 中的例子：

```
$ for recip in `cat recips`
do
    mutt -s "Minutes from May meeting" $recip < May_minutes
done
```

### 总结

有很多方法可以从 Linux 命令行发送电子邮件。有些工具提供了相当多的选项。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3402027/how-to-send-email-from-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[Modrisco](https://github.com/Modrisco)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2017/08/email_image_blue-100732096-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
