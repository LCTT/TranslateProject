[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10587-1.html)
[#]: subject: (And, Ampersand, and & in Linux)
[#]: via: (https://www.linux.com/blog/learn/2019/2/and-ampersand-and-linux)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

Linux 中的 &
======

> 这篇文章将了解一下 & 符号及它在 Linux 命令行中的各种用法。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ampersand.png?itok=7GdFO36Y)

如果阅读过我之前的三篇文章（[1][1]、[2][2]、[3][3]），你会觉得掌握连接各个命令之间的连接符号用法也是很重要的。实际上，命令的用法并不难，例如 `mkdir`、`touch` 和 `find` 也分别可以简单概括为“建立新目录”、“更新文件”和“在目录树中查找文件”而已。

但如果要理解

```
mkdir test_dir 2>/dev/null || touch images.txt && find . -iname "*jpg" > backup/dir/images.txt &
```

这一串命令的目的，以及为什么要这样写，就没有这么简单了。

关键之处就在于命令之间的连接符号。掌握了这些符号的用法，不仅可以让你更好理解整体的工作原理，还可以让你知道如何将不同的命令有效地结合起来，提高工作效率。

在这一篇文章和接下来的文章中，我会介绍如何使用 `&` 号和管道符号（`|`）在不同场景下的使用方法。

### 幕后工作

我来举一个简单的例子，看看如何使用 `&` 号将下面这个命令放到后台运行：

```
cp -R original/dir/ backup/dir/
```

这个命令的目的是将 `original/dir/` 的内容递归地复制到 `backup/dir/` 中。虽然看起来很简单，但是如果原目录里面的文件太大，在执行过程中终端就会一直被卡住。

所以，可以在命令的末尾加上一个 `&` 号，将这个任务放到后台去执行：

```
cp -R original/dir/ backup/dir/ &
```

任务被放到后台执行之后，就可以立即继续在同一个终端上工作了，甚至关闭终端也不影响这个任务的正常执行。需要注意的是，如果要求这个任务输出内容到标准输出中（例如 `echo` 或 `ls`），即使使用了 `&`，也会等待这些输出任务在前台运行完毕。

当使用 `&` 将一个进程放置到后台运行的时候，Bash 会提示这个进程的进程 ID。在 Linux 系统中运行的每一个进程都有一个唯一的进程 ID，你可以使用进程 ID 来暂停、恢复或者终止对应的进程，因此进程 ID 是非常重要的。

这个时候，只要你还停留在启动进程的终端当中，就可以使用以下几个命令来对管理后台进程：

  * `jobs` 命令可以显示当前终端正在运行的进程，包括前台运行和后台运行的进程。它对每个正在执行中的进程任务分配了一个序号（这个序号不是进程 ID），可以使用这些序号来引用各个进程任务。

    ```
 $ jobs
[1]- Running cp -i -R original/dir/* backup/dir/ &
[2]+ Running find . -iname "*jpg" > backup/dir/images.txt &
```
  * `fg` 命令可以将后台运行的进程任务放到前台运行，这样可以比较方便地进行交互。根据 `jobs` 命令提供的进程任务序号，再在前面加上 `%` 符号，就可以把相应的进程任务放到前台运行。

    ```
 $ fg %1 # 将上面序号为 1 的 cp 任务放到前台运行
cp -i -R original/dir/* backup/dir/
```
    如果这个进程任务是暂停状态，`fg` 命令会将它启动起来。
  * 使用 `ctrl+z` 组合键可以将前台运行的任务暂停，仅仅是暂停，而不是将任务终止。当使用 `fg` 或者 `bg` 命令将任务重新启动起来的时候，任务会从被暂停的位置开始执行。但 [sleep][4] 命令是一个特例，`sleep` 任务被暂停的时间会计算在 `sleep` 时间之内。因为 `sleep` 命令依据的是系统时钟的时间，而不是实际运行的时间。也就是说，如果运行了 `sleep 30`，然后将任务暂停 30 秒以上，那么任务恢复执行的时候会立即终止并退出。
  * `bg` 命令会将任务放置到后台执行，如果任务是暂停状态，也会被启动起来。

    ```
 $ bg %1
[1]+ cp -i -R original/dir/* backup/dir/ &
```

如上所述，以上几个命令只能在同一个终端里才能使用。如果启动进程任务的终端被关闭了，或者切换到了另一个终端，以上几个命令就无法使用了。

如果要在另一个终端管理后台进程，就需要其它工具了。例如可以使用 [kill][5] 命令从另一个终端终止某个进程：

```
kill -s STOP <PID>
```

这里的 PID 就是使用 `&` 将进程放到后台时 Bash 显示的那个进程 ID。如果你当时没有把进程 ID 记录下来，也可以使用 `ps` 命令（代表 process）来获取所有正在运行的进程的进程 ID，就像这样：

```
ps | grep cp
```

执行以后会显示出包含 `cp` 字符串的所有进程，例如上面例子中的 `cp` 进程。同时还会显示出对应的进程 ID：

```
$ ps | grep cp
14444 pts/3 00:00:13 cp
```

在这个例子中，进程 ID 是 14444，因此可以使用以下命令来暂停这个后台进程：

```
kill -s STOP 14444
```

注意，这里的 `STOP` 等同于前面提到的 `ctrl+z` 组合键的效果，也就是仅仅把进程暂停掉。

如果想要把暂停了的进程启动起来，可以对进程发出 `CONT` 信号：

```
kill -s CONT 14444
```

这个给出一个[可以向进程发出的常用信号][6]列表。如果想要终止一个进程，可以发送 `TERM` 信号：

```
kill -s TERM 14444
```

如果进程不响应 `TERM` 信号并拒绝退出，还可以发送 `KILL` 信号强制终止进程：

```
kill -s KILL 14444
```

强制终止进程可能会有一定的风险，但如果遇到进程无节制消耗资源的情况，这样的信号还是能够派上用场的。

另外，如果你不确定进程 ID 是否正确，可以在 `ps` 命令中加上 `x` 参数：

```
$ ps x| grep cp
14444 pts/3 D 0:14 cp -i -R original/dir/Hols_2014.mp4
  original/dir/Hols_2015.mp4 original/dir/Hols_2016.mp4
  original/dir/Hols_2017.mp4 original/dir/Hols_2018.mp4 backup/dir/
```

这样就可以看到是不是你需要的进程 ID 了。

最后介绍一个将 `ps` 和 `grep` 结合到一起的命令：

```
$ pgrep cp
8
18
19
26
33
40
47
54
61
72
88
96
136
339
6680
13735
14444
```

`pgrep` 可以直接将带有字符串 `cp` 的进程的进程 ID 显示出来。

可以加上一些参数让它的输出更清晰：

```
$ pgrep -lx cp
14444 cp
```

在这里，`-l` 参数会让 `pgrep` 将进程的名称显示出来，`-x` 参数则是让 `pgrep` 完全匹配 `cp` 这个命令。如果还想了解这个命令的更多细节，可以尝试运行 `pgrep -ax`。

### 总结

在命令的末尾加上 `&` 可以让我们理解前台进程和后台进程的概念，以及如何管理这些进程。

在 UNIX/Linux 术语中，在后台运行的进程被称为<ruby>守护进程<rt>daemon</rt></ruby>。如果你曾经听说过这个词，那你现在应该知道它的意义了。

和其它符号一样，`&` 在命令行中还有很多别的用法。在下一篇文章中，我会更详细地介绍。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/2/and-ampersand-and-linux

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10465-1.html
[2]: https://linux.cn/article-10502-1.html
[3]: https://linux.cn/article-10529-1.html
[4]: https://ss64.com/bash/sleep.html
[5]: https://bash.cyberciti.biz/guide/Sending_signal_to_Processes
[6]: https://www.computerhope.com/unix/signals.htm

