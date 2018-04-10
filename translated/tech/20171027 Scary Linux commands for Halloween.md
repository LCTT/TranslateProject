可怕的万圣节 Linux 命令
======
万圣节快到了，是时候关注一下 Linux 可怕的一面。什么命令可能会显示鬼、巫婆和僵尸的图像？这可能会鼓励伎俩或治疗的精神？哪个会鼓励“不给糖果就捣蛋”的精神？

### crypt

好吧，我们一直看到 **crypt**。尽管名称不同，crypt 不是一个地窖，也不是垃圾文件的埋葬坑，而是一个加密文件内容的命令。现在，“crypt”  通常用一个脚本实现，通过调用一个名为  **mcrypt** 的二进制文件来模拟以前的 crypt 命令来完成它的工作。直接使用 **mycrypt** 命令是更好的选择。
```
$ mcrypt x
Enter the passphrase (maximum of 512 characters)
Please use a combination of upper and lower case letters and numbers.
Enter passphrase:
Enter passphrase:

File x was encrypted.

```

请注意，mcrypt 命令会创建一个扩展名为 “.nc” 的第二个文件。它不会覆盖你正在加密的文件。

mcrypt 命令有密钥大小和加密算法的选项。你也可以再选项中指定密钥，但 mcrypt 命令不鼓励这样做。

### kill

还有 kill 命令 - 当然并不是指谋杀，而是用来强制和非强制地结束进程，这取决于正确终止它们的要求。当然，Linux 并不止于此。相反，它有各种 kill 命令来终止进程。我们有 kill、pkill、killall、killpg、rfkill、skill (读作 es-kill)、tgkill、tkill 和 xkill。
```
$ killall runme
[1] Terminated ./runme
[2] Terminated ./runme
[3]- Terminated ./runme
[4]+ Terminated ./runme

```

### shred

Linux 系统也支持一个名为 **shred** 的命令。shred 命令会覆盖文件以隐藏其以前的内容，并确保使用硬盘恢复工具无法恢复它们。请记住，rm 命令基本上只是删除文件在目录文件中的引用，但不一定会从磁盘上删除内容或覆盖它。**shred** 命令覆盖文件的内容。
```
$ shred dupes.txt
$ more dupes.txt
▒oΛ▒▒9▒lm▒▒▒▒▒o▒1־▒▒f▒f▒▒▒i▒▒h^}&▒▒▒{▒▒

```

### 僵尸

虽然不是命令，但**僵尸**在 Linux 系统上是很顽固的存在。僵尸基本上是没有完全清理掉的死亡进程的遗骸。进程_不应该_这样工作 - 让死亡进程四处游荡，而不是简单地让它们死亡并进入数字天堂，所以僵尸的存在表明让他们遗留的进程有一些缺陷。

一个简单的方法来检查你的系统是否有僵尸进程遗留，看看 top 命令的标题行。
```
$ top
top - 18:50:38 up 6 days, 6:36, 2 users, load average: 0.00, 0.00, 0.00
Tasks: 171 total, 1 running, 167 sleeping, 0 stopped, 3 zombie	**< ==**
%Cpu(s): 0.0 us, 0.0 sy, 0.0 ni, 99.9 id, 0.1 wa, 0.0 hi, 0.0 si, 0.0 st
KiB Mem : 2003388 total, 250840 free, 545832 used, 1206716 buff/cache
KiB Swap: 9765884 total, 9765764 free, 120 used. 1156536 avail Mem

```

可怕！上面显示有三个僵尸进程。

### at midnight

有时会在万圣节这么说，死者的灵魂从日落开始游荡直到午夜。Linux 可以通过 “at midnight” 命令跟踪它们的离开。用于安排在下次到达指定时间时运行的作业，**at** 的作用类似于一次性的 cron。
```
$ at midnight
warning: commands will be executed using /bin/sh
at> echo 'the spirits of the dead have left'
at> <EOT>
job 3 at Thu Oct 31 00:00:00 2017

```

### 守护进程

Linux 系统也高度依赖守护进程 - 在后台运行的进程，并提供系统的许多功能。许多守护进程的名称以 “d” 结尾。这个 “d” 代表“守护进程” （daemon），表明这个进程一直运行并支持一些重要功能。有的会将单词 “daemon” 展开。
```
$ ps -ef | grep sshd
root 1142 1 0 Oct19 ? 00:00:00 /usr/sbin/sshd -D
root 25342 1142 0 18:34 ? 00:00:00 sshd: shs [priv]
$ ps -ef | grep daemon | grep -v grep
message+ 790 1 0 Oct19 ? 00:00:01 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
root 836 1 0 Oct19 ? 00:00:02 /usr/lib/accountsservice/accounts-daemon

```

### 万圣节快乐！

在 [Facebook][1] 和 [LinkedIn][2] 上加入 Network World 社区来对主题进行评论。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3235219/linux/scary-linux-commands-for-halloween.html

作者：[Sandra Henry-Stocker][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.facebook.com/NetworkWorld/
[2]:https://www.linkedin.com/company/network-world
