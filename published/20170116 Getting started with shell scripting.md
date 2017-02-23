shell 脚本之始
============================================================

![脚本之始](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/osdc_terminals.png?itok=QmkPW7P1 "Getting started with shell scripting")

图片引用自：[ajmexico][1]，[Jason Baker][2] 修改。 [CC BY-SA 2.0][3]。

世界上对 shell 脚本最好的概念性介绍来自一个老的 [AT＆T 培训视频][4] 。在视频中，Brian W. Kernighan（**awk** 中的“K”），Lorinda L. Cherry（**bc** 作者之一）论证了 UNIX 的基础原则之一是让用户利用现有的实用程序来定制和创建复杂的工具。

用 [Kernighan][5] 的话来说：“UNIX 系统程序基本上是 …… 你可以用来创造东西的构件。…… 管道的概念是 [UNIX] 系统的基础；你可以拿一堆程序 …… 并将它们端到端连接到一起，使数据从左边的一个流到右边的一个，由系统本身管着所有的连接。程序本身不知道任何关于连接的事情；对它们而言，它们只是在与终端对话。”

他说的是给普通用户以编程的能力。

POSIX 操作系统本身就像是一个 API。如果你能弄清楚如何在 POSIX 的 shell 中完成一个任务，那么你可以自动化这个任务。这就是编程，这种日常 POSIX 编程方法的主要方式就是 shell 脚本。

像它的名字那样，shell _脚本_ 是一行一行你想让你的计算机执行的语句，就像你手动的一样。

因为 shell 脚本包含常见的日常命令，所以熟悉 UNIX 或 Linux（通常称为 **POSIX** 系统）对 shell 是有帮助的。你使用 shell 的经验越多，就越容易编写新的脚本。这就像学习外语：你心里的词汇越多，组织复杂的句子就越容易。

当您打开终端窗口时，就是打开了 _shell_ 。shell 有好几种，本教程适用于 **bash**、**tcsh**、**ksh**、**zsh** 和其它几个。在下面几个部分，我提供一些 bash 特定的例子，但最终的脚本不会用那些，所以你可以切换到 bash 中学习设置变量的课程，或做一些简单的[语法调整][6]。

如果你是新手，只需使用 **bash** 。它是一个很好的 shell，有许多友好的功能，它是 Linux、Cygwin、WSL、Mac 默认的 shell，并且在 BSD 上也支持。

### Hello world

您可以从终端窗口生成您自己的 **hello world** 脚本 。注意你的引号；单和双都会有不同的效果（LCTT 译注：想必你不会在这里使用中文引号吧）。

```
$ echo "#\!/bin/sh" > hello.sh
$ echo "echo 'hello world' " >> hello.sh
```

正如你所看到的，编写 shell 脚本就是这样，除了第一行之外，就是把命令“回显”或粘贴到文本文件中而已。

像应用程序一样运行脚本：

```
$ chmod +x hello.sh
$ ./hello.sh
hello world
```

不管多少，这就是一个 shell 脚本了。

现在让我们处理一些有用的东西。

### 去除空格

如果有一件事情会干扰计算机和人类的交互，那就是文件名中的空格。您在互联网上看到过：http：//example.com/omg%2ccutest%20cat%20photophoto%21%211.jpg** 等网址。或者，当你不管不顾地运行一个简单的命令时，文件名中的空格会让你掉到坑里：

```
$ cp llama pic.jpg ~/photos
cp: cannot stat 'llama': No such file or directory
cp: cannot stat 'pic.jpg': No such file or directory
```

解决方案是用反斜杠来“转义”空格，或使用引号：

```
$ touch foo\ bar.txt
$ ls "foo bar.txt"
foo bar.txt
```

这些都是要知道的重要的技巧，但是它并不方便，为什么不写一个脚本从文件名中删除这些烦人的空格？

创建一个文件来保存脚本，以释伴（shebang）（**#!**） 开头，让系统知道文件应该在 shell 中运行：

```
$ echo '#!/bin/sh' > despace
```

好的代码要从文档开始。定义好目的让我们知道要做什么。这里有一个很好的 README：

```
despace is a shell script for removing spaces from file names.

Usage:
$ despace "foo bar.txt"
```

现在让我们弄明白如何手动做，并且如何去构建脚本。

假设你有个只有一个 "foo bar.txt" 文件的目录，比如：

```
$ ls
hello.sh
foo bar.txt
```

计算机无非就是输入和输出而已。在这种情况下，输入是 `ls` 特定目录的请求。输出是您所期望的结果：该目录文件的名称。

在 UNIX 中，可以通过“管道”将输出作为另一个命令的输入，无论在管道的另一侧是什么过滤器。 `tr` 程序恰好设计为专门修改传输给它的字符串；对于这个例子，可以使用 `--delete` 选项删除引号中定义的字符。

```
$ ls "foo bar.txt" | tr --delete ' '
foobar.txt
```

现在你得到了所需的输出了。

在 BASH shell 中，您可以将输出存储为**变量** 。变量可以视为将信息存储到其中的空位：

```
$ NAME=foo
```

当您需要返回信息时，可以通过在变量名称前面缀上美元符号（**$** ）来引用该位置。

```
$ echo $NAME
foo
```

要获得您的这个去除空格后的输出并将其放在一边供以后使用，请使用一个变量。将命令的_结果_放入变量，使用反引号（`）来完成：

```
$ NAME=`ls "foo bar.txt" | tr -d ' '`
$ echo $NAME
foobar.txt
```

我们完成了一半的目标，现在可以从源文件名确定目标文件名了。

到目前为止，脚本看起来像这样：

```
#!/bin/sh

NAME=`ls "foo bar.txt" | tr -d ' '`
echo $NAME
```

第二部分必须执行重命名操作。现在你可能已经知道这个命令：

```
$ mv "foo bar.txt" foobar.txt
```

但是，请记住在脚本中，您正在使用一个变量来保存目标名称。你已经知道如何引用变量：

```
#!/bin/sh

NAME=`ls "foo bar.txt" | tr -d ' '`
echo $NAME
mv "foo bar.txt" $NAME
```

您可以将其标记为可执行文件并在测试目录中运行它。确保您有一个名为 foo bar.txt（或您在脚本中使用的其它名字）的测试文件。

```
$ touch "foo bar.txt"
$ chmod +x despace
$ ./despace
foobar.txt
$ ls
foobar.txt
```

### 去除空格 v2.0

脚本可以正常工作，但不完全如您的文档所述。它目前非常具体，只适用于一个名为 `foo\ bar.txt` 的文件，其它都不适用。

POSIX 命令会将其命令自身称为 `$0`，并将其后键入的任何内容依次命名为 `$1`，`$2`，`$3` 等。您的 shell 脚本作为 POSIX 命令也可以这样计数，因此请尝试用 `$1` 来替换 `foo\ bar.txt` 。

```
#!/bin/sh

NAME=`ls $1 | tr -d ' '`
echo $NAME
mv $1 $NAME
```

创建几个新的测试文件，在名称中包含空格：

```
$ touch "one two.txt"
$ touch "cat dog.txt"
```

然后测试你的新脚本：

```
$ ./despace "one two.txt"
ls: cannot access 'one': No such file or directory
ls: cannot access 'two.txt': No such file or directory
```

看起来您发现了一个 bug！

这实际上不是一个 bug，一切都按设计工作，但不是你想要的。你的脚本将 `$1` 变量真真切切地 “扩展” 成了：“one two.txt”，捣乱的就是你试图消除的那个麻烦的空格。

解决办法是将变量用以引号封装文件名的方式封装变量：

```
#!/bin/sh

NAME=`ls "$1" | tr -d ' '`
echo $NAME
mv "$1" $NAME
```

再做个测试：

```
$ ./despace "one two.txt"
onetwo.txt
$ ./despace c*g.txt
catdog.txt
```

此脚本的行为与任何其它 POSIX 命令相同。您可以将其与其他命令结合使用，就像您希望的使用的任何 POSIX 程序一样。您可以将其与命令结合使用：

```
$ find ~/test0 -type f -exec /path/to/despace {} \;
```

或者你可以使用它作为循环的一部分：

```
$ for FILE in ~/test1/* ; do /path/to/despace $FILE ; done
```

等等。

### 去除空格 v2.5

这个去除脚本已经可以发挥功用了，但在技术上它可以优化，它可以做一些可用性改进。

首先，变量实际上并不需要。 shell 可以一次计算所需的信息。

POSIX shell 有一个操作顺序。在数学中使用同样的方式来首先处理括号中的语句，shell 在执行命令之前会先解析反引号或 Bash 中的 `$()` 。因此，下列语句：

```
$ mv foo\ bar.txt `ls foo\ bar.txt | tr -d ' '`
```

会变换成：

```
$ mv foo\ bar.txt foobar.txt
```

然后实际的 `mv` 命令执行，就得到了 **foobar.txt** 文件。

知道这一点，你可以将该 shell 脚本压缩成：

```
#!/bin/sh

mv "$1" `ls "$1" | tr -d ' '`
```

这看起来简单的令人失望。你可能认为它使脚本减少为一个单行并没有必要，但没有几行的 shell 脚本是有意义的。即使一个用简单的命令写的紧缩的脚本仍然可以防止你发生致命的打字错误，这在涉及移动文件时尤其重要。

此外，你的脚本仍然可以改进。更多的测试发现了一些弱点。例如，运行没有参数的 `despace` 会产生一个没有意义的错误：

```
$ ./despace
ls: cannot access '': No such file or directory

mv: missing destination file operand after ''
Try 'mv --help' for more information.
```

这些错误是让人迷惑的，因为它们是针对 `ls` 和 `mv` 发出的，但就用户所知，它运行的不是 `ls` 或 `mv`，而是 `despace` 。

如果你想一想，如果它没有得到一个文件作为命令的一部分，这个小脚本甚至不应该尝试去重命名文件，请尝试使用你知道的变量以及 `test` 功能来解决。


### if 和 test

`if` 语句将把你的小 despace 实用程序从脚本蜕变成程序。这里面涉及到代码领域，但不要担心，它也很容易理解和使用。

`if` 语句是一种开关；如果某件事情是真的，那么你会做一件事，如果它是假的，你会做不同的事情。这个 `if-then` 指令的二分决策正好是计算机是擅长的；你需要做的就是为计算机定义什么是真或假以及并最终执行什么。

测试真或假的最简单的方法是 `test` 实用程序。你不用直接调用它，使用它的语法即可。在终端试试：

```
$ if [ 1 == 1 ]; then echo "yes, true, affirmative"; fi
yes, true, affirmative
$ if [ 1 == 123 ]; then echo "yes, true, affirmative"; fi
$
```

这就是 `test` 的工作方式。你有各种方式的简写可供选择，这里使用的是 `-z` 选项，它检测字符串的长度是否为零（0）。将这个想法翻译到你的 despace 脚本中就是：

```
#!/bin/sh

if [ -z "$1" ]; then
   echo "Provide a \"file name\", using quotes to nullify the space."
   exit 1
fi

mv "$1" `ls "$1" | tr -d ' '`
```

为了提高可读性，`if` 语句被放到单独的行，但是其概念仍然是：如果 `$1` 变量中的数据为空（零个字符存在），则打印一个错误语句。

尝试一下：

```
$ ./despace
Provide a "file name", using quotes to nullify the space.
$
```
成功！

好吧，其实这是一个失败，但它是一个_漂亮的_失败，更重要的是，一个_有意义_的失败。

注意语句 `exit 1` 。这是 POSIX 应用程序遇到错误时向系统发送警报的一种方法。这个功能对于需要在脚本中使用  despace ，并依赖于它成功执行才能顺利运行的你或其它人来说很重要。

最后的改进是添加一些东西，以保护用户不会意外覆盖文件。理想情况下，您可以将此选项传递给脚本，所以它是可选的；但为了简单起见，这里对其进行了硬编码。 `-i` 选项告诉 `mv` 在覆盖已存在的文件之前请求许可：

```
#!/bin/sh

if [ -z "$1" ]; then
   echo "Provide a \"file name\", using quotes to nullify the space."
   exit 1
fi

mv -i "$1" `ls "$1" | tr -d ' '`
```

现在你的 shell 脚本是有意义的、有用的、友好的 - 你是一个程序员了，所以不要停。学习新命令，在终端中使用它们，记下您的操作，然后编写脚本。最终，你会把自己从工作中解脱出来，当你的机器仆人运行 shell 脚本，接下来的生活将会轻松。

Happy hacking！

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/penguinmedallion200x200.png?itok=ROQSR50J)

Seth Kenlon 是一位独立的多媒体艺术家，自由文化倡导者和 UNIX 极客。他是基于 Slackware 的多媒体制作项目（http://slackermedia.ml）的维护者之一

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/getting-started-shell-scripting

作者：[Seth Kenlon][a]
译者：[hkurj](https://github.com/hkurj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/seth
[1]:https://www.flickr.com/photos/15587432@N02/3281139507/
[2]:https://opensource.com/users/jason-baker
[3]:https://creativecommons.org/licenses/by/2.0/
[4]:https://youtu.be/XvDZLjaCJuw
[5]:https://youtu.be/tc4ROCJYbm0
[6]:http://hyperpolyglot.org/unix-shells
