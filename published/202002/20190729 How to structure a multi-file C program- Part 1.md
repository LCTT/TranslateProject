[#]: collector: (lujun9972)
[#]: translator: (mengxinayan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11935-1.html)
[#]: subject: (How to structure a multi-file C program: Part 1)
[#]: via: (https://opensource.com/article/19/7/structure-multi-file-c-part-1)
[#]: author: (Erik O'Shaughnessy https://opensource.com/users/jnyjnyhttps://opensource.com/users/jnyjnyhttps://opensource.com/users/jim-salterhttps://opensource.com/users/cldxsolutions)

如何组织构建多文件 C 语言程序（一）
======

> 准备好你喜欢的饮料、编辑器和编译器，放一些音乐，然后开始构建一个由多个文件组成的 C 语言程序。

![](https://img.linux.net.cn/data/attachment/album/202002/26/214517o5p7q45l2a8jkx4k.jpg)

大家常说计算机编程的艺术部分是处理复杂性，部分是命名某些事物。此外，我认为“有时需要添加绘图”是在很大程度上是正确的。

在这篇文章里，我会编写一个小型 C 程序，命名一些东西，同时处理一些复杂性。该程序的结构大致基于我在 《[如何写一个好的 C 语言 main 函数][2]》 文中讨论的。但是，这次做一些不同的事。准备好你喜欢的饮料、编辑器和编译器，放一些音乐，让我们一起编写一个有趣的 C 语言程序。

### 优秀 Unix 程序哲学

首先，你要知道这个 C 程序是一个 [Unix][3] 命令行工具。这意味着它运行在（或者可被移植到）那些提供 Unix C 运行环境的操作系统中。当贝尔实验室发明 Unix 后，它从一开始便充满了[设计哲学][4]。用我自己的话来说就是：程序只做一件事，并做好它，并且对文件进行一些操作。虽然“只做一件事，并做好它”是有意义的，但是“对文件进行一些操作”的部分似乎有点儿不合适。

事实证明，Unix 中抽象的 “文件” 非常强大。一个 Unix 文件是以文件结束符（EOF）标志为结尾的字节流。仅此而已。文件中任何其它结构均由应用程序所施加而非操作系统。操作系统提供了系统调用，使得程序能够对文件执行一套标准的操作：打开、读取、写入、寻址和关闭（还有其他，但说起来那就复杂了）。对于文件的标准化访问使得不同的程序共用相同的抽象，而且可以一同工作，即使它们是不同的人用不同语言编写的程序。

具有共享的文件接口使得构建*可组合的*的程序成为可能。一个程序的输出可以作为另一个程序的输入。Unix 家族的操作系统默认在执行程序时提供了三个文件：标准输入（`stdin`）、标准输出（`stdout`）和标准错误（`stderr`）。其中两个文件是只写的：`stdout` 和 `stderr`。而 `stdin` 是只读的。当我们在常见的 Shell 比如 Bash 中使用文件重定向时，可以看到其效果。

```
$ ls | grep foo | sed -e 's/bar/baz/g' > ack
```

这条指令可以被简要地描述为：`ls` 的结果被写入标准输出，它重定向到 `grep` 的标准输入，`grep` 的标准输出重定向到 `sed` 的标准输入，`sed` 的标准输出重定向到当前目录下文件名为 `ack` 的文件中。

我们希望我们的程序在这个灵活又出色的生态系统中运作良好，因此让我们编写一个可以读写文件的程序。

### 喵呜喵呜：流编码器/解码器概念

当我还是一个露着豁牙的孩子懵懵懂懂地学习计算机科学时，学过很多编码方案。它们中的有些用于压缩文件，有些用于打包文件，另一些毫无用处因此显得十分愚蠢。列举最后这种情况的一个例子：[哞哞编码方案][5]。

为了让我们的程序有个用途，我为它更新了一个 [21 世纪][6] 的概念，并且实现了一个名为“喵呜喵呜” 的编码方案的概念（毕竟网上大家都喜欢猫）。这里的基本的思路是获取文件并且使用文本 “meow” 对每个半字节（半个字节）进行编码。小写字母代表 0，大写字母代表 1。因为它会将 4 个比特替换为 32 个比特，因此会扩大文件的大小。没错，这毫无意义。但是想象一下人们看到经过这样编码后的惊讶表情。

```
$ cat /home/your_sibling/.super_secret_journal_of_my_innermost_thoughts
MeOWmeOWmeowMEoW...
```

这非常棒。

### 最终的实现

完整的源代码可以在 [GitHub][7] 上面找到，但是我会写下我在编写程序时的思考。目的是说明如何组织构建多文件 C 语言程序。

既然已经确定了要编写一个编码和解码“喵呜喵呜”格式的文件的程序时，我在 Shell 中执行了以下的命令 ：

```
$ mkdir meowmeow
$ cd meowmeow
$ git init
$ touch Makefile     # 编译程序的方法
$ touch main.c       # 处理命令行选项
$ touch main.h       # “全局”常量和定义
$ touch mmencode.c   # 实现对喵呜喵呜文件的编码
$ touch mmencode.h   # 描述编码 API
$ touch mmdecode.c   # 实现对喵呜喵呜文件的解码
$ touch mmdecode.h   # 描述解码 API
$ touch table.h      # 定义编码查找表
$ touch .gitignore   # 这个文件中的文件名会被 git 忽略
$ git add .
$ git commit -m "initial commit of empty files"
```

简单的说，我创建了一个目录，里面全是空文件，并且提交到 git。

即使这些文件中没有内容，你依旧可以从它的文件名推断每个文件的用途。为了避免万一你无法理解，我在每条 `touch` 命令后面进行了简单描述。

通常，程序从一个简单 `main.c` 文件开始，只有两三个解决问题的函数。然后程序员轻率地向自己的朋友或者老板展示了该程序，然后为了支持所有新的“功能”和“需求”，文件中的函数数量就迅速爆开了。“程序俱乐部”的第一条规则便是不要谈论“程序俱乐部”，第二条规则是尽量减少单个文件中的函数。

老实说，C 编译器并不关心程序中的所有函数是否都在一个文件中。但是我们并不是为计算机或编译器写程序，我们是为其他人（有时也包括我们）去写程序的。我知道这可能有些奇怪，但这就是事实。程序体现了计算机解决问题所采用的一组算法，当问题的参数发生了意料之外的变化时，保证人们可以理解它们是非常重要的。当在人们修改程序时，发现一个文件中有 2049 函数时他们会诅咒你的。

因此，优秀的程序员会将函数分隔开，将相似的函数分组到不同的文件中。这里我用了三个文件 `main.c`、`mmencode.c` 和 `mmdecode.c`。对于这样小的程序，也许看起来有些过头了。但是小的程序很难保证一直小下去，因此哥忒拓展做好计划是一个“好主意”。

但是那些 `.h` 文件呢？我会在后面解释一般的术语，简单地说，它们被称为头文件，同时它们可以包含 C 语言类型定义和 C 预处理指令。头文件中不应该包含任何函数。你可以认为头文件是提供了应用程序接口（API）的定义的一种 `.c` 文件，可以供其它 `.c` 文件使用。

### 但是 Makefile 是什么呢？

我知道下一个轰动一时的应用都是你们这些好孩子们用 “终极代码粉碎者 3000” 集成开发环境来编写的，而构建项目是用 Ctrl-Meta-Shift-Alt-Super-B 等一系列复杂的按键混搭出来的。但是如今（也就是今天），使用 `Makefile` 文件可以在构建 C 程序时帮助做很多有用的工作。`Makefile` 是一个包含如何处理文件的方式的文本文件，程序员可以使用其自动地从源代码构建二进制程序（以及其它东西！）

以下面这个小东西为例：

```
00 # Makefile
01 TARGET= my_sweet_program
02 $(TARGET): main.c
03    cc -o my_sweet_program main.c
```

`#` 符号后面的文本是注释，例如 00 行。 

01 行是一个变量赋值，将 `TARGET` 变量赋值为字符串 `my_sweet_program`。按照惯例，也是我的习惯，所有 `Makefile` 变量均使用大写字母并用下划线分隔单词。

02 行包含该<ruby>步骤<rt>recipe</rt></ruby>要创建的文件名和其依赖的文件。在本例中，构建<ruby>目标<rt>target</rt></ruby>是 `my_sweet_program`，其依赖是 `main.c`。

最后的 03 行使用了一个制表符号（`tab`）而不是四个空格。这是将要执行创建目标的命令。在本例中，我们使用 <ruby>C 编译器<rt>C compiler</rt></ruby>前端 `cc` 以编译链接为 `my_sweet_program`。

使用 `Makefile` 是非常简单的。

```
$ make
cc -o my_sweet_program main.c
$ ls
Makefile  main.c  my_sweet_program
```

构建我们喵呜喵呜编码器/解码器的 [Makefile][8] 比上面的例子要复杂，但其基本结构是相同的。我将在另一篇文章中将其分解为 Barney 风格。

### 形式伴随着功能

我的想法是程序从一个文件中读取、转换它，并将转换后的结果存储到另一个文件中。以下是我想象使用程序命令行交互时的情况：

```
$ meow < clear.txt > clear.meow
$ unmeow < clear.meow > meow.tx
$ diff clear.txt meow.tx
$
```

我们需要编写代码以进行命令行解析和处理输入/输出流。我们需要一个函数对流进行编码并将结果写到另一个流中。最后，我们需要一个函数对流进行解码并将结果写到另一个流中。等一下，我们在讨论如何写一个程序，但是在上面的例子中，我调用了两个指令：`meow` 和 `unmeow`？我知道你可能会认为这会导致越变越复杂。

### 次要内容：argv[0] 和 ln 指令

回想一下，C 语言 main 函数的结构如下：

```
int main(int argc, char *argv[])
```

其中 `argc` 是命令行参数的数量，`argv` 是字符指针（字符串）的列表。`argv[0]` 是包含正在执行的程序的文件路径。在 Unix 系统中许多互补功能的程序（比如：压缩和解压缩）看起来像两个命令，但事实上，它们是在文件系统中拥有两个名称的一个程序。这个技巧是通过使用 `ln` 命令创建文件系统链接来实现两个名称的。

在我笔记本电脑中 `/usr/bin` 的一个例子如下：

```
$ ls -li /usr/bin/git*
3376 -rwxr-xr-x. 113 root root     1.5M Aug 30  2018 /usr/bin/git
3376 -rwxr-xr-x. 113 root root     1.5M Aug 30  2018 /usr/bin/git-receive-pack
...
```

这里 `git` 和 `git-receive-pack` 是同一个文件但是拥有不同的名字。我们说它们是相同的文件因为它们具有相同的 inode 值（第一列）。inode 是 Unix 文件系统的一个特点，对它的介绍超越了本文的内容范畴。

优秀或懒惰的程序可以通过 Unix 文件系统的这个特点达到写更少的代码但是交付双倍的程序。首先，我们编写一个基于其 `argv[0]` 的值而作出相应改变的程序，然后我们确保为导致该行为的名称创建链接。

在我们的 `Makefile` 中，`unmeow` 链接通过以下的方式来创建：

```
# Makefile
...
$(DECODER): $(ENCODER)
        $(LN) -f $< $@
       ...
```

我倾向于在 `Makefile` 中将所有内容参数化，很少使用 “裸” 字符串。我将所有的定义都放置在 `Makefile` 文件顶部，以便可以简单地找到并改变它们。当你尝试将程序移植到新的平台上时，需要将 `cc` 改变为某个 `cc` 时，这会很方便。

除了两个内置变量 `$@` 和 `$<` 之外，该<ruby>步骤<rt>recipe</rt></ruby>看起来相对简单。第一个便是该步骤的目标的快捷方式，在本例中是 `$(DECODER)`（我能记得这个是因为 `@` 符号看起来像是一个目标）。第二个，`$<` 是规则依赖项，在本例中，它解析为 `$(ENCODER)`。

事情肯定会变得复杂，但它还在管理之中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/structure-multi-file-c-part-1

作者：[Erik O'Shaughnessy][a]
选题：[lujun9972][b]
译者：[萌新阿岩](https://github.com/mengxinayan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jnyjnyhttps://opensource.com/users/jnyjnyhttps://opensource.com/users/jim-salterhttps://opensource.com/users/cldxsolutions
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A (Programming keyboard.)
[2]: https://linux.cn/article-10949-1.html
[3]: https://en.wikipedia.org/wiki/Unix
[4]: http://harmful.cat-v.org/cat-v/
[5]: http://www.jabberwocky.com/software/moomooencode.html
[6]: https://giphy.com/gifs/nyan-cat-sIIhZliB2McAo
[7]: https://github.com/JnyJny/meowmeow
[8]: https://github.com/JnyJny/meowmeow/blob/master/Makefile
