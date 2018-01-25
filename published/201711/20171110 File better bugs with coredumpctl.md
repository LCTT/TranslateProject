用 coredumpctl 更好地记录 bug
===========

![](https://fedoramagazine.org/wp-content/uploads/2017/11/coredump.png-945x400.jpg)

一个不幸的事实是，所有的软件都有 bug，一些 bug 会导致系统崩溃。当它出现的时候，它经常会在磁盘上留下一个被称为“<ruby>核心转储<rt>core dump</rt></ruby>”的数据文件。该文件包含有关系统崩溃时的相关数据，可能有助于确定发生崩溃的原因。通常开发者要求提供 “<ruby>回溯<rt>backtrace</rt></ruby>” 形式的数据，以显示导致崩溃的指令流。开发人员可以使用它来修复 bug 以改进系统。如果系统发生了崩溃，以下是如何轻松生成 <ruby>回溯<rt>backtrace</rt></ruby> 的方法。

### 从使用 coredumpctl 开始

大多数 Fedora 系统使用[自动错误报告工具（ABRT）][2]来自动捕获崩溃文件并记录 bug。但是，如果你禁用了此服务或删除了该软件包，则此方法可能会有所帮助。

如果你遇到系统崩溃，请首先确保你运行的是最新的软件。更新通常包含修复程序，这些更新通常含有已经发现的会导致严重错误和崩溃的错误的修复。当你更新后，请尝试重现导致错误的情况。

如果崩溃仍然发生，或者你已经在运行最新的软件，那么可以使用有用的 `coredumpctl` 工具。此程序可帮助查找和处理崩溃。要查看系统上所有核心转储列表，请运行以下命令：

```
coredumpctl list
```

如果你看到比预期长的列表，请不要感到惊讶。有时系统组件在后台默默地崩溃，并自行恢复。快速查找今天的转储的简单方法是使用 `-since` 选项：

```
coredumpctl list --since=today
```

“PID” 列包含用于标识转储的进程 ID。请注意这个数字，因为你会之后再用到它。或者，如果你不想记住它，使用下面的命令将它赋值给一个变量：

```
MYPID=<PID>
```

要查看关于核心转储的信息，请使用此命令（使用 `$MYPID` 变量或替换 PID 编号）：

```
coredumpctl info $MYPID
```

### 安装 debuginfo 包

在核心转储中的数据以及原始代码中的指令之间调试符号转义。这个符号数据可能相当大。与大多数用户运行在 Fedora 系统上的软件包不同，符号以 “debuginfo” 软件包的形式安装。要确定你必须安装哪些 debuginfo 包，请先运行以下命令：

```
coredumpctl gdb $MYPID
```

这可能会在屏幕上显示大量信息。最后一行可能会告诉你使用 `dnf` 安装更多的 debuginfo 软件包。[用 sudo ][3]运行该命令以安装：

```
sudo dnf debuginfo-install <packages...>
```

然后再次尝试 `coredumpctl gdb $MYPID` 命令。**你可能需要重复执行此操作**，因为其他符号会在回溯中展开。

### 捕获回溯

在调试器中运行以下命令以记录信息：

```
set logging file mybacktrace.txt
set logging on
```

你可能会发现关闭分页有帮助。对于长的回溯，这可以节省时间。

```
set pagination off
```

现在运行回溯：

```
thread apply all bt full
```

现在你可以输入 `quit` 来退出调试器。`mybacktrace.txt` 包含可附加到 bug 或问题的追踪信息。或者，如果你正在与某人实时合作，则可以将文本上传到 pastebin。无论哪种方式，你现在可以向开发人员提供更多的帮助来解决问题。

---------------------------------

作者简介：

Paul W. Frields

Paul W. Frields 自 1997 年以来一直是 Linux 用户和爱好者，并于 2003 年在 Fedora 发布不久后加入 Fedora。他是 Fedora 项目委员会的创始成员之一，从事文档、网站发布、宣传、工具链开发和维护软件。他于 2008 年 2 月至 2010 年 7 月加入 Red Hat，担任 Fedora 项目负责人，现任红帽公司工程部经理。他目前和妻子和两个孩子住在弗吉尼亚州。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/file-better-bugs-coredumpctl/

作者：[Paul W. Frields][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/pfrields/
[1]:https://fedoramagazine.org/file-better-bugs-coredumpctl/
[2]:https://github.com/abrt/abrt
[3]:https://fedoramagazine.org/howto-use-sudo/
