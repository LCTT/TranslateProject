[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11822-1.html)
[#]: subject: (How the Linux screen tool can save your tasks – and your sanity – if SSH is interrupted)
[#]: via: (https://www.networkworld.com/article/3441777/how-the-linux-screen-tool-can-save-your-tasks-and-your-sanity-if-ssh-is-interrupted.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如果 SSH 被中断，Linux screen 工具如何拯救你的任务以及理智
======

> 当你需要确保长时间运行的任务不会在 SSH 会话中断时被杀死时，Linux screen 命令可以成为救生员。以下是使用方法。

![](https://images.idgesg.net/images/article/2019/09/working_w_screen-shs-100812448-large.jpg)

如果因 SSH 会话断开而不得不重启一个耗时的进程，那么你可能会很高兴了解一个有趣的工具，可以用来避免此问题：`screen` 工具。

`screen` 是一个终端多路复用器，它使你可以在单个 SSH 会话中运行多个终端会话，并随时从它们之中脱离或重新接驳。做到这一点的过程非常简单，仅涉及少数命令。

要启动 `screen` 会话，只需在 SSH 会话中键入 `screen`。 然后，你可以开始启动需要长时间运行的进程，并在适当的时候键入 `Ctrl + A Ctrl + D` 从会话中脱离，然后键入 `screen -r` 重新接驳。

如果你要运行多个 `screen` 会话，更好的选择是为每个会话指定一个有意义的名称，以帮助你记住正在处理的任务。使用这种方法，你可以在启动每个会话时使用如下命令命名：

```
$ screen -S slow-build
```

一旦运行了多个会话，要重新接驳到一个会话，需要从列表中选择它。在以下命令中，我们列出了当前正在运行的会话，然后再重新接驳其中一个。请注意，一开始这两个会话都被标记为已脱离。

```
$ screen -ls
There are screens on:
        6617.check-backups      (09/26/2019 04:35:30 PM)    (Detached)
        1946.slow-build         (09/26/2019 02:51:50 PM)    (Detached)
2 Sockets in /run/screen/S-shs
```

然后，重新接驳到该会话要求你提供分配给会话的名称。例如：

```
$ screen -r slow-build
```

在脱离的会话中，保持运行状态的进程会继续进行处理，而你可以执行其他工作。如果你使用这些 `screen` 会话之一来查询 `screen` 会话情况，可以看到当前重新接驳的会话再次显示为 `Attached`。

```
$ screen -ls
There are screens on:
        6617.check-backups      (09/26/2019 04:35:30 PM)    (Attached)
        1946.slow-build         (09/26/2019 02:51:50 PM)    (Detached)
2 Sockets in /run/screen/S-shs.
```

你可以使用 `-version` 选项查询正在运行的 `screen` 版本。

```
$ screen -version
Screen version 4.06.02 (GNU) 23-Oct-17
```

### 安装 screen

如果 `which screen` 未在屏幕上提供信息，则可能你的系统上未安装该工具。

```
$ which screen
/usr/bin/screen
```

如果你需要安装它，则以下命令之一可能适合你的系统：

```
sudo apt install screen
sudo yum install screen
```

当你需要运行耗时的进程时，如果你的 SSH 会话由于某种原因断开连接，则可能会中断这个耗时的进程，那么 `screen` 工具就会派上用场。而且，如你所见，它非常易于使用和管理。

以下是上面使用的命令的摘要：

```
screen -S <process description>      开始会话
Ctrl+A Ctrl+D                        从会话中脱离
screen -ls                           列出会话
screen -r <process description>      重新接驳会话
```

尽管还有更多关于 `screen` 的知识，包括可以在 `screen` 会话之间进行操作的其他方式，但这已经足够帮助你开始使用这个便捷的工具了。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3441777/how-the-linux-screen-tool-can-save-your-tasks-and-your-sanity-if-ssh-is-interrupted.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
