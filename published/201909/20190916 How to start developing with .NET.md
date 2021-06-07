[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11397-1.html)
[#]: subject: (How to start developing with .NET)
[#]: via: (https://opensource.com/article/19/9/getting-started-net)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何在 Linux/Windows/MacOS 上使用 .NET 进行开发
======

> 了解 .NET 开发平台启动和运行的基础知识。

![](https://img.linux.net.cn/data/attachment/album/201909/28/111101n3i43c38tv3j9im4.jpg)

.NET 框架由 Microsoft 于 2000 年发布。该平台的开源实现 [Mono][2] 在 21 世纪初成为了争议的焦点，因为微软拥有 .NET 技术的多项专利，并且可能使用这些专利来终止 Mono 项目。幸运的是，在 2014 年，微软宣布 .NET 开发平台从此成为 MIT 许可下的开源平台，并在 2016 年收购了开发 Mono 的 Xamarin 公司。

.NET 和 Mono 已经同时可用于 C#、F#、GTK+、Visual Basic、Vala 等的跨平台编程环境。使用 .NET 和 Mono 创建的程序已经应用于 Linux、BSD、Windows、MacOS、Android，甚至一些游戏机。你可以使用 .NET 或 Mono 来开发 .NET 应用。这两个都是开源的，并且都有活跃和充满活力的社区。本文重点介绍微软的 .NET 环境。

### 如何安装 .NET

.NET 下载被分为多个包：一个仅包含 .NET 运行时，另一个 .NET SDK 包含了 .NET Core 和运行时。根据架构和操作系统版本，这些包可能有多个版本。要开始使用 .NET 进行开发，你必须[安装该 SDK][3]。它为你提供了 [dotnet][4] 终端或 PowerShell 命令，你可以使用它们来创建和生成项目。

#### Linux

要在 Linux 上安装 .NET，首先将微软 Linux 软件仓库添加到你的计算机。

在 Fedora 上：

```
$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
$ sudo wget -q -O /etc/yum.repos.d/microsoft-prod.repo https://packages.microsoft.com/config/fedora/27/prod.repo
```

在 Ubuntu 上：

```
$ wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
$ sudo dpkg -i packages-microsoft-prod.deb
```

接下来，使用包管理器安装 SDK，将 `<X.Y>` 替换为当前版本的 .NET 版本：

在 Fedora 上：

```
$ sudo dnf install dotnet-sdk-<X.Y>
```

在 Ubuntu 上：

```
$ sudo apt install apt-transport-https
$ sudo apt update
$ sudo apt install dotnet-sdk-<X.Y>
```

下载并安装所有包后，打开终端并输入下面命令确认安装：

```
$ dotnet --version
X.Y.Z
```

#### Windows

如果你使用的是微软 Windows，那么你可能已经安装了 .NET 运行时。但是，要开发 .NET 应用，你还必须安装 .NET Core SDK。

首先，[下载安装程序][3]。请认准下载 .NET Core 进行跨平台开发（.NET Framework 仅适用于 Windows）。下载 .exe 文件后，双击该文件启动安装向导，然后单击两下进行安装：接受许可证并允许安装继续。

![Installing dotnet on Windows][5]

然后，从左下角的“应用程序”菜单中打开 PowerShell。在 PowerShell 中，输入测试命令：

```
PS C:\Users\osdc> dotnet
```

如果你看到有关 dotnet 安装的信息，那么说明 .NET 已正确安装。

#### MacOS

如果你使用的是 Apple Mac，请下载 .pkg 形式的 [Mac 安装程序][3]。下载并双击该 .pkg 文件，然后单击安装程序。你可能需要授予安装程序权限，因为该软件包并非来自 App Store。

下载并安装所有软件包后，请打开终端并输入以下命令来确认安装：

```
$ dotnet --version
X.Y.Z
```

### Hello .NET

`dotnet` 命令提供了一个用 .NET 编写的 “hello world” 示例程序。或者，更准确地说，该命令提供了示例应用。

首先，使用 `dotnet` 命令以及 `new` 和 `console` 参数创建一个控制台应用的项目目录及所需的代码基础结构。使用 `-o` 选项指定项目名称：

```
$ dotnet new console -o hellodotnet
```

这将在当前目录中创建一个名为 `hellodotnet` 的目录。进入你的项目目录并看一下：

```
$ cd hellodotnet
$ dir
hellodotnet.csproj  obj  Program.cs
```

`Program.cs` 是一个空的 C＃ 文件，它包含了一个简单的 Hello World 程序。在文本编辑器中打开查看它。微软的 Visual Studio Code 是一个使用 dotnet 编写的跨平台的开源应用，虽然它不是一个糟糕的文本编辑器，但它会收集用户的大量数据（在它的二进制发行版的许可证中授予了自己权限）。如果要尝试使用 Visual Studio Code，请考虑使用 [VSCodium][6]，它是使用 Visual Studio Code 的 MIT 许可的源码构建的版本，而*没有*远程收集（请阅读[此文档][7]来禁止此构建中的其他形式追踪）。或者，只需使用现有的你最喜欢的文本编辑器或 IDE。

新控制台应用中的样板代码为：

```
using System;

namespace hellodotnet
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}
```

要运行该程序，请使用 `dotnet run` 命令：

```
$ dotnet run
Hello World!
```

这是 .NET 和 `dotnet` 命令的基本工作流程。这里有完整的 [.NET C＃ 指南][8]，并且都是与 .NET 相关的内容。关于 .NET 实战示例，请关注 [Alex Bunardzic][9] 在 opensource.com 中的变异测试文章。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/getting-started-net

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://www.monodevelop.com/
[3]: https://dotnet.microsoft.com/download
[4]: https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet?tabs=netcore21
[5]: https://opensource.com/sites/default/files/uploads/dotnet-windows-install.jpg (Installing dotnet on Windows)
[6]: https://vscodium.com/
[7]: https://github.com/VSCodium/vscodium/blob/master/DOCS.md
[8]: https://docs.microsoft.com/en-us/dotnet/csharp/tutorials/intro-to-csharp/
[9]: https://opensource.com/users/alex-bunardzic (View user profile.)
