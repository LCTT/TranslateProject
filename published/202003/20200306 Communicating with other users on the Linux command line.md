[#]: collector: (lujun9972)
[#]: translator: (linusboyle)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12023-1.html)
[#]: subject: (Communicating with other users on the Linux command line)
[#]: via: (https://www.networkworld.com/article/3530343/communicating-with-other-users-on-the-linux-command-line.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

使用 Linux 命令行与其他用户进行通信
======

![](https://img.linux.net.cn/data/attachment/album/202003/22/171055z3q772v2zq320zx3.jpg)

使用 Linux 命令行向其他用户发送消息或许非常容易，这里有一些相关的命令你可以考虑使用。在这篇文章中，我们会考察 4 个这样的命令，看看它们是怎么工作的。

### wall

`wall`（“Write ALL” 的简称）命令允许你向所有系统中已登录的用户发送一条信息。这里我们假设用户都使用命令行在同一台服务器上工作。虽然 `wall` 命令最常被系统管理员用于向用户发布公告和传递信息（比如说，服务器即将因维护而关闭)，但它可以被任何用户使用。

系统管理员可能会用类似下面的方式发送信息：

```
$ wall The system will be going down in 15 minutes to address a serious problem
```

而所有登录的用户都将看到类似这样的信息：

```
Broadcast message from admin@dragonfly (pts/0) (Thu Mar  5 08:56:42 2020):
The system is going down in 15 minutes to address a serious problem
```

如果希望在消息中使用单引号，你可以像这样将信息用双引号括起来：

```
$ wall "Don't forget to save your work before logging off"
```

最外层的双引号不会出现在发出的消息中，但是如果没有它们，`wall` 会停下并等待输入一个配对的单引号。

### mesg

如果出于某种理由你不想接收来自另一个用户的消息，你可以使用 `mesg` 命令来屏蔽这些消息。这个命令可以接受一个 `n` 作为参数来拒绝某用户的消息，或者接收一个 `y` 作为参数来接收用户发来的消息。

```
$ mesg n doug
$ mesg y doug
```

被屏蔽的用户不会被告知这一事实。你也可以像这样使用 `mesg` 来屏蔽或者接收所有消息：

```
$ mesg y
$ mesg n
```

### write

另一个在不使用电子邮件的情况下发送文本的命令是 `write`，这个命令可以用来和一个特定的用户通信。

```
$ write nemo
Are you still at your desk?
I need to talk with you right away.
^C
```

输入你的信息后用 `ctrl-c` 退出，这样就完成了通信。这个命令允许你发送文本，但并不会建立一个双向的通话。它只是将文本发送过去而已。如果目标用户在多个终端上登录，你可以指定你想将消息发送到哪一个终端，否则系统会选择空闲时间最短的那个终端。

```
$ write nemo#1
```

如果你试图向一个将消息屏蔽了的用户发送信息，你应该会看到这样的输出：

```
$ write nemo
write: nemo has messages disabled
```

### talk/ytalk

`talk` 和 `ytalk` 命令让你可以和一个或多个用户进行交互式的聊天。它们会展示一个有上下两个子窗口的界面，每个用户向显示在他们屏幕上方的窗口内输入内容，并在下方的窗口看到回复信息。要回复一个`talk` 请求，接收方可以输入 `talk`，在后面加上请求方的用户名。

```
Message from Talk_Daemon@dragonfly at 10:10 ...
talk: connection requested by dory@127.0.0.1.
talk: respond with:  talk dory@127.0.0.1

$ talk dory
```

如果使用的是 `ytalk`，那么窗口中可以包含多于两个参与者。正如下面的例子所展示的（这是上面 `talk dory` 命令的结果），`talk` 通常指向 `ytalk`。

```
----------------------------= YTalk version 3.3.0 =--------------------------
Is the report ready?

-------------------------------= nemo@dragonfly =----------------------------
Just finished it
```

如上所述，在通话的另一侧，`talk`会话界面的窗口是相反的：

```
----------------------------= YTalk version 3.3.0 =--------------------------
Just finished it

-------------------------------= dory@dragonfly =----------------------------
Is the report ready?
```

同样的，使用 `ctrl-c` 来退出。

如果要和非本机的用户通讯，你需要加上 `-h` 选项和目标主机名或IP地址，就像这样：

```
$ talk -h 192.168.0.11 nemo
```

### 总结

Linux 上有若干基本的命令可以用来向其他登录的用户发送消息。如果你需要向所有用户快速发送信息或是需要便捷的电话替代品，又或是希望能简单地开始一个多用户快速通讯会话，这些命令会十分实用。

一些命令如 `wall` 允许广播消息但却不是交互式的。另外的一些命令如 `talk` 允许多用户进行长时间通讯，当你只需要非常快速地交换一些信息，它们可以你你避免建立一个电话会议。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3530343/communicating-with-other-users-on-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[linusboyle](https://github.com/linusboyle)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
