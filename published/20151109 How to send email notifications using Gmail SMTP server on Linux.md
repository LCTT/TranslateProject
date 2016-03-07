如何在 Linux 上使用 Gmail SMTP 服务器发送邮件通知
================================================================================
假定你想配置一个 Linux 应用，用于从你的服务器或桌面客户端发送邮件信息。邮件信息可能是邮件简报、状态更新（如 [Cachet][1]）、监控警报（如 [Monit][2]）、磁盘时间（如 [RAID mdadm][3]）等等。当你要建立自己的 [邮件发送服务器][4] 传递信息时 ，你可以替代使用一个免费的公共 SMTP 服务器，从而避免遭受维护之苦。

谷歌的 Gmail 服务就是最可靠的 **免费 SMTP 服务器** 之一。想要从应用中发送邮件通知，你仅需在应用中添加 Gmail 的 SMTP 服务器地址和你的身份凭证即可。

使用 Gmail 的 SMTP 服务器会遇到一些限制，这些限制主要用于阻止那些经常滥用服务器来发送垃圾邮件和使用邮件营销的家伙。举个例子，你一次只能给至多 100 个地址发送信息，并且一天不能超过 500 个收件人。同样，如果你不想被标为垃圾邮件发送者，你就不能发送过多的不可投递的邮件。当你达到任何一个限制，你的 Gmail 账户将被暂时的锁定一天。简而言之，Gmail 的 SMTP 服务器对于你个人的使用是非常棒的，但不适合商业的批量邮件。

说了这么多，是时候向你们展示 **如何在 Linux 环境下使用 Gmail 的 SMTP 服务器** 了。

### Google Gmail SMTP 服务器设置 ###

如果你想要通过你的应用使用 Gmail 的 SMTP 服务器发送邮件，请牢记接下来的详细说明。

- **邮件发送服务器 （SMTP 服务器）**: smtp.gmail.com
- **使用认证**: 是
- **使用安全连接**: 是
- **用户名**: 你的 Gmail 账户 ID （比如 "alice" ，如果你的邮箱为 alice@gmail.com）
- **密码**: 你的 Gmail 密码
- **端口**: 587

确切的配置根据应用会有所不同。在本教程的剩余部分，我将向你展示一些在 Linux 上使用 Gmail SMTP 服务器的应用示例。

### 从命令行发送邮件 ###

作为第一个例子，让我们尝试最基本的邮件功能：使用 Gmail SMTP 服务器从命令行发送一封邮件。为此，我将使用一个称为 mutt 的命令行邮件客户端。

先安装 mutt：

对于 Debian-based 系统：

    $ sudo apt-get install mutt

对于 Red Hat based 系统：

    $ sudo yum install mutt

创建一个 mutt 配置文件（~/.muttrc），并和下面一样，在文件中指定 Gmail SMTP 服务器信息。将 \<gmail-id> 替换成自己的 Gmail ID。注意该配置只是为了发送邮件而已（而非接收邮件）。

    $ vi ~/.muttrc

----------

    set from = "<gmail-id>@gmail.com"
    set realname = "Dan Nanni"
    set smtp_url = "smtp://<gmail-id>@smtp.gmail.com:587/"
    set smtp_pass = "<gmail-password>"

一切就绪，使用 mutt 发送一封邮件：

    $ echo "This is an email body." | mutt -s "This is an email subject" alice@yahoo.com

想在一封邮件中添加附件，使用 "-a" 选项

    $ echo "This is an email body." | mutt -s "This is an email subject" alice@yahoo.com -a ~/test_attachment.jpg

![](https://c1.staticflickr.com/1/770/22239850784_5fb0988075_c.jpg)

使用 Gmail SMTP 服务器意味着邮件将显示是从你 Gmail 账户发出的。换句话说，收件人将视你的 Gmail 地址为发件人地址。如果你想要使用自己的域名作为邮件发送方，你需要使用 Gmail SMTP 转发服务。

### 当服务器重启时发送邮件通知 ###

如果你在 [虚拟专用服务器（VPS）][5] 上跑了些重要的网站，建议监控 VPS 的重启行为。作为一个更为实用的例子，让我们研究如何在你的 VPS 上为每一次重启事件建立邮件通知。这里假设你的 VPS 上使用的是 systemd，并向你展示如何为自动邮件通知创建一个自定义的 systemd 启动服务。

首先创建下面的脚本 reboot_notify.sh，用于负责邮件通知。

    $ sudo vi /usr/local/bin/reboot_notify.sh

----------

    #!/bin/sh
    
    echo "`hostname` was rebooted on `date`" | mutt -F /etc/muttrc -s "Notification on `hostname`" alice@yahoo.com

----------

    $ sudo chmod +x /usr/local/bin/reboot_notify.sh

在这个脚本中，我使用 "-F" 选项，用于指定系统级的 mutt 配置文件位置。因此不要忘了创建 /etc/muttrc 文件，并如前面描述的那样填入 Gmail SMTP 信息。

现在让我们创建如下一个自定义的 systemd 服务。

    $ sudo mkdir -p /usr/local/lib/systemd/system
    $ sudo vi /usr/local/lib/systemd/system/reboot-task.service

----------

    [Unit]
    Description=Send a notification email when the server gets rebooted
    DefaultDependencies=no
    Before=reboot.target
     
    [Service]
    Type=oneshot
    ExecStart=/usr/local/bin/reboot_notify.sh
     
    [Install]
    WantedBy=reboot.target

在创建服务后，添加并启动该服务。

    $ sudo systemctl enable reboot-task
    $ sudo systemctl start reboot-task

从现在起，在每次 VPS 重启时，你将会收到一封通知邮件。

![](https://c1.staticflickr.com/1/608/22241452923_2ace9cde2e_c.jpg)

### 通过服务器使用监控发送邮件通知 ###

作为最后一个例子，让我展示一个现实生活中的应用程序，[Monit][6]，这是一款极其有用的服务器监控应用程序。它带有全面的 [VPS][7] 监控能力（比如 CPU、内存、进程、文件系统）和邮件通知功能。

如果你想要接收 VPS 上由 Monit 产生的任何事件的邮件通知，你可以在 Monit 配置文件中添加以下 SMTP 信息。

    set mailserver smtp.gmail.com port 587
        username "<your-gmail-ID>" password "<gmail-password>"
        using tlsv12
     
    set mail-format {
     from: <your-gmail-ID>@gmail.com
     subject: $SERVICE $EVENT at $DATE on $HOST
     message: Monit $ACTION $SERVICE $EVENT at $DATE on $HOST : $DESCRIPTION.
     
           Yours sincerely,
              Monit
      }
     
    # the person who will receive notification emails
    set alert alice@yahoo.com

这是一个因为 CPU 负载超载而由 Monit 发送的邮件通知的例子。

![](https://c1.staticflickr.com/1/566/22873764251_8fe66bfd16_c.jpg)

### 总结 ###

如你所见，类似 Gmail 这样免费的 SMTP 服务器有着这么多不同的运用方式 。但再次重申，请牢记免费的 SMTP 服务器不适用于商业用途，仅仅适用于个人项目。无论你正在哪款应用中使用 Gmail SMTP 服务器，欢迎自由分享你的用例。

--------------------------------------------------------------------------------

via: http://xmodulo.com/send-email-notifications-gmail-smtp-server-linux.html

作者：[Dan Nanni][a]
译者：[cposture](https://github.com/cposture)
校对：[martin2011qi](https://github.com/martin2011qi), [wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/setup-system-status-page.html
[2]:http://xmodulo.com/server-monitoring-system-monit.html
[3]:http://xmodulo.com/create-software-raid1-array-mdadm-linux.html
[4]:http://xmodulo.com/mail-server-ubuntu-debian.html
[5]:http://xmodulo.com/go/digitalocean
[6]:http://xmodulo.com/server-monitoring-system-monit.html
[7]:http://xmodulo.com/go/digitalocean
