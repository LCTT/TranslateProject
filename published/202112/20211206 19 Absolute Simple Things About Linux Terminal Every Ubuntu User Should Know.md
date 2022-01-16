[#]: subject: "19 Absolute Simple Things About Linux Terminal Every Ubuntu User Should Know"
[#]: via: "https://itsfoss.com/basic-terminal-tips-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14064-1.html"

关于 Ubnutu Linux 终端的必知必会的 19 件超简单的事情
======

终端常常让新用户感到害怕。然而，一旦你了解了它，你就会逐渐开始喜欢上它。好吧，这事往往发生在大多数 Linux 用户身上。

即使你使用 Ubuntu 作为桌面系统，你可能有时也要进入终端。新用户往往对很多事情毫无头绪，在这种情况下，一些基本的 Linux 命令的知识总是有帮助的，但这篇文章不是关于这个。

这篇文章的重点是解释关于使用终端的一些小的、基本的、经常被忽视的东西。这应该可以帮助 Ubuntu 桌面的新用户了解终端，并以更高的效率使用它。

![][1]

你看到的“<ruby>终端<rt>terminal</rt></ruby>”只是 [各种终端应用程序][2] 中的一个。毕竟终端只是一个 GUI 工具，它可以让你进入一个可以运行命令的 Shell 。

不同的终端应用程序（正确地应该被称为“<ruby>终端仿真器</rt></ruby>”）看起来有些稍微不同的功能和特点（如不同的键盘快捷键、颜色组合、字体等）。

本文特别关注 Ubuntu 的默认终端，它是 “GNOME 终端”的一个实现。

### 1、用键盘快捷方式打开终端

你可以 [在 Ubuntu 中打开终端][3]，在系统菜单中寻找到它。然而，我最喜欢的方式是使用 [Ubuntu 中的键盘快捷键][4]：`Ctrl+Alt+T` 。

### 2、终端、Shell、提示符和命令行

在你看其他内容之前，你应该知道这些不同术语之间的区别，这些术语经常被（不正确地）互换使用。

![终端、提示符和命令][5]

“终端”是图形化的应用程序，默认情况下运行 Shell。

Shell 很难与终端分开进行可视化。终端运行着一个 Shell，在 Ubuntu 中通常默认为 Bash shell。和终端一样，也有各种 Shell。Bash 是其中最受欢迎的，也是大多数 Linux 发行版上的默认 Shell。

你输入的命令是由 Shell 解释的。通常人们认为他们在终端看到的屏幕就是 Shell。这适合理解这个概念。

“提示符”是你在输入命令的空格前看到的东西。对于提示符没有固定的标准。在一些旧的终端中，只是在你可以输入命令的地方有一个闪烁的光标而已。在 Ubuntu 终端中，提示符给了你一些信息，你会在本文后面的章节中看到这些信息的细节。

“命令行”不是 Linux 特有的东西。很多操作系统都有一个命令行界面。许多编程语言也都有命令行界面。它是一个术语，用来指你可以运行和执行命令的界面。

Luke Smith 的 [这个视频](https://www.youtube.com/embed/hMSByvFHOro) 用例子详细解释了它。言归正传，我在这里就不多说了。

### 3、了解提示符

你现在已经知道了。你在输入命令的空格前看到的东西叫做“提示符”。它是可配置的，在不同的发行版、终端应用程序和 Shell 中提示符看起来是不同的。

Ubuntu 终端对提示符进行了配置，让你看到一些东西。你可以一目了然地得到以下信息：

  * 用户名
  * 主机名（计算机的名称）
  * 当前工作目录

还有一些你可能想知道的惯例。

提示符中的冒号（`:`）是一个分隔符，常用来区分主机名和当前位置。

波浪号（`~`）表示当前用户的主目录。

对于普通用户，提示符以美元（`$`）符号结束。对于 root 用户来说，它以英镑或哈希（`#`）符号结束。因此有一个笑话说，英镑比美元强。

![][7]

你是否注意到，当我切换到 root 用户时，命令提示符看起来不一样，没有任何颜色？这又一次提醒了我，提示符不是一个标准，是要明确配置的。对于普通用户来说，Ubuntu 对提示符的配置与 root 用户不同。

像这样的简单信息间接地帮助了我们。在一个多用户环境中，你可以很容易地弄清楚你现在使用的是哪个用户，以及它是否是 root 用户。其显示的路径位置也是有帮助的。

![][8]

### 4、目录和文件

在 Linux 中你听到最多的两个术语是目录和文件。

你可能知道什么是文件，但你可能会对“<ruby>目录<rt>directory</rt></ruby>”这个术语感到困惑。目录就是“<ruby>文件夹<rt>folder</rt></ruby>”。它把文件和文件夹放在里面。

你可以进入目录，但你不能进入文件。当然，你可以读取文件。

![][9]

你可以用“文件夹”这个词来表示目录，应该没有问题。然而，最好使用“目录”，因为你会在各种教程、文件等中看到引用这个词。你甚至会发现像 `rmdir`、`mkdir` 这样的命令，暗示它们是处理目录的。

补充说明：在 Linux 中，所有东西都是文件。甚至目录也是一种特殊的文件，里面有文件和目录的地址。我已经在我的关于 [硬链接的文章][10] 中解释了这一点。如果你想了解更多关于这个主题的信息，可以参考一下。

### 5、路径：绝对路径和相对路径

[Linux 中的目录结构][11] 类似于一棵树的根。所有的东西都从根部开始，并从那里向外扩散。

如果你要访问一个文件或目录，你需要通过提供它的“路径”来说明如何到达它的位置。这个路径是由目录名和分隔符（`/`）组成的。如果一个路径以 `/`（即根）开头，它就是一个绝对路径，否则就是一个相对路径。

![路径][12]

绝对路径从根开始，可以很容易地从系统的任何地方引用。相对路径则取决于你在目录结构中的当前位置。

![绝对路径与相对路径][13]

如果你在 `/home/abhishek` 这个位置，有一个名为 `scripts` 的目录，里面有一个文件 `my_script.sh`，你想知道这个文件的路径，它的绝对路径将是：

```
/home/abhishek/scripts/my_script.sh
```

它的相对路径将是：

```
scripts/my_script.sh
```

如果你改变所在位置，文件的绝对路径保持不变。但是，相对路径会改变，因为它是相对于你当前的路径而言的。

![相对路径随位置变化但绝对路径保持不变的真实例子][14]

### 6、 . 和 ..

在使用 Linux 终端时，你可能经常会遇到 `.`和 `..` 符号。

单点（`.`）表示当前目录。

双点（`..`）表示父目录（比当前位置高一个目录）。

你经常在相对路径中使用双点（`..`），或者用于改变目录。单点（`.`）也用于相对路径中，但更重要的是，你可以在指定当前位置的命令中使用它。

![ . 和 .. 的使用][15]

### 7、理解命令的结构

一个典型的 Linux 命令由一个命令名和选项及参数组成。

```
命令名 [选项] 参数
```

“选项”，顾名思义，是可选的。当使用时，它们可能会根据其属性来改变输出。

例如，`cat` 命令是用来查看文件的。你可以添加选项 `-n`，它也会显示行数。

选项不是标准化的。通常情况下，它们是由单字母和单破折号（`-`）组成的。它们也可能是两个破折号（`--`）和一个单词的形式。

同样的选项在不同的命令中可能有不同的含义。如果你在 `head` 命令中使用 `-n`，表明你想看行数，而不是行号。

![同样的选项 -n 在 cat 和 head 命令中有不同的用途][16]

在命令文档中，**如果你看到方括号（`[]`）之间有什么东西，它表示括号中的内容是可选的**。

同样地，“参数”也没有标准化。有些命令希望用文件名作为参数，有些则希望用目录名或正则表达式。

### 8、获得帮助

当你开始使用命令时，你可能会记住一些经常使用的命令的选项，但你根本不可能记住所有命令的所有选项。

为什么呢？因为一条命令可能有十多个或二十多个选项。

那么，当你无法记住所有的选项时，你该怎么办呢？你需要“帮助”。我所说的帮助，并不是指在 [Linux 论坛][17] 上提问。我指的是使用命令的帮助选项。

每个标准的 Linux 命令都有一个快速帮助页面，可以用 `-h` 或 `—help` 来访问。

```
命令名 -h
```

它可以让你快速了解命令的语法、常用选项及其含义，在某些情况下还有命令的例子。

![cat 命令的帮助页][18]

如果你需要更多的帮助，你可以参考 [手册页][19]，即命令的手册。

```
man 命令名
```

它涉及到所有的细节，阅读和理解起来可能会让人难以承受。另外，你也可以在网上搜索 “Linux 中 xyz 命令的例子”。

### 9、Linux 是区分大小写的

Linux 是区分大小写的。你在终端中输入的所有东西都是区分大小写的。如果你不考虑这一点，你会经常遇到 “[bash: command not found][20]” 或 “file not found” 的错误。

在主目录中，你的所有文件夹名称以大写字母开头的。如果你要切换到 `Documents` 目录，你必须把第一个字母保持为 `D`，而不是 `d`。

![Linux 是区分大小写的][21]

你可以有两个分别名为 `file.txt` 和 `File.txt` 的文件，因为对于 Linux 来说，`file` 和 `File` 是不一样的。

### 10、运行 Shell 脚本

你可以通过指定 Shell 来 [运行一个 Shell 脚本][22]：

```
bash script.sh
```

或者你可以像这样执行 Shell 脚本。

```
./script.sh
```

第二种方法只有在文件有执行权限时才会起作用。更多关于 [Linux 文件权限参考这里][23]。

![运行bash脚本][24]

### 11、使用制表符补完而不是全部输入

Ubuntu 的终端已经预先配置了制表符补完功能。这意味着如果你开始在终端上输入，然后点击 `tab` ，它会尝试自动完成它，或者在有多个可能的匹配时提供选项。

它既适用于命令，也适用于参数和文件名。

![Tab 完成示例][25]

这可以节省大量的时间，因为你不需要把所有的东西都写完整。

### 12、Ctrl+C 和 Ctrl+V 不是用来在终端复制粘贴的。

`Ctrl+C`、`Ctrl+V` 可能是复制粘贴的“通用”键盘快捷键，但它在 Linux 终端中不行。

Linux 继承了 UNIX 的很多东西，在 UNIX 中，`Ctrl+C` 被用来停止一个正在运行的进程。

由于 `Ctrl+C` 已经被用于停止一个命令或进程，所以它不能再用于复制粘贴。

### 13、你当然可以在终端复制粘贴

别担心。你仍然可以 [在终端中复制粘贴][26]。同样，复制-粘贴的键盘快捷键没有固定的规则，因为它取决于你使用的终端程序或你的配置。

在 Ubuntu 终端中，复制的默认键盘快捷键是 `Ctrl+Shift+C`，粘贴则是 `Ctrl+Shift+V`。

你可以使用 `Ctrl+C` 从终端外（如网页浏览器）复制文本和命令，并使用 `Ctrl+Shift+V` 将其粘贴。同样，你可以高亮显示文本，用 `Ctrl+Shift+C` 从终端复制文本，用 `Ctrl+V` 粘贴到编辑器或其他应用程序。

### 14、避免在终端中使用 Ctrl+S

另一个初学者常犯的错误是使用“通用”的 `Ctrl+S` 键盘快捷键来保存。如果你在终端中使用 `Ctrl+S`，你的终端会被“冻结”。

这来自于传统的计算机，在那里没有向上滚动的滚动条。因此，如果有大量的输出行，`Ctrl+S` 被用来停止屏幕，以便可以阅读屏幕上的文字。

你可以用 `Ctrl+Q` 来解除终端的冻结。但还是要避免在终端中使用 `Ctrl+S`。

### 15、注意命令例子中的 $ 和 <>

如果你参考一些在线教程或文档，你会看到一些命令例子中的文本在 `<>` 内。这表明你需要用一个合适的值来替换与 `<` 和 `>` 一起的内容。

例如，如果你看到一个这样的命令：

```
grep -i <搜索内容> <文件名>
```

你应该把 `<搜索内容>` 和 `<文件名>` 换成各自的实际值。（LCTT 译注：不要输入 `<` 和 `>`）

这表明该命令只是一个例子，你必须用实际值来完成它。

这里需要注意的另一件事是，有些教程显示的命令例子是以 `$` 开头的，比如这样：

![命令开头的美元符号][27]

这是表明它们是命令（而不是命令输出）的一种方式。但是，许多新的 Linux 用户把前面的 `$` 和实际的命令一起复制，当他们把它粘贴到终端时，显然会出现错误。

所以，当你复制一些命令时，如果开头有 `$`，就不要复制它。你也应该避免复制随机网站的随机命令，特别是当你不了解它的作用时。

既然你正在阅读关于复制命令的文章，当你看到多行的命令在一起时，你应该一次复制一行，然后逐一运行。

![避免将多个命令复制在一起][28]

下一节将告诉你如何一次性运行多个命令。

### 16、你可以同时运行多个命令

你可以 [一次运行多个命令][29] 而不需要用户干预。作为 Ubuntu 用户，你可能已经在这个命令的形式中看到了它：

```
sudo apt update && sudo apt upgrade
```

在终端中，有三种不同的方法来组合命令：

`;` | `命令 1 ; 命令 2` | 先运行命令 1，再运行命令 2
---|---|---
`&&` | `命令 1 && 命令 2` | 只有命令 1 成功结束才运行命令 2
`||` | `命令 1 || 命令 2` | 只有命令 1 失败时才运行命令 2

### 17、停止一个正在运行的 Linux 命令

如果一个 Linux 命令在前台运行，也就是说，它正在显示输出，或者说你不能输入任何其他命令，你可以用 `Ctrl+C` 键停止它。

我以前讨论过它。它来自于 UNIX 的传统计算时代。

所以，下次你看到像 `top` 或 `ping` 这样的命令在持续运行，而你想恢复终端控制，只需使用这两个键：`Ctrl+C`。

![在 Linux 中用 Ctrl+C 停止一个正在运行的程序][30]

### 18、清除终端

当我发现我的屏幕被不同类型的输出弄得太杂乱时，我会在开始其他工作之前清除终端屏幕。这只是一种习惯，但我发现它很有帮助。

要清除终端，请使用以下命令：

```
clear
```

你也可以使用 [终端快捷键][31] `Ctrl+L`。

### 19、退出终端

在少数情况下，我看到有人关闭终端程序来退出会话。你可以这样做，但退出终端的正确方法是使用退出命令：

```
exit
```

你也可以使用 Ubuntu 终端的键盘快捷键 `Ctrl+D`。

### 总结

即使你对终端完全陌生，你也可以在终端中做很多额外的事情。你可以：

  * [运行有趣的 Linux 命令][32]
  * [在终端中浏览互联网][33]
  * [在终端中玩游戏][34]

如果你想了解更多，[看看这些 Linux 命令技巧，可以像专家一样使用终端][35]。

说实话，要谈的东西太多了。很难确定哪些应该被认为是绝对的基础知识，哪些应该被排除在外。例如，我想避免包括关于路径的信息，因为它需要详细的解释，但在一个地方讲得太详细可能会让人不知所措。

我已经过了在终端中的小东西曾经让我困惑的阶段。如果你是 Linux 终端的新手，或者你还记得你最初使用 Linux 时的挣扎，请随时提出建议对列表进行补充。我可能会根据你的意见更新这个列表。

如果你学到了新的东西，请在评论中提及。我想看看这篇文章是否值得一读 😁

--------------------------------------------------------------------------------

via: https://itsfoss.com/basic-terminal-tips-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/ubuntu-terminal-basic-tips.png?resize=800%2C450&ssl=1
[2]: https://itsfoss.com/linux-terminal-emulators/
[3]: https://itsfoss.com/open-terminal-ubuntu/
[4]: https://itsfoss.com/ubuntu-shortcuts/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/linux-terminal-introduction.png?resize=800%2C450&ssl=1
[6]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/understanding-prompt-ubuntu-terminal.png?resize=800%2C346&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/learning-prompt-ubuntu-terminal.png?resize=800%2C346&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/directory-files-linux.png?resize=800%2C346&ssl=1
[10]: https://linuxhandbook.com/hard-link/
[11]: https://linuxhandbook.com/linux-directory-structure/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/path-linux.webp?resize=800%2C250&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/absolute-vs-relative-path-linux.webp?resize=800%2C500&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/absolute-relative-path-real-examples-800x346.png?resize=800%2C346&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/use-of-single-and-double-dot-in-Linux.png?resize=732%2C272&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/command-structure-example.png?resize=732%2C462&ssl=1
[17]: https://itsfoss.community/
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/cat-command-help-page.png?resize=732%2C614&ssl=1
[19]: https://itsfoss.com/linux-man-page-guide/
[20]: https://itsfoss.com/bash-command-not-found/
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/linux-is-case-sensitive.png?resize=732%2C253&ssl=1
[22]: https://itsfoss.com/run-shell-script-linux/
[23]: https://linuxhandbook.com/linux-file-permissions/
[24]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/run-bash-script.png?resize=732%2C272&ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/tab-completion-ubuntu.png?resize=732%2C272&ssl=1
[26]: https://itsfoss.com/copy-paste-linux-terminal/
[27]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/dollar-symbol-at-the-beginning-of-command.png?resize=765%2C256&ssl=1
[28]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/avoid-copying-multiple-commands.png?resize=743%2C242&ssl=1
[29]: https://itsfoss.com/run-multiple-commands-linux/
[30]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/stop-running-program-linux.png?resize=800%2C385&ssl=1
[31]: https://linuxhandbook.com/linux-shortcuts/
[32]: https://itsfoss.com/funny-linux-commands/
[33]: https://itsfoss.com/terminal-web-browsers/
[34]: https://itsfoss.com/best-command-line-games-linux/
[35]: https://itsfoss.com/linux-command-tricks/
