Taskwarrior：Linux下一个很棒的命令行TODO工具
====

Taskwarrior是Ubuntu/Linux下一个简单直接的基于命令行的TODO工具。这个开源软件是我曾用过的最简单的[基于命令行的工具][4]之一。Taskwarrior帮助你更好地组织你自己，而不用安装笨重的新工具，这有时破坏了TODO工具的目的。

![](https://2.bp.blogspot.com/-pQnRlOUNIxk/V9cuc3ytsBI/AAAAAAAAKHs/yYxyiAk4PwMIE0HTxlrm6arWOAPcBRRywCLcB/s1600/taskwarrior-todo-app.png)

### Taskwarrior：一个基于简单的基于命令行帮助完成任务的TODO工具

Taskwarrior是一个开源、跨平台、基于命令行的TODO工具，它帮你在终端中管理你的to-do列表。这个工具让你可以轻松地添加任务、展示列表、移除任务。同时，在你的默认仓库中就由，不用安装新的PPA。在 Ubuntu 16.04 LTS或者相似的发行版中。在终端中按照如下步骤安装Taskwarrior。

```
sudo apt-get install task
```

一个简单的使用如下：

```
$ task add Read a book
Created task 1.
$ task add priority:H Pay the bills
Created task 2.
```

我使用上面截图中的同样一个例子。是的，你可以设置优先级（H、L或者M）。并且你可以使用‘task’或者‘task next’命令来查看你最新创建的to-do列表。比如：

```
$ task next

ID Age P Description                      Urg
-- --- - -------------------------------- ----
 2 10s H Pay the bills                     6
 1 20s   Read a book                       0
```

完成之后，你可以使用‘task 1 done’或者‘task 2 done’来清除列表。[可以在这里][1]找到更加全面的命令和使用案例。同样，Taskwarrior是跨平台的，这意味着不管怎样，你都可以找到一个[满足你需求][2]的版本。如果你需要的话，这里甚至有[一个安卓版][3]。用得开心！

--------------------------------------------------------------------------------

via: http://www.techdrivein.com/2016/09/taskwarrior-command-line-todo-app-linux.html?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+techdrivein+%28Tech+Drive-in%29

作者：[Manuel Jose ][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.techdrivein.com/2016/09/taskwarrior-command-line-todo-app-linux.html?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+techdrivein+%28Tech+Drive-in%29
[1]: https://taskwarrior.org/docs/
[2]: https://taskwarrior.org/download/
[3]: https://taskwarrior.org/news/news.20160225.html
[4]: http://www.techdrivein.com/search/label/Terminal


