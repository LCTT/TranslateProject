Translating by KnightJoker
How to send email notifications using Gmail SMTP server on Linux
================================================================================
Suppose you want to configure a Linux app to send out email messages from your server or desktop. The email messages can be part of email newsletters, status updates (e.g., [Cachet][1]), monitoring alerts (e.g., [Monit][2]), disk events (e.g., [RAID mdadm][3]), and so on. While you can set up your [own outgoing mail server][4] to deliver messages, you can alternatively rely on a freely available public SMTP server as a maintenance-free option.

One of the most reliable **free SMTP servers** is from Google's Gmail service. All you have to do to send email notifications within your app is to add Gmail's SMTP server address and your credentials to the app, and you are good to go.

One catch with using Gmail's SMTP server is that there are various restrictions in place, mainly to combat spammers and email marketers who often abuse the server. For example, you can send messages to no more than 100 addresses at once, and no more than 500 recipients per day. Also, if you don't want to be flagged as a spammer, you cannot send a large number of undeliverable messages. When any of these limitations is reached, your Gmail account will temporarily be locked out for a day. In short, Gmail's SMTP server is perfectly fine for your personal use, but not meant for commercial bulk emails.

With that being said, let me demonstrate **how to use Gmail's SMTP server in Linux environment**.

### Google Gmail SMTP Server Setting ###

If you want to send emails from your app using Gmail's SMTP server, remember the following details.

- **Outgoing mail server (SMTP server)**: smtp.gmail.com
- **Use authentication**: yes
- **Use secure connection**: yes
- **Username**: your Gmail account ID (e.g., "alice" if your email is alice@gmail.com)
- **Password**: your Gmail password
- **Port**: 587

Exact configuration syntax may vary depending on apps. In the rest of this tutorial, I will show you several useful examples of using Gmail SMTP server in Linux.

### Send Emails from the Command Line ###

As the first example, let's try the most basic email functionality: send an email from the command line using Gmail SMTP server. For this, I am going to use a command-line email client called mutt.

First, install mutt:

For Debian-based system:

    $ sudo apt-get install mutt

For Red Hat based system:

    $ sudo yum install mutt

Create a mutt configuration file (~/.muttrc) and specify in the file Gmail SMTP server information as follows. Replace <gmail-id> with your own Gmail ID. Note that this configuration is for sending emails only (not receiving emails).

    $ vi ~/.muttrc

----------

    set from = "<gmail-id>@gmail.com"
    set realname = "Dan Nanni"
    set smtp_url = "smtp://<gmail-id>@smtp.gmail.com:587/"
    set smtp_pass = "<gmail-password>"

Now you are ready to send out an email using mutt:

    $ echo "This is an email body." | mutt -s "This is an email subject" alice@yahoo.com

To attach a file in an email, use "-a" option:

    $ echo "This is an email body." | mutt -s "This is an email subject" alice@yahoo.com -a ~/test_attachment.jpg

![](https://c1.staticflickr.com/1/770/22239850784_5fb0988075_c.jpg)

Using Gmail SMTP server means that the emails appear as sent from your Gmail account. In other words, a recepient will see your Gmail address as the sender's address. If you want to use your domain as the email sender, you need to use Gmail SMTP relay service instead.

### Send Email Notification When a Server is Rebooted ###

If you are running a [virtual private server (VPS)][5] for some critical website, one recommendation is to monitor VPS reboot activities. As a more practical example, let's consider how to set up email notifications for every reboot event on your VPS. Here I assume you are using systemd on your VPS, and show you how to create a custom systemd boot-time service for automatic email notifications.

First create the following script reboot_notify.sh which takes care of email notifications.

    $ sudo vi /usr/local/bin/reboot_notify.sh

----------

    #!/bin/sh
    
    echo "`hostname` was rebooted on `date`" | mutt -F /etc/muttrc -s "Notification on `hostname`" alice@yahoo.com

----------

    $ sudo chmod +x /usr/local/bin/reboot_notify.sh

In the script, I use "-F" option to specify the location of system-wide mutt configuration file. So don't forget to create /etc/muttrc file and populate Gmail SMTP information as described earlier.

Now let's create a custom systemd service as follows.

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

Once the service file is created, enable and start the service.

    $ sudo systemctl enable reboot-task
    $ sudo systemctl start reboot-task

From now on, you will be receiving a notification email every time the VPS gets rebooted.

![](https://c1.staticflickr.com/1/608/22241452923_2ace9cde2e_c.jpg)

### Send Email Notification from Server Usage Monitoring ###

As a final example, let me present a real-world application called [Monit][6], which is a pretty useful server monitoring application. It comes with comprehensive [VPS][7] monitoring capabilities (e.g., CPU, memory, processes, file system), as well as email notification functions.

If you want to receive email notifications for any event on your VPS (e.g., server overload) generated by Monit, you can add the following SMTP information to Monit configuration file.

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

Here is the example email notification sent by Monit for excessive CPU load.

![](https://c1.staticflickr.com/1/566/22873764251_8fe66bfd16_c.jpg)

### Conclusion ###

As you can imagine, there will be so many different ways to take advantage of free SMTP servers like Gmail. But once again, remember that the free SMTP server is not meant for commercial usage, but only for your own personal project. If you are using Gmail SMTP server inside any app, feel free to share your use case.

--------------------------------------------------------------------------------

via: http://xmodulo.com/send-email-notifications-gmail-smtp-server-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
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