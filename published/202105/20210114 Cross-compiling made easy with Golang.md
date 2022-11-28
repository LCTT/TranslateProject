[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13385-1.html"
[#]: subject: "Cross-compiling made easy with Golang"
[#]: via: "https://opensource.com/article/21/1/go-cross-compiling"
[#]: author: "Gaurav Kamathe https://opensource.com/users/gkamathe"

使用 Golang 的交叉编译
======

> 走出舒适区，我了解了 Go 的交叉编译功能。

![](https://img.linux.net.cn/data/attachment/album/202105/13/092632nrg2z17i8vea4cf8.jpg)

在 Linux 上测试软件时，我使用各种架构的服务器，例如 Intel、AMD、Arm 等。当我 [分配了一台满足我的测试需求的 Linux 机器][2]，我仍然需要执行许多步骤：

  1. 下载并安装必备软件
  2. 验证构建服务器上是否有新的测试软件包
  3. 获取并设置依赖软件包所需的 yum 仓库
  4. 下载并安装新的测试软件包（基于步骤 2）
  5. 获取并设置必需的 SSL 证书
  6. 设置测试环境，获取所需的 Git 仓库，更改配置，重新启动守护进程等
  7. 做其他需要做的事情

### 用脚本自动化

这些步骤非常常规，以至于有必要对其进行自动化并将脚本保存到中央位置（例如文件服务器），在需要时可以在此处下载脚本。为此，我编写了 100-120 行的 Bash shell 脚本，它为我完成了所有配置（包括错误检查）。这个脚本通过以下方式简化了我的工作流程：

  1. 配置新的 Linux 系统（支持测试的架构）
  2. 登录系统并从中央位置下载自动化 shell 脚本
  3. 运行它来配置系统
  4. 开始测试

### 学习 Go 语言

我想学习 [Go 语言][3] 有一段时间了，将我心爱的 Shell 脚本转换为 Go 程序似乎是一个很好的项目，可以帮助我入门。它的语法看起来很简单，在尝试了一些测试程序后，我开始着手提高自己的知识并熟悉 Go 标准库。

我花了一个星期的时间在笔记本电脑上编写 Go 程序。我经常在我的 x86 服务器上测试程序，清除错误并使程序健壮起来，一切都很顺利。

直到完全转换到 Go 程序前，我继续依赖自己的 shell 脚本。然后，我将二进制文件推送到中央文件服务器上，以便每次配置新服务器时，我要做的就是获取二进制文件，将可执行标志打开，然后运行二进制文件。我对早期的结果很满意：

```
$ wget http://file.example.com/<myuser>/bins/prepnode
$ chmod  +x ./prepnode
$ ./prepnode
```

### 然后，出现了一个问题

第二周，我从资源池中分配了一台新的服务器，像往常一样，我下载了二进制文件，设置了可执行标志，然后运行二进制文件。但这次它出错了，是一个奇怪的错误：

```
$ ./prepnode
bash: ./prepnode: cannot execute binary file: Exec format error
$
```

起初，我以为可能没有成功设置可执行标志。但是，它已按预期设置：

```
$ ls -l prepnode
-rwxr-xr-x. 1 root root 2640529 Dec 16 05:43 prepnode
```

发生了什么事？我没有对源代码进行任何更改，编译没有引发任何错误或警告，而且上次运行时效果很好，因此我仔细查看了错误消息 `format error`。

我检查了二进制文件的格式，一切看起来都没问题：

```
$ file prepnode
prepnode: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped
```

我迅速运行了以下命令，识别所配置的测试服务器的架构以及二进制试图运行的平台。它是 Arm64 架构，但是我编译的二进制文件（在我的 x86 笔记本电脑上）生成的是 x86-64 格式的二进制文件：

```
$ uname -m
aarch64
```

### 脚本编写人员的编译第一课

在那之前，我从未考虑过这种情况（尽管我知道这一点）。我主要研究脚本语言（通常是 Python）以及 Shell 脚本。在任何架构的大多数 Linux 服务器上都可以使用 Bash Shell 和 Python 解释器。总之，之前一切都很顺利。

但是，现在我正在处理 Go 这种编译语言，它生成可执行的二进制文件。编译后的二进制文件由特定架构的 [指令码][4] 或汇编指令组成，这就是为什么我收到格式错误的原因。由于 Arm64 CPU（运行二进制文件的地方）无法解释二进制文件的 x86-64 指令，因此它抛出错误。以前，shell 和 Python 解释器为我处理了底层指令码或特定架构的指令。

### Go 的交叉编译

我检查了 Golang 的文档，发现要生成 Arm64 二进制文件，我要做的就是在运行 `go build` 命令编译 Go 程序之前设置两个环境变量。

`GOOS` 指的是操作系统，例如 Linux、Windows、BSD 等，而 `GOARCH` 指的是要在哪种架构上构建程序。

```
$ env GOOS=linux GOARCH=arm64 go build -o prepnode_arm64
```

构建程序后，我重新运行 `file` 命令，这一次它显示的是 ARM AArch64，而不是之前显示的 x86。因此，我在我的笔记本上能为不同的架构构建二进制文件。

```
$ file prepnode_arm64
prepnode_arm64: ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, not stripped
```

我将二进制文件从笔记本电脑复制到 ARM 服务器上。现在运行二进制文件（将可执行标志打开）不会产生任何错误：

```
$ ./prepnode_arm64  -h
Usage of ./prepnode_arm64:
  -c    Clean existing installation
  -n    Do not start test run (default true)
  -s    Use stage environment, default is qa
  -v    Enable verbose output
```

### 其他架构呢？

x86 和 Arm 是我测试软件所支持的 5 种架构中的两种，我担心 Go 可能不会支持其它架构，但事实并非如此。你可以查看 Go 支持的架构：

```
$ go tool dist list
```

Go 支持多种平台和操作系统，包括：

  * AIX
  * Android
  * Darwin
  * Dragonfly
  * FreeBSD
  * Illumos
  * JavaScript
  * Linux
  * NetBSD
  * OpenBSD
  * Plan 9
  * Solaris
  * Windows

要查找其支持的特定 Linux 架构，运行：

```
$ go tool dist list | grep linux
```

如下面的输出所示，Go 支持我使用的所有体系结构。尽管 x86_64 不在列表中，但 AMD64 兼容 x86-64，所以你可以生成 AMD64 二进制文件，它可以在 x86 架构上正常运行：

```
$ go tool dist list | grep linux
linux/386
linux/amd64
linux/arm
linux/arm64
linux/mips
linux/mips64
linux/mips64le
linux/mipsle
linux/ppc64
linux/ppc64le
linux/riscv64
linux/s390x
```

### 处理所有架构

为我测试的所有体系结构生成二进制文件，就像从我的 x86 笔记本电脑编写一个微小的 shell 脚本一样简单：

```
#!/usr/bin/bash
archs=(amd64 arm64 ppc64le ppc64 s390x)

for arch in ${archs[@]}
do
        env GOOS=linux GOARCH=${arch} go build -o prepnode_${arch}
done

```

```
$ file prepnode_*
prepnode_amd64:   ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, Go BuildID=y03MzCXoZERH-0EwAAYI/p909FDnk7xEUo2LdHIyo/V2ABa7X_rLkPNHaFqUQ6/5p_q8MZiR2WYkA5CzJiF, not stripped
prepnode_arm64:   ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, Go BuildID=q-H-CCtLv__jVOcdcOpA/CywRwDz9LN2Wk_fWeJHt/K4-3P5tU2mzlWJa0noGN/SEev9TJFyvHdKZnPaZgb, not stripped
prepnode_ppc64:   ELF 64-bit MSB executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linked, Go BuildID=DMWfc1QwOGIq2hxEzL_u/UE-9CIvkIMeNC_ocW4ry/r-7NcMATXatoXJQz3yUO/xzfiDIBuUxbuiyaw5Goq, not stripped
prepnode_ppc64le: ELF 64-bit LSB executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linked, Go BuildID=C6qCjxwO9s63FJKDrv3f/xCJa4E6LPVpEZqmbF6B4/Mu6T_OR-dx-vLavn1Gyq/AWR1pK1cLz9YzLSFt5eU, not stripped
prepnode_s390x:   ELF 64-bit MSB executable, IBM S/390, version 1 (SYSV), statically linked, Go BuildID=faC_HDe1_iVq2XhpPD3d/7TIv0rulE4RZybgJVmPz/o_SZW_0iS0EkJJZHANxx/zuZgo79Je7zAs3v6Lxuz, not stripped
```

现在，每当配置一台新机器时，我就运行以下 `wget` 命令下载特定体系结构的二进制文件，将可执行标志打开，然后运行：

```
$ wget http://file.domain.com/<myuser>/bins/prepnode_<arch>
$ chmod +x ./prepnode_<arch>
$ ./prepnode_<arch>
```

### 为什么？

你可能想知道，为什么我没有坚持使用 shell 脚本或将程序移植到 Python 而不是编译语言上来避免这些麻烦。所以有舍有得，那样的话我不会了解 Go 的交叉编译功能，以及程序在 CPU 上执行时的底层工作原理。在计算机中，总要考虑取舍，但绝不要让它们阻碍你的学习。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/go-cross-compiling

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD "Person using a laptop"
[2]: https://opensource.com/article/20/12/linux-server
[3]: https://golang.org/
[4]: https://en.wikipedia.org/wiki/Opcode