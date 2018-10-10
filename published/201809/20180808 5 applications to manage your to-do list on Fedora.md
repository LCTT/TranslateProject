5 个在 Fedora 上管理待办事项的程序
======

![](https://fedoramagazine.org/wp-content/uploads/2018/08/todoapps-816x345.jpg)

有效管理待办事项（to-do）可以为你的工作效率创造奇迹。有些人更喜欢在文本中保存待办事项，甚至只使用记事本和笔。对于需要更多待办事项功能的用户，他们通常会使用应用程序。在本文中，我们将重点介绍 4 个图形程序和一个基于终端的工具来管理待办事项。

### GNOME To Do

[GNOME To Do][1] 是专为 GNOME 桌面（Fedora Workstation 的默认桌面）设计的个人任务管理器。GNOME To Do 与其他程序进行比较，它有一系列简洁的功能。

GNOME To Do 提供列表形式的任务组织方式，并能为该列表指定颜色。此外，可以为各个任务分配截止日期和优先级，以及每项任务的注释。此外，GNOME To Do 还支持扩展，能添加更多功能，包括支持 [todo.txt][2] 以及与 [todoist][3] 等在线服务同步。

![][4]

使用软件中心或者在终端中使用下面的命令安装 GNOME To Do：

```
sudo dnf install gnome-todo
```

### Getting things GNOME!

在 GNOME To Do 出现之前，在 GNOME 上追踪任务的首选程序是 [Getting things GNOME!][5] 这个老式的 GNOME 程序采用多窗口布局，能让你同时显示多个任务的细节。GTG 没有任务列表，它能在任务中添加子任务，甚至在子任务中添加子任务。GTG 同样能添加截止日期和开始日期。也可以通过插件同步其他程序和服务。

![][6]

在软件中心或者在终端中使用下面的命令安装 Getting Things GNOME：

```
sudo dnf install gtg
```

### Go For It!

[Go For It!][7] 是一个超级简单的任务管理程序。它能简单地创建一个任务列表，并在完成后标记它们。它不能将任务分组，也不能创建子任务。Go For It!  默认将任务存储为 todo.txt 格式，这能更方便地同步到在线服务或者其他程序中。额外地，Go For It! 包含了一个简单定时器来追踪你在当前任务花费了多少时间。

![][8]

Go For It! 能在 Flathub 应用仓库中找到。要安装它，只需[启用 Flathub 作为软件源][9]，接着在软件中心中安装。

### Agenda

如果你在寻找一款非常简单的待办应用，非 [Agenda][10] 莫属。创建任务，标记完成，接着从列表中删除它们。Agenda 会在你删除它们之前一直显示所有任务（完成的或者进行中）。

![][11]

Agenda 能从 Flathub 应用仓库下载。要安装它，只需[启用 Flathub 作为软件源][9]，接着在软件中心中安装。

### Taskwarrior

[Taskwarrior][12] 是一个灵活的命令行任务管理程序。它高度可定制化，但同样“开箱即用”。使用简单的命令，你可以创建任务，标记完成，并列出当前进行中的任务。另外，任务可以被标记、添加到项目、搜索和过滤。此外，你可以设置循环任务，并设置任务截止日期。

[之前在 Fedora Magazine 上的文章][13] 对 Taskwarrior 的入门做了很好的概述。

![][14]

在终端中使用这个命令安装 Taskwarrior：

```
sudo dnf install task
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/5-tools-to-manage-your-to-do-list-on-fedora/

作者：[Ryan Lerch][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/introducing-flatpak/
[1]:https://wiki.gnome.org/Apps/Todo/
[2]:http://todotxt.org/
[3]:https://en.todoist.com/
[4]:https://fedoramagazine.org/wp-content/uploads/2018/08/gnome-todo.png
[5]:https://wiki.gnome.org/Apps/GTG
[6]:https://fedoramagazine.org/wp-content/uploads/2018/08/gtg.png
[7]:http://manuel-kehl.de/projects/go-for-it/
[8]:https://fedoramagazine.org/wp-content/uploads/2018/08/goforit.png
[9]:https://fedoramagazine.org/install-flathub-apps-fedora/
[10]:https://github.com/dahenson/agenda
[11]:https://fedoramagazine.org/wp-content/uploads/2018/08/agenda.png
[12]:https://taskwarrior.org/
[13]:https://fedoramagazine.org/getting-started-taskwarrior/
[14]:https://fedoramagazine.org/wp-content/uploads/2018/08/taskwarrior.png
