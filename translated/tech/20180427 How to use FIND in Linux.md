如何在 Linux 中使用 FIND
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux31x_cc.png?itok=Pvim4U-B)

在[最近的一篇 Opensource.com 文章][1]中，Lewis Cowles 介绍了 `find` 命令。

`find` 是日常工具箱中功能更强大、更灵活的命令行工具之一，因此值得花费更多的时间。

最简单的，`find` 跟上路径寻找一些东西。例如：
```
find /

```

它将找到（并打印）系统中的每个文件。而且由于一切都是文件，你会得到很多输出需要排序。这可能不会帮助你找到你要找的东西。你可以改变路径参数来缩小范围，但它不会比使用 `ls` 命令更有帮助。所以你需要考虑你想要找的东西。

也许你想在主目录中找到所有的 JPEG 文件。 `-name` 参数允许你将结果限制为与给定模式匹配的文件。
```
find ~ -name '*jpg'

```

可是等等！如果它们中的一些是大写的扩展名会怎么样？`-iname` 就像 `-name`，但是不区分大小写。
```
find ~ -iname '*jpg'

```

很好！但是 8.3 名称方案是如此的老。一些图片可能是 .jpeg 扩展名。幸运的是，我们可以将模式用 “or” 表示为  `-o`，来组合。
```
find ~ ( -iname 'jpeg' -o -iname 'jpg' )

```

我们正在接近。但是如果你有一些以 jpg 结尾的目录呢？ （为什么你命名一个 `bucketofjpg` 而不是 `pictures` 的目录超出了我的范围。）我们使用 `-type` 参数修改我们的命令来查找文件。
```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type f

```

或者，也许你想找到那些命名奇怪的目录，以便稍后重命名它们：
```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type d

```

你最近拍了很多照片，所以让我们把它缩小到上周更改的文件。
```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type f -mtime -7

```

你可以根据文件状态更改时间 （ctime），修改时间 （mtime） 或访问时间 （atime） 来执行时间过滤。 这些是在几天内，所以如果你想要更细粒度的控制，你可以表示为在几分钟内（分别是 `cmin`、`mmin` 和 `amin`）。 除非你确切地知道你想要的时间，否则你可能会在 + （大于）或 - （小于）的后面加上数字。

但也许你不关心你的照片。也许你的磁盘空间不够用，所以你想在 `log` 目录下找到所有巨大的（让我们定义为“大于 1GB”）文件：
```
find /var/log -size +1G

```

或者，也许你想在 `/ data` 中找到 bcotton 拥有的所有文件：
```
find /data -owner bcotton

```

你还可以根据权限查找文件。也许你想在你的主目录中找到对所有人可读的文件，以确保你不会过度分享。
```
find ~ -perm -o=r

```

这篇文章只说了 `find` 能做什么的表面。将测试与布尔逻辑相结合可以为你提供难以置信的灵活性，以便准确找到要查找的文件。并且像 `-exec` 或 `-delete` 这样的参数，你可以让 `find` 对它发现的内容采取行动。你有任何最喜欢的 `find` 表达式么？在评论中分享它们！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/how-use-find-linux

作者：[Ben Cotton][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bcotton
[1]:https://opensource.com/article/18/4/how-find-files-linux
