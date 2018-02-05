使用 tmux 打造更强大的终端
============================

 ![](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/tmux-945x400.jpg) 

一些 Fedora 用户把大部分甚至是所有时间花费在了[命令行][4]终端上。 终端可让您访问整个系统，以及数以千计的强大的实用程序。 但是，它默认情况下一次只显示一个命令行会话。 即使有一个大的终端窗口，整个窗口也只会显示一个会话。 这浪费了空间，特别是在大型显示器和高分辨率的笔记本电脑屏幕上。 但是，如果你可以将终端分成多个会话呢？ 这正是 tmux 最方便的地方，或者说不可或缺的。

### 安装并启动 tmux 

tmux 应用程序的名称来源于终端（terminal）复用器（muxer）或多路复用器（multiplexer）。 换句话说，它可以将您的单终端会话分成多个会话。 它管理窗口和窗格：

- 窗口（window）是一个单一的视图 - 也就是终端中显示的各种东西。
- 窗格（pane） 是该视图的一部分，通常是一个终端会话。

开始前，请在系统上安装 `tmux` 应用程序。 你需要为您的用户帐户设置 `sudo` 权限（如果需要，请[查看本文][5]获取相关说明）。

```
sudo dnf -y install tmux
```

运行 `tmux`程序：

```
tmux
```

### 状态栏

首先，似乎什么也没有发生，除了出现在终端的底部的状态栏：

 ![Start of tmux session](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/Screenshot-from-2017-02-04-12-54-41.png) 

底部栏显示：

*   `[0]` – 这是 `tmux` 服务器创建的第一个会话。编号从 0 开始。`tmux` 服务器会跟踪所有的会话确认其是否存活。
*   `0:testuser@scarlett:~`  –  有关该会话的第一个窗口的信息。编号从 0 开始。这表示窗口的活动窗格中的终端归主机名 `scarlett` 中 `testuser` 用户所有。当前目录是  `~` (家目录)。
*   `*`  – 显示你目前在此窗口中。
*   `“scarlett.internal.fri”`  – 你正在使用的 `tmux` 服务器的主机名。
*   此外，还会显示该特定主机上的日期和时间。

当你向会话中添加更多窗口和窗格时，信息栏将随之改变。

### tmux 基础知识

把你的终端窗口拉伸到最大。现在让我们尝试一些简单的命令来创建更多的窗格。默认情况下，所有的命令都以 `Ctrl+b` 开头。

*   敲 `Ctrl+b, "`  水平分割当前单个窗格。 现在窗口中有两个命令行窗格，一个在顶部，一个在底部。请注意，底部的新窗格是活动窗格。
*   敲 `Ctrl+b, %`  垂直分割当前单个窗格。 现在你的窗口中有三个命令行窗格，右下角的窗格是活动窗格。

![tmux window with three panes](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/Screenshot-from-2017-02-04-12-54-59.png)

注意当前窗格周围高亮显示的边框。要浏览所有的窗格，请做以下操作：

*   敲 `Ctrl+b`，然后点箭头键
*   敲 `Ctrl+b, q`，数字会短暂的出现在窗格上。在这期间，你可以你想要浏览的窗格上对应的数字。

现在，尝试使用不同的窗格运行不同的命令。例如以下这样的：

*   在顶部窗格中使用 `ls`  命令显示目录内容。
*   在左下角的窗格中使用 `vi` 命令，编辑一个文本文件。
*   在右下角的窗格中运行 `top`  命令监控系统进程。

屏幕将会如下显示:

![tmux session with three panes running different commands](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/Screenshot-from-2017-02-04-12-57-51.png) 

到目前为止，这个示例中只是用了一个带多个窗格的窗口。你也可以在会话中运行多个窗口。

*   为了创建一个新的窗口，请敲`Ctrl+b, c` 。请注意，状态栏显示当前有两个窗口正在运行。（敏锐的读者会看到上面的截图。）
*   要移动到上一个窗口，请敲 `Ctrl+b, p` 。
*   要移动到下一个窗口，请敲 `Ctrl+b, n` 。
*   要立即移动到特定的窗口，请敲 `Ctrl+b`  然后跟上窗口编号。

如果你想知道如何关闭窗格，只需要使用 `exit` 、`logout`，或者 `Ctrl+d` 来退出特定的命令行 shell。一旦你关闭了窗口中的所有窗格，那么该窗口也会消失。

### 脱离和附加

`tmux` 最强大的功能之一是能够脱离和重新附加到会话。 当你脱离的时候，你可以离开你的窗口和窗格独立运行。 此外，您甚至可以完全注销系统。 然后，您可以登录到同一个系统，重新附加到 `tmux` 会话，查看您离开时的所有窗口和窗格。 脱离的时候你运行的命令一直保持运行状态。

为了脱离一个会话，请敲 `Ctrl+b, d`。然后会话消失，你重新返回到一个标准的单一 shell。如果要重新附加到会话中，使用一下命令：

```
tmux attach-session
```

当你连接到主机的网络不稳定时，这个功能就像救生员一样有用。如果连接失败，会话中的所有的进程都会继续运行。只要连接恢复了，你就可以恢复正常，就好像什么事情也没有发生一样。

如果这些功能还不够，在每个会话的顶层窗口和窗格中，你可以运行多个会话。你可以列举出这些窗口和窗格，然后通过编号或者名称把他们附加到正确的会话中：

```
tmux list-sessions
```

### 延伸阅读

本文只触及的 `tmux` 的表面功能。你可以通过其他方式操作会话：

*   将一个窗格和另一个窗格交换
*   将窗格移动到另一个窗口中（可以在同一个会话中也可以在不同的会话中）
*   设定快捷键自动执行你喜欢的命令
*   在 `~/.tmux.conf` 文件中配置你最喜欢的配置项，这样每一个会话都会按照你喜欢的方式呈现

有关所有命令的完整说明，请查看以下参考：

*   官方[手册页][1]
*   `tmux` [电子书][2] 

--------------------------------------------------------------------------------

作者简介：

Paul W. Frields 自 1997 年以来一直是 Linux 用户和爱好者，并于 2003 年加入 Fedora 项目，这个项目刚推出不久。他是 Fedora 项目委员会的创始成员，在文档，网站发布，宣传，工具链开发和维护软件方面都有贡献。他于2008 年 2 月至 2010 年 7 月加入 Red Hat，担任 Fedora 项目负责人，并担任 Red Hat 的工程经理。目前他和妻子以及两个孩子居住在弗吉尼亚。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-tmux-more-powerful-terminal/

作者：[Paul W. Frields][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[1]: http://man.openbsd.org/OpenBSD-current/man1/tmux.1
[2]: https://pragprog.com/book/bhtmux2/tmux-2
[3]: https://fedoramagazine.org/use-tmux-more-powerful-terminal/
[4]: http://www.cryptonomicon.com/beginning.html
[5]: https://fedoramagazine.org/howto-use-sudo/