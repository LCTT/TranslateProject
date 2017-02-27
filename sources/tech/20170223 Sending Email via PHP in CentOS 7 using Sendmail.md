translating---geekpi

Sending Email via PHP in CentOS 7 using Sendmail
============================================================

 ![sendmail logo](http://fasterland.net/wp-content/uploads/2017/02/sendmail-logo-750x450.png) 

If you are running a **web server** or a **VPS**, you may encounter the need of sending emails using your **PHP** application.

In the same way, if you are running a **WordPress** blog or you are using any kind of **CMS** and you would allow your visitors to send you emails using a Contact form (for example using the **[Contact Form 7][3]** plugin for **WordPress**) you may need to install a simple program into your web server called **[sendmail][4]**.

> «Sendmail is a general purpose internetwork email routing facility that supports many kinds of mail-transfer and delivery methods, including the Simple Mail Transfer Protocol (SMTP) used for email transport over the Internet.» [via Wikipedia][5].

**Sendmail** can be simply installed using the package manager of your distribution.

Here are the instructions for installing **Sendmail** on **CentOS 7**.

### Installation

In order to install **sendmail** on your **CentOS 7** server, run the following command:

```
# yum install sendmail
```

### Allowing your server to send emails

If you are using **SELinux** on your **CentOS 7** server, you have to allow **sendmail** to send emails using the following command:

```
# setsebool -P httpd_can_sendmail=on
```

### Send a test email using PHP

Enter the php interactive shell using this command:

``` 
php -a
```


In the interactive shell, paste the following line of code:

```
mail ('user@receiver.com', "Test email", "Test email from the Internet", null, "-f user@sender.com");
```

Don’t forget to replace **user@receiver.com** with the receiver email address and **user@sender.com** with the sender email address.

### Viewing the sendmail log

In order to monitor the mail log, you can use this command:

```
tail /var/log/maillog
```


Once **sendmail** is installed on your web server you can allow your users to contact you via email using a contact form. 


--------------------------------------------------------------------------------

via: http://fasterland.net/sending-email-via-php-centos-7-using-sendmail.html

作者：[Francesco Mondello][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://fasterland.net/
[1]:http://fasterland.net/author/faster3ck
[2]:http://fasterland.net/
[3]:https://wordpress.org/plugins/contact-form-7/
[4]:http://www.sendmail.com/sm/open_source/
[5]:https://en.wikipedia.org/wiki/Sendmail
[6]:http://fasterland.net/category/server-admin
