如何在 Linux 中启用 Shell 脚本 调试模式
============================================================


脚本是一个存储命令的简单列表，而不是在运行的终端按顺序一个一个输入命令，一个系统用户可以存储所有命令在一个文件中反复调用该文件多次重新执行命令


在 [学习脚本][1] 或写脚本的初期阶段，我们通常开始写小脚本或者几行命令短脚本，我们通常打算调试这样的脚本无非就是通过观察它们的输出来确保正常工作。


然而，当我们开始写非常长或上千行命令的高级脚本，例如改变系统设置的脚本。
[在网络执行关键备份][2] 等等，我们会实现他们仅仅看脚本输出是不足以在脚本中找到 Bugs 的！


因此，在 Linux 系列操作系统中 调试 Shell 脚本， `我们将会通过如何启用 Shell 脚本调试 `  移动到解释不同的 Shell 脚本调试模式和在后序如何使用它们。

### 如何开始写一个脚本

一个脚本与其它文件的区别是它的首行，它包含 `#!` (She-Bang - 定义文件类型) 和路径名(路径解释器) 通知系统该文件是一个命令集合，它会被指定程序(解释器)解释。

下面是不同类型脚本 `首行` 示例

```
#!/bin/sh          [For sh scripting]
#!/bin/bash        [For bash scripting] 
#!/usr/bin/perl    [For perl programming]
#!/bin/awk -f      [For awk scripting]   
```

Note: 首行或 `#!`  可以离开脚本仅包含一组标准系统命令，没有任何内部 Shell 指令。

### 如何在 Linux 操作系统执行 Shell 脚本


调用一个脚本脚本的常规语法是:

```
$ script_name  argument1 ... argumentN
```

其他可能的形式是明确指定 Shell 它将执行这个脚本 ，如下:

```
$ shell script_name argument1 ... argumentN  
```

示例：

```
$ /bin/bash script_name argument1 ... argumentN     [For bash scripting]
$ /bin/ksh script_name argument1 ... argumentN      [For ksh scripting]
$ /bin/sh script_name argument1 ... argumentN       [For sh scripting]
```

对于没有 `#!` 的脚本作为首行仅包含基础系统命令比如下面这个：

```
#script containing standard system commands
cd /home/$USER
mkdir tmp
echo "tmp directory created under /home/$USER"
```

简单的使它可执行并运行 如下:

```
$ chmod +x  script_name
$ ./script_name 
```

### 启用 Shell 脚本调试模式方法

下面是唯一 Shell 脚本调试选项：

1. `-v` (short for verbose) - 告诉 Shell 在脚本中显示所有行当他们阅读时激活详细模式。
2. `-n` (short for noexec or no ecxecution) - 指示 Shell 读取所有命令 然而不执行它们，这个选项激活语法检查模式。
3. `-x` (short for xtrace or execution trace) - 告诉 Shell 当它们执行在终端显示所有命令和他们的参数。 这个选项是启用 Shell 跟踪模式。


#### 1\. 改变 Shell 脚本首行

第一个机制是改变 Shell 脚本首行 如下，这会启用调试整个脚本。

```
#!/bin/sh option(s)
```

在上面形式， 选项可以是一个或一个组合的调试选项

#### 2.\ 调用 Shell 调试选项

第二个调用 Shell 调试选项 如下，这个方法也会打开整个脚本调试。

```
$ shell option(s) script_name argument1 ... argumentN
```

示例：

```
$ /bin/bash option(s) script_name argument1 ... argumentN   
```

#### 3\. 使用 Shell 内置命令 set

第三个方法是使用 内置命令 set 去调试一个给定的 Shell 脚本部分，如一个函数这个组合式重要的 它允许我们去激活调试任何一段 Shell 脚本。

我们可以打开调试模式在下面形式使用 set 命令，其中选项是所有选项。

```
$ set option 
```

启用调试模式：

```
$ set -option
```

禁用调试模式：

```
$ set +option
```

此外，如果我们在 Shell 脚本中在启用几个调试模式在不同的部分，我们可以马上禁用它们，就像这样：


```
$ set -
```


现在启用 Shell 脚本调试模式， 正如我们看到的，我们可以调试一整个 Shell 脚本或者特定部分脚本。

在下两个文章，我们会讨论如何使用 Shell 脚本调试选项去解释冗长、语法检查、 Shell 跟踪调试模式示例！

更重要的是，不要忘记去提问关于这个 Guide 的任何问题或也许提供给我们反馈通过下面评论部分，直到那时，保持 Tecmint 连接。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/enable-shell-debug-mode-linux/

作者：[Aaron Kili][a]
译者：[imxieke](https://github.com/imxieke)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/category/bash-shell/
[2]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
