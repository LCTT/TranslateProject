Mail transfer agent (MTA) basics
======

## Overview

In this tutorial, learn to:

  * Use the `mail` command.
  * Create mail aliases.
  * Configure email forwarding.
  * Understand common mail transfer agent (MTA) programs such as postfix, sendmail, qmail, and exim.



## Controlling where your mail goes

Email on a Linux system is delivered using MTAs. Your MTA delivers mail to other users on your system and MTAs communicate with each other to deliver mail all over a group of systems or all over the world.

### Prerequisites

To get the most from the tutorials in this series, you need a basic knowledge of Linux and a working Linux system on which you can practice the commands covered in this tutorial. You should be familiar with GNU and UNIX commands. Sometimes different versions of a program format output differently, so your results might not always look exactly like the listings shown here.

In this tutorial, I use Ubuntu 14.04 LTS and sendmail 8.14.4 for the sendmail examples.

## Mail transfer

Mail transfer agents such as sendmail deliver mail between users and between systems. Most Internet mail uses the Simple Mail Transfer Protocol (SMTP), but local mail may be transferred through files or sockets among other possibilities. Mail is a store and forward operation, so mail is stored in some kind of file or database until a user collects it or a receiving system or communication link is available. Configuring and securing an MTA is quite a complex task, most of which is beyond the scope of this introductory tutorial.

## The mail command

If you use SMTP email, you probably know that there are many, many mail clients that you can use, including `mail`, `mutt`, `alpine`, `notmuch`, and a host of other console and graphical mail clients. The `mail` command is an old standby that can be used to script the sending of mail as well as receive and manage your incoming mail.

You can use `mail` interactively to send messages by passing a list of addressees, or with no arguments you can use it to look at your incoming mail. Listing 1 shows how to send a message to user steve and user pat on your system with a carbon copy to user bob. When prompted for the cc:user and the subject, enter the body and complete the message by pressing **Ctrl+D** (hold down the Ctrl key and press D).

##### Listing 1. Using `mail` interactively to send mail
```
ian@attic4-u14:~$ mail steve,pat
Cc: bob
Subject: Test message 1
This is a test message

Ian
```

If all is well, your mail is sent. If there is an error, you will see an error message. For example, if you typed an invalid name as a recipient, the mail is not sent. Note that in this example, all users are on your local system and therefore all must be valid users.

You can also send mail non-interactively using the command line. Listing 2 shows how to send a small message to users steve and pat. This capability is particularly useful in scripts. Different versions of the `mail` command are available in different packages. Some support a `-c` option for cc:, but the version I am using here does not, so I specify only the to: addresses.

Listing 2. Using `mail` non-interactively
```
ian@attic4-u14:~$ mail -t steve,pat -s "Test message 2" <<< "Another test.\n\nIan"
```

If you use `mail` with no options you will see a list of your incoming mail as shown in Listing 3. You see that user steve has the two messages I sent above, plus an earlier one from me and a later one from user bob. All the mail is marked as 'N' for new mail.

Listing 3. Using `mail` for incoming mail
```
steve@attic4-u14:~$ mail
"/var/mail/steve": 4 messages 4 new
>N 1 Ian Shields Tue Dec 12 21:03 16/704 test message
 N 2 Ian Shields Tue Dec 12 21:04 18/701 Test message 1
 N 3 Ian Shields Tue Dec 12 21:23 15/661 Test message 2
 N 4 Bob C Tue Dec 12 21:45 17/653 How about lunch tomorrow?
?
```

The currently selected message is shown with a '>', which is message number 1 in Listing 3. If you press **Enter** , the first page of the next unread message will be displayed. Press the **Space bar** to page through the message. When you finish reading the message and return to the '?' prompt, press **Enter** again to view the next message, and so on. At any '?' prompt you can type 'h' to see the list of message headers again. The ones you have read will now show 'R' in the status as shown in Listing 4.

Listing 4. Using 'h' to display mail headers
```
? h
 R 1 Ian Shields Tue Dec 12 21:03 16/704 test message
 R 2 Ian Shields Tue Dec 12 21:04 18/701 Test message 1
>R 3 Ian Shields Tue Dec 12 21:23 15/661 Test message 2
 N 4 Bob C Tue Dec 12 21:45 17/653 How about lunch tomorrow?
?
```

Here Steve has read the three messages from Ian but has not read the message from Bob. You can select individual messages by number, and you can also delete messages that you don't want by typing 'd', or '3d' to delete the third message. If you type 'q' you will quit the `mail` command. Messages that you have read will be transferred to the mbox file in your home directory and the unread messages will remain in your inbox, by default in /var/mail/$(id -un). See Listing 5.

Listing 5. Using 'q' to quit `mail`
```
? h
 R 1 Ian Shields Tue Dec 12 21:03 16/704 test message
 R 2 Ian Shields Tue Dec 12 21:04 18/701 Test message 1
>R 3 Ian Shields Tue Dec 12 21:23 15/661 Test message 2
 N 4 Bob C Tue Dec 12 21:45 17/653 How about lunch tomorrow?
? q
Saved 3 messages in /home/steve/mbox
Held 1 message in /var/mail/steve
You have mail in /var/mail/steve
```

If you type 'x' to exit instead of 'q' to quit, your mailbox will be left unchanged. Because this is on the /var file system, your system administrator may allow mail to be kept there only for a limited time. To reread or otherwise process mail that has been saved to your local mbox file, use the `-f` option to specify the file you want to read. For example `mail -f mbox`.

## Mail aliases

In the previous section you saw how mail can be sent to various users on a system. You can use a fully qualified name, such as ian@myexampledomain.com to send mail to a user on another system.

Sometimes you might want all the mail for a user to go to some other place. For example, you may have a server farm and want all the root mail to go to a central system administrator. Or you may want to create a mailing list where mail goes to several people. To do this, you use aliases that allow you to define one or more destinations for a given user name. The destinations may be other user mail boxes, files, pipes, or commands that do further processing. You do this by specifying the aliases in /etc/mail/aliases or /etc/aliases. Depending on your system, you may find that one of these is a symbolic link to the other, or you may have only one of them. You need root authority to change the aliases file.

The general form of an alias is
name: addr_1, addr_2, addr_3, ...
where the name is a local user name to alias or an alias and the addr_1, addr_2, ... are one or more aliases. Aliases can be a local user, a local file name, another alias, a command, an include file, or an external address.

So how does sendmail distinguish the aliases (the addr-N values)?

  * A local user name is a text string that matches the name of a user on this system. Technically this means it can be found using the `getpwnam` call .
  * A local file name is a full path and file name that starts with '/'. It must be writeable by `sendmail`. Messages are appended to the file.
  * A command starts with the pipe symbol (|). Messages are sent to the command using standard input.
  * An include file alias starts with :include: and specifies a path and file name. The aliases in file are added to the aliases for this name.
  * An external address is an email address such as john@somewhere.com.



You should find an example file, such as /usr/share/sendmail/examples/db/aliases that was installed with your sendmail package. It contains some recommended aliases for postmaster, MAILER-DAEMON, abuse, and spam. In Listing 6, I have combined entries from the example file on my Ubuntu 14.04 LTS system with some rather artificial examples that illustrate several of the possibilities.

Listing 6. Somewhat artificial /etc/mail/aliases example

```
ian@attic4-u14:~$ cat /etc/mail/aliases
# First include some default system aliases from
# /usr/share/sendmail/examples/db/aliases

#
# Mail aliases for sendmail
#
# You must run newaliases(1) after making changes to this file.
#

# Required aliases
postmaster:	root
MAILER-DAEMON:	postmaster

# Common aliases
abuse:		postmaster
spam:		postmaster

# Other aliases

# Send steve's mail to bob and pat instead
steve: bob,pat

# Send pat's mail to a file in her home directory and also to her inbox.
# Finally send it to a command that will make another copy.
pat: /home/pat/accumulated-mail,
 \pat,
 |/home/pat/makemailcopy.sh

# Mailing list for system administrators
sysadmins: :include: /etc/aliases-sysadmins
```

Note that pat is both an alias and a user of the system. Alias expansion is recursive, so if an alias is also a name, then it will be expanded. Sendmail does not send mail twice to a given user, so if you just put 'pat' as an alias for 'pat', then it would be ignored since sendmail had already found and processed 'pat'. To avoid this problem, you prefix an alias name with a '\' to indicate that it is a name not subject to further aliasing. This way, pat's mail can be sent to her normal inbox as well as the file and command.

Lines in the aliases that start with '$' are comments and are ignored. Lines that start with blanks are treated as continuation lines.

The include file /etc/aliases-sysadmins is shown in Listing 7.

Listing 7. The /etc/aliases-sysadmins include file
```
ian@attic4-u14:~$ cat /etc/aliases-sysadmins

# Mailing list for system administrators
bob,pat
```

## The newaliases command

Most configuration files used by sendmail are compiled into database files. This is also true for mail aliases. You use the `newaliases` command to compile your /etc/mail/aliases and any included files to /etc/mail/aliases.db. Note that `newaliases` is equivalent to `sendmail -bi`. Listing 8 shows an example.

Listing 8. Rebuild the database for the mail aliases file
```
ian@attic4-u14:~$ sudo newaliases
/etc/mail/aliases: 7 aliases, longest 62 bytes, 184 bytes total
ian@attic4-u14:~$ ls -l /etc/mail/aliases*
lrwxrwxrwx 1 root smmsp 10 Dec 8 15:48 /etc/mail/aliases -> ../aliases
-rw-r----- 1 smmta smmsp 12288 Dec 13 23:18 /etc/mail/aliases.db
```

## Examples of using aliases

Listing 9 shows a simple shell script that is used as a command in my alias example.

Listing 9. The makemailcopy.sh script
```
ian@attic4-u14:~$ cat ~pat/makemailcopy.sh
#!/bin/bash

# Note: Target file ~/mail-copy must be writeable by sendmail!
cat >> ~pat/mail-copy
```

Listing 10 shows the files that are updated when you put all this to the test.

Listing 10. The /etc/aliases-sysadmins include file
```
ian@attic4-u14:~$ date
Wed Dec 13 22:54:22 EST 2017
ian@attic4-u14:~$ mail -t sysadmins -s "sysadmin test 1" <<< "Testing mail"
ian@attic4-u14:~$ ls -lrt $(find /var/mail ~pat -type f -mmin -3 2>/dev/null )
-rw-rw---- 1 pat mail 2046 Dec 13 22:54 /home/pat/mail-copy
-rw------- 1 pat mail 13240 Dec 13 22:54 /var/mail/pat
-rw-rw---- 1 pat mail 9442 Dec 13 22:54 /home/pat/accumulated-mail
-rw-rw---- 1 bob mail 12522 Dec 13 22:54 /var/mail/bob
```

Some points to note:

  * There is a user 'mail' with group name 'mail' that is used by sendmail.
  * User mail is stored by sendmail in /var/mail which is also the home directory of user 'mail'. The inbox for user 'ian' defaults to /var/mail/ian.
  * If you want sendmail to write files in a user directory, the file must be writeable by sendmail. Rather than making it world writeable, it is customary to make it group writeable and make the group 'mail'. You may need a system administrator to do this for you.



## Using a .forward file to forward mail

The aliases file must be managed by a system administrator. Individual users can enable forwarding of their own mail using a .forward file in their own home directory. You can put anything in your .forward file that is allowed on the right side of the aliases file. The file contains plain text and does not need to be compiled. When mail is destined for you, sendmail checks for a .forward file in your home directory and processes the entries the same way it processes aliases.

## Mail queues and the mailq command

Linux mail handling uses a store-and-forward model. You have already seen that your incoming mail is stored in a file in /var/mail until you read it. Outgoing mail is also stored until a receiving server connection is available. You use the `mailq` command to see what mail is queued. Listing 11 shows an example of mail being sent to an external user, ian@attic4-c6, and the result of running the `mailq` command. In this case, there is currently no active link to attic4-c6, so the mail will remain queued until a link becomes active.

Listing 11. Using the `mailq` command
```
ian@attic4-u14:~$ mail -t ian@attic4-c6 -s "External mail" <<< "Testing external mail queues"
ian@attic4-u14:~$ mailq
MSP Queue status...
/var/spool/mqueue-client is empty
		Total requests: 0
MTA Queue status...
		/var/spool/mqueue (1 request)
-----Q-ID----- --Size-- -----Q-Time----- ------------Sender/Recipient-----------
vBE4mdE7025908* 29 Wed Dec 13 23:48 <ian@attic4-u14.hopto.org>
					 <ian@attic4-c6.hopto.org>
		Total requests: 1
```

## Other mail transfer agents

In response to security issues with sendmail, several other mail transfer agents were developed during the 1990's. Postfix is perhaps the most popular, but qmail and exim are also widely used.

Postfix started life at IBM research as an alternative to sendmail. It attempts to be fast, easy to administer, and secure. The outside looks somewhat like sendmail, but the inside is completely different.

Qmail is a secure, reliable, efficient, simple message transfer agent developerd by Dan Bernstein. However, the core qmail package has not been updated for many years. Qmail and several other packages have now been collected into IndiMail.

Exim is another MTA developed at the University of Cambridge. Originally, the name stood for EXperimental Internet Mailer.

All of these MTAs were designed as sendmail replacements, so they all have some form of sendmail compatibility. Each can handle aliases and .forward files. Some provide a `sendmail` command as a front end to the particular MTA's own command. Most allow the usual sendmail options, although some options might be ignore silently. The `mailq` command is supported directly or by an alternate command with a similar function. For example, you can use `mailq` or `exim -bp` to display the exim mail queue. Needless to say, output can look different compared to that produced by sendmail's `mailq` command.

See Related topics where you can find more information on all of these MTAs.

This concludes your introduction to mail transfer agents on Linux.


--------------------------------------------------------------------------------

via: https://www.ibm.com/developerworks/library/l-lpic1-108-3/index.html

作者：[Ian Shields][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ibm.com
[1]:http://www.lpi.org
[2]:https://www.ibm.com/developerworks/library/l-lpic1-map/
