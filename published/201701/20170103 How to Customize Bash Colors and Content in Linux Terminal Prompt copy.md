在 Linux 终端中自定义 Bash 配色和提示内容
============================================================

现今，大多数（如果不是全部的话）现代 Linux 发行版的默认 shell 都是 Bash。然而，你可能已经注意到这样一个现象，在各个发行版中，其终端配色和提示内容都各不相同。

如果你一直都在考虑，或者只是一时好奇，如何定制可以使 Bash 更好用。不管怎样，请继续读下去 —— 本文将告诉你怎么做。

### PS1 Bash 环境变量

命令提示符和终端外观是通过一个叫 `PS1` 的变量来进行管理的。根据 **Bash** 手册页说明，**PS1** 代表了 shell 准备好读取命令时显示的主体的提示字符串。

**PS1** 所允许的内容包括一些反斜杠转义的特殊字符，可以查看手册页中 **PRMPTING** 部分的内容来了解它们的含义。

为了演示，让我们先来显示下我们系统中 `PS1` 的当前内容吧（这或许看上去和你们的有那么点不同）：

```
$ echo $PS1
[\u@\h \W]\$
```

现在，让我们来了解一下怎样自定义 PS1 吧，以满足我们各自的需求。

#### 自定义 PS1 格式

根据手册页 PROMPTING 章节的描述，下面对各个特殊字符的含义作如下说明：

-  `\u:` 显示当前用户的 **用户名**。
-  `\h:` <ruby>完全限定域名 <rt>Fully-Qualified Domain Name</rt></ruby>（FQDN）中第一个点（.）之前的**主机名**。
-  `\W:` 当前工作目录的**基本名**，如果是位于 `$HOME` （家目录）通常使用波浪符号简化表示（`~`）。
-  `\$:` 如果当前用户是 root，显示为 `#`，否则为 `$`。

例如，如果我们想要显示当前命令的历史数量，可以考虑添加 `\!`；如果我们想要显示 FQDN 全称而不是短服务器名，那么可以考虑添加 `\H`。

在下面的例子中，我们同时将这两个特殊字符引入我们当前的环境中，命令如下：

```
PS1="[\u@\H \W \!]\$"
```

当按下回车键后，你将会看到提示内容会变成下面这样。可以对比执行命令修改前和修改后的提示内容：

[
 ![Customize Linux Terminal Prompt PS1](http://www.tecmint.com/wp-content/uploads/2017/01/Customize-Linux-Terminal-Prompt.png) 
][1]

*自定义 Linux 终端提示符 PS1*

现在，让我们再深入一点，修改命令提示符中的用户名和主机名 —— 同时修改文本和环境背景。

实际上，我们可以对提示符进行 3 个方面的自定义：

<table>
        <tr>
            <th>文本格式</th>
            <th>前景色（文本）</th>
            <th>背景色 </th>
            </tr>
        <tr>
            <th>0: 常规文本</th>
            <th>30: 黑色</th>
            <th>40: 黑色</th>
        </tr>
        <tr>
            <th>1: 加粗</th>
            <th>31: 红色</th>
            <th>41: 红色</th>
        </tr>
        <tr>
            <th>4: 下划线文本</th>
            <th> 32: 绿色</th>
            <th>42: 绿色</th>
        </tr>
        <tr>
            <th></th>
            <th>33: 黄色</th>
            <th>43: 黄色</th>
        </tr>
        <tr>
            <th></th>
            <th>34: 蓝色</th>
            <th>44: 蓝色</th>
        </tr>
        <tr>
            <th></th>
            <th>35: 紫色</th>
            <th>45: 紫色</th>
        </tr>
        <tr>
            <th></th>
            <th>36: 青色</th>
            <th>46: 青色</th>
        </tr>
        <tr>
            <th></th>
            <th>37: 白色</th>
            <th>47: 白色</th>
        </tr>
    </table>

我们将在开头使用 `\e` 特殊字符，跟着颜色序列，在结尾使用 `m` 来表示结束。

在该序列中，三个值（**背景**，**格式**和**前景**）由分号分隔（如果不赋值，则假定为默认值）。

**建议阅读：** [在 Linux 中学习 Bash shell 脚本][2]。

此外，由于值的范围不同，指定背景，格式，或者前景的先后顺序没有关系。

例如，下面的 `PS1` 将导致提示符为黄色带下划线文本，并且背景为红色：

```
PS1="\e[41;4;33m[\u@\h \W]$ "
```
[
 ![Change Linux Terminal Color Prompt PS1](http://www.tecmint.com/wp-content/uploads/2017/01/Change-Linux-Terminal-Color-Prompt.png) 
][3]

*修改 Linux 终端提示符配色 PS1*

虽然它看起来那么漂亮，但是这个自定义将只会持续到当前用户会话结束。如果你关闭终端，或者退出本次会话，所有修改都会丢失。

为了让修改永久生效，你必须将下面这行添加到 `~/.bashrc`或者 `~/.bash_profile`，这取决于你的版本。

```
PS1="\e[41;4;33m[\u@\h \W]$ "
```

尽情去玩耍吧，你可以尝试任何色彩，直到找出最适合你的。

##### 小结

在本文中，我们讲述了如何来自定义 Bash 提示符的配色和提示内容。如果你对本文还有什么问题或者建议，请在下面评论框中写下来吧。我们期待你们的声音。

--------------------------------------------------------------------------------

作者简介：Aaron Kili 是一位 Linux 及 F.O.S.S 的狂热爱好者，一位未来的 Linux 系统管理员，web 开发者，而当前是 TechMint 的原创作者，他热爱计算机工作，并且信奉知识分享。

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

--------------------------------------------------------------------------------

via: http://www.tecmint.com/customize-bash-colors-terminal-prompt-linux/

作者：[Aaron Kili][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/wp-content/uploads/2017/01/Customize-Linux-Terminal-Prompt.png
[2]:http://www.tecmint.com/category/bash-shell/
[3]:http://www.tecmint.com/wp-content/uploads/2017/01/Change-Linux-Terminal-Color-Prompt.png
