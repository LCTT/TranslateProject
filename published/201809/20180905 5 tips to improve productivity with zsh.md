用 zsh 提高生产力的 5 个技巧
======
> zsh 提供了数之不尽的功能和特性，这里有五个可以让你在命令行暴增效率的方法。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/features_solutions_command_data.png?itok=4_VQN3RK)

Z shell（[zsh][1]）是 Linux 和类 Unix 系统中的一个[命令解析器][2]。 它跟 sh (Bourne shell) 家族的其它解析器（如 bash 和 ksh）有着相似的特点，但它还提供了大量的高级特性以及强大的命令行编辑功能，如增强版 Tab 补全。

在这里不可能涉及到 zsh 的所有功能，[描述][3]它的特性需要好几百页。在本文中，我会列出 5 个技巧，让你通过在命令行使用 zsh 来提高你的生产力。

### 1、主题和插件

多年来，开源社区已经为 zsh 开发了数不清的主题和插件。主题是一个预定义提示符的配置，而插件则是一组常用的别名命令和函数，可以让你更方便的使用一种特定的命令或者编程语言。

如果你现在想开始用 zsh 的主题和插件，那么使用一种 zsh 的配置框架是你最快的入门方式。在众多的配置框架中，最受欢迎的则是 [Oh My Zsh][4]。在默认配置中，它就已经为 zsh 启用了一些合理的配置，同时它也自带上百个主题和插件。

主题会在你的命令行提示符之前添加一些有用的信息，比如你 Git 仓库的状态，或者是当前使用的 Python 虚拟环境，所以它会让你的工作更高效。只需要看到这些信息，你就不用再敲命令去重新获取它们，而且这些提示也相当酷炫。下图就是我选用的主题 [Powerlevel9k][5]：

![zsh Powerlevel9K theme][7]

*zsh 主题 Powerlevel9k*

除了主题，Oh my Zsh 还自带了大量常用的 zsh 插件。比如，通过启用 Git 插件，你可以用一组简便的命令别名操作 Git， 比如

```
$ alias | grep -i git | sort -R | head -10
g=git
ga='git add'
gapa='git add --patch'
gap='git apply'
gdt='git diff-tree --no-commit-id --name-only -r'
gau='git add --update'
gstp='git stash pop'
gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
gcs='git commit -S'
glg='git log --stat'
```

zsh 还有许多插件可以用于许多编程语言、打包系统和一些平时在命令行中常用的工具。以下是我 Ferdora 工作站中用到的插件表：

```
git golang fedora docker oc sudo vi-mode virtualenvwrapper
```

### 2、智能的命令别名

命令别名在 zsh 中十分有用。为你常用的命令定义别名可以节省你的打字时间。Oh My Zsh 默认配置了一些常用的命令别名，包括目录导航命令别名，为常用的命令添加额外的选项，比如：

```
ls='ls --color=tty'
grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
```

除了命令别名以外， zsh 还自带两种额外常用的别名类型：后缀别名和全局别名。

后缀别名可以让你基于文件后缀，在命令行中利用指定程序打开这个文件。比如，要用 vim 打开 YAML 文件，可以定义以下命令行别名：

```
alias -s {yml,yaml}=vim
```

现在，如果你在命令行中输入任何后缀名为 `yml` 或 `yaml` 文件， zsh 都会用 vim 打开这个文件。

```
$ playbook.yml
# Opens file playbook.yml using vim
```

全局别名可以让你创建一个可在命令行的任何地方展开的别名，而不仅仅是在命令开始的时候。这个在你想替换常用文件名或者管道命令的时候就显得非常有用了。比如：

```
alias -g G='| grep -i'
```

要使用这个别名，只要你在想用管道命令的时候输入 `G` 就好了：

```
$ ls -l G do
drwxr-xr-x.  5 rgerardi rgerardi 4096 Aug  7 14:08 Documents
drwxr-xr-x.  6 rgerardi rgerardi 4096 Aug 24 14:51 Downloads
```

接着，我们就来看看 zsh 是如何导航文件系统的。

### 3、便捷的目录导航

当你使用命令行的时候，在不同的目录之间切换访问是最常见的工作了。 zsh 提供了一些十分有用的目录导航功能来简化这个操作。这些功能已经集成到 Oh My Zsh 中了， 而你可以用以下命令来启用它

```
setopt  autocd autopushd \ pushdignoredups
```

使用了上面的配置后，你就不用输入 `cd` 来切换目录了，只需要输入目录名称，zsh 就会自动切换到这个目录中：

```
$ pwd
/home/rgerardi
$ /tmp
$ pwd
/tmp
```

如果想要回退，只要输入 `-`:

zsh 会记录你访问过的目录，这样下次你就可以快速切换到这些目录中。如果想要看这个目录列表，只要输入 `dirs -v`：

```
$ dirs -v
0       ~
1       /var/log
2       /var/opt
3       /usr/bin
4       /usr/local
5       /usr/lib
6       /tmp
7       ~/Projects/Opensource.com/zsh-5tips
8       ~/Projects
9       ~/Projects/ansible
10      ~/Documents
```

如果想要切换到这个列表中的其中一个目录，只需输入 `~#` （`#` 代表目录在列表中的序号）就可以了。比如

```
$ pwd
/home/rgerardi
$ ~4
$ pwd
/usr/local
```

你甚至可以用别名组合这些命令，这样切换起来就变得更简单：

```
d='dirs -v | head -10'
1='cd -'
2='cd -2'
3='cd -3'
4='cd -4'
5='cd -5'
6='cd -6'
7='cd -7'
8='cd -8'
9='cd -9'
```

现在你可以通过输入 `d` 来查看这个目录列表的前10个，然后用目录的序号来进行切换：

```
$ d
0       /usr/local
1       ~
2       /var/log
3       /var/opt
4       /usr/bin
5       /usr/lib
6       /tmp
7       ~/Projects/Opensource.com/zsh-5tips
8       ~/Projects
9       ~/Projects/ansible
$ pwd
/usr/local
$ 6
/tmp
$ pwd
/tmp
```

最后，你可以在 zsh 中利用 Tab 来自动补全目录名称。你可以先输入目录的首字母，然后按 `TAB` 键来补全它们：

```
$ pwd
/home/rgerardi
$ p/o/z (TAB)
$ Projects/Opensource.com/zsh-5tips/
```

以上仅仅是 zsh 强大的 Tab 补全系统中的一个功能。接来下我们来探索它更多的功能。

### 4、先进的 Tab 补全

zsh 强大的补全系统是它的卖点之一。为了简便起见，我称它为 Tab 补全，然而在系统底层，它起到了几个作用。这里通常包括展开以及命令补全，我会在这里用讨论它们。如果想了解更多，详见 [用户手册][8]。

在 Oh My Zsh 中，命令补全是默认启用的。要启用它，你只要在 `.zshrc` 文件中添加以下命令：

```
autoload -U compinit
compinit
```

zsh 的补全系统非常智能。它会尝试唯一提示可用在当前上下文环境中的项目 —— 比如，你输入了 `cd` 和 `TAB`，zsh 只会为你提示目录名，因为它知道其它的项目放在 `cd` 后面没用。

反之，如果你使用与用户相关的命令便会提示用户名，而 `ssh` 或者 `ping` 这类则会提示主机名。

zsh 拥有一个巨大而又完整的库，因此它能识别许多不同的命令。比如，如果你使用 `tar` 命令， 你可以按 `TAB` 键，它会为你展示一个可以用于解压的文件列表：

```
$ tar -xzvf test1.tar.gz test1/file1 (TAB)
file1 file2
```

如果使用 `git` 的话，这里有个更高级的示例。在这个示例中，当你按 `TAB` 键， zsh 会自动补全当前库可以操作的文件：

```
$ ls
original  plan.txt  zsh-5tips.md  zsh_theme_small.png
$ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   zsh-5tips.md

no changes added to commit (use "git add" and/or "git commit -a")
$ git add (TAB)
$ git add zsh-5tips.md
```

zsh 还能识别命令行选项，同时它只会提示与选中子命令相关的命令列表：

```
$ git commit - (TAB)
--all                  -a       -- stage all modified and deleted paths
--allow-empty                   -- allow recording an empty commit
--allow-empty-message           -- allow recording a commit with an empty message
--amend                         -- amend the tip of the current branch
--author                        -- override the author name used in the commit
--branch                        -- show branch information
--cleanup                       -- specify how the commit message should be cleaned up
--date                          -- override the author date used in the commit
--dry-run                       -- only show the list of paths that are to be committed or not, and any untracked
--edit                 -e       -- edit the commit message before committing
--file                 -F       -- read commit message from given file
--gpg-sign             -S       -- GPG-sign the commit
--include              -i       -- update the given files and commit the whole index
--interactive                   -- interactively update paths in the index file
--message              -m       -- use the given message as the commit message
... TRUNCATED ...
```

在按 `TAB` 键之后，你可以使用方向键来选择你想用的命令。现在你就不用记住所有的 `git` 命令项了。

zsh 还有很多有用的功能。当你用它的时候，你就知道哪些对你才是最有用的。

### 5、命令行编辑与历史记录

zsh 的命令行编辑功能也十分有用。默认条件下，它是模拟 emacs 编辑器的。如果你是跟我一样更喜欢用 vi/vim，你可以用以下命令启用 vi 的键绑定。

```
$ bindkey -v
```

如果你使用 Oh My Zsh，`vi-mode` 插件可以启用额外的绑定，同时会在你的命令提示符上增加 vi 的模式提示 —— 这个非常有用。

当启用 vi 的绑定后，你可以在命令行中使用 vi 命令进行编辑。比如，输入 `ESC+/` 来查找命令行记录。在查找的时候，输入 `n` 来找下一个匹配行，输入 `N` 来找上一个。输入 `ESC` 后，常用的 vi 命令都可以使用，如输入 `0` 跳转到行首，输入 `$` 跳转到行尾，输入 `i` 来插入文本，输入 `a` 来追加文本等等，即使是跟随的命令也同样有效，比如输入 `cw` 来修改单词。

除了命令行编辑，如果你想修改或重新执行之前使用过的命令，zsh 还提供几个常用的命令行历史功能。比如，你打错了一个命令，输入 `fc`，你可以在你偏好的编辑器中修复最后一条命令。使用哪个编辑是参照 `$EDITOR` 变量的，而默认是使用 vi。 

另外一个有用的命令是 `r`， 它会重新执行上一条命令；而 `r <WORD>` 则会执行上一条包含 `WORD` 的命令。

最后，输入两个感叹号（`!!`），可以在命令行中回溯最后一条命令。这个十分有用，比如，当你忘记使用 `sudo` 去执行需要权限的命令时：

```
$ less /var/log/dnf.log
/var/log/dnf.log: Permission denied
$ sudo !!
$ sudo less /var/log/dnf.log
```

这个功能让查找并且重新执行之前命令的操作更加方便。

### 下一步呢？

这里仅仅介绍了几个可以让你提高生产率的 zsh 特性；其实还有更多功能有待你的发掘；想知道更多的信息，你可以访问以下的资源：

- [An Introduction to the Z Shell][9]
- [A User's Guide to ZSH][10]
- [Archlinux Wiki][11]
- [zsh-lovers][12]

你有使用 zsh 提高生产力的技巧可以分享吗？我很乐意在下方评论中看到它们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/tips-productivity-zsh

作者：[Ricardo Gerardi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[tnuoccalanosrep](https://github.com/tnuoccalanosrep)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rgerardi
[1]: http://www.zsh.org/
[2]: https://en.wikipedia.org/wiki/Shell_(computing)
[3]: http://zsh.sourceforge.net/Doc/Release/zsh_toc.html
[4]: https://ohmyz.sh/
[5]: https://github.com/bhilburn/powerlevel9k
[7]: https://opensource.com/sites/default/files/uploads/zsh_theme_small.png (zsh Powerlevel9K theme)
[8]: http://zsh.sourceforge.net/Guide/zshguide06.html#l144
[9]: http://zsh.sourceforge.net/Intro/intro_toc.html
[10]: http://zsh.sourceforge.net/Guide/
[11]: https://wiki.archlinux.org/index.php/zsh
[12]: https://grml.org/zsh/
