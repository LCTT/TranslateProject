[#]: collector: (lujun9972)
[#]: translator: (mengxinayan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to structure a multi-file C program: Part 1)
[#]: via: (https://opensource.com/article/19/7/structure-multi-file-c-part-1)
[#]: author: (Erik O'Shaughnessy https://opensource.com/users/jnyjnyhttps://opensource.com/users/jnyjnyhttps://opensource.com/users/jim-salterhttps://opensource.com/users/cldxsolutions)

如何组织构建多文件 C 语言程序：第一部分
======

准备好你喜欢的饮料，编辑器和编译器，放一些音乐，然后开始构建一个由多个文件组成的 C 语言程序。
![Programming keyboard.][1]

大家常说计算机编程的艺术是管理复杂性和命名某些事物中的一部分。此外，我认为“有时需要添加绘图”是很正确的。

在这篇文章里，我会在编写一个小型 C 程序时命名一些东西同时管理一些复杂性。程序的结构基于我所在 “[如何写一个好的 C 语言 main 函数][2]” 文中讨论的。但是，这次做一些不同的事。准备好你喜欢的饮料，编辑器和编译器，放一些音乐，让我们一起编写一个有趣的 C 语言程序。

### 好的 Unix 程序中的哲学

首先你要知道这个 C 程序是一个 [Unix][3] 命令行工具。这意味着它运行在那些提供（或者可被移植） Unix C 运行环境的操作系统中。当 Unix 在贝尔实验室被发明后，它从一开始便充满了 [设计哲学][4]。用我的话来说：程序只做一件事，并做好它，然后对文件进行一些操作。虽然只做一件事并做好它是有意义的，但是“对文件进行一些操作”在这儿有一点儿不合适。

“文件” 在 Unix 中的抽象非常强大。一个 Unix 文件是以 end-of-file (EOF) 标志为结尾的字节流。文件中其他结构均由应用添加而非操作系统。操作系统提供了系统调用，使得程序能够对文件执行标准操作：打开，读取，写入，寻找和关闭（还有其他，但那是庞大的额外内容）。对于文件的标准化访问使得不同人用不同语言编写的程序能共用相同的抽象同时一起工作。

具有共享文件接口可以构建 _可组合的_ 的程序。一个程序的输出可以作为另一个程序的输入。Unix 系操作系统默认为每个运行中程序提供了三个文件：标准输入（`stdin`），标准输出（`stdout`），和标准错误（`stderr`）。其中两个文件是只写的：`stdout` 和 `stderr`。而 `stdin` 是只读的。当我们在常见的 Shell 比如 Bash 中使用文件重定向时，可以看到其效果。

```
`$ ls | grep foo | sed -e 's/bar/baz/g' > ack`
```

这条指令可以被简要地描述为：`ls` 的结果被写入标准输出，它重定向到 `grep` 的标准输入，`grep` 的标准输出重定向到 `sed`的标准输入，`sed` 的标准输出重定向到当前目录下文件名为 `ack` 的文件中。

我们希望我们的程序在系统中灵活而又出色，因此让我们编写一个可以读写文件的程序。

### MeowMeow: 流编码器/解码器概念

当我还是一个孩子在 ltmumblesgts 里学习计算机科学时，有许多编码方案。他们中的有些用于压缩文件，有些用于打包文件，另一些毫无用处因此显得十分愚蠢。列举一个最后一种情况例子：[MooMoo 编码方式][5]。

为了给我们程序一个目的，我将在 [2000s][6] 更新该概念并且完成一个名为 “MeowMeow” 的编码方式（因为在互联网上大家都喜欢猫）。这里的基本的想法获取文件并且使用文本 “meow” 对每半个字节进行编码。小写字母代表 0，大写字母代表 1。因为它会将 4 比特替换为 32 比特，因此会扩大文件的大小。这毫无实际意义。但想象一下人们看到经过这样编码后的结果。

```
$ cat /home/your_sibling/.super_secret_journal_of_my_innermost_thoughts
MeOWmeOWmeowMEoW...
```

这非常棒。

### 最后完成

完整的源代码可以在 [GitHub][7] 上面找到，但是我会写下我在编写程序时的思考。目的是说明如何组织构建多文件 C 语言程序。

当我已经确定要编写一个 MeowMeow 编码和解码的程序时，我在 Shell 中执行了以下的命令 ：

```
$ mkdir meowmeow
$ cd meowmeow
$ git init
$ touch Makefile     # recipes for compiling the program
$ touch main.c       # handles command-line options
$ touch main.h       # "global" constants and definitions
$ touch mmencode.c   # implements encoding a MeowMeow file
$ touch mmencode.h   # describes the encoding API
$ touch mmdecode.c   # implements decoding a MeowMeow file
$ touch mmdecode.h   # describes the decoding API
$ touch table.h      # defines encoding lookup table values
$ touch .gitignore   # names in this file are ignored by git
$ git add .
$ git commit -m "initial commit of empty files"
```

简单的说，我创建了一个空文件并且使用 git 提交。
In short, I created a directory full of empty files and committed them to git.

即使文件中没有内容，你依旧可以从它的文件名推断功能。为了避免万一你无法理解，我在每条 `touch` 命令后面进行了简单描述。

通常，一个程序从一个简单 `main.c` 文件开始，只需要两三个函数便可以解决问题。然后程序员便可以向自己的朋友或者老板展示该程序，同时突然显示了文件提示框支持所有新的“功能”和“需求”。“程序俱乐部”的第一条规则便是不谈论“程序俱乐部”。第二条规则是最小化单个文件的功能。

坦率地说，C 编译器并不关心程序中的所有函数是否都在一个文件中。但是我们并不是为计算机或编译器写程序，我们是为其他人（有时也包括我们）而去写程序的。我知道这有些奇怪，但这就是事实。程序是计算机解决问题所采用的一系列算法，保证人们可以理解它们是非常重要的，即使问题的参数发生了意料之外的变化。当在人们修改程序时，发现一个文件中有 2049 函数时会诅咒你的。

因此，好的程序员会将函数分隔开，将相似的函数分组到不同的文件中。这里我用了三个文件 `main.c`，`mmencode.c` 和 `mmdecode.c`。对于这样的小程序，也许看起来有些过头了。但是小程序很难保证一直小下去，因此计划拓展是一个好主意。

但是那些 `.h` 文件呢？我会在后面解释一般的术语，简单地说，它们被称为头文件，同时它们可以包含 C 语言类型 和 C 预处理指令。头文件中不应该包含任何函数。你可以认为头文件和对应 `.c` 文件提供了用户编程接口（API）的定义，以便其他 `.c` 文件使用。

### 但是 Makefile 是什么呢？

我知道所有的酷小孩都使用 “Ultra CodeShredder 3000” 集成开发环境来编写下一个轰动一时的应用，同时构建你的项目包括在 Ctrl-Meta-Shift-Alt-Super-B 上进行混搭。但是回到今天，使用 Makefile 文件可以帮助做很多有用的工作在构建 C 程序时。Makefile 是一个包含如何处理文件的方式的文本文件，程序员可以使用其自动地从源代码构建二进制程序（包括其他东西！）

以下面这个小程序为例：

```
00 # Makefile
01 TARGET= my_sweet_program
02 $(TARGET): main.c
03    cc -o my_sweet_program main.c
```

‘#’ 符号后面的文本是注释，例如 00 行  

01 行是一个变量赋值，将 `TARGET` 变量赋值为字符串 `my_sweet_program`。按照惯例我的习惯是，所有 Makefile 变量均使用大写字母并用下划线分隔单词。

02 行包含要创建的文件名和其依赖的文件。在本例中，构建目标是 `my_sweet_program`，其依赖是 `main.c`。

03 行是最后一行使用了一个制表符号（tab）而不是四个空格。这是将执行创建目标的命令。在本例中，我们使用 C 编译器前端 `cc` 以编译链接到 `my_sweet_program`。

使用 Makefile 是非常简单的。

```
$ make
cc -o my_sweet_program main.c
$ ls
Makefile  main.c  my_sweet_program
```

将构建我们 MeowMeow 编码和解码器的 [Makefile][8] 比上面的例子要复杂，但其基本结构是相同的。我将在另一篇文章中将其分解为 Barney 风格。

### 形式伴随着功能

我的想法是程序从一个文件中读取，转换它，并将转换后的结果存储到另一个文件中。以下是我想象使用程序命令行交互时的情况：

```
        $ meow &lt; clear.txt &gt; clear.meow
        $ unmeow &lt; clear.meow &gt; meow.tx
        $ diff clear.txt meow.tx
        $
```

我们需要编写命令行解析和处理输入/输出流的代码。我们需要一个函数对流进行编码并将结果写到另一个流中。最后，我们需要一个函数对流进行解码并将结果写到另一个流中。等一下，我们在讨论如何写一个程序，但是在上面的例子中，我调用了两个指令：`meow` 和 `unmeow`？我知道你可能会认为这会导致越变越复杂。

### 次要内容：argv[0] 和 ln 指令

回想一下，C 语言 main 函数的结构如下：

```
`int main(int argc, char *argv[])`
```

其中 `argc` 是命令行参数数量，`argv` 是字符指针列表（字符串）。`argv[0]` 是正在运行中的文件的路径。在 Unix 系统中许多互补功能的程序（比如：压缩和解压缩）看起来像两个命令，但事实上，它们在文件系统中是拥有两个名称的一个程序。使用 `ln` 命令通过创建文件系统链接来实现两个名称的功能。

一个在我笔记本中 `/usr/bin` 的例子如下：

```
   $ ls -li /usr/bin/git*
3376 -rwxr-xr-x. 113 root root     1.5M Aug 30  2018 /usr/bin/git
3376 -rwxr-xr-x. 113 root root     1.5M Aug 30  2018 /usr/bin/git-receive-pack
...
```

这里 `git` 和 `git-receive-pack` 是同一个文件但是拥有不同的名字。我们说它们是相同的文件因为它们具有相同的 inode 值（第一列）。inode 是一个 Unix 文件系统的特点，其超越了本文的内容。

优秀或懒惰的程序可以通过 Unix 文件系统此特点已达到写更少的代码但是交付双倍的程序。首先，我们编写一个基于其 `argv[0]` 的值而作出相应改变的程序，然后我们确保为该行为的名称创建链接。

在我们的 Makefile 中，`unmeow` 链接通过以下的方式来创建：

```
 # Makefile
 ...
 $(DECODER): $(ENCODER)
         $(LN) -f $&lt; $@
        ...
```

我喜欢在 Makefile 中将所有内容参数化，很少使用 “裸” 字符串。我将所有的定义都放置在 Makefile 文件顶部，以便可以简单地找到并改变它们。当您尝试将程序移植到新的平台上时，需要将 `cc` 改变为 `xcc`时，这会产生很大影响。

除了两个内置变量 `$@` 和 `$&lt` 之外，其余的变量显得很简单的。第一个便是创建目标的快捷方式，在本例中，`$(DECODER)` （我记忆它因为它看起来像一个目标）。第二个，`$&lt` 是规则依赖项，在本例中，它解析为 `$(ENCODER)`。

事情当然在变得复杂，但是它易于管理。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/structure-multi-file-c-part-1

作者：[Erik O'Shaughnessy][a]
选题：[lujun9972][b]
译者：[萌新阿岩](https://github.com/mengxinayan)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jnyjnyhttps://opensource.com/users/jnyjnyhttps://opensource.com/users/jim-salterhttps://opensource.com/users/cldxsolutions
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A (Programming keyboard.)
[2]: https://opensource.com/article/19/5/how-write-good-c-main-function
[3]: https://en.wikipedia.org/wiki/Unix
[4]: http://harmful.cat-v.org/cat-v/
[5]: http://www.jabberwocky.com/software/moomooencode.html
[6]: https://giphy.com/gifs/nyan-cat-sIIhZliB2McAo
[7]: https://github.com/JnyJny/meowmeow
[8]: https://github.com/JnyJny/meowmeow/blob/master/Makefile
