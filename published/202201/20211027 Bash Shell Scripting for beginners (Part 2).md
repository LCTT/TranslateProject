[#]: subject: "Bash Shell Scripting for beginners (Part 2)"
[#]: via: "https://fedoramagazine.org/bash-shell-scripting-for-beginners-part-2/"
[#]: author: "Matthew Darnell https://fedoramagazine.org/author/zexcon/"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14198-1.html"

Bash Shell 脚本新手指南（二）
======

![][1]

欢迎来到面向初学者的 Bash Shell 脚本知识第二部分。本篇将就 Bash 脚本一些更独特的方面进行深入探讨。我们会用到一些 [上篇][5] 中已经熟悉的命令（如果遇到新命令，会给出讲解），进而涵盖一些标准输出、标准输入、标准错误、“管道”和数据重定向的相关知识。

### 使用 # 添加注释

随着脚本变得愈加复杂和实用，我们需要添加注释，以便记住程序在做什么。如果与其他人分享你的脚本，注释也将帮助他们理解思考过程，以及更好理解你的脚本实现的功能。想一想上篇文章中的数学方程，我们在新版脚本中添加了一些注释。注意，在 `learnToScript.sh` 文件（如下所示）中，注释是前面带有 `#` 号的行。当脚本运行时，这些注释行并不会出现。

```
#!/bin/bash

#Let's pick up from our last article. We
#learned how to use mathematical equations
#in bash scripting.

echo $((5+3))
echo $((5-3))
echo $((5*3))
echo $((5/3))
```

```
[zexcon ~]$ ./learnToScript.sh
8
2
15
1
```

### 管道符 |

我们将使用另一个名为 `grep` 的工具来介绍管道运算符。

> `grep` 可以在输入文件中搜索可以匹配指定模式的行。默认情况下，`grep` 会输出相应的匹配行。
>
> <https://www.gnu.org/software/grep/>

Paul W. Frields 在 《Fedora 杂志》上的文章很好地介绍了关于 _grep_ 的知识。

> [命令行快速小技巧：使用 grep 进行搜索][4]

管道键在键盘上位于回车键上方，可以在英文状态下按 `Shift + \` 输入。

现在你已经略微熟悉了 `grep`，接下来看一个使用管道命令的示例。在命令行输入 `ls -l | grep learn`。

```
[zexcon ~]$ ls -l | grep learn
-rwxrw-rw-. 1 zexcon zexcon   70 Sep 17 10:10 learnToScript.sh
```

通常 `ls -l` 命令会在屏幕上显示文件列表。这里 `ls -l` 命令的完整结果通过管道传送到搜索字符串 `learn` 的 `grep` 命令中。你可以将管道命令想象成一个过滤器。先运行一个命令（本例中为 `ls -l`，结果会给出目录中的文件），这些结果通过管道命令给到 `grep`，后者会在其中搜索 `learn`，并且只显示符合条件的目标行。

下面再看一个例子以巩固相关知识。`less` 命令可以让用户查看超出一个屏幕尺寸的命令结果。以下是命令手册页中关于 `less` 的简要说明。

> `less` 是一个类似于 `more` 的程序，但它允许在文件中向后或向前进行翻页移动。此外，`less` 不必在开始之前读取整个输入文件，因此对于大型输入文件而言，它比 `vi` 等文本编辑器启动更快。该命令较少使用 termcap（或某些系统上的 terminfo），因此可以在各种终端上运行。甚至还在一定程度上支持用于硬拷贝终端的端口。（在硬拷贝终端上，显示在屏幕顶部的行会以插入符号为前缀。）
>
> Fedora 34 手册页

下面让我们看看管道命令和 `less` 命令结合使用会是什么样子。

```
[zexcon ~]$ ls -l /etc | less
```

```
total 1504
drwxr-xr-x. 1 root root       126 Jul  7 17:46 abrt
-rw-r--r--. 1 root root        18 Jul  7 16:04 adjtime
-rw-r--r--. 1 root root      1529 Jun 23  2020 aliases
drwxr-xr-x. 1 root root        70 Jul  7 17:47 alsa
drwxr-xr-x. 1 root root        14 Apr 23 05:58 cron.d
drwxr-xr-x. 1 root root         0 Jan 25  2021 cron.daily
:
:
```

为便于阅读，此处对结果进行了修剪。用户可以使用键盘上的箭头键向上或向下滚动，进而控制显示。如果使用命令行，结果超出屏幕的话，用户可能会看不到结果的开头行。要退出 `less` 屏幕，只需点击 `q` 键。

### 标准输出（stdout）重定向 >、>>、1>、1>>

`>` 或 `>>` 符号之前的命令输出结果，会被写入到紧跟的文件名对应的文件中。`>` 和 `1>` 具有相同的效果，因为 `1` 就代表着标准输出。如果不显式指定 `1`，则默认为标准输出。`>>` 和 `1>>` 将数据附加到文件的末尾。使用 `>` 或 `>>` 时，如果文件不存在，则会创建对应文件。

例如，如果你想查看 `ping` 命令的输出，以查看它是否丢弃了数据包。与其关注控制台，不如将输出结果重定向到文件中，这样你就可以稍后再回来查看数据包是否被丢弃。下面是使用 `>` 的重定向测试。

```
[zexcon ~]$ ls -l ~ > learnToScriptOutput
```

该命令会获取本应输出到终端的结果（`~` 代表家目录），并将其重定向到 `learnToScriptOutput` 文件。注意，我们并未手动创建 `learnToScriptOutput`，系统会自动创建该文件。

```
total 128
drwxr-xr-x. 1 zexcon zexcon   268 Oct  1 16:02 Desktop
drwxr-xr-x. 1 zexcon zexcon    80 Sep 16 08:53 Documents
drwxr-xr-x. 1 zexcon zexcon     0 Oct  1 15:59 Downloads
-rw-rw-r--. 1 zexcon zexcon   685 Oct  4 16:00 learnToScriptAllOutput
-rw-rw-r--. 1 zexcon zexcon    23 Oct  4 12:42 learnToScriptInput
-rw-rw-r--. 1 zexcon zexcon     0 Oct  4 16:42 learnToScriptOutput
-rw-rw-r--. 1 zexcon zexcon    52 Oct  4 16:07 learnToScriptOutputError
-rwxrw-rw-. 1 zexcon zexcon   477 Oct  4 15:01 learnToScript.sh
drwxr-xr-x. 1 zexcon zexcon     0 Jul  7 16:04 Videos
```

### 标准错误（stderr）重定向 `2>`、`2>>`

`>` 或 `>>` 符号之前命令的错误信息输出，会被写入到紧跟的文件名对应的文件中。`2>` 和 `2>>` 具有相同的效果，但 `2>>` 是将数据追加到文件末尾。你可能会想，这有什么用？不妨假象一下用户只想捕获错误信息的场景，然后你就会意识到 `2>` 或 `2>>` 的作用。数字 `2` 表示本应输出到终端的标准错误信息输出。现在我们试着追踪一个不存在的文件，以试试这个知识点。

```
[zexcon ~]$ ls -l /etc/invalidTest 2> learnToScriptOutputError
```

这会生成错误信息，并将错误信息重定向输入到 `learnToScriptOutputError` 文件中。

```
ls: cannot access '/etc/invalidTest': No such file or directory
```

### 所有输出重定向 &>、&>>、|&

如果你不想将标准输出（`stdout`）和标准错误信息（`stderr`）写入不同的文件，那么在 Bash 5 中，你可以使用 `&>` 将标准输出和标准错误重定向到同一个文件，或者使用 `&>>` 追加到文件末尾。

```
[zexcon ~]$ ls -l ~ &>> learnToScriptAllOutput
[zexcon ~]$ ls -l /etc/invalidTest &>> learnToScriptAllOutput
```

运行这些命令后，两者的输出都会进入同一个文件中，而不会区分是错误信息还是标准输出。

```
total 128
drwxr-xr-x. 1 zexcon zexcon   268 Oct  1 16:02 Desktop
drwxr-xr-x. 1 zexcon zexcon    80 Sep 16 08:53 Documents
drwxr-xr-x. 1 zexcon zexcon     0 Oct  1 15:59 Downloads
-rw-rw-r--. 1 zexcon zexcon   685 Oct  4 16:00 learnToScriptAllOutput
-rw-rw-r--. 1 zexcon zexcon    23 Oct  4 12:42 learnToScriptInput
-rw-rw-r--. 1 zexcon zexcon     0 Oct  4 16:42 learnToScriptOutput
-rw-rw-r--. 1 zexcon zexcon    52 Oct  4 16:07 learnToScriptOutputError
-rwxrw-rw-. 1 zexcon zexcon   477 Oct  4 15:01 learnToScript.sh
drwxr-xr-x. 1 zexcon zexcon     0 Jul  7 16:04 Videos
ls: cannot access '/etc/invalidTest': No such file or directory
```

如果你直接使用命令行操作，并希望将所有结果通过管道传输到另一个命令，可以选择使用 `|&` 实现。

```
[zexcon ~]$ ls -l |& grep learn
-rw-rw-r--. 1 zexcon zexcon    1197 Oct 18 09:46 learnToScriptAllOutput
-rw-rw-r--. 1 zexcon zexcon     343 Oct 14 10:47 learnToScriptError
-rw-rw-r--. 1 zexcon zexcon       0 Oct 14 11:11 learnToScriptOut
-rw-rw-r--. 1 zexcon zexcon     348 Oct 14 10:27 learnToScriptOutError
-rwxr-x---. 1 zexcon zexcon     328 Oct 18 09:46 learnToScript.sh
[zexcon ~]$
```

### 标准输入（stdin）

在本篇和上篇文章中，我们已经多次使用过标准输入（stdin），因为在每次使用键盘输入时，我们都在使用标准输入。为了区别通常意义上的“键盘即标准输入”，这次我们尝试在脚本中使用 `read` 命令。下面的脚本中就使用了 `read` 命令，字面上就像“读取标准输入”。

```
#!/bin/bash

#Here we are asking a question to prompt the user for standard input. i.e.keyboard
echo 'Please enter your name.'

#Here we are reading the standard input and assigning it to the variable name with the read command.
read name

#We are now going back to standard output, by using echo and printing your name to the command line.
echo "With standard input you have told me your name is: $name"
```

这个示例通过标准输出给出提示，提醒用户输入信息，然后从标准输入（键盘）获取信息，使用 `read` 将其存储在 `name` 变量中，并通过标准输出显示出 `name` 中的值。

```
[zexcon@fedora ~]$ ./learnToScript.sh
Please enter your name.
zexcon
With standard input you have told me your name is: zexcon
[zexcon@fedora ~]$
```

### 在脚本中使用

现在我们把学到的东西放入脚本中，学习一下如何实际应用。下面是增加了几行后的新版本 `learnToScript.sh` 文件。它用追加的方式将标准输出、标准错误信息，以及两者混合后的信息，分别写入到三个不同文件。它将标准输出写入 `learnToScriptStandardOutput`，标准错误信息写入 `learnToScriptStandardError`，二者共同都写入 `learnToScriptAllOutput` 文件。

```
#!/bin/bash

#As we know this article is about scripting. So let's
#use what we learned in a script. 

#Let's get some information from the user and add it to our scripts with stanard input and read

echo "What is your name? "
read name


#Here standard output directed to append a file to learnToScirptStandardOutput
echo "$name, this will take standard output with append >> and redirect to learnToScriptStandardOutput." 1>> learnToScriptStandardOutput


#Here we are taking the standard error and appending it to learnToScriptStandardError but to see this we need to #create an error.
eco "Standard error with append >> redirect to learnToScriptStandardError." 2>> learnToScriptStandardError

#Here we are going to create an error and a standard output and see they go to the same place.
echo "Standard output with append >> redirect to learnToScriptAllOutput." &>> learnToScriptAllOutput
eco "Standard error with append >> redirect to learnToScriptAllOutput." &>> learnToScriptAllOutput
```

脚本在同一目录中创建了三个文件。命令 `echo` 故意输入错误（LCTT 译注：缺少了字母 h）以产生错误信息。如果查看三个文件，你会在 `learnToScriptStandardOutput` 中看到一条信息，在 `learnToScriptStandardError` 中看到一条信息，在 `learnToScriptAllOutput` 中看到两条信息。另外，该脚本还会再次提示输入的 `name` 值，再将其写入 `learnToScriptStandardOutput` 中。 

### 结语

至此你应该能够明确，可以在命令行中执行的操作，都可以在脚本中执行。在编写可能供他人使用的脚本时，文档非常重要。如果继续深入研究脚本，标准输出会显得更有意义，因为你将会控制它们的生成。在脚本中，你可以与命令行中操作时应用相同的内容。下一篇文章我们会讨论函数、循环，以及在此基础上进一步构建的结构。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/bash-shell-scripting-for-beginners-part-2/

作者：[Matthew Darnell][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zexcon/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/10/bash_shell_scripting_pt2-816x345.jpg
[2]: https://unsplash.com/@nbandana?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/shell-scripting?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/command-line-quick-tips-searching-with-grep/
[5]: https://linux.cn/article-14131-1.html