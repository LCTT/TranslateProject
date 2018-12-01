举例说明 alias 和 unalias 命令
======

![](https://www.ostechnix.com/wp-content/uploads/2018/11/alias-command-720x340.png)

如果不是一个命令行重度用户的话，过了一段时间之后，你就可能已经忘记了这些复杂且冗长的 Linux 命令了。当然，有很多方法可以让你 [回想起遗忘的命令][1]。你可以简单的 [保存常用的命令][2] 然后按需使用。也可以在终端里 [标记重要的命令][3]，然后在任何时候你想要的时间使用它们。而且，Linux 有一个内建命令 `history` 可以帮助你记忆这些命令。另外一个记住这些如此长的命令的简便方式就是为这些命令创建一个别名。你可以为任何经常重复调用的常用命令创建别名，而不仅仅是长命令。通过这种方法，你不必再过多地记忆这些命令。这篇文章中，我们将会在 Linux 环境下举例说明 `alias` 和 `unalias` 命令。  

### alias 命令

`alias` 使用一个用户自定义的字符串来代替一个或者一串命令（包括多个选项、参数）。这个字符串可以是一个简单的名字或者缩写，不管这个命令原来多么复杂。`alias` 命令已经预装在 shell（包括 BASH、Csh、Ksh 和 Zsh 等） 当中。  

`alias` 的通用语法是：  

```
alias [alias-name[=string]...]
```

接下来看几个例子。   

#### 列出别名

可能在你的系统中已经设置了一些别名。有些应用在你安装它们的时候可能已经自动创建了别名。要查看已经存在的别名，运行：  

```
$ alias
```

或者，  

```
$ alias -p
```

在我的 Arch Linux  系统中已经设置了下面这些别名。  

```
alias betty='/home/sk/betty/main.rb'
alias ls='ls --color=auto'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias update='newsbeuter -r && sudo pacman -Syu'
```

#### 创建一个新的别名

像我之前说的，你不必去记忆这些又臭又长的命令。你甚至不必一遍一遍的运行长命令。只需要为这些命令创建一个简单易懂的别名，然后在任何你想使用的时候运行这些别名就可以了。这种方式会让你爱上命令行。    

```
$ du -h --max-depth=1 | sort -hr
```

这个命令将会查找当前工作目录下的各个子目录占用的磁盘大小，并按照从大到小的顺序进行排序。这个命令有点长。我们可以像下面这样轻易地为其创建一个 别名：  

```
$ alias du='du -h --max-depth=1 | sort -hr'
```

这里的 `du` 就是这条命令的别名。这个别名可以被设置为任何名字，主要便于记忆和区别。  

在创建一个别名的时候，使用单引号或者双引号都是可以的。这两种方法最后的结果没有任何区别。  

现在你可以运行这个别名（例如我们这个例子中的 `du` ）。它和上面的原命令将会产生相同的结果。  

这个别名仅限于当前 shell 会话中。一旦你退出了当前 shell 会话，别名也就失效了。为了让这些别名长久有效，你需要把它们添加到你 shell 的配置文件当中。  

BASH，编辑 `~/.bashrc` 文件：  

```
$ nano ~/.bashrc
```

一行添加一个别名：  

![](https://www.ostechnix.com/wp-content/uploads/2018/11/alias.png)

保存并退出这个文件。然后运行以下命令更新修改：  

```
$ source ~/.bashrc
```

现在，这些别名在所有会话中都可以永久使用了。  

ZSH，你需要添加这些别名到 `~/.zshrc`文件中。Fish，跟上面的类似，添加这些别名到 `~/.config/fish/config.fish` 文件中。  

#### 查看某个特定的命令别名

像我上面提到的，你可以使用 `alias` 命令列出你系统中所有的别名。如果你想查看跟给定的别名有关的命令，例如 `du`，只需要运行：    

```
$ alias du
alias du='du -h --max-depth=1 | sort -hr'
```

像你看到的那样，上面的命令可以显示与单词 `du` 有关的命令。  

关于 `alias` 命令更多的细节，参阅 man 手册页：  

```
$ man alias
```

### unalias 命令

跟它的名字说的一样，`unalias` 命令可以很轻松地从你的系统当中移除别名。`unalias` 命令的通用语法是：  

```
unalias <alias-name>
```

要移除命令的别名，像我们之前创建的 `du`，只需要运行：  

```
$ unalias du
```

`unalias` 命令不仅会从当前会话中移除别名，也会从你的 shell 配置文件中永久地移除别名。  

还有一种移除别名的方法，是创建具有相同名称的新别名。  

要从当前会话中移除所有的别名，使用 `-a` 选项：  

```
$ unalias -a
```

更多细节，参阅 man 手册页。  

```
$ man unalias
```

如果你经常一遍又一遍的运行这些繁杂又冗长的命令，给它们创建别名可以节省你的时间。现在是你为常用命令创建别名的时候了。   

这就是所有的内容了。希望可以帮到你。还有更多的干货即将到来，敬请期待！  

祝近祺！  



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/the-alias-and-unalias-commands-explained-with-examples/

作者：[SK][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/easily-recall-forgotten-linux-commands/
[2]: https://www.ostechnix.com/save-commands-terminal-use-demand/
[3]: https://www.ostechnix.com/bookmark-linux-commands-easier-repeated-invocation/
