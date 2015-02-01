10个重要的Linux ps命令实战
================================================================================
Linux作为Unix的衍生操作系统，Linux内建有查看当前进程的工具。这个工具能在命令行中使用。

### PS 命令是什么 ###

查看它的man手册可以看到，ps命令能够给出当前系统中进程的快照。它能捕获系统在某一事件的进程状态。如果你想不断更新查看的这个状态，可以使用top命令。

ps命令支持三种使用的语法格式

1. UNIX 风格，选项可以组合在一起，并且选项前必须有“-”连字符
2. BSD 风格，选项可以组合在一起，但是选项前不能有“-”连字符
3. GNU 风格的长选项，选项前有两个“-”连字符

我们能够混用这几种风格，但是可能会发生冲突。本文使用 UNIX 风格的ps命令。这里有在日常生活中使用较多的ps命令的例子。

### 1. 不加参数执行ps命令 ###

这是一个基本的 **ps** 使用。在控制台中执行这个命令并查看结果。

![不加选项执行ps命令](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_no_options.png)

结果默认会显示4列信息。

- PID: 运行着的命令(CMD)的进程编号
- TTY: 命令所运行的位置（终端）
- TIME: 运行着的该命令所占用的CPU处理时间
- CMD: 该进程所运行的命令

这些信息在显示时未排序。

### 2. 显示所有当前进程 ###

使用 **-a** 参数。**-a 代表 all**。同时加上x参数会显示没有控制终端的进程。

    $ ps -ax

这个命令的结果或许会很长。为了便于查看，可以结合less命令和管道来使用。

    $ ps -ax | less

![ps all 信息](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_ax.png)

### 3. 根据用户过滤进程 ###

在需要查看特定用户进程的情况下，我们可以使用 **-u** 参数。比如我们要查看用户'pungki'的进程，可以通过下面的命令：

    $ ps -u pungki

![通过用户过滤](http://blog.linoxide.com/wp-content/uploads/2014/10/ps__u.png)

### 4. 通过cpu和内存使用来过滤进程 ###

也许你希望把结果按照 CPU 或者内存用量来筛选，这样你就找到哪个进程占用了你的资源。要做到这一点，我们可以使用 **aux 参数**，来显示全面的信息:

    $ ps -aux | less

![显示全面信息](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_aux.png)

当结果很长时，我们可以使用管道和less命令来筛选。

默认的结果集是未排好序的。可以通过 **--sort**命令来排序。

根据 **CPU 使用**来升序排序

    $ ps -aux --sort -pcpu | less

![根据cpu使用排序](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_aux_sort_cpu.png)

根据 **内存使用** 来升序排序

    $ ps -aux --sort -pmem | less

![根据内存使用来排序](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_aux_sort_mem.png)

我们也可以将它们合并到一个命令，并通过管道显示前10个结果：

    $ ps -aux --sort -pcpu,+pmem | head -n 10

### 5. 通过进程名和PID过滤 ###

使用 **-C 参数**，后面跟你要找的进程的名字。比如想显示一个名为getty的进程的信息，就可以使用下面的命令：

    $ ps -C getty

![通过进程名和PID过滤](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_C.png)

如果想要看到更多的细节，我们可以使用-f参数来查看格式化的信息列表：

    $ ps -f -C getty

![通过进程名和PID过滤](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_C_f.png)

### 6. 根据线程来过滤进程 ###

如果我们想知道特定进程的线程，可以使用**-L 参数**，后面加上特定的PID。

    $ ps -L 1213

![根据线程来过滤进程](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_L.png)

### 7. 树形显示进程 ###

有时候我们希望以树形结构显示进程，可以使用 **-axjf** 参数。

    $ps -axjf

![树形显示进程](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_axjf.png)

或者可以使用另一个命令。

    $ pstree

![树形显示进程](http://blog.linoxide.com/wp-content/uploads/2014/10/pstree.png)

### 8. 显示安全信息 ###

如果想要查看现在有谁登入了你的服务器。可以使用ps命令加上相关参数:

    $ ps -eo pid,user,args

**参数 -e** 显示所有进程信息，**-o 参数**控制输出。**Pid**,**User 和 Args**参数显示**PID，运行应用的用户**和**该应用**。

![显示安全信息](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_security_1.png)

能够与**-e 参数** 一起使用的关键字是**args, cmd, comm, command, fname, ucmd, ucomm, lstart, bsdstart 和 start**。

### 9. 格式化输出root用户（真实的或有效的UID）创建的进程 ### 

系统管理员想要查看由root用户运行的进程和这个进程的其他相关信息时，可以通过下面的命令:

    $ ps -U root -u root u

**-U 参数**按真实用户ID(RUID)筛选进程，它会从用户列表中选择真实用户名或 ID。真实用户即实际创建该进程的用户。

**-u** 参数用来筛选有效用户ID（EUID）。

最后的**u**参数用来决定以针对用户的格式输出，由**User, PID, %CPU, %MEM, VSZ, RSS, TTY, STAT, START, TIME 和 COMMAND**这几列组成。

这里有上面的命令的输出结果：

![show real and effective User ID](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_root_real_effective_ID.png)

### 10. 使用PS实时监控进程状态 ###

ps 命令会显示你系统当前的进程状态，但是这个结果是静态的。

当有一种情况，我们需要像上面第四点中提到的通过CPU和内存的使用率来筛选进程，并且我们希望结果能够每秒刷新一次。为此，我们可以**将ps命令和watch命令结合起来**。

    $ watch -n 1 ‘ps -aux --sort -pmem, -pcpu’

![组合 ps 和 watch](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_watch_1.png)

如果输出太长，我们也可以限制它，比如前20条，我们可以使用**head**命令来做到。

    $ watch -n 1 ‘ps -aux --sort -pmem, -pcpu | head 20’

![组合 ps 和 watch](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_watch_2.png)

这里的动态查看并不像top或者htop命令一样。**但是使用ps的好处是**你能够定义显示的字段，你能够选择你想查看的字段。

举个例子，**如果你只需要看名为'pungki'用户的信息**，你可以使用下面的命令：

    $ watch -n 1 ‘ps -aux -U pungki u --sort -pmem, -pcpu | head 20’

![组合 ps 和 watch](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_watch_3.png)

### 结论 ###

你也许每天都会使用ps命令来监控你的Linux系统。但是事实上，你可以通过ps命令的参数来生成各种你需要的报表。

ps命令的另一个优势是ps是各种 Linux系统都默认安装的，因此你只要用就行了。

不要忘了通过 man ps来查看更多的参数。（LCTT 译注：由于 ps 命令古老而重要，所以它在不同的 UNIX、BSD、Linux 等系统中的参数不尽相同，因此如果你用的不是 Linux 系统，请查阅你的文档了解具体可用的参数。）

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/linux-ps-command-examples/

作者：[Pungki Arianto][a]
译者：[johnhoow](https://github.com/johnhoow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/pungki/
