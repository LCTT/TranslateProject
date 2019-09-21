几个用于替代 du 命令的更好选择
======

![](https://www.ostechnix.com/wp-content/uploads/2018/11/du-command-720x340.jpg)

大家对 `du` 命令应该都不陌生，它可以在类 Unix 系统中对文件和目录的空间使用情况进行计算和汇总。如果你也经常需要使用 `du` 命令，你会对以下内容感兴趣的。我发现了五个可以替代原有的 `du` 命令的更好的工具。当然，如果后续有更多更好的选择，我会继续列出来。如果你有其它推荐，也欢迎在评论中留言。

### ncdu

`ncdu` 作为普通 `du` 的替代品，这在 Linux 社区中已经很流行了。`ncdu` 正是基于开发者们对 `du` 的性能不满意而被开发出来的。`ncdu` 是一个使用 C 语言和 ncurses 接口开发的简易快速的磁盘用量分析器，可以用来查看目录或文件在本地或远程系统上占用磁盘空间的情况。如果你有兴趣查看关于 `ncdu` 的详细介绍，可以浏览《[如何在 Linux 上使用 ncdu 查看磁盘占用量][9]》这一篇文章。

### tin-summer

tin-summer 是使用 Rust 语言编写的自由开源工具，它可以用于查找占用磁盘空间的文件，它也是 `du` 命令的另一个替代品。由于使用了多线程，因此 tin-summer 在计算大目录的大小时会比 `du` 命令快得多。tin-summer 与 `du` 命令之间的区别是前者读取文件的大小，而后者则读取磁盘使用情况。

tin-summer 的开发者认为它可以替代 `du`，因为它具有以下优势：

  * 在大目录的操作速度上比 `du` 更快；
  * 在显示结果上默认采用易读格式；
  * 可以使用正则表达式排除文件或目录；
  * 可以对输出进行排序和着色处理；
  * 可扩展，等等。

**安装 tin-summer**

要安装 tin-summer，只需要在终端中执行以下命令：

```
$ curl -LSfs https://japaric.github.io/trust/install.sh | sh -s -- --git vmchale/tin-summer
```

你也可以使用 `cargo` 软件包管理器安装 tin-summer，但你需要在系统上先安装 Rust。在 Rust 已经安装好的情况下，执行以下命令：

```
$ cargo install tin-summer
```

如果上面提到的这两种方法都不能成功安装 tin-summer，还可以从它的[软件发布页][1]下载最新版本的二进制文件编译，进行手动安装。

**用法**

（LCTT 译注：tin-summer 的命令名为 `sn`）

如果需要查看当前工作目录的文件大小，可以执行以下命令：

```
$ sn f
749 MB   ./.rustup/toolchains
749 MB   ./.rustup
147 MB   ./.cargo/bin
147 MB   ./.cargo
900 MB   .
```

不需要进行额外声明，它也是默认以易读的格式向用户展示数据。在使用 `du` 命令的时候，则必须加上额外的 `-h` 参数才能得到同样的效果。

只需要按以下的形式执行命令，就可以查看某个特定目录的文件大小。

```
$ sn f <path-to-the-directory>
```

还可以对输出结果进行排序，例如下面的命令可以输出指定目录中最大的 5 个文件或目录：

```
$ sn sort /home/sk/ -n5
749 MB /home/sk/.rustup
749 MB /home/sk/.rustup/toolchains
147 MB /home/sk/.cargo
147 MB /home/sk/.cargo/bin
2.6 MB /home/sk/mcelog
900 MB /home/sk/
```

顺便一提，上面结果中的最后一行是指定目录 `/home/sk` 的总大小。所以不要惊讶为什么输入的是 5 而实际输出了 6 行结果。

在当前目录下查找带有构建工程的目录，可以使用以下命令：

```
$ sn ar
```

tin-summer 同样支持查找指定大小的带有构建工程的目录。例如执行以下命令可以查找到大小在 100 MB 以上的带有构建工程的目录：

```
$ sn ar -t100M
```

如上文所说，tin-summer 在操作大目录的时候速度比较快，因此在操作小目录的时候，速度会相对比较慢一些。不过它的开发者已经表示，将会在以后的版本中优化这个缺陷。

要获取相关的帮助，可以执行以下命令：

```
$ sn --help
```

如果想要更详尽的介绍，可以查看[这个项目的 GitHub 页面][10]。

### dust

`dust` （含义是 `du` + `rust` = `dust`）使用 Rust 编写，是一个免费、开源的更直观的 `du` 工具。它可以在不需要 `head` 或`sort` 命令的情况下即时显示目录占用的磁盘空间。与 tin-summer 一样，它会默认情况以易读的格式显示每个目录的大小。 

**安装 dust**

由于 `dust` 也是使用 Rust 编写，因此它也可以通过 `cargo` 软件包管理器进行安装：

```
$ cargo install du-dust
```

也可以从它的[软件发布页][2]下载最新版本的二进制文件，并按照以下步骤安装。在写这篇文章的时候，最新的版本是 0.3.1。

```
$ wget https://github.com/bootandy/dust/releases/download/v0.3.1/dust-v0.3.1-x86_64-unknown-linux-gnu.tar.gz
```

抽取文件：

```
$ tar -xvf dust-v0.3.1-x86_64-unknown-linux-gnu.tar.gz
```

最后将可执行文件复制到你的 `$PATH`（例如 `/usr/local/bin`）下：

```
$ sudo mv dust /usr/local/bin/
```

**用法**

需要查看当前目录及所有子目录下的文件大小，可以执行以下命令：

```
$ dust
```

输出示例：

![](http://www.ostechnix.com/wp-content/uploads/2018/11/dust-1.png)

带上 `-p` 参数可以按照从当前目录起始的完整目录显示。

```
$ dust -p
```

![dust 2][4]

如果需要查看多个目录的大小，只需要同时列出这些目录，并用空格分隔开即可：

```
$ dust <dir1> <dir2>
```

下面再多举几个例子，例如：

显示文件的长度:

```
$ dust -s
```

只显示 10 个目录：

```
$ dust -n 10
```

查看当前目录下最多 3 层子目录：

```
$ dust -d 3
```

查看帮助：

```
$ dust -h
```

如果想要更详尽的介绍，可以查看[这个项目的 GitHub 页面][11]。

### diskus

`diskus` 也是使用 Rust 编写的一个小型、快速的开源工具，它可以用于替代 `du -sh` 命令。`diskus` 将会计算当前目录下所有文件的总大小，它的效果相当于 `du -sh` 或 `du -sh --bytes`，但其开发者表示 `diskus` 的运行速度是 `du -sh` 的 9 倍。

**安装 diskus**

`diskus` 已经存放于 <ruby>Arch Linux 社区用户软件仓库<rt>Arch Linux User-community Repository</rt></ruby>（[AUR][5]）当中，可以通过任何一种 AUR 帮助工具（例如 [`yay`][6]）把它安装在基于 Arch 的系统上：

```
$ yay -S diskus
```

对于 Ubuntu 及其衍生发行版，可以在 `diskus` 的[软件发布页][7]上下载最新版的软件包并安装：

```
$ wget "https://github.com/sharkdp/diskus/releases/download/v0.3.1/diskus_0.3.1_amd64.deb"

$ sudo dpkg -i diskus_0.3.1_amd64.deb
```

还可以使用 `cargo` 软件包管理器安装 `diskus`，但必须在系统上先安装 Rust 1.29+。

安装好 Rust 之后，就可以使用以下命令安装 `diskus`：

```
$ cargo install diskus
```

**用法**

在通常情况下，如果需要查看某个目录的大小，我会使用形如 `du -sh` 的命令。

```
$ du -sh dir
```

这里的 `-s` 参数表示显示总大小。

如果使用 `diskus`，直接就可以显示当前目录的总大小。

```
$ diskus
```

![](https://www.ostechnix.com/wp-content/uploads/2018/11/diskus-in-action.png)

我使用 `diskus` 查看 Arch Linux 系统上各个目录的总大小，这个工具的速度确实比 `du -sh` 快得多。但是它目前只能显示当前目录的大小。

要获取相关的帮助，可以执行以下命令：

```
$ diskus -h
```

如果想要更详尽的介绍，可以查看[这个项目的 GitHub 页面][12]。

### duu

`duu` 是 Directory Usage Utility 的缩写。它是使用 Python 编写的查看指定目录大小的工具。它具有跨平台的特性，因此在 Windows、Mac OS 和 Linux 系统上都能够使用。

**安装 duu**

安装这个工具之前需要先安装 Python 3。不过目前很多 Linux 发行版的默认软件仓库中都带有 Python 3，所以这个依赖并不难解决。

Python 3 安装完成后，从 `duu` 的[软件发布页][8]下载其最新版本。

```
$ wget https://github.com/jftuga/duu/releases/download/2.20/duu.py
```

**用法**

要查看当前目录的大小，只需要执行以下命令：

```
$ python3 duu.py
```

输出示例：

![](https://www.ostechnix.com/wp-content/uploads/2018/11/duu.png)

从上图可以看出，`duu` 会显示当前目录下文件的数量情况，按照 Byte、KB、MB 单位显示这些文件的总大小，以及每个文件的大小。

如果需要查看某个目录的大小，只需要声明目录的绝对路径即可：

```
$ python3 duu.py /home/sk/Downloads/
```

如果想要更详尽的介绍，可以查看[这个项目的 GitHub 页面][13]。

以上就是 `du` 命令的五种替代方案，希望这篇文章能够帮助到你。就我自己而言，我并不会在这五种工具之间交替使用，我更喜欢使用 `ncdu`。欢迎在下面的评论区发表你对这些工具的评论。



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/some-good-alternatives-to-du-command/

作者：[SK][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://github.com/vmchale/tin-summer/releases
[2]: https://github.com/bootandy/dust/releases
[3]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]: http://www.ostechnix.com/wp-content/uploads/2018/11/dust-2.png
[5]: https://aur.archlinux.org/packages/diskus-bin/
[6]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[7]: https://github.com/sharkdp/diskus/releases
[8]: https://github.com/jftuga/duu/releases
[9]: https://www.ostechnix.com/check-disk-space-usage-linux-using-ncdu/
[10]: https://github.com/vmchale/tin-summer
[11]: https://github.com/bootandy/dust
[12]: https://github.com/sharkdp/diskus
[13]: https://github.com/jftuga/duu

