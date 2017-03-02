如何在 Linux 中启用 Shell 脚本的调试模式
============================================================


脚本是存储在一个文件的一系列命令。在终端上输入一个个命令，按顺序执行的方法太弱了，使用脚本，系统中的用户可以在一个文件中存储所有命令，反复调用该文件多次重新执行命令。

在 [学习脚本][1] 或写脚本的初期阶段，我们通常从写小脚本或者几行命令的短脚本开始，调试这样的脚本时我们通常无非就是通过观察它们的输出来确保其正常工作。

然而，当我们开始写非常长或上千行命令的高级脚本，例如改变系统设置的脚本，[在网络上执行关键备份][2] 等等，我们会意识到仅仅看脚本输出是不足以在脚本中找到 Bug 的！

因此，在 Linux 系列中这篇介绍 Shell 脚本调试， 我们将看看如何启用 Shell 脚本调试，然后在之后的系列中解释不同的 Shell 脚本调试模式以及如何使用它们。

### 如何开始写一个脚本

一个脚本与其它文件的区别是它的首行，它包含 `#!` （She-Bang - 释伴：定义文件类型）和路径名（解释器路径），通知系统该文件是一个命令集合，将被指定程序(解释器)解释。

下面是不同类型脚本 `首行` 示例：

```
#!/bin/sh          [sh 脚本]
#!/bin/bash        [bash 脚本] 
#!/usr/bin/perl    [perl 程序]
#!/bin/awk -f      [awk 脚本]   
```

注意：如果脚本仅包含一组标准系统命令，没有任何内部 Shell 指令，首行或 `#!`  可以去掉。

### 如何在 Linux 操作系统执行 Shell 脚本


调用一个脚本脚本的常规语法是：

```
$ 脚本名  参数1 ... 参数N
```

另一种可能的形式是明确指定将执行这个脚本的  Shell，如下：

```
$ shell 脚本名  参数1 ... 参数N
```

示例：

```
$ /bin/bash   参数1 ... 参数N     [bash 脚本]
$ /bin/ksh   参数1 ... 参数N      [ksh 脚本]
$ /bin/sh   参数1 ... 参数N       [sh 脚本]
```

对于没有 `#!` 作为首行，仅包含基础系统命令的脚本，示例如下：

```
### 脚本仅包含标准系统命令
cd /home/$USER
mkdir tmp
echo "tmp directory created under /home/$USER"
```

使它可执行并运行，如下：

```
$ chmod +x  脚本名
$ ./脚本名 
```

### 启用 Shell 脚本调试模式的方法

下面是主要的 Shell 脚本调试选项：

- `-v` （verbose 的简称） - 告诉 Shell 读取脚本时显示所有行，激活详细模式。
- `-n` （noexec 或 no ecxecution 简称） - 指示 Shell 读取所有命令然而不执行它们，这个选项激活语法检查模式。
- `-x` （xtrace 或 execution trace 简称） - 告诉 Shell 在终端显示所有执行的命令和它们的参数。 这个选项是启用 Shell 跟踪模式。

#### 1、 改变 Shell 脚本首行

第一个机制是改变 Shell 脚本首行，如下，这会启动脚本调试。

```
#!/bin/sh 选项
```

其中， 选项可以是上面提到的一个或多个调试选项。

#### 2、 调用 Shell 调试选项

第二个是使用如下调试选项启动 Shell，这个方法也会打开整个脚本调试。

```
$ shell 选项   参数1 ... 参数N
```

示例：

```
$ /bin/bash 选项   参数1 ... 参数N
```

#### 3、 使用 Shell 内置命令 set

第三个方法是使用内置命令 `set` 去调试一个给定的 Shell 脚本部分，如一个函数。这个机制是重要的，因为它让我们可以去调试任何一段 Shell 脚本。

我们可以如下使用 `set` 命令打开调试模式，其中选项是之前提到的所有调试选项。

```
$ set 选项 
```

启用调试模式：

```
$ set -选项
```

禁用调试模式：

```
$ set +选项
```

此外，如果我们在 Shell 脚本不同部分启用了几个调试模式，我们可以一次禁用所有调试模式，如下：

```
$ set -
```

关于启用 Shell 脚本调试模式，先讲这些。正如我们看到的，我们可以调试一整个 Shell 脚本或者特定部分脚本。

在此系列下面的两篇文章中，我们会举例介绍如何使用 Shell 脚本调试选项，进一步了解 详细（verbose）、语法检查（syntax checking）、 跟踪（tracing）调试模式。

更重要的是，关于这个指南，欢迎通过下面评论提出任何问题或反馈。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/enable-shell-debug-mode-linux/

作者：[Aaron Kili][a]
译者：[imxieke](https://github.com/imxieke)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/category/bash-shell/
[2]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
