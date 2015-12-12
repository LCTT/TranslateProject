如何使用加密过密码的Mutt邮件客户端
================================================================================
Mutt是一个开源的Linux/UNIX终端环境下的邮件客户端。连同[Alpine][1]，Mutt有充分的理由在Linux命令行热衷者中有最忠诚的追随者。想一下你对邮件客户端的期待的事情，Mutt拥有：多协议支持（e.g., POP3, IMAP and SMTP），S/MIME和PGP/GPG集成，线程会话，颜色编码，可定制宏/快捷键，等等。另外，基于命令行的Mutt相比笨重的web浏览器（如：Gmail，Ymail）或可视化邮件客户端（如：Thunderbird，MS Outlook）是一个轻量访问电子邮件的选择。

当你想使用Mutt通过公司的SMTP/IMAP服务器访问或发送邮件，或取代网页邮件服务，可能所关心的一个问题是如何保护您的邮件凭据（如：SMTP/IMAP密码）存储在一个纯文本Mutt配置文件（~/.muttrc）。

对于一些人安全的担忧，确实有一个容易的方法来**加密Mutt配置文件***，防止这种风险。在这个教程中，我描述了如何加密Mutt敏感配置，比如SMTP/IMAP密码使用GnuPG（GPG），一个开源的OpenPGP实现。

### 第一步 （可选）：创建GPG密钥  ###

因为我们将要使用GPG加密Mutt配置文件，如果你没有，第一步就是创建一个GPG密钥（公有/私有 密钥对）。如果有，忽略这步。

创建一个新GPG密钥，输入下面的。

    $ gpg --gen-key

选择密钥类型（RSA），密钥长度（2048 bits），和过期时间（0，不过期）。当出现用户ID提示时，输入你的名字（Dan Nanni） 和邮箱地址（myemail@email.com）关联到私有/公有密钥对。最后，输入一个密码来保护你的私钥。

![](https://c2.staticflickr.com/6/5726/22808727824_7735f11157_c.jpg)

生成一个GPG密钥需要大量的随机字节熵，所以在生成密钥期间确保在你的系统上执行一些随机行为（如：打键盘，移动鼠标或者读写磁盘）。根据密钥长度决定生成GPG密钥要花几分钟或更多时间。

![](https://c1.staticflickr.com/1/644/23328597612_6ac5a29944_c.jpg)

### 第二部：加密Mutt敏感配置 ###

下一步，在~/.mutt目录创建一个新的文本文件，然后把一些你想隐藏的Mutt敏感配置放进去。这个例子里，我指定了SMTP/IMAP密码。

    $ mkdir ~/.mutt
    $ vi ~/.mutt/password

----------

    set smtp_pass="XXXXXXX"
    set imap_pass="XXXXXXX"

现在gpg用你的公钥加密这个文件如下。

    $ gpg -r myemail@email.com -e ~/.mutt/password

这将创建~/.mutt/password.gpg，这个是一个GPG加密原始版本文件。

继续删除~/.mutt/password，只保留GPG加密版本。

### 第三部：创建完整Mutt配置文件  ###

由于你已经在一个单独的文件加密了Mutt敏感配置，你可以在~/.muttrc指定其余的Mutt配置。然后增加下面这行在~/.muttrc末尾。

    source "gpg -d ~/.mutt/password.gpg |"

当你使用Mutt，这行将解密~/.mutt/password.gpg，然后将解密内容应用到你的Mutt配置。

下面展示一个完整Mutt配置例子，这允许你用Mutt访问Gmail，没有暴露你的SMTP/IMAP密码。取代你用Gmail ID登陆你的账户。

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

### 第四部（可选）：配置GPG代理  ###

这时候，你将可以使用加密了IMAP/SMTP密码的Mutt。无论如何，每次你运行Mutt，你都要先被提示输入一个GPG密码来使用你的私钥解密IMAP/SMTP密码。

![](https://c2.staticflickr.com/6/5667/23437064775_20c874940f_c.jpg)

如果你想避免这样的GPG密码提示，你可以部署gpg代理。运行一个后台程序，gpg代理安全的缓存你的GPG密码，无需手工干预gpg自动从gpg代理获得你的GPG密码。如果你正在使用Linux桌面，你可以使用桌面特定方式来配置一些东西等价于gpg代理，例如，GNOME桌面的gnome-keyring-daemon。

你可以在基于Debian系统安装gpg代理：
    
$ sudo apt-get install gpg-agent

gpg代理是基于Red Hat系统预装的。

现在增加下面这些道你的.bashrc文件。

    envfile="$HOME/.gnupg/gpg-agent.env"
    if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
        eval "$(cat "$envfile")"
    else
        eval "$(gpg-agent --daemon --allow-preset-passphrase --write-env-file "$envfile")"
    fi
    export GPG_AGENT_INFO

重载.bashrc，或单纯的登出然后登陆回来。

    $ source ~/.bashrc

现在确认GPG_AGENT_INFO环境变量已经设置妥当。

    $ echo $GPG_AGENT_INFO

----------

    /tmp/gpg-0SKJw8/S.gpg-agent:942:1

并且，当你输入gpg-agent命令时，你应该看到下面的信息。

    $ gpg-agent

----------

    gpg-agent: gpg-agent running and available

一旦gpg-agent启动运行，它将会在第一次提示你输入密码时缓存你的GPG密码。随后你运行Mutt多次，你将不会被提示要GPG密码（gpg-agent一直开着，缓存就不会过期）。

![](https://c1.staticflickr.com/1/664/22809928093_3be57698ce_c.jpg)

### 结论 ###

在这个指导里，我提出一个方法加密Mutt敏感配置如SMTP/IMAP密码使用GnuPG。注意，如果你想在Mutt上使用GnuPG或者登陆你的邮件信息，你可以参考[官方指南][2]在使用GPG与Mutt结合。

如果你知道任何使用Mutt的安全技巧，随时分享他。

--------------------------------------------------------------------------------

via: http://xmodulo.com/mutt-email-client-encrypted-passwords.html

作者：[Dan Nanni][a]
译者：[wyangsun](https://github.com/wyangsun)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/gmail-command-line-linux-alpine.html
[2]:http://dev.mutt.org/trac/wiki/MuttGuide/UseGPG
