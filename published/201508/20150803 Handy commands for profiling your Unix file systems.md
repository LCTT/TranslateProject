使用 Find 命令来帮你找到那些需要清理的文件
================================================================================
![Credit: Sandra H-S](http://images.techhive.com/images/article/2015/07/file-profile-100597239-primary.idge.png)

*Credit: Sandra H-S*

有一个问题几乎困扰着所有的文件系统 -- 包括 Unix 和其他的 -- 那就是文件的不断积累。几乎没有人愿意花时间清理掉他们不再使用的文件和整理文件系统，结果，文件变得很混乱，很难找到有用的东西，要使它们运行良好、维护备份、易于管理，这将是一种持久的挑战。

我见过的一种解决问题的方法是建议使用者将所有的数据碎屑创建一个文件集合的总结报告或"概况"，来报告诸如所有的文件数量；最老的，最新的，最大的文件；并统计谁拥有这些文件等数据。如果有人看到五年前的一个包含五十万个文件的文件夹，他们可能会去删除哪些文件 -- 或者，至少会归档和压缩。主要问题是太大的文件夹会使人担心误删一些重要的东西。如果有一个描述文件夹的方法能帮助显示文件的性质，那么你就可以去清理它了。

当我准备做 Unix 文件系统的总结报告时，几个有用的 Unix 命令能提供一些非常有用的统计信息。要计算目录中的文件数，你可以使用这样一个 find 命令。

    $ find . -type f | wc -l
    187534

虽然查找最老的和最新的文件是比较复杂，但还是相当方便的。在下面的命令，我们使用 find 命令再次查找文件，以文件时间排序并按年-月-日的格式显示，在列表顶部的显然是最老的。

在第二个命令，我们做同样的，但打印的是最后一行，这是最新的。

    $ find -type f -printf '%T+ %p\n' | sort | head -n 1
    2006-02-03+02:40:33 ./skel/.xemacs/init.el
    $ find -type f -printf '%T+ %p\n' | sort | tail -n 1
    2015-07-19+14:20:16 ./.bash_history

printf 命令输出 ％T（文件日期和时间）和 ％P（带路径的文件名）参数。

如果我们在查找家目录时，无疑会发现，history 文件（如 .bash_history）是最新的，这并没有什么用。你可以通过 "un-grepping" 来忽略这些文件，也可以忽略以.开头的文件，如下图所示的。

    $ find -type f -printf '%T+ %p\n' | grep -v "\./\." | sort | tail -n 1
    2015-07-19+13:02:12 ./isPrime

寻找最大的文件使用 ％s（大小）参数，包括文件名（％f），因为这就是我们想要在报告中显示的。

    $ find -type f -printf '%s %f \n' | sort -n | uniq | tail -1
    20183040 project.org.tar

统计文件的所有者，使用％u（所有者）

    $ find -type f -printf '%u \n' | grep -v "\./\." | sort | uniq -c
       180034 shs
         7500 jdoe

如果文件系统能记录上次的访问日期，也将是非常有用的，可以用来看该文件有没有被访问过，比方说，两年之内没访问过。这将使你能明确分辨这些文件的价值。这个最后访问（％a）参数这样使用：

    $ find -type f -printf '%a+ %p\n' | sort | head -n 1
    Fri Dec 15 03:00:30 2006+ ./statreport

当然，如果大多数最近​​访问的文件也是在很久之前的，这看起来你需要处理更多文件了。

    $ find -type f -printf '%a+ %p\n' | sort | tail -n 1
    Wed Nov 26 03:00:27 2007+ ./my-notes

要想层次分明，可以为一个文件系统或大目录创建一个总结报告，显示这些文件的日期范围、最大的文件、文件所有者们、最老的文件和最新访问时间，可以帮助文件拥有者判断当前有哪些文件夹是重要的哪些该清理了。

--------------------------------------------------------------------------------

via: http://www.itworld.com/article/2949898/linux/profiling-your-file-systems.html

作者：[Sandra Henry-Stocker][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.itworld.com/author/Sandra-Henry_Stocker/
