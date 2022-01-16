[#]: subject: "Anyone can compile open source code in these three simple steps"
[#]: via: "https://opensource.com/article/21/11/compiling-code"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14033-1.html"

任何人都可以通过这三个简单的步骤编译开源代码
======

> 你不需要知道如何写或读代码就可以编译它。

![](https://img.linux.net.cn/data/attachment/album/202111/30/133708wgq4rkecgbre93e1.jpg)

安装软件的方法有很多，但开源让你有了一个其他地方所没有的选择：你可以自己编译代码。编译源代码的经典三步流程是：

```
$ ./configure
$ make
$ sudo make install
```

由于有了这些命令，你可能会惊讶地发现，你不需要知道如何写代码，甚至不需要读代码就可以编译它。

### 安装用来构建软件的命令

由于这是你第一次进行编译，所以有一个一次性的准备步骤，即安装用于构建软件的命令。具体来说，你需要一个编译器。编译器（比如 GCC 或 LLVM）可以将像这样的源代码：

```
#include <iostream>

using namespace std;

int main() {
  cout << "hello world";
}
```

变成 _机器语言_，即 CPU 用来处理信息的指令。你可以看一下机器代码，但它对你来说没有任何意义（除非你是一个 CPU）。

你可以使用你的软件包管理器安装 GNU 编译器集合（GCC）和 LLVM 编译器，以及其他在 Fedora、CentOS、Mageia 和类似发行版上进行编译的基本命令：

```
$ sudo dnf install @development clang
```

在 Debian、Elementary、Mint 和类似发行版上命令如下：

```
$ sudo apt install build-essential clang
```

在你的系统设置好后，有几项你每次编译软件时都要重复进行的任务：

  1. 下载源代码
  2. 展开源代码的存档文件
  3. 编译

你已经有了所有你需要的命令，所以现在你需要一些软件来编译。

### 1、下载源代码

获得一个应用程序的源代码和获得任何可下载的软件一样。你得去一个网站或一个代码管理网站，如 GitLab、SourceForge 或 GitHub。 通常情况下，开源软件既有正在进行的工作（“<ruby>当前<rt>current</rt></ruby>”或 “<ruby>每夜<rt>nightly</rt></ruby>”）的构建版本，也有打包的“<ruby>稳定<rt>stable</rt></ruby>”发布版本。在可能的情况下，使用稳定版本，除非你有理由相信，或者对代码有足够的了解，能够在出现故障时修复。术语“稳定版”表明这些代码经过了测试，而且该应用程序的程序员对代码有足够的信心，从而将其打包成 `.zip` 或 `.tar` 归档，给了它一个官方编号，有时还有一个发布名称，然后提供给一般的非程序员公众下载。

在这个练习中，我使用 [Angband][2]，一个开源的（GPLv2）ASCII 地牢猎手游戏。这是一个简单的应用程序，其复杂程度刚好可以说明你在自己编译软件时需要考虑的问题。

从 [网站][2] 上下载其源代码。

### 2、展开源代码的存档文件

源代码通常是以存档的形式交付的，因为源代码通常由多个文件组成的。在与之交互之前，你必须先解压，不管它是一个 tarball、一个 zip 文件、一个 7z 文件，还是其他完全不同的东西。 

```
$ tar --extract --file Angband-x.y.z.tar.gz
```

一旦解压缩后，就把目录切换到解压缩的目录，然后看一看。通常在目录的顶层有一个 `README` 文件。这个文件，一般会包含你需要做什么来编译代码的指导。`README` 通常包含关于代码的这些重要方面的信息：

  * **语言**：代码使用的是什么语言（例如，C、C++、Rust、Python）。
  * **依赖性**：你需要在你的系统上安装其他什么的软件，以便这个应用程序能够构建和运行。
  * **说明**：你构建该软件所需要采取的明确步骤。偶尔，他们会在一个专门的文件中包含这些信息，这个文件被直观地称为 `INSTALL`。

如果 `README` 文件中不包含这些信息，可以考虑向开发者提交一份错误报告。你不是唯一需要介绍一下源代码的人。不管他们有多么丰富的经验，每个人都会对从未见过的源代码感到陌生，而文档是很重要的！

Angband 的维护者给出了在线说明的链接，描述了如何编译代码。这份文件还描述了你需要安装哪些其他软件，尽管它并没有确切地说明这一点。该网站说，“有几个不同的可选构建的前端（GCU、SDL、SDL2 和 X11），你可以使用诸如 `--enable-sdl`，`--disable-x11` 的参数配置。”这可能对你来说看起来像天书，但你经常编译代码后就会习惯。无论你是否理解 X11 或 SDL2 是什么，它们都是你经过几个月定期编译代码后经常看到的要求。你会对大多数软件需要其他软件库的想法感到适应，因为它们建立在其他技术之上。不过在这种情况下，Angband 非常灵活，无论是否有这些可选的依赖，都可以进行编译，所以现在，你可以假装没有额外的依赖。

### 3、编译代码

构建代码的典型步骤是：

```
$ ./configure
$ make
$ sudo make install
```

这些是使用 [Autotools][3] 构建的项目的步骤，该框架是为了规范源代码的交付方式而创建的。然而，还有一些其他框架（如 [Cmake][4]），它们需要不同的步骤。当项目没有遵循 Autotools 或 Cmake 框架时，它们往往会在 `README` 文件中提醒你。

### 配置 

Angband 使用 Autotools，所以现在是编译代码的时候了!

在 Angband 目录中，首先，运行随源码一起提供的配置脚本：

```
$ ./configure
```

这一步将扫描你的系统，找到 Angband 正确构建所需的依赖性。有些依赖是非常基本的，没有它们你的电脑就无法运行，而有些则是专门的。在这一过程结束时，该脚本会给你一份关于它所发现的东西的报告：

```
[...]
configure: creating ./config.status
config.status: creating mk/buildsys.mk
config.status: creating mk/extra.mk
config.status: creating src/autoconf.h

Configuration:

  Install path:    /usr/local
  binary path:     /usr/local/games
  config path:     /usr/local/etc/angband/
  lib path:        /usr/local/share/angband/
  doc path:        /usr/local/share/doc/angband/
  var path:        (not used)
  (save and score files in ~/.angband/Angband/)

-- Frontends --
- Curses            Yes
- X11               Yes
- SDL2              Disabled
- SDL               Disabled
- Windows           Disabled
- Test              No
- Stats             No
- Spoilers          Yes

- SDL2 sound        Disabled
- SDL sound         Disabled
```

有些输出可能对你有意义，有些可能没有。无论如何，你可能注意到 SDL2 和 SDL 被标记为 “Disabled”，Test 和 Stats 都被标记为 “None”。虽然这些信息是负面的，但这并不一定是一件坏事。从本质上讲，这就是**警告**和**错误**之间的区别。如果配置脚本遇到了会阻止它构建代码的东西，它就会用一个错误来提醒你。

如果你想稍微优化一下你的构建，你可以选择解决这些负面信息。通过搜索 Angband 文档，你可能会确定 Test 和 Stats 实际上并不是你感兴趣的（它们是 Angband 专用于开发者的选项）。然而，通过在线研究，你可能会发现 SDL2 将是一个很好的功能。 

要解决编译代码时的依赖问题，你需要安装缺少的组件和该缺少的组件的 _开发库_。换句话说，Angband 需要 SDL2 来播放声音，但它需要 `SDL2-devel`（在 Debian 系统上称为 `libsdl2-dev`）来构建。用你的软件包管理器安装这两个组件：

```
$ sudo dnf install sdl2 sdl2-devel
```

再试一下配置脚本：

```
$ ./configure --enable-sdl2
[...]
Configuration:
[...]
- Curses                                  Yes
- X11                                     Yes
- SDL2                                    Yes
- SDL                                     Disabled
- Windows                                 Disabled
- Test                                    No
- Stats                                   No
- Spoilers                                Yes

- SDL sound                               Disabled
- SDL2 sound                              Yes
```

### 制作（编译）

一旦一切配置完毕，运行 `make` 命令：

```
$ make
```

这通常需要一段时间，但它提供了很多视觉反馈，所以你会知道代码正在被编译。

### 安装

最后一步是安装你刚刚编译的代码。安装代码并没有什么神奇之处。所做的就是复制很多文件到非常具体的目录中。无论你是从源代码编译还是运行花哨的图形安装向导，都是如此。由于这些代码会被复制到系统级目录，你必须有 root（管理）权限，这是由 `sudo` 命令授予的。

```
$ sudo make install
```

### 运行该应用程序

一旦应用程序被安装，你就可以运行它。根据 Angband 文档，启动游戏的命令是 `angband`，所以可以试试：

```
$ angband
```

![Compile code lead image][6]

### 编译代码

无论是在我的 Slackware 台式电脑上，还是在我的 CentOS 笔记本电脑上，我都会使用 NetBSD 的 [pkgsrc][8] 系统编译我自己的大部分应用程序。我发现，通过自己编译软件，我可以对应用程序中包含的功能、如何配置、使用的库版本等有自己的想法。这很有意义，它帮助我跟上了新的版本，而且因为我有时会在这个过程中发现错误，它帮助我参与了很多不同的开源项目。

你很少会只有编译软件的一种方式可选，大多数开源项目同时提供源代码（这就是为什么它被称为“开源”）和可安装包。是否从源代码编译是你自己的选择，也许是因为你想要最新版本中还没有的新功能，或者只是因为你喜欢自己编译代码。

### 家庭作业

Angband 可以使用 Autotools 或 Cmake，所以如果你想体验另一种构建代码的方式，可以试试这个：

```
$ mkdir build
$ cd build
$ cmake ..
$ make
$ sudo make install
```

你也可以尝试用 LLVM 编译器而不是 GNU 编译器集合（GCC）进行编译。现在，我把这个问题留给你自己去研究（提示：尝试设置 `CC` [环境变量][9]）。

一旦你完成了对 Angband 的源代码和至少几个地牢的探索（你已经赢得了一些休息时间），可以看看其他一些代码库。很多人都会使用 Autotools 或 Cmake，而其他人可能会使用不同的东西。看看你能构建的成果！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/compiling-code

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_development_programming.png?itok=M_QDcgz5 (Developing code.)
[2]: https://rephial.org/
[3]: https://opensource.com/article/19/7/introduction-gnu-autotools
[4]: https://opensource.com/article/21/5/cmake
[5]: https://opensource.com/file/514986
[6]: https://opensource.com/sites/default/files/uploads/angband.jpg (Compile code lead image)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/article/19/11/pkgsrc-netbsd-linux
[9]: https://opensource.com/article/19/8/what-are-environment-variables
