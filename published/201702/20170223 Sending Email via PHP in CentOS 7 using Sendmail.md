在 CentOS 7 中使用 Sendmail 通过 PHP 发送邮件
============================================================

![sendmail logo](http://fasterland.net/wp-content/uploads/2017/02/sendmail-logo-750x450.png) 

如果你运行了一个 web 服务器或者一台 VPS ，你可能需要在你的 PHP 程序中发送邮件。

同样，如果你正在运行一个 WordPress 博客，或者你正在使用任何类型的 CMS ，你允许你的访问者通过联系表单向你发送电子邮件（例如使用 WordPress 的*[Contact Form 7][3] 插件），你可能需要安装一个名为 [sendmail][4] 的简单的程序到你的 web 服务器上。

> Sendmail 是一个通用的互联网电子邮件投递工具，支持多种邮件传输和传递方法，包括用于通过 Internet 进行电子邮件传输的简单邮件传输协议（SMTP）。[来自 Wikipedia][5]。

Sendmail 可以通过你的发行版的软件包管理器安装。

以下是在 CentOS 7 上安装 Sendmail 的说明。

### 安装

要在 CentOS 7 中安装 CentOS 7 ，运行下面的命令：

```
# yum install sendmail
```

### 允许服务器可以发送邮件

如果在 CentOS 7 中使用了 SELinux， 你需要使用下面的命令允许 sendmail 发送邮件：

```
# setsebool -P httpd_can_sendmail=on
```

### 使用 PHP 发送一封测试邮件

使用这个命令进入 php 交互 shell 中：

``` 
php -a
```


在交互 shell 中，粘贴下面的代码：

```
mail ('user@receiver.com', "Test email", "Test email from the Internet", null, "-f user@sender.com");
```

不要忘记将 `user@receiver.com` 和 `user@sender.com` 分别替换为你的收件地址和发件地址。

### 浏览 sendmail 日志

要监控邮件日志，你可以使用这个命令：

```
tail /var/log/maillog
```


在服务器上安装 sendmail 完成后，你可以允许你的用户通过联系栏通过邮件联系你了。

--------------------------------------------------------------------------------

via: http://fasterland.net/sending-email-via-php-centos-7-using-sendmail.html

作者：[Francesco Mondello][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://fasterland.net/
[1]:http://fasterland.net/author/faster3ck
[2]:http://fasterland.net/
[3]:https://wordpress.org/plugins/contact-form-7/
[4]:http://www.sendmail.com/sm/open_source/
[5]:https://en.wikipedia.org/wiki/Sendmail
[6]:http://fasterland.net/category/server-admin
