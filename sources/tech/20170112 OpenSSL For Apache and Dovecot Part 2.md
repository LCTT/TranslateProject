translating---geekpi

OpenSSL For Apache and Dovecot: Part 2
============================================================

 ![OpenSSL](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/key-openssl_0.jpg?itok=FDO3qAOt "OpenSSL") 
In this tutorial, Carla Schroder explains how to protect your Postfix/Dovecot mail server with OpenSSL.[Creative Commons Zero][1]Pixabay

[Last week][11], as part of our meandering OpenSSL series, we learned how to configure Apache to use OpenSSL and to force all sessions to use HTTPS. Today, we'll protect our Postfix/Dovecot mail server with OpenSSL. The examples build on the previous tutorials; see the Resources section at the end for links to all previous tutorials in this series.

You will have to configure both Postfix and Dovecot to use OpenSSL, and we'll use the key and certificate that we created in [OpenSSL For Apache and Dovecot ][12].

### Postfix Configuration

You must edit `/etc/postfix/main.cf` and `/etc/postfix/master.cf`. The `main.cf`example is the complete configuration, building on our previous tutorials. Substitute your own OpenSSL key and certificate names, and local network:

```
compatibility_level=2
smtpd_banner = $myhostname ESMTP $mail_name (Ubuntu/GNU)
biff = no
append_dot_mydomain = no

myhostname = localhost
alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases
myorigin = $myhostname
mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128 192.168.0.0/24
mailbox_size_limit = 0
recipient_delimiter = +
inet_interfaces = all

virtual_mailbox_domains = /etc/postfix/vhosts.txt
virtual_mailbox_base = /home/vmail
virtual_mailbox_maps = hash:/etc/postfix/vmaps.txt
virtual_minimum_uid = 1000
virtual_uid_maps = static:5000
virtual_gid_maps = static:5000
virtual_transport = lmtp:unix:private/dovecot-lmtp

smtpd_tls_cert_file=/etc/ssl/certs/test-com.pem
smtpd_tls_key_file=/etc/ssl/private/test-com.key
smtpd_use_tls=yes

smtpd_sasl_auth_enable = yes
smtpd_sasl_type = dovecot
smtpd_sasl_path = private/auth
smtpd_sasl_authenticated_header = yes
```

In `master.cf` un-comment the following lines in the `submission inet` section, and edit `smtpd_recipient_restrictions` as shown:

```
#submission inet n  -  y  -  - smtpd
  -o syslog_name=postfix/submission
  -o smtpd_tls_security_level=encrypt
  -o smtpd_sasl_auth_enable=yes
  -o milter_macro_daemon_name=ORIGINATING
  -o smtpd_recipient_restrictions=permit_mynetworks,permit_sasl_authenticated,reject
  -o smtpd_tls_wrappermode=no
```

Reload Postfix and you're finished:

```
$ sudo service postfix reload
```

### Dovecot Configuration

In our previous tutorials we made a single configuration file for Dovecot, `/etc/dovecot/dovecot.conf`, rather than using the default giant herd of multiple configuration files. This is a complete configuration that builds on our previous tutorials. Again, use your own OpenSSL key and certificate, and your own `userdb` home file:

```
protocols = imap pop3 lmtp
log_path = /var/log/dovecot.log
info_log_path = /var/log/dovecot-info.log
disable_plaintext_auth = no
mail_location = maildir:~/.Mail
pop3_uidl_format = %g
auth_mechanisms = plain

passdb {
  driver = passwd-file
  args = /etc/dovecot/passwd
}

userdb {
  driver = static
  args = uid=vmail gid=vmail home=/home/vmail/studio/%u
}

service lmtp {
 unix_listener /var/spool/postfix/private/dovecot-lmtp {
   group = postfix
   mode = 0600
   user = postfix
  }
}

protocol lmtp {
  postmaster_address = postmaster@studio
}

service lmtp {
  user = vmail
}

service auth {
  unix_listener /var/spool/postfix/private/auth {
    mode = 0660
        user=postfix
        group=postfix
  }
 }

ssl=required
ssl_cert = </etc/ssl/certs/test-com.pem
ssl_key = </etc/ssl/private/test-com.key
```

Restart Dovecot:

```
$ sudo service postfix reload
```

### Testing With Telnet

Now we can test our setup by sending a message with telnet, just like we did before. But wait, you say, telnet does not support TLS/SSL, so how can this be so? By opening an encrypted session with `openssl s_client` first is how. The `openssl s_client` output will display your certificate, fingerprint, and a ton of other information so you'll know that your server is using the correct certificate. Commands that you type after the session is established are in bold:

```
$ openssl s_client -starttls smtp -connect studio:25
CONNECTED(00000003)
[masses of output snipped]
    Verify return code: 0 (ok)
---
250 SMTPUTF8
EHLO studio
250-localhost
250-PIPELINING
250-SIZE 10240000
250-VRFY
250-ETRN
250-AUTH PLAIN
250-ENHANCEDSTATUSCODES
250-8BITMIME
250-DSN
250 SMTPUTF8
mail from: <carla@domain.com>
250 2.1.0 Ok
rcpt to: <alrac@studio>
250 2.1.5 Ok
data
354 End data with .subject: TLS/SSL test
Hello, we are testing TLS/SSL. Looking good so far.
.
250 2.0.0 Ok: queued as B9B529FE59
quit
221 2.0.0 Bye
```

You should see a new message in your mail client, and it will ask you to verify your SSL certificate when you open it. You may also use `openssl s_client`to test your Dovecot POP3 and IMAP services. This example tests encrypted POP3, and message #5 is the one we created in telnet (above):

```
$ openssl s_client -connect studio:995
CONNECTED(00000003)
[masses of output snipped]
    Verify return code: 0 (ok)
---
+OK Dovecot ready
user alrac@studio 
+OK
pass password
+OK Logged in.
list
+OK 5 messages:
1 499
2 504
3 514
4 513
5 565
.
retr 5
+OK 565 octets
Return-Path: <carla@domain.com>
Delivered-To: alrac@studio
Received: from localhost
        by studio.alrac.net (Dovecot) with LMTP id y8G5C8aablgKIQAAYelYQA
        for <alrac@studio>; Thu, 05 Jan 2017 11:13:10 -0800
Received: from studio (localhost [127.0.0.1])
        by localhost (Postfix) with ESMTPS id B9B529FE59
        for <alrac@studio>; Thu,  5 Jan 2017 11:12:13 -0800 (PST)
subject: TLS/SSL test
Message-Id: <20170105191240.B9B529FE59@localhost>
Date: Thu,  5 Jan 2017 11:12:13 -0800 (PST)
From: carla@domain.com

Hello, we are testing TLS/SSL. Looking good so far.
.
quit
+OK Logging out.
closed
```

### Now What?

Now you have a nice functioning mail server with proper TLS/SSL protection. I encourage you to study Postfix and Dovecot in-depth; the examples in these tutorials are as simple as I could make them, and don't include fine-tuning for security, anti-virus scanners, spam filters, or any other advanced functionality. I think it's easier to learn the advanced features when you have a basic working system to use.

Come back next week for an openSUSE package management cheat sheet.

### Resources

*   [OpenSSL For Apache and Dovecot][3]
*   [How to Build an Email Server on Ubuntu Linux][4]
*   [Building an Email Server on Ubuntu Linux, Part 2][5]
*   [Building an Email Server on Ubuntu Linux, Part 3][6]
*   [Apache on Ubuntu Linux For Beginners][7]
*   [Apache on Ubuntu Linux For Beginners: Part 2][8]
*   [Apache on CentOS Linux For Beginners][9]
*   [Quieting Scary Web Browser SSL Alerts][10]

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/openssl-apache-and-dovecot-part-2

作者：[CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/key-openssljpg-0
[3]:https://www.linux.com/learn/sysadmin/openssl-apache-and-dovecot
[4]:https://www.linux.com/learn/how-build-email-server-ubuntu-linux
[5]:https://www.linux.com/learn/sysadmin/building-email-server-ubuntu-linux-part-2
[6]:https://www.linux.com/learn/sysadmin/building-email-server-ubuntu-linux-part-3
[7]:https://www.linux.com/learn/apache-ubuntu-linux-beginners
[8]:https://www.linux.com/learn/apache-ubuntu-linux-beginners-part-2
[9]:https://www.linux.com/learn/apache-centos-linux-beginners
[10]:https://www.linux.com/learn/quieting-scary-web-browser-ssl-alerts
[11]:https://www.linux.com/learn/sysadmin/openssl-apache-and-dovecot
[12]:https://www.linux.com/learn/sysadmin/openssl-apache-and-dovecot
