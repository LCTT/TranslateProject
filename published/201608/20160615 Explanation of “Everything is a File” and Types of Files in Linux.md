诠释 Linux 中“一切都是文件”概念和相应的文件类型
====================================================================

![](http://www.tecmint.com/wp-content/uploads/2016/05/Everything-is-a-File-in-Linux.png)

*Linux 系统中一切都是文件并有相应的文件类型*

在 Unix 和它衍生的比如 Linux 系统中，一切都可以看做文件。虽然它仅仅只是一个泛泛的概念，但这是事实。如果有不是文件的，那它一定是正运行的进程。

要理解这点，可以举个例子，您的根目录（/）的空间充斥着不同类型的 Linux 文件。当您创建一个文件或向系统传输一个文件时，它会在物理磁盘上占据的一些空间，而且是一个特定的格式（文件类型）。        

虽然 Linux 系统中文件和目录没有什么不同，但目录还有一个重要的功能，那就是有结构性的分组存储其它文件，以方便查找访问。所有的硬件组件都表示为文件，系统使用这些文件来与硬件通信。

这些思想是对 Linux 中的各种事物的重要阐述，因此像文档、目录（Mac OS X 和 Windows 系统下称之为文件夹）、键盘、监视器、硬盘、可移动媒体设备、打印机、调制解调器、虚拟终端，还有进程间通信（IPC）和网络通信等输入/输出资源都是定义在文件系统空间下的字节流。

一切都可看作是文件，其最显著的好处是对于上面所列出的输入/输出资源，只需要相同的一套 Linux 工具、实用程序和 API。

虽然在 Linux 中一切都可看作是文件，但也有一些特殊的文件，比如[套接字和命令管道][1]。

### Linux 文件类型的不同之处？

Linux 系统中有三种基本的文件类型：

- 普通/常规文件
- 特殊文件
- 目录文件

#### 普通/常规文件

它们是包含文本、数据、程序指令等数据的文件，其在 Linux 系统中是最常见的一种。包括如下：

- 可读文件
- 二进制文件
- 图像文件
- 压缩文件等等

#### 特殊文件

特殊文件包括以下几种：

块文件（block）：设备文件，对访问系统硬件部件提供了缓存接口。它们提供了一种通过文件系统与设备驱动通信的方法。

有关于块文件一个重要的性能就是它们能在指定时间内传输大块的数据和信息。

列出某目录下的块文件：

```
# ls -l /dev | grep "^b"
```

输出例子

```
brw-rw----  1 root disk        7,   0 May 18 10:26 loop0
brw-rw----  1 root disk        7,   1 May 18 10:26 loop1
brw-rw----  1 root disk        7,   2 May 18 10:26 loop2
brw-rw----  1 root disk        7,   3 May 18 10:26 loop3
brw-rw----  1 root disk        7,   4 May 18 10:26 loop4
brw-rw----  1 root disk        7,   5 May 18 10:26 loop5
brw-rw----  1 root disk        7,   6 May 18 10:26 loop6
brw-rw----  1 root disk        7,   7 May 18 10:26 loop7
brw-rw----  1 root disk        1,   0 May 18 10:26 ram0
brw-rw----  1 root disk        1,   1 May 18 10:26 ram1
brw-rw----  1 root disk        1,  10 May 18 10:26 ram10
brw-rw----  1 root disk        1,  11 May 18 10:26 ram11
brw-rw----  1 root disk        1,  12 May 18 10:26 ram12
brw-rw----  1 root disk        1,  13 May 18 10:26 ram13
brw-rw----  1 root disk        1,  14 May 18 10:26 ram14
brw-rw----  1 root disk        1,  15 May 18 10:26 ram15
brw-rw----  1 root disk        1,   2 May 18 10:26 ram2
brw-rw----  1 root disk        1,   3 May 18 10:26 ram3
brw-rw----  1 root disk        1,   4 May 18 10:26 ram4
brw-rw----  1 root disk        1,   5 May 18 10:26 ram5
...
```

字符文件（Character）： 也是设备文件，对访问系统硬件组件提供了非缓冲串行接口。它们与设备的通信工作方式是一次只传输一个字符的数据。

列出某目录下的字符文件：

```
# ls -l /dev | grep "^c"
```

输出例子

```
crw-------  1 root root       10, 235 May 18 15:54 autofs
crw-------  1 root root       10, 234 May 18 15:54 btrfs-control
crw-------  1 root root        5,   1 May 18 10:26 console
crw-------  1 root root       10,  60 May 18 10:26 cpu_dma_latency
crw-------  1 root root       10, 203 May 18 15:54 cuse
crw-------  1 root root       10,  61 May 18 10:26 ecryptfs
crw-rw----  1 root video      29,   0 May 18 10:26 fb0
crw-rw-rw-  1 root root        1,   7 May 18 10:26 full
crw-rw-rw-  1 root root       10, 229 May 18 10:26 fuse
crw-------  1 root root      251,   0 May 18 10:27 hidraw0
crw-------  1 root root       10, 228 May 18 10:26 hpet
crw-r--r--  1 root root        1,  11 May 18 10:26 kmsg
crw-rw----+ 1 root root       10, 232 May 18 10:26 kvm
crw-------  1 root root       10, 237 May 18 10:26 loop-control
crw-------  1 root root       10, 227 May 18 10:26 mcelog
crw-------  1 root root      249,   0 May 18 10:27 media0
crw-------  1 root root      250,   0 May 18 10:26 mei0
crw-r-----  1 root kmem        1,   1 May 18 10:26 mem
crw-------  1 root root       10,  57 May 18 10:26 memory_bandwidth
crw-------  1 root root       10,  59 May 18 10:26 network_latency
crw-------  1 root root       10,  58 May 18 10:26 network_throughput
crw-rw-rw-  1 root root        1,   3 May 18 10:26 null
crw-r-----  1 root kmem        1,   4 May 18 10:26 port
crw-------  1 root root      108,   0 May 18 10:26 ppp
crw-------  1 root root       10,   1 May 18 10:26 psaux
crw-rw-rw-  1 root tty         5,   2 May 18 17:40 ptmx
crw-rw-rw-  1 root root        1,   8 May 18 10:26 random
```

符号链接文件（Symbolic link） ： 符号链接是指向系统上其他文件的引用。因此，符号链接文件是指向其它文件的文件，那些文件可以是目录或常规文件。

列出某目录下的符号链接文件：

```
# ls -l /dev/ | grep "^l"
```

输出例子

```
lrwxrwxrwx  1 root root             3 May 18 10:26 cdrom -> sr0
lrwxrwxrwx  1 root root            11 May 18 15:54 core -> /proc/kcore
lrwxrwxrwx  1 root root            13 May 18 15:54 fd -> /proc/self/fd
lrwxrwxrwx  1 root root             4 May 18 10:26 rtc -> rtc0
lrwxrwxrwx  1 root root             8 May 18 10:26 shm -> /run/shm
lrwxrwxrwx  1 root root            15 May 18 15:54 stderr -> /proc/self/fd/2
lrwxrwxrwx  1 root root            15 May 18 15:54 stdin -> /proc/self/fd/0
lrwxrwxrwx  1 root root            15 May 18 15:54 stdout -> /proc/self/fd/1
```

Linux 中使用 `ln` 工具就可以创建一个符号链接文件，如下所示：

```
# touch file1.txt
# ln -s file1.txt /home/tecmint/file1.txt  [创建符号链接文件]
# ls -l /home/tecmint/ | grep "^l"         [列出符号链接文件]
```

在上面的例子中，首先我们在 `/tmp`  目录创建了一个名叫  `file1.txt` 的文件，然后创建符号链接文件，将 `/home/tecmint/file1.txt` 指向 `/tmp/file1.txt` 文件。

管道（Pipes）和命令管道（Named pipes） : 将一个进程的输出连接到另一个进程的输入，从而允许进程间通信（IPC）的文件。

命名管道实际上是一个文件，用来使两个进程彼此通信，就像一个 Linux 管道一样。

列出某目录下的管道文件：

```
# ls -l | grep "^p"
```

输出例子：

```
prw-rw-r-- 1 tecmint tecmint    0 May 18 17:47 pipe1
prw-rw-r-- 1 tecmint tecmint    0 May 18 17:47 pipe2
prw-rw-r-- 1 tecmint tecmint    0 May 18 17:47 pipe3
prw-rw-r-- 1 tecmint tecmint    0 May 18 17:47 pipe4
prw-rw-r-- 1 tecmint tecmint    0 May 18 17:47 pipe5
```

在 Linux 中可以使用  `mkfifo`  工具来创建一个命名管道，如下所示：

```
# mkfifo pipe1
# echo "This is named pipe1" > pipe1
```

在上的例子中，我们创建了一个名叫 `pipe1` 的命名管道，然后使用 [echo 命令][2] 加入一些数据，这之后在处理输入的数据时 shell 就变成非交互式的了（LCTT 译注：被管道占住了）。

然后，我们打开另外一个 shell 终端，运行另外的命令来打印出刚加入管道的数据。

```
# while read line ;do echo "This was passed-'$line' "; done<pipe1
```

套接字文件（sockets） ： 提供进程间通信方法的文件，它们能在运行在不同环境中的进程之间传输数据和信息。

这就是说，套接字可以为运行网络上不同机器中的进程提供数据和信息传输。

一个 socket 运行的例子就是网页浏览器连接到网站服务器的过程。

```
# ls -l /dev/ | grep "^s"
```

输出例子：

```
srw-rw-rw-  1 root root             0 May 18 10:26 log
```

下面是使用 C 语言编写的调用  `socket()` 系统调用的例子。

```
int socket_desc= socket(AF_INET, SOCK_STREAM, 0 );
```

上例中：

- `AF_INET` 指的是地址域（IPv4）
- `SOCK_STREAM` 指的是类型（默认使用 TCP 协议连接）
- `0` 指协议（IP 协议）

使用 `socket_desc` 来引用管道文件，它跟文件描述符是一样的，然后再使用系统函数  `read()`  和 `write()`  来分别从这个管道文件读写数据。

#### 目录文件

这是一些特殊的文件，既可以包含普通文件又可包含其它的特殊文件，它们在 Linux 文件系统中是以根（/）目录为起点分层组织存在的。

列出某目录下的目录文件：

```
# ls -l / | grep "^d" 
```

输出例子：

```
drwxr-xr-x   2 root root  4096 May  5 15:49 bin
drwxr-xr-x   4 root root  4096 May  5 15:58 boot
drwxr-xr-x   2 root root  4096 Apr 11  2015 cdrom
drwxr-xr-x  17 root root  4400 May 18 10:27 dev
drwxr-xr-x 168 root root 12288 May 18 10:28 etc
drwxr-xr-x   3 root root  4096 Apr 11  2015 home
drwxr-xr-x  25 root root  4096 May  5 15:44 lib
drwxr-xr-x   2 root root  4096 May  5 15:44 lib64
drwx------   2 root root 16384 Apr 11  2015 lost+found
drwxr-xr-x   3 root root  4096 Apr 10  2015 media
drwxr-xr-x   3 root root  4096 Feb 23 17:54 mnt
drwxr-xr-x  16 root root  4096 Apr 30 16:01 opt
dr-xr-xr-x 223 root root     0 May 18 15:54 proc
drwx------  19 root root  4096 Apr  9 11:12 root
drwxr-xr-x  27 root root   920 May 18 10:54 run
drwxr-xr-x   2 root root 12288 May  5 15:57 sbin
drwxr-xr-x   2 root root  4096 Dec  1  2014 srv
dr-xr-xr-x  13 root root     0 May 18 15:54 sys
drwxrwxrwt  13 root root  4096 May 18 17:55 tmp
drwxr-xr-x  11 root root  4096 Mar 31 16:00 usr
drwxr-xr-x  12 root root  4096 Nov 12  2015 var
```

您可以使用 mkdir 命令来创建一个目录。

```
# mkdir -m 1666 tecmint.com
# mkdir -m 1666 news.tecmint.com
# mkdir -m 1775 linuxsay.com
```

### 结论

现在应该对为什么 Linux 系统中一切都是文件以及 Linux 系统中可以存在哪些类型的文件有一个清楚的认识了。

您可以通过阅读更多有关各个文件类型的文章和对应的创建过程等来增加更多知识。我希望这篇教程对您有所帮助。有任何疑问或有补充的知识，请留下评论，一起来讨论。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/explanation-of-everything-is-a-file-and-types-of-files-in-linux/

作者：[Aaron Kili][a]
译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/manage-file-types-and-set-system-time-in-linux/
[2]: http://www.tecmint.com/echo-command-in-linux/
