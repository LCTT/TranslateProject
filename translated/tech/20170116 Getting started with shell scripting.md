shell 脚本之始
============================================================
 ![脚本之始](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/osdc_terminals.png?itok=QmkPW7P1 "Getting started with shell scripting")

图片引用自 : 

[ajmexico][1]. [Jason Baker][2] 修改. [CC BY-SA 2.0][3].

世界上对shell脚本最好的概念上的介绍来自一个老的[AT＆T培训视频][4] 。在视频中，Brian W. Kernighan（**awk** 中的“K”），Lorinda L 和 Cherry（**bc** 作者之一）表明了UNIX的创始原则之一是让用户利用现有的实用程序来定制和创建复杂的工具。

用[Kernighan][5]的话来说：“UNIX系统程序基本上是[...]你可以创造东西的构建块[...]管道的概念是[UNIX]系统的基础;你可以拿一堆程序...并将它们端到端连接到一起，使数据从左边的一个流到右边的一个，由系统本身管着所有的连接。程序本身不知道任何关于连接的事情;对它们而言，他们只是在与终端通话。

他说的是给普通用户编程的能力。

POSIX操作系统本身就是一个API。如果你能弄清楚如何在POSIX shell中完成一个任务，那么你可以自动化这个任务。这就是是编程，这种日常 POSIX 编程方法的主要工具是shell脚本。

像他的名字那样，shell _script_ 是一行一行你想让你的计算机执行的代码，就像你手动的一样。

因为shell脚本包含常见的日常命令，所以熟悉UNIX或Linux（通常称为 **POSIX** ）对shell是有帮助的。你练习使用shell越多，就越容易设计新的脚本。这就像学习外语：你心里的词汇越多，形成复杂句子越容易。

当您打开终端窗口时，就将打开 _shell_ 。shell有好几种，本教程适用于 **bash**，**tcsh**，**ksh**，**zsh** 和其他几个。在下面几个部分，我提供一些 bash 特定的例子，但最终脚本将放弃那些，所以你可以切换到 bash 设置变量的课程，或做一些简单的[语法调整][6]。

如果你是新手，只需使用 **bash** 。它是一个很好的外壳与许多友好的功能，它是 Linux，Cygwin，WSL，Mac 默认的 shell，并且也在BSD上支持。

### Hello world

您可以从终端窗口生成您自己的 **hello world** 脚本 。注意你的引号; 单和双都会有不同的效果。

```
$ echo "#\!/bin/sh" > hello.sh
$ echo "echo 'hello world' " >> hello.sh
```

正如你所看到的，编写的 shell 脚本除了第一行之外，将会吧命令回显或粘贴到文本文件中。

像应用程序一样运行脚本：

```
$ chmod +x hello.sh
$ ./hello.sh
hello world
```

要么多点要么少点，这就是所有的内容了！

现在让我们处理一些有用的东西。

###去除空格

如果有一件事情干扰了计算机和人类的互动，那它就是文件名中的空格。您在互联网上看到过：http：//example.com/omg%2ccutest%20cat%20photophoto%21%211.jpg**等网址。或者，当运行一个简单的命令时，空格已经跳过了：

```
$ cp llama pic.jpg ~/photos
cp: cannot stat 'llama': No such file or directory
cp: cannot stat 'pic.jpg': No such file or directory
```

解决方案是用反斜杠“转义”空格，或引号：

```
$ touch foo\ bar.txt
$ ls "foo bar.txt"
foo bar.txt
```

这些都是要知道的重要的技巧，但是它并不方便，为什么不写一个脚本从文件名中删除这些烦人的空格？

创建一个文件来保存脚本，以 "shebang" （**#!**） 开头，让系统知道文件应该在shell中运行：

```
$ echo '#!/bin/sh' > despace
```

好的代码要从文档开始。定义好目的让我们知道要做什么。这里有一个很好的README：

```
despace is a shell script for removing spaces from file names.

Usage:
$ despace "foo bar.txt"
```

现在让我们弄明白如何手动做，并且如何去构建脚本。

假设你有一个只有 "foo bar.txt" 文件的目录，请尝试这样做：

```
$ ls
hello.sh
foo bar.txt
```

计算机都是关于输入和输出。在这种情况下，输入已经是请求 **ls** 特定目录。输出是您的期望：该目录文件的名称。

在 UNIX 中，可以通过“管道”发送使输出作为另一个命令的输入。无论在管道的相对侧是什么作为过滤器。 **tr** 程序恰好设计为专门修改通过它的字符串;对于这种情况，可以使用 **--delete** 选项删除引号中定义的字符。

```
$ ls "foo bar.txt" | tr --delete ' '
foobar.txt
```

现在只有你需要的输出了。

在 BASH shell 中，您可以将输出存储为 **变量** 。变量可以视为将信息存储到其中的空框：

```
$ NAME=foo
```

当您需要返回信息时，可以通过引用前面带有美元符号（**$** ）的变量名称来查看。

```
$ echo $NAME
foo
```

要获得您的 despacing 命令的输出并将其放在一边供以后使用，请使用一个变量。将命令的 _results_ 放入变量，使用反馈：

```
$ NAME=`ls "foo bar.txt" | tr -d ' '`
$ echo $NAME
foobar.txt
```

这让你完成了一半的目标，现在可以从源文件名确定目标文件名了。

到目前为止，脚本看起来像这样：

```
#!/bin/sh

NAME=`ls "foo bar.txt" | tr -d ' '`
echo $NAME
```

第二部分必须执行重命名。现在你可能已经知道这个命令：

```
$ mv "foo bar.txt" foobar.txt
```

但是，请记住在脚本中，您正在使用一个变量来保存目标名称。你知道如何引用变量：

```
#!/bin/sh

NAME=`ls "foo bar.txt" | tr -d ' '`
echo $NAME
mv "foo bar.txt" $NAME
```

您可以将其标记为可执行文件并在测试目录中运行它。确保您有一个名为“foo bar.txt”（或您在脚本中使用的）的测试文件。

```
$ touch "foo bar.txt"
$ chmod +x despace
$ ./despace
foobar.txt
$ ls
foobar.txt
```

### Despacer v2.0
### 去除空格 v2.0

脚本正常工作，但不完全如您的文档所述。它目前非常具体，只适用于一个名为 **foo\ bar.txt** 的文件，其他都不适用。

POSIX 命令将其自身称为 **$0**，并将其后键入的任何内容依次命名为 **$1**，**$2**，**$3** 等。您的 shell 脚本作为 POSIX 命令也可以这样计数，因此请尝试用 **$1** 来替换 **foo\ bar.txt** 。

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

看起来您发现了一个错误！

该bug实际上不是一个bug，因此;一切都按设计工作，但不是你想要的。你的脚本将 **$1** 变量 “扩展” 到底是什么：“one two.txt”，接下来就是你试图消除的麻烦的空格。

答案是将变量以引号包装文件名的方式包装变量：

```
#!/bin/sh

NAME=`ls "$1" | tr -d ' '`
echo $NAME
mv "$1" $NAME
```

另外一，两个测试：

```
$ ./despace "one two.txt"
onetwo.txt
$ ./despace c*g.txt
catdog.txt
```

此脚本的行为与任何其他 POSIX 命令相同。您可以将其与其他命令结合使用，就像您希望的能够使用任何 POSIX 程序一样。您可以将其与命令结合使用：

```
$ find ~/test0 -type f -exec /path/to/despace {} \;
```

或者你可以使用它作为循环的一部分：

`$ for FILE in ~/test1/* ; do /path/to/despace $FILE ; done`

等等。

###去除空格 v2.5

despace 脚本是功能，但在技术上它可以优化，它可以使用一些可用性改进。

首先，变量实际上并不需要。 shell可以一次计算所需的信息。

POSIX shell 有一个操作顺序。在数学中同样的方式解决括号中的语句首先，shell在执行命令之前解析反引号（**`**）或 **$()** 在BASH中的语句。因此，声明：

```
$ mv foo\ bar.txt `ls foo\ bar.txt | tr -d ' '`
```

变换成：

```
$ mv foo\ bar.txt foobar.txt
```

然后实际的 **mv** 命令执行，就只有 **foobar.txt** 。

知道这一点，你可以将 shell 脚本压缩成：

```
#!/bin/sh

mv "$1" `ls "$1" | tr -d ' '`
```

这看起来令人失望的简单。你可能认为它使脚本减少为一个单行并没有必要，但shell脚本不必有很多行是有用的。即使一个用简单的命令写的紧缩的脚本仍然可以防止你发生致命的打字错误，这在涉及移动文件时尤其重要。


此外，你的脚本仍然可以改进。额外的测试发现了一些弱点。例如，运行没有参数的 **despace** 会产生一个无用的错误：

```
$ ./despace
ls: cannot access '': No such file or directory

mv: missing destination file operand after ''
Try 'mv --help' for more information.
```

这些错误是混乱的，因为它们是 **ls** 和 **mv**，但就用户所知，它运行的不是 **ls** 或 **mv**，而是 **despace** 。

如果你想一想，这个小脚本不应该甚至尝试重命名文件，如果它没有得到一个文件作为命令的一部分，请尝试使用你知道的变量以及 **test** 函数。


### if 和 test

**if** 语句是把你的小 despace 实用程序从脚本转换成程序。这是重要的代码领域，但不要担心，它也很容易理解和使用。

**if** 语句是一种开关;如果事情是真的，那么你会做一件事，如果它是假的，你会做不同的事情。这个 if-then 指令的二进制决策正好是对计算机是最好的;你需要做的就是为计算机定义什么是真或假以及执行什么为结果。

测试 True 或 False 的最简单的方法是 **test** 实用程序。你不直接调用它，你使用它的语法。在终端试试：

```
$ if [ 1 == 1 ]; then echo "yes, true, affirmative"; fi
yes, true, affirmative
$ if [ 1 == 123 ]; then echo "yes, true, affirmative"; fi
$
```

这就是 **test** 的工作原理。你有各种方式的简写可供选择，你将使用的是 **-z** 选项，它检测字符串的长度是否为零（0）。这个想法在你的 despace 脚本中翻译为：

```
#!/bin/sh

if [ -z "$1" ]; then
   echo "Provide a \"file name\", using quotes to nullify the space."
   exit 1
fi

mv "$1" `ls "$1" | tr -d ' '`
```

为了提高可读性，**if** 语句被分成单独的行，但是概念仍然是：如果 **$1** 变量中的数据为空（零个字符存在），则打印一个错误语句。

尝试一下：

```
$ ./despace
Provide a "file name", using quotes to nullify the space.
$
```
成功！

好吧，其实这是一个失败，但它是一个 _漂亮的_ 失败，更重要的是，一个 _有帮助_ 失败。

注意语句 **exit 1** 。这是 POSIX 应用程序遇到错误时向系统发送警报的一种方法。这个功能对于自己和其他依赖于 despace 成功在脚本中使用 despace 以便其他一切正确发生的人来说很重要。

最后的改进是添加一些东西，以保护用户不会意外覆盖文件。理想情况下，您可以将此选项传递给脚本，以便它是可选的，但为了简单起见，您将对其进行硬编码。 **-i** 选项告诉 **mv** 在覆盖已存在的文件之前请求权限：

```
#!/bin/sh

if [ -z "$1" ]; then
   echo "Provide a \"file name\", using quotes to nullify the space."
   exit 1
fi

mv -i "$1" `ls "$1" | tr -d ' '`
```

现在你的 shell 脚本是有帮助的，有用的，友好的 - 你是一个程序员，所以不要立即停止。学习新命令，在终端中使用它们，记下您的操作，然后编写脚本。最终，你会把自己从工作中解脱出来，当你的机器仆人运行 shell 脚本，接下来的生活将会轻松。

快乐黑客！
--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/penguinmedallion200x200.png?itok=ROQSR50J)

Seth Kenlon是一位独立的多媒体艺术家，自由文化倡导者和UNIX极客。他是基于Slackware的多媒体制作项目（http://slackermedia.ml）的维护者之一
--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/getting-started-shell-scripting

作者：[Seth Kenlon ][a]
译者：[译者ID](https://github.com/hkurj)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/seth
[1]:https://www.flickr.com/photos/15587432@N02/3281139507/
[2]:https://opensource.com/users/jason-baker
[3]:https://creativecommons.org/licenses/by/2.0/
[4]:https://youtu.be/XvDZLjaCJuw
[5]:https://youtu.be/tc4ROCJYbm0
[6]:http://hyperpolyglot.org/unix-shells
