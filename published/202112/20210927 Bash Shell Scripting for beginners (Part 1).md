[#]: subject: "Bash Shell Scripting for beginners (Part 1)"
[#]: via: "https://fedoramagazine.org/bash-shell-scripting-for-beginners-part-1/"
[#]: author: "zexcon https://fedoramagazine.org/author/zexcon/"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14131-1.html"

Bash Shell 脚本新手指南（一）
======

![][1]

如标题所示，本文将涵盖面向初学者的 Bash Shell 脚本知识。虽然本文没有回顾 Bash 的历史，但是有很多资源能够便于读者了解相关内容，读者也可以直接访问 <https://www.gnu.org/software/bash/> 上的 GNU 项目。我们会从了解一些非常基本的概念开始，然后再将相关知识综合起来。 

### 创建脚本文件

首先来创建一个脚本文件。我们要确保当前目录为家目录。

```
cd ~
```

在主目录中创建示例文件。文件名可以是任意名称，本文使用 `learnToScript.sh` 作为文件名。 

```
touch learnToScript.sh
```

此时家目录中就生成了一个名为 `learnToScript.sh` 的文件。输入以下命令以检验该文件是否存在，还可以注意到其权限是 `-rw-rw-r–`。 

```
[zexcon@trinity ~]$ ls -l
total 7
drwxr-xr-x. 1 zexcon zexcon   90 Aug 30 13:08 Desktop
drwxr-xr-x. 1 zexcon zexcon   80 Sep 16 08:53 Documents
drwxr-xr-x. 1 zexcon zexcon 1222 Sep 16 08:53 Downloads
-rw-rw-r--. 1 zexcon zexcon   70 Sep 17 10:10 learnToScript.sh
drwxr-xr-x. 1 zexcon zexcon    0 Jul  7 16:04 Music
drwxr-xr-x. 1 zexcon zexcon  318 Sep 15 13:53 Pictures
drwxr-xr-x. 1 zexcon zexcon    0 Jul  7 16:04 Public
drwxr-xr-x. 1 zexcon zexcon    0 Jul  7 16:04 Videos
[zexcon@trinity ~]$
```

正式开始之前还有一件事要做。可以试一下在没有写入任何内容的情况下执行脚本，命令行输入以下内容：

```
./learnToScript.sh
```

```
[zexcon ~]$ ./learnToScript.sh
bash: ./learnToScript.sh: Permission denied
```

提示权限被拒绝，因为该文件没有执行权限。所以你需要更改文件的权限才能执行脚本。如果你不熟悉权限相关知识，建议阅读 [Paul W. Frields][4] 写的 Fedora 杂志文章。

- [命令行小知识：权限][5]
- [命令行小知识：深入权限][6]

假定我们已经了解了权限相关知识，回到终端更改 `learnToScript.sh` 文件，增加执行权限。输入以下内容： 

```
chmod 755 learnToScript.sh
```

```
[zexcon@trinity ~]$ ls -l
total 7
drwxr-xr-x. 1 zexcon zexcon   90 Aug 30 13:08 Desktop
drwxr-xr-x. 1 zexcon zexcon   80 Sep 16 08:53 Documents
drwxr-xr-x. 1 zexcon zexcon 1222 Sep 16 08:53 Downloads
-rwxr-xr-x. 1 zexcon zexcon   70 Sep 17 10:10 learnToScript.sh
drwxr-xr-x. 1 zexcon zexcon    0 Jul  7 16:04 Music
drwxr-xr-x. 1 zexcon zexcon  318 Sep 15 13:53 Pictures
drwxr-xr-x. 1 zexcon zexcon    0 Jul  7 16:04 Public
drwxr-xr-x. 1 zexcon zexcon    0 Jul  7 16:04 Videos
[zexcon@trinity ~]$
```

好的，现在一切准备就绪，你已经获得了 `learnToScript.sh` 命令的读取、写入和执行权限 （`-rwxr-xr-x`）。

### 编辑脚本文件

下面的内容需要你熟悉 `vim` 或其他类似的文本编辑器，本文选用 `vim`。在命令提示符下输入以下内容： 

```
vim learnToScript.sh
```

这会打开一个空的文本文件，里面有一堆波浪号。键盘输入 `i` 将进入插入模式。通过查看终端窗口的左下角，你可以确认它处于该模式。（友情推荐，[nano][7] 编辑器也很不错。） 

接下来我们要确保文件被正确的解释器识别。因此，输入 `#!` 和 bash 的目录 `/bin/bash`：

```
#!/bin/bash
```

本文教程步骤的最后一件事是保存文档。按 `Esc` 退出输入模式，然后按 `Shift+:`。在冒号处输入 `wq`，按下回车键，就会写入（`w`）文件并退出（`q`）`vim` 编辑器。 

> 使用 `vim` 时要记住，要想写入文档，就需要输入 `i`，此时你会在底部看到 `–INSERT–`。要保存文档，就需要按 `Esc` 退出输入模式，然后按 `Shift+:`，输入 `w` 写入文件；或者按 `Esc`，然后 `Shift+:` 输入 `q`，实现退出而不保存；或者将 `wq` 连在一起，可以实现写入并关闭文件。`Esc` 本身就只是退出插入模式。你可以在其 [官方网站][8] 或 [教程网站][9] 上找到更多关于 `vim` 的信息。

### 开始正式写脚本

#### echo 命令

`echo` 命令用于向终端返回一些信息，可以使用单引号、双引号或不使用引号。那么让我们用一个传统的 Hello World 来试试它！ 

```
#!/bin/bash

echo Hello World!
echo 'Hello World!'
echo "Hello World!"
```

```
[zexcon ~]$ ./learnToScript.sh
Hello World!
Hello World!
Hello World!
[zexcon ~]$
```

注意，上述三行得到了相同的结果。使用单引号、双引号或不使用引号的结果不是一定相同的，但在这个基本脚本中确实得到了同样的结果。在某些情况下，引号的类型不同会导致结果差异。至此恭喜你编写了第一个 Bash 脚本。当你继续创建更多脚本并放飞你的想法时，可能会需要了解以下更多的知识。 

#### 命令替换 $( ) 和 \` \`

命令替换可以实现以下效果：获取在命令行执行命令的结果，并将该结果写入变量。例如，如果在命令提示符下输入 `ls`，可以获得当前工作目录的列表。我们用这个命令来实践一下。命令替换选项有两个，请注意：第一个选项使用键盘左侧 `Tab` 键上方的反引号。它与波浪号 `~` 在一个键位上。第二个选项使用 shell 变量。

```
#!/bin/bash

command1=`ls`
echo $command1

command2=$(ls)
echo $command2
```

```
[zexcon ~]$ ./learnToScript.sh
Desktop Documents Downloads learnToScript.sh Music Pictures Public snap Videos
Desktop Documents Downloads learnToScript.sh Music Pictures Public snap Videos
[zexcon ~]$
```

注意变量、等号和命令开头之间不要有空格。使用这两个选项得到的结果是完全相同的。请注意，变量需要以美元符号开头。如果你忘记了，并且回显了不带美元符号的命令变量，会只输出命令的名称，如下所示：

```
#!/bin/bash

command1=`ls`
echo command1

command2=$(ls)
echo command2
```

```
[zexcon ~]$ ./learnToScript.sh
command1
command2
[zexcon ~]$
```

#### 双括号 (())

那么双括号有什么用呢？ 很简单，双括号用于数学方程式。 

```
#!/bin/bash

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
[zexcon ~]$
```

### 结语

至此，我们已经创建了第一个脚本。我们知道了如何执行多个命令：将它们放在一个脚本中并运行，就可以获得结果。下一篇文章会继续讨论，了解输入和输出的重定向、管道命令、使用双括号或者添加注释等知识。 

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/bash-shell-scripting-for-beginners-part-1/

作者：[zexcon][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zexcon/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/09/bash_shell_scripting_pt1-1536x650.jpg
[2]: https://unsplash.com/@nbandana?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/shell-scripting?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: http://pfrields.id.fedoraproject.org/
[5]: https://fedoramagazine.org/command-line-quick-tips-permissions/
[6]: https://fedoramagazine.org/command-line-quick-tips-more-about-permissions/
[7]: https://fedoramagazine.org/gnu-nano-minimalist-console-editor/
[8]: https://www.vim.org/docs.php
[9]: https://linuxhandbook.com/basic-vim-commands/
