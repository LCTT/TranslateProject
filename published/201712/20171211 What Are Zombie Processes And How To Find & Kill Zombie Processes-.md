什么是僵尸进程，如何找到并杀掉僵尸进程？
======

 [![What Are Zombie Processes And How To Find & Kill Zombie Processes？](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/what-are-the-zombie-processes_orig.jpg)][1] 

如果你经常使用 Linux，你应该遇到这个术语“<ruby>僵尸进程<rt>Zombie Processes</rt></ruby>”。 那么什么是僵尸进程？ 它们是怎么产生的？ 它们是否对系统有害？ 我要怎样杀掉这些进程？ 下面将会回答这些问题。

### 什么是僵尸进程？

我们都知道进程的工作原理。我们启动一个程序，开始我们的任务，然后等任务结束了，我们就停止这个进程。 进程停止后， 该进程就会从进程表中移除。

你可以通过 `System-Monitor` 查看当前进程。

 [![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/linux-check-zombie-processes_orig.jpg)][2] 

但是，有时候有些程序即使执行完了也依然留在进程表中。

那么，这些完成了生命周期但却依然留在进程表中的进程，我们称之为 “僵尸进程”。

### 它们是如何产生的？

当你运行一个程序时，它会产生一个父进程以及很多子进程。 所有这些子进程都会消耗内核分配给它们的内存和 CPU 资源。

这些子进程完成执行后会发送一个 Exit 信号然后死掉。这个 Exit 信号需要被父进程所读取。父进程需要随后调用 `wait` 命令来读取子进程的退出状态，并将子进程从进程表中移除。

若父进程正确第读取了子进程的 Exit 信号，则子进程会从进程表中删掉。

但若父进程未能读取到子进程的 Exit 信号，则这个子进程虽然完成执行处于死亡的状态，但也不会从进程表中删掉。

### 僵尸进程对系统有害吗？

**不会**。由于僵尸进程并不做任何事情， 不会使用任何资源也不会影响其它进程， 因此存在僵尸进程也没什么坏处。 不过由于进程表中的退出状态以及其它一些进程信息也是存储在内存中的，因此存在太多僵尸进程有时也会是一些问题。

**你可以想象成这样：** 

“你是一家建筑公司的老板。你每天根据工人们的工作量来支付工资。 有一个工人每天来到施工现场，就坐在那里， 你不用付钱， 他也不做任何工作。 他只是每天都来然后呆坐在那，仅此而已！”

这个工人就是僵尸进程的一个活生生的例子。**但是**， 如果你有很多僵尸工人， 你的建设工地就会很拥堵从而让那些正常的工人难以工作。

### 那么如何找出僵尸进程呢？

打开终端并输入下面命令:

```
ps aux | grep Z
```

会列出进程表中所有僵尸进程的详细内容。

### 如何杀掉僵尸进程？

正常情况下我们可以用 `SIGKILL` 信号来杀死进程，但是僵尸进程已经死了， 你不能杀死已经死掉的东西。 因此你需要输入的命令应该是

```
kill -s SIGCHLD pid
```

将这里的 pid 替换成父进程的进程 id，这样父进程就会删除所有以及完成并死掉的子进程了。

**你可以把它想象成：** 

"你在道路中间发现一具尸体，于是你联系了死者的家属，随后他们就会将尸体带离道路了。"

不过许多程序写的不是那么好，无法删掉这些子僵尸（否则你一开始也见不到这些僵尸了）。 因此确保删除子僵尸的唯一方法就是杀掉它们的父进程。

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/what-are-zombie-processes-and-how-to-find-kill-zombie-processes

作者：[linuxandubuntu][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/home/what-are-zombie-processes-and-how-to-find-kill-zombie-processes
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/linux-check-zombie-processes_orig.jpg
