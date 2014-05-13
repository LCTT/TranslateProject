为什么 Linux 的 htop 命令优于 top 命令
================================================================================
在 Linux 系统中，top 命令用来显示系统中正在运行的进程的实时状态，它显示了像 CPU 利用情况、内存消耗情况，以及每个进程情况等十分有用的信息。你应该知道，与传统的 top 命令功能一样的，还存在另一个命令行工具 'htop'，但它有更加强大的功能及能显示更多的信息。这篇文章，我们会用实例来讨论这个 'htop' 命令。

### Linux 中的 htop 命令 ###

下面是从 htop 的手册页摘抄下来的相关描述: 

> 它类似于 top 命令，但可以让你在垂直和水平方向上滚动，所以你可以看到系统上运行的所有进程，以及他们完整的命令行。
> 
> 可以不用输入进程的 PID 就可以对此进程进行相关的操作 (killing, renicing)。 

### 首先明白它的输出 ###

**htop 命令**以典型的格式来显示信息。下面是 HTOP 的输出快照:

![htop](http://linoxide.com/wp-content/uploads/2014/01/htop.png)

如果你观察窗口的左上角部分，你会看到显示的是 CPU 负载、内存消耗及交换空间的实时信息，右上角包含的是任务、平均负载及系统运行时间的信息。

平均负载部分提供了三个数字，这仅仅表示的是过去的5分钟、10分钟和15分钟系统的平均负载而已，在单核的系统中，平均负载为1表示的是百分之百的 CPU 利用率。最后，运行时间 （uptime）标示的数字是从系统启动起到当前的运行总时间。

下面，我们将用例子来进一步讨论这个命令。

### 1. 用 F2 键编辑配置 ###

该 HTOP 命令提供了许多自定义选项，你所要做的就是从主窗口中按下 F2 键。

下面所示的是可用的自定义选项:

![htop-settings](http://linoxide.com/wp-content/uploads/2014/01/htop-settings.png)

只需使用箭头键选择和更改特定的设置。

### 2. 通过 F9 键发送信号 ###

The htop command provides you with a way through which you can easily send any signal to a process from within the htop window. All you have to do is to press F9.

![signals](http://linoxide.com/wp-content/uploads/2014/01/signals.png)

As you can see, the left part of the window now lists all the available signals, while the right part lists the processes. Just select and signal, then select a process, and then press enter to send the signal to the process.

### 3. Get a tree view of the processes ###

The htop command also provides a tree view of the processes. All you have to do is to press F5.

Here is an example of htop displaying information in a tree view :

![treeView](http://linoxide.com/wp-content/uploads/2014/01/treeView.png)

To come out of tree view, press the F5 key again.

### 4. Search Processes Through F3 key ###

The htop command provides an easy way to search processes. All you have to do is to press F3 key and a text box will appear at the bottom of the window.

Here is an example :

![search](http://linoxide.com/wp-content/uploads/2014/01/search1.png)

As you can see, a text prompt ‘Search’ appears at the bottom of the window. You can type the name of the process here and press enter to search it. If the htop command is able to find it, it will select the entry of that process in its output.

### 5. Colour Tag An Entry Through Space Key ###

In real-time view of processes running in the system, one of the main problem is to follow a process. This is because the entries keep on refreshing, and their order keeps on changing. The htop command provides an easy solution to this problem: Colour tagging. Yes, you can colour tag an entry so that it is displayed in a different colour, and hence becomes easy to follow.

To colour tag an entry, all you have to do is to select the entry and press ‘space’ key. For example, in the screen-shot below, I have colour tagged three entries :

![color-tag](http://linoxide.com/wp-content/uploads/2014/01/color-tag.png)

So this way, you can easily follow the process(es) you desire.

### 6. Command line options ###

Apart from the hot keys explained till now, the htop command also provides useful command line options. Some of them are :

- **-s Option** : To sort a particular column. For example, htop -s PID will sort the PID column output.
- **-u Option** : To display process information related to a particular user. For example, htop -u himanshu will display process information related to the user himanshu.
- **-d option** : To introduce delay between updates. For example, htop -d 100 will make sure that htop output updates after 1 sec (as the argument to -d is considered to be in tenths of seconds).

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-htop-command/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出