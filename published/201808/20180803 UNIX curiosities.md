UNIX 的怪东西
======

最近我在用我编写的各种工具做更多 UNIX 下的事情，我遇到了两个有趣的问题。这些都不是 “bug”，而是我没想到的行为。

### 线程安全的 printf

我有一个 C 程序从磁盘读取一些图像，进行一些处理，并将有关这些图像的输出写入 STDOUT。伪代码：

```
for(imagefilename in images)
{
    results = process(imagefilename);
    printf(results);
}
```

对于每个图像都是独立处理的，因此我自然希望将处理任务分配在各个 CPU 之间以加快速度。我通常使用 `fork()`，所以我写了这个：

```
for(child in children)
{
    pipe = create_pipe();
    worker(pipe);
}

// main parent process
for(imagefilename in images)
{
    write(pipe[i_image % N_children], imagefilename)
}

worker()
{
    while(1)
    {
        imagefilename = read(pipe);
        results = process(imagefilename);
        printf(results);
    }
}
```

这是正常的做法：我为 IPC 创建管道，并通过这些管道给子进程 worker 发送图像名。每个 worker _能够_通过另一组管道将其结果写回主进程，但这很痛苦，所以每个 worker 都直接写入共享 STDOUT。这工作正常，但正如人们所预料的那样，对 STDOUT 的写入发生冲突，因此各种图像的结果最终会混杂在一起。那很糟糕。我不想自己设置个锁，但幸运的是 GNU libc 为它提供了函数：[flockfile()][1]。我把它们放进去了……但是没有用！为什么？因为 `flockfile()` 最终因为 `fork()` 的写时复制行为而被限制在单个子进程中。即 `fork()`提供的额外安全性（与线程相比），这实际上最终破坏了锁。

我没有尝试使用其他锁机制（例如 pthread 互斥锁），但我可以想象它们会遇到类似的问题。我想保持简单，所以将输出发送回父输出是不可能的：这给程序员和运行程序的计算机制造了更多的工作。

解决方案：使用线程而不是 `fork()`。这有制造冗余管道的好的副作用。最终的伪代码：

```
for(children)
{
    pthread_create(worker, child_index);
}
for(children)
{
    pthread_join(child);
}

worker(child_index)
{
    for(i_image = child_index; i_image < N_images; i_image += N_children)
    {
        results = process(images[i_image]);
        flockfile(stdout);
        printf(results);
        funlockfile(stdout);
    }
}
```

这更简单，如预期的那样工作。我猜有时线程更好。

### 将部分读取的文件传递给子进程

对于各种 [vnlog][2] 工具，我需要实现这个操作序列：

1. 进程打开一个关闭 `O_CLOEXEC` 标志的文件
2. 进程读取此文件的一部分（在 vnlog 的情况下直到图例的末尾）
3. 进程调用 `exec()` 以调用另一个程序来处理已经打开的文件的其余部分

第二个程序可能需要命令行中的文件名而不是已打开的文件描述符，因为第二个程序可能自己调用 `​​open()`。如果我传递文件名，这个新程序将重新打开文件，然后从头开始读取文件，而不是从原始程序停止的位置开始读取。在我的程序上不可以这样做，因此将文件名传递给第二个程序是行不通的。

所以我真的需要以某种方式传递已经打开的文件描述符。我在使用 Linux（其他操作系统可能在这里表现不同），所以我理论上可以通过传递 `/dev/fd/N` 而不是文件名来实现。但事实证明这也不起作用。在 Linux上（再说一次，也许是特定于 Linux）对于普通文件 `/dev/fd/N` 是原始文件的符号链接。所以这最终做的是与传递文件名完全相同的事情。

但有一个临时方案！如果我们正在读取管道而不是文件，那么没有什么可以符号链接，并且 `/dev/fd/N` 最终将原始管道传递给第二个进程，然后程序正常工作。我可以通过将上面的 `open("filename")` 更改为 `popen("cat filename")` 之类的东西来伪装。呸！这真的是我们所能做到最好的吗？这在 BSD 上看上去会怎么样？


--------------------------------------------------------------------------------

via: http://notes.secretsauce.net/notes/2018/08/03_unix-curiosities.html

作者：[Dima Kogan][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://notes.secretsauce.net/
[1]:https://www.gnu.org/software/libc/manual/html_node/Streams-and-Threads.html
[2]:http://www.github.com/dkogan/vnlog
