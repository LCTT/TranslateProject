translating---geekpi

Building an Email Server on Ubuntu Linux, Part 3
============================================================

### [mail-server.jpg][2]

 ![Mail server](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/mail-server.jpg?itok=Ox1SCDsV "Mail server") 
In the final part of this tutorial series, we go into detail on how to set up virtual users and mailboxes in Dovecot and Postfix.[Creative Commons Zero][1]pixabay

Welcome back, me hearty Linux syadmins! In [part 1][3] and [part 2][4] of this series, we learned to how to put Postfix and Dovecot together to make a nice IMAP and POP3 mail server. Now we will learn to make virtual users so that we can manage all of our users in Dovecot.

### Sorry, No SSL. Yet.

I know I promised to show you how to set up a proper SSL-protected server. Unfortunately, I underestimated how large that topic is. So, I will realio trulio write a comprehensive how-to by next month.

For today, in this final part of this series, we'll go into detail on how to set up virtual users and mailboxes in Dovecot and Postfix. It's a bit weird to wrap your mind around, so the following examples are as simple as I can make them. We'll use plain flat files and plain-text authentication. You have the options of using database back ends and nice strong forms of encrypted authentication; see the links at the end for more information on these.

### Virtual Users

You want virtual users on your email server and not Linux system users. Using Linux system users does not scale, and it exposes their logins, and your Linux server, to unnecessary risk. Setting up virtual users requires editing configuration files in both Postfix and Dovecot. We'll start with Postfix. First, we'll start with a clean, simplified `/etc/postfix/main.cf`. Move your original `main.cf` out of the way and create a new clean one with these contents:

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
virtual_transport = lmtp:unix:private/dovecot-lmtp0
```

You may copy this exactly, except for the `192.168.0.0/24` parameter for `mynetworks`, as this should reflect your own local subnet.

Next, create the user and group `vmail`, which will own your virtual mailboxes. The virtual mailboxes are stored in `vmail's` home directory.

```

$ sudo groupadd -g 5000 vmail
$ sudo useradd -m -u 5000 -g 5000 -s /bin/bash vmail
```

Then reload the Postfix configurations:

```

$ sudo postfix reload
[sudo] password for carla: 
postfix/postfix-script: refreshing the Postfix mail system
```

### Dovecot Virtual Users

We'll use Dovecot's `lmtp` protocol to connect it to Postfix. You probably need to install it:

```

$ sudo apt-get install dovecot-lmtpd
```

The last line in our example `main.cf` references `lmtp`. Copy this example `/etc/dovecot/dovecot.conf`, replacing your existing file. Again, we are using just this single file, rather than calling the files in `/etc/dovecot/conf.d`.

```

protocols = imap pop3 lmtp
log_path = /var/log/dovecot.log
info_log_path = /var/log/dovecot-info.log
ssl = no
disable_plaintext_auth = no
mail_location = maildir:~/.Mail
pop3_uidl_format = %g
auth_verbose = yes
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
```

At last, you can create the file that holds your users and passwords, `/etc/dovecot/passwd`. For simple plain text authorization we need only our users' full email addresses and passwords:

```

alrac@studio:{PLAIN}password
layla@studio:{PLAIN}password
fred@studio:{PLAIN}password
molly@studio:{PLAIN}password
benny@studio:{PLAIN}password
```

The Dovecot virtual users are independent of the Postfix virtual users, so you will manage your users in Dovecot. Save all of your changes and restart Postfix and Dovecot:

```

$ sudo service postfix restart
$ sudo service dovecot restart
```

Now let's use good old telnet to see if Dovecot is set up correctly.

```

$ telnet studio 110
Trying 127.0.1.1...
Connected to studio.
Escape character is '^]'.
+OK Dovecot ready.
user molly@studio
+OK
pass password
+OK Logged in.
quit
+OK Logging out.
Connection closed by foreign host.
```

So far so good! Now let's send some test messages to our users with the `mail` command. Make sure to use the whole user's email address and not just the username.

```

$ mail benny@studio
Subject: hello and welcome!
Please enjoy your new mail account!
.
```

The period on the last line sends your message. Let's see if it landed in the correct mailbox.

```

$ sudo ls -al /home/vmail/studio/benny@studio/.Mail/new
total 16
drwx------ 2 vmail vmail 4096 Dec 14 12:39 .
drwx------ 5 vmail vmail 4096 Dec 14 12:39 ..
-rw------- 1 vmail vmail  525 Dec 14 12:39 1481747995.M696591P5790.studio,S=525,W=540
```

And there it is. It is a plain text file that we can read:

```
$ less 1481747995.M696591P5790.studio,S=525,W=540
Return-Path: <carla@localhost>
Delivered-To: benny@studio
Received: from localhost
        by studio (Dovecot) with LMTP id V01ZKRuuUVieFgAABiesew
        for <benny@studio>; Wed, 14 Dec 2016 12:39:55 -0800
Received: by localhost (Postfix, from userid 1000)
        id 9FD9CA1F58; Wed, 14 Dec 2016 12:39:55 -0800 (PST)
Date: Wed, 14 Dec 2016 12:39:55 -0800
To: benny@studio
Subject: hello and welcome!
User-Agent: s-nail v14.8.6
Message-Id: <20161214203955.9FD9CA1F58@localhost>
From: carla@localhost (carla)

Please enjoy your new mail account!
```

You could also use telnet for testing, as in the previous segments of this series, and set up accounts in your favorite mail client, such as Thunderbird, Claws-Mail, or KMail.

### Troubleshooting

When things don't work, check your logfiles (see the configuration examples), and run `journalctl -xe`. This should give you all the information you need to spot typos, uninstalled packages, and nice search terms for Google.

### What Next?

Assuming your LAN name services are correctly configured, you now have a nice usable LAN mail server. Obviously, sending messages in plain text is not optimal, and an absolute no-no for Internet mail. See [Dovecot SSL configuration][5] and [Postfix TLS Support][6]. [VirtualUserFlatFilesPostfix][7] covers TLS and database back ends. And watch for my upcoming SSL how-to. Really.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/sysadmin/building-email-server-ubuntu-linux-part-3

作者：[ CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/mail-serverjpg
[3]:https://www.linux.com/learn/how-build-email-server-ubuntu-linux
[4]:https://www.linux.com/learn/sysadmin/building-email-server-ubuntu-linux-part-2
[5]:http://wiki.dovecot.org/SSL/DovecotConfiguration
[6]:http://www.postfix.org/TLS_README.html
[7]:http://www.postfix.org/TLS_README.html
