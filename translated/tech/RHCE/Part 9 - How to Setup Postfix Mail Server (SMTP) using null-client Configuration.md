第九部分 - 如果使用零客户端配置 Postfix 邮件服务器（SMTP）
================================================================================
尽管现在有很多在线联系方式，邮件仍然是一个人传递信息给远在世界尽头或办公室里坐在我们旁边的另一个人的有效方式。

下面的图描述了邮件从发送者发出直到信息到达接收者收件箱的传递过程。

![邮件如何工作](http://www.tecmint.com/wp-content/uploads/2015/09/How-Mail-Setup-Works.png)

邮件如何工作

要使这成为可能，背后发生了好多事情。为了使邮件信息从一个客户端应用程序（例如 [Thunderbird][1]、Outlook，或者网络邮件服务，例如 Gmail 或 Yahoo 邮件）到一个邮件服务器，并从其到目标服务器并最终到目标接收人，每个服务器上都必须有 SMTP（简单邮件传输协议）服务。

这就是为什么我们要在这篇博文中介绍如何在 RHEL 7 中设置 SMTP 服务器，从中本地用户发送的邮件（甚至发送到本地用户）被转发到一个中央邮件服务器以便于访问。

在实际需求中这称为零客户端安装。

在我们的测试环境中将包括一个原始邮件服务器和一个中央服务器或中继主机。

    原始邮件服务器： （主机名: box1.mydomain.com / IP: 192.168.0.18） 
    中央邮件服务器： （主机名: mail.mydomain.com / IP: 192.168.0.20）

为了域名解析我们在两台机器中都会使用有名的 /etc/hosts 文件：

    192.168.0.18    box1.mydomain.com       box1
    192.168.0.20    mail.mydomain.com       mail

### 安装 Postfix 和防火墙/SELinux 注意事项 ###

首先，我们需要（在两台机器上）：

**1. 安装 Postfix：**

    # yum update && yum install postfix

**2. 启动服务并启用开机自动启动：**

    # systemctl start postfix
    # systemctl enable postfix

**3. 允许邮件流量通过防火墙：**

    # firewall-cmd --permanent --add-service=smtp
    # firewall-cmd --add-service=smtp


![在防火墙中开通邮件服务器端口](http://www.tecmint.com/wp-content/uploads/2015/09/Allow-Traffic-through-Firewall.png)

在防火墙中开通邮件服务器端口

**4. 在 box1.mydomain.com 配置 Postfix**

Postfix 的主要配置文件是 /etc/postfix/main.cf。这个文件本身是一个很大的文本，因为其中包含的注释解析了程序设置的目的。

为了简洁，我们只显示了需要编辑的行（是的，在原始服务器中你需要保留 mydestination 为空；否则邮件会被保存到本地而不是我们实际想要的中央邮件服务器）：

**在 box1.mydomain.com 配置 Postfix**

----------

    myhostname = box1.mydomain.com
    mydomain = mydomain.com
    myorigin = $mydomain
    inet_interfaces = loopback-only
    mydestination =
    relayhost = 192.168.0.20

**5. 在 mail.mydomain.com 配置 Postfix**

** 在 mail.mydomain.com 配置 Postfix **

----------

    myhostname = mail.mydomain.com
    mydomain = mydomain.com
    myorigin = $mydomain
    inet_interfaces = all
    mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
    mynetworks = 192.168.0.0/24, 127.0.0.0/8

如果还没有设置，还要设置相关的 SELinux 布尔值永久为真：

    # setsebool -P allow_postfix_local_write_mail_spool on

![设置 Postfix SELinux 权限](http://www.tecmint.com/wp-content/uploads/2015/09/Set-Postfix-SELinux-Permission.png)

设置 Postfix SELinux 权限

上面的 SELinux 布尔值会允许 Postfix 在中央服务器写入邮件池。

**6. 在两台机子上重启服务以使更改生效：**

    # systemctl restart postfix

如果 Postfix 没有正确启动，你可以使用下面的命令进行错误处理。

    # systemctl –l status postfix
    # journalctl –xn
    # postconf –n

### 测试 Postfix 邮件服务 ###

为了测试邮件服务器，你可以使用任何邮件用户代理（最常见的简称为 MUA）例如 [mail 或 mutt][2]。

由于我个人喜欢 mutt，我会在 box1 中使用它发送邮件给用户 tecmint，并把现有文件（mailbody.txt）作为信息内容：

    # mutt -s "Part 9-RHCE series" tecmint@mydomain.com < mailbody.txt

![测试 Postfix 邮件服务器](http://www.tecmint.com/wp-content/uploads/2015/09/Test-Postfix-Mail-Server.png)

测试 Postfix 邮件服务器

现在到中央邮件服务器（mail.mydomain.com）以 tecmint 用户登录，并检查是否收到了邮件：

    # su – tecmint
    # mail

![检查 Postfix 邮件服务器发送](http://www.tecmint.com/wp-content/uploads/2015/09/Check-Postfix-Mail-Server-Delivery.png)

检查 Postfix 邮件服务器发送

如果没有收到邮件，检查 root 用户的邮件池查看警告或者错误提示。你也需要使用 [nmap 命令][3]确保两台服务器运行了 SMTP 服务，并在中央邮件服务器中 打开了 25 号端口：

    # nmap -PN 192.168.0.20

![Postfix 邮件服务器错误处理](http://www.tecmint.com/wp-content/uploads/2015/09/Troubleshoot-Postfix-Mail-Server.png)

Postfix 邮件服务器错误处理

### 总结 ###

像本文中展示的设置邮件服务器和中继主机是每个系统管理员必须拥有的重要技能，也代表了理解和安装更复杂情景的基础，例如一个邮件服务器托管有多个邮件账户（甚至成百上千）的域名。

（请注意这种类型的设置需要有 DNS 服务器，这不在本文的介绍范围），但你可以参照下面的文章设置 DNS 服务器：

- [在 CentOS/RHEL 07 上配置仅缓存的 DNS 服务器][4]

最后，我强烈建议你熟悉 Postfix 的配置文件（main.cf）和这个程序的帮助手册。如果有任何疑问，别犹豫，使用下面的评论框或者我们的论坛 Linuxsay.com 告诉我们吧，你会从世界各地的 Linux 高手中获得几乎及时的帮助。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/setup-postfix-mail-server-smtp-using-null-client-on-centos/

作者：[Gabriel Cánepa][a]
译者：[ictlyh](https//www.mutouxiaogui.cn/blog/)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/install-thunderbird-17-in-ubuntu-xubuntu-linux-mint/
[2]:http://www.tecmint.com/send-mail-from-command-line-using-mutt-command/
[3]:http://www.tecmint.com/nmap-command-examples/
[4]:http://www.tecmint.com/setup-dns-cache-server-in-centos-7/