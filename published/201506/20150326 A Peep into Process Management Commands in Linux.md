12个进程管理命令介绍
================================================================================
执行中的程序在称作进程。当程序以可执行文件存放在存储中，并且运行的时候，每个进程会被动态得分配系统资源、内存、安全属性和与之相关的状态。可以有多个进程关联到同一个程序，并同时执行不会互相干扰。操作系统会有效地管理和追踪所有运行着的进程。

为了管理这些进程，用户应该能够：

- 查看所有运行中的进程
- 查看进程消耗资源
- 定位个别进程并且对其执行指定操作
- 改变进程的优先级
- 杀死指定进程
- 限制进程可用的系统资源等

Linux提供了许多命令来让用户来高效掌控上述的操作。接下来，一个一个的来讲解下。

### 1. ps ###

'ps'是Linux 中最基础的浏览系统中的进程的命令。能列出系统中运行的进程，包括进程号、命令、CPU使用量、内存使用量等。下述选项可以得到更多有用的消息。

    ps -a - 列出所有运行中/激活进程

![Output of "ps -a" command](http://blog.linoxide.com/wp-content/uploads/2015/02/ps-a2.png)

    ps -ef |grep - 列出需要进程
    ps -aux - 显示进程信息，包括无终端的（x）和针对用户（u）的进程：如USER, PID, %CPU, %MEM等

### 2. pstree ###

linux中，每一个进程都是由其父进程创建的。此命令以可视化方式显示进程，通过显示进程的树状图来展示进程间关系。如果指定了pid了，那么树的根是该pid，不然将会是init（pid： 1）。

![pstree](http://blog.linoxide.com/wp-content/uploads/2015/02/pstree.png)

### 3. top ###

‘top’是一个更加有用的命令，可以监视系统中不同的进程所使用的资源。它提供实时的系统状态信息。显示进程的数据包括 PID、进程属主、优先级、%CPU、%memory等。可以使用这些显示指示出资源使用量。

![top](http://blog.linoxide.com/wp-content/uploads/2015/02/top.png)

### 4. htop ###

htop与top很类似，但是htop是交互式的文本模式的进程查看器。它通过文字图形化地显示每一个进程的CPU和内存使用量、swap使用量。使用上下光标键选择进程，F7和F8改变优先级，F9杀死进程。Htop不是系统默认安装的，所以需要额外安装。

![htop output](http://blog.linoxide.com/wp-content/uploads/2015/03/htop1.png)

### 5. nice ###

通过nice命令的帮助，用户可以设置和改变进程的优先级。提高一个进程的优先级，内核会分配更多CPU时间片给这个进程。默认情况下，进程以0的优先级启动。进程优先级可以通过top命令显示的NI（nice value）列查看。

进程优先级值的范围从-20到19。值越低，优先级越高。

    nice <优先值> <进程名> - 通过给定的优先值启动一个程序

![nice command](http://blog.linoxide.com/wp-content/uploads/2015/02/nice-cmd.png)

![changed nice value of 'top'](http://blog.linoxide.com/wp-content/uploads/2015/02/top-nice.png)

上述命令例子中，可以看到‘top’命令获得了-3的优先值。

### 6. renice ###

renice命令类似nice命令。使用这个命令可以改变正在运行的进程优先值。注意，用户只能改变属于他们自己的进程的优先值。

    renice -n -p - 改变指定进程的优先值

![renice command](http://blog.linoxide.com/wp-content/uploads/2015/02/renice2.png)

初始优先值为0的3806号进程优先值已经变成了4.

    renice -u -g - 通过指定用户和组来改变进程优先值

![output of renice for a user group](http://blog.linoxide.com/wp-content/uploads/2015/02/renice1.png)

上述例子中，用户为‘mint’的所有进程优先值变为‘-3’。

### 7. kill ###

这个命令用于发送信号来结束进程。如果一个进程没有响应杀死命令，这也许就需要强制杀死，使用-9参数来执行。注意，使用强制杀死的时候一定要小心，因为进程没有时机清理现场，也许写入文件没有完成。如果我们不知道进程PID或者打算用名字杀死进程时候，killall就能派上用场。

    kill <pid>

    kill -9 <pid>

    killall -9 - 杀死所有拥有同样名字的进程

如果你使用kill，你需要知道进程ID号。pkill是类似的命令，但使用模式匹配，如进程名，进程拥有者等。

    pkill <进程名>

![kill initiated](http://blog.linoxide.com/wp-content/uploads/2015/02/kill-initiated.png)

![kill](http://blog.linoxide.com/wp-content/uploads/2015/02/kill.png)

### 8. ulimit ###

该命令用于控制系统资源在shell和进程上的分配量。对于系统管理员是最有用的，可以管理重度使用和存在性能问题的系统。限制资源大小可以确保重要进程持续运行，其他进程不会占用过多资源。

    ulimit -a - 显示当前用户关联的资源限制

![ulimit -a](http://blog.linoxide.com/wp-content/uploads/2015/02/ulimit-a.png)

    -f - 最大文件尺寸大小

    -v - 最大虚拟内存大小（KB）

    -n - 增加最大文件描述符数量

    -H : 改变和报告硬限制

    -S : 改变和报告软限制

浏览ulimit man页面获取更多选项。

### 9. w ###

w 提供当前登录的用户及其正在执行的进程的信息。显示信息头包含信息，如当前时间、系统运行时长、登录用户总数、过去的1，5，15分钟内的负载均衡数。

基于这些用户信息，用户在终止不属于他们的进程时要小心。

!['w' command](http://blog.linoxide.com/wp-content/uploads/2015/02/w.png)

**who**是类似命令，提供当前登录用户列表、系统启动时间、运行级别等。

!['who' command](http://blog.linoxide.com/wp-content/uploads/2015/02/who.png)

**whoami** 命令输出当前用户ID

!['whoami' command](http://blog.linoxide.com/wp-content/uploads/2015/02/whoami.png)

### 10. pgrep ###

pgrep的意思是"进程号全局正则匹配输出"。该命令扫描当前运行进程，然后按照命令匹配条件列出匹配结果到标准输出。对于通过名字检索进程号是很有用。

    pgrep -u mint sh

这个命令将会显示用户为‘mint’和进程名为‘sh’的进程ID。

![output of pgrep](http://blog.linoxide.com/wp-content/uploads/2015/03/pgrep.png)

### 11. fg , bg ###

有时，命令需要很长的时间才能执行完成。对于这种情况，我们使用‘bg’命令可以将任务放在后台执行，而用‘fg’可以调到前台来使用。

我们可以通过‘&’在后台启动一个程序:

    find . -name *iso > /tmp/res.txt &

一个正在运行的程序也可以通过“CTRL+Z”和“bg”命令组合放到后台运行。

    find . -name *iso > /tmp/res.txt &     -  启动一个程序

    ctrl+z      -   挂起当前执行程序

    bg   -  将程序放到后台运行

我们可以使用‘jobs’命令列出所有后台进程。

    jobs

使用‘fg’命令可以将后台程序调到前台执行。

    fg %进程id

![output of fg, bg and jobscommands](http://blog.linoxide.com/wp-content/uploads/2015/03/fg-bg-jobs.png)

### 12. ipcs ###

ipcs命令报告进程间通信设施状态。（共享内存，信号量和消息队列）

用-p参数联合-m、-s或-q使用，可以获得相关的进程间通信的进程ID。

    ipcs -p -m

下面屏幕截图列出了最近访问了共享内存段的进程的创建者的ID和进程ID。

![ipcs command](http://blog.linoxide.com/wp-content/uploads/2015/03/ipcs.png)

### 总结 ###

总之 ，这些命令可以帮助管理员修复问题和改善性能。同样作为一名普通用户也需要解决进程出现的问题。所以，熟悉如此繁多的命令，从能有效管理进程是行之有效。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/process-management-commands-linux/

作者：[B N Poornima][a]
译者：[VicYu/Vic020](http://vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bnpoornima/
