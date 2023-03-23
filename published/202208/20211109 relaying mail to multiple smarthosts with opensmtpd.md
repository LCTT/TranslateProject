[#]: subject: "relaying mail to multiple smarthosts with opensmtpd"
[#]: via: "https://jao.io/blog/2021-11-09-relaying-mail-to-multiple-smarthosts.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14891-1.html"

使用 OpenSMTPD 将邮件中继到多个 smarthost
======

![](https://img.linux.net.cn/data/attachment/album/202208/03/162813rc900xbgx3xggxxg.jpg)

我喜欢使用本地 SMTP 守护进程从我的笔记本电脑发送电子邮件，因为这样我即使在断开连接的情况下也可以发送电子邮件，而且，即使是在网络正常的情况下，因为我不需要等待网络协议在远程 smarthost 上完成。哦，我还需要本地邮件投递。

多年来，我一直使用 Postfix 来达到这些目的。它具有可接受的简单配置。但最近我开始喜欢 VPN（[mullvad][1]，如果你想知道的话），而在 `/etc/resolv.conf` 发生变化时会变得混乱（例如，你在 Postfix 的服务启动后才启动 VPN）。我找到了一个非常简单的替代方案：[OpenSMTPD][2]。

假设我想在使用 [jao@gnu.org][3] 发送电子邮件时使用 SMTP 服务器 fencepost.gnu.org，而在我的 `From` 头中使用 [mail@jao.io][4] 或 [news@xmobar.org][5] 时使用 smtp.jao.io。OpenSMTPD 让你通过一个非常简单的配置文件 `/etc/smtpd.conf` 来实现：

（这是我的 Debian 机器中的默认配置文件。另一个流行的替代方案是 `/etc/openstmpd.conf`）。

```
table aliases file:/etc/aliases
table secrets db:/etc/mail/secrets.db

table sendergnu { jao@gnu.org }
table senderjao { mail@jao.io, news@xmobar.org }

listen on localhost

action "local" mbox alias <aliases>
action "relaygnu" relay host smtp+tls://gnu@fencepost.gnu.org:587 auth <secrets>
action "relayjao" relay host smtps://jao@smtp.jao.io:465 auth <secrets>

match for local action "local"
match for any from mail-from <sendergnu> action "relaygnu"
match for any from mail-from <senderjao> action "relaygan"
```

我们还为此配置了本地投递。这是完整的配置文件！唯一需要的另一件事是生成 `secrets.db` 文件，其中包含与键 `gnu` 和 `jao` 对应的用户和密码（这些只是任意名称）。为此，我们使用它们创建一个纯文本文件，使用形式为 `<key> <user>:<password>` 的条目：

```
gnu  jao:my fencepost password
jao  mail@jao.io:xxxxxxxxxxxxxxxxx
```

`fencepost.gnu.org` 用户是 `jao`，`smtp.jao.io` 的用户是 `mail@jao.io`（你看，不需要转义空格或 ats）。然后我们使用程序 `makemap` 来创建密钥数据库：

```
makemap secrets && rm secrets
```

--------------------------------------------------------------------------------

via: https://jao.io/blog/2021-11-09-relaying-mail-to-multiple-smarthosts.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Mullvad
[2]: https://www.opensmtpd.org/
[3]: mailto:jao@gnu.org
[4]: mailto:mail@jao.io
[5]: mailto:news@xmobar.org
[6]: tmp.zHAc8OxDnm#fn.1
[7]: tmp.zHAc8OxDnm#fnr.1
[8]: https://jao.io/blog/tags.html
[9]: https://jao.io/blog/tag-sundry.html
