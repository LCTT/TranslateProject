[#]: subject: "Drop Autotools for CMake"
[#]: via: "https://opensource.com/article/21/5/cmake"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "amwps290"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13419-1.html"

抛弃 Autotools 向 CMake 迈进吧
======

> CMake 是一个跨平台的编译、测试和打包软件，即使你以前从来没有使用过构建系统，也可以轻松上手。

![](https://img.linux.net.cn/data/attachment/album/202105/24/183520grnp3821rmmpg1ug.jpg)

在我以前的文章 [Autotools 入门][2] 一文中，我说明了如何使用 Autotools 来管理和打包代码。这是一个强大且通用的平台，可轻松集成到许多打包系统中，包括 RPM、APT、[pkgsrc][3] 等等。它的语法和结构可能会令人困惑，但幸运的是，我们还有其他选择，开源的 [CMake][4] 就是其中一个。

CMake 是一个用于构建、测试和打包软件的跨平台套件。它使用简单而清晰的语法，因此即使你以前从未使用过构建系统，也很容易开始使用。

### 安装 CMake

CMake 可能已经安装在你的 Linux 系统上。如果没有，你可以使用发行版的程序包管理器进行安装：

```
$ sudo dnf install cmake
```

在 Debian 或者其他相似的系统上：

```
$ sudo apt install cmake
```

在 Mac 上，你可以使用 [MacPorts][5] 或者 [Homebrew][6] 来安装:

```
$ sudo port install cmake
```

在 Windows 上，你可以使用 [Chocolatey][7] 或者直接从 [CMake 网站][8] 下载二进制来安装。

### 使用 CMake 

对于想要从源代码构建软件的开发人员或用户来说，CMake 是一种快速简便的编译和安装方法。 CMake 分阶段工作：

1. 首先，在 `cmake` 步骤中，CMake 扫描计算机查看一些默认设置。默认设置包括库的位置以及在系统上安装软件的位置。
2. 接下来，使用系统上的 `make` 命令（在 Linux 上是 GUN Make，在 [NetBSD][9] 上是 NetBSD Make）来编译程序。这个过程通常是将人类可读的源代码转换成机器语言。
3. 最后，在 `make install` 一步中，那些编译过的文件将被拷贝到（在 `cmake` 步骤中扫描出来的）计算机上合适的位置。

这看起来很简单，当你使用 CMake 时就是这样。

### CMake 的可移植性

CMake 在设计时就考虑了可移植性。虽然它不能使你的项目在所有 POSIX 平台上都能正常工作（这取决于作为开发者的你），但它可以确保将标记为要安装的文件安装到已知平台上最合适的位置。而且由于有了 CMake 之类的工具，对于高级用户而言，根据其系统需求自定义和覆盖任何不合适的选项都很容易。

使用 CMake，你只需要知道将哪些文件安装到哪个常规位置即可。它会照顾其他一切。不再需要自定义安装脚本，它们有可能在任何未经测试的操作系统上失败。

### 打包

像 Autotools 一样，CMake 也得到了很好的打包支持。无论它们是打包成 RPM 还是 DEB 或 TGZ（或其他任何东西），将带有 CMake 的项目交给打包者，他们的工作既简单又直接。打包工具支持 CMake，因此可能不需要进行任何修补或者调整。在许多情况下，可以自动将 CMake 项目整合到工作流中。

### 如何使用 CMake

要在项目中使用 CMake，只需在项目目录中创建 `CMakeLists.txt` 文件。首先，声明最低要求的 CMake 版本以及项目名称和版本。CMake 会努力在尽可能长时间内保持兼容性，但是随着你使用的时间越长，并且关注它最新的开发动态，你就会知道哪些特性是你所依赖的。

```
cmake_minimum_required(VERSION 3.10)

project(Hello VERSION 1.0)
```

如你可能已经看到的那样，CMake 的语法是一个带有括号和参数的命令。大写的 `VERSION` 字符串不是任意的，也不只是格式。它们是 `project` 命令中的有效参数。

在继续之前，先写一个简单的 C 或者 C++ 的 `hello world` 程序。为了简单，我就写了六行 C 代码，并把它保存在 `hello.c` 中（为了匹配我在 `CMakeLists.txt` 中可执行文件的名字）。 

```
#include <stdio.h>

int main() {
   printf("Hello open source\n");
   return 0;
}
```

不过，不要搞错了，CMake 不仅适用于 C 和 C++。它可以处理任意文件，并且有许多可用的命令，因此它可以帮助你维护许多不同形式的项目。

CMake 网站中记录了所有有效的内置命令及其可用参数，因此无论你要做什么，都可以轻松发现所需的功能。不过，这是一个简单的示例，因此，你需要的下一个命令是必不可少的 —— 你必须为 CMake 定义要构建的代码：

```
add_executable(Hello hello.c)
```

这个命令指定了你编译后的二进制文件的名字为 `Hello`。因此，它与你在终端中执行带有 `-o Hello` 的 `gcc` 命令是一样的。

在一些比较复杂的项目中，你可能还需要使用库文件，你可以使用 `add library` 命令来链接库文件。

在你设置了你想要构建和标记为安装的文件之后，你必须要告诉 CMake 一旦用户安装了程序，最终的应用程序应该在哪个位置。

在这个简单的例子里，你仅需要做的一件事就是在你的 `CMakeLists.txt` 文件里添加 `install` 命令。`install` 命令接受几个参数。但是在这个例子中，你仅需要使用 `TARGET` 命令来指定你要安装文件的名字。

```
install(TARGETS Hello)
```

### 向 CMake 工程添加一些文件

一个软件项目向用户交付的往往不仅仅只有代码，还有一些其他的文件数据，例如手册或者是信息页、示例项目，或者是配置文件。你可以使用与包含编译文件时类似的工作流程，将任意数据包含在 CMake 项目中：在 `CMakelists.txt` 文件中使用 `file` 命令，然后说明一下这些文件要安装在哪里。

例如，你可以在这个项目中包含一个 `assets` 目录，你可以使用 `file` 命令，后面跟上 `COPY` 和 `DESTINATION` 参数来告诉 CMake 将这些额外的文件复制到你的分发包中。

```
file(COPY assets DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")
```

这个 `${CMAKE_CURRENT_BINARY_DIR}` 变量是一个特殊的 CMake 内置变量，表示 CMake 正在处理的目录。换句话说，你的任何文件都会被复制到编译目录（在你运行 `cmake` 命令后，这个过程会更加清晰，到时候回过头来看一下）。

因为这些额外的数据文件有些杂乱不堪（如果你不信的话，可以看一下 `/usr/share` 这个目录）。对于你自己的项目创建一个子文件夹对谁都有好处。最好也带上版本名字。你可以通过在 `CMAKE_CURRENT_BINARY_DIR` 中指定一个新的目录，使用你选择的项目名称，后面跟一个为你的项目命名的特殊变量和你在项目声明中为它设置的 `VERSION`。

```
file(COPY assets DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/Hello-${Hello_VERSION}")
```

### 定义安装位置

你已经定义你要编译的文件，因此现在你要告诉 CMake 你的程序要安装在哪个位置。比如你的主程序，这个要程使用 `install` 命令：

```
install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/Hello-${Hello_VERSION}" TYPE DATA)
```

这里有一些新的参数。`DIRECTORY` 参数指定了数据文件是一个目录，而不是一个文件（`FILE`）或者脚本（`SCRIPT`）。你使用的参数和复制一些额外文件到编译目录时是一样。另外，在 `install` 命令中 `TYPE` 或者 `DESTINATION` 必须要指定其一。`TYPE` 参数指定了通用的文件类型，这些文件通常将会被放到合适的位置。在 Linux 系统上，`TYPE DATA` 一般是 `/usr/local/share` 或者 `/usr/share`，除非用户定义了其他的位置。

这是诸如 CMake 之类的良好构建系统的强大功能之一。你不必担心文件的确切位置，因为你知道用户可以更改 CMake 的首选默认设置，并且 CMake 将构建代码以使其正常工作。

### 运行 CMake

CMake 有多种方式来让你执行命令，你可以在终端或者在一个可交互的程序上执行命令，或者你也可以使用它的图形界面（GUI）。我比较偏向于使用终端命令，但是我也喜欢使用一些其他的方式（相比与在 `Makefile` 中查找那些晦涩的变量然后去修改它们更胜一筹）。

对于编译过开源 C++ 项目的任何人，都熟悉的第一步是创建一个 `build` 目录，进入到该目录，然后运行 `cmake ..` 命令。 我是一个懒惰的打字员，所以我将构建目录命名为 `b`，但是你可以使用最合适的方式：

```
$ mkdir b
$ cd b
$ cmake ..
-- The C compiler identification is GNU 11.1.1
-- The CXX compiler identification is GNU 11.1.1
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /var/home/seth/demo-hello/b
$
```

这或多或少相当于经典的 `./configure; make; make install` 中的 `./configure`。看一下你的构建目录，CMake 已经帮你生成了几个新的文件，来让你的项目更完整。这里生成了 CMake 的数据文件、一个常规的 `Makefile` 文件（这是一个免费提供的 247 行的文件，但对于越复杂的项目，行数要多得多），还有一个包含这个示例程序的任意非编译数据的 `Hello-1.0` 目录。

```
$ ls
CMakeCache.txt
CMakeFiles
Makefile
Hello-1.0
cmake_install.cmake
```

接下来，你可以进行构建。你可以使用 CMake 的 `--build` 选项来做这件事，使用当前的构建目录作为源目录。

```
$ cmake --build .
Scanning dependencies of target Hello
[ 50%] Building C object CMakeFiles/Hello.dir/hello.c.o
[100%] Linking C executable Hello
[100%] Built target Hello
```

或者你可以运行 `make` 命令。这将读取由 CMake 生成的 `Makefile` 文件。在这个例子中，`make` 默认的行为就是由源程序 `hello.c` 生成目标文件。

```
$ make
Scanning dependencies of target Hello
[ 50%] Building C object CMakeFiles/Hello.dir/hello.c.o
[100%] Linking C executable Hello
[100%] Built target Hello
$
```

如你所料，`Hello` 二进制可执行文件现在存在于当前的构建目录中。因为它是一个简单的自包含应用程序，所以你可以运行它进行测试：

```
$ ./Hello
Hello open source
$
```

最后，你可以用 `--install` 选项进行安装。因为我不希望我的简单的 “hello world” 应用程序真的被安装到我的系统上，我设置了 `--prefix` 选项，将 CMake 的目标从根目录（`/`）重定向到 `/tmp` 的一个子目录。

```
$ cmake --install . --prefix /tmp/hello/
-- Install configuration: ""
-- Installing: /tmp/dist-hello/usr/local/bin/Hello
-- Installing: /tmp/dist-hello/usr/local/share/Hello-1.0
-- Installing: /tmp/dist-hello/usr/local/share/Hello-1.0/assets/file0
-- Installing: /tmp/dist-hello/usr/local/share/Hello-1.0/assets/file1
```

另外，你也可以运行 `make install` 来调用 `Makefile` 的安装动作。同样，为了避免在我的系统上安装一个演示程序，我在这个例子中设置了 `DESTDIR` 变量，将安装目标重定向到 `/tmp` 的一个子目录：

```
$ mkdir /tmp/dist-hello
$ make install DESTDIR=/tmp/dist-hello
[100%] Built target Hello
Install the project...
-- Install configuration: ""
-- Installing: /tmp/dist-hello/usr/local/bin/Hello
-- Installing: /tmp/dist-hello/usr/local/share/Hello-1.0
-- Installing: /tmp/dist-hello/usr/local/share/Hello-1.0/assets/file0
-- Installing: /tmp/dist-hello/usr/local/share/Hello-1.0/assets/file1
```

看一下输出的内容，来确定它具体的安装位置，这个程序已经安装好了。

### 快速自定义

CMake 的安装前缀（由 `CMAKE_INSTALL_PREFIX` 变量指定）默认是在 `/usr/local` 这个位置，但是所有的 CMake 变量都可以在你运行 `cmake` 命令的时候，加一个 `-D` 选项来改变它。

```
$ cmake -DCMAKE_INSTALL_PREFIX=/usr ..
$ make install DESTDIR=/tmp/dist-hello
$ make install DESTDIR=/tmp/dist-hello
[100%] Built target Hello
Install the project...
-- Install configuration: ""
-- Installing: /tmp/dist-hello/usr/bin/Hello
-- Installing: /tmp/dist-hello/usr/share/Hello-1.0
-- Installing: /tmp/dist-hello/usr/share/Hello-1.0/assets/file0
-- Installing: /tmp/dist-hello/usr/share/Hello-1.0/assets/file1
```

所有由 CMake 使用的变量都可以通过这种方式来修改。

### 交互式的 CMake

CMake 的交互模式是一种用于配置安装环境的友好而有用的方法。要让用户知道该项目使用的所有可能的 CMake 变量是一件工作量很大的事，因此 CMake 交互式界面是他们无需查看 `Makefile` 和 `CMakeLists` 即可发现自定义选项的简便方法。

为了调用这个交互式的 CMake，使用 `ccmake` 命令，在这个简单的项目里没有太多的东西。但是对于像 [Rosegarden][11] 这样的大型项目，这将非常有用。

![Rosegarden][12]

### CMake 的更多知识

还有很多很多的 CMake 知识需要去了解。作为一个开发者，我非常喜欢它简洁的语法、详尽的文档、可扩展性以及便捷性。作为一个用户我非常喜欢 CMake 友好且实用的错误提示信息还有它的用户界面，如果你的项目还未开始使用构建系统，请了解一下 CMake 吧。你以及以后尝试打包你应用程序的任何人都不会后悔。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/cmake

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

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
