难以置信！ 30个top命令示例以及截图
================================================================================
Linux中的top命令显示系统上正在运行的进程。它是系统管理员最重要的工具之一。被广泛用于监视服务器的负载。在本篇中，我们会探索top命令的细节。top命令是一个交互命令。在运行top的时候还可以运行很多命令。我们也会探索这些命令。

### 1. Top 命令输出: ###

首先，让我们理解一下输出。top命令会显示系统的很多信息。我们需要理解不同部分输出的意义：默认运行，top命令会显示如下输出：


![Top default display](http://linoxide.com/wp-content/uploads/2013/11/01.top_default.png)

First few lines are horizontal showing summary about different system 前几行水平显示了不同系统参数的概括，接下来是进程和它们在列中的属性。

#### 1.1 系统运行时间和平均负载： ####

![Uptime display](http://linoxide.com/wp-content/uploads/2013/11/02.top_uptime.png)

top命令的顶部显示与uptime命令相似的输出。

这些字段显示：

- 当前时间
- 系统运行的时间
- 登陆用户的数量
- 相应最近5、10和15分钟内的平均负载。

无法使用'l'命令触发uptime的显示。

#### 1.2 任务: ####

![Task summary](http://linoxide.com/wp-content/uploads/2013/11/03.top_tasks.png)

第二行显示的是任务或者进程的总结。进程可以在不同的状态。他显示了全部进程的数量。除此之外，还有正在运行、睡眠、停止、僵尸进程的数量(僵尸是一种进程的状态，这些进程概括可以用't'触发)。

#### 1.3 CPU 状态: ####

![CPU status display](http://linoxide.com/wp-content/uploads/2013/11/04.top_cpu_states.png)

下一行显示的是CPU状态。 这里显示了不同模式下的CPU时间 %age。这些不同的CPU时间表示:

- us, user： 运行(未调整优先级的) 用户进程的CPU时间
- sy，system: 运行内核进程的CPU时间
- ni，niced：运行已调整优先级的用户进程的CPU时间
- wa，IO wait: 用于等会IO完成的CPU时间
- hi：处理硬件中断的CPU时间
- si: 处理软件中断的CPU时间
- st：被hypervisor偷去用于vm的CPU时间。

这个无法使用't'命令触发。

#### 1.4 内存使用: ####

![Memory usage](http://linoxide.com/wp-content/uploads/2013/11/05.top_mem_usage.png)

接下来两行显示内存使用率，有点像'free'命令。第一行是物理内存使用，第二行是虚拟内存使用(交换空间)。

物理内存显示如下:全部可用内存、已使用内存、空闲内存、缓冲内存。相似地：交换反映的是：全部、已使用、空闲和缓冲交换空间。内存显示可以用'm'命令触发。

#### 1.5 字段/列: ####

![Top columns](http://linoxide.com/wp-content/uploads/2013/11/06.top_fields.png)

在水平的系统属性和状态后，下面是以列显示的进程。不同的列代表下面要讨论的不同的属性。

默认上，top显示这些关于进程的属性。

**PID**
进程ID，进程的唯一标识符

**USER**
进程所有者的实际用户名。

**PR**
进程的调度优先级。这个字段的一些值是'rt'。这意味这这些进程运行在实时态。

**NI**
进程的nice值。低的值意味这更高的优先级。

**VIRT**
进程使用的虚拟内存。

**RES**
驻留内存大小。驻留内存是任务使用的非交换物理内存大小。

**SHR**
SHR是进程使用的共享内存。

**S**
这个是进程的状态。它有以下不同的值:

- D - 不可中断的睡眠态。
- R – 运行态
- S – 睡眠态
- T – 被追踪或已停止
- Z – 僵尸态

**%CPU**
自从上一次更新时到现在任务所使用的CPU时间百分比。

**%MEM**
进程使用的可用物理内存百分比。

**TIME+**
任务启动后到现在所使用的全部CPU时间，精确到百分之一秒。

**COMMAND**
运行进程所使用的命令。

还有许多在默认情况下不会显示的输出，它们可以显示进程的页错误、有效组和组ID和其他更多的信息。

### 2. 交互命令: ###

我们之前讨论过top是一个交互命令。上一章我们已经遇到了一些命令。这里我们会探索更多的命令。

#### 2.1 ‘h’: 帮助 ####

首先，我们可以用'h'或者'?'显示交互命令的帮助菜单。

![Help options](http://linoxide.com/wp-content/uploads/2013/11/07.top_help.png)

#### 2.2 ‘<ENTER>’ 或者 ‘<SPACE>’: 刷新显示 ####

top命令默认在一个特定间隔(3秒)后刷新显示。要手动刷新，用户可以输入回车或者空格。

#### 2.3 A: 触发交替显示模式 ####

这个命令在全屏和交替模式间切换。在交替模式下会显示4个窗口:


1. Def
2. Job
3. Mem
4. Usr

四个字段都有唯一独立的可配置的概括区域和它自i就的任务驱动。4个窗口中只有一个窗口会成为当前窗口。当前窗口显示在左上方。

![Alternative display mode](http://linoxide.com/wp-content/uploads/2013/11/08.top_alternative_display.png)

我们可以用'a'和'w'在4个 窗口间切换。'a'移到后一个窗口，'w'移到前一个窗口。用'g'命令你可以输入一个数字来选择当前窗口。

![Window selection in alternative display](http://linoxide.com/wp-content/uploads/2013/11/09.top_alternate_window_selection.png)

#### 2.4 B: 触发粗体显示 ####

Some important information is shown in bold characters. This command toggles use of bold.
一些重要信息会以加粗字体显示。这个命令触发使用粗体。

![Bold off](http://linoxide.com/wp-content/uploads/2013/11/10.top_bold_display_off.png)

#### 2.5 ‘d’ or ‘s’: 设置显示的时间间隔 ####

当按下'd'或's'时，你将被提示输入一个值（以秒为单位），它会以设置的值作为显示间隔。如果你这里输入了1, top将会每秒刷新。

![Display time interval](http://linoxide.com/wp-content/uploads/2013/11/11.top_display_time_interval.png)

#### 2.6 ‘l’、‘t’、‘m’: 触发负载、任务、内存信息 ####

这会相应地触发平均负载、任务/CPU状态和内存信息。

![Load average off](http://linoxide.com/wp-content/uploads/2013/11/12.top_load_average_display_off.png)

![CPU summary off](http://linoxide.com/wp-content/uploads/2013/11/13.top_cpu_display_off.png)

![Memory and swap usage off](http://linoxide.com/wp-content/uploads/2013/11/14.top_mem_display_off.png)

![All three displays off](http://linoxide.com/wp-content/uploads/2013/11/15.top_all_three_display_off.png)

#### 2.7 ‘f’: 字段管理 ####

用于选择你想要显示的字段。用'*'标记的是已选择的。

![Managing columns](http://linoxide.com/wp-content/uploads/2013/11/16.top_field_management.png)

‘<’ and ‘>’
'<'移动已排序的字段到左边，'>'则移动到右边。

#### 2.8 ‘R’: 反向排序 ####

触发反向/常规排序。

#### 2.9 ‘c’: 触发命令 ####

触发显示进程启动时的完整路径和程序名。

![Full command path](http://linoxide.com/wp-content/uploads/2013/11/17.top_command_name_displayed.png)

#### 2.10 ‘i’: Idle Tasks ####

触发空闲任务。

![Idle task display off](http://linoxide.com/wp-content/uploads/2013/11/18.top_idle_tasks_off.png)

#### 2.11 ‘V’: 树试图 ####

触发树视图。

![Forest view of tasks](http://linoxide.com/wp-content/uploads/2013/11/19.top_forest_view.png)

#### 2.12 ‘Z’: 改变颜色映射 ####

按下'Z'向用户显示一个top命令的输出颜色可以改变的屏幕。这里有8个任务区域和8种颜色。

![Customizing colors](http://linoxide.com/wp-content/uploads/2013/11/20.top_color_selection.png)

下面显示的是4中颜色显示的top视图。

![Colored display](http://linoxide.com/wp-content/uploads/2013/11/21.top_colored.png)

#### 2.13 ‘z’: 触发彩色 ####

触发彩色，即打开或关闭彩色显示。

#### 2.14 ‘x’ 或者 ‘y’ ####

触发高亮：'x'排序字段;'y'运行进程。依赖于你的显示设置，你可能需要让输出彩色画来通知这些高亮。

![X and Y highlighted](http://linoxide.com/wp-content/uploads/2013/11/22.top_x_y_displayed.png)

#### 2.15 ‘u’: 用户的进程 ####

显示特定用户的进程。你会被提示输入用户名。空白将会显示全部用户。

![Processes of 'raghu' user](http://linoxide.com/wp-content/uploads/2013/11/23.top_raghu_processes.png)

#### 2.16 ‘n’ or ‘#’: 任务的数量 ####

设置最大显示的任务数量

![Setting number of tasks displayed](http://linoxide.com/wp-content/uploads/2013/11/24.top_10_processes.png)

#### 2.17 ‘k’: 结束任务 ####

top命令中最重要的一个命令。用于发送信号给任务(通常是结束任务)。

![Killing a task](http://linoxide.com/wp-content/uploads/2013/11/25.top_kill_task.png)

#### 2.18 ‘r’: 重新调整优先级 ####

重新调整一个任务的调度优先级。

### 3. 命令行选项: ###

大多数这些命令行选项与上面讨论的命令相同。top的输出可以用命令交互操作。但是你可以带参数运行top来设置你想要的。

#### 3.1 -b: 批处理模式 ####

-b选项以批处理模式启动top命令。当你想要在文件中保存输出时是很有用的。

#### 3.2 -c: 命令/程序名 触发: ####

如上面所讨论到的命令，这个选项会以上次记住的程序/命令显示的状态显示。

#### 3.3 -d: 设置延迟间隔 ####

设置top的显示间隔(以秒计)。比如。

    $ top -d 1 

将会以1s的时间间隔启动top

#### 3.4 -i: 空闲进程触发 ####

这个选项设置top命令的上一次记住的相反的'i'状态。

#### 3.5 -n: 设置迭代数量 ####

用-n选项，你可以设置top退出前迭代的次数。

    $ top -n 3 

将会在3次输出后退出。

#### 3.6 -p: 监控特定的PID ####

你可以用-p选项监控指定的PID。PID的值为0将被作为top命令自身的PID。

#### 3.7 -u or -U: 用户名 或者 UID ####

可以用这些选项浏览特定用户的进程。用户名或者UID可以在选项中指定。-p、-u和-U选项是互斥的。同时只可以使用这其中一个选项。当你试图组合使用这些选项时，你会得到一个错误:

    $ top -p 28453 -u raghu
    top: conflicting process selections (U/p/u) 

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-top-command-examples-screenshots/

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出