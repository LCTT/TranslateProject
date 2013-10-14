精通Linux "kill"命令
================================================================================
你使用哪种操作系统没有关系,你一定会遇到某个行为失常的应用,它把自己锁起来拒绝关闭.在Linux(还有Mac), 你可以用一个"kill"命令强制终结它.在这个教程中,我们将展示给你多种方式使用"kill"命令终结应用.

**Kill命令和信号**

当你执行一个"kill"命令,你实际上发送了一个信号给从左系统指示它终结不正常的应用.总共有60个你可一使用的信号,但是基本上你只需要知道SIGTERM(15)和SIGKILL(9).

你可以用这个命令看到所有的信号:

    kill -l

![](http://i1.wp.com/imagecdn5.maketecheasier.com/2013/10/kill-list-signal.png)

- SIGTERM - 此信号请求一个进程停止运行.此信号是可以被忽略.进程被给一段时间正常关闭.一个程序正常关闭意味着给一段时间来保存进度并释放资源.换句话说,它不是强制停止
- SIGKILL - 此个信号强制进程立刻停止运行.程序不能忽略此信号.未保存进度将丢失.

使用"kill"的语法是:

    kill [信号或选项] PID(s)

默认信号(当没有指定的时候)是SIGTERM.当它不起作用时,你可以使用下面的命令来强制kill掉一个进程:

    kill SIGKILL PID

or

    kill -9 PID

这里"-9"引用SIGKILL信号.

如果你不知道应用的PID,仅需要运行这个命令:

    ps ux

它会显示所有正在运行的应用还有应用的PID.

![](http://i1.wp.com/imagecdn5.maketecheasier.com/2013/10/kill-find-pid.png)

例如,要kill掉Chrome,我会运行命令:

    kill -9 3629

也可以在同一时间kill多个进程.

    kill -9 PID1 PID2 PID 3

**PKill**

"pkill"命令允许使用扩展的正则表达式和其它匹配标准.你现在可以使用应用的进程名kill掉它们,取代了使用PID.例如,kill Firefox浏览器,只需要运行命令:

    pkill firefox

匹配正则表达式,你可以输入部分进程名,比如:

    pkill fire

为了避免kill掉错误的进程,你应该用一下"pgrep -l [进程名]"列表来匹配进程.

![](http://i0.wp.com/imagecdn5.maketecheasier.com/2013/10/kill-pgrep-command.png)

**Killall**

killall同样使用进程名替代PID,并且它会kill掉所有的同名进程.例如,如果你正在运行多个Firefox浏览器的instances(实例),可以用命令把它们全部kill掉:

    killall firefox

在Gnome,你可以重启Nautilus,使用这个命令:

    killall nautilus

**xkill**

xkill 是图形方式kill一个应用.当你在终端键入"xkill",你的光标将立刻变成一个"十字".你必须在失常的应用上点击一下,它就会立刻kill掉这个应用.如果你喜欢精简,你也可以添加一个[键盘快捷键来激活xkill][1].

**结论**

当app失常导致系统挂起的时候,它非常有诱惑力相比于重启计算机并且再一次开启所有的会话.有了这些"kill"命令,你将能够更好的管理失常的应用避免导致系统崩溃.当你不想一个失常的进程带来服务器荡机时,它尤其的有用.

--------------------------------------------------------------------------------

via: http://www.maketecheasier.com/kill-command-in-linux/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[flsf](https://github.com/flsf) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://www.maketecheasier.com/quick-tips/kill-unresponsive-application-in-ubuntu/
