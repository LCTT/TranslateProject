[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12418-1.html)
[#]: subject: (How to decipher Linux release info)
[#]: via: (https://www.networkworld.com/article/3565432/how-to-decipher-linux-release-info.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何解密 Linux 版本信息
======

> 显示和解释有关 Linux 版本的信息比看起来要复杂一些。

![christin hume / Linux / Modified by IDG Comm.][1]

与引用一个简单的版本号不同，识别 Linux 版本有很多种方法。即使只是快速查看一下 `uname` 命令的输出，也可以告诉你一些信息。这些信息是什么，它告诉你什么？

在本文中，我们将认真研究 `uname` 命令的输出以及其他一些命令和文件提供的版本说明。

### 使用 uname

每当在 Linux 系统终端窗口中执行命令 `uname -a` 时，都会显示很多信息。那是因为这个小小的 `a` 告诉 `uname` 命令你想查看该命令能提供的*全部*输出。结果显示的内容将告诉你许多有关该系统的各种信息。实际上，显示的每一块信息都会告诉你一些关于系统的不同信息。

例如，`uname -a` 输出看起来像这样：

```
$ uname -a
Linux dragonfly 5.4.0-37-generic #41-Ubuntu SMP Wed Jun 3 18:57:02 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
```

尽管这可能不太重要，但你可以使用一个按适当的顺序包含 `uname` 所有选项来显示相同的信息：

```
$ uname -snmrvpio
Linux dragonfly 5.4.0-37-generic #41-Ubuntu SMP Wed Jun 3 18:57:02 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
```

要将这一长串信息分解为单独的块，可以使用类似这样的 `for` 循环来遍历每个选项：

```
$ for option in s n m r v p i o; do echo -n "$option: "; uname -$option; done
s: Linux
n: dragonfly
m: x86_64
r: 5.4.0-37-generic
v: #41-Ubuntu SMP Wed Jun 3 18:57:02 UTC 2020
p: x86_64
i: x86_64
o: GNU/Linux
```

该循环显示了该选项提供了哪些信息。`uname` 手册页提供了每个选项的描述。以下是清单：

- Linux –- 内核名称（选项 `s`）
- dragonfly –- 节点名（选项 `n`）
- x86_64 –- 机器硬件名（选项 `m`）
- 5.4.0-37-generic –- 内核发布版本（选项 `r`）
- #41-Ubuntu SMP Wed Jun 3 18:57:02 UTC 2020 -- 内核版本（选项 `v`）
- x86_64 –- 处理器（选项 `p`）
- x86_64 –- 硬件平台（选项 `i`）
- GNU/Linux –- 操作系统（选项 `o`）

要更深入地研究显示的信息，请认真查看显示的内核发行数据。第四行中的 `5.4.0-37` 不仅仅是一串任意数字。每个数字都很重要。

 * `5` 表示内核版本
 * `4` 表示主要版本
 * `0` 表示次要版本
 * `37` 表示最新补丁

此外，在上面的循环中输出的第 5 行（内核版本）中的 `#41` 表示此发布版本已编译 41 次。

如果你只想显示所有信息中的一项，那么单个选项可能很有用。例如，命令 `uname -n` 可以仅告诉你系统名称，而 `uname -r` 仅可以告诉你内核发布版本。在盘点服务器或构建脚本时，这些和其他选项可能很有用。

在 Red Hat 系统时，`uname -a` 命令将提供相同种类的信息。这是一个例子：

```
$ uname -a
Linux fruitfly 4.18.0-107.el8.x86_64 #1 SMP Fri Jun 14 13:46:34 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
```

### 发行版信息

如果你需要了解运行的发行版是什么，那么 `uname` 的输出不会对你有太大帮助。毕竟，内核版本与发行版不同。关于这个信息，你可以在 Ubuntu 和其他基于 Debian 的系统上使用 `lsb_release -r` 命令，而在 Red Hat 上可以显示 `/etc/redhat-release` 文件的内容。

对于 Debian 系统：

```
$ lsb_release -r
Release: 20.04
```

对于 Red Hat 及相关系统：

```
$ cat /etc/redhat-release
Red Hat Enterprise Linux release 8.1 Beta (Ootpa)
```

### 使用 /proc/version

`/proc/version` 文件还可以提供有关 Linux 版本的信息。该文件中提供的信息与 `uname -a` 输出有很多共同点。以下是例子。

在 Ubuntu 上：

```
$ cat /proc/version
Linux version 5.4.0-37-generic (buildd@lcy01-amd64-001) (gcc version 9.3.0 (Ubuntu 9.3.0-10ubuntu2)) #41-Ubuntu SMP Wed Jun 3 18:57:02 UTC 2020
```

在 RedHat 上：

```
$ cat /proc/version
Linux version 4.18.0-107.el8.x86_64 (mockbuild@x86-vm-09.build.eng.bos.redhat.com) (gcc version 8.3.1 20190507 (Red Hat 8.3.1-4) (GCC)) #1 SMP Fri Jun 14 13:46:34 UTC 2019
```

### 总结

Linux 系统提供了很多关于内核和发行版安装的信息。你只需要知道在哪里或如何寻找并理解它的含义。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3565432/how-to-decipher-linux-release-info.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2020/07/linux_woman-with-laptop_keyboard_code_programmer_devops_by-christin-hume-via-unsplash_linux_-100850842-large.jpg
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
