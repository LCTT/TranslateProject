在 Linux 命令行下进行时间管理
======

> 学习如何在命令行下用这些方法自己组织待办事项。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_terminals.png?itok=CfBqYBah)

关于如何在命令行下进行<ruby>时间管理<rt>getting things done</rt></ruby>（GTD）有很多讨论。不知有多少文章在讲使用 ls 晦涩的选项、配合 Sed 和 Awk 的一些神奇的正则表达式，以及用 Perl 解析一大堆的文本。但这些都不是问题的重点。

本文章是关于“[如何完成][1]”，在我们不需要图形桌面、网络浏览器或网络连接情况下，用命令行操作能实际完成事务的跟踪。为了达到这一点，我们将介绍四种跟踪待办事项的方式：纯文件文件、Todo.txt、TaskWarrior 和 Org 模式。

### 简单纯文本

![纯文本][3] 

*我喜欢用 Vim，其实你也可以用 Nano。*

最直接管理你的待办事项的方式就是用纯文本文件来编辑。只需要打开一个空文件，每一行添加一个任务。当任务完成后，删除这一行。简单有效，无论你用它做什么都没关系。不过这个方法也有两个缺点，一但你删除一行并保存了文件，它就是永远消失了。如果你想知道本周或者上周都做了哪些事情，就成了问题。使用简单文本文件很方便却也容易导致混乱。

### Todo.txt: 纯文件的升级版

![todo.txt 截屏][5]

*整洁，有条理，易用*

这就是我们要说的 [Todo.txt][6] 文件格式和应用程序。安装很简单，可从 GitHub [下载][7]最新的版本解压后并执行命令 `sudo make install` 。

![安装 todo.txt][9]

*也可以从 Git 克隆一个。*

Todo.txt 可以很容易的增加新任务，并能显示任务列表和已完成任务的标记：

| 命令 | 说明 |
| ------------- |:-------------|
| `todo.sh add "某任务"`       | 增加 “某任务” 到你的待办列表        |
| `todo.sh ls`                | 显示所有的任务                    |
| `todo.sh ls due:2018-02-15` | 显示2018-02-15之前的所有任务 |
| `todo.sh do 3`              | 标记任务3 为已完成任务          |

这个清单实际上仍然是纯文本，你可以用你喜欢的编辑器遵循[正确的格式][10]编辑它。

该应用程序同时也内置了一个强大的帮助系统。

![在 todo.txt 中语法高亮][12]

*你可以使用语法高亮的功能*

此外，还有许多附加组件可供选择，以及编写自己的附件组件规范。甚至有浏览器组件、移动设备应用程序和桌面应用程序支持 Todo.txt 的格式。

![GNOME extensions in todo.txt][14]

*GNOME的扩展组件*

Todo.txt 最大的缺点是缺少自动或内置的同步机制。大多数（不是全部）的浏览器扩展程序和移动应用程序需要用 Dropbox 实现桌面系统和应用程序直接的数据同步。如果你想内置同步机制，我们有……

### Taskwarrior: 现在我们用 Python 做事了

![Taskwarrior][25]

*花哨吗？*

[Taskwarrior][15] 是一个与 Todo.txt 有许多相同功能的 Python 工具。但不同的是它的数据保存在数据库里并具有内置的数据同步功能。它还可以跟踪即将要做的任务，可以提醒某个任务持续了多久，可以提醒你一些重要的事情应该马上去做。

![][26]

*看起来不错*

[安装][16] Taskwarrior 可以通过通过发行版自带的包管理器，或通过 Python 命令  `pip` 安装，或者用源码编译。用法也和 Todo.txt 的命令完全一样：

| 命令 | 说明 |
| ------------- |:-------------|
| `task add "某任务"`      | 增加 “某任务” 到任务清单        |
| `task list`              | 列出所有任务                    |
| `task list due ``:today` | 列出截止今天的任务 |
| `task do 3`              | 标记编号是3的任务为完成状态           |

Taskwarrior 还有漂亮的文本用户界面。

![Taskwarrior in Vit][18]

*我喜欢 Vit, 它的设计灵感来自 Vim*

不同于 Todo.txt，Taskwarrior 可以和本地或远程服务器同步信息。如果你希望运行自己的同步服务器可以使用名为 `taskd` 的非常基本的服务器，如果不使用自己的服务器也有好几个可用服务器。

Taskwarriot 还拥有一个蓬勃发展的插件和扩展生态系统，以及移动和桌面系统的应用。

![GNOME in Taskwarrior ][20]

*在 GNOME 下的 Taskwarrior 看起来还是很漂亮的。*

Taskwarrior 有一个唯一的缺点，你是不能直接修改待办任务的，这和其他的工具不一样。你只能把任务清单按照格式导出，然后修改导出文件后，重新再导入，这样相对于编辑器直接编辑任务还是挺麻烦的。

谁能给我们带来最大的希望呢……

### Emacs Org 模式：牛X的任务收割机

![Org-mode][22]

*Emacs 啥都有*

Emacs [Org 模式][23] 是目前为止最强大、最灵活的开源待办事项管理器。它支持多文件、使用纯文本、高度可定制、自动识别日期、截止日期和任务计划。相对于我们这里介绍的其他工具，它的配置也更复杂一些。但是一旦配置好，它可以比其他工具完成更多功能。如果你是熟悉或者是 [Bullet Journals][24] 的粉丝，Org 模式可能是在桌面程序里最像[Bullet Journals][24] 的了。

Emacs 能运行，Org 模式就能运行，一些移动应用程序可以和它很好交互。但是不幸的是，目前没有桌面程序或浏览器插件支持 Org 模式。尽管如此，Org 模式仍然是跟踪待办事项最好的应用程序之一，因为它确实很强大。

### 选择适合自己的工具

最后，这些程序目的是帮助你跟踪待办事项，并确保不会忘记做某个事情。这些程序的基础功能都大同小异，那一款适合你取决于多种因素。有的人需要自带同步功能，有的人需要一个移动客户端，有的人要必须支持插件。不管你选择什么，请记住程序本身不会让你更有调理，但是可以帮助你。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/getting-to-done-agile-linux-command-line

作者：[Kevin Sonney][a]
译者：[guevaraya](https://github.com/guevaraya)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ksonney (Kevin Sonney)
[1]:https://www.scruminc.com/getting-done/
[3]:https://opensource.com/sites/default/files/u128651/plain-text.png (plaintext)
[5]:https://opensource.com/sites/default/files/u128651/todo-txt.png (todo.txt screen)
[6]:http://todotxt.org/
[7]:https://github.com/todotxt/todo.txt-cli/releases
[9]:https://opensource.com/sites/default/files/u128651/todo-txt-install.png (Installing todo.txt)
[10]:https://github.com/todotxt/todo.txt
[12]:https://opensource.com/sites/default/files/u128651/todo-txt-vim.png (Syntax highlighting in todo.txt)
[14]:https://opensource.com/sites/default/files/u128651/tod-txt-gnome.png (GNOME extensions in todo.txt)
[15]:https://taskwarrior.org/
[16]:https://taskwarrior.org/download/
[18]:https://opensource.com/sites/default/files/u128651/taskwarrior-vit.png (Taskwarrior in Vit)
[20]:https://opensource.com/sites/default/files/u128651/taskwarrior-gnome.png (Taskwarrior on GNOME)
[22]:https://opensource.com/sites/default/files/u128651/emacs-org-mode.png (Org-mode)
[23]:https://orgmode.org/
[24]:http://bulletjournal.com/
[25]:https://opensource.com/sites/default/files/u128651/taskwarrior.png
[26]:https://opensource.com/sites/default/files/u128651/taskwarrior-complains.png
