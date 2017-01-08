在 Linux 终端中自定义 Bash 配色和提示内容
============================================================

现今，（如果不是全部的话）大多数现代 Linux 发行版的默认 shell 都是 Bash。然而，你可能已经注意到这样一个现象，在各个发行版中，其终端配色和 提示内容都各不相同。

如果你一直都在考虑怎样来定制以使它更好用，当然，你也可能只是心血来潮。不管怎样，继续读下去——本文将告诉你怎么做。
### PS1 Bash 环境变量

命令提示符和终端外观是通过一个叫`PS1`的变量来进行管理的。根据 Bash 手册页说明，PS1 表现了 shell 准备好读取命令时显示的基本提示字符串。

PS1 所允许的内容由一些反斜杠转义的特殊字符组成，可以查看手册页中 PRMPTING 章节的内容来了解它们的含义。

为了演示，让我们先来显示以下我们系统中`PS1`的当前内容吧（这或许看上去和你们的有那么点不同）：

```
$ echo $PS1
[\u@\h \W]\$
```

现在，让我们来了解一下怎样自定义 PS1 吧，以满足我们各自的需求。
#### 自定义 PS1 格式

根据手册页 PROMPTING 章节的描述，下面对各个特殊字符的含义作如下说明：
1.  `\u:` 显示当前用户的用户名。
2.  `\h:` 完全合格域名中第一个点（.）之前的主机名。
3.  `\W:` 当前工作目录的基本名，对于 $HOME 通常简化使用波浪符号表示（~）。
$$
4.  `\$:` 如果当前用户是 root，显示为 #，否则为 $。

例如，如果我们想要显示当前命令的历史数量，可以考虑添加`\!`；如果我们想要显示 FQDN 而不是短服务器名，那么可以考虑添加`\H`。

在下面的例子中，我们将同时将这两个特殊字符引入我们当前的环境中，命令如下：

```
PS1="[\u@\H \W \!]\$"
```

当你按下 Enter 键时，你将会看到提示内容会变成下面这样。你可以通过下面的命令来对比修改前和修改后的提示内容：
[
 ![Customize Linux Terminal Prompt PS1](http://www.tecmint.com/wp-content/uploads/2017/01/Customize-Linux-Terminal-Prompt.png) 
][1]

自定义 Linux 终端提示符 PS1

现在，让我们再深入一点，修改命令提示符中的用户名和主机名——同时修改文本和环境背景。

实际上，我们可以对提示符进行 3 个方面的自定义：

| 文本格式 | 前景色（文本） | 背景色 |
| 0: 常规文本 | 30: 黑色 | 40: 黑色|
| 1: 加粗 | 31: 红色 | 41: 红色 |
| 4: 下划线文本 | 32: 绿色 | 42: 绿色 |
|  | 33: 黄色 | 43: 黄色 |
|  | 34: 蓝色 | 44: 蓝色 |
|  | 35: 紫色 | 45: 紫色 |
|  | 36: 青色 | 46: 青色 |
|  | 37: 白色 | 47: 白色 |

我们将在开头使用`\e`特殊字符以及在结尾使用`m`来后面跟着的是颜色序列。

在该序列中，三个值（背景，格式和前景）由逗号分隔（如果不赋值，则假定为默认值）。
**建议阅读：** [在 Linux 中学习 Bash shell 脚本][2]

此外，由于值的范围不同，指定（背景，格式，或者前景）的先后顺序没有关系。
For example, the following `PS1` will cause the prompt to appear in yellow underlined text with red background:
例如，下面的`PS1`将导致提示符出现黄色带下划线，并且背景为红色的文本：

```
PS1="\e[41;4;33m[\u@\h \W]$ "
```
[
 ![Change Linux Terminal Color Prompt PS1](http://www.tecmint.com/wp-content/uploads/2017/01/Change-Linux-Terminal-Color-Prompt.png) 
][3]

修改 Linux 终端提示符配色 PS1

虽然它看起来那么好，但是这个自定义将只会持续到当前用户会话结束。如果你关闭终端，或者退出本次会话，所有修改都会丢失。

为了让修改永久生效，你必须将下面这行添加到`~/.bashrc`或者`~/.bash_profile`，这取决于你的版本。

```
PS1="\e[41;4;33m[\u@\h \W]$ "
```

尽情去玩耍吧，你可以尝试任何色彩，直到找出最适合你的。
##### 小结

在本文中，我们讲述了如何来自定义 Bash 提示符的配色和提示内容。如果你对本文还有什么问题或者建议，请在下面评论框中写下来吧。我们期待你们的声音。

--------------------------------------------------------------------------------

作者简介：Aaron Kili 是一位 Linux 及 F.O.S.S 的狂热爱好者，一位未来的 Linux 系统管理员，web 开发者，而当前是 TechMint 的内容创建者，他热爱计算机工作，并且信奉知识分享。

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

--------------------------------------------------------------------------------

via: http://www.tecmint.com/customize-bash-colors-terminal-prompt-linux/

作者：[Aaron Kili][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/wp-content/uploads/2017/01/Customize-Linux-Terminal-Prompt.png
[2]:http://www.tecmint.com/category/bash-shell/
[3]:http://www.tecmint.com/wp-content/uploads/2017/01/Change-Linux-Terminal-Color-Prompt.png
