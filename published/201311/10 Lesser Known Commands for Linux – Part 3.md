十个鲜为人知的 Linux 命令 - Part 3
================================================================================
![](http://www.tecmint.com/wp-content/uploads/2013/11/10-Lesser-Known-Linux-Commands.png)

我们继续10个鲜为人知Linux命令系列的第三部分。或许你已经知道了这些命令，那你无疑是一个有经验而喜欢探索的Linux用户。

### 22. \^foo\^bar 命令 ###

在一个实例中运行修改后的最后一个命令。假设我需要运行一个命令‘**ls -l**‘来详细列出‘**Desktop**’目录下的内容。意外地，你打了‘**lls -l**‘。所以你需要重新打整个命令或者使用导航键编辑前面的命令。当你的命令很长时这个很痛苦。

    avi@localhost:~/Desktop$ lls -l 
    bash: lls: command not found

    avi@localhost:~/Desktop$ ^lls^ls 

    ls -l 
    total 7489440 

    drwxr-xr-x 2 avi  avi       36864 Nov 13  2012 101MSDCF 
    -rw-r--r-- 1 avi  avi      206833 Nov  5 15:27 1.jpg 
    -rw-r--r-- 1 avi  avi      158951 Nov  5 15:27 2.jpg 
    -rw-r--r-- 1 avi  avi       90624 Nov  5 12:59 Untitled 1.doc

**注意**:在上面的替换中我们使用“**^typo(被替换的)^original_command(原始命令)**”。警告！这个命令可能会非常危险！如果你有意或者无意地打错了系统命令或者任何像**rm -rf**那样的风险命令的话！

### 23. > file.txt 命令 ###

这个命令会刷新文件的内容而不需删除然后创建相同的文件。当我们需要反复输出，或者在相同的文件上记录日志时，这个命令就非常有用。

我有一个有很多文字的‘**test.txt**’文件在我的‘**Desktop**‘上。

    avi@localhost:~/Desktop$ cat test.txt 
    
    Linux 
    GNU 
    Debian 
    Fedora 
    kali 
    ubuntu 
    git 
    Linus 
    Torvalds


    avi@localhost:~/Desktop$ > test.txt 
    avi@localhost:~/Desktop$ cat test.txt

**注意**:再说一次，这个命令可能很危险！永远不要尝试刷新系统文件或者某篇日志文件的内容。如果你这么做了，你可能会遭遇严重的问题！

### 24. at 命令 ###

‘**at**‘命令与[cron 命令][1]相似也可用于安排一个任务或者在某个特定时刻执行命令。

    avi@localhost:~/Desktop$ echo "ls -l > /dev/pts/0" | at 14:012
    
或
    
    avi@localhost:~/Desktop$ echo "ls -l > /dev/pts/0" | at 2:12 PM

**示例输出**

    -rw-r--r-- 1 avi  avi      220492 Nov  1 13:49 Screenshot-1.png 
    -rw-r--r-- 1 root root        358 Oct 17 10:11 sources.list 
    -rw-r--r-- 1 avi  avi  4695982080 Oct 10 20:29 squeeze.iso 
    ..
    ..
    -rw-r--r-- 1 avi  avi       90624 Nov  5 12:59 Untitled 1.doc 
    -rw-r--r-- 1 avi  avi       96206 Nov  5 12:56 Untitled 1.odt 
    -rw-r--r-- 1 avi  avi        9405 Nov 12 23:22 Untitled.png

**注意**:echo “**ls -l**”的意思是，将这串命令(这里是 **ls -l**)输出在标准终端上。你可以用你需要或者选择的命令替代‘**ls -l**‘。

   \> ：重定向输出

**/dev/pts/0**: 这是输出设备和/或文件，输出到指定的地方，这里输出在终端（/dev/pts/0）。

就我而言，此时我的**tty**在**/dev/pts/0**。你可以用**tty**命令检查你的**tty**。

    avi@localhost:~/Desktop$ tty 
    
    /dev/pts/0

**注意**: ‘**at**‘会在系统时间匹配到特定时间时会尽快执行。

### 25. du -h –max-depth=1 命令 ###

下面的命令以人类可读的形式输出当前目录的子目录的大小。

    avi@localhost:/home/avi/Desktop# du -h --max-depth=1 
    
    38M		./test 
    1.1G	./shivji 
    42M		./drupal 
    6.9G	./101MSDCF 
    16G	.

**注意**:上面的命令在[检查系统使用率][2]是非常有用。

### 26. expr 命令 ###

‘**expr**‘不是那么鲜为人知的命令。这个命令在终端中计算简单的算数时非常有用。

    avi@localhost:/home/avi/Desktop# expr 2 + 3 
    5
    
    avi@localhost:/home/avi/Desktop# expr 6 – 3 
    3
    
    avi@localhost:/home/avi/Desktop# expr 12 / 3 
    4
    
    avi@localhost:/home/avi/Desktop# expr 2 \* 9 
    18

### 27. look 命令 ###

在终端上从英文字典上查单词以防混淆。比如说，我记不清了是该拼成carrier还是carieer。

avi@localhost:/home/avi/Documents# look car 

    Cara 
    Cara's 
    …
    ... 
    carps 
    carpus 
    carpus's 
    carrel 
    carrel's 
    carrels 
    carriage 
    carriage's 
    carriages 
    carriageway 
    carriageway's 
    carried 
    carrier 
    carrier's 
    carriers 
    carries 
    …
    ... 
    caryatids

上面的命令会显示字典上所有以'car'开头的单词。我得到了我想找的。

### 28. yes 命令 ###

另外一个命令在通常基础上并不会经常使用，但是在脚本语言和系统管理时非常有用。

这个命令会持续地输出给定的字符串，直到由你的中断命令打断。

    avi@localhost:~/Desktop$ yes "Tecmint is one of the best site dedicated to Linux, how to" 
    
    Tecmint is one of the best site dedicated to Linux, how to 
    Tecmint is one of the best site dedicated to Linux, how to 
    Tecmint is one of the best site dedicated to Linux, how to 
    Tecmint is one of the best site dedicated to Linux, how to 
    …
    …
    ...
    Tecmint is one of the best site dedicated to Linux, how to 
    Tecmint is one of the best site dedicated to Linux, how to 
    Tecmint is one of the best site dedicated to Linux, how to

### 29. factor 命令 ###

factor实际是一个源于数学的命令。这个命令会输出所有给定数字的因数。

    avi@localhost:~/Desktop$ factor 22 
    22: 2 11
    
    avi@localhost:~/Desktop$ factor 21 
    21: 3 7
    
    avi@localhost:~/Desktop$ factor 11 
    11: 11

### 30. ping -i 60 -a IP_address ###

我们都用ping命令检测服务器是否连通。我通常ping google，来检测我是否连接到了因特网。

当你等待或者持续盯着你的终端等待命令的回应或者等待服务器的连接时，有时是很气人的。

一旦服务器连通就有一个声音如何（译注：下面命令是等60秒PING一次）？

    avi@localhost:~/Desktop$ ping -i 60 -a www.google.com 
    
    PING www.google.com (74.125.200.103) 56(84) bytes of data. 
    64 bytes from www.google.com (74.125.200.103): icmp_req=1 ttl=44 time=105 ms 
    64 bytes from 74.125.200.103: icmp_req=2 ttl=44 time=281 ms

注意，当你发现命令不会返回声音时。请确保你的系统不是静音的，声音已经在‘**sound preferences(声音选项)**‘ 中启用并确保勾选了‘**Enable window and window sound**‘。

### 31. tac 命令 ###

这个命令很有趣，他会以倒序输出文本文件的内容。也就是从最后一行到第一行。

在home目录下，我的Documents目录下有一个35.txt文件。用[cat 命令][3]检查内容。

    avi@localhost:~/Documents$ cat 35.txt

**示例输出**

> 1. Linux is built with certain powerful tools, which are unavailable in windows. 
> 2. One of such important tool is Shell Scripting. Windows however comes with such a tool but as usual it is much weak as compared to it's Linux Counterpart. 
> 3. Shell scripting/programming makes it possible to execute command(s), piped to get desired output in order to automate day-to-day usages.

现在用tac命令反转文件内容（译注：当然，我们知道cat反转过来就是tac）。

    avi@localhost:~/Documents$ tac 35.txt

**示例输出**

> 3. Shell scripting/programming makes it possible to execute command(s), piped to get desired output in order to automate day-to-day usages. 
> 2. One of such important tool is Shell Scripting. Windows however comes with such a tool but as usual it is much weak as compared to it's Linux Counterpart. 
> 1. Linux is built with certain powerful tools, which are unavailable in windows.

现在结束了。如果你还知道其他一些Linux鲜为人知的命令，你可以在下面评论，那么我们你可以在以后的文章中包含进来。

不要忘了给我们有价值的评论。我很快会发另外有趣的文章。别走开继续关注 **Tecmint**。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/10-lesser-known-commands-for-linux-part-3/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[2]:http://www.tecmint.com/check-linux-disk-usage-of-files-and-directories/
[3]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/