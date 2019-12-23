[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How the Linux screen tool can save your tasks – and your sanity – if SSH is interrupted)
[#]: via: (https://www.networkworld.com/article/3441777/how-the-linux-screen-tool-can-save-your-tasks-and-your-sanity-if-ssh-is-interrupted.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How the Linux screen tool can save your tasks – and your sanity – if SSH is interrupted
======
The Linux screen command can be a life-saver when you need to ensure long-running tasks don't get killed when an SSH session is interrupted. Here's how to use it.
Sandra Henry-Stocker

If you’ve ever had to restart a time-consuming process because your SSH session was disconnected, you might be very happy to learn about an interesting tool that you can use to avoid this problem – the **screen** tool.

Screen, which is a terminal multiplexor, allows you to run many terminal sessions within a single ssh session, detaching from them and reattaching them as needed. The process for doing this is surprising simple and involves only a handful of commands.

**[ Two-Minute Linux Tips: [Learn how to master a host of Linux commands in these 2-minute video tutorials][1] ]**

To start a screen session, you simply type **screen** within your ssh session. You then start your long-running process, type **Ctrl+A Ctrl+D** to detach from the session and **screen -r** to reattach when the time is right.

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

If you’re going to run more than one screen session, a better option is to give each session a meaningful name that will help you remember what task is being handled in it. Using this approach, you would name each session when you start it by using a command like this:

```
$ screen -S slow-build
```

Once you have multiple sessions running, reattaching to one then requires that you pick it from the list. In the commands below, we list the currently running sessions before reattaching one of them. Notice that initially both sessions are marked as being detached.

Advertisement

```
$ screen -ls
There are screens on:
        6617.check-backups      (09/26/2019 04:35:30 PM)    (Detached)
        1946.slow-build         (09/26/2019 02:51:50 PM)    (Detached)
2 Sockets in /run/screen/S-shs
```

Reattaching to the session then requires that you supply the assigned name. For example:

```
$ screen -r slow-build
```

The process you left running should have continued processing while it was detached and you were doing some other work. If you ask about your screen sessions while using one of them, you should see that the session you’re currently reattached to is once again “attached.”

```
$ screen -ls
There are screens on:
        6617.check-backups      (09/26/2019 04:35:30 PM)    (Attached)
        1946.slow-build         (09/26/2019 02:51:50 PM)    (Detached)
2 Sockets in /run/screen/S-shs.
```

You can ask what version of screen you’re running with the **-version** option.

```
$ screen -version
Screen version 4.06.02 (GNU) 23-Oct-17
```

### Installing screen

If “which screen” doesn’t provide information on screen, it probably isn't installed on your system.

```
$ which screen
/usr/bin/screen
```

If you need to install it, one of the following commands is probably right for your system:

```
sudo apt install screen
sudo yum install screen
```

The screen tool comes in handy whenever you need to run time-consuming processes that could be interrupted if your SSH session for any reason disconnects. And, as you've just seen, it’s very easy to use and manage.

Here's a recap of the commands used above:

```
screen -S <process description>      start a session
Ctrl+A Ctrl+D                           detach from a session
screen -ls                              list sessions
screen -r <process description>           reattach a session
```

While there is more to know about **screen**, including additional ways that you can maneuver between screen sessions, this should get you started using this handy tool.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3441777/how-the-linux-screen-tool-can-save-your-tasks-and-your-sanity-if-ssh-is-interrupted.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
