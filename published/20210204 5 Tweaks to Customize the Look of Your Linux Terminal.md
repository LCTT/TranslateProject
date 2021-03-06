[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13181-1.html)
[#]: subject: (5 Tweaks to Customize the Look of Your Linux Terminal)
[#]: via: (https://itsfoss.com/customize-linux-terminal/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

定制你的 Linux 终端外观的 5 项调整
======

![](https://img.linux.net.cn/data/attachment/album/202103/06/232911eg4g65gp4g2ww24u.jpg)

终端仿真器（或简称终端）是任何 Linux 发行版中不可或缺的一部分。

当你改变发行版的主题时，往往终端也会自动得到改造。但这并不意味着你不能进一步定制终端。

事实上，很多读者都问过我们，为什么我们截图或视频中的终端看起来那么酷，我们用的是什么字体等等。

为了回答这个经常被问到的问题，我将向你展示一些简单或复杂的调整来改变终端的外观。你可以在下图中对比一下视觉上的差异：

![][1]

### 自定义 Linux 终端

本教程利用 Pop!_OS 上的 GNOME 终端来定制和调整终端的外观。但是，大多数建议也应该适用于其他终端。

对于大多数元素，如颜色、透明度和字体，你可以利用 GUI 来调整它，而不需要输入任何特殊的命令。

打开你的终端。在右上角寻找汉堡菜单。在这里，点击 “偏好设置”，如下图所示：

![][2]

在这里你可以找到改变终端外观的所有设置。

#### 技巧 0：使用独立的终端配置文件进行定制

我建议你建立一个新的配置文件用于你的定制。为什么要这样做？因为这样一来，你的改变就不会影响到终端的主配置文件。假设你做了一些奇怪的改变，却想不起默认值？配置文件有助于分离你的定制。

如你所见，我有个单独的配置文件，用于截图和制作视频。

![终端配置文件][3]

你可以轻松地更改终端配置文件，并使用新的配置文件打开一个新的终端窗口。

![更改终端配置文件][4]

这就是我想首先提出的建议。现在，让我们看看这些调整。

#### 技巧 1：使用深色/浅色终端主题

你可以改变系统主题，终端主题也会随之改变。除此之外，如果你不想改变系统主题。你也可以切换终端的深色主题或浅色主题，

一旦你进入“偏好设置”，你会注意到在“常规”选项中可以改变主题和其他设置。

![][5]

#### 技巧 2：改变字体和大小

选择你要自定义的配置文件。现在你可以选择自定义文本外观、字体大小、字体样式、间距、光标形状，还可以切换终端铃声。

对于字体，你只能改成你系统上可用的字体。如果你想要不同的字体，请先在你的 Linux 系统上下载并安装字体。

还有一点! 要使用等宽字体，否则字体可能会重叠，文字可能无法清晰阅读。如果你想要一些建议，可以选择 [Share Tech Mono][6]（开源）或 [Larabiefont][7]（不开源）。

在“文本”选项卡下，选择“自定义字体”，然后更改字体及其大小（如果需要）。

![][8]

#### 技巧 3：改变调色板和透明度

除了文字和间距，你还可以进入“颜色”选项，改变终端的文字和背景的颜色。你还可以调整透明度，让它看起来更酷。

正如你所注意到的那样，你可以从一组预先配置的选项中选择调色板，也可以自己调整。

![][9]

如果你想和我一样启用透明，点击“使用透明背景”选项。

如果你想要和你的系统主题类似的颜色设置，你也可以选择使用系统主题的颜色。

![][10]

#### 技巧 4：调整 bash 提示符变量

通常当你启动终端时，无需任何修改你就会看到你的用户名和主机名（你的发行版名称）作为 bash 提示符。

例如，在我的例子中，它会是 “ankushdas@pop-os:~$”。然而，我把 [主机名永久地改成了][11] “itsfoss”，所以现在看起来像这样：

![][12]

要改变主机名，你可以键入：

```
hostname 定制名称
```

然而，这只适用于当前会话。因此，当你重新启动时，它将恢复到默认值。要永久地更改主机名，你需要输入：

```
sudo hostnamectl set-hostname 定制名称
```

同样，你也可以改变你的用户名，但它需要一些额外的配置，包括杀死所有与活动用户名相关联的当前进程，所以我们会跳过用它来改变终端的外观/感觉。

#### 技巧 5：不推荐：改变 bash 提示符的字体和颜色（面向高级用户）

然而，你可以使用命令调整 bash 提示符的字体和颜色。

你需要利用 `PS1` 环境变量来控制提示符的显示内容。你可以在 [手册页][14] 中了解更多关于它的信息。

例如，当你键入：

```
echo $PS1
```

在我这里输出：

```
\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$
```

我们需要关注的是该输出的第一部分：

```
\[\e]0;\u@\h: \w\a\]$
```

在这里，你需要知道以下几点：

  * `\e` 是一个特殊的字符，表示一个颜色序列的开始。
  * `\u` 表示用户名，后面可以跟着 `@` 符号。
  * `\h` 表示系统的主机名。
  * `\w` 表示基本目录。
  * `\a` 表示活动目录。
  * `$` 表示非 root 用户。

在你的情况下输出可能不一样，但变量是一样的，所以你需要根据你的输出来试验下面提到的命令。

在你这样做之前，请记住这些：

  * 文本格式代码：`0` 代表正常文本，`1` 代表粗体，`3` 代表斜体，`4` 代表下划线文本。
  * 背景色的颜色范围：`40` - `47`。
  * 文本颜色的颜色范围：`30` - `37`。

你只需要键入以下内容来改变颜色和字体：

```
PS1="\e[41;3;32m[\u@\h:\w\a\$]"
```

这是输入该命令后 bash 提示符的样子：

![][15]

如果你注意到这个命令，就像上面提到的，`\e` 可以帮助我们分配一个颜色序列。

在上面的命令中，我先分配了一个**背景色**，然后是**文字样式**，接着是**字体颜色**，然后是 `m`。这里，`m` 表示颜色序列的结束。

所以，你要做的就是，调整这部分：

```
41;3;32
```

命令其余部分应该是不变的，你只需要分配不同的数字来改变背景色、文字样式和文字颜色。

要注意的是，这并没有特定的顺序，你可以先指定文字样式，再指定背景色，最后指定文字颜色，如 `3;41;32`，这里的命令就变成了：

```
PS1="\e[3;41;32m[\u@\h:\w\a\$]"
```

![][16]

正如你所注意到的，无论顺序如何，颜色的定制都是一样的。所以，只要记住自定义的代码，并在你确定你想把它作为一个永久的变化之前，试试它。

上面我提到的命令会临时定制当前会话的 bash 提示符。如果你关闭了会话，你将失去这个自定义设置。

所以，要想把它变成一个永久的改变，你需要把它添加到 `.bashrc` 文件中（这是一个配置文件，每次加载会话时都会加载）。

![][17]

简单键入如下命令来访问该文件：

```
nano ~/.bashrc
```

除非你明确知道你在做什么，否则不要改变任何东西。而且，为了可以恢复设置，你应该把 `PS1` 环境变量的备份（默认情况下复制粘贴其中的内容）保存到一个文本文件中。

所以，即使你需要默认的字体和颜色，你也可以再次编辑 `.bashrc` 文件并粘贴 `PS1` 环境变量。

#### 附赠技巧：根据你的墙纸改变终端的调色板

如果你想改变终端的背景和文字颜色，但又不知道该选哪种颜色，你可以使用一个基于 Python 的工具 Pywal，它可以 [根据你的壁纸][18] 或你提供的图片自动改变终端的颜色。

![][19]

如果你有兴趣使用这个工具，我之前已经详细[介绍][18]过了。

### 总结

当然，使用 GUI 定制很容易，同时也可以更好地控制你可以改变的东西。但是，需要知道命令也是必要的，万一你开始 [使用 WSL][21] 或者使用 SSH 访问远程服务器，无论如何都可以定制你的体验。

你是如何定制 Linux 终端的？在评论中与我们分享你的秘方。

--------------------------------------------------------------------------------

via: https://itsfoss.com/customize-linux-terminal/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/default-terminal.jpg?resize=773%2C493&ssl=1
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/linux-terminal-preferences.jpg?resize=800%2C350&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/terminal-profiles.jpg?resize=800%2C619&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/change-terminal-profile.jpg?resize=796%2C347&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/terminal-theme.jpg?resize=800%2C363&ssl=1
[6]: https://fonts.google.com/specimen/Share+Tech+Mono
[7]: https://www.dafont.com/larabie-font.font
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/terminal-customization-1.jpg?resize=800%2C500&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/terminal-color-customization.jpg?resize=759%2C607&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/linux-terminal.jpg?resize=800%2C571&ssl=1
[11]: https://itsfoss.com/change-hostname-ubuntu/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/itsfoss-hostname.jpg?resize=800%2C188&ssl=1
[13]: https://itsfoss.com/cdn-cgi/l/email-protection
[14]: https://linux.die.net/man/1/bash
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/terminal-bash-prompt-customization.jpg?resize=800%2C190&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/linux-terminal-customization-1s.jpg?resize=800%2C158&ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/bashrch-customization-terminal.png?resize=800%2C615&ssl=1
[18]: https://itsfoss.com/pywal/
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/wallpy-2.jpg?resize=800%2C442&ssl=1
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/pywal-linux.jpg?fit=800%2C450&ssl=1
[21]: https://itsfoss.com/install-bash-on-windows/
