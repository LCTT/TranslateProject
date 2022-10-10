[#]: subject: "5 Git configurations I make on Linux"
[#]: via: "https://opensource.com/article/22/9/git-configuration-linux"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

我在 Linux 中使用的 5 个 Git 配置
======
这份简要指南能够帮助你快速开始使用 Git，以及配置一些选项。

![Linux keys on the keyboard for a desktop computer][1]

在 Linux 中设置 Git 十分简单，但为了获得完美的配置，我做了以下五件事：

1. [创建全局配置][2]
2. [设置默认名称][3]
3. [设置默认邮箱地址][4]
4. [设置默认分支名称][5]
5. [设置默认编辑器][6]

我使用 Git 管理我的代码、命令行脚本以及文档版本。这意味着每次我开始一项新的任务，首先我需要创建一个文件目录并将其添加到 Git 库中：

```
$ mkdir newproject
$ cd newproject
$ git init
```

有一些我一直想要的常规设置。不多，但可以避免我每次都进行配置。我喜欢利用 Git 的 *全局* 配置功能。

Git 提供了进行手动配置的 `git config` 命令，但这有一些注意事项。例如，通常你会设置邮箱地址。你可以通过运行 `git config user.email 你的邮件地址` 命令进行设置。然而，这只会在你当前所在的 Git 目录下起作用。

```
$ git config user.email alan@opensource.com
fatal: not in a git directory
```

此外，当这个命令在 Git 仓库中运行时，它只会配置特定的一个。在新的仓库中，你不得不重复这个步骤。我可以通过全局配置来避免重复。选项 *--global* 会指示 Git 将邮箱地址写入全局配置 `~/.gitconfig` 文件中，甚至在必要时会创建它：

> 请记住，波浪线(~) 代表你的 `home` 文件夹。在我的电脑中它是 `/home/alan`。 

```
$ git config --global user.email alan@opensource.com
$ cat ~/.gitconfig
[user]
        email = alan@opensource.com
```

这里的缺点是，如果你有大量偏好设置，需要输入很多命令，这将花费大量时间并且很容易出错。Git 提供了更加快捷有效的方式，可以直接编辑你的全局配置文件——这是我列表中的第一项！

### 1. 创建全局配置

如果你刚开始使用 Git，或许你还没有该文件。不用担心，让我们直接开始。只需要用 `--edit` 选项：

```
$ git config --global --edit
```

如果没有该文件，Git 将会创建一个包含以下内容的新文件，并使用你终端的默认编辑器打开它：

```
# This is Git's per-user configuration file.
[user]
# Please adapt and uncomment the following lines:
#       name = Alan
#       email = alan@hopper
~
~
~
"~/.gitconfig" 5L, 155B                                     1,1           All
```

现在我们已经打开了编辑器，并且 Git 已经在后台创建了全局配置文件，我们可以继续接下来的设置。

### 2. 设置默认名称

名称是该文件中的首要条目，让我们先从它开始。用命令行设置我的名称是 `git config --global user.name "Alan Formy-Duval"`。只需要在配置文件中编辑 *name* 条目就行，而不是在命令行中运行命令：

```
name = Alan Formy-Duval
```

### 3. 设置默认邮箱地址

邮箱地址是第二个条目，让我们添加它。默认情况下，Git 使用你的系统提供的名称和邮箱地址。如果不正确或者你想要更改，你可以在配置文件中具体说明。事实上，如果你没有配置这些，Git 在你第一次提交时会友好的提示你：

```
Committer: Alan <alan@hopper>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate....
```

在命令行中运行 `git config --global user.email`**["alan@opensource.com"][7]** 会设置好我的邮箱。同样，我们在配置文件中编辑 *email* 条目，提供你的邮箱地址：

```
email = alan@opensource.com
```


我喜欢设置的最后两个设置是默认分支名称和默认编辑器。当你仍在编辑器中时，需要添加这些指令。

### 4. 设置默认分支名称

目前有一种趋势，即不再使用 *master* 作为默认分支名称。事实上，在新存储库初始化时，Git 将通过友好的消息提示更改默认分支名称：

```
$ git init
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint:
hint:   git config --global init.defaultBranch <name>
```

这个名为 *defaultBranch* 的指令需要位于一个名为 *init* 的新部分中。现在普遍接受的是，许多程序员使用 *main* 这个词作为他们的默认分支。这是我喜欢使用的。将此部分后跟指令添加到配置中：

```
[init]
            defaultBranch = main
```

### 5. 设置默认编辑器

第五个设置是，设置默认的编辑器。这是指 Git 将使用的编辑器，用于在你每次将更改提交到存储库时输入你的提交消息。不论是 [nano][8]、[emacs][9]、[vi][10] 还是其他编辑器，每个人都有他喜欢的。我喜欢用 vi。添加 *core* 部分，并设置 *editor* 指令为你喜欢的编辑器。

```
[core]
            editor = vi
```

这是最后一项。退出编辑器。Git 在 *home* 目录下保存全局配置文件。如果你再次运行编辑命令，将会看到所有内容。要知道。配置文件是明文存储的文本文件，因此它可以很容易使用文本工具查看，如 [cat][11] 命令。这是我的配置文件内容：

```
$ cat ~/.gitconfig
[user]
        email = alan@opensource.com
        name = Alan Formy-Duval
[core]
        editor = vi
[init]
        defaultBranch = main
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/git-configuration-linux

作者：[Alan Formy-Duval][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/linux_keyboard_desktop.png
[2]: https://opensource.com/article/22/9/git-configuration-linux#create-global-configuration
[3]: https://opensource.com/article/22/9/git-configuration-linux#set-default-name
[4]: https://opensource.com/article/22/9/git-configuration-linux#set-default-email-address
[5]: https://opensource.com/article/22/9/git-configuration-linux#set-default-branch-name
[6]: https://opensource.com/article/22/9/git-configuration-linux#set-default-editor
[7]: https://opensource.com/mailto:alan@opensource.com
[8]: https://opensource.com/article/20/12/gnu-nano
[9]: https://opensource.com/resources/what-emacs
[10]: https://opensource.com/article/19/3/getting-started-vim
[11]: https://opensource.com/article/19/2/getting-started-cat-command
