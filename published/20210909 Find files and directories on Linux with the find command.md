[#]: subject: "Find files and directories on Linux with the find command"
[#]: via: "https://opensource.com/article/21/9/linux-find-command"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14071-1.html"

使用 find 命令在 Linux 上查找文件和目录
=======================================

> 学习 find 命令的原因有很多。

![](https://img.linux.net.cn/data/attachment/album/202112/11/083907eapzsopvcoc0ooro.jpg)

不管我决心如何组织文件，似乎总有无法找到文件的时候。有时是因为我不记得最初的文件名，其他时候，我知道名字，但我不记得在哪里保存它了。甚至有时我需要一个我最初就没有创建的文件。但是，无论遇到什么困难，我知道在 [POSIX 系统][2] 上，总是有 `find` 命令可以帮助我。

### 安装 find

`find` 命令由 [POSIX 规范][3] 定义，它创建了一个用于衡量 POSIX 系统的开放标准，这包括 Linux、BSD 和 macOS。简而言之，只要你运行的是 Linux、BSD 或 macOS，那么 `find` 已经安装了。

但是，并非所有的 `find` 命令都完全相同。例如，GNU 的 `find` 命令有一些 BSD、Busybox 或 Solaris 上 `find` 命令可能没有或有但实现方式不同的功能。本文使用 [findutils][4] 包中的 GNU `find`，因为它很容易获得且非常流行。本文演示的大多数命令都适用于 `find` 的其他实现，但是如果你在 Linux 以外的平台上尝试命令并得到非预期结果，尝试下载并安装 GNU 版本。

### 按名称查找文件

你可以借助正则表达式使用完整或部分的文件名来定位文件。`find` 命令需要你给出想搜索的目录；指定搜索属性选项，例如，`-name` 用于指定区分大小写的文件名；然后是搜索字符串。默认情况下，搜索字符串按字面意思处理：除非你使用正则表达式语法，否则 `find` 命令搜索的文件名正是你在引号之间输入的字符串。

假设你的 `Documents` 目录包含四个文件：`Foo`、`foo`、`foobar.txt` 和 `foo.xml`。以下是对 `foo` 的字面搜索：

```
$ find ~ -name "foo"
/home/tux/Documents/examples/foo
```

你可以使用 `-iname` 选项使其不区分大小写来扩大搜索范围：

```
$ find ~ -iname "foo"
/home/tux/Documents/examples/foo
/home/tux/Documents/examples/Foo
```

### 通配符

你可以使用基本的 shell 通配符来扩展搜索。例如，`*` 表示任意数量的字符：

```
$ find ~ -iname "foo*"
/home/tux/Documents/examples/foo
/home/tux/Documents/examples/Foo
/home/tux/Documents/examples/foo.xml
/home/tux/Documents/examples/foobar.txt
```

`?` 表示单个字符：

```
$ find ~ -iname "foo*.???"
/home/tux/Documents/examples/foo.xml
/home/tux/Documents/examples/foobar.txt
```

这不是正则表达式语法，因此 `.` 在示例中只表示字母“点”。

### 正则表达式

你还可以使用正则表达式。与 `-iname` 和 `-name` 一样，也有区分大小写和不区分大小写的选项。但不一样的是，`-regex` 和 `-iregex` 搜索应用于整个路径，而不仅仅是文件名。这意味着，如果你搜索 `foo`，你不会得到任何结果，因为 `foo` 与 `/home/tux/Documents/foo` 不匹配。相反，你必须要么搜索整个路径，要么在字符串的开头使用通配符：

```
$ find ~ -iregex ".*foo"
/home/tux/Documents/examples/foo
/home/tux/Documents/examples/Foo
```

### 查找近一周修改过的文件

要查找近一周修改的文件，使用 `-mtime` 选项以及过去的天数（负数）：

```
$ find ~ -mtime -7
/home/tux/Documents/examples/foo
/home/tux/Documents/examples/Foo
/home/tux/Documents/examples/foo.xml
/home/tux/Documents/examples/foobar.txt
```

### 查找近几天修改的文件

你可以结合使用 `-mtime` 选项来查找近几天范围内修改的文件。对于第一个 `-mtime` 参数，表示上一次修改文件的最近天数。第二个参数表示最大天数。例如，搜索修改时间超过 1 天但不超过 7 天的文件：

```
$ find ~ -mtime +1 -mtime -7
```

### 按文件类型限制搜索

指定查找文件的类型来优化 `find` 的结果是很常见的。如果你不确定要查找的内容，则不应该使用此选项。但如果你知道要查找的是文件而不是目录，或者是目录而不是文件，那么这可能是一个很好的过滤器。选项是 `-type`，它的参数是代表不同类型数据的字母代码。最常见的是：

* `d` - 目录
* `f` - 文件
* `l` - 链接文件
* `s` - 套接字
* `p` - 命名管道（用于 FIFO）
* `b` - 块设备（通常是硬盘）

下面是一些例子：

```
$ find ~ -type d -name "Doc*"
/home/tux/Documents
$ find ~ -type f -name "Doc*"
/home/tux/Downloads/10th-Doctor.gif
$ find /dev -type b -name "sda*"
/dev/sda
/dev/sda1
```

### 调整范围

`find` 命令默认是递归的，这意味着它会在指定的目录中层层搜索结果。这在大型文件系统中可能会变得不堪重负，但你可以使用 `-maxdepth` 选项来控制搜索深度：

```
$ find /usr -iname "*xml" | wc -l
15588
$ find /usr -maxdepth 2 -iname "*xml" | wc -l
15
```

也可以使用 `-mindepth` 设置最小递归深度：

```
$ find /usr -mindepth 8 -iname "*xml" | wc -l
9255
```

### 下载速查表

本文仅介绍 `find` 的基本功能，它是一个很好的搜索工具，但对于强大的 [Parallel][5] 命令来说，它也是一个非常有用的前端。学习 `find` 的原因有很多，所以 [下载我们免费的 `find` 速查表][6] 吧，它可以帮助你了解有关该命令的更多信息。

---

via: https://opensource.com/article/21/9/linux-find-command

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[#]: subject:
[#]: via:
[#]: author:
[#]: collector:
[#]: translator:
[#]: reviewer:
[#]: publisher:
[#]: url:
[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/
[4]: https://www.gnu.org/software/findutils/
[5]: https://opensource.com/article/18/5/gnu-parallel
[6]: https://opensource.com/downloads/linux-find-cheat-sheet
