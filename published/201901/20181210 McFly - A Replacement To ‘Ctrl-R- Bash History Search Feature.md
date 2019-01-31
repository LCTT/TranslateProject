[#]: collector: (lujun9972)
[#]: translator: (FSSlc)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10414-1.html)
[#]: subject: (McFly – A Replacement To ‘Ctrl+R’ Bash History Search Feature)
[#]: via: (https://www.ostechnix.com/mcfly-a-replacement-to-ctrlr-bash-history-search-feature/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

McFly：利用神经网络为 Bash 提供历史命令搜索功能
======

![](https://www.ostechnix.com/wp-content/uploads/2018/12/mcfly-720x340.png)

假如你在命令行模式下渡过了很长时间，那么你必定使用过或者听说过 BASH 的 **反向搜索** 功能，在 Bash 中执行反向搜索功能的快捷键是 `Ctrl+r`。通过使用这个特性，我们可以找到我们执行过的命令而无需再次输入它们。当然，你可以使用上下键来搜索你的 bash 命令记录，但使用 `Ctrl+r` 快捷键可以让这个搜索过程更简单快速。今天我找寻到了 Bash 历史命令搜索特性 `Ctrl+r` 的一个替代品，它就是 McFly。McFly 是一个使用 Rust 编程语言写就的简洁工具，自带一个智能的搜索引擎，用来替换默认的 `Ctrl+r` 这个 Bash 历史命令搜索功能。 McFly 提供的命令建议都是通过一个小巧的 **神经网络** 来实时排序给出的。

McFly 重新绑定了 `Ctrl+r` 快捷键，可以从你的 Bash 历史命令中找到所有最近执行过的命令。它通过追溯下面的信息来增强你的 shell 历史命令搜索特性：

* 命令结束状态
* 当你运行命令时的时间戳
* 以及你运行命令的执行目录

它将所有追溯的信息保存在一个 SQLite 数据库中。由于它追溯了命令的历史结束状态，所以你可以很轻易地忽略掉失败的命令。听起来很酷，对吧？

在给出一个命令建议时，它将考虑如下因素：

* 你在哪个目录执行的这个命令，将来你很有可能在相同的目录重复这个命令
* 在你执行这个命令之前，执行过什么命令
* 你执行这个命令有多频繁
* 你最后执行该命令的时间
* 你是否在 McFly 中选择过这个命令
* 以及这个命令的历史结束状态。因为你很有可能不会去执行失败过的命令，对吧？

McFly 维护着你的默认 Bash 历史文件，所以你可以随时停止使用它。McFly 也并不只服务于 BASH， 它也可以扩展到其他 shell 程序。

### 安装 McFly

在 Linux 中，McFly 可以使用 Linuxbrew 来安装。如若你还没有安装过 Linuxbrew，那么你可以参考下面的这个链接。（LCTT 译注：从其 [GitHub 主页](https://github.com/cantino/mcfly)了解到也可以下载其二进制来使用。）

- [Linuxbrew：一个用于 Linux 和 Mac OS X 的通用包管理][1]

一旦安装好了 Linuxbrew，运行下面的命令来安装 McFly：

```
$ brew tap cantino/mcfly https://github.com/cantino/mcfly

$ brew install mcfly
```

在安装完成后，你将看到下面的输出：

```
==> Installing mcfly from cantino/mcfly
==> Downloading https://github.com/cantino/mcfly/releases/download/v0.2.5/mcfly-v0
==> Downloading from https://github-production-release-asset-2e65be.s3.amazonaws.c
######################################################################## 100.0%
==> ONE MORE STEP! Edit ~/.bashrc and add the following:

if [ -f $(brew --prefix)/opt/mcfly/mcfly.bash ]; then
. $(brew --prefix)/opt/mcfly/mcfly.bash
fi
🍺 /home/linuxbrew/.linuxbrew/Cellar/mcfly/v0.2.5: 4 files, 3.5MB, built in 33 seconds
```

![](https://www.ostechnix.com/wp-content/uploads/2018/12/install-mcfly.png)

正如你上面看到的那样，在使用 McFly 之前我们需要再做一些配置。

将下面几行添加到你的 `~/.bashrc` 文件中：

```
if [ -f $(brew --prefix)/opt/mcfly/mcfly.bash ]; then
. $(brew --prefix)/opt/mcfly/mcfly.bash
fi
```

最后，再运行下面的命令来让更改生效。

```
$ source ~/.bashrc
```

当你第一次执行上面的这个命令时，你的 BASH 历史将会被导入 McFly 的数据库。依据你的 bash 历史文件的大小，这个过程将花费一些时间。一旦导入完成，你讲看到下面的提示信息。

```
McFly: Importing Bash history for the first time. This may take a minute or two...done.
```

现在你就可以使用 McFly 了。

### 使用方法

要在你的命令历史中执行搜索，只需要键入 `mcfly search` 再加上命令名的一部分，最后敲击回车键即可。Mcfly 将会基于你刚才键入的搜索查询语句给出命令建议。

```
$ mcfly search <part-of-the-command>
```

例如我键入了下面的命令：

```
$ mcfly search mk
```

下面展示的是我 Ubuntu 机子上的示例输出：

![](https://www.ostechnix.com/wp-content/uploads/2018/12/mcfly-command-1.png)

如你所见，我已经使用过 `mkdir` 这个命令两次。假如你想从这些命令建议中执行其中之一，只需使用上下键来选择它，然后敲击**回车键**来执行它就可以了。假如你想编辑其中一个命令，则需要先选择它，然后敲 `TAB` 键将这个命令放置到终端中，最后在运行它之前更改它就行了。要从历史中删除已经选择的命令，按 `F2` 即可。

或者，输入下面的命令来打开历史搜索，然后输入任意一个命令或者命令的一部分来从你的历史命令中查看它提供的建议。

```
$ mcfly search
```

在你输入的同时， McFly 将会展示命令的提示。

下面是一个介绍 McFly 的简短演示视频：

![](https://www.ostechnix.com/wp-content/uploads/2018/12/mcfly-demo.gif)

你还可以使用下面的命令来查看帮助：

```
$ mcfly --help
```

### 移除 McFly

不喜欢 McFly，没问题！可以使用下面的命令来移除它：

```
$ brew uninstall mcfly

$ brew untap cantino/mcfly
```

最后，移除先前添加到 `~/.bashrc` 文件中的几行命令。

好了，这些就是所有了，更多精彩内容敬请期待，请保存关注！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/mcfly-a-replacement-to-ctrlr-bash-history-search-feature/

作者：[SK][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
