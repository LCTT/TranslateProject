[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11469-1.html)
[#]: subject: (Command line quick tips: Locate and process files with find and xargs)
[#]: via: (https://fedoramagazine.org/command-line-quick-tips-locate-and-process-files-with-find-and-xargs/)
[#]: author: (Ben Cotton https://fedoramagazine.org/author/bcotton/)

命令行技巧：使用 find 和 xargs 查找和处理文件
======

![][1]

`find` 是日常工具箱中功能强大、灵活的命令行程序之一。它如它名字所暗示的：查找符合你指定条件的文件和目录。借助 `-exec` 或 `-delete` 之类的参数，你可以让它对找到的文件进行操作。

在[命令行提示][2]系列的这一期中，你将会看到 `find` 命令的介绍，并学习如何使用内置命令或使用 `xargs` 命令处理文件。

### 查找文件

`find` 至少要加上查找的路径。例如，此命令将查找（并打印）系统上的每个文件：

```
find /
```

由于一切皆文件，因此你会看到大量的输出。这可能无法帮助你找到所需的内容。你可以更改路径参数缩小范围，但这实际上并没有比使用 `ls` 命令更好。因此，你需要考虑要查找的内容。

也许你想在家目录中查找所有 JPEG 文件。 `-name` 参数允许你将结果限制为与给定模式匹配的文件。

```
find ~ -name '*jpg'
```

但是等等！如果其中一些扩展名是大写怎么办？ `-iname` 类似于 `-name`，但不区分大小写：

```
find ~ -iname '*jpg'
```

很好！但是 8.3 命名方案出自 1985 年。某些图片的扩展名可能是 .jpeg。幸运的是，我们可以将模式使用“或”（`-o`）进行组合。括号需要转义，以便使 `find` 命令而不是 shell 程序尝试解释它们。

```
find ~ \( -iname 'jpeg' -o -iname 'jpg' \)
```

更进一步。如果你有一些以 `jpg` 结尾的目录怎么办？（我不懂你为什么将目录命名为 `bucketofjpg` 而不是 `pictures`？）我们可以加上 `-type` 参数来仅查找文件：

```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type f
```

或者，也许你想找到那些名字奇怪的目录，以便之后可以重命名它们：

```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type d
```

最近你拍摄了很多照片，因此使用 `-mtime`（修改时间）将范围缩小到最近一周修改过的文件。 `-7` 表示 7 天或更短时间内修改的所有文件。

```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type f -mtime -7
```

### 使用 xargs 进行操作

`xargs` 命令从标准输入流中获取参数，并基于它们执行命令。继续使用上一节中的示例，假设你要将上周修改过的家目录中的所有 JPEG 文件复制到 U 盘，以便插到电子相册上。假设你已经将 U 盘挂载到 `/media/photo_display`。

```
find ~ \( -iname '*jpeg' -o -iname '*jpg' \) -type f -mtime -7 -print0 | xargs -0 cp -t /media/photo_display
```

这里的 `find` 命令与以前的版本略有不同。`-print0` 命令让输出有一些更改：它不使用换行符，而是添加了一个 `null` 字符。`xargs` 的 `-0`（零）选项可调整解析以达到预期效果。这很重要，不然对包含空格、引号或其他特殊字符的文件名执行操作可能无法按预期进行。对文件采取任何操作时，都应使用这些选项。

`cp` 命令的 `-t` 参数很重要，因为 `cp` 通常要求目的地址在最后。你可以不使用 `xargs` 而使用 `find` 的 `-exec` 执行此操作，但是 `xargs` 的方式会更快，尤其是对于大量文件，因为它会单次调用 `cp`。

### 了解更多

这篇文章仅仅是 `find` 可以做的事情的表面。 `find` 支持基于权限、所有者、访问时间等的测试。它甚至可以将搜索路径中的文件与其他文件进行比较。将测试与布尔逻辑相结合，可以为你提供惊人的灵活性，以精确地找到你要查找的文件。使用内置命令或管道传递给 `xargs`，你可以快速处理大量文件。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/command-line-quick-tips-locate-and-process-files-with-find-and-xargs/

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/bcotton/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/10/commandlinequicktips-816x345.jpg
[2]: https://fedoramagazine.org/?s=command+line+quick+tips
[3]: https://opensource.com/article/18/4/how-use-find-linux
[4]: https://unsplash.com/@wflwong?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[5]: https://unsplash.com/s/photos/search?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
