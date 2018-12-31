Bash 环境变量的那些事
======
> 初学者可以在此教程中了解环境变量。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/wynand-van-poortvliet-40467-unsplash.jpg?itok=tr6Eb4N0)

bash 变量，尤其是讨厌的*环境变量*，已经是一个老生常谈的话题了。我们也更应该对它有一个详细的了解，让它为我们所用。

下面就打开终端，开始吧。

### 环境变量

`HOME` （LCTT 译注：双关语）除了是你脱下帽子惬意休息的地方，同时也是 Linux 中的一个变量，它是当前用户主目录的路径：

```
echo $HOME
```

以上这个命令会显示当前用户的主目录路径，通常都在 `/home/<your username>` 下。

顾名思义，变量的值是可以根据上下文变化的。实际上，Linux 系统中每一个用户的 `HOME` 变量都是不一样的，当然你也可以这样自行更改 `HOME` 变量的值：

```
HOME=/home/<your username>/Documents
```

以上这个命令将会把 `HOME` 变量设置为你的 `Documents` 目录。

其中有三点需要留意：

  1. `=` 符号和其两侧的内容之间不加空格。空格在 shell 中有专门的意义，不能随意地在任何地方添加空格。
  2. 如果你需要对变量进行赋值，只需要使用变量名称就可以了。但如果需要读取或者使用变量的值，需要在变量前面加上一个 `$` 号。
  3. 更改 `HOME` 变量具有一定的风险。有很多程序是依赖于 `HOME` 变量的，更改 `HOME` 变量可能会导致一些不可预见的结果。例如，如果按照上面的方式更改了 `HOME` 变量，然后执行不带有任何参数的 `cd` 命令，在通常情况下，会跳转到用户的主目录下，但在这个时候，会跳转到 `HOME` 变量指定的目录下。

上面第 3 点中环境变量的更改并不是持久有效的，在终端关闭后重新打开终端，又或者是新建一个终端，执行 `echo $HOME` 命令输出的仍然会是初始的值，而不是重新自定义的值。

在讨论如何持久地更改一个环境变量之前，我们先来看一下另一个比较重要的环境变量。

### PATH 变量

在 `PATH` 变量中存放了一系列目录，而且是放置了可执行程序的目录。正是由于 `PATH` 变量的存在，让你不需要知道应用程序具体安装到了什么目录，而 shell 却可以正确地找到这些应用程序。

如果你查看 `PATH` 变量的值，大概会是以下这样：

```
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin
```

每两个目录之间使用冒号 `:` 分隔。如果某个应用程序的所在目录不在 `PATH` 变量中，那么运行的时候就需要声明应用程序的目录让 shell 能够找到。

```
/home/<user name>/bin/my_program.sh
```

例如以上命令就会执行当前用户 `bin/` 目录下的 `my_program.sh` 文件。

有一个常见的问题：如果你不希望弄乱系统的 `bin/` 目录，同时也不希望你自己的文件被其它人运行，还不想每次运行的时候都要输入完整的路径，那么，你可以在你的主目录中创建一个独立的 `bin/` 目录：

```
mkdir $HOME/bin
```

然后将这个目录添加到 `PATH` 变量中：

```
PATH=$PATH:$HOME/bin
```

然后 `/home/<user name>/bin/` 目录就会出现在 `PATH` 变量中了。但正如之前所说，这个变更只会在当前的 shell 生效，当前的 shell 一旦关闭，环境变量的值就又恢复原状了。

如果要让变更对当前用户持续生效，就不能在 shell 中直接执行对应的变更，而是应该将这些变更操作写在每次启动 shell 时都会运行的文件当中。这个文件就是当前用户主目录中的 `.bashrc` 文件。文件名前面的点号表明这是一个隐藏文件，执行普通的 `ls` 命令是不会将这个文件显示出来的，但只要在 `ls` 命令中加入 `-a` 参数就可以看到这个文件了。

你可以使用诸如 [kate][1]、[gedit][2]、[nano][3] 或者 [vim][4] 这些文本编辑器来打开 `.bashrc` 文件（但不要用 LibreOffice Writer，它是一个文字处理软件，跟前面几个文字编辑器完全不同）。打开 `.bashrc` 文件之后，你会看见里面放置了一些 shell 命令，是用于为当前用户设置环境的。

在文件的末尾添加新行并输入以下内容：

```
export PATH=$PATH:$HOME/bin
```

保存并关闭 `.bashrc` 文件，接下来你就会看到 `export` 语句的效果。执行以下的命令让刚才的修改立即生效：

```
source .bashrc
```

刚才执行的 `source` 命令让 `.bashrc` 文件在当前的 shell 立即生效，并且对于之后打开的 shell 都会有效。因此另一个等效的方法是退出并重新进入 shell，但这样也太麻烦了。

现在，你的 shell 就能自动寻找到 `/home/<user name>/bin/` 下的程序了，执行这个目录下的程序也不需要完整地写出程序的路径。

### 自定义变量

当然，你也可以定义自己的变量。刚才我们看到的变量名称都是全大写的，实际上[变量名称的定义还是比较灵活的][5]。

定义新变量的过程非常直观，直接对它赋值就可以了：

```
new_variable="Hello"
```

然后可以用以下的方式读取到已定义变量的值：

```
echo $new_variable
```

程序的正常工作离不开各种变量，例如要将某个选项设置为打开，又或者让程序找到所需的代码库，都需要使用变量。在 bash 中运行程序的时候会生成一个子 shell，这个子 shell 和执行原程序的父 shell 并不是完全一样的，只是继承了父 shell 的部分内容，而且默认是不继承父 shell 中的变量的。因为变量默认情况下是局部变量，出于安全原因，一个 shell 中的局部变量不会被另一个 shell 读取到，即使是子 shell 也不可以。

下面举一个例子。首先定义一个变量：

```
robots="R2D2 & C3PO"
```

然后执行：

```
bash
```

现在是在 bash shell 中创建了一个子 shell。

执行这个命令看看还能不能读取到刚才定义的变量：

```
echo $robots
```

你会发现读取不到。

还是在这个子 shell 中，为 `robots` 变量赋一个不同的值：

```
robots="These aren't the ones you are looking for"
```

再读取一次：

```
$ echo $robots
These aren't the ones you are looking for
```

退出这个子 shell：

```
exit
```

然后再看一下现在 `robots`  变量的值：

```
$ echo $robots
R2D2 & C3P0
```

这一个特性可以有效避免配置过程中产生混乱，同时也会导致一个问题：如果程序中需要设置变量，但却由于子 shell 的原因无法正常访问到这个变量，该如何解决呢？这个时候就需要用到 `export` 了。

重复一次刚才的过程，但这一次不是通过 `robots="R2D2 & C3PO"` 方式来设置变量，而是使用 `export` 命令：

```
export robots="R2D2 & C3PO"
```

现在你会发现，在进入子 shell 之后，`robots` 变量的值仍然是最初赋予的值。

要注意的是，尽管子 shell 会继承通过 `export` 导出的变量，但如果在子 shell 中对这个变量重新赋值，是不会影响到父 shell 中对应变量的。

如果要查看所有通过 `export` 导出的变量，可以执行以下命令：

```
export -p
```

自定义的变量会显示在这个列表的末尾。这个列表中还有一些常见的变量：例如 `USER` 的值是当前用户的用户名，`PWD` 的值是当前用户当前所在的目录，而 `OLDPWD` 的值则是当前用户上一个访问过的目录。因此如果执行：

```
cd -
```

就会切换到上一个访问过的目录，那是因为 `cd` 命令读取到了 `OLDPWD` 变量的值。

你也可以使用 `env` 命令查看所有环境变量。

如果要取消导出一个变量，可以加上 `-n` 参数：

```
export -n robots
```

### 接下来

了解过环境变量的知识之后，你已经到达了可能对自己和他人造成危险的水平，接下来就需要了解如何通过使用别名来让环境变得更安全、更友好以保护自己了。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/12/bash-variables-environmental-and-otherwise

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.kde.org/applications/utilities/kate/
[2]: https://help.gnome.org/users/gedit/stable/
[3]: https://www.nano-editor.org/
[4]: https://www.vim.org/
[5]: https://bash.cyberciti.biz/guide/Rules_for_Naming_variable_name

