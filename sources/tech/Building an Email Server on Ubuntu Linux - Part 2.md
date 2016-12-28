Building an Email Server on Ubuntu Linux, Part 2
============================================================

### [dovecot-email.jpg][4]

 ![Dovecot email](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/dovecot-email.jpg?itok=tY4veggw "Dovecot email") 
Part 2 in this tutorial shows how to use Dovecot to move messages off your Postfix server and into your users' email inboxes.[Creative Commons Zero][2]Pixabay

In [part 1][5], we installed and tested the Postfix SMTP server. Postfix, or any SMTP server, isn't a complete mail server because all it does is move messages between SMTP servers. We need Dovecot to move messages off your Postfix server and into your users' email inboxes.

Dovecot supports the two standard mail protocols, IMAP (Internet Message Access Protocol) and POP3 (Post Office Protocol). An IMAP server retains all messages on the server. Your users have the option to download messages to their computers or access them only on the server. IMAP is convenient for users who have multiple machines. It's more work for you because you have to ensure that your server is always available, and IMAP servers require a lot of storage and memory.

POP3 is an older protocol. A POP3 server can serve many more users than an IMAP server because messages are downloaded to your users' computers. Most mail clients have the option to leave messages on the server for a certain number of days, so POP3 can behave somewhat like IMAP. But it's not IMAP, and when you do this messages are often downloaded multiple times or deleted unexpectedly.

### Install Dovecot

Fire up your trusty Ubuntu system and install Dovecot:

```

$ sudo apt-get install dovecot-imapd dovecot-pop3d
```

It installs with a working configuration and automatically starts after installation, which you can confirm with `ps ax | grep dovecot`:

```

$ ps ax | grep dovecot
15988 ?  Ss 0:00 /usr/sbin/dovecot
15990 ?  S  0:00 dovecot/anvil
15991 ?  S  0:00 dovecot/log
```

Open your main Postfix configuration file, `/etc/postfix/main.cf`, and make sure it is configured for maildirs and not mbox mail stores; mbox is single giant file for each user, while maildir gives each message its own file. Lots of little files are more stable and easier to manage than giant bloaty files. Add these two lines; the second line tells Postfix you want maildir format, and to create a `.Mail` directory for every user in their home directories. You can name this directory anything you want, it doesn't have to be `.Mail`:

```

mail_spool_directory = /var/mail
home_mailbox = .Mail/
```

Now tweak your Dovecot configuration. First rename the original `dovecot.conf` file to get it out of the way, because it calls a host of `conf.d` files and it is better to keep things simple while you're learning:

```

$ sudo mv /etc/dovecot/dovecot.conf /etc/dovecot/dovecot-oldconf
```

Now create a clean new `/etc/dovecot/dovecot.conf` with these contents:

```

disable_plaintext_auth = no
mail_location = maildir:~/.Mail
namespace inbox {
  inbox = yes
  mailbox Drafts {
    special_use = \Drafts
  }
  mailbox Sent {
    special_use = \Sent
  }
  mailbox Trash {
    special_use = \Trash
  }
}
passdb {
  driver = pam
}
protocols = " imap pop3"
ssl = no
userdb {
  driver = passwd
}
```

Note that `mail_location = maildir` must match the `home_mailbox` parameter in `main.cf`. Save your changes and reload both Postfix and Dovecot's configurations:

```

$ sudo postfix reload
$ sudo dovecot reload
```

### Fast Way to Dump Configurations

Use these commands to quickly review your Postfix and Dovecot configurations:

```

$ postconf -n
$ doveconf -n
```

### Test Dovecot

Now let's put telnet to work again, and send ourselves a test message. The lines in bold are the commands that you type. `studio` is my server's hostname, so of course you must use your own:

```

$ telnet studio 25
Trying 127.0.1.1...
Connected to studio.
Escape character is '^]'.
220 studio.router ESMTP Postfix (Ubuntu)
EHLO studio
250-studio.router
250-PIPELINING
250-SIZE 10240000
250-VRFY
250-ETRN
250-STARTTLS
250-ENHANCEDSTATUSCODES
250-8BITMIME
250-DSN
250 SMTPUTF8
mail from: tester@test.net
250 2.1.0 Ok
rcpt to: carla@studio
250 2.1.5 Ok
data
354 End data with .Date: November 25, 2016
From: tester
Message-ID: first-test
Subject: mail server test
Hi carla,
Are you reading this? Let me know if you didn't get this.
.
250 2.0.0 Ok: queued as 0C261A1F0F
quit
221 2.0.0 Bye                                                                   
Connection closed by foreign host.
```

Now query Dovecot to fetch your new message. Log in using your Linux username and password:

```

$ telnet studio 110                                            
Trying 127.0.0.1...                                                             
Connected to studio.                                                         
Escape character is '^]'.                                                       
+OK Dovecot ready.                                                              
user carla
+OK
pass password
+OK Logged in.
stat
+OK 2 809
list
+OK 2 messages:
1 383
2 426
.
retr 2
+OK 426 octets
Return-Path: <tester@test.net>
X-Original-To: carla@studio
Delivered-To: carla@studio
Received: from studio (localhost [127.0.0.1])
        by studio.router (Postfix) with ESMTP id 0C261A1F0F
        for <carla@studio>; Wed, 30 Nov 2016 17:18:57 -0800 (PST)
Date: November 25, 2016
From: tester@studio.router
Message-ID: first-test
Subject: mail server test

Hi carla,
Are you reading this? Let me know if you didn't get this.
.
quit
+OK Logging out.
Connection closed by foreign host.
```

Take a moment to compare the message entered in the first example, and the message received in the second example. It is easy to spoof the return address and date, but Postfix is not fooled. Most mail clients default to displaying a minimal set of headers, but you need to read the full headers to see the true backtrace.

You can also read your messages by looking in your `~/Mail/cur` directory. They are plain text. Mine has two test messages:

```

$ ls .Mail/cur/
1480540325.V806I28e0229M351743.studio:2,S
1480555224.V806I28e000eM41463.studio:2,S
```

### Testing IMAP

Our Dovecot configuration enables both POP3 and IMAP, so let's use telnet to test IMAP.

```

$ telnet studio imap2   
Trying 127.0.1.1...
Connected to studio.
Escape character is '^]'.
* OK [CAPABILITY IMAP4rev1 LITERAL+ SASL-IR LOGIN-REFERRALS 
ID ENABLE IDLE AUTH=PLAIN] Dovecot ready.
A1 LOGIN carla password
A1 OK [CAPABILITY IMAP4rev1 LITERAL+ SASL-IR LOGIN-REFERRALS 
ID ENABLE IDLE SORT SORT=DISPLAY THREAD=REFERENCES THREAD=REFS 
THREAD=ORDEREDSUBJECT MULTIAPPEND URL-PARTIAL CATENATE UNSELECT 
CHILDREN NAMESPACE UIDPLUS LIST-EXTENDED I18NLEVEL=1 CONDSTORE 
QRESYNC ESEARCH ESORT SEARCHRES WITHIN CONTEXT=SEARCH LIST-STATUS 
BINARY MOVE SPECIAL-USE] Logged in
A2 LIST "" "*"
* LIST (\HasNoChildren) "." INBOX
A2 OK List completed (0.000 + 0.000 secs).
A3 EXAMINE INBOX
* FLAGS (\Answered \Flagged \Deleted \Seen \Draft)
* OK [PERMANENTFLAGS ()] Read-only mailbox.
* 2 EXISTS
* 0 RECENT
* OK [UIDVALIDITY 1480539462] UIDs valid
* OK [UIDNEXT 3] Predicted next UID
* OK [HIGHESTMODSEQ 1] Highest
A3 OK [READ-ONLY] Examine completed (0.000 + 0.000 secs).
A4 logout
* BYE Logging out
A4 OK Logout completed.
Connection closed by foreign host
```

### Thunderbird Mail Client

This screenshot in Figure 1 shows what my messages look like in a graphical mail client on another host on my LAN.

### [thunderbird-mail.png][3]

 ![thunderbird mail](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/thunderbird-mail.png?itok=IkWK5Ti_ "thunderbird mail") 

Figure 1: Thunderbird mail.[Used with permission][1]

At this point, you have a working IMAP and POP3 mail server, and you know how to test your server. Your users will choose which protocol they want to use when they set up their mail clients. If you want to support only one mail protocol, then name just the one in your Dovecot configuration.

However, you are far from finished. This is a very simple, wide-open setup with no encryption. It also works only for users on the same system as your mail server. This is not scalable and has some security risks, such as no protection for passwords. Come back [next week ][6]to learn how to create mail users that are separate from system users, and how to add encryption.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/sysadmin/building-email-server-ubuntu-linux-part-2

作者：[ CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/thunderbird-mailpng
[4]:https://www.linux.com/files/images/dovecot-emailjpg
[5]:https://www.linux.com/learn/how-build-email-server-ubuntu-linux
[6]:https://www.linux.com/learn/sysadmin/building-email-server-ubuntu-linux-part-3
