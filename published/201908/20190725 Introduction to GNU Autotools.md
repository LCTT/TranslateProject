[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11218-1.html)
[#]: subject: (Introduction to GNU Autotools)
[#]: via: (https://opensource.com/article/19/7/introduction-gnu-autotools)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

GNU Autotools 介绍
======

> 如果你仍未使用过 Autotools，那么这篇文章将改变你递交代码的方式。

![](https://img.linux.net.cn/data/attachment/album/201908/13/094739ahql50gx9x10y157.jpg)

你有没有下载过流行的软件项目的源代码，要求你输入几乎是仪式般的 `./configure; make && make install` 命令序列来构建和安装它？如果是这样，你已经使用过 [GNU Autotools][2] 了。如果你曾经研究过这样的项目所附带的一些文件，你可能会对这种构建系统的显而易见的复杂性感到害怕。

好的消息是，GNU Autotools 的设置要比你想象的要简单得多，GNU Autotools 本身可以为你生成这些上千行的配置文件。是的，你可以编写 20 或 30 行安装代码，并免费获得其他 4,000 行。

### Autotools 工作方式

如果你是初次使用 Linux 的用户，正在寻找有关如何安装应用程序的信息，那么你不必阅读本文！如果你想研究如何构建软件，欢迎阅读它；但如果你只是要安装一个新应用程序，请阅读我在[在 Linux 上安装应用程序][3]的文章。

对于开发人员来说，Autotools 是一种管理和打包源代码的快捷方式，以便用户可以编译和安装软件。 Autotools 也得到了主要打包格式（如 DEB 和 RPM）的良好支持，因此软件存储库的维护者可以轻松管理使用 Autotools 构建的项目。

Autotools 工作步骤：

1. 首先，在 `./configure` 步骤中，Autotools 扫描宿主机系统（即当前正在运行的计算机）以发现默认设置。默认设置包括支持库所在的位置，以及新软件应放在系统上的位置。
2. 接下来，在 `make` 步骤中，Autotools 通常通过将人类可读的源代码转换为机器语言来构建应用程序。
3. 最后，在 `make install` 步骤中，Autotools 将其构建好的文件复制到计算机上（在配置阶段检测到）的相应位置。

这个过程看起来很简单，和你使用 Autotools 的步骤一样。

### Autotools 的优势

GNU Autotools 是我们大多数人认为理所当然的重要软件。与 [GCC（GNU 编译器集合）][4]一起，Autotools 是支持将自由软件构建和安装到正在运行的系统的脚手架。如果你正在运行 [POSIX][5] 系统，可以毫不保守地说，你的计算机上的操作系统里大多数可运行软件都是这些这样构建的。

即使是你的项目是个玩具项目不是操作系统，你可能会认为 Autotools 对你的需求来说太过分了。但是，尽管它的名气很大，Autotools 有许多可能对你有益的小功能，即使你的项目只是一个相对简单的应用程序或一系列脚本。

#### 可移植性

首先，Autotools 考虑到了可移植性。虽然它无法使你的项目在所有 POSIX 平台上工作（这取决于你，编码的人），但 Autotools 可以确保你标记为要安装的文件安装到已知平台上最合理的位置。而且由于 Autotools，高级用户可以轻松地根据他们自己的系统情况定制和覆盖任何非最佳设定。

使用 Autotools，你只要知道需要将文件安装到哪个常规位置就行了。它会处理其他一切。不需要可能破坏未经测试的操作系统的定制安装脚本。

#### 打包

Autotools 也得到了很好的支持。将一个带有 Autotools 的项目交给一个发行版打包者，无论他们是打包成 RPM、DEB、TGZ 还是其他任何东西，都很简单。打包工具知道 Autotools，因此可能不需要修补、魔改或调整。在许多情况下，将 Autotools 项目结合到流程中甚至可以实现自动化。

### 如何使用 Autotools

要使用 Autotools，必须先安装它。你的发行版可能提供一个单个的软件包来帮助开发人员构建项目，或者它可能为每个组件提供了单独的软件包，因此你可能需要在你的平台上进行一些研究以发现需要安装的软件包。

Autotools 的组件是：

  * `automake`
  * `autoconf`
  * `automake`
  * `make`

虽然你可能需要安装项目所需的编译器（例如 GCC），但 Autotools 可以很好地处理不需要编译的脚本或二进制文件。实际上，Autotools 对于此类项目非常有用，因为它提供了一个 `make uninstall` 脚本，以便于删除。

安装了所有组件之后，现在让我们了解一下你的项目文件的组成结构。

#### Autotools 项目结构

GNU Autotools 有非常具体的预期规范，如果你经常下载和构建源代码，可能大多数都很熟悉。首先，源代码本身应该位于一个名为 `src` 的子目录中。

你的项目不必遵循所有这些预期规范，但如果你将文件放在非标准位置（从 Autotools 的角度来看），那么你将不得不稍后在 `Makefile` 中对其进行调整。

此外，这些文件是必需的：

  * `NEWS`
  * `README`
  * `AUTHORS`
  * `ChangeLog`

你不必主动使用这些文件，它们可以是包含所有信息的单个汇总文档（如 `README.md`）的符号链接，但它们必须存在。

#### Autotools 配置

在你的项目根目录下创建一个名为 `configure.ac` 的文件。`autoconf` 使用此文件来创建用户在构建之前运行的 `configure` shell 脚本。该文件必须至少包含 `AC_INIT` 和 `AC_OUTPUT` [M4 宏][6]。你不需要了解有关 M4 语言的任何信息就可以使用这些宏；它们已经为你编写好了，并且所有与 Autotools 相关的内容都在该文档中定义好了。

在你喜欢的文本编辑器中打开该文件。`AC_INIT` 宏可以包括包名称、版本、报告错误的电子邮件地址、项目 URL 以及可选的源 TAR 文件名称等参数。

[AC_OUTPUT][7] 宏更简单，不用任何参数。

```
AC_INIT([penguin], [2019.3.6], [[seth@example.com][8]])
AC_OUTPUT
```

如果你此刻运行 `autoconf`，会依据你的 `configure.ac` 文件生成一个 `configure` 脚本，它是可以运行的。但是，也就是能运行而已，因为到目前为止你所做的就是定义项目的元数据，并要求创建一个配置脚本。

你必须在 `configure.ac` 文件中调用的下一个宏是创建 [Makefile][9] 的函数。 `Makefile` 会告诉 `make` 命令做什么（通常是如何编译和链接程序）。

创建 `Makefile` 的宏是 `AM_INIT_AUTOMAKE`，它不接受任何参数，而 `AC_CONFIG_FILES` 接受的参数是你要输出的文件的名称。

最后，你必须添加一个宏来考虑你的项目所需的编译器。你使用的宏显然取决于你的项目。如果你的项目是用 C++ 编写的，那么适当的宏是 `AC_PROG_CXX`，而用 C 编写的项目需要 `AC_PROG_CC`，依此类推，详见 Autoconf 文档中的 [Building Programs and Libraries][10] 部分。

例如，我可能会为我的 C++ 程序添加以下内容：

```
AC_INIT([penguin], [2019.3.6], [[seth@example.com][8]])
AC_OUTPUT
AM_INIT_AUTOMAKE
AC_CONFIG_FILES([Makefile])
AC_PROG_CXX
```

保存该文件。现在让我们将目光转到 `Makefile`。

#### 生成 Autotools Makefile

`Makefile` 并不难手写，但 Autotools 可以为你编写一个，而它生成的那个将使用在 `./configure` 步骤中检测到的配置选项，并且它将包含比你考虑要包括或想要自己写的还要多得多的选项。然而，Autotools 并不能检测你的项目构建所需的所有内容，因此你必须在文件 `Makefile.am` 中添加一些细节，然后在构造 `Makefile` 时由 `automake` 使用。

`Makefile.am` 使用与 `Makefile` 相同的语法，所以如果你曾经从头开始编写过 `Makefile`，那么这个过程将是熟悉和简单的。通常，`Makefile.am` 文件只需要几个变量定义来指示要构建的文件以及它们的安装位置即可。

以 `_PROGRAMS` 结尾的变量标识了要构建的代码（这通常被认为是<ruby>原语<rt>primary</rt></ruby>目标；这是 `Makefile` 存在的主要意义）。Automake 也会识别其他原语，如 `_SCRIPTS`、`_ DATA`、`_LIBRARIES`，以及构成软件项目的其他常见部分。

如果你的应用程序在构建过程中需要实际编译，那么你可以用 `bin_PROGRAMS` 变量将其标记为二进制程序，然后使用该程序名称作为变量前缀引用构建它所需的源代码的任何部分（这些部分可能是将被编译和链接在一起的一个或多个文件）：
 
```
bin_PROGRAMS = penguin
penguin_SOURCES = penguin.cpp
```

`bin_PROGRAMS` 的目标被安装在 `bindir` 中，它在编译期间可由用户配置。

如果你的应用程序不需要实际编译，那么你的项目根本不需要 `bin_PROGRAMS` 变量。例如，如果你的项目是用 Bash、Perl 或类似的解释语言编写的脚本，那么定义一个 `_SCRIPTS` 变量来替代：

```
bin_SCRIPTS = bin/penguin
```

Automake 期望源代码位于名为 `src` 的目录中，因此如果你的项目使用替代目录结构进行布局，则必须告知 Automake 接受来自外部源的代码：

```
AUTOMAKE_OPTIONS = foreign subdir-objects
```

最后，你可以在 `Makefile.am` 中创建任何自定义的 `Makefile` 规则，它们将逐字复制到生成的 `Makefile` 中。例如，如果你知道一些源代码中的临时值需要在安装前替换，则可以为该过程创建自定义规则：

```
all-am: penguin
        touch bin/penguin.sh
       
penguin: bin/penguin.sh
        @sed "s|__datadir__|@datadir@|" $&lt; &gt;bin/$@
```

一个特别有用的技巧是扩展现有的 `clean` 目标，至少在开发期间是这样的。`make clean` 命令通常会删除除了 Automake 基础结构之外的所有生成的构建文件。它是这样设计的，因为大多数用户很少想要 `make clean` 来删除那些便于构建代码的文件。

但是，在开发期间，你可能需要一种方法可靠地将项目返回到相对不受 Autotools 影响的状态。在这种情况下，你可能想要添加：

```
clean-local:
        @rm config.status configure config.log
        @rm Makefile
        @rm -r autom4te.cache/
        @rm aclocal.m4
        @rm compile install-sh missing Makefile.in
```

这里有很多灵活性，如果你还不熟悉 `Makefile`，那么很难知道你的 `Makefile.am` 需要什么。最基本需要的是原语目标，无论是二进制程序还是脚本，以及源代码所在位置的指示（无论是通过 `_SOURCES` 变量还是使用 `AUTOMAKE_OPTIONS` 告诉 Automake 在哪里查找源代码）。

一旦定义了这些变量和设置，如下一节所示，你就可以尝试生成构建脚本，并调整缺少的任何内容。

#### 生成 Autotools 构建脚本

你已经构建了基础结构，现在是时候让 Autotools 做它最擅长的事情：自动化你的项目工具。对于开发人员（你），Autotools 的接口与构建代码的用户的不同。

构建者通常使用这个众所周知的顺序：

```
$ ./configure
$ make
$ sudo make install
```

但是，要使这种咒语起作用，你作为开发人员必须引导构建这些基础结构。首先，运行 `autoreconf` 以生成用户在运行 `make` 之前调用的 `configure` 脚本。使用 `-install` 选项将辅助文件（例如符号链接）引入到 `depcomp`（这是在编译过程中生成依赖项的脚本），以及 `compile` 脚本的副本（一个编译器的包装器，用于说明语法，等等）。

```
$ autoreconf --install
configure.ac:3: installing './compile'
configure.ac:2: installing './install-sh'
configure.ac:2: installing './missing'
```

使用此开发构建环境，你可以创建源代码分发包：

```
$ make dist
```

`dist` 目标是从 Autotools “免费”获得的规则。这是一个内置于 `Makefile` 中的功能，它是通过简单的 `Makefile.am` 配置生成的。该目标可以生成一个 `tar.gz` 存档，其中包含了所有源代码和所有必要的 Autotools 基础设施，以便下载程序包的人员可以构建项目。

此时，你应该仔细查看存档文件的内容，以确保它包含你要发送给用户的所有内容。当然，你也应该尝试自己构建：

```
$ tar --extract --file penguin-0.0.1.tar.gz
$ cd penguin-0.0.1
$ ./configure
$ make
$ DESTDIR=/tmp/penguin-test-build make install
```

如果你的构建成功，你将找到由 `DESTDIR` 指定的已编译应用程序的本地副本（在此示例的情况下为 `/tmp/penguin-test-build`）。

```
$ /tmp/example-test-build/usr/local/bin/example
hello world from GNU Autotools
```

### 去使用 Autotools

Autotools 是一个很好的脚本集合，可用于可预测的自动发布过程。如果你习惯使用 Python 或 Bash 构建器，这个工具集对你来说可能是新的，但它为你的项目提供的结构和适应性可能值得学习。

而 Autotools 也不只是用于代码。Autotools 可用于构建 [Docbook][11] 项目，保持媒体有序（我使用 Autotools 进行音乐发布），文档项目以及其他任何可以从可自定义安装目标中受益的内容。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/introduction-gnu-autotools

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_kernel_clang_vscode.jpg?itok=fozZ4zrr (Linux kernel source code (C) in Visual Studio Code)
[2]: https://www.gnu.org/software/automake/faq/autotools-faq.html
[3]: https://linux.cn/article-9486-1.html
[4]: https://en.wikipedia.org/wiki/GNU_Compiler_Collection
[5]: https://en.wikipedia.org/wiki/POSIX
[6]: https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Initializing-configure.html
[7]: https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Output.html#Output
[8]: mailto:seth@example.com
[9]: https://www.gnu.org/software/make/manual/html_node/Introduction.html
[10]: https://www.gnu.org/software/automake/manual/html_node/Programs.html#Programs
[11]: https://opensource.com/article/17/9/docbook
