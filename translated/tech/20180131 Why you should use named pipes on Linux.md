为什么应该在Linux上使用命名管道
======

![](https://images.techhive.com/images/article/2017/05/blue-1845806_1280-100722976-large.jpg)

估计每一位Linux使用者都熟悉使用 “|”符号将数据从一个进程传输到另一个进程的操作。它使用户能简便地从一个命令输出数据到另一个命令并筛选出想要的数据而无须写脚本进行选择、重定格式等操作。

还有另一种管道， 虽然也叫“管道”这个名字却有着非常不同的性质。即您可能尚未使用甚至尚未知晓的——命名管道。

 **另可参考:[11 pointless but awesome Linux terminal tricks][1]**

普通管道与命名管道的一个主要区别就是命名管道是它们以文件形式实实在在地存在于系统中存在。但是与其它文件不同的是，命名管道文件似乎从来没有文件内容。即使用户往命名管道中写入大量数据，该文件看起来还是空的。

### 如何在Linux上创建命名管道

Before在我们研究这些空命名管道之前，先追根溯源来看看命名管道是如何被创建的。您可以使用**mkfifo** 命令。提到“FIFO”是因为命名管道也被认为是FIFO特殊文件。术语“FIFO”指的是它的先进先出("first-in, first-out ")属性。如果某人在吃一个甜筒冰淇淋，那么他执行的就是一个LIFO(后进先出last-in, first-out)操作。如果他通过吸管饮食一个冰淇淋，那就在执行一个FIFO操作。好，接下来是一个创建命名管道的例子。
```
$ mkfifo mypipe
$ ls -l mypipe
prw-r-----. 1 shs staff 0 Jan 31 13:59 mypipe

```

（译者注：实际环境中当您输入`mkfifo mypipe`后命令行可能会阻塞在当前位置，这是因为以只写方式打开的FIFO要阻塞到其他某个进程以读方式打开该FIFO。您可在另一个终端中输入 `cat < mypipe`解决，注意两个终端中保证mypipe的路径一致。）注意一下特殊的文件类型标记“p”以及文件大小为0。您可以将重定向数据写入命名管道文件，而文件大小依然为0。
```
$ echo "Can you read this?" > mypipe
$ ls -l mypipe
prw-r-----. 1 shs staff 0 Jan 31 13:59 mypipe

```

正如上面所说，敲击回车似乎什么都没有发生。
```
$ echo "Can you read this?" > mypipe


```

不那么显然的是，用户输入的文本已经进入该命名管道。可能用户却还在盯着输入端，事实上应有用户或其他人在输出端读取接受数据。
```
$ cat mypipe
Can you read this?

```

一旦被读取之后，管道中的内容就不再被保存。

另一种研究命名管道如何工作的方式是通过在后台传送数据的方式完成传送和接受两样操作。
```
$ echo "Can you read this?" > mypipe &
[1] 79302
$ cat mypipe
Can you read this?
[1]+ Done echo "Can you read this?" > mypipe

```

一旦管道被读取或“耗干”，该管道就清空了，尽管我们还能看见它并再次使用，可为什么要费此周折呢？

### 为何要使用命名管道?

命名管道很少被使用的理由似乎很充分。毕竟在Unix系统上，总有多种不同的方式完成同样的操作。有多种方式写文件、读文件、清空文件，尽管命名管道比他们来得更高效。

值得注意的是，命名管道的内容驻留在内存中而不是被写到硬盘上。数据内容只有在输入输出端都打开时才会传送。用户可以在管道的输出端打开之前向管道多次写入。通过使用命名管道，用户可以创建一个同时有一个进程写入管道和一个进程读取管道的进程而不用关心协调二者时间上的同步。

用户可以创建一个单纯等待数据出现在输出端的管道，并在拿到输出数据后对其进行操作。
```
$ tail -f mypipe

```

一旦喂给管道数据的进程结束了，我们就可以看到一些输出。
```
$ tail -f mypipe
Uranus replicated to WCDC7
Saturn replicated to WCDC8
Pluto replicated to WCDC9
Server replication operation completed

```

如果研究一下向命名管道写入的进程，用户也许会惊讶于它的资源消耗之少。在下面的`ps`命令输出中，唯一显著的资源消耗是虚拟内存（VSZ那一列）。
```
ps u -P 80038
USER PID %CPU %MEM VSZ RSS TTY STAT START TIME COMMAND
shs 80038 0.0 0.0 108488 764 pts/4 S 15:25 0:00 -bash

```

命名管道与Unix系统上更常用的管道相比足以不同到拥有另一个名号，但是“管道”实在能反映出它们如何在进程间传送数据的形象，故将称其为“命名管道”还真是恰如其分。也许您在执行操作时就能从这个聪明的Unix特性中获益匪浅呢。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3251853/linux/why-use-named-pipes-on-linux.html

作者：[Sandra Henry-Stocker][a]
译者：[YPBlib](https://github.com/YPBlib)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:http://www.networkworld.com/article/2926630/linux/11-pointless-but-awesome-linux-terminal-tricks.html#tk.nww-fsb
