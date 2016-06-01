jobs 命令示例
================================================================================

我是个新的 Linux/Unix 用户。我该如何在 Linux 或类 Unix 系统中使用 BASH/KSH/TCSH 或者基于 POSIX 的 shell 来查看当前正在进行的作业（job）？在 Unix/Linux 上怎样显示当前作业的状态？(LCTT 译注：job，也常称为“任务”)

作业控制是一种能力，可以停止/暂停进程（命令）的执行并按你的要求继续/恢复它们的执行。这是通过你的操作系统和诸如 bash/ksh 或 POSIX shell 等 shell 来执行的。

shell 会将当前所执行的作业保存在一个表中，可以用 jobs 命令来显示。

### 用途 ###

> 在当前 shell 会话中显示作业的状态。

### 语法 ###

其基本语法如下:

    jobs

或

    jobs jobID

或者

    jobs [options] jobID

### 启动一些作业来进行示范 ###

在开始使用 jobs 命令前，你需要在系统上先启动多个作业。执行以下命令来启动作业：

    ### 启动 xeyes, calculator, 和 gedit 文本编辑器 ###
    xeyes &
    gnome-calculator &
    gedit fetch-stock-prices.py &

最后，在前台运行 ping 命令：

    ping www.cyberciti.biz

按 **Ctrl-Z** 键来挂起（suspend） ping 命令的作业。

### jobs 命令示例 ###

要在当前 shell 显示作业的状态，请输入：

    $ jobs

输出示例:

    [1]   7895 Running                 gpass &
    [2]   7906 Running                 gnome-calculator &
    [3]-  7910 Running                 gedit fetch-stock-prices.py &
    [4]+  7946 Stopped                 ping cyberciti.biz

要显示名字以“p”开头的进程 ID 或作业名称，输入：

    $ jobs -p %p

或者

    $ jobs %p

输出示例:

    [4]-  Stopped                 ping cyberciti.biz

字符 ％ 是一个指定任务的方法。在这个例子中，你可以使用作业名称开头字符串来来暂停它，如 ％ping。

### 如何显示进程 ID 不包含其他正常的信息？ ###

通过 jobs 命令的 -l（小写的 L）选项列出每个作业的详细信息，运行：

    $ jobs -l

示例输出:

![Fig.01: Displaying the status of jobs in the shell](http://s0.cyberciti.org/uploads/faq/2013/02/jobs-command-output.jpg)

*Fig.01: 在 shell 中显示 jobs 的状态*

### 如何只列出最近一次状态改变的进程？ ###

首先，启动一个新的工作如下所示：

    $ sleep 100 &

现在，只显示自从上次提示过停止或退出之后的作业，输入：

    $ jobs -n

示例输出:

    [5]-  Running                 sleep 100 &

### 仅显示进程 ID（PID） ###

通过 jobs 命令的 -p 选项仅显示 PID：

    $ jobs -p

示例输出:

    7895
    7906
    7910
    7946
    7949

### 怎样只显示正在运行的作业呢？ ###

通过 jobs 命令的 -r 选项只显示正在运行的作业，输入：

    $ jobs -r

示例输出:

    [1]   Running                 gpass &
    [2]   Running                 gnome-calculator &
    [3]-  Running                 gedit fetch-stock-prices.py &

### 怎样只显示已经停止工作的作业？ ###

通过 jobs 命令的 -s 选项只显示停止工作的作业，输入：

    $ jobs -s

示例输出:

    [4]+  Stopped                 ping cyberciti.biz

要继续执行 ping cyberciti.biz 作业，输入以下 bg 命令：

    $ bg %4

### jobs 命令选项 ###

摘自 [bash(1)][1] 命令 man 手册页:

|选项|描述|
|---|------------------|
|`-l`| 列出进程 ID 及其它信息。|
|`-p`| 仅列出进程 ID。|
|`-n`| 仅列出自从上次输出了状态变化提示（比如显示有进程退出）后的发生了状态变化的进程。|
|`-r`| 仅显示运行中的作业。|
|`-s`| 仅显示停止的作业。|
|`-x`| 运行命令及其参数，并用新的命令的进程 ID 替代所匹配的原有作业的进程组 ID。|

### 关于 /usr/bin/jobs 和 shell 内建的说明 ###

输入以下 type 命令找出是否 jobs 命令是 shell 的内建命令或是外部命令还是都是：

    $ type -a jobs

输出示例:

    jobs is a shell builtin
    jobs is /usr/bin/jobs

在几乎所有情况下，你都需要使用 BASH/KSH/POSIX shell 内建的jobs 命令。/usr/bin/jobs 命令不能被用在当前 shell 中。/usr/bin/jobs 命令工作在不同的环境中，并不共享其父 bash/ksh 的 shell 作业。

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/unix-linux-jobs-command-examples-usage-syntax/

作者：Vivek Gite
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.manpager.com/linux/man1/bash.1.html
