[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to install and Configure Postfix Mail Server on CentOS 8)
[#]: via: (https://www.linuxtechi.com/install-configure-postfix-mailserver-centos-8/)
[#]: author: (James Kiarie https://www.linuxtechi.com/author/james/)

How to install and Configure Postfix Mail Server on CentOS 8
======

**Postfix** is a free and opensource **MTA** (Mail Transfer Agent) used for routing or delivering emails on a Linux system. In this guide, you will learn how to install and configure Postfix on CentOS 8.

[![Install-configure-Postfx-Server-CentOS8][1]][2]

Lab set up:

  * OS :                  CentOS 8 server
  * IP Address :   192.168.1.13
  * Hostname:     server1.crazytechgeek.info (Ensure the domain name is pointed to the server’s IP)



### Step 1) Update the system

The first step is to ensure that the system packages are up to date. To do so, update the system as follows:

```
# dnf update
```

Before proceeding further, also ensure that no other **MTAs** such as **Sendmail** are existing as this will cause conflict with Postfix configuration. To remove Sendmail, for example, run the command:

```
# dnf remove sendmail
```

### Step 2)  Set Hostname and update /etc/hosts file

Use below hostnamectl command to set the hostname on your system,

```
# hostnamectl set-hostname server1.crazytechgeek.info
# exec bash
```

Additionally, you need to add the system’s hostname and IP entries in the /etc/hosts file

```
# vim /etc/hosts
192.168.1.13   server1.crazytechgeek.info
```

Save and exit the file.

### Step 3) Install Postfix Mail Server

After verifying that no other MTA is running on the system install Postfix by executing the command:

```
# dnf install postfix
```

[![Install-Postfix-Centos8][1]][3]

### Step 4) Start and enable Postfix Service

Upon successful installation of Postfix, start and enable Postfix service by running:

```
# systemctl start postfix
# systemctl enable postfix
```

To check Postfix status, run the following systemctl command

```
# systemctl status postfix
```

![Start-Postfix-check-status-centos8][1]

Great, we have verified that Postfix is up and running. Next, we are going to configure Postfix to send emails locally to our server.

### Step 5) Install mailx email client

Before configuring the Postfix server, we need to install mailx feature, To install mailx, run the command:

```
# dnf install mailx
```

![Install-Mailx-CentOS8][1]

### Step 6)  Configure Postfix Mail Server

Postfix’s configuration file is located in **/etc/postfix/main.cf**. We need to make a few changes in the configuration file, so open it using your favorite text editor.

```
# vi /etc/postfix/main.cf
```

Make changes to the following lines:

```
myhostname = server1.crazytechgeek.info
mydomain = crazytechgeek.info
myorigin = $mydomain
## Uncomment and Set inet_interfaces to all ##
inet_interfaces = all
## Change to all ##
inet_protocols = all
## Comment ##
#mydestination = $myhostname, localhost.$mydomain, localhost
##- Uncomment ##
mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
## Uncomment and add IP range ##
mynetworks = 192.168.1.0/24, 127.0.0.0/8
## Uncomment ##
home_mailbox = Maildir/
```

Once done, save and exit the configuration file. Restart postfix  service for the changes to take effect

```
# systemctl restart postfix
```

### Step 7) Testing  Postfix Mail Server

Test whether our configuration is working, first, create a test user

```
# useradd postfixuser
# passwd postfixuser
```

Next, run the command below to send email from **pkumar** local user to another user ‘**postfixuser**‘

```
# telnet localhost smtp
or
# telnet localhost 25
```

If telnet service is not installed, you can install it using the command:

```
# dnf install telnet -y
```

When you run the command as earlier indicated, you should get the output as shown

```
[root@linuxtechi ~]# telnet localhost 25
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
220 server1.crazytechgeek.info ESMTP Postfix
```

Above confirm that connectivity to postfix mail server is working fine. Next, type the command:

```
# ehlo localhost
```

Output will be something like this

```
250-server1.crazytechgeek.info
250-PIPELINING
250-SIZE 10240000
250-VRFY
250-ETRN
250-STARTTLS
250-ENHANCEDSTATUSCODES
250-8BITMIME
250-DSN
250 SMTPUTF8
```

Next, run the commands highlighted in orange, like “mail from”, “rcpt to”, data and then finally type quit,

```
mail from:<pkumar>
250 2.1.0 Ok
rcpt to:<postfixuser>
250 2.1.5 Ok
data
354 End data with <CR><LF>.<CR><LF>
Hello, Welcome to my mailserver (Postfix)
.
250 2.0.0 Ok: queued as B56BF1189BEC
quit
221 2.0.0 Bye
Connection closed by foreign host
```

Complete telnet command to send email from local user “**pkumar**” to another local user “**postfixuser**” would be something like below

![Send-email-with-telnet-centos8][1]

If everything went according to plan, you should be able to view the email sent at the new user’s home directory.

```
# ls /home/postfixuser/Maildir/new
1573580091.Vfd02I20050b8M635437.server1.crazytechgeek.info
#
```

To read the email, simply use the cat command as follows:

```
# cat /home/postfixuser/Maildir/new/1573580091.Vfd02I20050b8M635437.server1.crazytechgeek.info
```

![Read-postfix-email-linux][1]

### Postfix mail server logs

Postfix mail server mail logs are stored in the file “**/var/log/maillog**“, use below command to view the live logs,

```
# tail -f /var/log/maillog
```

![postfix-maillogs-centos8][1]

### Securing Postfix Mail Server

It is always recommended secure the communication of between clients and postfix server, this can be achieved using SSL certificates, these certificates can be either from trusted authority or Self Signed Certificates. In this tutorial we will generate Self Signed certificated for postfix using **openssl** command,

I am assuming openssl is already installed on your system, in case it is not installed then use following dnf command,

```
# dnf install openssl -y
```

Generate Private key and CSR (Certificate Signing Request) using beneath openssl command,

```
# openssl req -nodes -newkey rsa:2048 -keyout mail.key -out mail.csr
```

![Postfix-Key-CSR-CentOS8][1]

Now Generate Self signed certificate using following openssl command,

```
# openssl x509 -req -days 365 -in mail.csr -signkey mail.key -out mail.crt
Signature ok
subject=C = IN, ST = New Delhi, L = New Delhi, O = IT, OU = IT, CN = server1.crazytechgeek.info, emailAddress = root@linuxtechi
Getting Private key
#
```

Now copy private key and certificate file to /etc/postfix directory

```
# cp mail.key mail.crt /etc/postfix
```

Update Private key and Certificate file’s path in postfix configuration file,

```
# vi /etc/postfix/main.cf
………
smtpd_use_tls = yes
smtpd_tls_cert_file = /etc/postfix/mail.crt
smtpd_tls_key_file = /etc/postfix/mail.key
smtpd_tls_security_level = may
………
```

Restart postfix service to make above changes into the effect.

```
# systemctl restart postfix
```

Let’s try to send email to internal local domain and external domain using mailx client.

**Sending local internal email from pkumar user to postfixuser**

```
# echo "test email" | mailx -s "Test email from Postfix MailServer" -r root@linuxtechi root@linuxtechi
```

Check and read the email using the following,

```
# cd /home/postfixuser/Maildir/new/
# ll
total 8
-rw-------. 1 postfixuser postfixuser 476 Nov 12 17:34 1573580091.Vfd02I20050b8M635437.server1.crazytechgeek.info
-rw-------. 1 postfixuser postfixuser 612 Nov 13 02:40 1573612845.Vfd02I20050bbM466643.server1.crazytechgeek.info
# cat 1573612845.Vfd02I20050bbM466643.server1.crazytechgeek.info
```

![Read-Postfixuser-Email-CentOS8][1]

**Sending email from postfixuser to external domain ( [root@linuxtechi][4])**

```
# echo "External Test email" | mailx -s "Postfix MailServer" -r root@linuxtechi root@linuxtechi
```

**Note:** If Your IP is not blacklisted anywhere then your email to external domain will be delivered otherwise it will be bounced saying that IP is blacklisted in so and so spamhaus database.

### Check Postfix mail queue

Use mailq command to list mails which are in queue.

```
# mailq
Mail queue is empty
#
```

And that’s it! Our Postfix configuration is working! That’s all for now. We hope you found this tutorial insightful and that you can comfortably set up your local Postfix server.

  * [Facebook][5]
  * [Twitter][6]
  * [LinkedIn][7]
  * [Reddit][8]



--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-configure-postfix-mailserver-centos-8/

作者：[James Kiarie][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/james/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Install-configure-Postfx-Server-CentOS8.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Install-Postfix-Centos8.png
[4]: https://www.linuxtechi.com/cdn-cgi/l/email-protection
[5]: http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-configure-postfix-mailserver-centos-8%2F&t=How%20to%20install%20and%20Configure%20Postfix%20Mail%20Server%20on%20CentOS%208
[6]: http://twitter.com/share?text=How%20to%20install%20and%20Configure%20Postfix%20Mail%20Server%20on%20CentOS%208&url=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-configure-postfix-mailserver-centos-8%2F&via=Linuxtechi
[7]: http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-configure-postfix-mailserver-centos-8%2F&title=How%20to%20install%20and%20Configure%20Postfix%20Mail%20Server%20on%20CentOS%208
[8]: http://www.reddit.com/submit?url=https%3A%2F%2Fwww.linuxtechi.com%2Finstall-configure-postfix-mailserver-centos-8%2F&title=How%20to%20install%20and%20Configure%20Postfix%20Mail%20Server%20on%20CentOS%208
