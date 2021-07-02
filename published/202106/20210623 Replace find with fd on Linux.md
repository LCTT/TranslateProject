[#]: subject: (Replace find with fd on Linux)
[#]: via: (https://opensource.com/article/21/6/fd-linux)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13516-1.html)

在 Linux 上用 fd 代替 find
======

> fd 命令是一个流行的、用户友好的 find 命令的替代品。

![](https://img.linux.net.cn/data/attachment/album/202106/24/110546npqmttwobtqpo4qk.jpg)

许多 Linux 程序员在其工作中每天都在使用 `find` 命令。但是 `find` 给出的文件系统条目是有限的，如果你要进行大量的 `find` 操作，它甚至不是很快速。因此，我更喜欢使用 Rust 编写的 `fd` 命令，因为它提供了合理的默认值，适用于大多数使用情况。

正如它的 [README][2] 所说，“`fd` 是一个在文件系统中寻找条目的程序。它是一个简单、快速和用户友好的 `find` 的替代品。”它的特点是目录的并行遍历，可以一次搜索多个目录。它支持正则表达式（regex）和基于通配符的模式。

### 安装 fd

在 Linux 上，你可以从你的软件库中安装 `fd`（可用的软件包列表可以在 [Repology 上的 fd 页面][3] 找到）。 例如，在 Fedora 上：

```
$ sudo dnf install fd-find
```

在 macOS 上，可以使用 [MacPorts][4] 或 [Homebrew][5]。

另外，你也可以使用 Rust 的 Cargo 软件包管理器：

```
$ cargo install fd-find
```

### 使用 fd

要做一个简单的搜索，运行 `fd` 并在后面跟上要搜索的名字，例如：

```
$ fd sh
registry/src/github.com-1ecc6299db9ec823/cc-1.0.67/src/bin/gcc-shim.rs
registry/src/github.com-1ecc6299db9ec823/exa-0.10.1/completions/completions.bash
registry/src/github.com-1ecc6299db9ec823/exa-0.10.1/completions/completions.fish
registry/src/github.com-1ecc6299db9ec823/exa-0.10.1/completions/completions.zsh
registry/src/github.com-1ecc6299db9ec823/exa-0.10.1/xtests/run.sh
registry/src/github.com-1ecc6299db9ec823/git2-0.13.18/src/stash.rs
registry/src/github.com-1ecc6299db9ec823/libc-0.2.94/src/unix/solarish
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/cmake/SelectHashes.cmake
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/include/git2/stash.h
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/include/git2/sys/hashsig.h
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/script/backport.sh
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/script/leaks.sh
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/script/valgrind.sh
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/src/config_snapshot.c
[...]
```

如果你想搜索一个特定的目录，可以将目录路径作为 `fd` 的第二个参数，例如：

```
$ fd passwd /etc
/etc/pam.d/passwd
/etc/passwd
/etc/passwd-
/etc/security/opasswd
```

要搜索一个特定的文件扩展名，使用 `-e` 作为选项。例如：

```
$ fd . '/home/ssur/exa' -e md
/home/ssur/exa/README.md
/home/ssur/exa/devtools/README.md
/home/ssur/exa/man/exa.1.md
/home/ssur/exa/man/exa_colors.5.md
/home/ssur/exa/xtests/README.md
$
```

你也可以通过提供 `-x` 或 `-X` 来执行一个命令。

  * `-x`/`--exec`：选项为每个搜索结果（并行）运行一个外部命令。
  * `-X`/`--exec-batch`：选项将所有搜索结果作为参数启动一次外部命令。

例如，要递归地找到所有的 ZIP 档案并解压：

```
$ fd -e zip -x unzip
```

或者，要列出某个特定目录下在过去 _n_ 天内改变的所有文件，使用`--changed-within` 选项：

```
$ fd . '/home/ssur/Work/' --changed-within 10d
/home/ssur/Work/wildfly/connector/src/main/java/org/jboss/as/connector/subsystems/data_sources/JdbcDriverAdd.java
/home/ssur/Work/wildfly/connector/src/main/java/org/jboss/as/connector/subsystems/data_sources/JdbcExample.java
[...]
```

而要搜索所有在特定天数之前被修改的文件，请使用 `--changed-before` _n_ 选项：

```
$ fd . '/home/ssur/Work/' --changed-before 365d
```

这里，`.` 作为一个（正则）通配符，指示 `fd` 返回所有文件。

要了解更多关于 `fd` 的功能，请查阅 GitHub 上的 [文档][2]。

### 总结

我特别喜欢 `fd` 的一点是，搜索模式默认是不区分大小写的，这使得它更容易找到东西，即使你对你要找的东西没有精确的认识。更好的是，如果模式包含一个大写的字符，它就会*自动*切换到大小写敏感。

另一个好处是，它使用颜色编码来突出不同的文件类型。

如果你已经在使用这个神奇的 Rust 工具，请在评论中告诉我们你的想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/fd-linux

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://github.com/sharkdp/fd
[3]: https://repology.org/project/fd-find/versions
[4]: https://opensource.com/article/20/11/macports
[5]: https://opensource.com/article/20/6/homebrew-mac
