[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11536-1.html)
[#]: subject: (SQLite is really easy to compile)
[#]: via: (https://jvns.ca/blog/2019/10/28/sqlite-is-really-easy-to-compile/)
[#]: author: (Julia Evans https://jvns.ca/)

SQLite 真的很容易编译
======

![](https://img.linux.net.cn/data/attachment/album/201911/04/120656cedfznzenxxvmxq1.jpg)

上周，我一直在做一个 SQL 网站（<https://sql-steps.wizardzines.com/>，一个 SQL 示例列表）。我使用 sqlite 运行网站上的所有查询，并且我想在其中一个例子（[这个][1]）中使用窗口函数。

但是我使用的是 Ubuntu 18.04 中的 sqlite 版本，它太旧了，不支持窗口函数。所以我需要升级 sqlite！

事实证明，这个过程超麻烦（如通常一样），但是非常有趣！我想起了一些有关可执行文件和共享库如何工作的信息，结论令人满意。所以我想在这里写下来。

（剧透：<https://www.sqlite.org/howtocompile.html> 中解释了如何编译 SQLite，它只需花费 5 秒左右，这比我平时从源码编译的体验容易了许多。）

### 尝试 1：从它的网站下载 SQLite 二进制文件

[SQLite 的下载页面][2]有一个用于 Linux 的 SQLite 命令行工具的二进制文件的链接。我下载了它，它可以在笔记本电脑上运行，我以为这就完成了。

但是后来我尝试在构建服务器（Netlify） 上运行它，得到了这个极其奇怪的错误消息：“File not found”。我进行了追踪，并确定 `execve` 返回错误代码 ENOENT，这意味着 “File not found”。这有点令人发狂，因为该文件确实存在，并且有正确的权限。

我搜索了这个问题（通过搜索 “execve enoen”），找到了[这个 stackoverflow 中的答案][3]，它指出要运行二进制文件，你不仅需要二进制文件存在！你还需要它的**加载程序**才能存在。（加载程序的路径在二进制文件内部）

要查看加载程序的路径，可以使用 `ldd`，如下所示：

```
$ ldd sqlite3
    linux-gate.so.1 (0xf7f9d000)
    libdl.so.2 => /lib/i386-linux-gnu/libdl.so.2 (0xf7f70000)
    libm.so.6 => /lib/i386-linux-gnu/libm.so.6 (0xf7e6e000)
    libz.so.1 => /lib/i386-linux-gnu/libz.so.1 (0xf7e4f000)
    libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7c73000)
    /lib/ld-linux.so.2
```

所以  `/lib/ld-linux.so.2` 是加载程序，而该文件在构建服务器上不存在，可能是因为 Xenial（Xenial 是 Ubuntu 16.04，本文应该使用的是 18.04 “Bionic Beaver”）安装程序不支持 32 位二进制文​​件（？），因此我需要尝试一些不同的东西。

### 尝试 2：安装 Debian sqlite3 软件包

好吧，我想我也许可以安装来自 [debian testing 的 sqlite 软件包][4]。尝试从另一个我不使用的 Debian 版本安装软件包并不是一个好主意，但是出于某种原因，我还是决定尝试一下。

这次毫不意外地破坏了我计算机上的 sqlite（这也破坏了 git），但我设法通过 `sudo dpkg --purge --force-all libsqlite3-0` 恢复了，并使所有依赖于 sqlite 的软件再次工作。

### 尝试 3：提取 Debian sqlite3 软件包

我还尝试仅从 Debian sqlite 软件包中提取 sqlite3 二进制文件并运行它。毫不意外，这也行不通，但这个更容易理解：我有旧版本的 libreadline（`.so.7`），但它需要 `.so.8`。

```
$ ./usr/bin/sqlite3
./usr/bin/sqlite3: error while loading shared libraries: libreadline.so.8: cannot open shared object file: No such file or directory
```

### 尝试 4：从源代码进行编译

我花费这么多时间尝试下载 sqlite 二进制的原因是我认为从源代码编译 sqlite 既烦人又耗时。但是显然，下载随便一个 sqlite 二进制文件根本不适合我，因此我最终决定尝试自己编译它。

这有指导：[如何编译 SQLite][5]。它是宇宙中最简单的东西。通常，编译的感觉是类似这样的：

  * 运行 `./configure`
  * 意识到我缺少依赖
  * 再次运行 `./configure`
  * 运行 `make`
  * 编译失败，因为我安装了错误版本的依赖
  * 去做其他事，之后找到二进制文件

编译 SQLite 的方式如下：

  * [从下载页面下载整合的 tarball][2]
  * 运行 `gcc shell.c sqlite3.c -lpthread -ldl`
  * 完成！！！

所有代码都在一个文件（`sqlite.c`）中，并且没有奇怪的依赖项！太奇妙了。

对我而言，我实际上并不需要线程支持或 readline 支持，因此我用编译页面上的说明来创建了一个非常简单的二进制文件，它仅使用了 libc 而没有其他共享库。

```
$ ldd sqlite3
    linux-vdso.so.1 (0x00007ffe8e7e9000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fbea4988000)
    /lib64/ld-linux-x86-64.so.2 (0x00007fbea4d79000)
```

### 这很好，因为它使体验 sqlite 变得容易

我认为 SQLite 的构建过程如此简单很酷，因为过去我很乐于[编辑 sqlite 的源码][6]来了解其 B 树的实现方式。

鉴于我对 SQLite 的了解，这并不令人感到意外（它在受限环境/嵌入式中确实可以很好地工作，因此可以以一种非常简单/最小的方式进行编译是有意义的）。 但这真是太好了！

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/10/28/sqlite-is-really-easy-to-compile/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://sql-steps.wizardzines.com/lag.html
[2]: https://www.sqlite.org/download.html
[3]: https://stackoverflow.com/questions/5234088/execve-file-not-found-when-stracing-the-very-same-file
[4]: https://packages.debian.org/bullseye/amd64/sqlite3/download
[5]: https://www.sqlite.org/howtocompile.html
[6]: https://jvns.ca/blog/2014/10/02/how-does-sqlite-work-part-2-btrees/
