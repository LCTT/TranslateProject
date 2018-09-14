5 tips to improve productivity with zsh
======

用 zsh 提高生产力的5个 tips
======

### **[翻译中] by tnuoccalanosrep** 

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/features_solutions_command_data.png?itok=4_VQN3RK)

The Z shell known as [zsh][1] is a [shell][2] for Linux/Unix-like operating systems. It has similarities to other shells in the `sh` (Bourne shell) family, such as as `bash` and `ksh`, but it provides many advanced features and powerful command line editing options, such as enhanced Tab completion.

Z shell (亦称 zsh) 是 *unx 系统中的命令解析器 。 它跟 `sh` (Bourne shell) 家族的其他解析器 ( 如 `bash` 和 `ksh` ) 有着相似的特点，但它还提供了更多高级的特性以及强大的命令行编辑功能（选项？），如增强版tab补全。

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
```
alias -s {yml,yaml}=vim
```

Now if you type any file name ending with `yml` or `yaml` in the command line, zsh opens that file using vim:
```
$ playbook.yml
# Opens file playbook.yml using vim
```

A global alias enables you to create an alias that is expanded anywhere in the command line, not just at the beginning. This is very useful to replace common filenames or piped commands. For example:
```
alias -g G='| grep -i'
```

To use this alias, type `G` anywhere you would type the piped command:
```
$ ls -l G do
drwxr-xr-x.  5 rgerardi rgerardi 4096 Aug  7 14:08 Documents
drwxr-xr-x.  6 rgerardi rgerardi 4096 Aug 24 14:51 Downloads
```

Next, let's see how zsh helps to navigate the filesystem.

### 3\. Easy directory navigation

When you're using the command line, navigating across different directories is one of the most common tasks. Zsh makes this easier by providing some useful directory navigation features. These features are enabled with Oh My Zsh, but you can enable them by using this command:
```
setopt  autocd autopushd \ pushdignoredups
```

With these options set, you don't need to type `cd` to change directories. Just type the directory name, and zsh switches to it:
```
$ pwd
/home/rgerardi
$ /tmp
$ pwd
/tmp
```

To move back, type `-`:

Zsh keeps the history of directories you visited so you can quickly switch to any of them. To see the list, type `dirs -v`:
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
```
$ pwd
/home/rgerardi
$ ~4
$ pwd
/usr/local
```

Combine these with aliases to make it even easier to navigate:
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
```
$ pwd
/home/rgerardi
$ p/o/z (TAB)
$ Projects/Opensource.com/zsh-5tips/
```

This is just one of the features enabled by zsh's powerful Tab completion system. Let's look at some more.

### 4\. Advanced Tab completion

Zsh's powerful completion system is one of its hallmarks. For simplification, I call it Tab completion, but under the hood, more than one thing is happening. There's usually expansion and command completion. I'll discuss them together here. For details, check this [User's Guide][8].

Command completion is enabled by default with Oh My Zsh. To enable it, add the following lines to your `.zshrc` file:
```
autoload -U compinit
compinit
```

Zsh's completion system is smart. It tries to suggest only items that can be used in certain contexts—for example, if you type `cd` and `TAB`, zsh suggests only directory names as it knows `cd` does not work with anything else.

Conversely, it suggests usernames when running user-related commands or hostnames when using `ssh` or `ping`, for example.

It has a vast completion library and understands many different commands. For example, if you're using the `tar` command, you can press Tab to see a list of files available in the package as candidates for extraction:
```
$ tar -xzvf test1.tar.gz test1/file1 (TAB)
file1 file2
```

Here's a more advanced example, using `git`. In this example, when typing `TAB`, zsh automatically completes the name of the only file in the repository that can be staged:
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

There are many options available. The best way to find what is most helpful to you is by using it.

### 5\. Command line editing and history

Zsh's command line editing capabilities are also useful. By default, it emulates emacs. If, like me, you prefer vi/vim, enable vi bindings with the following command:
```
$ bindkey -v
```

If you're using Oh My Zsh, the `vi-mode` plugin enables additional bindings and a mode indicator on your prompt—very useful.

After enabling vi bindings, you can edit the command line using vi commands. For example, press `ESC+/` to search the command line history. While searching, pressing `n` brings the next matching line, and `N` the previous one. Most common vi commands work after pressing `ESC` such as `0` to jump to the start of the line, `$` to jump to the end, `i` to insert, `a` to append, etc. Even commands followed by motion work, such as `cw` to change a word.

In addition to command line editing, zsh provides several useful command line history features if you want to fix or re-execute previous used commands. For example, if you made a mistake, typing `fc` brings the last command in your favorite editor to fix it. It respects the `$EDITOR` variable and by default uses vi.

Another useful command is `r`, which re-executes the last command; and `r <WORD>`, which executes the last command that contains the string `WORD`.

Finally, typing double bangs (`!!`) brings back the last command anywhere in the line. This is useful, for instance, if you forgot to type `sudo` to execute commands that require elevated privileges:
```
$ less /var/log/dnf.log
/var/log/dnf.log: Permission denied
$ sudo !!
$ sudo less /var/log/dnf.log
```

These features make it easier to find and re-use previously typed commands.

### Where to go from here?

These are just a few of the zsh features that can make you more productive; there are many more. For additional information, consult the following resources:

[An Introduction to the Z Shell][9]

[A User's Guide to ZSH][10]

[Archlinux Wiki][11]

[zsh-lovers][12]

Do you have any zsh productivity tips to share? I would love to hear about them in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/tips-productivity-zsh

作者：[Ricardo Gerardi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
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
