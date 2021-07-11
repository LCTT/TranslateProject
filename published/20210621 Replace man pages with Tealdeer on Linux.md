[#]: subject: (Replace man pages with Tealdeer on Linux)
[#]: via: (https://opensource.com/article/21/6/tealdeer-linux)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)
[#]: collector: (lujun9972)
[#]: translator: (ddl-hust)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13570-1.html)

在 Linux 上使用 Tealdeer 替代手册页
======

> Tealder 是 Rust 版本的 tldr，对常用的命令提供了易于理解的说明信息。

![](https://img.linux.net.cn/data/attachment/album/202107/11/204638catii1ro21jmjzmi.jpg)

手册页是我开始探索 Linux 时最常用的资源。当然，对于初学者熟悉命令行指令而言，`man` 是最频繁使用的指令。但是手册页中有大量的选项和参数列表，很难被解读，这使得你很难理解你想知道的东西。如果你想要一个更简单的解决方案，有基于例子的输出，我认为 [tldr][2] （<ruby>太长不读<rt>too long dnot's read</rt></ruby>）是最好的选择。

### Tealdeer 是什么?

[Tealdeer][3] 是 tldr 的一个基于 Rust 的实现。它是一个社区驱动的手册页，给出了非常简单的命令工作原理的例子。Tealdeer 最棒的地方在于它几乎包含了所有你通常会用到的命令。

### 安装 Tealdeer

在 Linux 系统，你可以从软件仓库安装 Tealdeer，比如在 [Fedora][4] 上:

```
$ sudo dnf install tealdeer
```

在 macOS 可以使用 [MacPorts][5] 或者 [Homebrew][6]。
同样，你可以使用 Rust 的 Cargo 包管理器来编译和安装此工具:

```
$ cargo install tealdeer
```

### 使用 Tealdeer

输入 `tldr-list` 返回 tldr 所支持的手册页，比如 `touch`、`tar`、`dnf`、`docker`、`zcat`、`zgrep` 等：

```
$ tldr --list
2to3
7z
7za
7zr
[
a2disconf
a2dismod
a2dissite
a2enconf
a2enmod
a2ensite
a2query
[...]
```

使用 `tldr` 跟上具体的命令（比如 `tar` ）能够显示基于示例的手册页，描述了你可以用该命令做的所有选项。

```
$ tldr tar

  Archiving utility.
  Often combined with a compression method, such as gzip or bzip2.
  More information: <https://www.gnu.org/software/tar>.

  [c]reate an archive and write it to a [f]ile:

      tar cf target.tar file1 file2 file3

  [c]reate a g[z]ipped archive and write it to a [f]ile:

      tar czf target.tar.gz file1 file2 file3

  [c]reate a g[z]ipped archive from a directory using relative paths:

      tar czf target.tar.gz --directory=path/to/directory .

  E[x]tract a (compressed) archive [f]ile into the current directory [v]erbosely:

      tar xvf source.tar[.gz|.bz2|.xz]

  E[x]tract a (compressed) archive [f]ile into the target directory:

      tar xf source.tar[.gz|.bz2|.xz] --directory=directory

  [c]reate a compressed archive and write it to a [f]ile, using [a]rchive suffix to determine the compression program:

      tar caf target.tar.xz file1 file2 file3
```

如需控制缓存：

```
$ tldr --update
$ tldr --clear-cache
```

你能够控制 Tealdeer 输出的颜色选项，有三种模式选择：一直、自动、从不。默认选项是自动，但我喜欢颜色提供的额外信息，所以我在我的 `~/.bashrc `文件中增加了这个别名：

```
alias tldr='tldr --color always'
```
### 结论

Tealdeer 的美妙之处在于不需要网络连接就可以使用，只有更新缓存的时候才需要联网。因此，即使你处于离线状态，依然能够查找和学习你新学到的命令。更多信息，请查看该工具的 [说明文档][8]。

你会使用 Tealdeer 么？或者你已经在使用了？欢迎留言让我们知道。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/tealdeer-linux

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[ddl-hust](https://github.com/ddl-hust)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/features_solutions_command_data.png?itok=4_VQN3RK (computer screen )
[2]: https://github.com/tldr-pages/tldr
[3]: https://github.com/dbrgn/tealdeer
[4]: https://src.fedoraproject.org/rpms/rust-tealdeer
[5]: https://opensource.com/article/20/11/macports
[6]: https://opensource.com/article/20/6/homebrew-mac
[7]: https://www.gnu.org/software/tar\>
[8]: https://dbrgn.github.io/tealdeer/intro.html
