LFCS 系列第十二讲：如何使用 Linux 的帮助文档和工具
==================================================================================

由于 2016 年 2 月 2 号开始启用了新的 LFCS 考试要求,  我们在 [LFCS 系列][1]系列添加了一些必要的内容。为了考试的需要，我们强烈建议你看一下[LFCE 系列][2]。

![](http://www.tecmint.com/wp-content/uploads/2016/03/Explore-Linux-with-Documentation-and-Tools.png)

*LFCS: 了解 Linux 的帮助文档和工具*

当你习惯了在命令行下进行工作，你会发现 Linux 已经有了许多使用和配置 Linux 系统所需要的文档。

另一个你必须熟悉命令行帮助工具的理由是，在[LFCS][3] 和 [LFCE][4] 考试中，它们是你唯一能够使用的信息来源，没有互联网也没有百度。你只能依靠你自己和命令行。

基于上面的理由，在这一章里我们将给你一些建议来可以让你有效的使用这些安装的文档和工具，以帮助你通过**Linux 基金会认证**考试。

### Linux 帮助手册（man）

man 手册是  manual 手册的缩写，就是其名字所揭示的那样：一个给定工具的帮助手册。它包含了命令所支持的选项列表（以及解释），有些工具甚至还提供一些使用范例。

我们用 **man 命令** 跟上你想要了解的工具名称来打开一个帮助手册。例如：

```
# man diff
```

这将打开`diff`的手册页，这个工具将逐行对比文本文件（如你想退出只需要轻轻的点一下 q 键）。

下面我来比较两个文本文件 `file1` 和 `file2`。这两个文本文件包含了使用同一个 Linux 发行版相同版本安装的两台机器上的的安装包列表。

输入`diff` 命令它将告诉我们 `file1` 和`file2` 有什么不同:

```
# diff file1 file2
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/Compare-Two-Text-Files-in-Linux.png)

*在Linux中比较两个文本文件*

`<` 这个符号是说`file2`缺失的行。如果是 `file1`缺失，我们将用 `>` 符号来替代指示。

另外，**7d6** 意思是说`file1`的第**7**行要删除了才能和`file2`一致（**24d22** 和 **41d38** 也是同样的意思） **65,67d61** 告诉需要删除从第 **65** 行到 **67** 行。我们完成了以上步骤，那么这两个文件将完全一致。

此外，根据 man 手册说明，你还可以通过 `-y` 选项来以两路的方式显示文件。你可以发现这对于你找到两个文件间的不同根据方便容易。

```
# diff -y file1 file2
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/Compare-and-List-Difference-of-Two-Files.png)

*比较并列出两个文件的不同*

此外，你也可以用`diff`来比较两个二进制文件。如果它们完全一样，`diff` 将什么也不会输出。否则，它将会返回如下信息：“**Binary files X and Y differ**”。

### –help 选项

`--help`选项，大多数命令都支持它（并不是所有）， 它可以理解为一个命令的简短帮助手册。尽管它没有提供工具的详细介绍，但是确实是一个能够快速列出程序的所支持的选项的不错的方法。

例如，

```
# sed --help
```

将显示 sed （流编辑器）的每个支持的选项。

`sed`命令的一个典型用法是替换文件中的字符。用 `-i` 选项（意思是 “**原地编辑编辑文件**”），你可以编辑一个文件而且并不需要打开它。 如果你想要同时备份一个原始文件，用 `-i` 选项加后缀来创建一个原始文件的副本。

例如，替换 `lorem.txt` 中的`Lorem` 为 `Tecmint`（忽略大小写），并且创建一个原文件的备份副本，命令如下：

```
# less lorem.txt | grep -i lorem
# sed -i.orig 's/Lorem/Tecmint/gI' lorem.txt
# less lorem.txt | grep -i lorem
# less lorem.txt.orig | grep -i lorem
```

请注意`lorem.txt`文件中`Lorem` 都已经替换为 `Tecmint`，并且原文件 `lorem.txt` 被保存为`lorem.txt.orig`。

![](http://www.tecmint.com/wp-content/uploads/2016/03/Replace-A-String-in-File.png)

*替换文件中的文本*

### /usr/share/doc 内的文档

这可能是我最喜欢的方法。如果你进入 `/usr/share/doc` 目录，并列出该目录，你可以看到许多以安装在你的 Linux 上的工具为名称的文件夹。

根据 [文件系统层级标准][5]，这些文件夹包含了许多帮助手册没有的信息，还有一些可以使配置更方便的模板和配置文件。

例如，让我们来看一下 `squid-3.3.8` （不同发行版的版本可能会不同），这还是一个非常受欢迎的 HTTP 代理和 [squid 缓存服务器][6]。

让我们用`cd`命令进入目录：

```
# cd /usr/share/doc/squid-3.3.8
```

列出当前文件夹列表：

```
# ls
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/List-Files-in-Linux.png)

*使用 ls 列出目录*

你应该特别注意 `QUICKSTART` 和 `squid.conf.documented`。这些文件分别包含了 Squid 详细文档及其经过详细备注的配置文件。对于别的安装包来说，具体的名字可能不同（有可能是 **QuickRef** 或者**00QUICKSTART**），但意思是一样的。

对于另外一些安装包，比如 Apache web 服务器，在`/usr/share/doc`目录提供了配置模板，当你配置独立服务器或者虚拟主机的时候会非常有用。

### GNU 信息文档

你可以把它看做帮助手册的“开挂版”。它不仅仅提供工具的帮助信息，而且还是超级链接的形式（没错，在命令行中的超级链接），你可以通过箭头按钮从一个章节导航到另外章节，并按下回车按钮来确认。

一个典型的例子是：

```
# info coreutils
```

因为 coreutils 包含了每个系统中都有的基本文件、shell 和文本处理工具，你自然可以从 coreutils 的 info 文档中得到它们的详细介绍。

![](http://www.tecmint.com/wp-content/uploads/2016/03/Info-Coreutils.png)

*Info Coreutils*

和帮助手册一样，你可以按 q 键退出。

此外，GNU info 还可以显示标准的帮助手册。 例如：

```
# info tune2fs
```

它将显示 **tune2fs**的帮助手册, 这是一个 ext2/3/4 文件系统管理工具。

我们现在看到了，让我们来试试怎么用**tune2fs**：

显示 **/dev/mapper/vg00-vol_backups** 文件系统信息：

```
# tune2fs -l /dev/mapper/vg00-vol_backups
```

修改文件系统标签（修改为 Backups）：

```
# tune2fs -L Backups /dev/mapper/vg00-vol_backups
```

设置文件系统的自检间隔及挂载计数（用`-c` 选项设置挂载计数间隔， 用  `-i` 选项设置自检时间间隔，这里 **d 表示天，w 表示周，m 表示月**)。

```
# tune2fs -c 150 /dev/mapper/vg00-vol_backups # 每 150 次挂载检查一次
# tune2fs -i 6w /dev/mapper/vg00-vol_backups # 每 6 周检查一次
```

以上这些内容也可以通过 `--help` 选项找到，或者查看帮助手册。

### 摘要

不管你选择哪种方法，知道并且会使用它们在考试中对你是非常有用的。你知道其它的一些方法吗? 欢迎给我们留言。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/explore-linux-installed-help-documentation-and-tools/

作者：[Gabriel Cánepa][a]
译者：[kokialoves](https://github.com/kokialoves)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]: https://linux.cn/article-7161-1.html
[2]: http://www.tecmint.com/installing-network-services-and-configuring-services-at-system-boot/
[3]: https://linux.cn/article-7161-1.html
[4]: http://www.tecmint.com/installing-network-services-and-configuring-services-at-system-boot/
[5]: https://linux.cn/article-6132-1.html
[6]: http://www.tecmint.com/configure-squid-server-in-linux/
[7]: http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/

