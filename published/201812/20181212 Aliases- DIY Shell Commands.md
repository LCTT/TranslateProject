命令别名：定义自己的命令
======
> 学习如何创建别名：你可以将太长或难以记忆的命令打包成你自己构建的命令。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/jodi-mucha-540841-unsplash.jpg?itok=n1d1VDUV)

<ruby>命令别名<rt>Alias</rt></ruby>在 Linux shell 中指的是将一些太长或者太难记的多个命令组合起来，成为一个由用户自己构建的命令。

可以通过 `alias` 命令来创建命令别名。在 `alias` 后面跟上想要创建的别名名称、一个等号（`=`），以及希望使用这个别名来执行的命令，这样一个命令别名就创建好了。举个例子，`ls` 命令在默认情况下是不会对输出的内容进行着色的，这样就不能让用户一眼分辨出目录、文件和连接了。对此，可以创建这样一个命令别名，在输出目录内容的时候为输出内容着色：

```
alias lc='ls --color=auto'
```

其中 `lc` 是自定义的命令别名，代表 “list with color” 的意思。在创建命令别名的时候，需要先确认使用的别名是不是已经有对应的命令了，如果有的话，原本的命令就会被覆盖掉了。注意，定义命令别名的时候，`=` 两端是没有空格的。当运行 `lc` 的时候，就相当于执行了 `ls --color` 命令。

此后，执行 `lc` 列出目录内容的时候，就会输出带有着色的内容了。

你可能会发现你在执行 `ls` 的时候，本来就是输出带有着色的内容。那是因为大部分 Linux 发行版都已经将 `ls` 设定为带有着色的命令别名了。

### 可以直接使用的命令别名

实际上，执行不带任何内容的 `alias` 命令就可以看到当前已经设定的所有命令别名。对于不同的发行版，包含的命令别名不尽相同，但普遍都会有以下这些命令别名：

  * `alias ls='ls --color=auto'`：这个命令别名在前面已经提到过了。`--color=auto` 参数会让 `ls` 命令在通过标准输出在终端中显示内容时进行着色，而其它情况（例如通过管道输出到文件）下则不进行着色。`--color` 这个参数还可以设置为 `always` 或`never`。
  * `alias cp='cp -i'`：`-i` 参数代表“<ruby>交互<rt>interactive</rt></ruby>”。在使用 `cp` 命令复制文件的时候，可能会无意中覆盖现有的文件，在使用了 `-i` 参数之后，`cp` 命令会在一些关键操作前向用户发出询问。
  * `alias free='free -m'`：在 `free` 命令后面加上 `-m` 参数，就可以将输出的内存信息以 MiB 这个更方面阅读和计算的单位输出，而不是默认的 Byte 单位。

你使用的发行版自带的命令别名可能多多少少和上面有些差别。但你都可以在命令前面加上 `\` 修饰符来使用命令的最基本形式（而不是别名）。例如：

```
\free
```

就是直接执行 `free`，而不是 `free -m`。还有：

```
\ls
```

执行的就是不带有`--color=auto` 参数的 `ls`。

如果想要持久地保存命令别名，可以在 `.bashrc` 文件中进行修改，而它[来源于我们的 /etc/skel 目录][1]。

### 使用命令别名纠正错误

各种发行版的设计者都会尽量设置用户可能需要用到的命令别名。但是不同的用户的习惯各不相同，一些用户可能刚从其它操作系统迁移到 Linux，而不同操作系统的基本命令又因 shell 而异。因此，对于刚从 Windows/MS-DOS 系统迁移到 Linux 系统的用户，不妨使用

```
alias dir='ls'
```

这个命令别名来列出目录内容。

类似地，

```
alias copy='cp'
alias move='mv'
```

也可以在尚未完全熟悉 Linux 的时候用得顺手。

还有一种情况，就是在经常出现输入错误的场合中做出容错，例如，对于我来说， Administration 这个单词就很难快速正确地输入，因此很多用户都会设置类似这样的别名：

```
alias sl='ls'
```

以及

```
alias gerp='echo "You did it *again*!"; grep'
```

`grep` 命令最基本的用途就是在文件中查找字符串，在熟悉这个命令之后，它一定是最常用的命令之一，因此输入错误导致不得不重输命令就很令人抓狂。

在上面 `gerp` 的例子中，包含的不只是一条命令，而是两条。第一条命令 `echo "You did it *again*!"` 输出了一条提醒用户拼写错误的消息，然后使用分号（`；`）把两条命令隔开，再往后才是 `grep` 这一条正确的命令。

在我的系统上使用 `gerp` 来搜索 `/etc/skel/.bashrc` 中包含“alias”这个单词的行，就会输出以下内容：

```
$ gerp -R alias /etc/skel/.bashrc
You did it *again*! 
       alias ls='ls --color=auto' 
       alias grep='grep --colour=auto' 
       alias egrep='egrep --colour=auto' 
       alias fgrep='fgrep --colour=auto' 
alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias np='nano -w PKGBUILD' 
alias more=less 
shopt -s expand_aliases
```

在命令别名中以固定的顺序执行多个命令，甚至更进一步，把多个命令串连起来，让后面的命令可以使用到前面的命令的执行结果。这样的做法已经非常接近 bash 脚本了。这篇文章已经接近尾声，我们将在下一篇文章中详细介绍。

如果想要删除在终端中临时设置的别名，可以使用 `unalias` 命令。

```
unalias gerp
```

如果想要持久保存命令别名，可以将命令别名放在用户主目录的 `.bashrc` 文件中，具体的方法在[上一篇文章][2]中已经介绍过。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/12/aliases-diy-shell-commands

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10370-1.html
[2]: https://linux.cn/article-10374-1.html

