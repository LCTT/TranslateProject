screen 命令使用及示例
============================================================

![linux screen command usage and examples](https://www.rosehosting.com/blog/wp-content/uploads/2017/02/linux-screen-usage-examples.jpg) 

`screen` 是一个非常有用的命令，提供从单个 SSH 会话中使用多个 shell 窗口（会话）的能力。当会话被分离或网络中断时，screen 会话中启动的进程仍将运行，你可以随时重新连接到 screen 会话。如果你想运行一个持久的进程或者从多个位置连接到 shell 会话，这也很方便。

在本文中，我们将展示在 Linux 上安装和使用 `screen` 的基本知识。

### 如何安装 screen

`screen` 在一些流行的发行版上已经预安装了。你可以使用下面的命令检查是否已经在你的服务器上安装了。

```
screen -v
Screen version 4.00.03 (FAU)
```

如果在 Linux 中还没有 `screen`，你可以使用系统提供的包管理器很简单地安装它。

**CentOS/RedHat/Fedora**

```
yum -y install screen
```

**Ubuntu/Debian**

```
apt-get -y install screen
```

### 如何启动一个 screen 会话

你可以在命令行中输入 `screen` 来启动它，接着会有一个看上去和命令行提示符一样的 `screen` 会话启动。

```
screen
```

使用描述性名称启动屏幕会话是一个很好的做法，这样你可以轻松地记住会话中正在运行的进程。要使用会话名称创建新会话，请运行以下命令：

```
screen -S name
```

将 “name” 替换为对你会话有意义的名字。

### 从 screen 会话中分离

要从当前的 screen 会话中分离，你可以按下 `Ctrl-A` 和 `d`。所有的 screen 会话仍将是活跃的，你之后可以随时重新连接。

### 重新连接到 screen 会话

如果你从一个会话分离，或者由于某些原因你的连接被中断了，你可以使用下面的命令重新连接：

```
screen -r
```

如果你有多个 screen 会话，你可以用 `ls` 参数列出它们。

```
screen -ls

There are screens on:
7880.session    (Detached)
7934.session2   (Detached)
7907.session1   (Detached)
3 Sockets in /var/run/screen/S-root.
```

在我们的例子中，我们有三个活跃的 screen 会话。因此，如果你想要还原 “session2” 会话，你可以执行：

```
screen -r 7934
```

或者使用 screen 名称。

```
screen -r -S session2
```

### 中止 screen 会话

有几种方法来中止 screen 会话。你可以按下 `Ctrl+d`，或者在命令行中使用 `exit` 命令。

要查看 `screen` 命令所有有用的功能，你可以查看 `screen` 的 man 手册。

```
man screen

NAME
screen - screen manager with VT100/ANSI terminal emulation

SYNOPSIS
screen [ -options ] [ cmd [ args ] ]
screen -r [[pid.]tty[.host]]
screen -r sessionowner/[[pid.]tty[.host]]
```

* * *

顺便说一下，如果你喜欢这篇文章，请在社交网络上与你的朋友分享，或者在评论区留下评论。谢谢。

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/basic-screen-command-usage-and-examples/

作者：[rosehosting.com][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com/blog/basic-screen-command-usage-and-examples/
[1]:https://www.rosehosting.com/blog/basic-screen-command-usage-and-examples/
[2]:https://www.rosehosting.com/blog/basic-screen-command-usage-and-examples/#comments
[3]:https://www.rosehosting.com/blog/category/tips-and-tricks/
[4]:https://www.rosehosting.com/centos-vps.html
[5]:https://www.rosehosting.com/ubuntu-vps.html
[6]:https://www.rosehosting.com/debian-vps.html
[7]:https://plus.google.com/share?url=https://www.rosehosting.com/blog/basic-screen-command-usage-and-examples/
[8]:http://www.linkedin.com/shareArticle?mini=true&url=https://www.rosehosting.com/blog/basic-screen-command-usage-and-examples/&title=Basic%20screen%20command%20usage%20and%20examples&summary=Screen%20is%20a%20very%20useful%20command%20that%20offers%20the%20ability%20to%20use%20multiple%20shell%20windows%20(sessions)%20from%20a%20single%20SSH%20session.%20When%20the%20session%20is%20detached%20or%20there%20is%20a%20network%20disruption,%20the%20process%20that%20is%20started%20in%20a%20screen%20session%20will%20still%20run%20and%20you%20can%20re-attach%20to%20the%20...
[9]:https://www.rosehosting.com/linux-vps-hosting.html
