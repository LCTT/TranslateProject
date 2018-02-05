谨慎使用 Linux find 命令
======
![](https://images.idgesg.net/images/article/2017/10/caution-sign-100738884-large.jpg)
最近有朋友提醒我可以添加一个有用的选项来更加谨慎地运行 find 命令，它是 -ok。除了一个重要的区别之外，它的工作方式与 -exec 相似，它使 find 命令在执行指定的操作之前请求权限。

这有一个例子。如果你使用 find 命令查找文件并删除它们，则可以运行下面的命令：
```
$ find . -name runme -exec rm {} \;

```

在当前目录及其子目录中中任何名为 “runme” 的文件都将被立即删除 - 当然，你要有权删除它们。改用 -ok 选项，你会看到类似这样的东西，find 命令将在删除文件之前会请求权限。回答 **y** 代表 “yes” 将允许 find 命令继续并逐个删除文件。
```
$ find . -name runme -ok rm {} \;
< rm ... ./bin/runme > ?

```

### -exedir 命令也是一个选项

另一个可以用来修改 find 命令行为并可能使其更可控的选项是 -execdir 。其中 -exec 运行指定的任何命令，-execdir 从文件所在的目录运行指定的命令，而不是在运行 find 命令的目录运行。这是一个它的例子：
```
$ pwd
/home/shs
$ find . -name runme -execdir pwd \;
/home/shs/bin

```
```
$ find . -name runme -execdir ls \;
ls rm runme

```

到现在为止还挺好。但要记住的是，-execdir 也会在匹配文件的目录中执行命令。如果运行下面的命令，并且目录包含一个名为 “ls” 的文件，那么即使该文件没有_执行权限，它也将运行该文件。使用 **-exec** 或 **-execdir** 类似于通过 source 来运行命令。
```
$ find . -name runme -execdir ls \;
Running the /home/shs/bin/ls file

```
```
$ find . -name runme -execdir rm {} \;
This is an imposter rm command

```
```
$ ls -l bin
total 12
-r-x------ 1 shs shs 25 Oct 13 18:12 ls
-rwxr-x--- 1 shs shs 36 Oct 13 18:29 rm
-rw-rw-r-- 1 shs shs 28 Oct 13 18:55 runme

```
```
$ cat bin/ls
echo Running the $0 file
$ cat bin/rm
echo This is an imposter rm command

```

### -okdir 选项也会请求权限

要更谨慎，可以使用 **-okdir** 选项。类似 **-ok**，该选项将请求权限来运行该命令。
```
$ find . -name runme -okdir rm {} \;
< rm ... ./bin/runme > ?

```

你也可以小心地指定你想用的命令的完整路径，以避免像上面那样的冒牌命令出现的任何问题。
```
$ find . -name runme -execdir /bin/rm {} \;

```

find 命令除了默认打印之外还有很多选项，有些可以使你的文件搜索更精确，但谨慎一点总是好的。

在 [Facebook][1] 和 [LinkedIn][2] 上加入网络世界社区来进行评论。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3233305/linux/using-the-linux-find-command-with-caution.html

作者：[Sandra Henry-Stocker][a]
译者：[geekpi](https://github.com/geekpi)
校对：[Locez](https://github.com/locez)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.facebook.com/NetworkWorld/
[2]:https://www.linkedin.com/company/network-world
