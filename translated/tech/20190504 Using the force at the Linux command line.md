[#]: collector: (lujun9972)
[#]: translator: (Moelf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using the force at the Linux command line)
[#]: via: (https://opensource.com/article/19/5/may-the-force-linux)
[#]: author: (Alan Formy-Duval  https://opensource.com/users/alanfdoss)

在 Linux 命令行下使用 force 参数
======
和绝地武士的原力一样，-f 参数是很强大的，并伴随着潜在的毁灭性，在你能用好的时候又很便利。
![Fireworks][1]

不久的过去，科幻发烧友开始庆祝每年的原力日（5月4日）[_星球大战_][2]，英语里和”愿原力和你同在“双关。虽然大多数 Linux 用户可能不是绝地武士，但我们依然可以使用 force。自然，如果 Yoda 直接叫路克天行者输入什么 ”man X翼战机“ 或者 “man 原力"的话电影肯定会无聊不少。或者他可以直接说，"RTFM"(Read the Force Manual，肯定是这个意思对不对）（译者：通常 RTFM 是 Read The Fucking Manual 的缩写，读读该死的手册吧）。

很多 Linux 指令都有 -f 选项，意思你现在肯定也知道了，force（强制）！很多时候你先尝试执行指令然后失败了，或者提示你需要输入更多选项。通常这都是为了保护你的文件或者告诉用户设备正忙或者文件已经存在之类的设计。

如果你不想被这些提醒打扰或者压根就不在乎，使用 force ！

不过要小心，通常使用 force 选项是摧毁性的。所以用户一定要格外注意并且确保你知道自己在做什么。用 force 就要承担后果！

以下是一些常见 Linux 命令的 force 选项和他们的效果，以及常见使用场景。

### cp
**cp** 是 copy 的缩写，这是个被用来复制文件或者目录的命令。[man 页面][3] 说：

```
-f, --force
如果已经存在的目标文件无法被打开，删除并重试
```
你可能会用它来处理只读状态的文件:

```
[alan@workstation ~]$ ls -l
total 8
-rw-rw---- 1 alan alan 13 May 1 12:24 Hoth
-r--r----- 1 alan alan 14 May 1 12:23 Naboo
[alan@workstation ~]$ cat Hoth Naboo
Icy Planet

Green Planet
```

如果你想要复制一个叫做 _Hoth_ 的文件到 _Naboo_，但因为 _Naboo_ 目前是只读状态，**cp** 指令不会执行：


```
[alan@workstation ~]$ cp Hoth Naboo
cp: cannot create regular file 'Naboo': Permission denied
```

但通过使用 force 选项，**cp** 会强制执行。_Hoth_ 的内容和文件权限会直接被复制到 _Naboo_：


```
[alan@workstation ~]$ cp -f Hoth Naboo
[alan@workstation ~]$ cat Hoth Naboo
Icy Planet

Icy Planet

[alan@workstation ~]$ ls -l
total 8
-rw-rw---- 1 alan alan 12 May 1 12:32 Hoth
-rw-rw---- 1 alan alan 12 May 1 12:38 Naboo
```

### ln

**ln** 指令是用来在文件之间建立链接的，[man 页面][4] 描述的 force 选项如下：


```
-f, --force
移除当前存在的文件
```

假设 Leia 公主在 维护一个 Java 应用服务器并且当前在一个有所有 Java 版本的目录里，她可能会想这么做：


```
leia@workstation:/usr/lib/java$ ls -lt
total 28
lrwxrwxrwx 1 leia leia 12 Mar 5 2018 jdk -> jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Mar 5 2018 jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Aug 28 2017 jdk1.8.0_144
```

正如你所看到的，这里有很多个版本的 JDK 和一些符号链接指向最新版的 JDK。她接着用一个脚本来安装最新版本的 JDK。但是如果没有 force 选项的话以下命令是不会成功的：


```
tar xvzmf jdk1.8.0_181.tar.gz -C jdk1.8.0_181/
ln -vs jdk1.8.0_181 jdk
```

**tar** 命令会解压 .gz 文件到一个特定的目标目录，但 **ln** 指令会失败因为这个链接已经存在了。这样的结果是链接不会指向最新版本的 JDK：


```
leia@workstation:/usr/lib/java$ ln -vs jdk1.8.0_181 jdk
ln: failed to create symbolic link 'jdk/jdk1.8.0_181': File exists
leia@workstation:/usr/lib/java$ ls -lt
total 28
drwxr-x--- 2 leia leia 4096 May 1 15:44 jdk1.8.0_181
lrwxrwxrwx 1 leia leia 12 Mar 5 2018 jdk -> jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Mar 5 2018 jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Aug 28 2017 jdk1.8.0_144
```

她可以通过使用 force 选项强制 **ln** 更新链接，但这里她还需要使用 -n，-n 是因为这个情况下链接其实指向一个目录而非文件。这样的话，链接就会正确指向最新版本的JDK了。


```
leia@workstation:/usr/lib/java$ ln -vsnf jdk1.8.0_181 jdk
'jdk' -> 'jdk1.8.0_181'
leia@workstation:/usr/lib/java$ ls -lt
total 28
lrwxrwxrwx 1 leia leia 12 May 1 16:13 jdk -> jdk1.8.0_181
drwxr-x--- 2 leia leia 4096 May 1 15:44 jdk1.8.0_181
drwxr-xr-x 8 leia leia 4096 Mar 5 2018 jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Aug 28 2017 jdk1.8.0_144
```

你可以配置 Java 应用使其一直使用在 **/usr/lib/java/jdk** 处的 JDK 而不用每次升级都要更新链接。

### rm

**rm** 指令是 remove 的缩写，叫做移除但也有一部分人喜欢叫它删除。[man 页面][5] 对 force 选项的描述如下：


```
-f, --force
无视不存在的文件或者选项，不向用户确认
```
如果你尝试删除一个只读的文件，**rm** 会寻求用户的确认：


```
[alan@workstation ~]$ ls -l
total 4
-r--r----- 1 alan alan 16 May 1 11:38 B-wing
[alan@workstation ~]$ rm B-wing
rm: remove write-protected regular file 'B-wing'?
```
你一定要输入 **y** 或者 **n** 来回答确认才能让 **rm** 命令继续。如果你使用 force 选项，**rm** 就不会寻求你的确认而直接删除文件：


```
[alan@workstation ~]$ rm -f B-wing
[alan@workstation ~]$ ls -l
total 0
[alan@workstation ~]$
```

最常见的 **rm** force 选项是用来删除目录。 **-r** （递归）选项会让 **rm** 删除目录，和 force 选项结合起来,它会删除这个文件夹及其内容而无需用户确认。

**rm** 命令和一些选项结合起来是致命的，一直以来互联网上都有关于误用 **rm** 删除整个系统之类的玩笑和鬼故事。比如最出名的一不当心执行 **rm -rf .** 会直接删除目录和文件（没有用户确认）。

### userdel

**userdel** 指令使用来删除用户的。[man 页面][6] 是这样描述它的 force 选项的：


```
-f, --force
这个选项会强制移除用户，即便用户当前处于登入状态。它同时还会强制
删除用户的目录和邮件，即便这个用户目录被别人共享或者邮件卷并不只
属于这个用户。如果 USERGROUPS_ENAB 在 /etc/login.defs 里是 yes 
并且有一个组和此用户同名的话，这个组也会被移除，即便这个组还是别
的用户的主要用户组也一样。

注意：这个选项有风险并可能让系统处于不稳定状态。
```

当欧比旺抵达穆斯塔法星的时候，他知道自己的使命。他需要删掉达斯·维达的用户账户——但达斯还登录在里面。


```
[root@workstation ~]# ps -fu darth
UID PID PPID C STIME TTY TIME CMD
darth 7663 7655 0 13:28 pts/3 00:00:00 -bash
[root@workstation ~]# userdel darth
userdel: user darth is currently used by process 7663
```

因为达斯还登入在系统里，欧比旺需要使用 force 选项操作 **userdel**。这能强制删除正登入的用户。


```
[root@workstation ~]# userdel -f darth
userdel: user darth is currently used by process 7663
[root@workstation ~]# finger darth
finger: darth: no such user.
[root@workstation ~]# ps -fu darth
error: user name does not exist
```

正如我们所见到的一样，**finger** 和 **ps** 命令让我们确认了达斯已经被删除了。

### 在 Shell 脚本里使用 force
很多指令都有 force 选项，而在 shell 脚本里他们特别游泳。因为我们经常使用脚本完成定期或者自动化的任务，避免用户输入至关重要，不然的话自动任务就无法完成了

我希望上面的几个例子能帮你理解在一些情况下 force 的用法。你在使用 force 或把他们写入脚本之前应当完全理解他们的作用。误用 force 会有毁灭性的后果——时常是对整个系统，甚至不仅限于一台设备。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/may-the-force-linux

作者：[Alan Formy-Duval ][a]
选题：[lujun9972][b]
译者：[Jerry Ling](https://github.com/Moelf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fireworks_light_art_design.jpg?itok=hfx9i4By (Fireworks)
[2]: https://www.starwars.com/star-wars-day
[3]: http://man7.org/linux/man-pages/man1/cp.1.html
[4]: http://man7.org/linux/man-pages/man1/ln.1.html
[5]: http://man7.org/linux/man-pages/man1/rm.1.html
[6]: http://man7.org/linux/man-pages/man8/userdel.8.html
