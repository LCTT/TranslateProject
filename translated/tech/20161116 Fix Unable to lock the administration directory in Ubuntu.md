修复Ubuntu中“Unable to lock the administration directory (/var/lib/dpkg/)”的问题
============================================================

在Ubuntu或者它的衍生版如Linux Mint（我已经作为日常工作使用的系统）中使用[apt-get命令][1]或者其相对更新的[APT管理工具][2]时，你可能会在命令行中看到一个“unable to lock the administration directory (/var/lib/dpkg/) is another process using it”的错误。

这个错误尤其对那些对这个错误原因不了解的Linux(Ubuntu)新手而言更加恼人。

下面是一个例子，展示了在Ubuntu 16.10上文件锁定错误：

```
tecmint@TecMint:~$ sudo apt install neofetch
[sudo] password for tecmint:
E: Could not get lock /var/lib/dpkg/lock - open (11: Resource temporarily unavailable)
E: Unable to lock the administration directory (/var/lib/dpkg), is another process using it?
```

下面的输出是另外一个可能显示的错误：

```
E: Could not get lock /var/lib/apt/lists/lock - open (11: Resource temporarily unavailable)
E: Unable to lock directory /var/lib/apt/lists/ 
E: Could not get lock /var/lib/dpkg/lock - open (11: Resource temporarily unavailable) 
E: Unable to lock the administration directory (/var/lib/dpkg/), is another process using it?
```

你将来遇到这个错误该怎么去解决？一共有几种方法处理这个错误，但是本篇中我们会用两种或许是最简单和最有效的方法来解决它。

### 1\. 找出并杀掉所有apt-get或者apt进程

运行下面的命令来[生成所有含有apt的进程列表][3]，你可以使用`ps`和[grep命令][4]并用管道组合来得到含有apt或者apt-get的进程。

```
$ ps -A | grep apt
```
[
 ![Find apt and apt-get Processes](http://www.tecmint.com/wp-content/uploads/2016/11/find-apt-processes.png) 
][5]

找出apt以及apt-get进程

你可以看到上面命令输出的每个apt-get或者apt进程，使用下面的命令[杀掉每个进程][6]。

上面截图中的第一列是进程ID(PID)。

```
$ sudo kill -9 processnumber
或者
$ sudo kill -SIGKILL processnumber
```

比如，下面命令中的`9`是SIGKILL代表的数字，它会杀掉第一个apt进程：

```
$ sudo kill -9 13431
或者
$ sudo kill -SIGKILL 13431
```

### 2\. 删除锁定的文件

锁定的文件会阻止Linux系统中某些文件或者数据的访问，这个概念也存在于Windows或者其他的操作系统中。

一旦你运行了apt-get或者apt命令，锁定文件将会创建于/var/lib/apt/lists/、/var/lib/dpkg/、/var/cache/apt/archives/中.

这有助于运行中的apt-get或者apt进程能够阻止被其他需要使用相同文件的用户或者系统进程打断。当进程执行完毕后，锁定文件将会删除。

重要提醒：万一你在没有看到apt-get或者apt进程的情况下在上面两个不同的文件夹中看到了锁定文件，这以为了进程由于某个原因被杀掉了，因此你需要删除锁定文件来避免错误。

首先运行下面的命令来移除`/var/lib/dpkg/`文件夹下的锁定文件：

```
$ sudo rm /var/lib/dpkg/lock
```

之后像下面这样强制重新配置包：

```
$ sudo dpkg --configure -a
```

也可以删除`/var/lib/apt/lists/`下的锁定文件以及缓存文件夹：

```
$ sudo rm /var/lib/apt/lists/lock
$ sudo rm /var/cache/apt/archives/lock
```

接下来，升级你的包源列表：

```
$ sudo apt update
或者
$ sudo apt-get update
```

总结一下，对于Ubuntu（以及它的衍生版）用户在使用apt-get或者apt也叫[aptitude命令][7]时遇到的问题，我们已经用两种方法来解决了。

你有什么可以分享出来的有效的方法来处理这个错误么？在下面的评论区联系我们。

除此之外，你可能还希望了解[如何找出并杀掉运行的进程][8]，你可以阅读这篇[用kill、pkill、killall来中止进程][9]指南来了解。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/fix-unable-to-lock-the-administration-directory-var-lib-dpkg-lock

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[2]:http://www.tecmint.com/apt-advanced-package-command-examples-in-ubuntu/
[3]:http://www.tecmint.com/find-linux-processes-memory-ram-cpu-usage/
[4]:http://www.tecmint.com/linux-grep-commands-character-classes-bracket-expressions/
[5]:http://www.tecmint.com/wp-content/uploads/2016/11/find-apt-processes.png
[6]:http://www.tecmint.com/find-and-kill-running-processes-pid-in-linux/
[7]:http://www.tecmint.com/difference-between-apt-and-aptitude/
[8]:http://www.tecmint.com/find-and-kill-running-processes-pid-in-linux/
[9]:http://www.tecmint.com/how-to-kill-a-process-in-linux/
