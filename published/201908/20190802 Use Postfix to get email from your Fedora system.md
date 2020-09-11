[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11224-1.html)
[#]: subject: (Use Postfix to get email from your Fedora system)
[#]: via: (https://fedoramagazine.org/use-postfix-to-get-email-from-your-fedora-system/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

使用 Postfix 从 Fedora 系统中获取电子邮件
======

![][1]

交流是非常重要的。你的电脑可能正试图告诉你一些重要的事情。但是，如果你没有正确配置邮件传输代理（[MTA][2]），那么你可能不会收到通知。Postfix 是一个[易于配置且以强大的安全记录而闻名][3]的 MTA。遵循以下步骤，以确保从本地服务发送的电子邮件通知将通过 Postfix MTA 路由到你的互联网电子邮件账户中。

### 安装软件包

使用 `dnf` 来安装一些必须软件包（[你应该配置了 sudo，对吧？][4]）：

```
$ sudo -i
# dnf install postfix mailx
```

如果以前配置了不同的 MTA，那么你可能需要将 Postfix 设置为系统默认。使用 `alternatives` 命令设置系统默认 MTA：

```
$ sudo alternatives --config mta
There are 2 programs which provide 'mta'.
  Selection    Command
*+ 1           /usr/sbin/sendmail.sendmail
   2           /usr/sbin/sendmail.postfix
Enter to keep the current selection[+], or type selection number: 2
```

### 创建一个 password_maps 文件

你需要创建一个 Postfix 查询表条目，其中包含你要用于发送电子邮件账户的地址和密码：

```
# MY_EMAIL_ADDRESS=glb@gmail.com
# MY_EMAIL_PASSWORD=abcdefghijklmnop
# MY_SMTP_SERVER=smtp.gmail.com
# MY_SMTP_SERVER_PORT=587
# echo "[$MY_SMTP_SERVER]:$MY_SMTP_SERVER_PORT $MY_EMAIL_ADDRESS:$MY_EMAIL_PASSWORD" >> /etc/postfix/password_maps
# chmod 600 /etc/postfix/password_maps
# unset MY_EMAIL_PASSWORD
# history -c
```

如果你使用的是 Gmail 账户，那么你需要为 Postfix 配置一个“应用程序密码”而不是使用你的 Gmail 密码。有关配置应用程序密码的说明，参阅“[使用应用程序密码登录][5]”。

接下来，你必须对 Postfix 查询表运行 `postmap` 命令，以创建或更新 Postfix 实际使用的文件的散列版本：

```
# postmap /etc/postfix/password_maps
```

散列后的版本将具有相同的文件名，但后缀为 `.db`。

### 更新 main.cf 文件

更新 Postfix 的 `main.cf` 配置文件，以引用刚刚创建 Postfix 查询表。编辑该文件并添加以下行：

```
relayhost = smtp.gmail.com:587
smtp_tls_security_level = verify
smtp_tls_mandatory_ciphers = high
smtp_tls_verify_cert_match = hostname
smtp_sasl_auth_enable = yes
smtp_sasl_security_options = noanonymous
smtp_sasl_password_maps = hash:/etc/postfix/password_maps
```

这里假设你使用 Gmail 作为 `relayhost` 设置，但是你可以用正确的主机名和端口替换系统应该将邮件发送到的邮件主机。

有关上述配置选项的最新详细信息，参考 man 帮助：

```
$ man postconf.5
```

### 启用、启动和测试 Postfix

更新 `main.cf` 文件后，启用并启动 Postfix 服务：

```
# systemctl enable --now postfix.service
```

然后，你可以使用 `exit` 命令或 `Ctrl+D` 以 root 身份退出 `sudo` 会话。你现在应该能够使用 `mail` 命令测试你的配置：

```
$ echo 'It worked!' | mail -s "Test: $(date)" glb@gmail.com
```

### 更新服务

如果你安装了像 [logwatch][6]、[mdadm][7]、[fail2ban][8]、[apcupsd][9] 或 [certwatch][10] 这样的服务，你现在可以更新它们的配置，以便它们的电子邮件通知转到你的 Internet 电子邮件地址。

另外，你可能希望将发送到本地系统 root 账户的所有电子邮件都转到互联网电子邮件地址中，将以下行添加到系统的 `/etc/alises` 文件中（你需要使用 `sudo` 编辑此文件，或首先切换到 `root` 账户）：

```
root: glb+root@gmail.com
```

现在运行此命令重新读取别名：

```
# newaliases
```

* 提示: 如果你使用的是 Gmail，那么你可以在用户名和 `@` 符号之间[添加字母数字标记][11]，如上所示，以便更轻松地识别和过滤从计算机收到的电子邮件。

### 常用命令

**查看邮件队列：**

```
$ mailq
```

**清除队列中的所有电子邮件：**

```
# postsuper -d ALL
```

**过滤设置，以获得感兴趣的值：**

```
$ postconf | grep "^relayhost\|^smtp_"
```

**查看 `postfix/smtp` 日志：**

```
$ journalctl --no-pager -t postfix/smtp
```

**进行配置更改后重新加载 postfix：**

```
$ systemctl reload postfix
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-postfix-to-get-email-from-your-fedora-system/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/07/postfix-816x345.jpg
[2]: https://en.wikipedia.org/wiki/Message_transfer_agent
[3]: https://en.wikipedia.org/wiki/Postfix_(software)
[4]: https://fedoramagazine.org/howto-use-sudo/
[5]: https://support.google.com/accounts/answer/185833
[6]: https://src.fedoraproject.org/rpms/logwatch
[7]: https://fedoramagazine.org/mirror-your-system-drive-using-software-raid/
[8]: https://fedoraproject.org/wiki/Fail2ban_with_FirewallD
[9]: https://src.fedoraproject.org/rpms/apcupsd
[10]: https://www.linux.com/learn/automated-certificate-expiration-checks-centos
[11]: https://gmail.googleblog.com/2008/03/2-hidden-ways-to-get-more-from-your.html
[12]: https://unsplash.com/@sharonmccutcheon?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[13]: https://unsplash.com/search/photos/envelopes?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
