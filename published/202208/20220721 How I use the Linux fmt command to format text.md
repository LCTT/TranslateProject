[#]: subject: "How I use the Linux fmt command to format text"
[#]: via: "https://opensource.com/article/22/7/fmt-trivial-text-formatter"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "perfiffer"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14886-1.html"

我是如何使用 Linux fmt 命令来格式化文本
======

![](https://img.linux.net.cn/data/attachment/album/202208/01/184300zbyfjayeyqa5pmcb.jpg)

> fmt 命令是一个简单的文本格式化程序。我将在这里展示如何使用它来格式化文本和邮件回复。

当我为项目编写文档时，我经常以纯文本的形式编写自述文件和安装说明。我不需要使用 HTML 或者 Markdown 之类的标记语言来描述项目的功能或如何编译它。但是维护这样的文档可能会很痛苦。如果我需要更新我的 `Readme` 文件中的一个句子的中间位置，我需要重新格式化文本，以避免在我的其它文本中间出现一个很长或很短的行，而其它的行的格式是整整齐齐的 75 列。一些编辑器包含可以自动重新格式化文本以填充段落的功能，但并非所有的编辑器都这样做。这就是 Linux `fmt` 命令的用武之地。

### 使用 Linux fmt 命令格式化文本

`fmt` 命令是一个简单的文本格式化程序；它收集单词并填充段落，但不应用任何其它文本样式，例如斜体或粗体。这一切都是纯文本。使用 `fmt` 命令，你可以快速调整文本，使其更易于阅读。让我们从这个熟悉的示例文本开始:

```
$ cat trek.txt 
Space: the final
frontier. These are the voyages
of the starship Enterprise. Its
continuing mission: to explore
strange new worlds. To
seek out new life and new
civilizations. To boldly go
where no one has gone before!
```

在这个实例文件中，每行都有不同的长度，并且它们以一种奇怪的方式换行。如果你对纯文本文件进行大量更改，你可以会遇到类似的奇怪的换行。要重新格式化此文本，你可以使用 `fmt` 命令将段落的行填充为统一长度：

```
$ fmt trek.txt 
Space: the final frontier. These are the voyages of the starship
Enterprise. Its continuing mission: to explore strange new worlds. To
seek out new life and new civilizations. To boldly go where no one has
gone before!
```

默认情况下，`fmt` 会将文本格式化为 75 的列宽大小，但你可以使用 `-w` 或 `--width` 选项进行更改：

```
$ fmt -w 60 trek.txt 
Space: the final frontier. These are the voyages of
the starship Enterprise. Its continuing mission: to
explore strange new worlds. To seek out new life and new
civilizations. To boldly go where no one has gone before!
```

### 使用 Linux fmt 命令格式化电子邮件回复

我加入了一个邮件列表，这里更喜欢纯文本电子邮件，这使得在列表服务器上归档电子邮件变得更加容易。但现实是并非每个人都以纯文本形式发送电子邮件。有时候，当我以纯文本形式回复这些电子邮件时，我的电子邮件客户端会将整个段落放在一行中。这使得在电子邮件中“引用”回复变得困难。

这是一个简单的例子。当我以纯文本形式回复电子邮件时，我的电子邮件客户端通过在每行前添加 `>` 字符来“引用”对方的电子邮件。对于一条短消息，可能如下所示：

```
> I like the idea of the interim development builds.
```

没有正确“换行”的长行将无法在我的纯文本电子邮件回复中正确显示，因为它只是前面带有 `>` 字符的长行，如下所示：

```
> I like the idea of the interim development builds. This should be a great way to test new changes that everyone can experiment with.
```

为了解决这个问题，我打开了一个终端并将引用的文本复制并粘贴到一个新文件中。然后我使用 `-p` 或 `--prefix` 选项来告诉 `fmt` 在每一行之前使用什么字符作为“前缀”。

```
$ cat > email.txt
> I like the idea of the interim development builds. This should be a great way to test new changes that everyone can experiment with.
^D
$ fmt -p '>' email.txt
> I like the idea of the interim development builds. This should be a
> great way to test new changes that everyone can experiment with.
```

`fmt` 命令是一个非常简单的文本格式化程序，但它可以做很多有用的事情，可以帮助以纯文本形式编写和更新文档。要了解其它选项，例如 `-c` 或 `--crown-margin` 以匹配段落前两行缩进，例如项目列表。还可以尝试使用 `-t` 或者 `--tagged-paragraph` 来保留段落中第一行的缩进，就像缩进的段落一样。`-u` 或 `--uniform-spacing` 选项在单词之间使用一个空格，在句子之间使用两个空格。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/fmt-trivial-text-formatter

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/osdc-docdish-typewriterkeys-3-series.png
