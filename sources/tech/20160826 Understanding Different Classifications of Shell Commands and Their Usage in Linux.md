
理解 Linux 下不同分类的 Shell 命令及它们的用法
====

当你打算真正操纵好你的 Linux 系统，没有什么更接近命令行界面。为了成为一个 Linux 高手，你必须能够理解【不同种类的 Shell 命令】【１】并且会在终端下正确的使用它们。

在 Linux 下，有一些不同种类的命令，对于一个 Linux 新手来说，知道不同命令的意思才能够高效和准确的使用它们。因此，在这篇文章里，我们将会分享 Linux 下不同分类的 Shell 命令。

需要注意一件非常重要的事：命令行界面和 Shell 是不同的，它只是为你提供一个访问 Shell 的方式。Shell 是可编程的，这使得它可以通过命令与内核进行交流。

下面列出了 Linux 下不同种类的命令：

### 1. 程序可执行文件（文件系统命令）

当你执行一条命令的时候，Linux 通过从左到右搜索存储在 $PATH 环境变量中的目录来找到这条命令的可执行文件。

你可以像下面这样查看存储在 $PATH 中的目录
```
$ echo $PATH
/home/aaronkilik/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
```

在上面的命令中，目录 /home/aaronkilik/bin 将会被首先搜索，紧跟着是 /usr/local/sbin，然后一直接着下去。在搜索进程中，搜索顺序是至关重要的。
比如在 /usr/bin 目录中的文件系统命令：

```
$ ll /bin/
```

样本输出

```
total 16284
drwxr-xr-x  2 root root    4096 Jul 31 16:30 ./
drwxr-xr-x 23 root root    4096 Jul 31 16:29 ../
-rwxr-xr-x  1 root root    6456 Apr 14 18:53 archdetect*
-rwxr-xr-x  1 root root 1037440 May 17 16:15 bash*
-rwxr-xr-x  1 root root  520992 Jan 20  2016 btrfs*
-rwxr-xr-x  1 root root  249464 Jan 20  2016 btrfs-calc-size*
lrwxrwxrwx  1 root root       5 Jul 31 16:19 btrfsck -> btrfs*
-rwxr-xr-x  1 root root  278376 Jan 20  2016 btrfs-convert*
-rwxr-xr-x  1 root root  249464 Jan 20  2016 btrfs-debug-tree*
-rwxr-xr-x  1 root root  245368 Jan 20  2016 btrfs-find-root*
-rwxr-xr-x  1 root root  270136 Jan 20  2016 btrfs-image*
-rwxr-xr-x  1 root root  249464 Jan 20  2016 btrfs-map-logical*
-rwxr-xr-x  1 root root  245368 Jan 20  2016 btrfs-select-super*
-rwxr-xr-x  1 root root  253816 Jan 20  2016 btrfs-show-super*
-rwxr-xr-x  1 root root  249464 Jan 20  2016 btrfstune*
-rwxr-xr-x  1 root root  245368 Jan 20  2016 btrfs-zero-log*
-rwxr-xr-x  1 root root   31288 May 20  2015 bunzip2*
-rwxr-xr-x  1 root root 1964536 Aug 19  2015 busybox*
-rwxr-xr-x  1 root root   31288 May 20  2015 bzcat*
lrwxrwxrwx  1 root root       6 Jul 31 16:19 bzcmp -> bzdiff*
-rwxr-xr-x  1 root root    2140 May 20  2015 bzdiff*
lrwxrwxrwx  1 root root       6 Jul 31 16:19 bzegrep -> bzgrep*
-rwxr-xr-x  1 root root    4877 May 20  2015 bzexe*
lrwxrwxrwx  1 root root       6 Jul 31 16:19 bzfgrep -> bzgrep*
-rwxr-xr-x  1 root root    3642 May 20  2015 bzgrep*
```

### 2. Linux 的别名


这些是用户定义的命令，它们是通过内置命令的别名壳创建的，其中包含其他一些选择和参数的 shell 命令。这个想法就是基本上使用新颖、简短的名字来命名冗长的命令。

创建一个别名的语法像下面这样：

```
$ alias newcommand='command -options'
```

通过下面的命令，可以列举系统中的所有别名：

```
$ alias -p
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
```

要在 Linux 中创建一个新的别名，仔细阅读下面的例子。

```
$ alias update='sudo apt update'
$ alias upgrade='sudo apt dist-upgrade'
$ alias -p | grep 'up'
```

![](http://www.tecmint.com/wp-content/uploads/2016/08/Create-Aliase-in-Linux.png)

然而，上面这些我们创建的别名只能暂时的工作，当经过下一次引导，系统重启以后它们不再工作。你可以像下面展示的这样在 '.bashrc' 文件中设置永久别名。

![](http://www.tecmint.com/wp-content/uploads/2016/08/Set-Linux-Aliases-Permanent.png)

添加以后，运行下面的命令来激活。

```
$ source ~/.bashrc
```

### 3. Linus Shell 保留字


在 shell 程序设计中，if，then，fi，for，while，case，esac，else，until 以及其他更多的字都是 shell 保留字。正如描述所暗示的，它们在 shell 中有特殊的含义。

你可以通过使用下面展示的类型命令来列出所有的 shell 关键字：

```
$ type if then fi for while case esac else until
if is a shell keyword
then is a shell keyword
fi is a shell keyword
for is a shell keyword
while is a shell keyword
case is a shell keyword
esac is a shell keyword
else is a shell keyword
until is a shell keyword
```

推荐阅读：10 个有用的 Linux 链接操作实例

### 4. Linux shell 函数

一个 shell 函数是一组在当前 shell 内一起执行的命令。函数有利于在 shell 脚本中实现特殊任务。在 shell 脚本中写 shell 函数的传统形式是下面这样：

```
function_name() {
command1
command2
…….
}
```

或者像这样：

```
function function_name {
command1
command2
…….
}
```


让我们看一看如何在名为 shell_functions.sh 的脚本中写 shell 函数。

```
#!/bin/bash 
#write a shell function to update and upgrade installed packages 
upgrade_system(){
sudo apt update;
sudo apt dist-upgrade;
}
#execute function
upgrade_system
```

并不是通过命令行执行两条命令：sudo apt update 和 sudo apt dist-upgrade，实际上我们已经写好了一个 shell 函数来像执行一条单一命令一样来执行两条命令，从而在一个脚本内升级系统。

保存文件，然后使脚本可执行。最后像下面这样运行 shell 函数：

```
$ chmod +x shell_functions.sh
$ ./shell_functions.sh
```

![](http://www.tecmint.com/wp-content/uploads/2016/08/Linux-Shell-Functions-Script.png)

### 5. Linux Shell 内置命令

这些是在 shell 中内置的 Linux 命令，所以你无法在文件系统中找到它们。这些命令包括 pwd，cd，bg，alias，history，type，source，read，exit 等。

你可以通过下面展示的类型命令来列出或检查 Linux 内置命令：

```
$ type pwd
pwd is a shell builtin
$ type cd
cd is a shell builtin
$ type bg
bg is a shell builtin
$ type alias
alias is a shell builtin
$ type history
history is a shell builtin
```

学习一些 Linux 内置命令用法：

- [15 ‘pwd’ Command Examples in Linux][2]
- [15 ‘cd’ Command Examples in Linux][3]
- [Learn The Power of Linux ‘history’ Command][4]

### 结论

作为一个 Linux 用户，知道你所运行的命令类型是很重要的。我相信，通过上面明确、简单并且易于理解的解释，包括一些相关的说明，你可能对【不同种类的 Linux 命令】有了很好的理解。

你也可以在下面的评论区提任何问题或补充意见，从而和我们取得联系。

--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/pfsense-setup-basic-configuration/

作者：[Aaron Kili ][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/different-types-of-linux-shells/
[2]: http://www.tecmint.com/pwd-command-examples/
[3]: http://www.tecmint.com/cd-command-in-linux/
[4]: http://www.tecmint.com/history-command-examples/
[5]: http://www.tecmint.com/category/linux-commands/
