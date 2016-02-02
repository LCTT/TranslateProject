如何 Mutt 邮件客户端中使用密文密码
================================================================================
Mutt 是一个 Linux/UNIX 终端环境下的开源的邮件客户端。Mutt 以及 [Alpine][1] 在 Linux 命令行爱好者中有着最忠诚的追随者，这不是没有原因的。想一下你所期待邮件客户端应有的功能，Mutt 拥有：多协议支持（例如，POP3、IMAP 和 SMTP），S/MIME 和 PGP/GPG 集成，会话线索，颜色标记，可定制宏/快捷键，等等。另外，基于命令行的 Mutt 相比粗重的基于浏览器的邮件客户端（如：Gmail，Ymail）或图形用户界面的邮件客户端（如：Thunderbird，MS Outlook）而言，是一个使用电子邮件的轻量级替代品。

当你想使用 Mutt 通过公司的 SMTP/IMAP 服务器访问或发送邮件，或取代网页邮件服务，可能所关心的一个问题是如何保护您的邮件凭据（如：SMTP/IMAP 密码），它们存储在一个纯文本 Mutt 配置文件（~/.muttrc）中。

对于这些人对安全的担忧，确实有一个容易的方法来**加密 Mutt 配置文件***，以防止这种风险。在这个教程中，我描述了如何加密 Mutt 敏感配置，比如使用 GnuPG（GPG）加密 SMTP/IMAP 密码，GPG 是一个开源的 OpenPGP 实现。

### 第一步 （可选）：创建 GPG 密钥  ###

因为我们将要使用 GPG 加密 Mutt 配置文件，如果你没有 GPG 密钥，第一步就是创建一个（公钥/私钥对）。如果有，请忽略这步。

创建一个新 GPG 密钥，输入下面命令：

    $ gpg --gen-key

选择密钥类型（RSA），密钥长度（2048 bits），和过期时间（0 代表不过期）。当出现用户 ID 提示时，输入关联到该公钥/私钥对的名字（Dan Nanni） 和邮箱地址（myemail@email.com）。最后，输入一个密码来保护你的私钥。

![](https://c2.staticflickr.com/6/5726/22808727824_7735f11157_c.jpg)

生成一个 GPG 密钥需要大量的随机字节来构成熵，所以在生成密钥期间确保在你的系统上执行一些随机行为（如：敲打键盘，移动鼠标或者读写磁盘）。根据密钥长度，生成 GPG 密钥要花几分钟或更多时间。

![](https://c1.staticflickr.com/1/644/23328597612_6ac5a29944_c.jpg)

### 第二步：加密 Mutt 敏感配置 ###

下一步，在 ~/.mutt 目录创建一个新的文本文件，然后把一些你想隐藏的 Mutt 敏感配置放进去。这个例子里，我指定了 SMTP/IMAP 密码。

    $ mkdir ~/.mutt
    $ vi ~/.mutt/password

----------

    set smtp_pass="XXXXXXX"
    set imap_pass="XXXXXXX"

现在通过 GPG 使用你的公钥加密这个文件如下：

    $ gpg -r myemail@email.com -e ~/.mutt/password

这将创建 ~/.mutt/password.gpg，这是一个原始文件的 GPG 加密版本。

然后删除 ~/.mutt/password，只保留 GPG 加密版本。

### 第三步：创建完整 Mutt 配置文件  ###

现在你已经在一个单独的文件放置了加密的 Mutt 敏感配置，你可以在 ~/.muttrc 指定其余的 Mutt 配置。然后增加下面这行在 ~/.muttrc 末尾。

    source "gpg -d ~/.mutt/password.gpg |"

当你启动 Mutt 时，这行将解密 ~/.mutt/password.gpg ，然后将解密内容应用到你的 Mutt 配置中。

下面展示一个完整 Mutt 配置例子，这可以让你通过 Mutt 访问 Gmail，而没有暴露你的 SMTP/IMAP 密码。用你的 Gmail ID 替代下面的 `yourgmailaccount`，此外你也需要在[你的 Goolgle 账户设置][3]中启用“支持不太安全的应用访问”。

    set from = "yourgmailaccount@gmail.com"
    set realname = "Your Name"
    set smtp_url = "smtp://yourgmailaccount@smtp.gmail.com:587/"
    set imap_user = "yourgmailaccount@gmail.com"
    set folder = "imaps://imap.gmail.com:993"
    set spoolfile = "+INBOX"
    set postponed = "+[Google Mail]/Drafts"
    set trash = "+[Google Mail]/Trash"
    set header_cache =~/.mutt/cache/headers
    set message_cachedir =~/.mutt/cache/bodies
    set certificate_file =~/.mutt/certificates
    set move = no
    set imap_keepalive = 900
     
    # encrypted IMAP/SMTP passwords
    source "gpg -d ~/.mutt/password.gpg |"

### 第四步（可选）：配置 GPG 代理  ###

这时候，你将可以使用加密了IMAP/SMTP 密码的 Mutt。然而，每次你运行 Mutt，你都要先被提示输入一个 GPG 密码来使用你的私钥解密 IMAP/SMTP 密码。

![](https://c2.staticflickr.com/6/5667/23437064775_20c874940f_c.jpg)

如果你想避免这样的 GPG 密码提示，你可以部署一个 gpg-agent。它以后台守护进程方式运行，gpg-agent 可以安全地缓存你的 GPG 密码，无需手工干预，gpg 可以自动从 gpg-agent 获得你的 GPG 密码。如果你正在使用 Linux 桌面，你可以配置使用一些等同于 gpg-agent 的特定的桌面软件，例如，GNOME 桌面的 gnome-keyring-daemon。

你可以在基于 Debian 系统安装 gpg-agent：
    
	$ sudo apt-get install gpg-agent

gpg-agent 在基于 Red Hat 的系统上是预装好的。

现在增加下面这些到你的 .bashrc 文件中。

    envfile="$HOME/.gnupg/gpg-agent.env"
    if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
        eval "$(cat "$envfile")"
    else
        eval "$(gpg-agent --daemon --allow-preset-passphrase --write-env-file "$envfile")"
    fi
    export GPG_AGENT_INFO

重载 .bashrc，或简单的登出然后重新登录。

    $ source ~/.bashrc

现在确认 GPG_AGENT_INFO 环境变量已经设置妥当。

    $ echo $GPG_AGENT_INFO

    /tmp/gpg-0SKJw8/S.gpg-agent:942:1

并且，当你输入 gpg-agent 命令时，你应该看到下面的信息。

    $ gpg-agent

    gpg-agent: gpg-agent running and available

一旦 gpg-agent 启动运行，它将会在第一次提示你输入密码时缓存你的 GPG 密码。随后你多次运行 Mutt ，都不会被提示要 GPG 密码（gpg-agent 一直开着，缓存就不会过期）。

![](https://c1.staticflickr.com/1/664/22809928093_3be57698ce_c.jpg)

### 结论 ###

在这个指导里，我提供一个使用 GnuPG 加密如 SMTP/IMAP 密码这样的 Mutt 敏感配置的方法。注意，如果你想在 Mutt 上使用 GnuPG 来加密或签名你的邮件，你可以参考[官方指南][2]关于 GPG 与 Mutt 结合的部分。

如果你知道任何使用 Mutt 的安全技巧，欢迎分享它。

--------------------------------------------------------------------------------

via: http://xmodulo.com/mutt-email-client-encrypted-passwords.html

作者：[Dan Nanni][a]
译者：[wyangsun](https://github.com/wyangsun)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/gmail-command-line-linux-alpine.html
[2]:http://dev.mutt.org/trac/wiki/MuttGuide/UseGPG
[3]:https://www.google.com/settings/u/1/security