[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10999-1.html)
[#]: subject: (Installing alternative versions of RPMs in Fedora)
[#]: via: (https://fedoramagazine.org/installing-alternative-rpm-versions-in-fedora/)
[#]: author: (Adam Šamalík https://fedoramagazine.org/author/asamalik/)

在 Fedora 中安装替代版本的 RPM 包
======

![][1]

<ruby>[模块化][2]<rt>Modularity</rt></ruby>使 Fedora 能够在仓库中提供替代版本的 RPM 软件包。每个 Fedroa 版本可以原生构建不同应用、语言运行时和工具版本的多个版本。

Fedora Magazine 大约一年前就写了 [Fedora 28 服务器版的模块化][3]。那时，它只是一个有附加内容的可选仓库，并且明确只支持服务器版。到目前为止，它已经发生了很多变化，现在**模块化是 Fedora 发行版的核心部分**。一些软件包已完全变成模块。在编写本文时，Fedora 30 的 49,464 个二进制 RPM 软件包中的 1,119（2.26％）来自模块（[关于这个数字的更多信息][4]）。

### 模块化基础知识

由于许多软件包有不同的版本会让人难以承受（并且难以管理），所以包被分组为**模块**，它可以代表一个应用程序、一个语言运行时或任何其他合理的组。

模块通常有多个**流**，这通常代表软件的主要版本。它可以并行使用，但在给定系统上只能安装每个模块的一个流。

为了不让用户因为太多选择而难以承受，每个 Fedora 版本都有一组**默认**，因此只需要在需要时做出决定。

最后，为了简化安装，可以根据用例使用预定义的 **profile** 选择性地安装模块。例如，数据库模块可以作为客户端，服务端或同时安装。

### 实际使用模块化

当你在 Fedora 系统上安装 RPM 软件包时，它很可能它来自模块流。你可能没有注意到的原因之一是模块化的核心原则之一是在你探究之前保持不可见。

让我们比较以下两种情况。首先，安装流行的 i3 平铺窗口管理器，然后安装极简化的 dwm 窗口管理器：

```
$ sudo dnf install i3
...
Done!
```

正如所料，上面的命令会在系统上安装 i3 包及其依赖项。这里没有其他事情发生。但另一个会怎么样？

```
$ sudo dnf install dwm
...
Enabling module streams:
  dwm                 6.1
...
Done!
```

感觉是一样的，但后台发生了一些事情 。它启用了默认的 dwm 模块流（6.1），并且安装了模块中的 dwm 包。

为了保持透明，输出中有一条关于模块自动启用的消息。但除此之外，用户不需要了解模块化的任何信息，以便按照他们一贯的方式使用他们的系统。

但如果他们使用模块化方式呢？让我们看看如何安装不同版本的 dwm。

使用以下命令查看可用的模块流：

```
$ sudo dnf module list
...
dwm                 latest                ...
dwm                 6.0                   ...
dwm                 6.1 [d]               ...
dwm                 6.2                   ...
...
Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled
```

输出显示 dwm 模块有四个流，6.1 是默认值。

要安装不同版本的 dwm 包，例如，安装 6.2 的流。启用它，然后使用以下两个命令安装软件包：

```
$ sudo dnf module enable dwm:6.2
...
Enabling module streams:
  dwm                 6.2
...
Done!
$ sudo dnf install dwm
...
Done!
```

最后，让我们看下配置，以 PostgreSQL 为例。

```
$ sudo dnf module list
...
postgresql          9.6            client, server     ...
postgresql          10             client, server     ...
postgresql          11             client, server     ...
...
```

要安装 PostgreSQL 11 服务端，使用以下命令：

```
$ sudo dnf module install postgresql:11/server
```

请注意，除了启用流之外，我们可以指定配置从而使用一条命令安装模块。

可以立即安装多个版本。要添加客户端工具，使用下面的命令：

```
$ sudo dnf module install postgresql:11/client
```

还有许多其他带有多个流的模块可供选择。在编写本文时，Fedora 30 中有 83 个模块流。包括两个版本的 MariaDB、三个版本的 Node.js、两个版本的 Ruby 等等。

有关完整的命令集（包括从一个流切换到另一个流），请参阅[模块化的官方用户文档][5]。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/installing-alternative-rpm-versions-in-fedora/

作者：[Adam Šamalík][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/asamalik/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/06/modularity-f30-816x345.jpg
[2]: https://docs.pagure.org/modularity
[3]: https://linux.cn/article-10479-1.html
[4]: https://blog.samalik.com/2019/06/12/counting-modularity-packages.html
[5]: https://docs.fedoraproject.org/en-US/modularity/using-modules/
