五个你可能不了解的killall选项
================================================================================
Linux的命令行提供很多命令来杀死进程。比如，你可以向“kill”命传递一个PID来杀死进程；“pkill”命令使用一个正则表达式作为输入，所以和该模式匹配的进程都被杀死。

但是还有一个命令叫“killall”，默认情况下，它精确地匹配参数名，然后杀死匹配进程。在这篇文章中，我们将讨论有关这个命令的实际应用。

![](http://linoxide.com/wp-content/uploads/2014/02/killall-command.jpg)

### Linux 的 killall 命令 ###

killall命令可以用来给一个特定的进程发送一个信号。这个信号默认情况下是SIGTERM，但也可以由killall命令使用参数来指定其它信号。

现在让我们通过一些实际的例子来看看这个命令的实际用法。

#### 1. 基本示例 ####

在这个例子中，我们将使用killall来杀死特定进程。假如，有两个开头字符相同的进程：

    $ ps -aef | grep “test”
    himanshu 3969 2811 0 14:14 pts/0 00:00:00 ./test
    himanshu 3970 2811 0 14:14 pts/0 00:00:00 ./test_again

如何杀死“test_again”进程呢？

    $ killall test_again
    [2]+ Terminated ./test_again

如你所见，killall命令终止了“test_again”进程。你可以通过ps命令来确认这个事实：

    $ ps -aef | grep “test”
    himanshu 3969 2811 0 14:14 pts/0 00:00:00 ./test

你可以观察到“test_again”没有被显示出来，因为它已经被杀死了。

#### 2. 使用 -I 选项忽略大小写 ####

默认情况下，killall命令是大小写敏感的。例如：

    $ ps -aef | grep “test”
    himanshu 4177 3161 0 14:54 pts/3 00:00:00 ./test
    himanshu 4178 3161 0 14:54 pts/3 00:00:00 ./test_again
    himanshu 4180 3161 0 14:54 pts/3 00:00:00 grep --color=auto test

    $ killall TEST
    TEST: no process found

你可以看到，killall命令找不到叫做“TEST”的进程，但是“test”进程是确确实实的在运行的。

来让killall命令忽略大小写，可以使用-I选项（大写i）。例如：

    $ killall -I TEST
    [1]- Terminated ./test

你可以观察到，现在你成功的终止了“test”进程。

#### 3. 使用 -i 选项交互式的终止进程 ####

killall命令可以用来终止多个进程。

    $ killall test test_again
    [2]- Terminated ./test_again
    [3]+ Terminated ./test

但是，如果你想要killall交互式地来终止进程，你可以使用-i选项。

这里是例子：

    $ killall -i test test_again
    Kill test(4201) ? (y/N) y
    Kill test_again(4202) ? (y/N) y
    [1]- Terminated ./test
    [2]+ Terminated ./test_again

你可以看到，用这种方式，在同时终止多个进程时，用户可以控制是否终止某一个进程。

#### 4. 使用 -q 选项关闭命令执行回显 ####

有些时候，当killall找不到指定的进程时，它就会像下面这样输出错误信息。

    $ killall TEST
    TEST: no process found

但是，当你想要killall执行地安安静静的话，你就可以使用-q选项：

    $ killall -q TEST
    $

如你所见，-q选项被使用之后，killall命令的输出信息就被抑制了。

#### 5. 使用-l选项列出所有支持的信号（signal) ####

如之前描述的一样，killall向进程发送信号。

你可以使用-s选项（后面跟一个信号名）来向一个进程发送特殊信号。

想要知道所有可以发送的信号，可以使用-l选项（小写L）来获取：

    $ killall -l
    HUP INT QUIT ILL TRAP ABRT IOT BUS FPE KILL USR1 SEGV USR2 PIPE ALRM TERM
    STKFLT CHLD CONT STOP TSTP TTIN TTOU URG XCPU XFSZ VTALRM PROF WINCH IO PWR SYS
    UNUSED

killall支持上面的所有信号。

看着这些信号的名字，可能你心里就会嘀咕：这些信号都是干什么的？

译者注：使用下面的命令来获取所有信号的说明：

   $ man 7 signal

### 我需要和大家讨论一件事情 ###

killall命令的man说：假如进程的名字的长度小于等于15，默认情况下就会以完整名称匹配。

比如，假设有两个名字很长的进程：

    $ ps -aef | grep “test”
    himanshu 4021 3161 0 14:27 pts/3 00:00:00 ./test_abcdefghij
    himanshu 4035 3161 0 14:27 pts/3 00:00:00 ./test_abcdefgh

第一个进程的名字有15个字符。现在，让我们试着使用killall杀死这个进程：

    $ killall test_abcdefghij
    [1]- Terminated ./test_abcdefghij

如你所见，killall命令成功杀死了这个进程。

假如，两个进程的名字都超过15个字符，根据man，killall将把两个进程全部杀死。比如：

    $ ps -aef | grep “test”
    himanshu 4114 3161 0 14:40 pts/3 00:00:00 ./test_abcdefghijklmnopqrstuvwx
    himanshu 4141 3161 0 14:46 pts/3 00:00:00 ./test_abcdefghijklmnopqrstuvwxyz
    himanshu 4143 3161 0 14:46 pts/3 00:00:00 grep --color=auto test

你可以观察到，两个进程的名字都超过15个字符。现在，当我使用killall试着杀死第二个进程时：

    $ killall test_abcdefghijklmnopqrstuvwxyz
    [6]+ Terminated ./test_abcdefghijklmnopqrstuvwxyz

它只杀死了指定的进程，另一个则没有被杀死。

    $ ps -aef | grep “test”
    himanshu 4114 3161 0 14:40 pts/3 00:00:00 ./test_abcdefghijklmnopqrstuvwx
    himanshu 4146 3161 0 14:47 pts/3 00:00:00 grep --color=auto test

我不太确定，是我进行的尝试中有不对的地方，还是这是killall的一个bug。假如你在评论中写上你的观点，我会非常感激。

顺便说一下，这是我机器上killall命令的版本信息：

    $ killall --version
    killall (PSmisc) 22.20
    Copyright (C) 1993-2012 Werner Almesberger and Craig Small

    PSmisc comes with ABSOLUTELY NO WARRANTY.
    This is free software, and you are welcome to redistribute it under
    the terms of the GNU General Public License.
    For more information about these matters, see the files named COPYING.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-killall-my-options/

译者：[intermerlin](https://github.com/intermerlin) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
