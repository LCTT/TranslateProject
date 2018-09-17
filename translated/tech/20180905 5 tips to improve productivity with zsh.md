5 tips to improve productivity with zsh
======

用 zsh 提高生产力的5个 tips
======

### **[完成翻译] by tnuoccalanosrep** 

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/features_solutions_command_data.png?itok=4_VQN3RK)

The Z shell known as [zsh][1] is a [shell][2] for Linux/Unix-like operating systems. It has similarities to other shells in the `sh` (Bourne shell) family, such as as `bash` and `ksh`, but it provides many advanced features and powerful command line editing options, such as enhanced Tab completion.

Z shell (亦称 zsh) 是 *unx 系统中的命令解析器 。 它跟 `sh` (Bourne shell) 家族的其他解析器 ( 如 `bash` 和 `ksh` ) 有着相似的特点，但它还提供了大量的高级特性以及强大的命令行编辑功能（选项？），如增强版tab补全。

It would be impossible to cover all the options of zsh here; there are literally hundreds of pages [documenting][3] its many features. In this article, I'll present five tips to make you more productive using the command line with zsh.

由于 zsh 有好几百页的文档去描述他的特性，所以我无法在这里阐明 zsh 的所有功能。在本文，我会列出5个 tips，让你通过使用 zsh 来提高你的生产力。

### 1\. Themes and plugins

### 1\. 主题和插件

Through the years, the open source community has developed countless themes and plugins for zsh. A theme is a predefined prompt configuration, while a plugin is a set of useful aliases and functions that make it easier to use a specific command or programming language.

多年来，开源社区已经为 zsh 开发了数不清的主题和插件。主题是预定义提示符的配置，而插件则是一组常用的别名命令和功能，让你更方便的使用一种特定的命令或者编程语言。

The quickest way to get started using themes and plugins is to use a zsh configuration framework. There are many available, but the most popular is [Oh My Zsh][4]. By default, it enables some sensible zsh configuration options and it comes loaded with hundreds of themes and plugins.

如果你现在想开始用 zsh 的主题和插件，那么使用 zsh 的配置框架 (configuiration framework) 是你最快的入门方式。在众多的配置框架中，最受欢迎的则是 [Oh My Zsh][4]。在默认配置中，他就已经为 zsh 启用了一些合理的配置，同时它也自带多个主题和插件。

A theme makes you more productive as it adds useful information to your prompt, such as the status of your Git repository or Python virtualenv in use. Having this information at a glance saves you from typing the equivalent commands to obtain it, and it's a cool look. Here's an example of [Powerlevel9k][5], my theme of choice:

由于主题会在你的命令行提示符之前添加一些常用的信息，比如你 Git 仓库的状态，或者是当前使用的 Python 虚拟环境，所以它会让你的工作更高效。只需要看到这些信息，你就不用再敲命令去重新获取它们，而且这些提示也相当酷炫。
下图就是我（作者）选用的主题 [Powerlevel9k][5] 

![zsh Powerlevel9K theme][7]

The Powerlevel9k theme for zsh

zsh 主题 Powerlevel9k

In addition to themes, Oh My Zsh bundles tons of useful plugins for zsh. For example, enabling the Git plugin gives you access to a number of useful aliases, such as:

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

There are plugins available for many programming languages, packaging systems, and other tools you commonly use on the command line. Here's a list of plugins I use in my Fedora workstation:

zsh 还有许多插件是用于多种编程语言，打包系统和一些平时在命令行中常用的工具。
以下是我 Ferdora 工作站中用到的插件表：

```
git golang fedora docker oc sudo vi-mode virtualenvwrapper
```

### 2\. Clever aliases
### 2\. 智能的命令别名
Aliases are very useful in zsh. Defining aliases for your most-used commands saves you a lot of typing. Oh My Zsh configures several useful aliases by default, including aliases to navigate directories and replacements for common commands with additional options such as:

命令别名在 zsh 中十分常用。为你常用的命令定义别名可以节省你的打字时间。Oh My Zsh 默认配置了一些常用的命令别名，包括目录导航命令别名，为常用的命令添加额外的选项，比如：
```
ls='ls --color=tty'
grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
```

In addition to command aliases, zsh enables two additional useful alias types: the suffix alias and the global alias.

除了命令别名意外， zsh 还自带两种额外常用的别名类型：后缀别名和全局别名。

A suffix alias allows you to open the file you type in the command line using the specified program based on the file extension. For example, to open YAML files using vim, define the following alias:

后缀别名可以让你在基于文件后缀的前提下，在命令行中利用指定程序打开这个文件。比如，要用 vim 打开 YAML 文件，可以定义以下命令行别名：

```
alias -s {yml,yaml}=vim
```

Now if you type any file name ending with `yml` or `yaml` in the command line, zsh opens that file using vim:

现在，如果你在命令行中输入任何后缀名为 `yml` 或 `yaml` 文件， zsh 都会用 vim 打开这个文件

```
$ playbook.yml
# Opens file playbook.yml using vim
```

A global alias enables you to create an alias that is expanded anywhere in the command line, not just at the beginning. This is very useful to replace common filenames or piped commands. For example:

全局别名可以让你在使用命令行的任何时刻创建命令别名，而不仅仅是在开始的时候。这个在你想替换常用文件名或者管道命令的时候就显得非常有用了。比如

```
alias -g G='| grep -i'
```

To use this alias, type `G` anywhere you would type the piped command:

要使用这个别名，只要你在想用管道命令的时候输入 `G` 就好了：
```
$ ls -l G do
drwxr-xr-x.  5 rgerardi rgerardi 4096 Aug  7 14:08 Documents
drwxr-xr-x.  6 rgerardi rgerardi 4096 Aug 24 14:51 Downloads
```

Next, let's see how zsh helps to navigate the filesystem.

接着，我们就来看看 zsh 是如何导航文件系统的。

### 3\. Easy directory navigation
### 3\. 便捷的目录导航

When you're using the command line, navigating across different directories is one of the most common tasks. Zsh makes this easier by providing some useful directory navigation features. These features are enabled with Oh My Zsh, but you can enable them by using this command:

当你使用命令行的时候， 在不同的目录之间切换访问是最常见的工作。 zsh 提供了一些十分有用的目录导航功能来简化这个操作。这些功能已经集成到 Oh My Zsh 中了， 而你可以用以下命令来启用它

```
setopt  autocd autopushd \ pushdignoredups
```

With these options set, you don't need to type `cd` to change directories. Just type the directory name, and zsh switches to it:

使用了上面的配置后，你就不用输入 `cd` 来切换目录了，只需要输入目录名称，zsh 就会自动切换到这个目录中：

```
$ pwd
/home/rgerardi
$ /tmp
$ pwd
/tmp
```

To move back, type `-`:

如果想要回退，只要输入 `-`:

Zsh keeps the history of directories you visited so you can quickly switch to any of them. To see the list, type `dirs -v`:

Zsh 会记录你访问过的目录，这样下次你就可以快速切换到这些目录中。如果想要看这个目录列表，只要输入 `dirs -v`：

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

Switch to any directory in this list by typing `~#` where # is the number of the directory in the list. For example:

如果想要切换到这个列表中的其中一个目录，只需输入 `~#` （`#` 代表目录在列表中的序号）就可以了。比如

```
$ pwd
/home/rgerardi
$ ~4
$ pwd
/usr/local
```

Combine these with aliases to make it even easier to navigate:

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

Now you can type `d` to see the first ten items in the list and the number to switch to it:

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

Finally, zsh automatically expands directory names with Tab completion. Type the first letters of the directory names and `TAB` to use it:

最后，你可以在 zsh 中利用 Tab 来自动补全目录名称。你可以先输入目录的首字母，然后用 `TAB` 来补全它们：

```
$ pwd
/home/rgerardi
$ p/o/z (TAB)
$ Projects/Opensource.com/zsh-5tips/
```

This is just one of the features enabled by zsh's powerful Tab completion system. Let's look at some more.

以上仅仅是 zsh 强大的 Tab 补全系统中的一个功能。接来下我们来探索它更多的功能。

### 4\. Advanced Tab completion
### 4\. 先进的 Tab 补全

Zsh's powerful completion system is one of its hallmarks. For simplification, I call it Tab completion, but under the hood, more than one thing is happening. There's usually expansion and command completion. I'll discuss them together here. For details, check this [User's Guide][8].

Zsh 强大的补全系统是它其中一个卖点。为了简便起见，我称它为 Tab 补全，然而在系统底层，它不仅仅只做一件事。这里通常包括扩展以及命令的补全，我会在这里同时讨论它们。如果想了解更多，详见 [用户手册][8] ( [User's Guide][8] )。

Command completion is enabled by default with Oh My Zsh. To enable it, add the following lines to your `.zshrc` file:

在 Oh My Zsh 中，命令补全是默认可用的。要启用它，你只要在 `.zshrc` 文件中添加以下命令：
```
autoload -U compinit
compinit
```

Zsh's completion system is smart. It tries to suggest only items that can be used in certain contexts—for example, if you type `cd` and `TAB`, zsh suggests only directory names as it knows `cd` does not work with anything else.

Zsh 的补全系统非常智能。他会根据当前上下文来进行命令的提示——比如，你输入了 `cd` 和 `TAB`，zsh 只会为你提示目录名，因为它知道
当前的 `cd` 没有任何作用。

Conversely, it suggests usernames when running user-related commands or hostnames when using `ssh` or `ping`, for example.

反之，如果你使用 `ssh` 或者 `ping` 这类与用户或者主机相关的命令， zsh 便会提示用户名。

It has a vast completion library and understands many different commands. For example, if you're using the `tar` command, you can press Tab to see a list of files available in the package as candidates for extraction:

`zsh` 拥有一个巨大而又完整的库，因此它能识别许多不同的命令。比如，如果你使用 `tar` 命令， 你可以按 Tab 键，他会为你展示一个可以用于解压的文件列表:

```
$ tar -xzvf test1.tar.gz test1/file1 (TAB)
file1 file2
```

Here's a more advanced example, using `git`. In this example, when typing `TAB`, zsh automatically completes the name of the only file in the repository that can be staged:

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

It also understands command line options and suggests only the ones that are relevant to the subcommand selected:

zsh 还能识别命令行选项，同时他只会提示与选中子命令相关的命令列表：
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

After typing `TAB`, you can use the arrow keys to navigate the options list and select the one you need. Now you don't need to memorize all those Git options.

在按 `TAB` 键之后，你可以使用方向键来选择你想用的命令。现在你就不用记住所有的 Git 命令项了。

There are many options available. The best way to find what is most helpful to you is by using it.

zsh 还有很多有用的功能。当你用它的时候，你就知道哪些对你才是最有用的。

### 5\. Command line editing and history
### 5\. 命令行编辑与历史记录

Zsh's command line editing capabilities are also useful. By default, it emulates emacs. If, like me, you prefer vi/vim, enable vi bindings with the following command:

Zsh 的命令行编辑功能也十分有效。默认条件下，他是模拟 emacs 编辑器的。如果你是跟我一样更喜欢用 vi/vim，你可以用以下命令启用 vi 编辑。

```
$ bindkey -v
```

If you're using Oh My Zsh, the `vi-mode` plugin enables additional bindings and a mode indicator on your prompt—very useful.

如果你使用 Oh My Zsh，`vi-mode` 插件可以启用额外的绑定，同时会在你的命令提示符上增加 vi 的模式提示--这个非常有用。

After enabling vi bindings, you can edit the command line using vi commands. For example, press `ESC+/` to search the command line history. While searching, pressing `n` brings the next matching line, and `N` the previous one. Most common vi commands work after pressing `ESC` such as `0` to jump to the start of the line, `$` to jump to the end, `i` to insert, `a` to append, etc. Even commands followed by motion work, such as `cw` to change a word.

当启用 vi 的绑定后，你可以再命令行中使用 vi 命令进行编辑。比如，输入 `ESC+/` 来查找命令行记录。在查找的时候，输入 `n` 来找下一个匹配行，输入 `N` 来找上一个。输入 `ESC` 后，最常用的 vi 命令有以下几个，如输入 `0` 跳转到第一行，输入 `$` 跳转到最后一行，输入 `i` 来插入文本，输入 `a` 来追加文本等等，一些直接操作的命令也同样有效，比如输入 `cw` 来修改单词。

In addition to command line editing, zsh provides several useful command line history features if you want to fix or re-execute previous used commands. For example, if you made a mistake, typing `fc` brings the last command in your favorite editor to fix it. It respects the `$EDITOR` variable and by default uses vi.

除了命令行编辑，如果你想修改或重新执行之前使用过的命令，zsh 还提供几个常用的命令行历史功能。比如，你打错了一个命令，输入 `fc`，你可以在你偏好的编辑器中修复最后一条命令。使用哪个编辑是参照 `$EDITOR` 变量的，而默认是使用 vi。 

Another useful command is `r`, which re-executes the last command; and `r <WORD>`, which executes the last command that contains the string `WORD`.

另外一个有用的命令是 `r`， 他会重新执行上一条命令；而 `r <WORD>` 则会执行上一条包含 `WORD` 的命令。

Finally, typing double bangs (`!!`) brings back the last command anywhere in the line. This is useful, for instance, if you forgot to type `sudo` to execute commands that require elevated privileges:

最后，输入两个感叹号( `!!` )，可以在命令行中回溯最后一条命令。这个十分有用，比如，当你忘记使用 `sudo` 去执行需要权限的命令时：

```
$ less /var/log/dnf.log
/var/log/dnf.log: Permission denied
$ sudo !!
$ sudo less /var/log/dnf.log
```

These features make it easier to find and re-use previously typed commands.

这个功能让查找并且重新执行之前命令的操作更加方便。

### Where to go from here?
### 何去何从？

These are just a few of the zsh features that can make you more productive; there are many more. For additional information, consult the following resources:

这里仅仅介绍了几个可以让你提高生产率的 zsh 特性；其实还有更多功能带你发掘；想知道更多的信息，你可以访问以下的资源

[An Introduction to the Z Shell][9]

[A User's Guide to ZSH][10]

[Archlinux Wiki][11]

[zsh-lovers][12]

Do you have any zsh productivity tips to share? I would love to hear about them in the comments below.

你有使用 zsh 提高生产力的tips可以分享吗？我（作者）很乐意在下方评论看到它们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/tips-productivity-zsh

作者：[Ricardo Gerardi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[tnuoccalanosrep](https://github.com/tnuoccalanosrep)
校对：[校对者ID](https://github.com/校对者ID)

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
