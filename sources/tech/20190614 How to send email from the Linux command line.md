[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to send email from the Linux command line)
[#]: via: (https://www.networkworld.com/article/3402027/how-to-send-email-from-the-linux-command-line.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to send email from the Linux command line
======
Linux offers several commands that allow you to send email from the command line. Here's look at some that offer interesting options.
![Molnia/iStock][1]

There are several ways to send email from the Linux command line. Some are very simple and others more complicated, but offer some very useful features. The choice depends on what you want to do -– whether you want to get a quick message off to a co-worker or send a more complicated message with an attachment to a large group of people. Here's a look at some of the options:

### mail

The easiest way to send a simple message from the Linux command line is to use the **mail** command. Maybe you need to remind your boss that you're leaving a little early that day. You could use a command like this one:

```
$ echo "Reminder: Leaving at 4 PM today" | mail -s "early departure" myboss
```

**[ Two-Minute Linux Tips:[Learn how to master a host of Linux commands in these 2-minute video tutorials][2] ]**

Another option is to grab your message text from a file that contains the content you want to send:

```
$ mail -s "Reminder:Leaving early" myboss < reason4leaving
```

In both cases, the -s options allows you to provide a subject line for your message.

### sendmail

Using **sendmail** , you can send a quick message (with no subject) using a command like this (replacing "recip" with your intended recipient:

```
$ echo "leaving now" | sendmail recip
```

You can send just a subject line (with no message content) with a command like this:

```
$ echo "Subject: leaving now" | sendmail recip
```

You can also use sendmail on the command line to send a message complete with a subject line. However, when using this approach, you would add your subject line to the file you intend to send as in this example file:

```
Subject: Requested lyrics
I would just like to say that, in my opinion, longer hair and other flamboyant
affectations of appearance are nothing more ...
```

Then you would send the file like this (where the lyrics file contains your subject line and text):

```
$ sendmail recip < lyrics
```

Sendmail can be quite verbose in its output. If you're desperately curious and want to see the interchange between the sending and receiving systems, add the -v (verbose) option:

```
$ sendmail -v recip@emailsite.com < lyrics
```

### mutt

An especially nice tool for command line emailing is the **mutt** command, though you will likely have to install it first. Mutt has a convenient advantage in that it can allow you to include attachments.

To use mutt to send a quick messsage:

```
$ echo "Please check last night's backups" | mutt -s "backup check" recip
```

To get content from a file:

```
$ mutt -s "Agenda" recip < agenda
```

To add an attachment with mutt, use the -a option. You can even add more than one – as shown in this command:

```
$ mutt -s "Agenda" recip -a agenda -a speakers < msg
```

In the command above, the "msg" file includes content for the email. If you don't have any additional content to provide, you can do this instead:

```
$ echo "" | mutt -s "Agenda" recip -a agenda -a speakers
```

The other useful option that you have with mutt is that it provides a way to send carbon copies (using the -c option) and blind carbon copies (using the -b option).

```
$ mutt -s "Minutes from last meeting" recip@somesite.com -c myboss < mins
```

### telnet

If you want to get deep into the details of sending email, you can use **telnet** to carry on the email exchange operation, but you'll need to, as they say, "learn the lingo." Mail servers expect a sequence of commands that include things like introducing yourself ( **EHLO** command), providing the email sender ( **MAIL FROM** command), specifying the email recipient ( **RCPT TO** command), and then adding the message ( **DATA** ) and ending the message with a "." as the only character on the line. Not every email server will respond to these requests. This approach is generally used only for troubleshooting.

```
$ telnet emailsite.org 25
Trying 192.168.0.12...
Connected to emailsite.
Escape character is '^]'.
220 localhost ESMTP Sendmail 8.15.2/8.15.2/Debian-12; Wed, 12 Jun 2019 16:32:13 -0400; (No UCE/UBE) logging access from: mysite(OK)-mysite [192.168.0.12]
EHLO mysite.org                <== introduce yourself
250-localhost Hello mysite [127.0.0.1], pleased to meet you
250-ENHANCEDSTATUSCODES
250-PIPELINING
250-EXPN
250-VERB
250-8BITMIME
250-SIZE
250-DSN
250-ETRN
250-AUTH DIGEST-MD5 CRAM-MD5
250-DELIVERBY
250 HELP
MAIL FROM: me@mysite.org       <== specify sender
250 2.1.0 shs@mysite.org... Sender ok
RCPT TO: recip             <== specify recipient
250 2.1.5 recip... Recipient ok
DATA                   <== start message
354 Enter mail, end with "." on a line by itself
This is a test message. Please deliver it for me.
.                  <== end message
250 2.0.0 x5CKWDds029287 Message accepted for delivery
quit                   <== end exchange
```

### Sending email to multiple recipients

If you want to send email from the Linux command line to a large group of recipients, you can always use a loop to make the job easier as in this example using mutt.

```
$ for recip in `cat recips`
do
    mutt -s "Minutes from May meeting" $recip < May_minutes
done
```

### Wrap-up

There are quite a few ways to send email from the Linux command line. Some tools provide quite a few options.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3402027/how-to-send-email-from-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2017/08/email_image_blue-100732096-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
