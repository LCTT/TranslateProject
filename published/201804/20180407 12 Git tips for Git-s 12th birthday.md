13 个 Git 技巧献给 Git 13 岁生日
=====

> 这 13 个 Git 技巧将使你的版本控制技能 +1、+1、+1……

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/party_anniversary_flag_birthday_celebrate.jpg?itok=KqfMENa7)

[Git][1] 是一个分布式版本控制系统，它已经成为开源世界中源代码控制的默认工具，在 4 月 7 日这天，它 13 岁了。使用 Git 令人沮丧的事情之一是你需要知道更多才能有效地使用 Git。但这也可能是使用 Git 比较美妙的一件事，因为没有什么比发现一个新技巧来简化或提高你的工作流的效率更令人快乐了。

为了纪念 Git 的 13 岁生日，这里有 13 条技巧和诀窍来让你的 Git 经验更加有用和强大。从你可能忽略的一些基本知识开始，并扩展到一些真正的高级用户技巧！

### 1、 你的 ~/.gitconfig 文件

当你第一次尝试使用 `git` 命令向仓库提交一个更改时，你可能会收到这样的欢迎信息：

```
*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"

  git config --global user.name "Your Name"

to set your account's default identity.
```

你可能没有意识到正是这些命令在修改 `~/.gitconfig` 的内容，这是 Git 存储全局配置选项的地方。你可以通过 `~/.gitconfig` 文件来做大量的事，包括定义别名、永久性打开（或关闭）特定命令选项，以及修改 Git 工作方式（例如，`git diff` 使用哪个 diff 算法，或者默认使用什么类型的合并策略）。你甚至可以根据仓库的路径有条件地包含其他配置文件！所有细节请参阅 `man git-config`。

### 2、 你仓库中的 .git/config 文件

在之前的技巧中，你可能想知道 `git config` 命令中 `--global` 标志是干什么的。它告诉 Git 更新 `~/.gitconfig` 中的“全局”配置。当然，有全局配置也意味着会有本地配置，显然，如果你省略 `--global` 标志，`git config` 将改为更新仓库特有的配置，该配置存储在 `.git/config` 中。

在 `.git/config` 文件中设置的选项将覆盖 `~/.gitconfig` 文件中的所有设置。因此，例如，如果你需要为特定仓库使用不同的电子邮件地址，则可以运行 `git config user.email "also_you@example.com"`。然后，该仓库中的任何提交都将使用你单独配置的电子邮件地址。如果你在开源项目中工作，而且希望它们显示自己的电子邮件地址，同时仍然使用自己工作邮箱作为主 Git 配置，这非常有用。

几乎任何你可以在 `~/.gitconfig` 中设置的东西，你也可以在 `.git/config` 中进行设置，以使其作用于特定的仓库。在下面的技巧中，当我提到将某些内容添加到 `~/.gitconfig` 时，只需记住你也可以在特定仓库的 `.git/config` 中添加来设置那个选项。

### 3、 别名

别名是你可以在 `~/.gitconfig` 中做的另一件事。它的工作原理就像命令行中的 shell —— 它们设定一个新的命令名称，可以调用一个或多个其他命令，通常使用一组特定的选项或标志。它们对于那些你经常使用的又长又复杂的命令来说非常有效。

你可以使用 `git config` 命令来定义别名 —— 例如，运行 `git config --global --add alias.st status` 将使运行  `git st` 与运行 `git status` 做同样的事情 —— 但是我在定义别名时发现，直接编辑 `~/.gitconfig` 文件通常更容易。

如果你选择使用这种方法，你会发现 `~/.gitconfig` 文件是一个 [INI 文件][2]。INI 是一种带有特定段落的键值对文件格式。当添加一个别名时，你将改变 `[alias]`  段落。例如，定义上面相同的 `git st` 别名时，添加如下到文件：

```
[alias]
st = status
```

（如果已经有 `[alias]` 段落，只需将第二行添加到现有部分。）

### 4、 shell 命令中的别名

别名不仅仅限于运行其他 Git 子命令 —— 你还可以定义运行其他 shell 命令的别名。这是一个用来处理一个反复发生的、罕见和复杂的任务的很好方式：一旦你确定了如何完成它，就可以在别名下保存该命令。例如，我有一些<ruby>复刻<rt>fork</rt></ruby>的开源项目的仓库，并进行了一些本地修改。我想跟上项目正在进行的开发工作，并保存我本地的变化。为了实现这个目标，我需要定期将来自上游仓库的更改合并到我复刻的项目中 —— 我通过使用我称之为 `upstream-merge` 的别名来完成。它是这样定义的：

```
upstream-merge = !"git fetch origin -v && git fetch upstream -v && git merge upstream/master && git push"
```

别名定义开头的 `!` 告诉 Git 通过 shell 运行这个命令。这个例子涉及到运行一些 `git` 命令，但是以这种方式定义的别名可以运行任何 shell 命令。

（注意，如果你想复制我的 `upstream-merge` 别名，你需要确保你有一个名为 `upstream` 的 Git 远程仓库，指向你已经分配的上游仓库，你可以通过运行 `git remote add upstream <URL to repo>` 来添加一个。）

### 5、 可视化提交图

如果你在一个有很多分支活动的项目上开发，有时可能很难掌握所有正在发生的工作以及它们之间的相关性。各种图形用户界面工具可让你获取不同分支的图片并在所谓的“提交图表”中提交。例如，以下是我使用 [GitLab][3] 提交图表查看器可视化的我的一个仓库的一部分：

![GitLab commit graph viewer][5]

如果你是一个专注于命令行的用户或者发现分支切换工具让人分心，那么可以从命令行获得类似的提交视图。这就是 `git log` 命令的 `--graph` 参数出现的地方：

![Repository visualized with --graph command][7]

以下命令可视化相同仓库可达到相同效果：

```
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
```

`--graph` 选项将图添加到日志的左侧，`--abbrev-commit` 缩短提交的 [SHA][8] 值，`--date=relative` 以相对方式表示日期，以及 `--pretty` 来处理所有其他自定义格式。我有个 `git lg` 别名用于这个功能，它是我最常用的 10 个命令之一。

### 6、  更优雅的强制推送

有时，你越是想避开越避不开，你会发现你需要运行 `git push --force` 来覆盖仓库远程副本上的历史记录。你可能得到了一些反馈，需要你进行交互式<ruby>变基<rt>rebase</rt></ruby>，或者你可能已经搞砸了，并希望隐藏“罪证”。

当其他人在仓库的远程副本的同一分支上进行更改时，会发生强制推送的危险。当你强制推送已重写的历史记录时，这些提交将会丢失。这就是 `git push --force-with-lease` 出现的原因 -- 如果远程分支已经更新，它不会允许你强制推送，这确保你不会丢掉别人的工作。

### 7、 git add -N

你是否使用过 `git commit -a` 在一次行动中提交所有未完成的修改，但在你推送完提交后才发现 `git commit -a` 忽略了新添加的文件？你可以使用 `git add -N` (想想 “notify”) 来解决这个问题，告诉 Git 在第一次实际提交它们之前，你希望在提交中包含新增文件。

### 8、 git add -p

使用 Git 时的最佳做法是确保每次提交都只包含一个逻辑修改 —— 无论这是修复错误还是添加新功能。然而，有时当你在工作时，你的仓库中的修改最终应该使用多个提交。你怎样才能设法把事情分开，使每个提交只包含适当的修改呢？`git add --patch` 来拯救你了！

这个标志会让 `git add` 命令查看你工作副本中的所有变化，并为每个变化询问你是否想要将它提交、跳过，或者推迟决定（你可以在运行该命令后选择 `?` 来查看其他更强大的选项）。`git add -p` 是生成结构良好的提交的绝佳工具。

### 9、 git checkout -p

与 `git add -p` 类似，`git checkout` 命令也接受 `--patch` 或 `-p` 选项，这会使其在本地工作副本中显示每个“大块”的改动，并允许丢弃它 —— 简单来说就是将本地工作副本恢复到更改之前的状态。

这真的很棒。例如，当你追踪一个 bug 时引入了一堆调试日志语句，修正了这个 bug 之后，你可以先使用 `git checkout -p` 移除所有新的调试日志，然后 `git add -p` 来添加 bug 修复。没有比组合一个优雅的、结构良好的提交更令人满意！

### 10、 变基时执行命令

有些项目有一个规则，即存储库中的每个提交都必须处于可工作状态 —— 也就是说，在每次提交时，应该可以编译该代码，或者应该运行测试套件而不会失败。 当你在分支上工作时，这并不困难，但是如果你最终因为某种原因需要<ruby>变基<rt>rebase</rt></ruby>时，那么需要逐步完成每个变基的提交以确保你没有意外地引入一个中断，而这个过程是乏味的。

幸运的是，`git rebase` 已经覆盖了 `-x` 或 `--exec` 选项。`git rebase -x <cmd>` 将在每个提交在变基中被应用后运行该命令。因此，举个例子，如果你有一个项目，其中使用 `npm run tests` 运行你的测试套件，`git rebase -x npm run tests` 将在变基期间每次提交之后运行测试套件。这使你可以查看测试套件是否在任何变基的提交中失败，以便你可以确认测试套件在每次提交时仍能通过。

### 11、 基于时间的修订引用

很多 Git 子命令都接受一个修订参数来决定命令作用于仓库的哪个部分，可以是某次特定的提交的 SHA1 值，一个分支的名称，甚至是一个符号性的名称如 `HEAD`（代表当前检出分支最后一次的提交），除了这些简单的形式以外，你还可以附加一个指定的日期或时间作为参数，表示“这个时间的引用”。

这个功能在某些时候会变得十分有用。当你处理最新出现的 bug，自言自语道：“这个功能昨天还是好好的，到底又改了些什么”，不用盯着满屏的 `git log` 的输出试图弄清楚什么时候更改了提交，你只需运行 `git diff HEAD@{yesterday}`，看看从昨天以来的所有修改。这也适用于更长的时间段（例如 `git diff HEAD@{'2 months ago'}`），以及一个确切的日期（例如 `git diff HEAD@{'2010-01-01 12:00:00'}`）。

你也可以将这些基于日期的修订参数与使用修订参数的任何 Git 子命令一起使用。在 `gitrevisions` 手册页中有关于具体使用哪种格式的详细信息。

### 12、 全知的 reflog

你是不是试过在变基时干掉过某次提交，然后发现你需要保留那个提交中一些东西？你可能觉得这些信息已经永远找不回来了，只能重新创建。但是如果你在本地工作副本中提交了，提交就会被添加到引用日志（reflog）中 ，你仍然可以访问到。

运行 `git reflog` 将在本地工作副本中显示当前分支的所有活动的列表，并为你提供每个提交的 SHA1 值。一旦发现你变基时放弃的那个提交，你可以运行 `git checkout <SHA1>` 跳转到该提交，复制任何你需要的信息，然后再运行 `git checkout HEAD` 返回到分支最近的提交去。

### 13、自己清理

哎呦！ 事实证明，我的基本数学技能不如我的 Git 技能。 Git 最初是在 2005 年发布的，这意味着它今年会变成 13 岁，而不是 12 岁（LCTT 译注：本文原来是以 12 岁生日为题的）。为了弥补这个错误，这里有可以让我们变成十三岁的第 13 条技巧。

如果你使用基于分支的工作流，随着在一个长期项目上的工作，除非你在每个分支合并时清理干净，否则你最终会得到一大堆分支。这使得你难于找到想要的分支，分支的森林会让你无从找起。甚至更糟糕的是，如果你有大量活跃的分支，确定一个分支是否被合并（可以被安全删除）或仍然没有被合并而应该留下会非常繁琐。幸运的是，Git 可以帮到你：只需要运行 `git branch --merged` 就可以得到已经被合并到你的当前分支的分支列表，或者 `git branch --no-merged` 找出被合并到其它分支的分支。默认情况下这会列出你本地工作副本的分支，但是如果你在命令行包括 `--remote` 或 `-r` 参数，它也会列出仅存于远程仓库的已合并分支。

重要提示：如果你计划使用 `git branch --merged` 的输出来清理那些已合并的分支，你要小心它的输出也包括了当前分支（毕竟，这个当前的分支就被合并到当前分支！）。确保你在任何销毁动作之前排除了该分支（如果你忘记了，参见第 12 条技巧来学习 reflog 怎样帮你把分支找回来，希望有用……）。

### 以上是全部内容

希望这些技巧中至少有一个能够教给你一些关于 Git 的新东西，Git 是一个有 13 年历史的项目，并且在持续创新和增加新功能中。你最喜欢的 Git 技巧是什么？


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/git-tips

作者：[John SJ Anderson][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/genehack
[1]:https://git-scm.com/
[2]:https://en.wikipedia.org/wiki/INI_file
[3]:https://gitlab.com/
[4]:/file/392941
[5]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/gui_graph.png?itok=3GovYfG1 (GitLab commit graph viewer)
[6]:/file/392936
[7]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/console_graph.png?itok=XogY1P8M (Repository visualized with --graph command)
[8]:https://en.wikipedia.org/wiki/Secure_Hash_Algorithms
