[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 Ways to Send Email from the Linux Command Line)
[#]: via: (https://www.2daygeek.com/6-ways-to-send-email-from-the-linux-command-line/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

6 Ways to Send Email from the Linux Command Line
======

Sending email from the command line is required when you need to create emails from a shell script.

There are several commands on Linux to send emails from the Linux command line.

I’ve included the Top 6 Command Line Mail Clients in this tutorial.

You can use any one of the following to send email from the Linux command line.

This can be done using the following six commands.

  * mail
  * mailx
  * mutt
  * mpack
  * sendmail
  * ssmtp



### How does it work?

Let me give you an overall explanation of how the mail command delivers the mails to recipients on Linux.

The mail command compose emails and sends them to a local mail transfer agent (MTA), such as sendmail, postfix, and so on.

The mail server actually communicates with remote mail servers for sending and receiving emails.

The flow chart below can explain more about that.

[![][1]][2]

### 1) How to Install mail Command on Linux

The mail command is most popular command to send emails from Linux terminal.

The mail command can be installed from the distribution official repository as follows.

For **“Debian/Ubuntu”** systems, use **[APT-GET Command][3]** or **[APT Command][4]** to install mailutils.

```
$ sudo apt-get install mailutils
```

 For **“RHEL/CentOS”** systems, use **[YUM Command][5]** to install mailx.

```
$ sudo yum install mailx
```

For **“Fedora”** system, use the **[DNF Command][6]** to install mailx.

```
$ sudo dnf install mailx
```

### 1a) How to Use mail Command on Linux to Send a Mail

It’s straightforward and easy to use.

Use the following format to send mail using the mail command without an attachment.

```
$ echo "This is the mail body" | mail -s "Subject" [email protected]
```

Use the following format to send mail using the mail command with attachment.

```
$ echo "This is the mail body" | mail -a test1.txt -s "Subject" [email protected]
```

```
+---------+----------------------------------------------------+
| Options |                    Description                     |
+---------+----------------------------------------------------+
|   -a    | It's used for attachment on Red Hat based systems. |
|   -A    | It's used for attachment on Debian based systems.  |
|   -s    | Specify the subject of the message                 |
+--------------------------------------------------------------+
```

### 2) How to Install mutt Command on Linux

The mutt is another popular command to send emails from Linux terminal.

Mutt is a small but very powerful text based program for reading and sending electronic mail under unix operating systems, including support for color terminals, MIME, OpenPGP, and a threaded sorting mode.

The mail command can be installed from the distribution official repository as follows.

For **“Debian/Ubuntu”** systems, use **[APT-GET Command][3]** or **[APT Command][4]** to install mutt.

```
$ sudo apt-get install mutt
```

 For **“RHEL/CentOS”** systems, use **[YUM Command][5]** to install mutt.

```
$ sudo yum install mutt
```

For **“Fedora”** system, use the **[DNF Command][6]** to install mutt.

```
$ sudo dnf install mutt
```

### 2b) How to Use mutt Command on Linux to Send a Mail

This is also straightforward and easy to use.

Use the following format to send mail using the mutt command without an attachment.

```
$ echo "This is the mail body" | mutt -s "Subject" [email protected]
```

Use the following format to send mail using the mutt command with attachment.

```
$ echo "This is the mail body" | mutt -s "Subject" [email protected] -a test1.txt
```

### 3) How to Install mpack Command on Linux

The mpack is another popular command to send emails from Linux terminal.

The mpack program encodes the the named file in one or more MIME messages. The resulting messages are mailed to one or more recipients.

The mpack command can be installed from the distribution official repository as follows.

For **“Debian/Ubuntu”** systems, use **[APT-GET Command][3]** or **[APT Command][4]** to install mpack.

```
$ sudo apt-get install mpack
```

 For **“RHEL/CentOS”** systems, use **[YUM Command][5]** to install mpack.

```
$ sudo yum install mpack
```

For **“Fedora”** system, use the **[DNF Command][6]** to install mpack.

```
$ sudo dnf install mpack
```

### 3a) How to Use mpack Command on Linux to Send a Mail

This is also straight forward and easy to use.

Use the following format to send mail using the mpack command without an attachment.

```
$ echo "This is the mail body" | mpack -s "Subject" [email protected]
```

Use the following format to send mail using the mpack command with attachment.

```
$ echo "This is the mail body" | mpack -s "Subject" [email protected] -a test1.txt
```

### 4) How to Install mail Command on Linux

Mailx is the newer version of mail command.

It is based on Berkeley Mail 8.1, is intended to provide the functionality of the POSIX mailx command, and offers extensions for MIME, IMAP, POP3, SMTP, and S/MIME.

Mailx provides enhanced features for interactive use, such as caching message threading, scoring, and filtering.

The mailx command can be installed from the distribution official repository as follows.

For **“Debian/Ubuntu”** systems, use **[APT-GET Command][3]** or **[APT Command][4]** to install mailutils.

```
$ sudo apt-get install mailutils
```

 For **“RHEL/CentOS”** systems, use **[YUM Command][5]** to install mailx.

```
$ sudo yum install mailx
```

For **“Fedora”** system, use the **[DNF Command][6]** to install mailx.

```
$ sudo dnf install mailx
```

### 4a) How to Use mailx Command on Linux to Send a Mail

It’s straight forward and easy to use.

Use the following format to send mail using the mailx command without an attachment.

```
$ echo "This is the mail body" | mail -s "Subject" [email protected]
```

Use the following format to send mail using the mailx command with attachment.

```
$ echo "This is the mail body" | mail -a test1.txt -s "Subject" [email protected]
```

### 5) How to Install sendmail Command on Linux

Sendmail is a most popular and general purpose SMTP server used in most of Linux distribution.

Also, it allows you to sending email from command line.

The sendmail command can be installed from the distribution official repository as follows.

For **“Debian/Ubuntu”** systems, use **[APT-GET Command][3]** or **[APT Command][4]** to install sendmail.

```
$ sudo apt-get install sendmail
```

 For **“RHEL/CentOS”** systems, use **[YUM Command][5]** to install sendmail.

```
$ sudo yum install sendmail
```

For **“Fedora”** system, use the **[DNF Command][6]** to install sendmail.

```
$ sudo dnf install sendmail
```

### 5a) How to Use sendmail Command on Linux to Send a Mail

It’s straight forward and easy to use.

Use the following format to send mail using the sendmail command.

```
$ echo -e "Subject: Test Mail\nThis is the mail body" > /tmp/send-mail.txt
```

```
$ sendmail [email protected] < send-mail.txt
```

### 6) How to Install ssmtp Command on Linux

ssmtp is a send-only sendmail emulator for machines which delivers email from a local computer to a configured mailhost (mailhub).

SSMTP allows users to transfer emails through an SMTP server from the Linux command line.

The sendmail command can be installed from the distribution official repository as follows.

For **“Debian/Ubuntu”** systems, use **[APT-GET Command][3]** or **[APT Command][4]** to install ssmtp.

```
$ sudo apt-get install ssmtp
```

 For **“RHEL/CentOS”** systems, use **[YUM Command][5]** to install ssmtp.

```
$ sudo yum install ssmtp
```

For **“Fedora”** system, use the **[DNF Command][6]** to install ssmtp.

```
$ sudo dnf install ssmtp
```

### 6a) How to Use ssmtp Command on Linux to Send a Mail

It’s straight forward and easy to use.

Use the following format to send mail using the ssmtp command.

```
$ echo -e "Subject: Test Mail\nThis is the mail body" > /tmp/ssmtp-mail.txt
```

```
$ ssmtp [email protected] < /tmp/ssmtp-mail.txt
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/6-ways-to-send-email-from-the-linux-command-line/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.2daygeek.com/wp-content/uploads/2019/12/smtp-simple-mail-transfer-protocol.png
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[6]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
