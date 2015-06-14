像任何其他的操作系统一样，GNU / Linux已经有效地实施了内存管理甚至更多。但是，如果有任何进程正在蚕食你的内存，你要清除它，
Linux提供了一个方法来刷新或清除RAM缓存。

在Linux中如何清除缓存？

每一个Linux系统有三个选项来清除缓存而不中断任何进程或服务。

1，仅清除缓存页
sync; echo 1 &gt; /proc/sys/vm/drop_caches
2，清除目录项和inodes
sync; echo 2 &gt; /proc/sys/vm/drop_caches
3，清除,缓存页，目录项和inodes
sync; echo 3 &gt; /proc/sys/vm/drop_caches
上述命令的说明：

sync将刷新文件系统缓存，命令通过“;”分隔，顺序执行，shell等待终止在序列中的每一个命令执行之前。正如内核文档中提到的，写到drop_cache将清空缓存而不杀死任何应用程序/服务，echo命令做写入文件的工作。

如果你必须清除磁盘高速缓存，第一个命令是最安全在企业和生产环境中，“...echo 1&gt; ...”只会清除页缓存。
不建议使用上面第三个选项在生产环境中“...echo 3 &gt;” ，除非你明确自己在做什么，因为它会清除缓存页，目录项和inodes。

在Linux上释放Buffer和Cache要用到内核是否是个好主意？

当你请求许多设定想要检查时，如果它实际上是专门实施对I/O 广泛的基准测试，那么你可能需要清除缓存。你可以如上所示删除缓存，无需重新启动系统即无需停机。

Linux被设计成它在寻找磁盘之前到磁盘缓存寻找的方式。如果它发现该资源在缓存中，则该请求不到达磁盘。如果我们清理缓存，磁盘缓存将没有用处，系统会到磁盘上寻找资源。

此外，当清除缓存后它也将减慢系统运行速度，系统会重新加载每一个被请求的资源再次到磁盘缓存中。

现在，我们将通过一个cron任务调度器创建一个shell脚本在每天下午2点自动清除RAM缓存。
创建一个shell脚本clearcache.sh并在其中添加以下行：
#!/bin/bash
# Note, we are using "echo 3", but it is not recommended in production instead use "echo 1"
echo "echo 3 &gt; /proc/sys/vm/drop_caches"
给clearcache.sh文件设置执行权限
# chmod 755 clearcache.sh
现在，当你需要清除RAM缓存时只需要调用脚本。

现在设置一个定时任务来清除RAM缓存每天在下午2点，打开crontab进行编辑。
# crontab -e
添加以下行，保存并退出。
0 3 * * * /path/to/clearcache.sh
有关如何创建一个定时任务，更多细节你可以查看我们的文章<a href="http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/">11 Cron Scheduling Jobs</a>。

在生产环境的服务器上自动清除RAM是否是一个好主意？

不！它不是。想想一个情况，当你已经预定脚本来清除RAM缓存每天在下午2点。每天下午2点该脚本会执行并刷新你的RAM缓存。在一天中的任何时候，您网站用户的在线量可能会超过预期的，并从你的服务器请求资源。同时调度器运行着脚本，并在高速缓存中清除一切。当所有的用户都从磁盘读取数据时，这将导致服务器崩溃并损坏数据库。
因此，清除缓存仅在必要时并且在你的预料之中，否则你就是个Cargo Cult System Administrator。

如何清除Linux的交换空间？

如果你想清除掉的空间，你可以运行下面的命令：
# swapoff -a &amp;&amp; swapon -a
此外，了解有关风险后，您可能会将上面的命令添加到cron中。

现在，我们将上面两种命令结合成一个命令写出正确的脚本来同时清除RAM缓存和交换空间。
# echo 3 &gt; /proc/sys/vm/drop_caches &amp;&amp; swapoff -a &amp;&amp; swapon -a &amp;&amp; printf '\n%s\n' 'Ram-cache and Swap Cleared'
或
su -c 'echo 3 &gt;/proc/sys/vm/drop_caches' &amp;&amp; swapoff -a &amp;&amp; swapon -a &amp;&amp; printf '\n%s\n' 'Ram-cache and Swap Cleared'
在测试上面的命令之前，我们先运行“free -m” 然后执行脚本检查缓存。

<a href="https://camo.githubusercontent.com/659439c8dbef449fa82ba64ff5a02dc0e9324017/687474703a2f2f7777772e7465636d696e742e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031352f30352f436c6561722d52414d2d43616368652e676966" target="_blank"><img src="https://camo.githubusercontent.com/659439c8dbef449fa82ba64ff5a02dc0e9324017/687474703a2f2f7777772e7465636d696e742e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031352f30352f436c6561722d52414d2d43616368652e676966" alt="Clear RAM Cache and Swap Space" data-canonical-src="http://www.tecmint.com/wp-content/uploads/2015/05/Clear-RAM-Cache.gif" /></a>

就是现在，如果你喜欢这篇文章，不要忘记向我们提供您宝贵的意见，
让我们知道，您认为在企业和生产环境中清除RAM缓存和缓冲区是否是一个好主意？

via:<a href="http://www.tecmint.com/clear-ram-memory-cache-buffer-and-swap-space-on-linux/">http://www.tecmint.com/clear-ram-memory-cache-buffer-and-swap-space-on-linux/</a>

&nbsp;
