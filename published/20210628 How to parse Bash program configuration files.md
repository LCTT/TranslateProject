[#]: subject: (How to parse Bash program configuration files)
[#]: via: (https://opensource.com/article/21/6/bash-config)
[#]: author: (David Both https://opensource.com/users/dboth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13561-1.html)

如何解析 Bash 程序的配置文件
======

> 将配置文件与代码分离，使任何人都可以改变他们的配置，而不需要任何特殊的编程技巧。

![](https://img.linux.net.cn/data/attachment/album/202107/08/163606y3287i6c7dqq0223.jpg)

将程序配置与代码分离是很重要的。它使非程序员能够改变配置而不需要修改程序的代码。如果是编译好的二进制可执行文件，这对非程序员来说是不可能的，因为它不仅需要访问源文件（我们在开源程序中会这样），而且还需要程序员的技能组合。很少有人有这种能力，而且大多数人都不想学习它。

对于像 Bash 这样的 shell 语言，由于 shell 脚本没有被编译成二进制格式，所以从定义上讲，源码是可以访问的。尽管有这种开放性，但对于非程序员来说，在 shell 脚本中钻研和修改它们并不是一个特别好的主意。即使是经验丰富的开发人员和系统管理员，也会意外地做出一些导致错误或更糟的改变。

因此，将配置项放在容易维护的文本文件中，提供了分离，并允许非程序员编辑配置，而不会有对代码进行意外修改的危险。许多开发者对用编译语言编写的程序都是这样做的，因为他们并不期望用户是开发者。由于许多相同的原因，对解释型 shell 语言这样做也是有意义的。

### 通常的方式

和其他许多语言一样, 你可以为 Bash 程序编写代码，来读取并解析 ASCII 文本的配置文件、读取变量名称并在程序代码执行时设置值。例如，一个配置文件可能看起来像这样：

```
var1=LinuxGeek46
var2=Opensource.com
```

程序将读取文件，解析每一行，并将值设置到每个变量中。

### 源引

Bash 使用一种更简单的方法来解析和设置变量, 叫做<ruby>源引<rt>sourcing</rt></ruby>。从一个可执行的 shell 程序中获取一个外部文件是一种简单的方法，可以将该文件的内容完整地引入 shell 程序中。在某种意义上，这很像编译语言的 `include` 语句，在运行时包括库文件。这样的文件可以包括任何类型的 Bash 代码，包括变量赋值。

（LCTT 译注：对于使用 `source` 或 `.` 命令引入另外一个文件的行为，我们首倡翻译为“源引”。）

像往常一样，演示比解释更容易。

首先，创建一个 `~/bin` 目录（如果它还不存在的话），并将其作为当前工作目录（PWD）。[Linux 文件系统分层标准][2] 将 `~/bin` 定义为用户存储可执行文件的适当位置。

在这个目录下创建一个新文件。将其命名为 `main`，并使其可执行：

```
[dboth@david bin]$ touch main
[dboth@david bin]$ chmod +x main
[dboth@david bin]$
```

在这个可执行文件中添加以下内容：

```
#!/bin/bash
Name="LinuxGeek"
echo $Name
```

并执行这个 Bash 程序：

```
[dboth@david bin]$ ./main
LinuxGeek
[dboth@david bin]$
```

创建一个新的文件并命名为 `~/bin/data`。这个文件不需要是可执行的。在其中添加以下信息：

```
# Sourced code and variables
echo "This is the sourced code from the data file."
FirstName="David"
LastName="Both"
```

在 `main` 程序中增加三行，看起来像这样：

```
#!/bin/bash
Name="LinuxGeek"
echo $Name
source ~/bin/data
echo "First name: $FirstName"
echo "LastName: $LastName"
```

重新运行该程序：

```
[dboth@david bin]$ ./main
LinuxGeek
This is the sourced code from the data file.
First name: David
LastName: Both
[dboth@david bin]$
```

关于源引还有一件非常酷的事情要知道。你可以使用一个单点（`.`）作为 `source` 命令的快捷方式。改变 `main` 文件，用 `.` 代替 `source`。

```
#!/bin/bash
Name="LinuxGeek"
echo $Name
. ~/bin/data
echo "First name: $FirstName"
echo "LastName: $LastName"
```

并再次运行该程序。其结果应该与之前的运行完全相同。

### 运行 Bash

每一台使用 Bash 的 Linux 主机（几乎所有主机都是，因为 Bash 是所有发行版的默认 shell），都包括一些优秀的、内置的源引示例。

每当 Bash shell 运行时，它的环境必须被配置成可以使用的样子。有五个主要文件和一个目录用于配置 Bash 环境。它们和它们的主要功能如下：

  * `/etc/profile`: 系统级的环境和启动程序
  * `/etc/bashrc`: 系统级的函数和别名
  * `/etc/profile.d/`: 包含系统级的脚本的目录，用于配置各种命令行工具，如 `vim` 和 `mc` 以及系统管理员创建的任何自定义配置脚本
  * `~/.bash_profile`: 用户特定的环境和启动程序
  * `~/.bashrc`: 用户特定的别名和函数
  * `~/.bash_logout`: 用户特定的命令，在用户注销时执行

试着通过这些文件追踪执行顺序，确定它在非登录 Bash 初始化和登录 Bash 初始化中使用的顺序。我在我的 Linux 培训系列《[使用和管理 Linux：从零到系统管理员][3]》的第一卷第 17 章中这样做过。

给你一个提示。这一切都从 `~/.bashrc` 脚本开始。

### 总结

这篇文章探讨了在 Bash 程序中引用代码和变量的方法。这种从配置文件中解析变量的方法是快速、简单和灵活的。它提供了一种将 Bash 代码与变量赋值分开的方法，以使非程序员能够设置这些变量的值。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/bash-config

作者：[David Both][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: http://refspecs.linuxfoundation.org/fhs.shtml
[3]: http://www.both.org/?page_id=1183
