[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12978-1.html)
[#]: subject: (How to use heredoc as a text editor)
[#]: via: (https://opensource.com/article/20/12/heredoc)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何使用 heredoc 作为一个文本编辑器
======

> 这个不起眼的终端功能在紧要关头提供一个文本编辑器。

![](https://img.linux.net.cn/data/attachment/album/202101/03/094710uucu3150at905t15.jpg)

在 Linux 和 Unix 的 shell 中有一个不为人知的功能，它能让你用 [cat][2] 命令打开一个 do-while 循环。它被称为 heredoc，无论你使用什么 shell，它都能让你或多或少地拥有一个文本编辑器。它的语法是：

```
$ cat << EOF >> example.txt
```

中间的字符串（`EOF`），本质上是一个停止循环的条件。也就是说，如果你在一行中单独输入它，循环就会结束。在循环过程中，无论你在终端中输入什么，都会被管道传送到目标文件中（在本例中）。

### 安装

只要你有一个终端，你就能够启动 heredoc。我在 [Bash][3]、[tsh][4] 和 Korn shell 中使用过这个语法技巧。

### 使用 heredoc

要打开一个 heredoc “会话”，你可以使用带重定向的 `cat` 命令。首先用终止字符串（常见约定是 `EOF`，代表 “End Of File”，但它实际上可以是任何字符串）指向 `cat` 命令。在终止字符串之后，将输出重定向到一个目标文件。然后，你就可以直接在终端中输入了，可以使用最常见的 shell 键盘快捷键来处理你的工作。当你在一行上输入你指定的终止字符串时，你的会话就结束了。你可以通过唯一的提示符（通常是 `>`）知道你是在一个 heredoc 循环中。

```
$ cat << EOF >> example.txt
> Everything you type here will be placed into example.txt when I type EOF on a line by itself. Until then, you can type...
>
> whatever...
>
> you want to type.
>
> EOF
$  
```

在终端等待 `EOF` 时，你输入的所有内容都会被放入目标文件中，提示符被忽略，`EOF` 本身也不是文件的一部分。

```
Everything you type here will be placed into example.txt when I type EOF on a line by itself. Until then, you can type...

whatever...

you want to type.
```

在现实中，你可能不会用 heredoc 语法来代替一个正常的文本编辑器。它是一个很好的快速处理方式，可以输入多行，但超过 10 行左右就开始限制它的作用了。例如，如果不触发你 shell 的 [history][5] 功能，你就不能编辑以前的行。根据你的 shell 和配置，你可能需要先按向上键，然后按向下键来找回你的文本，然后用 `Ctrl+B` 来后退。 

你的 shell 的大部分功能都能正常工作，但可能没有撤销功能，也没有什么错误恢复功能。

此外，即使是最简安装的系统，可能也至少安装了 [Vi][6] 或 [ed][7]。

然而 heredoc 还是很有用的！它比 `echo` 更灵活，当你在编写 shell 脚本时，它是不可缺少的。例如，想象一下你正在编写一个安装脚本，以便你可以自动安装一组自定义应用。其中一个应用没有生成 `.dekstop` 文件，所以它不会出现在你的应用菜单中。为了解决这个问题，你决定在安装时生成一个 `.desktop` 文件。

与其编写一个 `.desktop` 文件，然后作为安装脚本的外部依赖，不如在安装脚本中使用 heredoc：

```
#!/bin/sh

VERSION=${VERSION:-x.y.z}
PKGNAM=${VERSION:-example}
PKG="${PKGNAM}"-"${VERSION}"-`arch`.tgz

# download package
wget "${PKG}"
tar txvf "${PKG}"

# use here doc to create missing .desktop file
cat << EOF >> $HOME/.local/share/applications/example.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name="${PKGNAM}"
Comment="${PKGNAM}"
Exec="${PKGNAM}" %F
EOF

# insert the rest of an install script...
```

你自动地将文本输入到了一个文件中，而不需要文本编辑器（当然，除了你用来写脚本的那个）。下面是生成的 `.desktop` 文件的样子：

```
[Desktop Entry]
Version=1.0
Type=Application
Name=example
Comment=example
Exec=example %F
```

正如你所看到的，你可以在 heredoc 中使用变量，而且它们得到了正确的解析。`EOF` 字符串并没有出现在文件中，它只是标志着 heredoc 的结束。

### 比 echo 更好

heredoc 技术通常被认为比 `echo` 或 [printf][8] 更容易，因为一旦你“进入”了文档，你就可以自由地做任何你想做的事情。从这个意义上说，它是自由的，但与合适的文本编辑器相比，它是有限的。

使用 heredoc 来做快速笔记和 shell 脚本，再也不用为如何动态生成配置文件而烦恼了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/heredoc

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://opensource.com/article/19/2/getting-started-cat-command
[3]: https://opensource.com/article/20/4/bash-sysadmins-ebook
[4]: https://opensource.com/article/20/8/tcsh
[5]: https://opensource.com/article/20/6/bash-history-commands
[6]: https://opensource.com/article/19/3/getting-started-vim
[7]: https://opensource.com/article/20/12/gnu-ed
[8]: https://opensource.com/article/20/8/printf
