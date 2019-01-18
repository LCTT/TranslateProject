[#]: collector: (lujun9972)
[#]: translator: (runningwater)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10453-1.html)
[#]: subject: (How To Install Microsoft .NET Core SDK On Linux)
[#]: via: (https://www.ostechnix.com/how-to-install-microsoft-net-core-sdk-on-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

如何在 Linux 中安装微软的 .NET Core SDK
======

![](https://www.ostechnix.com/wp-content/uploads/2018/12/NET-Core-SDK-720x340.png)

**.NET Core** 是微软提供的免费、跨平台和开源的开发框架，可以构建桌面应用程序、移动端应用程序、网络应用程序、物联网应用程序和游戏应用程序等。如果你是 Windows 平台下的 dotnet 开发人员的话，使用 .NET core 可以很轻松就设置好任何 Linux 和类 Unix 操作系统下的开发环境。本分步操作指南文章解释了如何在 Linux 中安装 .NET Core SDK 以及如何使用 .NET 开发出第一个应用程序。

### Linux 中安装 .NET Core SDK

.NET Core 支持 GNU/Linux、Mac OS 和 Windows 系统，可以在主流的 GNU/Linux 操作系统上安装运行，包括 Debian、Fedora、CentOS、Oracle Linux、RHEL、SUSE/openSUSE 和 Ubuntu 。在撰写这篇教程时，其最新版本为 **2.2**。

**Debian 9** 系统上安装 .NET Core SDK，请按如下步骤进行。

首先，需要注册微软的密钥，接着把 .NET 源仓库地址添加进来，运行的命令如下： 

```
$ wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
$ sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
$ wget -q https://packages.microsoft.com/config/debian/9/prod.list
$ sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
$ sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
$ sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list
```

注册好密钥及添加完仓库源后，就可以安装 .NET SDK 了，命令如下：

```
$ sudo apt-get update
$ sudo apt-get install dotnet-sdk-2.2
```

**Debian 8 系统上安装：** 

增加微软密钥，添加 .NET 仓库源：

```
$ wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
$ sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
$ wget -q https://packages.microsoft.com/config/debian/8/prod.list
$ sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
$ sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
$ sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list
```

安装 .NET SDK：

```
$ sudo apt-get update
$ sudo apt-get install dotnet-sdk-2.2
```

**Fedora 28 系统上安装：**

增加微软密钥，添加 .NET 仓库源：

```
$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
$ wget -q https://packages.microsoft.com/config/fedora/27/prod.repo
$ sudo mv prod.repo /etc/yum.repos.d/microsoft-prod.repo
$ sudo chown root:root /etc/yum.repos.d/microsoft-prod.repo
```

现在, 可以安装 .NET SDK 了：

```
$ sudo dnf update
$ sudo dnf install dotnet-sdk-2.2
```

**Fedora 27 系统下：** 

增加微软密钥，添加 .NET 仓库源，命令如下：

```
$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
$ wget -q https://packages.microsoft.com/config/fedora/27/prod.repo
$ sudo mv prod.repo /etc/yum.repos.d/microsoft-prod.repo
$ sudo chown root:root /etc/yum.repos.d/microsoft-prod.repo
```

接着安装 .NET SDK ，命令如下：

```
$ sudo dnf update
$ sudo dnf install dotnet-sdk-2.2
```

**CentOS/Oracle 版本的 Linux 系统上：**

增加微软密钥，添加 .NET 仓库源，使其可用：

```
$ sudo rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
```

更新源仓库，安装 .NET SDK：

```
$ sudo yum update
$ sudo yum install dotnet-sdk-2.2
```

**openSUSE Leap 版本的系统上：**

添加密钥，使仓库源可用，安装必需的依赖包，其命令如下：

```
$ sudo zypper install libicu
$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
$ wget -q https://packages.microsoft.com/config/opensuse/42.2/prod.repo
$ sudo mv prod.repo /etc/zypp/repos.d/microsoft-prod.repo
$ sudo chown root:root /etc/zypp/repos.d/microsoft-prod.repo
```

更新源仓库，安装 .NET SDK，命令如下：

```
$ sudo zypper update
$ sudo zypper install dotnet-sdk-2.2
```

**Ubuntu 18.04 LTS 版本的系统上：**

注册微软的密钥和 .NET Core 仓库源，命令如下：

```
$ wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
$ sudo dpkg -i packages-microsoft-prod.deb
```

使 Universe 仓库可用：

```
$ sudo add-apt-repository universe
```

然后，安装 .NET Core SDK ，命令如下：

```
$ sudo apt-get install apt-transport-https
$sudo apt-get update
$ sudo apt-get install dotnet-sdk-2.2
```

**Ubuntu 16.04 LTS 版本的系统上：**

注册微软的密钥和 .NET Core 仓库源，命令如下：

```
$ wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
$ sudo dpkg -i packages-microsoft-prod.deb
```

然后安装 .NET core SDK：

```
$ sudo apt-get install apt-transport-https
$ sudo apt-get update
$ sudo apt-get install dotnet-sdk-2.2
```

### 创建你的第一个应用程序

我们已经成功的在 Linux 机器中安装了 .NET Core SDK。是时候使用 dotnet 创建第一个应用程序了。

接下来的目的，我们会创建一个名为 ostechnixApp 的应用程序。为此，可以简单的运行如下命令：

```
$ dotnet new console -o ostechnixApp
```

**示例输出：**

```
Welcome to .NET Core!
---------------------
Learn more about .NET Core: https://aka.ms/dotnet-docs
Use 'dotnet --help' to see available commands or visit: https://aka.ms/dotnet-cli-docs

Telemetry
---------
The .NET Core tools collect usage data in order to help us improve your experience. The data is anonymous and doesn't include command-line arguments. The data is collected by Microsoft and shared with the community. You can opt-out of telemetry by setting the DOTNET_CLI_TELEMETRY_OPTOUT environment variable to '1' or 'true' using your favorite shell.

Read more about .NET Core CLI Tools telemetry: https://aka.ms/dotnet-cli-telemetry

ASP.NET Core
------------
Successfully installed the ASP.NET Core HTTPS Development Certificate.
To trust the certificate run 'dotnet dev-certs https --trust' (Windows and macOS only). For establishing trust on other platforms refer to the platform specific documentation.
For more information on configuring HTTPS see https://go.microsoft.com/fwlink/?linkid=848054.
Getting ready...
The template "Console Application" was created successfully.

Processing post-creation actions...
Running 'dotnet restore' on ostechnixApp/ostechnixApp.csproj...
Restoring packages for /home/sk/ostechnixApp/ostechnixApp.csproj...
Generating MSBuild file /home/sk/ostechnixApp/obj/ostechnixApp.csproj.nuget.g.props.
Generating MSBuild file /home/sk/ostechnixApp/obj/ostechnixApp.csproj.nuget.g.targets.
Restore completed in 894.27 ms for /home/sk/ostechnixApp/ostechnixApp.csproj.

Restore succeeded.
```

正如上面的输出所示的，.NET 已经为我们创建一个控制台类型的应用程序。`-o` 参数创建了一个名为 “ostechnixApp” 的目录，其包含有存储此应用程序数据所必需的文件。

让我们切换到 ostechnixApp 目录，看看里面有些什么。

```
$ cd ostechnixApp/
$ ls
obj ostechnixApp.csproj Program.cs
```

可以看到有两个名为 `ostechnixApp.csproj` 和 `Program.cs` 的文件，以及一个名为 `ojb` 的目录。默认情况下,  `Program.cs` 文件包含有可以在控制台中运行的 “Hello World” 程序代码。可以看看此代码：

```
$ cat Program.cs 
using System;

namespace ostechnixApp
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

要运行此应用程序，可以简单的使用如下命令：

```
$ dotnet run
Hello World!
```

![](https://www.ostechnix.com/wp-content/uploads/2018/12/run-dotnet.png)

很简单，对吧？是的，就是如此简单。现在你可以在 `Program.cs` 这文件中写上自己的代码，然后像上面所示的执行。

或者，你可以创建一个新的目录，如例子所示的 `mycode` 目录，命令如下：

```
$ mkdir ~/.mycode
$ cd mycode/
```

然后运行如下命令，使其成为你的新开发环境目录：

```
$ dotnet new console
```

示例输出：

```
The template "Console Application" was created successfully.

Processing post-creation actions...
Running 'dotnet restore' on /home/sk/mycode/mycode.csproj...
Restoring packages for /home/sk/mycode/mycode.csproj...
Generating MSBuild file /home/sk/mycode/obj/mycode.csproj.nuget.g.props.
Generating MSBuild file /home/sk/mycode/obj/mycode.csproj.nuget.g.targets.
Restore completed in 331.87 ms for /home/sk/mycode/mycode.csproj.

Restore succeeded.
```

上的命令会创建两个名叫 `mycode.csproj` 和 `Program.cs` 的文件及一个名为 `obj` 的目录。用你喜欢的编辑器打开 `Program.cs` 文件, 删除或修改原来的 “hello world” 代码段，然后编写自己的代码。

写完代码，保存，关闭 `Program.cs` 文件，然后运行此应用程序，命令如下：

```
$ dotnet run
```

想要查看安装的 .NET core SDK 的版本的话，可以简单的运行：

```
$ dotnet --version
2.2.101
```

要获得帮助，请运行：

```
$ dotnet --help
```

### 使用微软的 Visual Studio Code 编辑器

要编写代码，你可以任选自己喜欢的编辑器。同时微软自己也有一款支持 .NET 的编辑器，其名为 “Microsoft Visual Studio Code”。它是一款开源、轻量级、功能强大的源代码编辑器。其内置了对 JavaScript、TypeScript 和 Node.js 的支持，并为其它语言（如 C++、C#、Python、PHP、Go）和运行时态（如 .NET 和 Unity）提供了丰富的扩展，已经形成一个完整的生态系统。它是一款跨平台的代码编辑器，所以在微软的 Windows 系统、GNU/Linux 系统和 Mac OS X 系统都可以使用。如果对其感兴趣，就可以使用。

想了解如何在 Linux 上安装和使用，请参阅以下指南。

[Linux 中安装 Microsoft Visual Studio Code][3]

关于 Visual Studio Code editor 中 .NET Core 和 .NET Core SDK 工具的使用，[此网页][1]有一些基础的教程。想了解更多就去看看吧。

### Telemetry

默认情况下，.NET core SDK 会采集用户使用情况数据，此功能被称为 Telemetry。采集数据是匿名的，并根据[知识共享署名许可][2]分享给其开发团队和社区。因此 .NET 团队会知道这些工具的使用状况，然后根据统计做出决策，改进产品。如果你不想分享自己的使用信息的话，可以使用顺手的 shell 工具把名为 `DOTNET_CLI_TELEMETRY_OPTOUT` 的环境变量参数设置为 `1` 或 `true`，这样就简单的关闭此功能了。

就这样。你已经知道如何在各 Linux 平台上安装 .NET Core SDK 以及知道如何创建基本的应用程序了。想了解更多 .NET 使用知识的话，请参阅此文章末尾给出的链接。

会爆出更多干货的。敬请关注！

祝贺下!

### 资源

- [.NET Core](https://dotnet.microsoft.com/)


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-install-microsoft-net-core-sdk-on-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://docs.microsoft.com/en-us/dotnet/core/tutorials/index
[2]: https://creativecommons.org/licenses/by/4.0/
[3]: https://www.ostechnix.com/install-microsoft-visual-studio-code-linux/
