[#]: collector: (lujun9972)
[#]: translator: (linusboyle)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Communicating with other users on the Linux command line)
[#]: via: (https://www.networkworld.com/article/3530343/communicating-with-other-users-on-the-linux-command-line.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Communicating with other users on the Linux command line
======

Thinkstock / Linux

Sending messages to other users on the Linux command line can be very easy, but there are a number of commands that you might want to consider. In this post, we’ll look at four commands and see how each of them works.

### wall

The **wall** command (as in "write all") allows you to send a message to all users who are currently logged into the system. This implies that the system is likely a server and that users are working on the command line. While the wall command is generally used by sysadmins to send out notices to users to let send out information (e.g., that the server is going down for maintenance), it can be used by any user.

A sysadmin might send out a message like this:

```
$ wall The system will be going down in 15 minutes to address a serious problem
```

Everyone logged into the system will see something like this:

```
Broadcast message from admin@dragonfly (pts/0) (Thu Mar  5 08:56:42 2020):

The system is going down in 15 minutes to address a serious problem
```

If you want to use single quote marks in your message, enclose the message in double quote marks like this:

```
$ wall “Don’t forget to save your work before logging off”
```

The outside quote marks will not show up in the transmitted message, but, without them, the command sits and waits for a closing single quote.

### mesg

If, for some reason, you don’t want to accept messages from another user, you can stop them from arriving with the **mesg** command. This command can be used with a “n” argument to refuse mail from the user or a “y” argument to allow the messages to arrive.

[][1]

```
$ mesg n doug
$ mesg y doug
```

The blocked user will not be notified that their messages have been blocked. You can also block or allow all messages with a **mesg** command like one of these:

```
$ mesg y
$ mesg n
```

### write

Another command for sending text without reverting to email is **write**. This command can be used to communicate with a specific user.

```
$ write nemo
Are you still at your desk?
I need to talk with you right away.
^C
```

Enter your text and use **^C** to exit when you’re done. The command allows you to send text, but doesn’t start a two-way conversation. It just sends the text. If the user is logged in on more than one terminal, you can specify which terminal you want to send the message to or you can rely on the system to choose the one with the shortest idle time.

```
$ write nemo#1
```

If the user you are trying to write to has messages blocked, you should see something like this:

```
$ write nemo
write: nemo has messages disabled
```

### talk/ytalk

The **talk** or **ytalk** command gives you a chance to have an interactive chat with one or more other users. The command will bring up a double-pane (top and bottom) window. Each individual will type into the top portion of the display on their screen and see the responses in the bottom section(s). The respondents can respond to a talk request by typing "talk" followed by the username of the person addressing them.

```
Message from Talk_Daemon@dragonfly at 10:10 ...
talk: connection requested by dory@127.0.0.1.
talk: respond with:  talk dory@127.0.0.1

$ talk dory
```

The window can involve more than two participants if **ytalk** is used. As you can see in the example below (the result of the "talk dory" command shown above), talk is often ytalk.

```
----------------------------= YTalk version 3.3.0 =--------------------------
Is the report ready?

-------------------------------= nemo@dragonfly =----------------------------
Just finished it
```

As explained above, on the other side of the conversation, the talk session window panes are reversed:

```
----------------------------= YTalk version 3.3.0 =--------------------------
Just finished it

-------------------------------= dory@dragonfly =----------------------------
Is the report ready?
```

Again, use **^C** to exit.

To talk with someone on another system, you just need to add a **-h** option and the hostname or IP address with a command like this:

```
$ talk -h 192.168.0.11 nemo
```

### Wrap-Up

There are a number of basic commands for sending messages to other logged-in users on Linux systems, and they can be especially useful when you need to send out a quick message to all of the users, prefer a quick exchange to a phone call or want to easily involve more than two people in a quick messaging session.

Some commands, like **wall**, allow a message to be broadcast, but are not interactive. Others, like **talk**, allow both lengthy and multi-user chats, avoiding the need to set up a conference call when a fairly quick exchange of information is all that's required.

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3530343/communicating-with-other-users-on-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
