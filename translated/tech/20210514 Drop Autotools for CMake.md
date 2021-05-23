[#]: subject: "Drop Autotools for CMake"
[#]: via: "https://opensource.com/article/21/5/cmake"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "amwps290"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

抛弃 Autotools 向 CMake 迈进吧
======

CMake 是一个跨平台的编译，测试和打包软件，即使你以前从来没有使用过构建系统，也可以轻松上手。

![Someone wearing a hardhat and carrying code ][1]

在我以前的文章 [Autotools 入门][2] 一文中，我说明了如何使用 Autotools 来管理和打包代码。这是一个强大且通用的平台，可轻松集成到许多包系统中，包括 RPM，APT，[pkgsrc][3] 以及一些其他平台。它的语法和结构可能会令人困惑，但幸运的是，我们还有其他选择，开源的 [CMake][4] 就是其中一个。

CMake 是一个用于构建，测试和打包软件的跨平台套件。 它使用简单且语法比较清晰明了，因此即使您以前从未使用过构建系统，也很容易开始使用。

### 安装 CMake

CMake 可能已经安装在您的 Linux 系统上。 如果没有，您可以使用发行版的程序包管理器进行安装：

```
`$ sudo dnf install cmake`
```

在 Debian 或者其他相似的系统上：

```
`$ sudo apt install cmake`
```

在 Mac 上，你可以使用 [MacPorts][5] 或者 [Homebrew][6] 来安装:


```
`$ sudo port install cmake`
```

在 Windows 上，你可以使用 [Chocolatey][7] 或者直接从 [CMake 网站][8]下载二进制来安装。

### 使用 CMake 

对于想要从源代码构建软件的开发人员或用户来说，CMake 是一种快速简便的编译和安装方法。 CMake 分阶段工作：

1. 首先，在 `cmake` 步骤中，CMake 扫描计算机查看一些默认设置。 默认设置包括库的位置以及在系统上安装软件的位置。
2. 接下来，使用系统上的 `make` 命令（在 Linux 上是 GUN Make,在 [NetBSD][9] 上是 NetBSD Make）来编译程序。这个过程通常是将人类可读的源代码转换成机器语言。
3. 最后，在 `make install` 一步中，那些编译过的文件将被拷贝到计算机上合适的位置（在 `cmake` 步骤中扫描出来的）。

这看起来很简单，该你来使用 CMake 了。

### CMake 的可移植性


CMake 在设计时就考虑了可移植性。 虽然它不能使您的项目在所有 POSIX 平台上都能正常工作（作为程序员这可能由你决定），但它可以确保将标记为要安装的文件安装到已知平台上最合适的位置。 而且由于有了 CMake 之类的工具，对于高级用户而言，根据其系统需求自定义和覆盖任何不合适的选项都很容易。

使用 CMake，您只需要知道将哪些文件安装到哪个常规位置即可。 它会照顾其他一切。 不再有在任何未经测试的操作系统上失败的自定义安装脚本。

### 打包

像 Autotools 一样，CMake 也得到了很好的打包支持。 无论他们是打包成 RPM 还是 DEB 或 TGZ（或其他任何东西），将带有 CMake 的项目交给打包者，他们的工作既简单又直接。 打包工具了解 CMake，因此可能不需要进行任何修补或者调整。 在许多情况下，可以自动将 CMake 项目整合到工作流中。

### 如何使用 CMake

要在项目中使用 CMake，只需在项目目录中创建 `CMakeLists.txt` 文件。 首先，声明最低要求的 CMake 版本以及项目名称和版本。 CMake 会努力保持尽可能长时间的兼容性，但是随着您使用时间的越来越长并且关注它最新的开发动态，您就会知道哪些特性是你所依赖的。


```
cmake_minimum_required(VERSION 3.10)

project(Hello VERSION 1.0)
```

如您可能已经看到的那样，CMake 的语法是一个带有括号和参数的命令。 大写的 `VERSION` 字符串不是任意的，也不只是格式。 它们是 `project` 命令中的有效参数。

在继续之前，先写一个简单的 C 或者 C++ 的 `hello world` 程序。为了简单，我就写了六行 C 代码，并把它保存在 `hello.c` 中（为了匹配我在 `CMakeLists.txt` 中可执行文件在名字）。 


```
#include &lt;stdio.h&gt;

int main() {
   [printf][10]("Hello open source\n");
   return 0;
}
```

毫无疑问，CMake 不仅适用于 C 和 C++。 它可以处理任意文件，并且具有许多可用的命令，因此它可以帮助您维护许多不同形式的项目。

CMake 网站中的文档有所有有效的内置命令及其可用参数，因此无论您要做什么，都可以轻松发现所需的功能。 不过，这是一个简单的示例，因此，您需要的下一个命令是必不可少的——您必须为 CMake 定义要构建的代码：

```
`add_executable(Hello hello.c)`
```

这个命令指定了你编译后的二进制文件的名字。因此，它与您在终端中执行带有 `-o Hello` 的 `gcc` 命令是一样的。

在一些比较复杂的项目中，您可能还需要使用库文件，你可以使用 `add library` 命令来链接库文件。

在你已经定义你要编译的文件并且标记了你要安装。你必须要告诉 CMake 一旦用户安装了程序，最终的应用程序应该在哪个位置。

在这个简单的例子里，你仅需要做的一件事就是在你的 `CMakeLists.txt` 文件里添加 `install ` 命令。`install ` 命令接受几个参数。但是在这个例子中，你仅需要使用 `TARGET` 命令来指定你要安装文件的名字。


```
`install(TARGETS Hello)`
```

### 向 CMake 工程添加一些文件

一个软件项目向用户交付的不仅仅只有代码，还有一些其他的文件数据，例如手册或者是信息页。示例项目，或者是配置文件。 您可以使用与包含编译文件时类似的工作流程，将任意数据包含在 CMake 项目中：在 `CMakelists.txt` 文件中使用 file 命令，然后说明一下这些文件要安装在哪里。

例如，你可以在这个项目中包含一个  `assets` 目录，你可以使用 `file` 命令，后面跟上 `COPY` 和 `DESTINATION` 参数来告诉 CMake 将这些额外的文件拷贝到你的发行包中。

```
`file(COPY assets DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")`
```

这个 `${CMAKE_CURRENT_BINARY_DIR}` 变量是一个特殊的 CMake 内置变量，表示 CMake 正在处理的这个目录。换句话说，你的任何文件都会被拷贝到编译目录(等你执行完来 `cmake` 命令，这个过程会更加清晰，到时候回过头来看一下)。

因为这些额外的数据文件有些杂乱不堪（如果你不信我的话，可以看一下 `/usr/share` 这个目录)。对于你自己的项目创建一个子文件夹是对谁都有好处的。最好也带上版本名字。你可以通过 `CMAKE_CURRENT_BINARY_DIR` 后边加上你的项目名字和版本名字来指定一个新目录。


```
`file(COPY assets DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/Hello-${Hello_VERSION}")`
```

### 定义安装位置

你已经定义你要编译的文件，因此现在你要告诉 CMake 你的程序要安装在哪个位置。比如你的主程序。这个要程使用 `install` 命令：


```
`install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/Hello-${Hello_VERSION}" TYPE DATA)`
```

这里有一些新的参数。`DIRECTORY` 参数指定了数据文件是一个目录(而不是一个文件或者脚本)。你使用了和复制一些额外文件到编译目录时一样的参数。另外， 在 `install` 命令中 `TYPE` 或者 `DESTINATION` 中的一个必须要指定。`TYPE` 参数指定了通用的文件类型，这些文件通常将会被放到合适的位置。在 Linux 系统上，`TYPE DATA` 一般是 `/usr/local/share` 或者 `/usr/share`，除非用户定义了其他的位置。

这是诸如 CMake 之类的良好构建系统的强大功能之一。 您不必担心文件的确切位置，因为您知道用户可以更改 CMake 其首选默认设置，并且 CMake 将构建代码以使其正常工作。

### 运行 CMake

CMake 有多种方式来让你执行命令，你可以在终端或者在一个可交互的程序上执行命令，或者你也可以使用它的图形界面(GUI)。我比较偏向于使用终端命令，但是我也喜欢使用一些其他的方式（相比与在 Makefile 中查找那些晦涩的变量然后去修改他们，其他方式的确远胜一筹)。

对于编译那些的开源 C++ 项目的任何人都熟悉的第一步是创建一个 `build` 目录，进入到该目录，然后运行 `cmake ..` 命令。 我是一个懒惰的打字员，所以我将构建目录命名为`b`，但是您可以使用最合适的方法：


```
$ mkdir b$ cd b$ cmake ..\-- The C compiler identification is GNU 11.1.1\-- The CXX compiler identification is GNU 11.1.1\-- Detecting C compiler ABI info\-- Detecting C compiler ABI info - done\-- Check for working C compiler: /usr/bin/cc - skipped\-- Detecting C compile features\-- Detecting C compile features - done\-- Detecting CXX compiler ABI info\-- Detecting CXX compiler ABI info - done\-- Check for working CXX compiler: /usr/bin/c++ - skipped\-- Detecting CXX compile features\-- Detecting CXX compile features - done\-- Configuring done\-- Generating done\-- Build files have been written to: /var/home/seth/demo-hello/b$
```

和传统的 `./configure; make; make install` 过程相比，与 `./configure` 这个步骤的相对应输出，谁多谁少。看一下你的构建目录，CMake 已经帮你生成了几个新的文件来让你的项目更完整。这里生成了 CMake 的数据文件，一个常规的 Makefile 文件(这是一个免费提供的 247 行的文件，但对于越复杂的项目，文件行数越多)，还有一个包含这个示例程序的任意的非编译数据的 `Hello-1.0` 目录。

```
$ lsCMakeCache.txtCMakeFilesMakefileHello-1.0cmake_install.cmake
```

接下来，运行一下 `make` 命令，这将会读取由 CMake 生成的 `Makefile`。在这个例子中，Make 默认的行为就是由源程序 `hello.c` 生成目标文件。

```
$ makeScanning dependencies of target Hello[ 50%] Building C object CMakeFiles/Hello.dir/hello.c.o[100%] Linking C executable Hello[100%] Built target Hello$
```

如您所料，`Hello` 二进制可执行文件现在存在于当前的构建目录中。 因为它是一个简单的自包含应用程序，所以您可以运行一下它看一下效果是否和您想的一致：

```
$ ./HelloHello open source$
```

最后，运行一下 `make install` 来调用 `Makefile` 中的安装步骤。因为我不想让这个简单的 "hello world" 程序安装到我的系统中。因此，我通过设置 `DESTDIR` 变量来将 CMake 的目标位置从根目录(`/`) 变成了它的子目录 `/tmp`:


```
$ mkdir /tmp/dist-hello$ make install DESTDIR=/tmp/dist-hello[100%] Built target HelloInstall the project...\-- Install configuration: ""\-- Installing: /tmp/dist-hello/usr/local/bin/Hello\-- Installing: /tmp/dist-hello/usr/local/share/Hello-1.0\-- Installing: /tmp/dist-hello/usr/local/share/Hello-1.0/assets/file0\-- Installing: /tmp/dist-hello/usr/local/share/Hello-1.0/assets/file1
```

看一下输出的内容，来确定它具体的安装位置，这个程序已经安装好了。

### 快速自定义

CMake 的安装路径(由 `CMAKE_INSTALL_PREFIX`  变量指定的)默认是在 `/usr/local` 这个位置，但是所有的 CMake 变量都可以在你运行 `cmake` 命令的时候，加一个 `-D` 选项来改变它。

```
$ cmake -DCMAKE_INSTALL_PREFIX=/usr ..$ make install DESTDIR=/tmp/dist-hello$ make install DESTDIR=/tmp/dist-hello[100%] Built target HelloInstall the project...\-- Install configuration: ""\-- Installing: /tmp/dist-hello/usr/bin/Hello\-- Installing: /tmp/dist-hello/usr/share/Hello-1.0\-- Installing: /tmp/dist-hello/usr/share/Hello-1.0/assets/file0\-- Installing: /tmp/dist-hello/usr/share/Hello-1.0/assets/file1
```

所有由 CMake 使用的变量都可以通过这种方式来修改

### 交互式的 CMake

CMake 的交互模式是一种用于配置安装环境的友好而有用的方法。 要让用户知道该项目使用的所有可能的 CMake 变量却是一件工程量很大的事，因此 CMake 交互式界面是他们无需查看 Makefile 和 CMakeLists 即可发现自定义选项的简便方法。

为了调用这个交互式的 CMake, 使用 `ccmake` 命令，在这个简单的项目里没有太多的东西。但是对于像 [Rosegarden][11]  这样的大型项目，这将非常有用。

![Rosegarden][12]

(Seth Kenlon, [CC BY-SA 4.0][13])

### CMake 的更多知识

还有很多很多的 CMake 知识需要去了解。作为一个开发者，我非常喜欢他简洁的语法，详尽的文档，可扩展性以及便捷性。作为一个用户我非常喜欢 CMake 友好且实用的错误提示信息还有它的界面，如果您的项目还未开始使用构建系统，看一眼 CMake 吧。您以及以后尝试打包您应用程序的任何人都不会后悔。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/cmake

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[amwps290](https://github.com/amwps290)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag "Someone wearing a hardhat and carrying code "
[2]: https://opensource.com/article/19/7/introduction-gnu-autotools
[3]: https://opensource.com/article/19/11/pkgsrc-netbsd-linux
[4]: http://cmake.org
[5]: https://opensource.com/article/20/11/macports
[6]: https://opensource.com/article/20/6/homebrew-linux
[7]: https://opensource.com/article/20/3/chocolatey
[8]: https://cmake.org/download
[9]: https://opensource.com/article/19/3/netbsd-raspberry-pi
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[11]: https://opensource.com/article/18/3/make-sweet-music-digital-audio-workstation-rosegarden
[12]: https://opensource.com/sites/default/files/uploads/rosegarden-ccmake.jpg "Rosegarden"
[13]: https://creativecommons.org/licenses/by-sa/4.0/
[14]: https://cmake.org/cmake/help/latest/
