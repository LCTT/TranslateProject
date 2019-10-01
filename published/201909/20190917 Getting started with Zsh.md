[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11378-1.html)
[#]: subject: (Getting started with Zsh)
[#]: via: (https://opensource.com/article/19/9/getting-started-zsh)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Zsh 入门
======

> 从 Bash 进阶到 Z-shell，改进你的 shell 体验。

![](https://img.linux.net.cn/data/attachment/album/201909/23/163910imr1z1qw1ruo9uqs.jpg)

Z-shell（Zsh）是一种 Bourne 式的交互式 POSIX shell，以其丰富的创新功能而著称。Z-Shell 用户经常会提及它的许多便利之处，赞誉它对效率的提高和丰富的自定义支持。

如果你刚接触 Linux 或 Unix，但你的经验足以让你可以打开终端并运行一些命令的话，那么你可能使用的就是 Bash shell。Bash 可能是最具有代表意义的自由软件 shell，部分是因为它具有的先进的功能，部分是因为它是大多数流行的 Linux 和 Unix 操作系统上的默认 shell。但是，随着使用的次数越多，你可能会开始发现一些细节可能能够做的更好。开源有一个众所周知的地方，那就是选择。所以，许多人选择从 Bash “毕业”到 Z。

### Zsh 介绍

Shell 只是操作系统的接口。交互式 shell 程序允许你通过称为*标准输入*（stdin）的某个东西键入命令，并通过*标准输出*（stdout）和*标准错误*（stderr）获取输出。有很多种 shell，如 Bash、Csh、Ksh、Tcsh、Dash 和 Zsh。每个都有其开发者所认为最适合于 Shell 的功能。而这些功能的好坏，则取决于最终用户。

Zsh 具有交互式制表符补全、自动文件搜索、支持正则表达式、用于定义命令范围的高级速记符，以及丰富的主题引擎等功能。这些功能也包含在你所熟悉的其它 Bourne 式 shell 环境中，这意味着，如果你已经了解并喜欢 Bash，那么你也会熟悉 Zsh，除此以外，它还有更多的功能。你可能会认为它是一种 Bash++。

### 安装 Zsh

用你的包管理器安装 Zsh。

在 Fedora、RHEL 和 CentOS 上：

```
$ sudo dnf install zsh
```

在 Ubuntu 和 Debian 上：

```
$ sudo apt install zsh
```

在 MacOS 上你可以使用 MacPorts 安装它：

```
$ sudo port install zsh
```

或使用 Homebrew：

```
$ brew install zsh
```

在 Windows 上也可以运行 Zsh，但是只能在 Linux 层或类似 Linux 的层之上运行，例如 [Windows 的 Linux 子系统][2]（WSL）或 [Cygwin][3]。这类安装超出了本文的范围，因此请参考微软的文档。

### 设置 Zsh

Zsh 不是终端模拟器。它是在终端仿真器中运行的 shell。因此，要启动 Zsh，必须首先启动一个终端窗口，例如 GNOME Terminal、Konsole、Terminal、iTerm2、rxvt 或你喜欢的其它终端。然后，你可以通过键入以下命令启动 Zsh：

```
$ zsh
```

首次启动 Zsh 时，会要求你选择一些配置选项。这些都可以在以后更改，因此请按 `1` 继续。

```
This is the Z Shell configuration function for new users, zsh-newuser-install.

(q)  Quit and do nothing.

(0)  Exit, creating the file ~/.zshrc

(1)  Continue to the main menu.
```

偏好设置分为四类，因此请从顶部开始。

1. 第一个类使你可以选择在 shell 历史记录文件中保留多少个命令。默认情况下，它设置为 1,000 行。
2. Zsh 补全是其最令人兴奋的功能之一。为了简单起见，请考虑使用其默认选项激活它，直到你习惯了它的工作方式。按 `1` 使用默认选项，按 `2` 手动设置选项。
3. 选择 Emacs 式键绑定或 Vi 式键绑定。Bash 使用 Emacs 式绑定，因此你可能已经习惯了。
4. 最后，你可以了解（以及设置或取消设置）Zsh 的一些精妙的功能。例如，当你提供不带命令的非可执行路径时，可以通过让 Zsh 来改变目录而无需你使用 `cd` 命令。要激活这些额外选项之一，请输入选项号并输入 `s` 进行设置。请尝试打开所有选项以获得完整的 Zsh 体验。你可以稍后通过编辑 `~/.zshrc` 取消设置它们。

要完成配置，请按 `0`。

### 使用 Zsh

刚开始，Zsh 的使用感受就像使用 Bash 一样，这无疑是其众多功能之一。例如，Bash 和 Tcsh 之间就存在严重的差异，因此如果你必须在工作中或在服务器上使用 Bash，而 Zsh 就可以在家里轻松尝试和使用，这样在 Bash 和 Zsh 之间轻松切换就是一种便利。

#### 在 Zsh 中改变目录

正是这些微小的差异使 Zsh 变得好用。首先，尝试在没有 `cd` 命令的情况下，将目录更改为 `Documents` 文件夹。简直太棒了，难以置信。如果你输入的是目录路径而没有进一步的指令，Zsh 会更改为该目录：

```
% Documents
% pwd
/home/seth/Documents
```

而这会在 Bash 或任何其他普通 shell 中导致错误。但是 Zsh 却根本不是普通的 shell，而这仅仅才是开始。

#### 在 Zsh 中搜索

当你想使用普通 shell 程序查找文件时，可以使用 `find` 或 `locate` 命令。最起码，你可以使用 `ls -R` 来递归地列出一组目录。Zsh 内置有允许它在当前目录或任何其他子目录中查找文件的功能。

例如，假设你有两个名为 `foo.txt` 的文件。一个位于你的当前目录中，另一个位于名为 `foo` 的子目录中。在 Bash Shell 中，你可以使用以下命令列出当前目录中的文件：

```
$ ls
foo.txt
```

你可以通过明确指明子目录的路径来列出另一个目录：

```
$ ls foo
foo.txt
```

要同时列出这两者，你必须使用 `-R` 开关，并结合使用 `grep`：

```
$ ls -R | grep foo.txt
foo.txt
foo.txt
```

但是在 Zsh 中，你可以使用 `**` 速记符号：

```
% ls **/foo.txt
foo.txt
foo.txt
```

你可以在任何命令中使用此语法，而不仅限于 `ls`。想象一下在这样的场景中提高的效率：将特定文件类型从一组目录中移动到单个位置、将文本片段串联到一个文件中，或对日志进行抽取。

### 使用 Zsh 的制表符补全

制表符补全是 Bash 和其他一些 Shell 中的高级用户功能，它变得司空见惯，席卷了 Unix 世界。Unix 用户不再需要在输入冗长而乏味的路径时使用通配符（例如输入 `/h*/s*h/V*/SCS/sc*/comp*/t*/a*/*9/04/LS*boat*v`，比输入 `/home/seth/Videos/SCS/scenes/composite/takes/approved/109/04/LS_boat-port-cargo-mover.mkv` 要容易得多）。相反，他们只要输入足够的唯一字符串即可按 `Tab` 键。例如，如果你知道在系统的根目录下只有一个以 `h` 开头的目录，则可以键入 `/h`，然后单击 `Tab`。快速、简单、高效。它还会确认路径存在；如果 `Tab` 无法完成任何操作，则说明你在错误的位置或输入了错误的路径部分。

但是，如果你有许多目录有五个或更多相同的首字母，`Tab` 会坚决拒绝进行补全。尽管在大多数现代终端中，它将（至少会）显示阻止其进行猜测你的意思的文件，但通常需要按两次 `Tab` 键才能显示它们。因此，制表符补全通常会变成来回按下键盘上字母和制表符，以至于你好像在接受钢琴独奏会的训练。

Zsh 通过循环可能的补全来解决这个小问题。如果键入 `*ls ~/D` 并按 `Tab`，则 Zsh 首先使用 `Documents` 来完成命令；如果再次按 `Tab`，它将提供 `Downloads`，依此类推，直到找到所需的选项。

### Zsh 中的通配符

在 Zsh 中，通配符的行为不同于 Bash 中用户所习惯的行为。首先，可以对其进行修改。例如，如果要列出当前目录中的所有文件夹，则可以使用修改后的通配符：

```
% ls
dir0   dir1   dir2   file0   file1
% ls *(/)
dir0   dir1   dir2
```

在此示例中，`(/)` 限定了通配符的结果，因此 Zsh 仅显示目录。要仅列出文件，请使用 `(.)`。要列出符号链接，请使用 `(@)`。要列出可执行文件，请使用 `(*)`。

```
% ls ~/bin/*(*)
fop  exify  tt
```

Zsh 不仅仅知道文件类型。它也可以使用相同的通配符修饰符约定根据修改时间列出。例如，如果要查找在过去八个小时内修改的文件，请使用 `mh` 修饰符（即 “modified hours” 的缩写）和小时的负整数：

```
% ls ~/Documents/*(mh-8)
cal.org   game.org   home.org
```

要查找超过（例如）两天前修改过的文件，修饰符更改为 `md`（即 “modified day” 的缩写），并带上天数的正整数：

```
% ls ~/Documents/*(+2)
holiday.org
```

通配符修饰符和限定符还可以做很多事情，因此，请阅读 [Zsh 手册页][4]，以获取全部详细信息。

#### 通配符的副作用

要像在 Bash 中使用通配符一样使用它，有时必须在 Zsh 中对通配符进行转义。例如，如果要在 Bash 中将某些文件复制到服务器上，则可以使用如下通配符：

```
$ scp IMG_*.JPG seth@example.com:~/www/ph*/*19/09/14
```

这在 Bash 中有效，但是在 Zsh 中会返回错误，因为它在发出 `scp` 命令之前尝试在远程端扩展该变量（通配符）。为避免这种情况，必须转义远程变量（通配符）：

```
% scp IMG_*.JPG seth@example.com:~/www/ph\*/\*19/09/14
```

当你切换到新的 shell 时，这些小异常可能会使你感到沮丧。使用 Zsh 时会遇到的问题不多（体验过 Zsh 后切换回 Bash 的可能遇到更多），但是当它们发生时，请保持镇定且坦率。严格遵守 POSIX 的情况很少会出错，但是如果失败了，请查找问题以解决并继续。对于许多在工作中困在一个 shell 上而在家中困在另一个 shell 上的用户来说，[hyperpolyglot.org][5] 已被证明其是无价的。

在我的下一篇 Zsh 文章中，我将向你展示如何安装主题和插件以定制你的 Z-Shell 甚至 Z-ier。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/getting-started-zsh

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://devblogs.microsoft.com/commandline/category/bash-on-ubuntu-on-windows/
[3]: https://www.cygwin.com/
[4]: https://linux.die.net/man/1/zsh
[5]: http://hyperpolyglot.org/unix-shells
