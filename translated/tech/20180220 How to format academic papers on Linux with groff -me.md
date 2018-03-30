# 在 Linux 上使用 groff -me 格式化你的学术论文

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_paperclips.png?itok=j48op49T)

当我在 1993 年发现 Linux 时，我还是一名本科生。我很兴奋在我的宿舍里拥有 Unix 系统的强大功能，但是尽管它有很多功能，Linux 却缺乏应用程序。像 LibreOffice 和 OpenOffice 这样的文字处理程序还需要几年的时间。如果你想使用文字处理器，你可能会将你的系统引导到 MS-DOS 中，并使用 WordPerfect、shareware GalaxyWrite 或类似的程序。

`nroff` 和 `troff ` 。它们是同一系统的不同接口：`nroff` 生成纯文本输出，适用于屏幕或行式打印机，而 `troff` 产生非常优美的输出，通常用于在激光打印机上打印。

这就是我的方法，因为我需要为我的课程写论文，但我更喜欢呆在 Linux 中。我从我们的 “大 Unix ” 校园计算机实验室得知，Unix 系统提供了一组文本格式化的程序。它们是同一系统的不同接口：生成纯文本的输出，适合于屏幕或行打印机，或者生成非常优美的输出，通常用于在激光打印机上打印。

在 Linux 上，`nroff` 和 `troff` 被合并为 GNU troff，通常被称为 [groff][1]。 我很高兴看到早期的 Linux 发行版中包含了某个版本的 groff，因此我着手学习如何使用它来编写课程论文。 我学到的第一个宏集是 `-me` 宏包，一个简单易学的宏集。

关于 `groff` ，首先要了解的是它根据一组宏处理和格式化文本。一个宏通常是一个两个字符的命令，它自己设置在一行上，并带有一个引导点。宏可能包含一个或多个选项。当 groff 在处理文档时遇到这些宏中的一个时，它会自动对文本进行格式化。

下面，我将分享使用 `groff -me` 编写课程论文等简单文档的基础知识。 我不会深入细节进行讨论，比如如何创建嵌套列表，保存和显示，以及使用表格和数字。

### 段落

让我们从一个简单的例子开始，在几乎所有类型的文档中都可以看到：段落。段落可以格式化第一行的缩进或不缩进（即，与左边齐平）。 包括学术论文，杂志，期刊和书籍在内的许多印刷文档都使用了这两种类型的组合，其中文档或章节中的第一个（主要）段落与左侧的所有段落以及所有其他（常规）段落缩进。 在 `groff -me`中，您可以使用两种段落类型：前导段落（`.lp`）和常规段落（`.pp`）。

```
.lp

This is the first paragraph.

.pp

This is a standard paragraph.

```

### 文本格式

用粗体格式化文本的宏是 `.b`，斜体格式是 `.i` 。 如果您将 `.b` 或 `.i` 放在一行上，则后面的所有文本将以粗体或斜体显示。 但更有可能你只是想用粗体或斜体来表示一个或几个词。 要将一个词加粗或斜体，将该单词放在与 `.b` 或 `.i` 相同的行上作为选项。 要用**粗体**或斜体格式化多个单词，请将文字用引号引起来。

```
.pp

You can do basic formatting such as

.i italics

or

.b "bold text."

```

在上面的例子中，粗体文本结尾的句点也是粗体。 在大多数情况下，这不是你想要的。 只要文字是粗体字，而不是后面的句点也是粗体字。 要获得您想要的效果，您可以向 `.b` 或 `.i` 添加第二个参数，以指示要以粗体或斜体显示的文本，但是正常类型的文本。 您可以这样做，以确保尾随句点不会以粗体显示。

```
.pp

You can do basic formatting such as

.i italics

or

.b "bold text" .

```

### 列表

使用 `groff -me`，您可以创建两种类型的列表：无序列表（`.bu`）和有序列表（`.np`）。

```
.pp

Bullet lists are easy to make:

.bu

Apple

.bu

Banana

.bu

Pineapple

.pp

Numbered lists are as easy as:

.np

One

.np

Two

.np

Three

.pp

Note that numbered lists will reset at the next pp or lp.

```

### 副标题

如果你正在写一篇长论文，你可能想把你的内容分成几部分。使用 `groff -me`，您可以创建编号的标题 （`.sh`） 和未编号的标题 （`.uh`）。在这两种方法中，将节标题作为参数括起来。对于编号的标题，您还需要提供标题级别 `:1` 将给出一个一级标题(例如，1)。同样，`2` 和 `3` 将给出第二和第三级标题，如 2.1 或  3.1.1。

```
.uh Introduction

.pp

Provide one or two paragraphs to describe the work

and why it is important.

.sh 1 "Method and Tools"

.pp

Provide a few paragraphs to describe how you

did the research, including what equipment you used

```

### 智能引号和块引号

在任何学术论文中，引用他人的工作作为证据都是正常的。如果你引用一个简短的引用来突出一个关键信息，你可以在你的文本周围键入引号。但是 groff 不会自动将你的引用转换成现代文字处理系统所使用的“智能”或“卷曲”引用。要在 `groff -me` 中创建它们，插入一个内联宏来创建左引号（`\*(lq`）和右引号（`\*(rq`）。

```
.pp

Christine Peterson coined the phrase \*(lqopen source.\*(rq

```

`groff -me` 中还有一个快捷方式来创建这些引号（`.q`），我发现它更易于使用。

```
.pp

Christine Peterson coined the phrase

.q "open source."

```

如果引用的是跨越几行的较长的引用，则需要使用一个块引用。为此，在引用的开头和结尾插入块引用宏（

`.(q`）。

```
.pp

Christine Peterson recently wrote about open source:

.(q

On April 7, 1998, Tim O'Reilly held a meeting of key

leaders in the field. Announced in advance as the first

.q "Freeware Summit,"

by April 14 it was referred to as the first

.q "Open Source Summit."

.)q

```

### 脚注

要插入脚注，请在脚注文本前后添加脚注宏（`.(f`），并使用内联宏（`\ **`）添加脚注标记。脚注标记应出现在文本中和脚注中。

```
.pp

Christine Peterson recently wrote about open source:\**

.(f

\**Christine Peterson.

.q "How I coined the term open source."

.i "OpenSource.com."

1 Feb 2018.

.)f

.(q

On April 7, 1998, Tim O'Reilly held a meeting of key

leaders in the field. Announced in advance as the first

.q "Freeware Summit,"

by April 14 it was referred to as the first

.q "Open Source Summit."

.)q

```

### 封面

大多数课程论文都需要一个包含论文标题，姓名和日期的封面。 在 `groff -me` 中创建封面需要一些组件。 我发现最简单的方法是使用居中的文本块并在标题，名称和日期之间添加额外的行。 （我倾向于在每一行之间使用两个空行）。在文章顶部，从标题页（`.tp`）宏开始，插入五个空白行（`.sp 5`），然后添加居中文本（`.(c`） 和额外的空白行（`.sp 2`）。

```
.tp

.sp 5

.(c

.b "Writing Class Papers with groff -me"

.)c

.sp 2

.(c

Jim Hall

.)c

.sp 2

.(c

February XX, 2018

.)c

.bp

```

最后一个宏（`.bp`）告诉 groff 在标题页后添加一个分页符。

### 更多内容

这些是用 `groff-me` 写一份专业的论文非常基础的东西,包括前导和缩进段落，粗体和斜体，有序和无需列表，编号和不编号的章节标题，块引用以及脚注。

我已经包含一个示例 groff 文件来演示所有这些格式。 将 `lorem-ipsum.me` 文件保存到您的系统并通过 groff 运行。  `-Tps` 选项将输出类型设置为 `PostScript` ，以便您可以将文档发送到打印机或使用 `ps2pdf` 程序将其转换为 PDF 文件。

```
groff -Tps -me lorem-ipsum.me > lorem-ipsum.me.ps

ps2pdf lorem-ipsum.me.ps lorem-ipsum.me.pdf

```

如果你想使用 groff-me 的更多高级功能，请参阅 Eric Allman 所著的 “使用 `Groff-me` 来写论文”，你可以在你系统的 groff 的 `doc` 目录下找到一个名叫 `meintro.me` 的文件。这份文档非常完美的说明了如何使用 `groff-me` 宏来格式化你的论文。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/how-format-academic-papers-linux-groff-me

作者：[Jim Hall][a]
译者：[amwps290](https://github.com/amwps290)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-hall
[1]:https://www.gnu.org/software/groff/
