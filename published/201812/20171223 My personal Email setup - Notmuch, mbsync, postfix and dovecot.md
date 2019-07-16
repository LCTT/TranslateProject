我的个人电子邮件系统设置：notmuch、mbsync、Postfix 和 dovecot
======

我使用个人电子邮件系统已经相当长的时间了，但是一直没有记录过文档。最近我换了我的笔记本电脑（职业变更导致的变动），我在试图重新创建本地邮件系统时迷茫了。所以这篇文章是一个给自己看的文档，这样我就不用费劲就能再次搭建出来。

### 服务器端

我运行自己的邮件服务器，并使用 Postfix 作为 SMTP 服务器，用 Dovecot 实现 IMAP。我不打算详细介绍如何配置这些设置，因为我的设置主要是通过使用 Jonas 为 Redpill 基础架构创建的脚本完成的。什么是 Redpill？（用 Jonas 自己的话说）：

> \<jonas> Redpill 是一个概念：一种设置 Debian hosts 去跨组织协作的方式
> 
> \<jonas> 我发展了这个概念，并将其首次用于 Redpill 网中网：redpill.dk，其中涉及到了我自己的网络（jones.dk），我的主要客户的网络（homebase.dk），一个包括 Skolelinux Germany（free-owl.de）的在德国的网络，和 Vasudev 的网络（copyninja.info）

除此之外， 我还有一个 dovecot sieve 过滤，根据邮件的来源，对邮件进行高级分类，将其放到各种文件夹中。所有的规则都存在于每个有邮件地址的账户下的 `~/dovecot.sieve` 文件中。

再次，我不会详细介绍如何设置这些东西，因为这不是我这个帖子的目标。

### 在我的笔记本电脑上

在我的笔记本电脑上，我已经按照 4 个部分设置

  1. 邮件同步：使用 `mbsync` 命令完成
  2. 分类：使用 notmuch 完成
  3. 阅读：使用 notmuch-emacs 完成
  4. 邮件发送：使用作为中继服务器和 SMTP 客户端运行的 Postfix 完成。

### 邮件同步

邮件同步是使用 `mbsync` 工具完成的， 我以前是 OfflineIMAP 的用户，最近切换到 `mbsync`，因为我觉得它比 OfflineIMAP 的配置更轻量、更简单。该命令是由 isync 包提供的。

配置文件是 `~/.mbsyncrc`。下面是我的例子与一些个人设置。

```
IMAPAccount  copyninja
Host imap.copyninja.info
User vasudev
PassCmd      "gpg -q --for-your-eyes-only --no-tty --exit-on-status-write-error --batch --passphrase-file ~/path/to/passphrase.txt -d ~/path/to/mailpass.gpg"
SSLType IMAPS
SSLVersion TLSv1.2
CertificateFile /etc/ssl/certs/ca-certificates.crt


IMAPAccount gmail-kamathvasudev
Host imap.gmail.com
User kamathvasudev@gmail.com
PassCmd "gpg -q --for-your-eyes-only --no-tty --exit-on-status-write-error --batch --passphrase-file ~/path/to/passphrase.txt -d ~/path/to/mailpass.gpg"
SSLType IMAPS
SSLVersion TLSv1.2
CertificateFile /etc/ssl/certs/ca-certificates.crt

IMAPStore copyninja-remote
Account copyninja

IMAPStore gmail-kamathvasudev-remote
Account gmail-kamathvasudev

MaildirStore copyninja-local
Path ~/Mail/vasudev-copyninja.info/
Inbox ~/Mail/vasudev-copyninja.info/INBOX

MaildirStore gmail-kamathvasudev-local
Path ~/Mail/Gmail-1/
Inbox ~/Mail/Gmail-1/INBOX

Channel copyninja
Master :copyninja-remote:
Slave :copyninja-local:
Patterns *
Create Both
SyncState *
Sync All

Channel gmail-kamathvasudev
Master :gmail-kamathvasudev-remote:
Slave :gmail-kamathvasudev-local:
# Exclude everything under the internal [Gmail] folder, except the interesting folders
Patterns * ![Gmail]*
Create Both
SyncState *
Sync All
```

对上述配置中的一些有趣部分进行一下说明。一个是 PassCmd，它允许你提供 shell 命令来获取帐户的密码。这样可以避免在配置文件中填写密码。我使用 gpg 的对称加密，并在我的磁盘上存储密码。这当然是由 Unix ACL 保护安全的。

实际上，我想使用我的公钥来加密文件，但当脚本在后台或通过 systemd 运行时，解锁文件看起来很困难 （或者说几乎不可能）。如果你有更好的建议，我洗耳恭听:-)。

下一个指令部分是 Patterns。这使你可以有选择地同步来自邮件服务器的邮件。这对我来说真的很有帮助，可以排除所有的 “[Gmail]/ folders” 垃圾目录。

### 邮件分类

一旦邮件到达你的本地设备，我们需要一种方法来轻松地在邮件读取器中读取邮件。我最初的设置使用本地 dovecot 实例提供同步的 Maildir，并在 Gnus 中阅读。这种设置相比于设置所有的服务器软件是有点大题小作，但 Gnus 无法很好地应付 Maildir 格式，这是最好的方法。这个设置也有一个缺点，那就是在你快速搜索邮件时，要搜索大量邮件。而这就是 notmuch 的用武之地。

notmuch 允许我轻松索引上千兆字节的邮件档案而找到我需要的东西。我已经创建了一个小脚本，它结合了执行 `mbsync` 和 `notmuch`。我使用 dovecot sieve 来基于实际上创建在服务器端的 Maildirs 标记邮件。下面是我的完整 shell 脚本，它执行同步分类和删除垃圾邮件的任务。

```
#!/bin/sh

MBSYNC=$(pgrep mbsync)
NOTMUCH=$(pgrep notmuch)

if [ -n "$MBSYNC" -o -n "$NOTMUCH" ]; then
   echo "Already running one instance of mail-sync. Exiting..."
         exit 0
fi

echo "Deleting messages tagged as *deleted*"
notmuch search --format=text0 --output=files tag:deleted |xargs -0 --no-run-if-empty rm -v

echo "Moving spam to Spam folder"
notmuch search --format=text0 --output=files tag:Spam and \
  to:vasudev@copyninja.info | \
    xargs -0 -I {} --no-run-if-empty mv -v {} ~/Mail/vasudev-copyninja.info/Spam/cur
notmuch search --format=text0 --output=files tag:Spam and
  to:vasudev-debian@copyninja.info | \
     xargs -0 -I {} --no-run-if-empty mv -v {} ~/Mail/vasudev-copyninja.info/Spam/cur


MDIR="vasudev-copyninja.info vasudev-debian Gmail-1"
mbsync -Va
notmuch new

for mdir in $MDIR; do
    echo "Processing $mdir"
    for fdir in $(ls -d /home/vasudev/Mail/$mdir/*); do
      if [ $(basename $fdir) != "INBOX" ]; then
          echo "Tagging for $(basename $fdir)"
          notmuch tag +$(basename $fdir) -inbox -- folder:$mdir/$(basename $fdir)
      fi
    done
done
```

因此，在运行 `mbsync` 之前，我搜索所有标记为“deleted”的邮件，并将其从系统中删除。接下来，我在我的帐户上查找标记为“Spam”的邮件，并将其移动到“Spam”文件夹。你没看错，这些邮件逃脱了垃圾邮件过滤器进入到我的收件箱，并被我亲自标记为垃圾邮件。

运行 `mbsync` 后，我基于它们的文件夹标记邮件（搜索字符串 `folder:`）。这让我可以很容易地得到一个邮件列表的内容，而不需要记住列表地址。

### 阅读邮件

现在，我们已经实现同步和分类邮件，是时候来设置阅读部分。我使用 notmuch-emacs 界面来阅读邮件。我使用 emacs 的 Spacemacs 风格，所以我花了一些时间写了一个私有层，它将我所有的快捷键和分类集中在一个地方，而不会扰乱我的整个 `.spacemacs` 文件。你可以在 [notmuch-emacs-layer 仓库][1] 找到我的私有层的代码。

### 发送邮件

能阅读邮件这还不够，我们也需要能够回复邮件。而这是最近是我感到迷茫的一个略显棘手的部分，以至于不得不写这篇文章，这样我就不会再忘记了。（当然也不必在网络上参考一些过时的帖子。）

我的系统发送邮件使用 Postfix 作为 SMTP 客户端，使用我自己的 SMTP 服务器作为它的中继主机。中继的问题是，它不能是具有动态 IP 的主机。有两种方法可以允许具有动态 IP 的主机使用中继服务器， 一种是将邮件来源的 IP 地址放入 `my_network` 或第二个使用 SASL 身份验证。

我的首选方法是使用 SASL 身份验证。为此，我首先要为每台机器创建一个单独的账户，它将把邮件中继到我的主服务器上。想法是不使用我的主帐户 SASL 进行身份验证。（最初我使用的是主账户，但 Jonas 给出了可行的按账户的想法）

```
adduser <hostname>_relay
```

这里替换 `<hostname>` 为你的笔记本电脑的名称或任何你正在使用的设备。现在我们需要调整 Postfix 作为中继服务器。因此，在 Postfix 配置中添加以下行：

```
# SASL authentication
smtp_sasl_auth_enable = yes
smtp_tls_security_level = encrypt
smtp_sasl_tls_security_options = noanonymous
relayhost = [smtp.copyninja.info]:submission
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
```

因此， 这里的 `relayhost` 是用于将邮件转发到互联网的 Postfix 实例的服务器名称。`submission` 的部分 Postfix 将邮件转发到端口 587（安全端口）。`smtp_sasl_tls_security_options` 设置为不允许匿名连接。这是必须的，以便中继服务器信任你的移动主机，并同意为你转发邮件。

`/etc/postfix/sasl_passwd` 是你需要存储用于服务器 SASL 身份验证的帐户密码的文件。将以下内容放入其中。

```
[smtp.example.com]:submission user:password
```

用你已放入 `relayhost` 配置的 SMTP 服务器名称替换 `smtp.example.com`。用你创建的 `<hostname>_relay` 用户及其密码替换 `user` 和 `passwd`。

若要保护 `sasl_passwd` 文件，并为 Postfix 创建它的哈希文件，使用以下命令。

```
chown root:root /etc/postfix/sasl_passwd
chmod 0600 /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd
```

最后一条命令将创建 `/etc/postfix/sasl_passwd.db` 文件，它是你的文件的 `/etc/postfix/sasl_passwd` 的哈希文件，具有相同的所有者和权限。现在重新加载 Postfix，并使用 `mail` 命令检查邮件是否从你的系统中发出。

### Bonus 的部分

好吧，因为我有一个脚本创建以上结合了邮件的同步和分类。我继续创建了一个 systemd 计时器，以定期同步后台的邮件。就我而言，每 10 分钟一次。下面是 `mailsync.timer` 文件。

```
[Unit]
Description=Check Mail Every 10 minutes
RefuseManualStart=no
RefuseManualStop=no

[Timer]
Persistent=false
OnBootSec=5min
OnUnitActiveSec=10min
Unit=mailsync.service

[Install]
WantedBy=default.target
```

下面是 mailsync.service 服务，这是 mailsync.timer 执行我们的脚本所需要的。

```
[Unit]
Description=Check Mail
RefuseManualStart=no
RefuseManualStop=yes

[Service]
Type=oneshot
ExecStart=/usr/local/bin/mail-sync
StandardOutput=syslog
StandardError=syslog
```

将这些文件置于 `/etc/systemd/user` 目录下并运行以下代码去开启它们：

```
systemctl enable --user mailsync.timer
systemctl enable --user mailsync.service
systemctl start --user mailsync.timer
```

这就是我从系统同步和发送邮件的方式。我从 Jonas Smedegaard 那里了解到了 afew，他审阅了这篇帖子。因此， 下一步， 我将尝试使用 afew 改进我的 notmuch 配置，当然还会有一个后续的帖子:-)。

--------------------------------------------------------------------------------

via: https://copyninja.info/blog/email_setup.html

作者：[copyninja][a]
译者：[lixinyuxx](https://github.com/lixinyuxx)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://copyninja.info
[1]:https://source.copyninja.info/notmuch-emacs-layer.git/
