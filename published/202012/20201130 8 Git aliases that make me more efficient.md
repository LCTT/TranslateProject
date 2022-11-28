[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12904-1.html)
[#]: subject: (8 Git aliases that make me more efficient)
[#]: via: (https://opensource.com/article/20/11/git-aliases)
[#]: author: (Ricardo Gerardi https://opensource.com/users/rgerardi)

8 个让我更有效率的 Git 别名
======

> 使用别名为你最常用或复杂的 Git 命令创建快捷方式。

![](https://img.linux.net.cn/data/attachment/album/202012/09/202245q50ss5kncqc241sf.jpg)

这篇出色的文章《[改变我使用 Git 工作方式的七个技巧][2]》启发了我写下另一个对我在命令行上使用 Git 的经验有重大影响的 Git 特性：别名。

定义 Git 的别名来替代命令有两大好处。

  * 它简化了有许多选项的长命令，使它们更短，更容易记住。
  * 缩短了经常使用的命令，使你的工作更有效率。

### 如何定义和使用别名

要定义 Git 的别名，请使用 `git config` 命令，加上别名和要替换的命令。例如，要为 `git push` 创建别名 `p`：

```
$ git config --global alias.p 'push'
```

你可以通过将别名作为 `git` 的参数来使用别名，就像其他命令一样：

```
$ git p
```

要查看所有的别名，用 `git config` 列出你的配置：

```
$ git config --global -l
user.name=ricardo
user.email=ricardo@example.com
alias.p=push
```

你也可以用你喜欢的 shell 来定义别名，比如 Bash 或 Zsh。不过，用 Git 定义别名有几个功能是用 shell 无法实现的。首先，它允许你在不同的 shell 中使用别名，而无需额外配置。此外，它还集成了 Git 的自动更正功能，所以当你输入错误的命令时，Git 可以建议你正确的别名。最后，Git 还会将别名保存在用户配置文件中，你可以通过复制一个文件将别名转移到其他机器上。

无论使用哪种方法，定义别名都能改善你使用 Git 的整体体验。更多关于定义 Git 别名的信息，请看《[Git Book][4]》。

### 8 个有用的 Git 别名

现在你知道如何创建和使用别名了，来看看一些有用的别名。

#### 1、Git 状态

Git 命令行用户经常使用 `status` 命令来查看已更改或未跟踪的文件。默认情况下，这个命令提供了很多行的冗长输出，你可能不想要或不需要。你可以使用一个别名来处理这两个组件。定义别名 `st` 来缩短命令，并使用选项 `-sb` 来输出一个不那么啰嗦的状态和分支信息。

```
$ git config --global alias.st 'status -sb'
```

如果你在一个干净的分支上使用这个别名，你的输出就像这样：

```
$  git st
## master
```

在一个带有已更改和未跟踪文件的分支上使用它，会产生这样的输出：

```
$ git st
## master
 M test2
?? test3
```

#### 2、Git 单行日志

创建一个别名，以单行方式显示你的提交，使输出更紧凑：

```
$ git config --global alias.ll 'log --oneline'
```

使用这个别名可以提供所有提交的简短列表：

```
$ git ll
33559c5 (HEAD -> master) Another commit
17646c1 test1
```

#### 3、Git 的最近一次提交

这将显示你最近一次提交的详细信息。这是扩展了《Git Book》中 [别名][4] 一章的例子：

```
$ git config --global alias.last 'log -1 HEAD --stat'
```

用它来查看最后的提交：

```
$ git last
commit f3dddcbaabb928f84f45131ea5be88dcf0692783 (HEAD -> branch1)
Author: ricardo <ricardo@example.com>
Date:   Tue Nov 3 00:19:52 2020 +0000

    Commit to branch1

 test2 | 1 +
 test3 | 0
 2 files changed, 1 insertion(+)
```

#### 4、Git 提交

当你对 Git 仓库进行修改时，你会经常使用 `git commit`。使用 `cm` 别名使 `git commit -m` 命令更有效率：

```
$ git config --global alias.cm 'commit -m'
```

因为 Git 别名扩展了命令，所以你可以在执行过程中提供额外的参数：

```
$ git cm "A nice commit message"
[branch1 0baa729] A nice commit message
 1 file changed, 2 insertions(+)
```

#### 5、Git 远程仓库

`git remote -v` 命令列出了所有配置的远程仓库。用别名 `rv` 将其缩短：

```
$ git config --global alias.rv 'remote -v'
```

#### 6、Git 差异

`git diff` 命令可以显示不同提交的文件之间的差异，或者提交和工作树之间的差异。用 `d` 别名来简化它：

```
$ git config --global alias.d 'diff'
```

标准的 `git diff` 命令对小的改动很好用，但对于比较复杂的改动，外部工具如 `vimdiff` 就更有用。创建别名 `dv` 来使用 `vimdiff` 显示差异，并使用 `y` 参数跳过确认提示：

```
$ git config --global alias.dv 'difftool -t vimdiff -y'
```

使用这个别名来显示两个提交之间的 `file1` 差异：

```
$ git dv 33559c5 ca1494d file1
```

![vim-diff results][5]

#### 7、Git 配置列表

`gl` 别名可以更方便地列出所有用户配置：

```
$ git config --global alias.gl 'config --global -l'
```

现在你可以看到所有定义的别名（和其他配置选项）：

```
$ git gl
user.name=ricardo
user.email=ricardo@example.com
alias.p=push
alias.st=status -sb
alias.ll=log --oneline
alias.last=log -1 HEAD --stat
alias.cm=commit -m
alias.rv=remote -v
alias.d=diff
alias.dv=difftool -t vimdiff -y
alias.gl=config --global -l
alias.se=!git rev-list --all | xargs git grep -F
```

#### 8、搜索提交

Git 别名允许你定义更复杂的别名，比如执行外部 shell 命令，可以在别名前加上 `!` 字符。你可以用它来执行自定义脚本或更复杂的命令，包括 shell 管道。

例如，定义 `se` 别名来搜索你的提交：

```
$ git config --global alias.se '!git rev-list --all | xargs git grep -F'
```

使用这个别名来搜索提交中的特定字符串：

```
$ git se test2
0baa729c1d683201d0500b0e2f9c408df8f9a366:file1:test2
ca1494dd06633f08519ec43b57e25c30b1c78b32:file1:test2
```

### 自动更正你的别名

使用 Git 别名的一个很酷的好处是它与自动更正功能的原生集成。如果你犯了错误，默认情况下，Git 会建议使用与你输入的命令相似的命令，包括别名。例如，如果你把 `status` 打成了 `ts`，而不是 `st`，Git 会推荐正确的别名：

```
$ git ts
git: 'ts' is not a git command. See 'git --help'.

The most similar command is
        st
```

如果你启用了自动更正功能，Git 会自动执行正确的命令：

```
$ git config --global help.autocorrect 20
$ git ts
WARNING: You called a Git command named 'ts', which does not exist.
Continuing in 2.0 seconds, assuming that you meant 'st'.
## branch1
?? test4
```

### 优化 Git 命令

Git 别名是一个很有用的功能，它可以优化常见的重复性命令的执行，从而提高你的效率。Git 允许你定义任意数量的别名，有些用户会定义很多别名。我更喜欢只为最常用的命令定义别名 —— 定义太多别名会让人难以记忆，而且可能需要查找才能使用。

更多关于别名的内容，包括其他有用的内容，请参见 [Git 维基的别名页面][7]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/git-aliases

作者：[Ricardo Gerardi][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rgerardi
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://linux.cn/article-12894-1.html
[3]: mailto:ricardo@example.com
[4]: https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases
[5]: https://opensource.com/sites/default/files/uploads/vimdiff.png (vim-diff results)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://git.wiki.kernel.org/index.php/Aliases
