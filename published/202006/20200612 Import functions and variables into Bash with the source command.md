[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12346-1.html)
[#]: subject: (Import functions and variables into Bash with the source command)
[#]: via: (https://opensource.com/article/20/6/bash-source-command)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 source 命令将函数和变量导入 Bash
======

> source 就像 Python 的 import 或者 Java 的 include。学习它来扩展你的 Bash 能力。

![](https://img.linux.net.cn/data/attachment/album/202006/24/235417tbzjpdbpbzkbjeul.jpg)

登录 Linux shell 时，你将继承特定的工作环境。对于 shell 而言，“<ruby>环境<rt>environment</rt></ruby>”意味着已经为你设置了某些变量，以确保你的命令可以按预期工作。例如，[PATH][2] 环境变量定义 shell 从哪里查找命令。没有它，几乎在 Bash 中尝试执行的所有操作都会因“命令未发现” 错误而失败。在执行日常任务时，环境对你几乎是不可见的，但它很重要。

有多种方法可以影响你的 shell 环境。你可以在配置文件中进行修改，例如 `~/.bashrc` 和 `~/.profile`，你可以在启动时运行服务，还可以创建自己的自定义命令或编写自己的 [Bash 函数][3] 。

### 通过 source 添加到你的环境

Bash（以及其他一些 shell）有一个称为 `source` 的内置命令。这就是令人困惑的地方：`source` 执行与命令 `.` 相同的功能（是的，那只是一个点），而与 `Tcl` 命令的 `source` 不是同一个（如果你输入 `man source`，也许在屏幕上显示的是它）。实际上，内置的 `source` 命令根本不在你的 `PATH` 中。这是 Bash 附带的命令，要获取有关它的更多信息，可以输入 `help source`。

`.` 命令兼容 [POSIX][4]。 但 `source` 命令不是 POSIX 定义的，但可以与 `.` 命令互换使用。

根据 Bash `help`，`source` 命令在你当前的 shell 中执行一个文件。 “在你当前的 shell 中” 这句很重要，因为它表示它不会启动子 shell。因此，用 `source` 执行的任何操作都发生在内部并影响*当前*环境。

在探讨 `source` 对环境的影响之前，请用 `source` 命令导入一个测试文件，以确保其按预期执行代码。首先，创建一个简单的 Bash 脚本并将其保存为 `hello.sh`：

```
#!/usr/bin/env bash
echo "hello world"
```

使用 `source`，即使该脚本不设置可执行也可以运行：

```
$ source hello.sh
hello world
```

你也可以使用内置的 `.` 命令获得相同的结果：

```
$ . hello.sh
hello world
```

`source` 和 `.` 命令成功地执行了测试文件的内容。

### 设置变量和导入函数

 你可以使用 `source` 将文件 “导入” 到 shell 环境中，就像你可以在 C 或 C++ 中使用 `include` 关键字引用一个库，或者在 Python 中使用 `import` 关键字引入一个模块一样。这是 `source` 的最常见用法之一，它也是 `.bashrc`  中的一个默认包含方式，通过 `source` 导入 `.bash_aliases`，以便将任何你自定义的别名在登录时导入到你的环境。

这是导入 Bash 函数的示例。首先，在名为 `myfunctions` 的文件中创建一个函数。它将打印你的公共 IP 地址和本地 IP 地址：

```
function myip() {
        curl <http://icanhazip.com>      

        ip addr | grep inet$IP | \
        cut -d"/" -f 1 | \
        grep -v 127\\.0 | \
        grep -v \:\:1 | \
        awk '{$1=$1};1'
}
```

将该函数导入你的 shell：

```
$ source myfunctions
```

测试新函数：

```
$ myip
93.184.216.34
inet 192.168.0.23
inet6 fbd4:e85f:49c:2121:ce12:ef79:0e77:59d1
inet 10.8.42.38
```

### source 的搜索

当你在 Bash 中使用 `source` 时，它将在当前目录中搜索你引用的文件。但并非所有 shell 都这样，因此，如果你不使用 Bash，请查看文档。

如果 Bash 找不到要执行的文件，它将搜索你的 `PATH`。同样，这并不是所有 shell 的默认设置，因此，如果你不使用 Bash，请查看文档。

这些都是 Bash 中不错的便利功能。这种出奇地强大，因为它允许你将常用函数保存在磁盘上的一个集中的位置，然后将你的环境视为集成开发环境 （IDE）。你不必担心函数的存储位置，因为你知道它们在你的本地位置等同于在 `/usr/include` 下，因此无论你在哪，当你导入它们时，Bash 都可以找到它们。

例如，你可以创建一个名为 `~/.local/include` 的目录作为常见函数存储区，然后将此代码块放入 `.bashrc` 文件中：

```
for i in $HOME/.local/include/*;
  do source $i
done
```

这会将 `~/.local/include` 中所有包含自定义函数的文件“导入”到 shell 环境中。

当你使用 `source` 或 `.` 命令时，Bash 是唯一搜索当前目录和 `PATH` 的 shell。

### 将 source 用于开源

使用 `source` 或 `.` 来执行文件是影响环境同时保持变更模块化的一种便捷方法。在下次考虑将大量代码复制并粘贴到 `.bashrc` 文件中时，请考虑将相关函数或别名组放入专用文件中，然后使用 `source` 导入它们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/bash-source-command

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/17/6/set-path-linux
[3]: https://opensource.com/article/20/6/how-write-functions-bash
[4]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
