[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10892-1.html)
[#]: subject: (Duc – A Collection Of Tools To Inspect And Visualize Disk Usage)
[#]: via: (https://www.ostechnix.com/duc-a-collection-of-tools-to-inspect-and-visualize-disk-usage/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Duc：一个能够可视化洞察硬盘使用情况的工具包
======

![Duc：一个能够洞察并可视化硬盘使用情况的工具包][1]

Duc 是一个在类 Unix 操作系统上可以用来索引、洞察及可视化硬盘使用情况的工具包。别把它当成一个仅能用漂亮图表展现硬盘使用情况的 CLI 工具。它对巨大的文件系统也支持的很好。Duc 已在由超过五亿个文件和几 PB 的存储组成的系统上测试过，没有任何问题。

Duc 是一个快速而且灵活的工具。它将你的硬盘使用情况存在一个优化过的数据库里，这样你就可以在索引完成后迅速找到你的数据。此外，它自带不同的用户交互界面与后端以访问数据库并绘制图表。

以下列出的是目前支持的用户界面（UI）：

  1. 命令行界面（`duc ls`）
  2. Ncurses 控制台界面（`duc ui`）
  3. X11 GUI（`duc gui`）
  4. OpenGL GUI（`duc gui`）

支持的后端数据库：
 
  * Tokyocabinet
  * Leveldb
  * Sqlite3

Duc 默认使用 Tokyocabinet 作为后端数据库。

### 安装 Duc

Duc 可以从 Debian 以及其衍生品例如 Ubuntu 的默认仓库中获取。因此在基于 DEB 的系统上安装 Duc 是小菜一碟。

```
$ sudo apt-get install duc
```

在其它 Linux 发行版上你需要像以下所展示的那样手动从源代码编译安装 Duc。

可以从 Github 上的[发行][2]页面下载最新的 Duc 源代码的 .tgz 文件。在写这篇教程的时候，最新的版本是1.4.4。

```
$ wget https://github.com/zevv/duc/releases/download/1.4.4/duc-1.4.4.tar.gz
```

然后一个接一个地运行以下命令来安装 DUC。

```
$ tar -xzf duc-1.4.4.tar.gz
$ cd duc-1.4.4
$ ./configure
$ make
$ sudo make install
```

### 使用 Duc

`duc` 的典型用法是：

```
$ duc <subcommand> <options>
```

你可以通过运行以下命令来浏览总的选项列表以及子命令：

```
$ duc help
```

你也可以像下面这样了解一个特定子命令的用法。

```
$ duc help <subcommand>
```

要查看所有命令与其选项的列表，仅需运行：

```
$ duc help --all
```

让我们看看一些 `duc` 工具的特定用法。

### 创建索引（数据库）

首先，你需要创建一个你文件系统的索引文件（数据库）。使用 `duc index` 命令以创建索引文件。

比如说，要创建你的 `/home` 目录的索引，仅需运行：

```
$ duc index /home
```

上述命令将会创建你的 `/home` 目录的索引，并将其保存在 `$HOME/.duc.db` 文件中。如果你以后需要往 `/home` 目录添加新的文件或目录，只要在之后重新运行一下上面的命令来重建索引。

### 查询索引

Duc 有不同的子命令来查询并探索索引。

要查看可访问的索引列表，运行：

```
$ duc info
```

示例输出：

```
Date Time Files Dirs Size Path
2019-04-09 15:45:55 3.5K 305 654.6M /home
```

如你在上述输出所见，我已经索引好了 `/home` 目录。

要列出当前工作目录中所有的文件和目录，你可以这样做：

```
$ duc ls
```

要列出指定的目录，例如 `/home/sk/Downloads` 中的文件/目录，仅需像下面这样将路径作为参数传过去。

```
$ duc ls /home/sk/Downloads
```

类似的，运行 `duc ui` 命令来打开基于 ncurses 的控制台用户界面以探索文件系统使用情况，运行`duc gui` 以打开图形界面（X11）来探索文件系统。

要了解更多子命令的用法，仅需参考帮助部分。

```
$ duc help ls
```

上述命令将会展现 `ls` 子命令的帮助部分。

### 可视化硬盘使用状况

在之前的部分我们以及看到如何用 duc 子命令列出文件和目录。在此之外，你甚至可以用一张漂亮的图表展示文件大小。

要展示所提供目录的图表，像以下这样使用 `ls` 子命令。

```
$ duc ls -Fg /home/sk
```

示例输出：

![使用 “duc ls” 命令可视化硬盘使用情况][3]

如你在上述输出所见，`ls` 子命令查询 duc 数据库并列出了所提供目录包含的文件与目录的大小，在这里就是 `/home/sk/`。

这里 `-F` 选项是往条目中用来添加文件类型指示符（`/`），`-g` 选项是用来绘制每个条目相对大小的图表。

请注意如果未提供任何路径，就会使用当前工作目录。

你可以使用 `-R` 选项来用[树状结构][4]浏览硬盘使用情况。

```
$ duc ls -R /home/sk
```

![用树状结构可视化硬盘使用情况][5]

要查询 duc 数据库并打开基于 ncurses 的控制台以探索所提供的目录，像以下这样使用 `ui` 子命令。

```
$ duc ui /home/sk
```

![][6]

类似的，我们使用 `gui *` 子命令来查询 duc 数据库以及打开一个图形界面（X11）来了解指定路径的硬盘使用情况。 

```
$ duc gui /home/sk
```

![][7]

像我之前所提到的，我们可以像下面这样了解更多关于特定子命令的用法。

```
$ duc help <子命令名字>
```

我仅仅覆盖了基本用法的部分，参考 man 页面了解关于 `duc` 工具的更多细节。

```
$ man duc
```

相关阅读：

  * [Filelight – 在你的 Linux 系统上可视化硬盘使用情况][8]
  * [一些好的 du 命令的替代品][9]
  * [如何在 Linux 中用 Ncdu 检查硬盘使用情况][10]
  * [Agedu——发现 Linux 中被浪费的硬盘空间][11]
  * [如何在 Linux 中找到目录大小][12]
  * [为初学者打造的带有示例的 df 命令教程][13]

### 总结

Duc 是一款简单却有用的硬盘用量查看器。如果你想要快速简便地知道哪个文件/目录占用你的硬盘空间，Duc 可能是一个好的选择。你还等什么呢？获取这个工具，扫描你的文件系统，摆脱无用的文件/目录。

现在就到此为止了。希望这篇文章有用处。更多好东西马上就到。保持关注！

欢呼吧！

资源：

  * [Duc 网站][14]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/duc-a-collection-of-tools-to-inspect-and-visualize-disk-usage/

作者：[sk][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/duc-720x340.png
[2]: https://github.com/zevv/duc/releases
[3]: http://www.ostechnix.com/wp-content/uploads/2019/04/duc-1-1.png
[4]: https://www.ostechnix.com/view-directory-tree-structure-linux/
[5]: http://www.ostechnix.com/wp-content/uploads/2019/04/duc-2.png
[6]: http://www.ostechnix.com/wp-content/uploads/2019/04/duc-3.png
[7]: http://www.ostechnix.com/wp-content/uploads/2019/04/duc-4.png
[8]: https://www.ostechnix.com/filelight-visualize-disk-usage-on-your-linux-system/
[9]: https://www.ostechnix.com/some-good-alternatives-to-du-command/
[10]: https://www.ostechnix.com/check-disk-space-usage-linux-using-ncdu/
[11]: https://www.ostechnix.com/agedu-find-out-wasted-disk-space-in-linux/
[12]: https://www.ostechnix.com/find-size-directory-linux/
[13]: https://www.ostechnix.com/the-df-command-tutorial-with-examples-for-beginners/
[14]: https://duc.zevv.nl/  
