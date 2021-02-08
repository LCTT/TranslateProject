[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Run a Shell Script in Linux [Essentials Explained for Beginners])
[#]: via: (https://itsfoss.com/run-shell-script-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Linux 中运行一个 Shell 脚本 [初学者必知]
======

在 linux 中有两种运行 shell 脚本的方法。你可以使用：

```
bash script.sh
```

或者，你可以像这样执行 shell 脚本：

```
./script.sh
```

这可能很简单，它解释不了多少。不要担心，我将使用示例来进行必要的解释，以便你能理解为什么在运行一个 shell 脚本时要使用给定的特定语法格式。

我将使用这一行 shell 脚本来使需要解释的事情变地尽可能简单：

```
abhishek@itsfoss:~/Scripts$ cat hello.sh

echo "Hello World!"
```

### 方法 1: 通过将文件作为参数传递给 shell 以运行 shell 脚本

第一种方法涉及将脚本文件的名称作为参数传递给 shell 。

考虑到 bash 是默认脚本，你可以像这样运行一个脚本：

```
bash hello.sh
```

你知道这种方法的优点码？**你的脚本没有所需要执行权限**。非常方便快速和简单的任务。

![在 Linux 中运行一个 Shell 脚本][1]

如果你还不熟悉，我建议你 [阅读我的 Linux 文件权限详细指南][2] 。

记住，它需要成为一个 shell 脚本，以便你能将其作为参数传递。一个 shell 脚本是由命令组成的。如果你使用一个普通的文本文件，它将会抱怨错误的命令。

![运行一个文本文件为脚本][3]

在这种方法中，**你要明确地具体指定你想使用 bash 作为脚本的解释器** 。

Shell 只是一个程序，并且 bash 只是 Shell 的一个实施。这里有其它的 shell 程序，像 ksh ，[zsh][4] ，等等。如果你安装有其它的 shell ，你也可以使用它们来代替 bash 。

例如，我已安装了 zsh ，并使用它来运行相同的脚本：

![使用 Zsh 来执行 Shell 脚本][5]

**建议阅读：**

![][6]

#### [如何在 Linux 终端中一次运行多个 Linux 命令 [初学者必知提示]][7]

### 方法 2: 通过具体指定 shell 脚本的路径来执行脚本

另外一种运行一个 shell 脚本的方法是通过提供它的路径。但是为使这变地可能，你的文件必须是可执行的。否则，当你尝试执行脚本时，你将会得到 “拒绝访问” 错误。

因此，你首先需要确保你的脚本有可执行权限。你可以 [使用 chmod 命令][8] 来给予你自己脚本的这种权限，像这样：

```
chmod u+x script.sh
```

在你的脚本是可执行的后，你需要的全部工作是输入文件的名称及其绝对路径或相对路径。大多数情况下，你都在同一个目录中，因此你可以像这样使用它：

```
./script.sh
```

如果你不与你的脚本在同一个目录中，你可以具体指定脚本的绝对路径或相对路径：

![在其它的目录中运行 Shell 脚本][9]

#### 在脚本前的这个 ./ 是非常重要的。(当你与脚本在同一个目录中)

![][10]

为什么当你在同一个目录下，却不能使用脚本名称？这是因为你的 Linux 系统会在 PATH 变量中查找具体指定的几个选定目录中的可执行的文件来运行。

这里是我的系统的 PATH 变量的值：

```
abhishek@itsfoss:~$ echo $PATH
/home/abhishek/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

这意味着在下面目录中具有可执行权限的任意文件都可以在系统的任何位置运行：

  * /home/abhishek/.local/bin
  * /usr/local/sbin
  * /usr/local/bin
  * /usr/sbin
  * /usr/bin
  * /sbin
  * /bin
  * /usr/games
  * /usr/local/games
  * /snap/bin



Linux 命令（像 ls ，cat 等）的二进制文件或可执行文件都位于这些目录中的其中一个目录。这就是为什么你可以在你系统的任何位置通过使用命令的名称来运作这些命令的原因。看看，ls 命令就是位于 /usr/bin 目录中。

![][11]

当你使用脚本而不具体指定其绝对路径或相对路径时，系统将不能在 PATH 变量中找到涉及的脚本。

#### 为什么大多数 shell 脚本在其头部包含 #! /bin/bash ？

记得我提过 shell 只是一个程序，并且有不同实现的 shell 程序。

当你使用 #! /bin/bash 时，你是具体指定 bash 作为解释器来运行脚本。如果你不这样做，并且以 ./script.sh 的方式运行一个脚本，它通常会在你正在运行的 shell 中运行。

有问题吗？可能会有。看看，大多数的 shell 语法是大多数种类的 shell 中通用的，但是有一些语法可能会有所不同。

例如，在 bash和 zsh 中数组的行为是不同的。在 zsh 中，数组索引是从 1 开始的，而不是从 0 开始。

![Bash Vs Zsh][12]

使用 #! /bin/bash 标示该级别是 bash 脚本，并且应该使用bash 作为脚本的解释器来运行，而不受在系统上正在使用的 shell 的影响。如果你使用 zsh 的特殊语法，你可以通过在脚本的第一行添加 #! /bin/zsh 的方式来标示其是 zsh 脚本

在 #! 和 /bin/bash 之间的空格是没有影响的。你也可以使用 #!/bin/bash 。

### 它有帮助吗？

我希望这篇文章能够增加你的 Linux 知识。如果你还有问题或建议，请留下评论。

专家用户可能依然会挑出我丢失的东西。但是这类初学者话题的问题不容易找到信息和避免过多或过少的细节之间的平衡。

如果你对学习 bash 脚本感兴趣，在我们的以系统管理为中心的网站 [Linux Handbook][14] 上，我们有一个 [完整的 Bash 初学者系列][13] 。如果你想要，你也可以 [购买附加练习题的电子书][15] ，以支持 Linux Handbook。

--------------------------------------------------------------------------------

via: https://itsfoss.com/run-shell-script-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/run-a-shell-script-linux.png?resize=741%2C329&ssl=1
[2]: https://linuxhandbook.com/linux-file-permissions/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/running-text-file-as-script.png?resize=741%2C329&ssl=1
[4]: https://www.zsh.org
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/execute-shell-script-with-zsh.png?resize=741%2C253&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/run-multiple-commands-in-linux.png?fit=800%2C450&ssl=1
[7]: https://itsfoss.com/run-multiple-commands-linux/
[8]: https://linuxhandbook.com/chmod-command/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/running-shell-script-in-other-directory.png?resize=795%2C272&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/executing-shell-scripts-linux.png?resize=800%2C450&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/locating-command-linux.png?resize=795%2C272&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/bash-vs-zsh.png?resize=795%2C386&ssl=1
[13]: https://linuxhandbook.com/tag/bash-beginner/
[14]: https://linuxhandbook.com
[15]: https://www.buymeacoffee.com/linuxhandbook
