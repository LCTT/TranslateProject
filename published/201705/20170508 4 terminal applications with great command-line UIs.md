4 个拥有绝佳命令行界面的终端程序
============================================================

> 让我们来看几个精心设计的 CLI 程序，以及如何解决一些可发现性问题。

![4 awesome command-line tools](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/code_computer_development_programming.png?itok=wMspQJcO "4 awesome command-line tools")

>图片提供： opensource.com

在本文中，我会指出命令行界面的<ruby>可发现性<rt>discoverability</rt></ruby>缺点以及克服这些问题的几种方法。

我喜欢命令行。我第一次接触命令行是在 1997 的 DOS 6.2 上。我学习了各种命令的语法，并展示了如何在目录中列出隐藏的文件（`attrib`）。我会每次仔细检查命令中的每个字符。 当我犯了一个错误，我会从头开始重新输入命令。直到有一天，有人向我展示了如何使用向上和向下箭头按键遍历命令行历史，我被震惊了。

后来当我接触到 Linux 时，让我感到惊喜的是，上下箭头保留了它们遍历历史记录的能力。我仍然很仔细地打字，但是现在，我了解如何盲打，并且我能打的很快，每分钟可以达到 55 个单词的速度。接着有人向我展示了 tab 补完，再一次改变了我的生活。

在 GUI 应用程序中，菜单、工具提示和图标用于向用户展示功能。而命令行缺乏这种能力，但是有办法克服这个问题。在深入解决方案之前，我会来看看几个有问题的 CLI 程序：

**1、 MySQL**

首先让我们看看我们所钟爱的 MySQL REPL。我经常发现自己在输入 `SELECT * FROM` 然后按 `Tab` 的习惯。MySQL 会询问我是否想看到所有的 871 种可能性。我的数据库中绝对没有 871 张表。如果我选择 `yes`，它会显示一堆 SQL 关键字、表、函数等。（LCTT 译注：REPL —— Read-Eval-Print Loop，交互式开发环境）

![MySQL gif](https://opensource.com/sites/default/files/mysql.gif)

**2、 Python**

我们来看另一个例子，标准的 Python REPL。我开始输入命令，然后习惯按 `Tab` 键。瞧，插入了一个 `Tab` 字符，考虑到 `Tab` 在 Python 源代码中没有特定作用，这是一个问题。

![Python gif](https://opensource.com/sites/default/files/python.gif "Python gif")

### 好的用户体验

让我看下设计良好的 CLI 程序以及它们是如何克服这些可发现性问题的。

#### 自动补全： bpython

[Bpython][15] 是对 Python REPL 的一个很好的替代。当我运行 bpython 并开始输入时，建议会立即出现。我没用通过特殊的键盘绑定触发它，甚至没有按下 `Tab` 键。

![bpython gif](https://opensource.com/sites/default/files/bpython.gif "bpython gif")

当我出于习惯按下 `Tab` 键时，它会用列表中的第一个建议补全。这是给 CLI 设计带来可发现性性的一个很好的例子。

bpython 的另一个方面是可以展示模块和函数的文档。当我输入一个函数的名字时，它会显示这个函数附带的签名以及文档字符串。这是一个多么令人难以置信的周到设计啊。

#### 上下文感知补全：mycli

[mycli][16] 是默认的 MySQL 客户端的现代替代品。这个工具对 MySQL 来说就像 bpython 之于标准 Python REPL 一样。mycli 将在你输入时自动补全关键字、表名、列和函数。

补全建议是上下文相关的。例如，在 `SELECT * FROM` 之后，只有来自当前数据库的表才会列出，而不是所有可能的关键字。

![mycli gif](https://opensource.com/sites/default/files/mycli.gif "mycli gif")

#### 模糊搜索和在线帮助： pgcli

如果您正在寻找 PostgreSQL 版本的 mycli，请看看 [pgcli][17]。 与 mycli 一样，它提供了上下文感知的自动补全。菜单中的项目使用模糊搜索缩小范围。模糊搜索允许用户输入整体字符串中的任意子字符串来尝试找到正确的匹配项。

![pgcli gif](https://opensource.com/sites/default/files/pgcli.gif "pgcli gif")

pgcli 和 mycli 在其 CLI 中都实现了这个功能。斜杠命令的文档也作为补全菜单的一部分展示。

#### 可发现性: fish

在传统的 Unix shell（Bash、zsh 等）中，有一种搜索历史记录的方法。此搜索模式由 `Ctrl-R` 触发。当再次调用你上周运行过的命令时，例如 **ssh**或 **docker**，这是一个令人难以置信的有用的工具。 一旦你知道这个功能，你会发现自己经常会使用它。

如果这个功能是如此有用，那为什么不每次都搜索呢？这正是 [**fish** shell][18] 所做的。一旦你开始输入命令，**fish** 将开始建议与历史记录类似的命令。然后，你可以按右箭头键接受该建议。

### 命令行规矩

我已经回顾了一些解决可发现性的问题的创新方法，但也有一些基本的命令行功能应该作为每个 REPL 所实现基础功能的一部分：

* 确保 REPL 有可通过箭头键调用的历史记录。确保会话之间的历史持续存在。
* 提供在编辑器中编辑命令的方法。不管你的补全是多么棒，有时用户只需要一个编辑器来制作完美的命令来删除生产环境中所有的表。
* 使用分页器（`pager`）来管道输出。不要让用户滚动他们的终端。哦，要为分页器设置个合理的默认值。（记得添加选项来处理颜色代码。）
* 提供一种通过 `Ctrl-R` 界面或者 fish 式的自动搜索来搜索历史记录的方法。

### 总结

在第 2 节中，我将来看看 Python 中使你能够实现这些技术的特定库。同时，请查看其中一些精心设计的命令行应用程序：

*   [bpython][5]或 [ptpython][6]：具有自动补全支持的 Python REPL。
*   [http-prompt][7]：交互式 HTTP 客户端。
*   [mycli][8]：MySQL、MariaDB 和 Percona 的命令行界面，具有自动补全和语法高亮。
*   [pgcli][9]：具有自动补全和语法高亮，是对 [psql][10] 的替代工具。
*   [wharfee][11]：用于管理 Docker 容器的 shell。

_了解更多： Amjith Ramanujam 在 5 月 20 日在波特兰俄勒冈州举办的 [PyCon US 2017][12] 上的谈话“[神奇的命令行工具][13]”。_

--------------------------------------------------------------------------------


作者简介：

Amjith Ramanujam - Amjith Ramanujam 是 pgcli 和 mycli 的创始人。人们认为它们很酷，他表示笑纳赞誉。他喜欢用 Python、Javascript 和 C 编程。他喜欢编写简单易懂的代码，它们有时甚至会成功。

-----------------------

via: https://opensource.com/article/17/5/4-terminal-apps

作者：[Amjith Ramanujam][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/amjith
[1]:https://opensource.com/tags/python?src=programming_resource_menu
[2]:https://opensource.com/tags/javascript?src=programming_resource_menu
[3]:https://opensource.com/tags/perl?src=programming_resource_menu
[4]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ&src=programming_resource_menu
[5]:http://bpython-interpreter.org/
[6]:http://github.com/jonathanslenders/ptpython/
[7]:https://github.com/eliangcs/http-prompt
[8]:http://mycli.net/
[9]:http://pgcli.com/
[10]:https://www.postgresql.org/docs/9.2/static/app-psql.html
[11]:http://wharfee.com/
[12]:https://us.pycon.org/2017/
[13]:https://us.pycon.org/2017/schedule/presentation/518/
[14]:https://opensource.com/article/17/5/4-terminal-apps?rate=3HL0zUQ8_dkTrinonNF-V41gZvjlRP40R0RlxTJQ3G4
[15]:https://bpython-interpreter.org/
[16]:http://mycli.net/
[17]:http://pgcli.com/
[18]:https://fishshell.com/
[19]:https://opensource.com/user/125521/feed
[20]:https://opensource.com/article/17/5/4-terminal-apps#comments
[21]:https://opensource.com/users/amjith
