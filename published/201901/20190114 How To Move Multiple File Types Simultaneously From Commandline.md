[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10464-1.html)
[#]: subject: (How To Move Multiple File Types Simultaneously From Commandline)
[#]: via: (https://www.ostechnix.com/how-to-move-multiple-file-types-simultaneously-from-commandline/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

如何从命令行同时移动多种文件类型
======

![](https://www.ostechnix.com/wp-content/uploads/2019/01/Move-Multiple-File-Types-720x340.png)

前几天，我想知道如何将多个文件类型从一个目录移动（不复制）到另一个目录。我已经知道如何[查找并将某些类型的文件从一个目录复制到另一个目录][1]。但是，我不知道如何同时移动多种文件类型。如果你曾遇到这样的情况，我知道在类 Unix 系统中从命令行执行该操作的一个简单方法。

### 同时移动多种文件类型

想象一下这种场景，你在名为 `dir1` 的目录中有多种类型的文件，例如 .pdf、 .doc、 .mp3、 .mp4、 .txt 等等。我们来看看 `dir1` 的内容：

```
$ ls dir1
file.txt image.jpg mydoc.doc personal.pdf song.mp3 video.mp4
```

你希望将某些文件类型（不是所有文件类型）移动到另一个位置。例如，假设你想将 .doc、 .pdf 和 .txt 文件一次性移动到名为 `dir2` 的另一个目录中。

要同时将 .doc、 .pdf 和 .txt 文件从 `dir1` 移动到 `dir2`，命令是：

```
$ mv dir1/*.{doc,pdf,txt} dir2/
```

很容易，不是吗？

现在让我们来查看一下 `dir2` 的内容：

```
$ ls dir2/
file.txt mydoc.doc personal.pdf
```

看到了吗？只有 .doc、 .pdf 和 .txt 从 `dir1` 移到了 `dir2`。

![][3]

在上面的命令中，你可以在花括号内添加任意数量的文件类型，以将它们移动到不同的目录中。它在 Bash 上非常适合我。

另一种移动多种文件类型的方法是转到源目录，在我们的例子中即为 `dir1`：

```
$ cd ~/dir1
```

将你选择的文件类型移动到目的地（即 `dir2`），如下所示：

```
$ mv *.doc *.txt *.pdf /home/sk/dir2/
```

要移动具有特定扩展名的所有文件，例如 .doc，运行：

```
$ mv dir1/*.doc dir2/
```

更多细节，参考 man 页：

```
$ man mv
```

移动一些相同或不同的文件类型很容易！你可以在 GUI 模式下单击几下鼠标，或在 CLI 模式下使用一行命令来完成。但是，如果目录中有数千种不同的文件类型，并且希望一次将多种文件类型移动到不同的目录，这将是一项繁琐的任务。对我来说，上面的方法很容易完成工作！如果你知道任何其它一行命令可以一次移动多种文件类型，请在下面的评论部分与我们分享。我会核对并更新指南。

这些就是全部了，希望这很有用。更多好东西将要来了，敬请关注！

共勉！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-move-multiple-file-types-simultaneously-from-commandline/

作者：[SK][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/find-copy-certain-type-files-one-directory-another-linux/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: http://www.ostechnix.com/wp-content/uploads/2019/01/mv-command.gif
