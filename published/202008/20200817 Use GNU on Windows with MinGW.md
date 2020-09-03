[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12549-1.html)
[#]: subject: (Use GNU on Windows with MinGW)
[#]: via: (https://opensource.com/article/20/8/gnu-windows-mingw)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 Mingw 在 Windows 上使用 GNU
======

> 在 Windows 上安装 GNU 编译器集合（gcc）和其他 GNU 组件来启用 GNU Autotools。

![](https://img.linux.net.cn/data/attachment/album/202008/25/085619rr331p13shpt6htp.jpg)

如果你是一名使用 Windows 的黑客，你不需要专有应用来编译代码。借助 [Minimalist GNU for Windows][2]（MinGW）项目，你可以下载并安装 [GNU 编译器集合（GCC）][3]以及其它几个基本的 GNU 组件，以在 Windows 计算机上启用 [GNU Autotools][4]。

### 安装 MinGW

安装 MinGW 的最简单方法是通过 mingw-get，它是一个图形用户界面 （GUI） 应用，可帮助你选择要安装哪些组件，并让它们保持最新。要运行它，请从项目主页[下载 mingw-get-setup.exe][5]。像你安装其他 EXE 一样，在向导中单击完成安装。

![Installing mingw-get][6]

### 在 Windows 上安装 GCC

目前为止，你只安装了一个程序，或者更准确地说，一个称为 mingw-get 的专用的*包管理器*。启动 mingw-get 选择要在计算机上安装的 MinGW 项目应用。

首先，从应用菜单中选择 mingw-get 启动它。

![Installing GCC with MinGW][8]

要安装 GCC，请单击 GCC 和 G++ 包来标记要安装 GNU C、C++ 编译器。要完成此过程，请从 mingw-get 窗口左上角的**安装**菜单中选择**应用更改**。

安装 GCC 后，你可以使用完整路径在 [PowerShell][9] 中运行它：

```
PS&gt; C:\MinGW\bin\gcc.exe --version
gcc.exe (MinGW.org GCC Build-x) x.y.z
Copyright (C) 2019 Free Software Foundation, Inc.
```

### 在 Windows 上运行 Bash

虽然它自称 “minimalist”（最小化），但 MinGW 还提供一个可选的 [Bourne shell][10] 命令行解释器，称为 MSYS（它代表<ruby>最小系统<rt>Minimal System</rt></ruby>）。它是微软的 `cmd.exe` 和 PowerShell 的替代方案，它默认是 Bash。除了是（自然而然的）最流行的 shell 之一外，Bash 在将开源应用移植到 Windows 平台时很有用，因为许多开源项目都假定了 [POSIX][11] 环境。

你可以在 mingw-get GUI 或 PowerShell 内安装 MSYS：

```
PS> mingw-get install msys
```

要尝试 Bash，请使用完整路径启动它：

```
PS> C:\MinGW\msys/1.0/bin/bash.exe
bash.exe-$ echo $0
"C:\MinGW\msys/1.0/bin/bash.exe"
```

### 在 Windows 上设置路径

你可能不希望为要使用的每个命令输入完整路径。将包含新 GNU 可执行文件的目录添加到 Windows 中的路径中。需要添加两个可执行文件的根目录：一个用于 MinGW（包括 GCC 及其相关工具链），另一个用于 MSYS（包括 Bash、GNU 和 [BSD][12] 项目中的许多常用工具）。

若要在 Windows 中修改环境，请单击应用菜单并输入 `env`。

![Edit your env][13]

这将打开“首选项”窗口。点击窗口底部附近的“环境变量”按钮。

在“环境变量”窗口中，双击底部面板中的“路径”选区。

在“编辑环境变量”窗口中，单击右侧的“新增”按钮。创建一个新条目 `C:\MinCW\msys\1.0\bin`，然后单击 “确定”。以相同的方式创建第二条 `C:\MinGW\bin`，然后单击 “确定”。

![Set your env][14]

在每个首选项窗口中接受这些更改。你可以重启计算机以确保所有应用都检测到新变量，或者只需重启 PowerShell 窗口。

从现在开始，你可以调用任何 MinGW 命令而不指定完整路径，因为完整路径位于 PowerShell 继承的 Windows 系统的 `%PATH%` 环境变量中。

### Hello world

你已经完成设置，因此可以对新的 MinGW 系统进行小测试。如果你是 [Vim][15] 用户，请启动它，然后输入下面的 “hello world” 代码：

```
#include <stdio.h>
#include <iostream>

using namespace std;

int main() {
  cout << "Hello open source." << endl;
  return 0;
}
```

将文件保存为 `hello.cpp`，然后使用 GCC 的 C++ 组件编译文件：

```
PS> gcc hello.cpp --output hello
```

最后，运行它：

```
PS> .\a.exe
Hello open source.
PS>
```

MinGW 的内容远不止我在这里所能介绍的。毕竟，MinGW 打开了一个完整的开源世界和定制代码的潜力，因此请充分利用它。对于更广阔的开源世界，你还可以[试试 Linux][16]。当所有的限制都被消除后，你会惊讶于可能的事情。但与此同时，请试试 MinGW，并享受 GNU 的自由。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/gnu-windows-mingw

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/more_windows.jpg?itok=hKk64RcZ (Windows)
[2]: http://mingw.org
[3]: https://gcc.gnu.org/
[4]: https://opensource.com/article/19/7/introduction-gnu-autotools
[5]: https://osdn.net/projects/mingw/releases/
[6]: https://opensource.com/sites/default/files/uploads/mingw-install.jpg (Installing mingw-get)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/mingw-packages.jpg (Installing GCC with MinGW)
[9]: https://opensource.com/article/19/8/variables-powershell
[10]: https://en.wikipedia.org/wiki/Bourne_shell
[11]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[12]: https://opensource.com/article/19/3/netbsd-raspberry-pi
[13]: https://opensource.com/sites/default/files/uploads/mingw-env.jpg (Edit your env)
[14]: https://opensource.com/sites/default/files/uploads/mingw-env-set.jpg (Set your env)
[15]: https://opensource.com/resources/what-vim
[16]: https://opensource.com/article/19/7/ways-get-started-linux
