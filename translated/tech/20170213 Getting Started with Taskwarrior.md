Taskwarrior 入门
=====

Taskwarrior 是一个灵活的[命令行任务管理程序][1]，用他们[自己的话说][2]：

Taskwarrior 是从你的命令行管理你的 TODO 列表。它灵活，快速，高效，不显眼，它默默做自己的事情让你避免自己管理。

Taskwarrior 是高度可定制的，但也可以“立即使用”。在本文中，我们将向你展示添加和完成任务的基本命令，然后我们将介绍几个更高级的命令。最后，我们将向你展示一些基本的配置设置，以开始自定义你的设置。

### 安装 Taskwarrior

Taskwarrior 在 Fedora 仓库中是可用的，所有安装它很容易：
```
sudo dnf install task

```

一旦完成安装，运行 `task`。第一次运行将会创建一个 `~/.taskrc` 文件。
```
$ **task**
A configuration file could not be found in ~

Would you like a sample /home/link/.taskrc created, so Taskwarrior can proceed? (yes/no) yes
[task next]
No matches.

```

### 添加任务

添加任务快速而不显眼。
```
$ **task add Plant the wheat**
Created task 1.

```

运行 `task` 或者 `task list` 来显示即将来临的任务。
```
$ **task list**

ID Age Description Urg
 1 8s Plant the wheat 0

1 task

```

让我们添加一些任务来完成这个示例。
```
$ **task add Tend the wheat**
Created task 2.
$ **task add Cut the wheat**
Created task 3.
$ **task add Take the wheat to the mill to be ground into flour**
Created task 4.
$ **task add Bake a cake**
Created task 5.

```

再次运行 `task` 来查看列表。
```
[task next]

ID Age Description Urg
 1 3min Plant the wheat 0
 2 22s Tend the wheat 0
 3 16s Cut the wheat 0
 4 8s Take the wheat to the mill to be ground into flour 0
 5 2s Bake a cake 0

5 tasks

```

### 完成任务

将一个任务标记为完成， 查找其 ID 并运行：
```
$ **task 1 done**
Completed task 1 'Plant the wheat'.
Completed 1 task.

```

你也可以用它的描述来标记一个任务已完成。
```
$ **task 'Tend the wheat' done**
Completed task 1 'Tend the wheat'.
Completed 1 task.

```

通过使用 `add`, `list` 和 `done`，你可以说已经入门了。

### 设定截止日期

很多任务不需要一个截止日期：
```
task add Finish the article on Taskwarrior

```

但是有时候，设定一个截止日期正是你需要提高效率的动力。在添加任务时使用 `due` 修饰符来设置特定的截止日期。

```
task add Finish the article on Taskwarrior due:tomorrow

```

`due` 非常灵活。它接受特定日期 ("2017-02-02") 或 ISO-8601 ("2017-02-02T20:53:00Z")，甚至相对时间 ("8hrs")。可以查看所有示例的 [Date & Time][3] 文档。

日期也会超出截止日期，Taskwarrior 有 `scheduled`, `wait` 和 `until` 选项。
```
task add Proof the article on Taskwarrior scheduled:thurs

```

一旦日期（本例中的星期四）通过，该任务就会被标记为 `READY` 虚拟标记。它会显示在 `ready` 报告中。
```
$ **task ready**

ID Age S Description Urg
 1 2s 1d Proof the article on Taskwarrior 5

```

要移除一个日期，使用空白值来 `modify` 任务：
```
$ task 1 modify scheduled:

```

### 查找任务

如果没有使用正则表达式搜索的能力，任务列表是不完整的，对吧？
```
$ **task '/.* the wheat/' list**

ID Age Project Description Urg
 2 42min Take the wheat to the mill to be ground into flour 0
 1 42min Home Cut the wheat 1

2 tasks

```

### 自定义 Taskwarrior

记得我们在开头创建的文件 (`~/.taskrc`)吗？让我们来看看默认设置：
```
# [Created by task 2.5.1 2/9/2017 16:39:14]
# Taskwarrior program configuration file.
# For more documentation, see http://taskwarrior.org or try 'man task', 'man task-color',
# 'man task-sync' or 'man taskrc'

# Here is an example of entries that use the default, override and blank values
# variable=foo -- By specifying a value, this overrides the default
# variable= -- By specifying no value, this means no default
# #variable=foo -- By commenting out the line, or deleting it, this uses the default

# Use the command 'task show' to see all defaults and overrides

# Files
data.location=~/.task

# Color theme (uncomment one to use)
#include /usr//usr/share/task/light-16.theme
#include /usr//usr/share/task/light-256.theme
#include /usr//usr/share/task/dark-16.theme
#include /usr//usr/share/task/dark-256.theme
#include /usr//usr/share/task/dark-red-256.theme
#include /usr//usr/share/task/dark-green-256.theme
#include /usr//usr/share/task/dark-blue-256.theme
#include /usr//usr/share/task/dark-violets-256.theme
#include /usr//usr/share/task/dark-yellow-green.theme
#include /usr//usr/share/task/dark-gray-256.theme
#include /usr//usr/share/task/dark-gray-blue-256.theme
#include /usr//usr/share/task/solarized-dark-256.theme
#include /usr//usr/share/task/solarized-light-256.theme
#include /usr//usr/share/task/no-color.theme


```

现在唯一有效的选项是 `data.location=~/.task`。要查看活动配置设置（包括内置的默认设置），运行 `show`。
```
task show

```

改变设置，使用 `config`。
```
$ **task config displayweeknumber no**
Are you sure you want to add 'displayweeknumber' with a value of 'no'? (yes/no) yes
Config file /home/link/.taskrc modified.

```

### 示例

这些只是你可以用 Taskwarrior 做的一部分事情。

为你的任务分配一个项目：
```
task 'Fix leak in the roof' modify project:Home

```

使用 `start` 来标记你正在做的事情，这可以帮助你回忆起你周末后在做什么：
```
task 'Fix bug #141291' start

```

使用相关的标签：
```
task add 'Clean gutters' +weekend +house

```

务必阅读[完整文档][4]以了解你可以编目和组织任务的所有方式。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-taskwarrior/

作者：[Link Dupont][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/linkdupont/
[1]:https://taskwarrior.org/
[2]:https://taskwarrior.org/docs/start.html
[3]:https://taskwarrior.org/docs/dates.html
[4]:https://taskwarrior.org/docs/
