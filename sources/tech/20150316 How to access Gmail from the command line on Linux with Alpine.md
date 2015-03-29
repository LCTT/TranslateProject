FSSlc translating

How to access Gmail from the command line on Linux with Alpine
================================================================================
If you are a command-line lover, I am sure that you welcome with open arms any tool that allows you to perform at least one of your daily tasks using that powerful work environment, e.g., from [scheduling appointments][1] and [managing finances][2] to accessing [Facebook][3] and [Twitter][4].

In this post I will show you yet another pretty neat use case of Linux command-line: **accessing Google's Gmail service**. To do so, we are going to use Alpine, a versatile ncurses-based, command-line email client (not to be confused with Alpine Linux). We will configure Gmail's IMAP and SMTP settings in Alpine to receive and send email messages via Google mail servers in a terminal environment. At the end of this tutorial, you will realize that it will only take a few minimum steps to use any other mail servers in Alpine.

Granted there are already outstanding GUI-based email clients such as Thunderbird, Evolution or even web interface. So why would anyone be interested in using a command-line email client to access Gmail? The answer is simple. You need to get something done quickly and want to avoid using system resources unnecessarily. Or you are accessing a minimal headless server that does not have the X server installed. Or the X server on your desktop crashed, and you need to send emails urgently before fixing it. In all these situations Alpine can come in handy and get you going in no time.

Beyond simple editing, sending and receiving of text-based email messages, Alpine is able to encrypt, decrypt, and digitally sign email messages, and integrate seamlessly with TLS.

### Installing Alpine on Linux ###

In Red Hat-based distributions, install Alpine as follows. Note that on RHEL/CentOS, you need to enable [EPEL repository][5] first.

    # yum install alpine 

In Debian, Ubuntu or their derivatives, you will do:

    # aptitude install alpine

After the installation is complete, you can launch the email client by running:

    # alpine

The first time you run alpine, it will create a mail directory for the current user inside his/her home directory (~/mail), and bring up the main interface, as shown in the following screencast. 

注：youtube视频，发布的时候做个链接吧
<iframe width="615" height="346" frameborder="0" allowfullscreen="" src="http://www.youtube.com/embed/kuKiv3uze4U?feature=oembed"></iframe>

The user interface has the following sections:

![](https://farm9.staticflickr.com/8724/16618079590_6c236ce2c2_c.jpg)

Feel free to browse around a bit in order to become acquainted with Alpine. You can always return to the command prompt by hitting the 'Q' key any time. Note that all screens have context-related help available at the bottom of the screen.

Before proceeding further, we will create a default configuration file for Alpine. In order to do so, quit Alpine, and execute the following command from the command line:

    # alpine -conf > /etc/pine.conf 

### Configuring Alpine to Use a Gmail Account ###

Once you have installed Alpine and spent at least a few minutes to feel comfortable with its interface and menus, it's time to actually configure it to use an existing Gmail account.

Before following these steps in Alpine, remember to enable IMAP in your Gmail settings from the webmail interface. Once IMAP access is enabled in your Gmail account, proceed to the following steps to enable reading Gmail messages on Alpine.

First, launch Alpine.

Press 'S' for Setup, and then 'L' for collection lists to define groups of folders to help you better organize your mail:

![](https://farm8.staticflickr.com/7614/16779579656_690eda419c_o.png)

Add a new folder by pressing 'A' and fill the required information:

- **Nickname**: whatever name of your choice.
- **Server**: imap.gmail.com/ssl/user=yourgmailusername@gmail.com 

You may leave Path and View blank.

Then press Ctrl+X and enter your password when prompted:

![](https://farm9.staticflickr.com/8611/16618079640_6f7dca336a_b.jpg)

If everything goes as expected, there should be a new folder named after the nickname that you chose earlier. You should find your Gmail mailboxes there:

![](https://farm8.staticflickr.com/7598/16804355052_10c1a6c5bd_b.jpg)

For verification, you can compare the contents of your Alpine's "Gmail Sent" mailbox with those of the web client:

![](https://farm8.staticflickr.com/7602/16619323939_d2eab3e162_c.jpg)

By default new mail checking/notification occurs automatically every 150 seconds. You can change this value, along with many others, in the /etc/pine.conf file. This configuration file is heavily commented for clarity. To set the desired mail check interval to 10 seconds, for example, you will need to do:

    # The approximate number of seconds between checks for new mail
    mail-check-interval=10

Finally, we need to configure an SMTP server to send email messages via Alpine. Go back to the Alpine's setup screen as explained earlier, and press 'C' to set the address of a Google's SMTP server. You will need to edit the value of the SMTP Server (for sending) line as follows:

    smtp.gmail.com:587/tls/user=yourgmailusername@gmail.com

You will be prompted to save changes when you press 'E' to exit setup. Once you save the changes, you are on your way to sending emails through Alpine! To do that, just go to Compose in the main menu, and start enjoying your Gmail account from the command line.

### Conclusion ###

In this post we have discussed how to access Gmail in a terminal environment via a lightweight and powerful command-line email client called Alpine. Alpine is free software released under the Apache Software License 2.0, which is a software license compatible with the GPL. Alpine takes pride in being friendly for new users, yet powerful for seasoned system administrators at the same time. I hope that after reading this article you have come to realize how true that last statement is.

Feel free to leave your comments or questions using the form below. I look forward to hearing from you!

--------------------------------------------------------------------------------

via: http://xmodulo.com/gmail-command-line-linux-alpine.html

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://xmodulo.com/schedule-appointments-todo-tasks-linux-terminal.html
[2]:http://xmodulo.com/manage-personal-expenses-command-line.html
[3]:http://xmodulo.com/access-facebook-command-line-linux.html
[4]:http://xmodulo.com/access-twitter-command-line-linux.html
[5]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
