[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11835-1.html)
[#]: subject: (Get started with this open source to-do list manager)
[#]: via: (https://opensource.com/article/20/1/open-source-to-do-list)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

开始使用开源待办事项清单管理器
======

> 待办事项清单是跟踪任务列表的强大方法。在我们的 20 个使用开源提升生产力的系列的第七篇文章中了解如何使用它。

![](https://img.linux.net.cn/data/attachment/album/202001/31/111103kmv55ploshuso4ot.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 使用 todo 跟踪任务

任务管理和待办事项清单是我非常喜欢0的东西。我是一位生产效率的狂热粉丝（以至于我为此做了一个[播客][2]），我尝试了各种不同的应用。我甚至为此[做了演讲][3]并[写了些文章][4]。因此，当我谈到提高工作效率时，肯定会出现任务管理和待办事项清单工具。

![Getting fancy with Todo.txt][5]

说实话，由于简单、跨平台且易于同步，用 [todo.txt][6] 肯定不会错。它是我不断反复提到的两个待办事项清单以及任务管理应用之一（另一个是 [Org 模式][7]）。让我反复使用它的原因是它简单、可移植、易于理解，并且有许多很好的附加组件，并且当一台机器有附加组件，而另一台没有，也不会破坏它。由于它是一个 Bash shell 脚本，我还没发现一个无法支持它的系统。

#### 设置 todo.txt

首先，你需要安装基本 shell 脚本并将默认配置文件复制到 `~/.todo` 目录：

```
git clone https://github.com/todotxt/todo.txt-cli.git
cd todo.txt-cli
make
sudo make install
mkdir ~/.todo
cp todo.cfg ~/.todo/config
```

接下来，设置配置文件。一般，我想取消对颜色设置的注释，但必须马上设置的是 `TODO_DIR` 变量：

```
export TODO_DIR="$HOME/.todo"
```

#### 添加待办事件

要添加第一个待办事件，只需输入 `todo.sh add <NewTodo>` 就能添加。这还将在 `$HOME/.todo/` 中创建三个文件：`todo.txt`、`done.txt` 和 `reports.txt`。

添加几个项目后，运行 `todo.sh ls` 查看你的待办事项。

![Basic todo.txt list][8]

#### 管理任务

你可以通过给项目设置优先级来稍微改善它。要向项目添加优先级，运行 `todo.sh pri # A`。数字是列表中任务的数量，而字母 `A` 是优先级。你可以将优先级设置为从 A 到 Z，因为这是它的排序方式。

要完成任务，运行 `todo.sh do #` 来标记项目已完成并将它移动到 `done.txt`。运行 `todo.sh report` 会向 `report.txt` 写入已完成和未完成项的数量。

所有这三个文件的格式都有详细的说明，因此你可以使用你的文本编辑器修改。`todo.txt` 的基本格式是：

```
(Priority) YYYY-MM-DD Task
```

该日期表示任务的到期日期（如果已设置）。手动编辑文件时，只需在任务前面加一个 `x` 来标记为已完成。运行 `todo.sh archive` 会将这些项目移动到 `done.txt`，你可以编辑该文本文件，并在有时间时将已完成的项目归档。

#### 设置重复任务

我有很多重复的任务，我需要以每天/周/月来计划。

![Recurring tasks with the ice_recur add-on][9]

这就是 `todo.txt` 的灵活性所在。通过在 `~/.todo.actions.d/` 中使用[附加组件][10]，你可以添加命令并扩展基本 `todo.sh` 的功能。附加组件基本上是实现特定命令的脚本。对于重复执行的任务，插件 [ice_recur][11] 应该符合要求。按照其页面上的说明操作，你可以设置任务以非常灵活的方式重复执行。

![Todour on MacOS][12]

在该[附加组件目录][10]中有很多附加组件，包括同步到某些云服务，也有链接到桌面或移动端应用的组件，这样你可以随时看到待办列表。

我只是简单介绍了这个代办事项清单功能，请花点时间深入了解这个工具的强大！它确实可以帮助我每天完成任务。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-to-do-list

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_todo_clock_time_team.png?itok=1z528Q0y (Team checklist)
[2]: https://productivityalchemy.com/
[3]: https://www.slideshare.net/AllThingsOpen/getting-to-done-on-the-command-line
[4]: https://opensource.com/article/18/2/getting-to-done-agile-linux-command-line
[5]: https://opensource.com/sites/default/files/uploads/productivity_7-1.png
[6]: http://todotxt.org/
[7]: https://orgmode.org/
[8]: https://opensource.com/sites/default/files/uploads/productivity_7-2.png (Basic todo.txt list)
[9]: https://opensource.com/sites/default/files/uploads/productivity_7-3.png (Recurring tasks with the ice_recur add-on)
[10]: https://github.com/todotxt/todo.txt-cli/wiki/Todo.sh-Add-on-Directory
[11]: https://github.com/rlpowell/todo-text-stuff
[12]: https://opensource.com/sites/default/files/uploads/productivity_7-4.png (Todour on MacOS)
