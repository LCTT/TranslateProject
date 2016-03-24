在Linux上如何清除内存的 Cache、Buffer 和交换空间
============================================

像任何其他的操作系统一样，GNU/Linux 已经实现的内存管理不仅有效，而且更好。但是，如果有任何进程正在蚕食你的内存，而你想要清除它的话，Linux 提供了一个刷新或清除RAM缓存方法。

![Clear RAM Cache and Swap in Linux](http://www.tecmint.com/wp-content/uploads/2015/05/Clear-RAM-Cache-in-Linux.jpg)

### 如何在 Linux 中清除缓存（Cache）？###

每个 Linux 系统有三种选项来清除缓存而不需要中断任何进程或服务。

（LCTT 译注：Cache，译作“缓存”，指 CPU 和内存之间高速缓存。Buffer，译作“缓冲区”，指在写入磁盘前的存储再内存中的内容。在本文中，Buffer 和 Cache 有时候会通指。）

1. 仅清除页面缓存（PageCache）

		# sync; echo 1 > /proc/sys/vm/drop_caches		
		
2. 清除目录项和inode
		
    	# sync; echo 2 > /proc/sys/vm/drop_caches		
		
3. 清除页面缓存，目录项和inode
		
    	# sync; echo 3 > /proc/sys/vm/drop_caches 


上述命令的说明：

sync 将刷新文件系统缓冲区（buffer），命令通过“;”分隔，顺序执行，shell在执行序列中的下一个命令之前会等待命令的终止。正如内核文档中提到的，写入到drop_cache将清空缓存而不会杀死任何应用程序/服务，[echo命令][1]做写入文件的工作。

如果你必须清除磁盘高速缓存，第一个命令在企业和生产环境中是最安全，`"...echo 1> ..."`只会清除页面缓存。
在生产环境中不建议使用上面的第三个选项`"...echo 3 > ..."` ，除非你明确自己在做什么，因为它会清除缓存页，目录项和inodes。

**在Linux上释放也许被内核所使用的缓冲区（Buffer）和缓存（Cache）是否是个好主意？**

当你设置许多设定想要检查效果时，如果它实际上是专门针对 I/O 范围的基准测试，那么你可能需要清除缓冲区和缓存。你可以如上所示删除缓存，无需重新启动系统（即无需停机）。

Linux被设计成它在寻找磁盘之前到磁盘缓存寻找的方式。如果它发现该资源在缓存中，则该请求不会发送到磁盘。如果我们清理缓存，磁盘缓存就起不到作用了，系统会到磁盘上寻找资源。

此外，当清除缓存后它也将减慢系统运行速度，系统会将每一个被请求的资源再次加载到磁盘缓存中。


现在，我们将创建一个 shell 脚本，通过一个 cron 调度任务在每天下午2点自动清除RAM缓存。如下创建一个 shell 脚本 clearcache.sh 并在其中添加以下行：

	#!/bin/bash
	# 注意，我们这里使用了 "echo 3"，但是不推荐使用在产品环境中，应该使用 "echo 1"
	echo "echo 3 &gt; /proc/sys/vm/drop_caches"

给clearcache.sh文件设置执行权限

	# chmod 755 clearcache.sh

现在，当你需要清除内存缓存时只需要调用脚本。

现在设置一个每天下午2点的定时任务来清除RAM缓存，打开crontab进行编辑。

	# crontab -e

添加以下行，保存并退出。

	0 3 * * * /path/to/clearcache.sh

有关如何创建一个定时任务，更多细节你可以查看我们的文章 [11 个定时调度任务的例子][2]。

**在生产环境的服务器上自动清除RAM是否是一个好主意？**

不！它不是。想想一个情况，当你已经预定脚本在每天下午2点来清除内存缓存。那么其时该脚本会执行并刷新你的内存缓存。在某一天由于某些原因，可能您的网站的在线用户会超过预期地从你的服务器请求资源。


而在这时，按计划调度的脚本运行了，并清除了缓存中的一切。当所有的用户都从磁盘读取数据时，这将导致服务器崩溃并损坏数据库。因此，清除缓存仅在必要时并且在你的预料之中，否则你就是个呆瓜系统管理员。

###如何清除Linux的交换空间？###

如果你想清除掉的空间，你可以运行下面的命令：

	# swapoff -a && swapon -a

此外，了解有关风险后，您可以将上面的命令添加到cron中。

现在，我们将上面两种命令结合成一个命令，写成正确的脚本来同时清除RAM缓存和交换空间。

	# echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'

或

	su -c 'echo 3 > /proc/sys/vm/drop_caches' && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'

在测试上面的命令之前，我们在执行脚本前后运行“free -m” 来检查缓存。

![Clear RAM Cache and Swap Space](http://www.tecmint.com/wp-content/uploads/2015/05/Clear-RAM-Cache.gif)

就是这样，如果你喜欢这篇文章，不要忘记向我们提供您宝贵的意见，让我们知道，您认为在企业和生产环境中清除内存缓存和缓冲区是否是一个好主意？

--------------------------------------------------------------------------------		
		
via: http://www.tecmint.com/clear-ram-memory-cache-buffer-and-swap-space-on-linux/		
		
作者：[Avishek Kumar][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)
		
本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出		
		
[a]:http://www.tecmint.com/author/avishek/
[1]:https://linux.cn/article-3592-1.html
[2]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/