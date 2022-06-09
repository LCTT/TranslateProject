[#]: subject: "Dynamically linking libraries while compiling code"
[#]: via: "https://opensource.com/article/22/5/compile-code-ldlibrarypath"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14690-1.html"

编译代码时动态地链接库
======

![](https://linux.cn/article-14690-1.html)

> 编译软件在你如何运行你的系统方面给你很大的灵活性。`LD_LIBRARY_PATH` 变量，以及 GCC 的 `-L` 和 `-l` 选项，是这种灵活性的组成部分。

编译软件是开发者经常做的事情，在开源世界中，一些用户甚至选择自己动手。Linux 播客 Dann Washko 称源码为“通用包格式”，因为它包含了使一个应用在任何平台上运行所需的所有组件。当然，并不是所有的源码都是为所有的系统编写的，所以它只是在目标系统的子集内是“通用”的，但问题是，源码是非常灵活的。有了开源，你可以决定代码的编译和运行方式。

当你在编译代码时，你通常要处理多个源文件。开发人员倾向于将不同的类或模块放在不同的文件中，这样它们可以被单独维护，甚至可能被不同的项目使用。但当你编译这些文件时，许多文件会被编译成一个可执行文件。

这通常是通过创建共享库来完成的，然后从可执行文件中动态链接回它们。这样可以通过保持模块化功能的外部性来保持可执行文件的小型化，并确保库可以独立于使用它们的应用而被更新。

### 在编译过程中定位一个共享对象

当你 [用 GCC 编译][2] 时，你通常需要在你的工作站上安装一个库，以便 GCC 能够定位到它。默认情况下，GCC 假定库在系统库路径中，例如 `/lib64` 和 `/usr/lib64`。然而，如果你要链接到一个你自己的尚未安装的库，或者你需要链接到一个没有安装在标准位置的库，那么你必须帮助 GCC 找到这些文件。

有两个选项对于在 GCC 中寻找库很重要：

* `-L`（大写字母 L）在 GCC 的搜索位置上增加一个额外的库路径。
* `-l`（小写字母 L）设置你要链接的库的名字。

例如，假设你写了一个叫做 `libexample.so` 的库，并且你想在编译你的应用 `demo.c` 时使用它。首先，从 `demo.c` 创建一个对象文件：

```
$ gcc -I ./include -c src/demo.c
```

`-I` 选项在 GCC 搜索头文件的路径中增加了一个目录。在这个例子中，我假设自定义头文件在一个名为 `include` 的本地目录中。`-c` 选项防止 GCC 运行链接器，因为这个任务只是为了创建一个对象文件。结果如下：

```
$ ls
demo.o   include/   lib/    src/
```

现在你可以使用 `-L` 选项为你的库设置一个路径，然后进行编译：

```
$ gcc -L`pwd`/lib -o myDemo demo.o -lexample
```

注意，`-L` 选项在 `-l` 选项*之前*。这很重要，因为如果在你告诉 GCC 查找非默认库之前没有将 `-L` 添加到 GCC 的搜索路径中，GCC 就不知道要在你的自定义位置上搜索。编译成功了，但当你试图运行它时，却出现了问题：

```
$ ./myDemo
./myDemo: error while loading shared libraries:
libexample.so: cannot open shared object file:
No such file or directory
```

### 用 ldd 排除故障

`ldd` 工具可以打印出共享对象的依赖关系，它在排除类似问题时很有用：

```
$ ldd ./myDemo
        linux-vdso.so.1 (0x00007ffe151df000)
        libexample.so => not found
        libc.so.6 => /lib64/libc.so.6 (0x00007f514b60a000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f514b839000)
```

你已经知道定位不到 `libexample`，但 `ldd` 输出至少确认了它对*工作*库的期望位置。例如，`libc.so.6 `已经被定位，`ldd` 显示其完整路径。

### LD_LIBRARY_PATH

`LD_LIBRARY_PATH` [环境变量][3] 定义了库的路径。如果你正在运行一个依赖于没有安装到标准目录的库的应用程，你可以使用 `LD_LIBRARY_PATH` 添加到系统的库搜索路径。

有几种设置环境变量的方法，但最灵活的是在运行命令前放置环境变量。看看设置 `LD_LIBRARY_PATH` 对 `ldd` 命令在分析一个“损坏”的可执行文件时的作用：

```
$ LD_LIBRARY_PATH=`pwd`/lib ldd ./
   linux-vdso.so.1 (0x00007ffe515bb000)
   libexample.so => /tmp/Demo/lib/libexample.so (0x0000...
   libc.so.6 => /lib64/libc.so.6 (0x00007eff037ee000)
   /lib64/ld-linux-x86-64.so.2 (0x00007eff03a22000)
```

这也同样适用于你的自定义命令：

```
$ LD_LIBRARY_PATH=`pwd`/lib myDemo
hello world!
```

然而，如果你移动库文件或可执行文件，它又会失效：

```
$ mv lib/libexample.so ~/.local/lib64
$ LD_LIBRARY_PATH=`pwd`/lib myDemo
./myDemo: error while loading shared libraries...
```

要修复它，你必须调整 `LD_LIBRARY_PATH` 以匹配库的新位置：

```
$ LD_LIBRARY_PATH=~/.local/lib64 myDemo
hello world!
```

### 何时使用 LD_LIBRARY_PATH

在大多数情况下，`LD_LIBRARY_PATH` 不是你需要设置的变量。按照设计，库安装到 `/usr/lib64` 中，因此应用自然会在其中搜索所需的库。在两种情况下，你可能需要使用 `LD_LIBRARY_PATH`：

* 你正在编译的软件需要链接到本身刚刚编译但尚未安装的库。良好设计的构建系统，例如 [Autotools][4] 和 [CMake][5]，可以帮助处理这个问题。
* 你正在使用设计为在单个目录之外运行的软件，它没有安装脚本，或安装脚本将库放置在非标准目录中。一些应用具有 Linux 用户可以下载、复制到 `/opt` 并在“不安装”的情况下运行的版本。`LD_PATH_LIBRARY` 变量是通过封装脚本设置的，因此用户通常甚至不知道它已被设置。

编译软件为你在运行系统方面提供了很大的灵活性。`LD_LIBRARY_PATH` 变量以及 `-L` 和 `-l` GCC 选项是这种灵活性的组成部分。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/compile-code-ldlibrarypath

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/collab-team-pair-programming-code-keyboard2.png
[2]: https://opensource.com/article/22/5/what-happens-behind-scenes-during-gcc-compilation-c-programs
[3]: https://opensource.com/article/19/8/what-are-environment-variables
[4]: https://opensource.com/article/19/7/introduction-gnu-autotools
[5]: https://opensource.com/article/21/5/cmake
