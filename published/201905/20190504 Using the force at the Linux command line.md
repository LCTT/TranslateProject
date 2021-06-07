[#]: collector: (lujun9972)
[#]: translator: (Moelf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10881-1.html)
[#]: subject: (Using the force at the Linux command line)
[#]: via: (https://opensource.com/article/19/5/may-the-force-linux)
[#]: author: (Alan Formy-Duval  https://opensource.com/users/alanfdoss)

在 Linux 命令行下使用“原力”
======

> 和绝地武士的原力一样，`-f` 参数是很强大的，并伴随着潜在的毁灭性，在你能用好的时候又很便利。

![Fireworks](https://img.linux.net.cn/data/attachment/album/201905/21/083913jqbwn4ywq1jqnb9y.jpg)

近些年来，科幻发烧友开始在每年的 5 月 4 日庆祝[星战节][2]，其口号是绝地武士的祝福语”愿<ruby>原力<rt>Force</rt></ruby>和你同在“。虽然大多数 Linux 用户可能不是绝地武士，但我们依然可以使用<ruby>原力<rt>Force</rt></ruby>。自然，如果尤达大师只是叫天行者卢克输入什么 “man X-Wing 战机“、“man 原力”，或者 RTFM（去读原力手册，肯定是这个意思对不对），那这电影肯定没啥意思。（LCTT 译注：RTFM 是 “Read The Fucking Manual” 的缩写 —— 读读该死的手册吧）。

很多 Linux 命令都有 `-f` 选项，意思你现在肯定也知道了，原力（LCTT 译注：force 选项原意是“强制”）！很多时候你先尝试执行命令然后失败了，或者提示你需要补充输入更多选项。通常这都是为了保护你试着改变的文件，或者告诉用户该设备正忙或文件已经存在之类的。

如果你不想被这些提醒打扰或者压根就不在乎，就使用原力吧！

不过要小心，通常使用原力选项是摧毁性的。所以用户一定要格外注意！并且确保你知道自己在做什么！用原力就要承担后果！

以下是一些常见 Linux 命令的原力选项和它们的效果，以及常见使用场景。

### cp

`cp` 是 “copy” 的缩写，这是个被用来复制文件或者目录的命令。其 [man 页面][3] 说：

> -f, --force
> 
> 如果已经存在的目标文件无法被打开，删除它并重试

你可能会用它来处理只读状态的文件：

```
[alan@workstation ~]$ ls -l
total 8
-rw-rw---- 1 alan alan 13 May 1 12:24 Hoth
-r--r----- 1 alan alan 14 May 1 12:23 Naboo
[alan@workstation ~]$ cat Hoth Naboo
Icy Planet

Green Planet
```

如果你想要复制一个叫做 `Hoth` 的文件到 `Naboo`，但因为 `Naboo` 目前是只读状态，`cp` 命令不会执行：

```
[alan@workstation ~]$ cp Hoth Naboo
cp: cannot create regular file 'Naboo': Permission denied
```

但通过使用原力，`cp` 会强制执行。`Hoth` 的内容和文件权限会直接被复制到 `Naboo`：


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

`ln` 命令是用来在文件之间建立链接的，其 [man 页面][4] 描述的原力选项如下：


> -f, --force
>
> 移除当前存在的文件


假设莱娅公主在维护一个 Java 应用服务器，并且她又一个存放这所有 Java 版本的目录，比如：

```
leia@workstation:/usr/lib/java$ ls -lt
total 28
lrwxrwxrwx 1 leia leia   12 Mar  5  2018 jdk -> jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Mar  5  2018 jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Aug 28  2017 jdk1.8.0_144
```

正如你所看到的，这里有很多个版本的 JDK，并有一个符号链接指向最新版的 JDK。她接着用一个脚本来安装最新版本的 JDK。但是如果没有原力选项的话以下命令是不会成功的：

```
tar xvzmf jdk1.8.0_181.tar.gz -C jdk1.8.0_181/
ln -vs jdk1.8.0_181 jdk
```

`tar` 命令会解压 .gz 文件到一个特定的目标目录，但 `ln` 命令会失败，因为这个链接已经存在了。这样的结果是该符号链接不会指向最新版本的 JDK：

```
leia@workstation:/usr/lib/java$ ln -vs jdk1.8.0_181 jdk
ln: failed to create symbolic link 'jdk/jdk1.8.0_181': File exists
leia@workstation:/usr/lib/java$ ls -lt
total 28
drwxr-x--- 2 leia leia 4096 May  1 15:44 jdk1.8.0_181
lrwxrwxrwx 1 leia leia   12 Mar  5  2018 jdk -> jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Mar  5  2018 jdk1.8.0_162
drwxr-xr-x 8 leia leia 4096 Aug 28  2017 jdk1.8.0_144
```

她可以通过使用原力选项强制 `ln` 更新链接，但这里她还需要使用 `-n`，`-n` 是因为这个情况下链接其实指向一个目录而非文件。这样的话，链接就会正确指向最新版本的JDK了。

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

你可以配置 Java 应用使其一直使用在 `/usr/lib/java/jdk` 处的 JDK，而不用每次升级都更新。

### rm

`rm` 命令是 “remove” 的缩写（也叫做删除，因为某些系统 `del` 命令也干这事）。其 [man 页面][5] 对原力选项的描述如下：


> -f, --force
> 
> 无视不存在的文件或者参数，不向用户确认

如果你尝试删除一个只读的文件，`rm` 会寻求用户的确认：

```
[alan@workstation ~]$ ls -l
total 4
-r--r----- 1 alan alan 16 May  1 11:38 B-wing
[alan@workstation ~]$ rm B-wing 
rm: remove write-protected regular file 'B-wing'?
```

你一定要输入 `y` 或者 `n` 来回答确认才能让 `rm` 命令继续。如果你使用原力选项，`rm` 就不会寻求你的确认而直接删除文件：

```
[alan@workstation ~]$ rm -f B-wing
[alan@workstation ~]$ ls -l
total 0
[alan@workstation ~]$
```

最常见的 `rm` 原力选项用法是用来删除目录。 `-r`（递归）选项会让 `rm` 删除目录，当和原力选项结合起来，它会删除这个文件夹及其内容而无需用户确认。

`rm` 命令和一些选项结合起来是致命的，一直以来互联网上都有关于误用 `rm` 删除整个系统之类的玩笑和鬼故事。比如最出名的一不当心执行 `rm -rf .` 会直接删除目录和文件（没有用户确认）。（LCTT 译注：真的这么干过的校对飘过~~请按下回车前再三确认：我是谁，我在哪里，我在干什么）

### userdel

`userdel` 命令使用来删除用户的。其 [man 页面][6] 是这样描述它的原力选项的：

> -f, --force
> 
> 这个选项会强制移除用户，即便用户当前处于登入状态。它同时还会强制
删除用户的目录和邮件存储，即便这个用户目录被别人共享或者邮件存储并不
属于这个用户。如果 `USERGROUPS_ENAB` 在 `/etc/login.defs` 里是 `yes` 
并且有一个组和此用户同名的话，这个组也会被移除，即便这个组还是别
的用户的主要用户组也一样。
>
> 注意：这个选项有风险并可能让系统处于不稳定状态。

当欧比旺抵达穆斯塔法星的时候，他知道自己的使命。他需要删掉达斯·维达的用户账户——而达斯还在里面呢。

```
[root@workstation ~]# ps -fu darth
UID        PID  PPID  C STIME TTY          TIME CMD
darth     7663  7655  0 13:28 pts/3    00:00:00 -bash
[root@workstation ~]# userdel darth
userdel: user darth is currently used by process 7663
```

因为达斯还登在系统里，欧比旺需要使用原力选项操作 `userdel`。这能强制删除当前登入的用户。

```
[root@workstation ~]# userdel -f darth
userdel: user darth is currently used by process 7663
[root@workstation ~]# finger darth
finger: darth: no such user.
[root@workstation ~]# ps -fu darth
error: user name does not exist
```

正如我们所见到的一样，`finger` 和 `ps` 命令让我们确认了达斯已经被删除了。

### 在 Shell 脚本里使用原力

很多命令都有原力选项，而在 shell 脚本里他们特别有用。因为我们经常使用脚本完成定期或者自动化的任务，避免用户输入至关重要，不然的话自动任务就无法完成了

我希望上面的几个例子能帮你理解一些需要使用原力的情况。你在命令行使用原力或把它们写入脚本之前应当完全理解它们的作用。误用原力会有毁灭性的后果——时常是对整个系统，甚至不仅限于一台设备。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/may-the-force-linux

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[Jerry Ling](https://github.com/Moelf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fireworks_light_art_design.jpg?itok=hfx9i4By (Fireworks)
[2]: https://www.starwars.com/star-wars-day
[3]: http://man7.org/linux/man-pages/man1/cp.1.html
[4]: http://man7.org/linux/man-pages/man1/ln.1.html
[5]: http://man7.org/linux/man-pages/man1/rm.1.html
[6]: http://man7.org/linux/man-pages/man8/userdel.8.html
