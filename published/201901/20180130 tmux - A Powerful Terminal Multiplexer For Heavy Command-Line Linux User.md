tmux：适用于重度命令行 Linux 用户的终端复用器
======

tmux 是<ruby>终端复用器<rt>terminal multiplexer</rt></ruby>的缩写，它允许用户在单个窗口中创建或启用多个终端（垂直或水平），当你处理不同的问题时，可以在单个窗口中轻松访问和控制它们。

它使用客户端-服务器模型，允许在用户之间共享会话，也可以将终端连接到 tmux 会话。我们可以根据需要轻松移动或重新排列虚拟控制台。终端会话可以从一个虚拟控制台自由切换到另一个。

tmux 依赖于 `libevent` 和 `ncurses` 库。tmux 在屏幕底部提供了一个状态行，它显示当前 tmux 会话的有关信息，例如当前窗口编号、窗口名称、用户名、主机名、当前时间和日期。

启动 tmux 时，它会在一个单独窗口上创建一个新的会话，并将其显示在屏幕上。它允许用户在同一个会话中创建任意数量的窗口。

许多人说它类似于 `screen`，但我不这么认为，因为它提供了许多配置选项。

**注意：** `Ctrl+b` 是 tmux 中的默认命令前缀，因此，要在 tmux 中执行任何操作，你必须先输入该前缀然后输入所需的选项。

### tmux 特性

  * 创建任意数量的窗口
  * 在一个窗口中创建任意数量的窗格
  * 它允许垂直和水平分割
  * 分离并重新连接窗口
  * 客户端-服务器架构，这允许用户之间共享会话
  * tmux 提供许多配置技巧

**建议阅读：**

- [tmate - 马上与其他人分享你的终端会话][2]
- [Teleconsole - 一个与其他人分享终端会话的工具][3]

### 如何安装 tmux 命令

大多数 Linux 系统默认预安装 tmux 命令。如果没有，按照以下步骤安装。

对于 Debian/Ubuntu，使用 [APT-GET 命令][4]或 [APT 命令][5]来安装：

```
$ sudo apt install tmux
```

对于 RHEL/CentOS，使用 [YUM 命令][6]来安装：

```
$ sudo yum install tmux
```

对于 Fedora，使用 [DNF 命令][7]来安装：

```
$ sudo dnf install tmux
```

对于 Arch Linux，使用 [Pacman 命令][8]来安装：

```
$ sudo pacman -S tmux
```

对于 openSUSE，使用 [Zypper 命令][9]来安装：

```
$ sudo zypper in tmux
```

### 如何使用 tmux

在终端上运行以下命令来启动 tmux 会话。启动 tmux 后，它会在一个新窗口中创建新会话，并将使用你的用户账户自动登录到你的默认 shell。

```
$ tmux
```

![][11]

你会得到类似于我们上面的截图。tmux 附带状态栏，显示有关当前会话详细信息、日期、时间等。

状态栏信息如下：

  * `[0]`：它表示由 tmux 服务器创建的会话号。默认情况下，它从 0 开始。
  * `0:bash`：表示会话号、命令行提示符（这里的 `bash` 表示 shell 名称）。
  * `*`：这表示该窗口现在处于活动状态。
  * 主机名：显示服务器的完全主机名。
  * 日期与时间：显示当前日期和时间。

（LCTT 译注：tmux 的状态可以根据需要定制，也会因环境、版本的不同而不同。）

### 如何拆分窗口

tmux 允许用户垂直或水平分割窗口，称为窗格。每个窗格都包含自己独立运行的终端实例。我们来看看如何做到这一点。

按下 `Ctrl+b, %` 来垂直分割窗格。

![][13]

按下 `Ctrl+b, "` 来水平分割窗格。

![][14]

### 如何在窗格之间移动

假设，我们创建了一些窗格，希望在它们之间移动，这该怎么做？如果你不知道怎么做，那么使用 tmux 就没有意义了。使用以下控制键执行操作。在窗格之间移动有许多方法。

- 按 `Ctrl+b, ←` - 选择左边的窗格
- 按 `Ctrl+b, →` - 选择右边的窗格
- 按 `Ctrl+b, ↑` - 选择上边的窗格
- 按 `Ctrl+b, ↓` - 选择下边的窗格
- 按 `Ctrl+b, {` - 来向左交换窗格
- 按 `Ctrl+b, }` - 来向右交换窗格
- 按 `Ctrl+b, o` - 切换到下一个窗格（从左到右，从上到下）
- 按 `Ctrl+b, ;` - 移动到先前活动的窗格

出于测试目的，我们将在窗格之间移动。现在我们在 `pane2` 中，它展示了 `lsb_release -a`  命令的输出。

![][15]

我们将移动到 `pane0`，它显示 `uname -a` 命令的输出。

![][16]

### 如何打开/创建新窗口

你可以在一个终端内打开任意数量的窗口。

- 按 `Ctrl+b, c` 来创建一个新窗口。
- 按 `Ctrl+b, n` 移动到下一个窗口。
- 按 `Ctrl+b, p` 移动到上一个窗口。
- 按 `Ctrl+b, 0` ~ `Ctrl+b, 9` 立即移动到特定窗口。
- 按 `Ctrl+b, l` 移动到先前选择的窗口。

我有两个窗口，第一个窗口有三个窗格，其中包含操作系统版本信息，`top` 命令输出和内核信息。

![][17]

第二个窗口有两个窗格，其中包含 Linux 发行版 logo 信息。使用以下命令执行操作：

![][18]

按 `Ctrl+b, w` 以交互方式选择当前窗口。

![][19]

### 如何缩放窗格

你正在一些非常小的窗格中工作，并且你希望将其缩小以进行进一步的工作。要做到这一点，使用以下键绑定。

目前我们有三个窗格，我在 `pane1` 工作，它使用 `top` 命令显示系统活动信息，我将缩放它。

![][17]

缩放窗格时，它将隐藏所有其它窗格，并只显示窗口中的缩放窗格。

![][20]

按 `Ctrl+b, z` 缩放窗格，并再次按下它使缩放窗格恢复原状。

### 显示窗格信息

要了解窗格编号及其大小，运行以下命令。

按 `Ctrl+b, q` 可简单显示窗格索引。

![][21]

### 显示窗口信息

要知道窗口编号、布局大小，与窗口关联的窗格数量及其大小等，运行以下命令。

只需运行 `tmux list-windows` 即可查看窗口信息。

![][22]

### 如何调整窗格大小

你可能需要调整窗格大小来满足你的要求。你必须按下 `Ctrl+b, :`，然后在页面底部的黄色颜色条上输入以下详细信息。

![][23]

在上一部分中，我们打印了窗格索引，它同时也显示了窗格大小。为了测试，我们要向增加 `10` 个单元。参考以下输出，该窗格将 pane1 和 pane2 的大小从 `55x21` 增加到 `55x31`。

![][24]

**语法：** `Ctrl+b, :` 然后输入 `resize-pane [options] [cells size]`

- `Ctrl+b, :` 然后输入 `resize-pane -D 10` 将当前窗格大小向下调整 10 个单元。
- `Ctrl+b, :` 然后输入 `resize-pane -U 10` 将当前窗格大小向上调整 10 个单元。
- `Ctrl+b, :` 然后输入 `resize-pane -L 10` 将当前窗格大小向左调整 10 个单元。
- `Ctrl+b, :` 然后输入 `resize-pane -R 10` 将当前窗格大小向右调整 10 个单元。

### 分离并重新连接 tmux 会话

tmux 最强大的功能之一是能够在需要时分离和重新连接会话。

运行一个长时间运行的进程，然后按下 `Ctrl+b`，接着按 `d`，通过离开正在运行的进程安全地分离你的 tmux 会话。

**建议阅读：** [如何在断开 SSH 会话后保持进程/命令继续运行][25]

现在，运行一个长时间运行的进程。出于演示目的，我们将把此服务器备份移动到另一个远程服务器以进行灾难恢复（DR）。

```
$ rsync -avzhe ssh /backup root@192.168.0.161:/backups/week-1/
```

在分离 tmux 会话之后，你将获得类似下面的输出。

```
[detached (from session 0)]
```

运行以下命令以列出可用的 tmux 会话。

```
$ tmux ls
0: 3 windows (created Tue Jan 30 06:17:47 2018) [109x45]
```

现在，使用适当的会话 ID 重新连接 tmux 会话，如下所示：

```
$ tmux attach -t 0
```

### 如何关闭窗格和窗口

只需在相应的窗格中输入 `exit` 或按下 `Ctrl-d` 即可关闭它，和终端关闭类似。要关闭窗口，按下 `Ctrl+b, &`。

好了，就到这里了，希望你喜欢上它。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/tmux-a-powerful-terminal-multiplexer-emulator-for-linux/

作者：[Magesh Maruthamuthu][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/category/terminal-emulator/
[2]:https://www.2daygeek.com/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds/
[3]:https://www.2daygeek.com/teleconsole-share-terminal-session-instantly-to-anyone-in-seconds/
[4]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[5]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[6]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[8]:https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[9]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[10]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[11]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-1.png
[13]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-2.png
[14]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-3.png
[15]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-4.png
[16]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-5.png
[17]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-8.png
[18]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-6.png
[19]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-7.png
[20]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-9.png
[21]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-10.png
[22]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-14.png
[23]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-11.png
[24]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-13.png
[25]:https://www.2daygeek.com/how-to-keep-a-process-command-running-after-disconnecting-ssh-session/
