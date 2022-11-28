[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12575-1.html)
[#]: subject: (SCP user’s migration guide to rsync)
[#]: via: (https://fedoramagazine.org/scp-users-migration-guide-to-rsync/)
[#]: author: (chasinglogic https://fedoramagazine.org/author/chasinglogic/)

scp 用户的 rsync 迁移指南
======

![](https://img.linux.net.cn/data/attachment/album/202009/03/102942u7rxf79a7rsr9txz.jpg)

在 [SSH 8.0 预发布公告][2]中，OpenSSH 项目表示，他们认为 scp 协议已经过时，不灵活，而且不容易修复，然后他们继而推荐使用 `sftp` 或 `rsync` 来进行文件传输。

然而，很多用户都是从小用着 `scp` 命令长大的，所以对 `rsync` 并不熟悉。此外，`rsync` 可以做的事情也远不止复制文件，这可能会给菜鸟们留下复杂和难以掌握的印象。尤其是，`scp` 命令的标志大体上可以直接对应到 `cp` 命令的标志，而 `rsync` 命令的标志却和它大相径庭。

本文将为熟悉 `scp` 的人提供一个介绍和过渡的指南。让我们跳进最常见的场景：复制文件和复制目录。

### 复制文件

对于复制单个文件而言，`scp` 和 `rsync` 命令实际上是等价的。比方说，你需要把 `foo.txt` 传到你在名为 `server` 的服务器上的主目录下：

```
$ scp foo.txt me@server:/home/me/
```

相应的 `rsync` 命令只需要输入 `rsync` 取代 `scp`：

```
$ rsync foo.txt me@server:/home/me/
```

### 复制目录

对于复制目录，就有了很大的分歧，这也解释了为什么 `rsync` 会被认为比 `scp` 更复杂。如果你想把 `bar` 目录复制到 `server` 服务器上，除了指定 `ssh` 信息外，相应的 `scp` 命令和 `cp` 命令一模一样。

```
$ scp -r bar/ me@server:/home/me/
```

对于 `rsync`，考虑的因素比较多，因为它是一个比较强大的工具。首先，我们来看一下最简单的形式：

```
$ rsync -r bar/ me@server:/home/me/
```

看起来很简单吧？对于只包含目录和普通文件的简单情况，这就可以了。然而，`rsync` 更在意发送与主机系统中一模一样的文件。让我们来创建一个稍微复杂一些，但并不罕见的例子：

```
# 创建多级目录结构
$ mkdir -p bar/baz
# 在其根目录下创建文件
$ touch bar/foo.txt
# 现在创建一个符号链接指回到该文件
$ cd bar/baz
$ ln -s ../foo.txt link.txt
# 返回原位置
$ cd -
```

现在我们有了一个如下的目录树：

```
bar
├── baz
│   └── link.txt -> ../foo.txt
└── foo.txt

1 directory, 2 files
```

如果我们尝试上面的命令来复制 `bar`，我们会注意到非常不同的（并令人惊讶的）结果。首先，我们来试试 `scp`：

```
$ scp -r bar/ me@server:/home/me/
```

如果你 `ssh` 进入你的服务器，看看 `bar` 的目录树，你会发现它和你的主机系统有一个重要而微妙的区别：

```
bar
├── baz
│   └── link.txt
└── foo.txt

1 directory, 2 files
```

请注意，`link.txt` 不再是一个符号链接，它现在是一个 `foo.txt` 的完整副本。如果你习惯于使用 `cp`，这可能会是令人惊讶的行为。如果你尝试使用 `cp -r` 复制 `bar` 目录，你会得到一个新的目录，里面的符号链接和 `bar` 的一样。现在如果我们尝试使用之前的 `rsync` 命令，我们会得到一个警告：

```
$ rsync -r bar/ me@server:/home/me/
skipping non-regular file "bar/baz/link.txt"
```

`rsync` 警告我们它发现了一个非常规文件，并正在跳过它。因为你没有告诉它可以复制符号链接，所以它忽略了它们。`rsync` 在手册中有一节“符号链接”，解释了所有可能的行为选项。在我们的例子中，我们需要添加 `-links` 标志：

```
$ rsync -r --links bar/ me@server:/home/me/
```

在远程服务器上，我们看到这个符号链接是作为一个符号链接复制过来的。请注意，这与 `scp` 复制符号链接的方式不同。

```
bar/
├── baz
│   └── link.txt -> ../foo.txt
└── foo.txt

1 directory, 2 files
```

为了省去一些打字工作，并利用更多的文件保护选项，在复制目录时可以使用归档标志 `-archive`（简称 `-a`）。该归档标志将做大多数人所期望的事情，因为它可以实现递归复制、符号链接复制和许多其他选项。

```
$ rsync -a bar/ me@server:/home/me/
```

如果你感兴趣的话，`rsync` 手册页有关于存档标志的深入解释。

### 注意事项

不过，使用 `rsync` 有一个注意事项。使用 `scp` 比使用 `rsync` 更容易指定一个非标准的 ssh 端口。例如，如果 `server` 使用 8022 端口的 SSH 连接，那么这些命令就会像这样：

```
$ scp -P 8022 foo.txt me@server:/home/me/
```

而在使用 `rsync` 时，你必须指定要使用的“远程 shell”命令，默认是 `ssh`。你可以使用 `-e` 标志来指定。

```
$ rsync -e 'ssh -p 8022' foo.txt me@server:/home/me/
```

`rsync` 会使用你的 `ssh` 配置；但是，如果你经常连接到这个服务器，你可以在你的 `~/.ssh/config` 文件中添加以下代码。这样你就不需要再为 `rsync` 或 `ssh` 命令指定端口了！

```
Host server
    Port 8022
```

另外，如果你连接的每一台服务器都在同一个非标准端口上运行，你还可以配置 `RSYNC_RSH` 环境变量。

### 为什么你还是应该切换到 rsync？

现在我们已经介绍了从 `scp` 切换到 `rsync` 的日常使用案例和注意事项，让我们花一些时间来探讨一下为什么你可能想要使用 `rsync` 的优点。很多人在很久以前就已经开始使用 `rsync` 了，就是因为这些优点。

#### 即时压缩

如果你和服务器之间的网络连接速度较慢或有限，`rsync` 可以花费更多的 CPU 处理能力来节省网络带宽。它通过在发送数据之前对数据进行即时压缩来实现。压缩可以用 `-z` 标志来启用。

#### 差量传输

`rsync` 也只在目标文件与源文件不同的情况下复制文件。这可以在目录中递归地工作。例如，如果你拿我们上面的最后一个 `bar` 的例子，并多次重新运行那个 `rsync` 命令，那么在最初的传输之后就不会有任何传输。如果你知道你会重复使用这些命令，例如备份到 U 盘，那么使用 `rsync` 即使是进行本地复制也是值得的，因为这个功能可以节省处理大型数据集的大量的时间。

#### 同步

顾名思义，`rsync` 可以做的不仅仅是复制数据。到目前为止，我们只演示了如何使用 `rsync` 复制文件。如果你想让 `rsync` 把目标目录变成源目录的样子，你可以在 `rsync` 中添加删除标志 `-delete`。这个删除标志使得 `rsync` 将从源目录中复制不存在于目标目录中的文件，然后它将删除目标目录中不存在于源目录中的文件。结果就是目标目录和源目录完全一样。相比之下，`scp` 只会在目标目录下添加文件。

### 结论

对于简单的使用情况，`rsync` 并不比老牌的 `scp` 工具复杂多少。唯一显著的区别是在递归复制目录时使用 `-a` 而不是 `-r`。然而，正如我们看到的，`rsync` 的 `-a` 标志比 `scp` 的 `-r` 标志更像 `cp` 的 `-r` 标志。

希望通过这些新命令，你可以加快你的文件传输工作流程。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/scp-users-migration-guide-to-rsync/

作者：[chasinglogic][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/chasinglogic/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/07/scp-rsync-816x345.png
[2]: https://lists.mindrot.org/pipermail/openssh-unix-dev/2019-March/037672.html
