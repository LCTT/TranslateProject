在 Linux 上自定义 bash 命令提示符
======
![](https://www.ostechnix.com/wp-content/uploads/2017/10/BASH-720x340.jpg)

众所周知，**bash**（the **B**ourne-**A**gain **Sh**ell）是目前绝大多数 Linux 发行版使用的默认 shell。本文将会介绍如何通过添加颜色和样式来自定义 bash 命令提示符的显示。尽管很多插件或工具都可以很轻易地满足这一需求，但我们也可以不使用插件和工具，自己手动自定义一些基本的显示方式，例如添加或者修改某些元素、更改前景色、更改背景色等等。

### 在 Linux 中自定义 bash 命令提示符

在 bash 中，我们可以通过更改 `$PS1` 环境变量的值来自定义 bash 命令提示符。

一般情况下，bash 命令提示符会是以下这样的形式：
![](https://www.ostechnix.com/wp-content/uploads/2017/10/Linux-Terminal.png)

在上图这种默认显示形式当中，sk 是我的用户名，而 ubuntuserver 是我的主机名。

只要插入一些以反斜杠开头的特殊转义字符串，就可以按照你的喜好修改命令提示符了。下面我来举几个例子。

在开始之前，我强烈建议你预先备份 `~/.bashrc` 文件。

```
$ cp ~/.bashrc ~/.bashrc.bak
```

#### 更改 bash 命令提示符中的 username@hostname 部分

如上所示，bash 命令提示符一般都带有 username@hostname 部分，这个部分是可以修改的。

只需要编辑 `~/.bashrc` 文件：

```
$ vi ~/.bashrc
```

在文件的最后添加一行：

```
PS1="ostechnix> "
```

将上面的“ostechnix”替换为任意一个你想使用的单词，然后按 `ESC` 并输入 `:wq` 保存、退出文件。

执行以下命令使刚才的修改生效：

```
$ source ~/.bashrc
```

你就可以看见 bash 命令提示符中出现刚才添加的“ostechnix”了。

![][3]

再来看看另一个例子，比如将 username@hostname 替换为 Hello@welcome>。

同样是像刚才那样修改 `~/.bashrc` 文件，然后执行 `source ~/.bashrc` 让修改结果立即生效。

以下是我在 Ubuntu 18.04 LTS 上修改后的效果。
![](https://www.ostechnix.com/wp-content/uploads/2017/10/bash-prompt-1.png)

#### 仅显示用户名

如果需要仅显示用户名，只需要在 `~/.bashrc` 文件中加入以下这一行。

```
export PS1="\u "
```

这里的 `\u` 就是一个转义字符串。

下面提供了一些可以添加到 `$PS1` 环境变量中的用以改变 bash 命令提示符样式的转义字符串。每次修改之后，都需要执行 `source ~/.bashrc` 命令才能立即生效。

**显示用户名和主机名：**

```
export PS1="\u\h "
```

命令提示符会这样显示：

```
skubuntuserver
```

**显示用户名和<ruby>完全限定域名<rt>Fully Qualified Domain Name</rt></ruby>（FQDN）**

```
export PS1="\u\H "
```

**在用户名和主机名之间显示其它字符**

如果你还需要在用户名和主机名之间显示其它字符（例如 `@`），可以使用以下格式：

```
export PS1="\u@\h "
```

命令提示符会这样显示：
```
sk@ubuntuserver
```

**显示用户名、主机名，并在末尾添加符号**
```
export PS1="\u@\h\\$ "
```

**综合以上两种显示方式**
```
export PS1="\u@\h> "
```

命令提示符最终会这样显示：
```
sk@ubuntuserver>
```

相似地，还可以添加其它特殊字符，例如冒号、分号、星号、下划线、空格等等。

**显示用户名、主机名、shell 名称**
```
export PS1="\u@\h>\s "
```

**显示用户名、主机名、shell 名称以及 shell 版本**
```
export PS1="\u@\h>\s\v "
```

bash 命令提示符显示样式：

![][4]

**显示用户名、主机名、当前目录**

```
export PS1="\u@\h\w "
```

如果当前目录是 `$HOME` ，会以一个波浪线（`~`）显示。

**在 bash 命令提示符中显示日期**

除了用户名和主机名，如果还想在 bash 命令提示符中显示日期，可以在 `~/.bashrc` 文件中添加以下内容：
```
export PS1="\u@\h>\d "
```
![][5]

**在 bash 命令提示符中显示日期及 12 小时制时间**
```
export PS1="\u@\h>\d\@ "
```

**显示日期及 hh:mm:ss 格式时间**
```
export PS1="\u@\h>\d\T "
```

**显示日期及 24 小时制时间**
```
export PS1="\u@\h>\d\A "
```

**显示日期及 24 小时制 hh:mm:ss 格式时间**
```
export PS1="\u@\h>\d\t "
```

以上是一些常见的可以改变 bash 命令提示符的转义字符串。除此以外的其它转义字符串，可以在 bash 的 man 手册 PROMPTING 章节中查阅。

你也可以随时执行以下命令查看当前的命令提示符样式。

```
$ echo $PS1
```

#### 在 bash 命令提示符中去掉 username@hostname 部分

如果我不想做任何调整，直接把 username@hostname 部分整个去掉可以吗？答案是肯定的。

如果你是一个技术方面的博主，你有可能会需要在网站或者博客中上传自己的 Linux 终端截图。或许你的用户名和主机名太拉风、太另类，不想让别人看到，在这种情况下，你就需要隐藏命令提示符中的 username@hostname 部分。

如果你不想暴露自己的用户名和主机名，只需要按照以下步骤操作。

编辑 `~/.bashrc` 文件：

```
$ vi ~/.bashrc
```

在文件末尾添加这一行：

```
PS1="\W> "
```

输入 `:wq` 保存并关闭文件。

执行以下命令让修改立即生效。

```
$ source ~/.bashrc
```

现在看一下你的终端，username@hostname 部分已经消失了，只保留了一个 `~>` 标记。

![][6]

如果你想要尽可能简单的操作，又不想弄乱你的 `~/.bashrc` 文件，最好的办法就是在系统中创建另一个用户（例如 user@example、admin@demo）。用带有这样的命令提示符的用户去截图或者录屏，就不需要顾虑自己的用户名或主机名被别人看见了。

**警告：**在某些情况下，这种做法并不推荐。例如像 zsh 这种 shell 会继承当前 shell 的设置，这个时候可能会出现一些意想不到的问题。这个技巧只用于隐藏命令提示符中的 username@hostname 部分，仅此而已，如果把这个技巧挪作他用，也可能会出现异常。

### 为 bash 命令提示符着色

目前我们也只是变更了 bash 命令提示符中的内容，下面介绍一下如何对命令提示符进行着色。

通过向 `~/.bashrc` 文件写入一些配置，可以修改 bash 命令提示符的前景色（也就是文本的颜色）和背景色。

例如，下面这一行配置可以令某些文本的颜色变成红色：
```
export PS1="\u@\[\e[31m\]\h\[\e[m\] "
```

添加配置后，执行 `source ~/.bashrc` 立即生效。

你的 bash 命令提示符就会变成这样：
![][7]

类似地，可以用这样的配置来改变背景色：
```
export PS1="\u@\[\e[31;46m\]\h\[\e[m\] "
```

![][8]

###  添加 emoji

大家都喜欢 emoji。还可以按照以下配置把 emoji 插入到命令提示符中。

```
PS1="\W 🔥 >"
```

需要注意的是，emoji 的显示取决于使用的字体，因此某些终端可能会无法正常显示 emoji，取而代之的是一些乱码或者单色表情符号。

### 自定义 bash 命令提示符有点难，有更简单的方法吗？

如果你是一个新手，编辑 `$PS1` 环境变量的过程可能会有些困难，因为命令提示符中的大量转义字符串可能会让你有点晕头转向。但不要担心，有一个在线的 bash `$PS1` 生成器可以帮助你轻松生成各种 `$PS1` 环境变量值。

就是这个网站：

[![EzPrompt](https://www.ostechnix.com/wp-content/uploads/2017/10/EzPrompt.png)][9]

只需要直接选择你想要的 bash 命令提示符样式，添加颜色、设计排序，然后就完成了。你可以预览输出，并将配置代码复制粘贴到 `~/.bashrc` 文件中。就这么简单。顺便一提，本文中大部分的示例都是通过这个网站制作的。


### 我把我的 `~/.bashrc` 文件弄乱了，该如何恢复？

正如我在上面提到的，强烈建议在更改 `~/.bashrc` 文件前做好备份（在更改其它重要的配置文件之前也一定要记得备份）。这样一旦出现任何问题，你都可以很方便地恢复到更改之前的配置状态。当然，如果你忘记了备份，还可以按照下面这篇文章中介绍的方法恢复为默认配置。

[如何将 `~/.bashrc` 文件恢复到默认配置][10]

这篇文章是基于 ubuntu 的，但也适用于其它的 Linux 发行版。不过事先声明，这篇文章的方法会将 `~/.bashrc` 文件恢复到系统最初时的状态，你对这个文件做过的任何修改都将丢失。

感谢阅读！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/hide-modify-usernamelocalhost-part-terminal/

作者：[SK][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/cdn-cgi/l/email-protection
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: http://www.ostechnix.com/wp-content/uploads/2017/10/Linux-Terminal-2.png
[4]: http://www.ostechnix.com/wp-content/uploads/2017/10/bash-prompt-2.png
[5]: http://www.ostechnix.com/wp-content/uploads/2017/10/bash-prompt-3.png
[6]: http://www.ostechnix.com/wp-content/uploads/2017/10/Linux-Terminal-1.png
[7]: http://www.ostechnix.com/hide-modify-usernamelocalhost-part-terminal/bash-prompt-4/
[8]: http://www.ostechnix.com/hide-modify-usernamelocalhost-part-terminal/bash-prompt-5/
[9]: http://ezprompt.net/
[10]: https://www.ostechnix.com/restore-bashrc-file-default-settings-ubuntu/

