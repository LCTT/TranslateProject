如何在Linux上使用Gmail SMTP服务器发送邮件通知
================================================================================
假定你想配置一个Linux app从你的服务器或桌面客户端发送邮件信息。邮件信息可以是邮件简报、状态更新(比如[Cachet][1])、监控警报(比如[Monit][2])、磁盘时间(比如[RAID mdadm][3])等等的一部分。当你要建立自己的[邮件发送服务器][4]，作为一个免维护的选择，你可以依赖一个免费可用的公共SMTP服务器。

最可靠的**免费SMTP服务器**之一来自谷歌的Gmail服务。为了在你的app里发送邮件通知，你仅需在app中添加Gmail的SMTP服务器地址和你的凭证即可。

Gmail的SMTP服务器吸引人的地方之一是有各种各样恰当的限制，这些限制主要用于阻止那些经常滥用服务器的滥发垃圾邮件者和邮件营销者。举个例子，你一次只能给至多100个地址发送信息，并且一天不能超过500个接收者。当你达到任何一个限制，你的Gmail账户将暂时锁一天。简而言之，Gmail的SMTP服务器对于你个人的使用是非常棒的，但不适合商业的批量邮件。

话虽如此，让我们展示**如何在Linux环境下使用Gmail的SMTP服务器**。

### Google Gmail SMTP服务器设置 ###

如果你想要使用Gmail的SMTP服务器从你的app发送邮件，请牢记接下来的详细说明。

- **邮件发送服务器 (SMTP服务器)**: smtp.gmail.com
- **使用认证**: 是
- **使用安全连接**: 是
- **用户名**: 你的Gmail账户ID (比如 "alice" 如果你的邮箱为alice@gmail.com)
- **密码**: 你的Gmail密码
- **端口**: 587

确切的配置语法可能要依据app而不同。在本教程的剩下部分，我将会向你展示各种在Linux上使用Gmail SMTP服务器的有用示例。

### 从命令行发送邮件 ###

作为第一个例子，让我们尝试最基本的邮件功能：使用Gmail SMTP服务器从命令行发送一封邮件。为此，我将使用一个称为mutt的命令行邮件客户端。

先安装mutt：

对于 Debian-based 系统：

    $ sudo apt-get install mutt

对于 Red Hat based 系统：

    $ sudo yum install mutt

创建一个mutt配置文件(~/.muttrc)，并和下面一样，在文件中指定Gmail SMTP服务器信息。将gmail-id替换成自己的Gmail ID。注意这配置只是为了发送邮件而已（而非接收邮件）。

    $ vi ~/.muttrc

----------

    set from = "<gmail-id>@gmail.com"
    set realname = "Dan Nanni"
    set smtp_url = "smtp://<gmail-id>@smtp.gmail.com:587/"
    set smtp_pass = "<gmail-password>"

现在准备使用mutt发送一封邮件：

    $ echo "This is an email body." | mutt -s "This is an email subject" alice@yahoo.com

为了在一封邮件中添加一个附件，使用"-a"选项

    $ echo "This is an email body." | mutt -s "This is an email subject" alice@yahoo.com -a ~/test_attachment.jpg

![](https://c1.staticflickr.com/1/770/22239850784_5fb0988075_c.jpg)

使用Gmail SMTP服务器意味着邮件显示为从你的Gmail账户发出。换句话说，一个接收者将你的Gmail地址视为发送者地址。如果你想要使用自己的域名作为邮件发送者，你需要使用Gmail SMTP转发服务。

### 当服务器重启时发送邮件通知 ###

如果你为了一些重要的网站正在运行一台[虚拟专用服务器(VPS)][5]，一个建议是监视VPS的重启活动。作为一个更实用的例子，让我们研究如何在你的VPS上为每一次重启事件建立邮件通知。这里我假设你正在你的VPS上使用systemd，并向你展示如何为自动邮件通知创建一个自定义的systemd启动服务。

首先创建下面的脚本reboot_notify.sh，用于负责邮件通知。

    $ sudo vi /usr/local/bin/reboot_notify.sh

----------

    #!/bin/sh
    
    echo "`hostname` was rebooted on `date`" | mutt -F /etc/muttrc -s "Notification on `hostname`" alice@yahoo.com

----------

    $ sudo chmod +x /usr/local/bin/reboot_notify.sh

在这个脚本中，我使用"-F"选项，用于直到系统级的mutt配置文件位置。因此不要忘了创建/etc/muttrc文件并如前面描述填入Gmail SMTP信息。

现在让我们创建如下一个自定义的systemd服务。

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

一旦创建服务，便使能和启动该服务。

    $ sudo systemctl enable reboot-task
    $ sudo systemctl start reboot-task

从现在起，在每次VPS重启时你将会收到一封通知邮件。

![](https://c1.staticflickr.com/1/608/22241452923_2ace9cde2e_c.jpg)

### 从服务器使用监控发送邮件通知 ###

作为最后一个例子，让我展示一个称为[Monit][6]的现实生活的应用程序，这是一个极其有用的服务器监控应用程序。它附有广泛的[VPS][7]监控能力（比如CPU、内存、进程、文件系统），包括邮件通知能力。

如果你想要接收VPS上任何事件导致的且由Monit产生的邮件通知，你可以在Monit配置文件中添加以下SMTP信息。

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

这是一个因为CPU负载超载而由Monit发送的邮件通知例子。

![](https://c1.staticflickr.com/1/566/22873764251_8fe66bfd16_c.jpg)

### 总结 ###

正如你能想象的，像Gmail一样，有许多中不同的方式使用免费的SMTP服务器。但再次说明，请牢记免费的SMTP服务器不适用于商业用途，仅仅适用于个人项目。如果你正在任一app中使用Gmail SMTP服务器，请自由分享你的用例。

--------------------------------------------------------------------------------

via: http://xmodulo.com/send-email-notifications-gmail-smtp-server-linux.html

作者：[Dan Nanni][a]
译者：[cposture](https://github.com/cposture)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/setup-system-status-page.html
[2]:http://xmodulo.com/server-monitoring-system-monit.html
[3]:http://xmodulo.com/create-software-raid1-array-mdadm-linux.html
[4]:http://xmodulo.com/mail-server-ubuntu-debian.html
[5]:http://xmodulo.com/go/digitalocean
[6]:http://xmodulo.com/server-monitoring-system-monit.html
[7]:http://xmodulo.com/go/digitalocean
