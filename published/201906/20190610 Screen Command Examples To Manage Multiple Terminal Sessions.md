[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10962-1.html)
[#]: subject: (Screen Command Examples To Manage Multiple Terminal Sessions)
[#]: via: (https://www.ostechnix.com/screen-command-examples-to-manage-multiple-terminal-sessions/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

screen 命令示例：管理多个终端会话
======

![Screen Command Examples To Manage Multiple Terminal Sessions](https://img.linux.net.cn/data/attachment/album/201906/11/124801th0uy0hti3y211ha.jpg)

GNU Screen 是一个终端多路复用器（窗口管理器）。顾名思义，Screen 可以在多个交互式 shell 之间复用物理终端，因此我们可以在每个终端会话中执行不同的任务。所有的 Screen 会话都完全独立地运行程序。因此，即使会话意外关闭或断开连接，在 Screen 会话内运行的程序或进程也将继续运行。例如，当通过 SSH [升级 Ubuntu][2] 服务器时，`screen` 命令将继续运行升级过程，以防万一 SSH 会话因任何原因而终止。

GNU Screen 允许我们轻松创建多个 Screen 会话，在不同会话之间切换，在会话之间复制文本，随时连上或脱离会话等等。它是每个 Linux 管理员应该在必要时学习和使用的重要命令行工具之一。在本简要指南中，我们将看到 `screen` 命令的基本用法以及在 Linux 中的示例。

### 安装 GNU Screen

GNU Screen 在大多数 Linux 操作系统的默认存储库中都可用。

要在 Arch Linux 上安装 GNU Screen，请运行：

```
$ sudo pacman -S screen
```

在 Debian、Ubuntu、Linux Mint 上：

```
$ sudo apt-get install screen
```

在 Fedora 上：

```
$ sudo dnf install screen
```

在 RHEL、CentOS 上：

```
$ sudo yum install screen
```

在 SUSE/openSUSE 上：

```
$ sudo zypper install screen
```

让我们继续看一些 `screen` 命令示例。

### 管理多个终端会话的 Screen 命令示例

在 Screen 中所有命令的默认前缀快捷方式是 `Ctrl + a`。使用 Screen 时，你需要经常使用此快捷方式。所以，要记住这个键盘快捷键。

#### 创建新的 Screen 会话

让我们创建一个新的 Screen 会话并连上它。为此，请在终端中键入以下命令：

```
screen
```

现在，在此会话中运行任何程序或进程，即使你与此会话断开连接，正在运行的进程或程序也将继续运行。

#### 从 Screen 会话脱离

要从屏幕会话中脱离，请按 `Ctrl + a` 和 `d`。你无需同时按下两个组合键。首先按 `Ctrl + a` 然后按 `d`。从会话中脱离后，你将看到类似下面的输出。

```
[detached from 29149.pts-0.sk]
```

这里，`29149` 是 Screen ID，`pts-0.sk` 是屏幕会话的名称。你可以使用 Screen ID 或相应的会话名称来连上、脱离和终止屏幕会话。

#### 创建命名会话

你还可以用你选择的任何自定义名称创建一个 Screen 会话，而不是默认用户名，如下所示。

```
screen -S ostechnix
```

上面的命令将创建一个名为 `xxxxx.ostechnix` 的新 Screen 会话，并立即连上它。要从当前会话中脱离，请按 `Ctrl + a`，然后按 `d`。

当你想要查找哪些进程在哪些会话上运行时，命名会话会很有用。例如，当在会话中设置 LAMP 系统时，你可以简单地将其命名为如下所示。

```
screen -S lampstack
```

#### 创建脱离的会话

有时，你可能想要创建一个会话，但不希望自动连上该会话。在这种情况下，运行以下命令来创建名为`senthil` 的已脱离会话：

```
screen -S senthil -d -m
```

也可以缩短为：

```
screen -dmS senthil
```

上面的命令将创建一个名为 `senthil` 的会话，但不会连上它。

#### 列出屏幕会话

要列出所有正在运行的会话（连上的或脱离的），请运行：

```
screen -ls
```

示例输出：

```
There are screens on:
    29700.senthil   (Detached)
    29415.ostechnix (Detached)
    29149.pts-0.sk  (Detached)
3 Sockets in /run/screens/S-sk.
```

如你所见，我有三个正在运行的会话，并且所有会话都已脱离。

#### 连上 Screen 会话

如果你想连上会话，例如 `29415.ostechnix`，只需运行：

```
screen -r 29415.ostechnix
```

或：

```
screen -r ostechnix
```

或使用 Screen ID：

```
screen -r 29415
```

要验证我们是否连上到上述会话，只需列出打开的会话并检查。

```
screen -ls
```

示例输出：

```
There are screens on:
        29700.senthil   (Detached)
        29415.ostechnix (Attached)
        29149.pts-0.sk  (Detached)
3 Sockets in /run/screens/S-sk.
```

如你所见，在上面的输出中，我们目前已连上到 `29415.ostechnix` 会话。要退出当前会话，请按 `ctrl + a d`。

#### 创建嵌套会话

当我们运行 `screen` 命令时，它将为我们创建一个会话。但是，我们可以创建嵌套会话（会话内的会话）。

首先，创建一个新会话或连上已打开的会话。然后我将创建一个名为 `nested` 的新会话。

```
screen -S nested
```

现在，在会话中按 `Ctrl + a` 和 `c` 创建另一个会话。只需重复此操作即可创建任意数量的嵌套 Screen 会话。每个会话都将分配一个号码。号码将从 `0` 开始。

你可以按 `Ctrl + n` 移动到下一个会话，然后按 `Ctrl + p` 移动到上一个会话。

以下是管理嵌套会话的重要键盘快捷键列表。

* `Ctrl + a "`  - 列出所有会话
* `Ctrl + a 0`  - 切换到会话号 0
* `Ctrl + a n`  - 切换到下一个会话
* `Ctrl + a p`  - 切换到上一个会话
* `Ctrl + a S`  - 将当前区域水平分割为两个区域
* `Ctrl + a l`  - 将当前区域垂直分割为两个区域
* `Ctrl + a Q`  - 关闭除当前会话之外的所有会话
* `Ctrl + a X`  - 关闭当前会话
* `Ctrl + a \`  - 终止所有会话并终止 Screen
* `Ctrl + a ?`  - 显示键绑定。要退出，请按回车
   
#### 锁定会话

Screen 有一个锁定会话的选项。为此，请按 `Ctrl + a` 和 `x`。 输入你的 Linux 密码以锁定。

```
Screen used by sk <sk> on ubuntuserver.
Password:
```

#### 记录会话

你可能希望记录 Screen 会话中的所有内容。为此，只需按 `Ctrl + a` 和 `H` 即可。

或者，你也可以使用 `-L` 参数启动新会话来启用日志记录。

```
screen -L
```

从现在开始，你在会话中做的所有活动都将记录并存储在 `$HOME` 目录中名为 `screenlog.x` 的文件中。这里，`x` 是一个数字。

你可以使用 `cat` 命令或任何文本查看器查看日志文件的内容。

![][3]

*记录 Screen 会话*

#### 终止 Screen 会话

如果不再需要会话，只需杀死它。要杀死名为 `senthil` 的脱离会话：

```
screen -r senthil -X quit
```

或：

```
screen -X -S senthil quit
```

或：

```
screen -X -S 29415 quit
```

如果没有打开的会话，你将看到以下输出：

```
$ screen -ls
No Sockets found in /run/screens/S-sk.
```

更多细节请参照 man 手册页：

```
$ man screen
```

还有一个名为 Tmux 的类似的命令行实用程序，它与 GNU Screen 执行相同的工作。要了解更多信息，请参阅以下指南。

* [Tmux 命令示例：管理多个终端会话][5]

### 资源

  * [GNU Screen 主页][6]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/screen-command-examples-to-manage-multiple-terminal-sessions/

作者：[sk][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/06/Screen-Command-Examples-720x340.jpg
[2]: https://www.ostechnix.com/how-to-upgrade-to-ubuntu-18-04-lts-desktop-and-server/
[3]: https://www.ostechnix.com/wp-content/uploads/2019/06/Log-screen-sessions.png
[4]: https://www.ostechnix.com/record-everything-terminal/
[5]: https://www.ostechnix.com/tmux-command-examples-to-manage-multiple-terminal-sessions/
[6]: https://www.gnu.org/software/screen/
