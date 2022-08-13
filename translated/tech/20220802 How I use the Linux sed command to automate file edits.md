[#]: subject: "How I use the Linux sed command to automate file edits"
[#]: via: "https://opensource.com/article/22/8/automate-file-edits-sed-linux"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "perfiffer"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

我是如何使用 Linux sed 命令自动进行文件编辑
======
以下是从 Linux 命令行自动编辑文件的一些提示和技巧。

![computer screen][1]

Image by: Opensource.com

当我使用 Linux 命令行时，无论是在台式机上编写新程序还是在 Web 服务器上管理网站，我经常需要处理文本文件。Linux 提供了强大的工具，我可以利用这些工具来完成我的工作。我经常使用 `sed`，一个可以根据模式修改文本的编辑器。

`sed` 代表 *<ruby>流编辑器 <rt><rp>(</rp>stream editor<rp>)</rp></rt></ruby>*，它编辑文件中的文本并打印结果。使用 `sed` 的一种方法是识别一个字符串在文件中出现的次数，并将它们替换为不同的字符串。你可以使用 `sed` 来处理文本文件，其程度似乎无穷无尽，但我想分享一些使用 `sed` 来帮助我管理文件的方法。 

### 在 Linux 上搜索和替换文件中的文本

要使用 `sed`，你需要使用一个*正则表达式*。正则表达式是定义模式的一组特殊字符。我最常使用 `sed` 的例子是替换文件中的文本。替换文本的语法如下：`s/originaltext/newtext`。`s` 告诉 `sed` 执行文本替换或交换出现的文本。在斜线之间提供原始文本和新文本。

此语法将仅替换每行中第一次出现的 *<ruby>原始文本 <rt><rp>(</rp>originaltext<rp>)</rp></rt></ruby>*。要替换每个匹配项，即使在一行中原始文本出现了不止一次，也要将 `g` 追加到表达式的末尾。例如：`s/originaltext/newtext/g`。

要在 `sed` 中使用此表达式，请使用 `-e` 选项指定此正则表达式：

```
$ sed -e 's/originaltext/newtext/g'
```

例如，假设我有一个名为 **game** 的 Makefile 文件，它模拟了 Conway 的生命游戏：

```
.PHONY: all run clean

all: game

game: game.o
        $(CC) $(CFLAGS) -o game game.o $(LDFLAGS)

run: game
        ./game

clean:
        $(RM) *~
        $(RM) *.o
        $(RM) game
```

**game** 这个名字并不是很有描述性，所以我可能会把它改名为 **life**。将 `game.c` 源文件重命名为 `life.c` 非常简单，但现在我需要修改 Makefile 以使用新名称。我可以使用 `sed` 来将所有的 **game** 更改为 **life**：

```
$ sed -e 's/game/life/g' Makefile
.PHONY: all run clean

all: life

life: life.o
        $(CC) $(CFLAGS) -o life life.o $(LDFLAGS)

run: life
        ./life

clean:
        $(RM) *~
        $(RM) *.o
        $(RM) life
```

`sed` 会将输出打印到屏幕上，这是检查文本替换是否符合你要求的好方法。要对 Makefile 进行这些更改，首先，备份文件，然后运行 `sed` 并将输出保存到原始文件名：

```
$ cp Makefile Makefile.old
$ sed -e 's/game/life/g' Makefile.old > Makefile
```

如果你确信你的更改正是你想要的，请使用 `-i` 或 `--in-place` 选项来编辑文件。但是，我建议添加一个备份文件后缀，类似于 `--in-place=.old`，用来备份原始文件，以备日后需要恢复时使用。它看起来像这样：

```
$ sed --in-place=.old -e 's/game/life/g' Makefile
$ ls Makefile*
Makefile  Makefile.old
```

### 在 Linux 上使用 sed 引用文件

你可以使用正则表达式的其它功能来匹配特定的文本实例。例如，你可能需要替换出现在行首的文本。使用 `sed`，你可以将行的开头与插入字符 **^** 匹配。

我使用“行首”来替换文本的一种方式是当我需要在电子邮件中引用一个文件时。假设我想在电子邮件中共享我的 Makefile，但我不想将其作为文件附件包含在内。相反，我更喜欢在电子邮件正文中“引用”文件，在每行之前使用 **>**。我可以使用以下 `sed` 命令将编辑后的版本打印到我的终端，并将其复制粘贴到新的电子邮件中：

```
$ sed -e 's/^/>/' Makefile
>.PHONY: all run clean
>
>all: life
>
>life: life.o
>       $(CC) $(CFLAGS) -o life life.o $(LDFLAGS)
>
>run: life
>       ./life
>
>clean:
>       $(RM) *~
>       $(RM) *.o
>       $(RM) life
```

`s/^/>/` 正则表达式匹配每行的开头（**^**），并在那里放置一个 **>**。实际上，这相当于每行都以 **>** 符号开始。

制表符可能无法在电子邮件中正确显示，但我可以通过添加另一个正则表达式将 Makefile 中的所有制表符替换为几个空格：

```
$ sed -e 's/^/>/' -e 's/\t/  /g' Makefile
>.PHONY: all run clean
>
>all: life
>
>life: life.o
>  $(CC) $(CFLAGS) -o life life.o $(LDFLAGS)
>
>run: life
>  ./life
>
>clean:
>  $(RM) *~
>  $(RM) *.o
>  $(RM) life
```

`\t` 表示文字制表符，因此 `s/\t/  /g` 告诉 `sed` 用输出中的两个空格替换输入中的所有制表符。

如果你需要对文件进行大量编辑，你可以将 `-e` 命令保存在文件中并使用 `-f` 选项来告诉 `sed` 将该文件用作"脚本"。如果你需要经常进行相同的编辑，这种方法特别有用。我已经准备了 `quotemail.sed` 的脚本文件来在我的电子邮件中引用 Makefile：

```
$ cat quotemail.sed
s/^/>/
s/\t/  /g
$ sed -f quotemail.sed Makefile
>.PHONY: all run clean
>
>all: life
>
>life: life.o
>  $(CC) $(CFLAGS) -o life life.o $(LDFLAGS)
>
>run: life
>  ./life
>
>clean:
>  $(RM) *~
>  $(RM) *.o
>  $(RM) life
```

### 学习在 Linux 上使用 sed

`sed` 是一个很好的工具，可以保存在你的 Linux 命令行工具包中。浏览 `sed` 手册页并了解有关如何使用它的更多信息。在命令行中键入 `man sed` 以获取有关不同命令行选项的完整文档，以及如何使用 `sed` 处理文本文件。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/automate-file-edits-sed-linux

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/features_solutions_command_data.png
