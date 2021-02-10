[#]: collector: (lujun9972)
[#]: translator: ( chensanle )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tmux Command Examples To Manage Multiple Terminal Sessions)
[#]: via: (https://www.ostechnix.com/tmux-command-examples-to-manage-multiple-terminal-sessions/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

基于 Tmux 的多会话终端管理示例
======

![tmux 命令示例][1]

我们已经了解到如何通过 [**GNU Screen**][2] 进行多会话管理。今天，我们将要领略另一个著名的命令行实用工具 **“Tmux”** 来管理会话。类似 GNU Screen，tmux 是一个帮助我们在单一终端窗口中创建多个会话，同一时间内同时运行多个应用程序或进程的终端复用工具。Tmux 免费、开源并且跨平台，支持 Linux、OpenBSD、FreeBSD、NetBSD 以及 Mac OS X。本文将讨论 Tmux 在 Linux 系统下的高频用法。

### Linux 下安装 Tmux

Tmux 可以在绝大多数的 Linux 官方仓库下获取。

在 Arch Linux 或它的变种系统下，执行下列命令来安装：

```
$ sudo pacman -S tmux
```

Debian、Ubuntu 或 Linux Mint:

```
$ sudo apt-get install tmux
```

Fedora:
```
$ sudo dnf install tmux
```

RHEL 和 CentOS:
```
$ sudo yum install tmux
```

SUSE/openSUSE：
```
$ sudo zypper install tmux
```

以上，我们已经完成 Tmux 的安装。之后我们继续看看其他的 Tmux 示例。

### Tmux 命令示例: 多会话管理 

Tmux 默认所有命令的前置命令都是 **Ctrl+b**，使用前牢记这个快捷键即可。
* * *

**注意** **Screen** 的前置命令都是 **Ctrl+a**.

* * *

##### 创建 Tmux 会话

在终端中运行如下命令创建 Tmux 会话并附着进入：

```
tmux
```

抑或，

```
tmux new
```

Once you are inside the Tmux session, you will see a **green bar at the bottom** as shown in the screenshot below.
一旦进入 Tmux 会话，你将看到一个 **绿色的栏目沉在底部** 如下图所示。 

![][3]

创建 Tmux 会话

这个绿色的栏目能很容易提示，当前你是否身处 Tmux 会话当中。

##### 退出 Tmux 会话

退出当前 Tmux 会话仅需要使用 **Ctrl+b** 和 **d**。无需同时触发这两个快捷键，依次按下 “Ctrl+b” 和 “d” 即可。

退出当前会话后，你将能看到如下输出。
```
[detached (from session 0)]
```

##### 创建有名会话

如果使用多个会话，你很可能会混淆运行在多个会话中的应用程序。这种情况下，我们需要会话并赋予名称。譬如需要 web 相关服务的会话，就创建一个名称为 **“webserver”**（或任意一个其他名称） 的 Tmux 会话。

```
tmux new -s webserver
```

这里是 Tmux 的有名会话

![][4]

拥有自定义名称的 Tmux 会话

当你能够看到上述截图，这个 Tmux 会话的名称已经被标注为 **webserver**。如此，你可以在多个会话中，轻易的区分应用程序的所在。

退出会话，轻按 **Ctrl+b** 和 **d**。

##### 查看 Tmux 会话清单

查看 Tmux 会话清单，执行：

```
tmux ls
```

示例输出：

![][5]

如你所见，我们开启了两个 Tmux 会话。

##### 创建非附着会话

有时候，你可能想要简单创建会话，但是并不想自动切入该会话。

创建一个非附着会话，并赋予名称 **“ostechnix”**，运行：

```
tmux new -s ostechnix -d
```

上述命令将会创建一个名为 “ostechnix” 的会话，但是并不会附着进入。

你可以通过使用 “tmux ls” 命令验证：

![][6]

##### 进入 Tmux 会话

通过如下命令，你可以进入最后一个被创建的会话：

```
tmux attach
```

Or,

```
tmux a
```

如果你想进入任意一个指定的有名会话，譬如 “ostechnix”，运行：

```
tmux attach -t ostechnix
```

或者，简写为：

```
tmux a -t ostechnix
```

##### 关闭 Tmux 会话

当你完成或者不再需要 Tmux 会话，你可以通过如下命令关闭：

```
tmux kill-session -t ostechnix
```

当身处该会话时，使用 **Ctrl+b** 以及 **x**。点击 “y” 来关闭会话

可以通过 “tmux ls” 命令验证。

关闭所有 Tmux 服务下的所有会话，运行：

```
tmux kill-server
```

谨慎！这将终止所有 Tmux 会话，并不会产生任何警告，即便会话存在运行中的任务。

如果不存在活跃的 Tmux 会话，将看到如下输出：

```
$ tmux ls
no server running on /tmp/tmux-1000/default
```

##### 分离 Tmux 窗口

分割窗口成多个小窗口，在 Tmux 中，这个叫做 “Tmux panes”（Tmux 窗格）。每个窗格中可以同时运行多个不同的程序。每个窗格可以在不影响其他窗格的前提下可以调整大小、移动位置和控制关闭。我们可以水平、垂直或者二者混合的方式切割屏幕。

**水平切割窗格**

欲水平切割窗格，使用 **Ctrl+b** 和 **“**（半个双引号）。

![][7]

使用组合键进一步切割面板。

**垂直切割窗格**

垂直切割面板，使用 **Ctrl+b** 和 **%**

![][8]

垂直切割 Tmux 窗格

**水平、垂直混合切割窗格**

我们也可以同时采用水平和垂直的方案切割窗格。看看如下截图：

![][9]

分割 Tmux 窗格

受限，我通过 **Ctrl+b “** 水平分割，之后通过 **Ctrl+b** 垂直分割下方的窗格。

如你所见，每个窗格下我运行了不同的程序。

**切换窗格**

通过 **Ctrl+b** 和 **方向键（上下左右）** 切换窗格。

**发送命令给所有窗格**

之前的案例中，我们在每个窗格中运行了三个不同命令。其实，也可以发送相同的命令给所有窗格。

为此，使用 **Ctrl+b** 然后键入如下命令，之后按压 ENTER： 

```
:setw synchronize-panes
```

现在在任意窗格中键入任何命令。你讲看到相同命令影响了所有窗格。

**Swap panes**
**交换窗格**

使用 **Ctrl+b** 和 **o** 交换窗格。

**展示窗格数量**

使用 **Ctrl+b** 和 **q** 展示窗格数量。

**终止窗格**

要关闭窗格，直接键入 **exit** 并且使用 ENTER 键。或者，按压 **Ctrl+b** 和 **x**。你会看到确认信息。按压 **”y“** 关闭窗格。

![][10]

关闭窗格。

这个阶段下，你已经获得了基本的 Tmux 技能来进行多会话管理，更多细节，参阅 man 页面。

```
$ man tmux
```

GNU Screen 和 Tmux 工具都能透过 SSH 很好的管理远程服务器。学习 Screen 和 Tmux 命令，像个行家一样，彻底通过这些工具管理远程服务器。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/tmux-command-examples-to-manage-multiple-terminal-sessions/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/06/Tmux-720x340.png
[2]: https://www.ostechnix.com/screen-command-examples-to-manage-multiple-terminal-sessions/
[3]: https://www.ostechnix.com/wp-content/uploads/2019/06/Tmux-session.png
[4]: https://www.ostechnix.com/wp-content/uploads/2019/06/Named-Tmux-session.png
[5]: https://www.ostechnix.com/wp-content/uploads/2019/06/List-Tmux-sessions.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/06/Create-detached-sessions.png
[7]: https://www.ostechnix.com/wp-content/uploads/2019/06/Horizontal-split.png
[8]: https://www.ostechnix.com/wp-content/uploads/2019/06/Vertical-split.png
[9]: https://www.ostechnix.com/wp-content/uploads/2019/06/Split-Panes.png
[10]: https://www.ostechnix.com/wp-content/uploads/2019/06/Kill-panes.png
