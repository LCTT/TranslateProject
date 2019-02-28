[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10529-1.html)
[#]: subject: (More About Angle Brackets in Bash)
[#]: via: (https://www.linux.com/blog/learn/2019/1/more-about-angle-brackets-bash)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

Bash 中尖括号的更多用法
======
> 在这篇文章，我们继续来深入探讨尖括号的更多其它用法。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/bash-angles.png?itok=mVFnxPzF)

在[上一篇文章][1]当中，我们介绍了尖括号（`<>`）以及它们的一些用法。在这篇文章，我们继续来深入探讨尖括号的更多其它用法。

通过使用 `<`，可以实现“欺骗”的效果，让其它命令认为某个命令的输出是一个文件。

例如，在进行备份文件的时候不确定备份是否完整，就需要去确认某个目录是否已经包含从原目录中复制过去的所有文件。你可以试一下这样操作：

```
diff <(ls /original/dir/) <(ls /backup/dir/)
```

[diff][2] 命令是一个逐行比较两个文件之间差异的工具。在上面的例子中，就使用了 `<` 让 `diff` 认为两个 `ls` 命令输出的结果都是文件，从而能够比较它们之间的差异。

要注意，在 `<` 和 `(...)` 之间是没有空格的。

我尝试在我的图片目录和它的备份目录执行上面的命令，输出的是以下结果：

```
diff <(ls /My/Pictures/) <(ls /My/backup/Pictures/) 
5d4 < Dv7bIIeUUAAD1Fc.jpg:large.jpg
```

输出结果中的 `<` 表示 `Dv7bIIeUUAAD1Fc.jpg:large.jpg` 这个文件存在于左边的目录（`/My/Pictures`）但不存在于右边的目录（`/My/backup/Pictures`）中。也就是说，在备份过程中可能发生了问题，导致这个文件没有被成功备份。如果 `diff` 没有显示出任何输出结果，就表明两个目录中的文件是一致的。

看到这里你可能会想到，既然可以通过 `<` 将一些命令行的输出内容作为一个文件提供给一个需要接受文件格式的命令，那么在上一篇文章的“最喜欢的演员排序”例子中，就可以省去中间的一些步骤，直接对输出内容执行 `sort` 操作了。

确实如此，这个例子可以简化成这样：

```
sort -r <(while read -r name surname films;do echo $films $name $surname ; done < CBactors)
```

### Here 字符串

除此以外，尖括号的重定向功能还有另一种使用方式。

使用 `echo` 和管道（`|`）来传递变量的用法，相信大家都不陌生。假如想要把一个字符串变量转换为全大写形式，你可以这样做：

```
myvar="Hello World" echo $myvar | tr '[:lower:]' '[:upper:]' HELLO WORLD
```

[tr][3] 命令可以将一个字符串转换为某种格式。在上面的例子中，就使用了 `tr` 将字符串中的所有小写字母都转换为大写字母。

要理解的是，这个传递过程的重点不是变量，而是变量的值，也就是字符串 `Hello World`。这样的字符串叫做 HERE 字符串，含义是“这就是我们要处理的字符串”。但对于上面的例子，还可以用更直观的方式的处理，就像下面这样：

```
tr '[:lower:]' '[:upper:]' <<< $myvar
```

这种简便方式并不需要使用到 `echo` 或者管道，而是使用了我们一直在说的尖括号。

### 总结

使用 `<` 和 `>` 这两个简单的符号，原来可以实现这么多功能，Bash 又一次为工作的灵活性提供了很多选择。

当然，我们的介绍还远远没有完结，因为还有很多别的符号可以为 Bash 命令带来更多便利。不过如果没有充分理解它们，充满符号的 Bash 命令看起来只会像是一堆乱码。接下来我会解读更多类似的 Bash 符号，下次见！

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/1/more-about-angle-brackets-bash

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10502-1.html
[2]: https://linux.die.net/man/1/diff
[3]: https://linux.die.net/man/1/tr

