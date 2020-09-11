[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11300-1.html)
[#]: subject: (How to rename a group of files on Linux)
[#]: via: (https://www.networkworld.com/article/3433865/how-to-rename-a-group-of-files-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何在 Linux 上重命名一组文件
======

> 要用单个命令重命名一组文件，请使用 rename 命令。它需要使用正则表达式，并且可以在开始前告诉你会有什么更改。

![](https://img.linux.net.cn/data/attachment/album/201909/03/005333hfm8yf90m2gm800g.jpg)

几十年来，Linux 用户一直使用 `mv` 命令重命名文件。它很简单，并且能做到你要做的。但有时你需要重命名一大组文件。在这种情况下，`rename` 命令可以使这个任务更容易。它只需要一些正则表达式的技巧。

与 `mv` 命令不同，`rename` 不允许你简单地指定旧名称和新名称。相反，它使用类似于 Perl 中的正则表达式。在下面的例子中，`s` 指定我们将第一个字符串替换为第二个字符串（旧的），从而将 `this.new` 变为 `this.old`。

```
$ rename 's/new/old/' this.new
$ ls this*
this.old
```

使用 `mv this.new this.old` 可以更容易地进行更改一个，但是将字符串 `this` 变成通配符  `*`，你可以用一条命令将所有的 `*.new` 文件重命名为 `*.old`：

```
$ ls *.new
report.new  schedule.new  stats.new  this.new
$ rename 's/new/old/' *.new
$ ls *.old
report.old  schedule.old  stats.old  this.old
```

正如你所料，`rename` 命令不限于更改文件扩展名。如果你需要将名为 `report.*` 的文件更改为 `review.*`，那么可以使用以下命令做到：

```
$ rename 's/report/review/' *
```

正则表达式中的字符串可以更改文件名的任何部分，无论是文件名还是扩展名。

```
$ rename 's/123/124/' *
$ ls *124*
status.124  report124.txt
```

如果你在 `rename` 命令中添加 `-v` 选项，那么该命令将提供一些反馈，以便你可以看到所做的更改，或许会包含你没注意的。这让你注意到并按需还原更改。

```
$ rename -v 's/123/124/' *
status.123 renamed as status.124
report123.txt renamed as report124.txt
```

另一方面，使用 `-n`（或 `--nono`）选项会使 `rename` 命令告诉你将要做的但不会实际做的更改。这可以让你免于执行不不想要的操作，然后再还原更改。

```
$ rename -n 's/old/save/' *
rename(logger.man-old, logger.man-save)
rename(lyrics.txt-old, lyrics.txt-save)
rename(olderfile-, saveerfile-)
rename(oldfile, savefile)
rename(review.old, review.save)
rename(schedule.old, schedule.save)
rename(stats.old, stats.save)
rename(this.old, this.save)
```

如果你对这些更改满意，那么就可以运行不带 `-n` 选项的命令来更改文件名。

但请注意，正则表达式中的 `.` **不会**被视为句点，而是作为匹配任何字符的通配符。上面和下面的示例中的一些更改可能不是输入命令的人希望的。

```
$ rename -n 's/.old/.save/' *
rename(logger.man-old, logger.man.save)
rename(lyrics.txt-old, lyrics.txt.save)
rename(review.old, review.save)
rename(schedule.old, schedule.save)
rename(stats.old, stats.save)
rename(this.old, this.save)
```

为确保句点按照字面意思执行，请在它的前面加一个反斜杠。这将使其不被解释为通配符并匹配任何字符。请注意，进行此更改时，仅选择了 `.old` 文件。

```
$ rename -n 's/\.old/.save/' *
rename(review.old, review.save)
rename(schedule.old, schedule.save)
rename(stats.old, stats.save)
rename(this.old, this.save)
```

下面的命令会将文件名中的所有大写字母更改为小写，除了使用 `-n` 选项来确保我们在命令执行之前检查将做的修改。注意在正则表达式中使用了 `y`，这是改变大小写所必需的。

```
$ rename -n 'y/A-Z/a-z/' W*
rename(WARNING_SIGN.pdf, warning_sign.pdf)
rename(Will_Gardner_buttons.pdf, will_gardner_buttons.pdf)
rename(Wingding_Invites.pdf, wingding_invites.pdf)
rename(WOW-buttons.pdf, wow-buttons.pdf)
```

在上面的例子中，我们将所有大写字母更改为了小写，但这仅对以大写字母 `W` 开头的文件名。

### 总结

当你需要重命名大量文件时，`rename` 命令非常有用。请注意不要做比预期更多的更改。请记住，`-n`（或者 `--nono`）选项可以帮助你避免耗时的错误。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3433865/how-to-rename-a-group-of-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/08/card-catalog-machester_city_library-100809242-large.jpg
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
