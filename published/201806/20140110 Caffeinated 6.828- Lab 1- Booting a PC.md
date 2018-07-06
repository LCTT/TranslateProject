Caffeinated 6.828：实验 1：PC 的引导过程
======

### 简介

这个实验分为三个部分。第一部分主要是为了熟悉使用 x86 汇编语言、QEMU x86 仿真器、以及 PC 的加电引导过程。第二部分查看我们的 6.828 内核的引导加载器，它位于 `lab`  树的 `boot` 目录中。第三部分深入到我们的名为 JOS 的 6.828 内核模型内部，它在 `kernel` 目录中。

#### 软件安装

本课程中你需要的文件和接下来的实验任务所需要的文件都是通过使用 [Git][1] 版本控制系统来分发的。学习更多关于 Git 的知识，请查看 [Git 用户手册][2]，或者，如果你熟悉其它的版本控制系统，这个 [面向 CS 的 Git 概述][3] 可能对你有帮助。

本课程在 Git 仓库中的地址是 https://exokernel.scripts.mit.edu/joslab.git 。在你的 Athena 帐户中安装文件，你需要运行如下的命令去克隆课程仓库。你也可以使用 `ssh -X athena.dialup.mit.edu` 去登入到一个公共的 Athena 主机。

```
athena% mkdir ~/6.828
athena% cd ~/6.828
athena% add git
athena% git clone https://exokernel.scripts.mit.edu/joslab.git lab
Cloning into lab...
athena% cd lab
athena%
```

Git 可以帮你跟踪代码中的变化。比如，如果你完成了一个练习，想在你的进度中打一个检查点，你可以运行如下的命令去提交你的变更：

```
athena% git commit -am 'my solution for lab1 exercise 9'
Created commit 60d2135: my solution for lab1 exercise 9
 1 files changed, 1 insertions(+), 0 deletions(-)
athena%
```

你可以使用 `git diff` 命令跟踪你的变更。运行 `git diff` 将显示你的代码自最后一次提交之后的变更，而 `git diff origin/lab1` 将显示这个实验相对于初始代码的变更。在这里，`origin/lab1` 是为了完成这个作业，从我们的服务器上下载的初始代码在 Git 分支上的名字。

在 Athena 上，我们为你配置了合适的编译器和模拟器。如果你要去使用它们，请运行 `add exokernel` 命令。 每次登入 Athena 主机你都必须要运行这个命令（或者你可以将它添加到你的 `~/.environment` 文件中）。如果你在编译或者运行 `qemu` 时出现晦涩难懂的错误，可以双击 "check" 将它添加到你的课程收藏夹中。

如果你使用的是非 Athena 机器，你需要安装 `qemu` 和 `gcc`，它们在 [工具页面][4] 目录中。为了以后的实验需要，我们做了一些 `qemu` 调试方面的变更和补丁，因此，你必须构建你自己的工具。如果你的机器使用原生的 ELF 工具链（比如，Linux 和大多数 BSD，但不包括 OS X），你可以简单地从你的包管理器中安装 `gcc`。除此之外，都应该按工具页面的指导去做。

#### 动手过程

我们为了你便于做实验，为你使用了不同的 Git 仓库。做实验用的仓库位于一个 SSH 服务器后面。你可以拥有你自己的实验仓库，其他的任何同学都不可访问你的这个仓库。为了通过 SSH 服务器的认证，你必须有一对 RSA 密钥，并让服务器知道你的公钥。

实验代码同时还带有一个脚本，它可以帮你设置如何访问你的实验仓库。在运行这个脚本之前，你必须在我们的  [submission web 界面][5] 上有一个帐户。在登陆页面上，输入你的 Athena 用户名，然后点击 “Mail me my password”。在你的邮箱中将马上接收到一封包含有你的 `6.828` 课程密码的邮件。注意，每次你点击这个按钮的时候，系统将随机给你分配一个新密码。

现在，你已经有了你的 `6.828` 密码，在 `lab` 目录下，运行如下的命令去配置实践仓库：

```
athena% make handin-prep
Using public key from ~/.ssh/id_rsa:
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD0lnnkoHSi4JDFA ...
Continue? [Y/n] Y

Login to 6.828 submission website.
If you do not have an account yet, sign up at https://exokernel.scripts.mit.edu/submit/
before continuing.
Username: <your Athena username>
Password: <your 6.828 password>
Your public key has been successfully updated.
Setting up hand-in Git repository...
Adding remote repository ssh://josgit@exokernel.mit.edu/joslab.git as 'handin'.
Done! Use 'make handin' to submit your lab code.
athena%
```

如果你没有 RSA 密钥对，这个脚本可能会询问你是否生成一个新的密钥对：

```
athena% make handin-prep
SSH key file ~/.ssh/id_rsa does not exists, generate one? [Y/n] Y
Generating public/private rsa key pair.
Your identification has been saved in ~/.ssh/id_rsa.
Your public key has been saved in ~/.ssh/id_rsa.pub.
The key fingerprint is:
xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx
The keyʼs randomart image is:
+--[ RSA 2048]----+
| ........ |
| ........ |
+-----------------+
Using public key from ~/.ssh/id_rsa:
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD0lnnkoHSi4JDFA ...
Continue? [Y/n] Y
.....
athena%

```

当你开始动手做实验时，在 `lab` 目录下，输入 `make handin` 去使用 git 做第一次提交。后面将运行 `git push handin HEAD`，它将推送当前分支到远程 `handin` 仓库的同名分支上。

```
athena% git commit -am "ready to submit my lab"
[lab1 c2e3c8b] ready to submit my lab
 2 files changed, 18 insertions(+), 2 deletions(-)

athena% make handin
Handin to remote repository using 'git push handin HEAD' ...
Counting objects: 59, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (55/55), done.
Writing objects: 100% (59/59), 49.75 KiB, done.
Total 59 (delta 3), reused 0 (delta 0)
To ssh://josgit@am.csail.mit.edu/joslab.git
 * [new branch] HEAD -> lab1
athena%

```

如果在你的实验仓库上产生变化，你将收到一封电子邮件，让你去确认这个提交。以后，你可能会多次去运行 `run make handin`（或者 `git push handin`）。对于一个指定实验的最后提交时间是由相应分支的最新推送（最后一个推送）的时间决定的。

在这个案例中，`make handin` 运行可能并不正确，你可以使用 Git 命令去尝试修复这个问题。或者，你可以去运行 `make tarball`。它将为你生成一个 tar 文件，这个文件可以通过我们的 [web 界面][5] 来上传。`make handin` 提供了很多特殊说明。

对于实验 1，你不需要去回答下列的任何一个问题。（尽管你不用自己回答，但是它们对下面的实验有帮助）

我们将使用一个评级程序来分级你的解决方案。你可以使用这个评级程序去测试你的解决方案的分级情况。

### 第一部分：PC 引导

第一个练习的目的是向你介绍 x86 汇编语言和 PC 引导过程，你可以使用 QEMU 和 QEMU/GDB 调试开始你的练习。这部分的实验你不需要写任何代码，但是，通过这个实验，你将对 PC 引导过程有了你自己的理解，并且为回答后面的问题做好准备。

#### 从使用 x86 汇编语言开始

如果你对 x86 汇编语言的使用还不熟悉，通过这个课程，你将很快熟悉它！如果你想学习它，[PC 汇编语言][6] 这本书是一个很好的开端。希望这本书中有你所需要的一切内容。

警告：很不幸，这本书中的示例是为 NASM 汇编语言写的，而我们使用的是 GNU 汇编语言。NASM 使用所谓的 Intel 语法，而 GNU 使用 AT&T 语法。虽然在语义上是等价的，但是根据你使用的语法不同，至少从表面上看，汇编文件的差别还是挺大的。幸运的是，这两种语法的转换很简单，在 [Brennan's Guide to Inline Assembly][7] 有详细的介绍。

> **练习 1**
>
> 熟悉在 [6.828 参考页面][8] 上列出的你想去使用的可用汇编语言。你不需要现在就去阅读它们，但是在你阅读和写 x86 汇编程序的时候，你可以去参考相关的内容。

我并不推荐你阅读 [Brennan's Guide to Inline Assembly][7] 上的 “语法” 章节。虽然它对 AT&T 汇编语法描述的很好（并且非常详细），而且我们在 JOS 中使用的 GNU 汇编就是它。

对于 x86 汇编语言程序最终还是需要参考 Intel 的指令集架构，你可以在 [6.828 参考页面][8] 上找到它，它有两个版本：一个是 HTML 版的，是老的 [80386 程序员参考手册][9]，它比起最新的手册更简短，更易于查找，但是，它包含了我们的 6.828 上所使用的 x86 处理器的所有特性；而更全面的、更新的、更好的是，来自 Intel 的 [IA-32 Intel 架构软件开发者手册][10]，它涵盖了我们在课程中所需要的、（并且可能有些是你不感兴趣的）大多数处理器的全部特性。另一个差不多的（并且经常是很友好的）一套手册是 [来自 AMD][11] 的。当你为了一个特定的处理器特性或者指令，去查找最终的解释时，保存的最新的 Intel/AMD 架构手册或者它们的参考就很有用了。

#### 仿真 x86

与在一台真实的、物理的、个人电脑上引导一个操作系统不同，我们使用程序去如实地仿真一台完整的 PC：你在仿真器中写的代码，也能够引导一台真实的 PC。使用仿真器可以简化调试工作；比如，你可以在仿真器中设置断点，而这在真实的机器中是做不到的。

在 6.828 中，我们将使用 [QEMU 仿真器][12]，它是一个现代化的并且速度非常快的仿真器。虽然 QEMU 内置的监视功能提供了有限的调试支持，但是，QEMU 也可以做为 [GNU 调试器][13] (GDB) 的远程调试目标，我们在这个实验中将使用它来一步一步完成引导过程。

在开始之前，按照前面 “软件安装“ 中在 Athena 主机上描述的步骤，提取实验 1 的文件到你自己的目录中，然后，在 `lab` 目录中输入 `make`（如果是 BSD 的系统，是输入 `gmake` ）来构建最小的 6.828 引导加载器和用于启动的内核。（把在这里我们运行的这些代码称为 ”内核“ 有点夸大，但是，通过这个学期的课程，我们将把这些代码充实起来，成为真正的 ”内核“）

```
athena% cd lab
athena% make
+ as kern/entry.S
+ cc kern/init.c
+ cc kern/console.c
+ cc kern/monitor.c
+ cc kern/printf.c
+ cc lib/printfmt.c
+ cc lib/readline.c
+ cc lib/string.c
+ ld obj/kern/kernel
+ as boot/boot.S
+ cc -Os boot/main.c
+ ld boot/boot
boot block is 414 bytes (max 510)
+ mk obj/kern/kernel.img

```

（如果你看到有类似 ”undefined reference to `__udivdi3'” 这样的错误，可能是因为你的电脑上没有 32 位的 “gcc multilib”。如果你运行在 Debian 或者 Ubuntu，你可以尝试去安装 “gcc-multilib” 包。）

现在，你可以去运行 QEMU 了，并将上面创建的 `obj/kern/kernel.img` 文件提供给它，以作为仿真 PC 的 “虚拟硬盘”，这个虚拟硬盘中包含了我们的引导加载器（`obj/boot/boot`) 和我们的内核（`obj/kernel`）。

```
athena% make qemu
```

运行 QEMU 时需要使用选项去设置硬盘，以及指示串行端口输出到终端。在 QEMU 窗口中将出现一些文本内容：

```
Booting from Hard Disk...
6828 decimal is XXX octal!
entering test_backtrace 5
entering test_backtrace 4
entering test_backtrace 3
entering test_backtrace 2
entering test_backtrace 1
entering test_backtrace 0
leaving test_backtrace 0
leaving test_backtrace 1
leaving test_backtrace 2
leaving test_backtrace 3
leaving test_backtrace 4
leaving test_backtrace 5
Welcome to the JOS kernel monitor!
Type 'help' for a list of commands.
K>
```

在 `Booting from Hard Disk...` 之后的内容，就是由我们的基本 JOS 内核输出的：`K>` 是包含在我们的内核中的小型监听器或者交互式控制程序的提示符。内核输出的这些行也会出现在你运行 QEMU 的普通 shell 窗口中。这是因为测试和实验分级的原因，我们配置了 JOS 的内核，使它将控制台输出不仅写入到虚拟的 VGA 显示器（就是 QEMU 窗口），也写入到仿真 PC 的虚拟串口上，QEMU 会将虚拟串口上的信息转发到它的标准输出上。同样，JOS 内核也将接收来自键盘和串口的输入，因此，你既可以从 VGA 显示窗口中输入命令，也可以从运行 QEMU 的终端窗口中输入命令。或者，你可以通过运行 `make qemu-nox` 来取消虚拟 VGA 的输出，只使用串行控制台来输出。如果你是通过 SSH 拨号连接到 Athena 主机，这样可能更方便。

在这里有两个可以用来监视内核的命令，它们是 `help` 和 `kerninfo`。

```
K> help
help - display this list of commands
kerninfo - display information about the kernel
K> kerninfo
Special kernel symbols:
 entry f010000c (virt) 0010000c (phys)
 etext f0101a75 (virt) 00101a75 (phys)
 edata f0112300 (virt) 00112300 (phys)
 end f0112960 (virt) 00112960 (phys)
Kernel executable memory footprint: 75KB
K>

```

`help` 命令的用途很明确，我们将简短地讨论一下 `kerninfo` 命令输出的内容。虽然它很简单，但是，需要重点注意的是，这个内核监视器是 “直接” 运行在仿真 PC 的 “原始（虚拟）硬件” 上的。这意味着你可以去拷贝 `obj/kern/kernel.img` 的内容到一个真实硬盘的前几个扇区，然后将那个硬盘插入到一个真实的 PC 中，打开这个 PC 的电源，你将在一台真实的 PC 屏幕上看到和上面在 QEMU 窗口完全一样的内容。（我们并不推荐你在一台真实机器上这样做，因为拷贝 `kernel.img` 到硬盘的前几个扇区将覆盖掉那个硬盘上原来的主引导记录，这将导致这个硬盘上以前的内容丢失！）

#### PC 的物理地址空间

我们现在将更深入去了解 “关于 PC 是如何启动” 的更多细节。一台 PC 的物理地址空间是硬编码为如下的布局：

```
+------------------+ <- 0xFFFFFFFF (4GB)
| 32-bit |
| memory mapped |
| devices |
| |
/\/\/\/\/\/\/\/\/\/\

/\/\/\/\/\/\/\/\/\/\
| |
| Unused |
| |
+------------------+ <- depends on amount of RAM
| |
| |
| Extended Memory |
| |
| |
+------------------+ <- 0x00100000 (1MB)
| BIOS ROM |
+------------------+ <- 0x000F0000 (960KB)
| 16-bit devices, |
| expansion ROMs |
+------------------+ <- 0x000C0000 (768KB)
| VGA Display |
+------------------+ <- 0x000A0000 (640KB)
| |
| Low Memory |
| |
+------------------+ <- 0x00000000

```

首先，这台 PC 是基于 16 位的 Intel 8088 处理器，它仅能处理 1 MB 的物理地址。所以，早期 PC 的物理地址空间开始于 `0x00000000`，结束于 `0x000FFFFF` 而不是 `0xFFFFFFFF`。被标记为 “低位内存” 的区域是早期 PC 唯一可以使用的随机访问内存（RAM）；事实上，更早期的 PC 仅可以配置  16KB、32KB、或者 64KB 的内存！

从 `0x000A0000` 到 `0x000FFFFF` 的 384 KB 的区域是为特定硬件保留的区域，比如，视频显示缓冲和保存在非易失存储中的固件。这个保留区域中最重要的部分是基本输入/输出系统（BIOS），它位于从 `0x000F0000` 到 `0x000FFFFF` 之间的 64KB 大小的区域。在早期的 PC 中，BIOS 在真正的只读存储（ROM）中，但是，现在的 PC 的 BIOS 都保存在可更新的 FLASH 存储中。BIOS 负责执行基本系统初始化工作，比如，激活视频卡和检查已安装的内存数量。这个初始化工作完成之后，BIOS 从相关位置加载操作系统，比如从软盘、硬盘、CD-ROM、或者网络，然后将机器的控制权传递给操作系统。

当 Intel 最终在 80286 和 80386 处理器上 “打破了 1MB 限制” 之后，这两个处理器各自支持 16MB 和 4GB 物理地址空间，尽管如此，为了确保向下兼容现存软件，PC 架构还是保留着 1 MB 以内物理地址空间的原始布局。因此，现代 PC 的物理内存，在 `0x000A0000` 和 `0x00100000` 之间有一个 “黑洞区域”，将内存分割为 “低位” 或者 “传统内存” 区域（前 640 KB）和 “扩展内存”（其它的部分）。除此之外，在 PC 的 32 位物理地址空间顶部之上的一些空间，在全部的物理内存上面，现在一般都由 BIOS 保留给 32 位的 PCI 设备使用。

最新的 x86 处理器可以支持超过 4GB 的物理地址空间，因此，RAM 可以进一步扩展到 `0xFFFFFFFF` 之上。在这种情况下，BIOS 必须在 32 位可寻址空间顶部之上的系统 RAM 上，设置第二个 “黑洞区域”，以便于为这些 32 位的设备映射留下空间。因为 JOS 设计的限制，它仅可以使用 PC 物理内存的前 256 MB，因此，我们将假设所有的 PC “仅仅” 拥有 32 位物理地址空间。但是处理复杂的物理地址空间和其它部分的硬件系统，将涉及到许多年前操作系统开发所遇到的实际挑战之一。

#### ROM BIOS

在实验的这一部分中，你将使用 QEMU 的调试功能去研究 IA-32 相关的计算机是如何引导的。

打开两个终端窗口，在其中一个中，输入 `make qemu-gdb`（或者 `make qemu-nox-gdb`），这将启动 QEMU，但是处理器在运行第一个指令之前将停止 QEMU，以等待来自 GDB 的调试连接。在第二个终端窗口中，从相同的目录中运行 `make`，以及运行 `make gdb`。你将看到如下的输出。

```
athena% make gdb
GNU gdb (GDB) 6.8-debian
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law. Type "show copying"
and "show warranty" for details.
This GDB was configured as "i486-linux-gnu".
+ target remote localhost:1234
The target architecture is assumed to be i8086
[f000:fff0] 0xffff0: ljmp $0xf000,$0xe05b
0x0000fff0 in ?? ()
+ symbol-file obj/kern/kernel
(gdb)

```

`make gdb` 的运行目标是一个称为 `.gdbrc` 的脚本，它设置了 GDB 在早期引导期间调试所用到的 16 位代码，并且将它指向到正在监听的 QEMU 上。

下列行：

```
[f000:fff0] 0xffff0: ljmp $0xf000,$0xe05b
```

是 GDB 运行的第一个指令的反汇编。这个输出包含如下的信息：

  * IBM PC 从物理地址 `0x000ffff0` 开始运行，这个地址位于为 ROM BIOS 保留的 64 KB 区域的顶部。
  * PC 使用 `CS = 0xf000` 和 `IP = 0xfff0` 开始运行。
  * 运行的第一个指令是一个 `jmp` 指令，它跳转段地址 `CS = 0xf000` 和 `IP = 0xe05b`。

为什么 QEMU 是这样开始的呢？这是因为 Intel 设计的 8088 处理器是这样做的，这个处理器是 IBM 最早用在他们的 PC 上的处理器。因为在一台 PC 中，BIOS 是硬编码在物理地址范围 `0x000f0000-0x000fffff` 中的，这样的设计确保了在机器接通电源或者任何系统重启之后，BIOS 总是能够首先控制机器 —— 这是至关重要的，因为机器接通电源之后，在机器的内存中没有处理器可以运行的任何软件。QEMU 仿真器有它自己的 BIOS，它的位置在处理器的模拟地址空间中。在处理器复位之后，（模拟的）处理器进入了实模式，然后设置 `CS` 为 `0xf000` 、`IP` 为 `0xfff0`，所以，运行开始于那个（`CS:IP`）段地址。那么，段地址 `0xf000:fff0` 是如何转到物理地址的呢？

在回答这个问题之前，我们需要了解有关实模式地址的知识。在实模式（PC 启动之后就处于实模式）中，物理地址是根据这个公式去转换的：物理地址 = 16 * 段地址 + 偏移。因此，当 PC 设置 `CS` 为 `0xf000` 、`IP` 为 `0xfff0` 之后，物理地址指向到：

```
16 * 0xf000 + 0xfff0 # in hex multiplication by 16 is
 = 0xf0000 + 0xfff0 # easy--just append a 0.
 = 0xffff0

```

`0xffff0` 是 BIOS (`0x100000`) 结束之前的 16 字节。因此，BIOS 所做的第一件事情是向后 `jmp` 到 BIOS 中的早期位置就一点也不奇怪了；毕竟只有 16 字节，还能指望它做些什么呢？

> **练习 2**
>
> 使用 GDB 的 `si`（步进指令）指令去跟踪进入到 ROM BIOS 的更多指令，然后尝试猜测它可能会做什么。你可能需要去查看 [Phil Storrs I/O 端口描述][14]，以及在 [6.828 参考资料页面][8] 上的其它资料。不需要了解所有的细节 —— 只要搞明白 BIOS 首先要做什么就可以了。

当 BIOS 运行后，它将设置一个中断描述符表和初始化各种设备，比如， VGA 显示。在这时，你在 QEMU 窗口中将出现 `Starting SeaBIOS` 的信息。

在初始化 PCI 产品线和 BIOS 知道的所有重要设备之后，它将搜索可引导设备，比如，一个软盘、硬盘、或者 CD-ROM。最后，当它找到可引导磁盘之后，BIOS 从可引导硬盘上读取引导加载器，然后将控制权交给它。

### 第二部分：引导加载器

在 PC 的软盘和硬盘中，将它们分割成 512 字节大小的区域，每个区域称为一个扇区。一个扇区就是磁盘的最小转存单元：每个读或写操作都必须是一个或多个扇区大小，并且按扇区边界进行对齐。如果磁盘是可引导盘，第一个扇区则为引导扇区，因为，第一个扇区中驻留有引导加载器的代码。当 BIOS 找到一个可引导软盘或者硬盘时，它将 512 字节的引导扇区加载进物理地址为 `0x7c00` 到 `0x7dff` 的内存中，然后使用一个 `jmp` 指令设置 `CS:IP` 为 `0000:7c00`，并传递控制权到引导加载器。与 BIOS 加载地址一样，这些地址是任意的 —— 但是它们对于 PC 来说是固定的，并且是标准化的。

后来，随着 PC 的技术进步，它们可以从 CD-ROM 中引导，因此，PC 架构师趁机对引导过程进行轻微的调整。最后的结果使现代的 BIOS 从 CD-ROM 中引导的过程更复杂（并且功能更强大）。CD-ROM 使用 2048 字节大小的扇区，而不是 512 字节的扇区，并且，BIOS 在传递控制权之前，可以从磁盘上加载更大的（不止是一个扇区）引导镜像到内存中。更多内容，请查看 [“El Torito” 可引导 CD-ROM 格式规范][15]。

不过对于 6.828，我们将使用传统的硬盘引导机制，意味着我们的引导加载器必须小于 512 字节。引导加载器是由一个汇编源文件 `boot/boot.S` 和一个 C 源文件 `boot/main.c` 构成，仔细研究这些源文件可以让你彻底理解引导加载器都做了些什么。引导加载器必须要做两件主要的事情：

  1. 第一、引导加载器将处理器从实模式切换到 32 位保护模式，因为只有在 32 位保护模式中，软件才能够访问处理器中 1 MB 以上的物理地址空间。关于保护模式将在 [PC 汇编语言][6] 的  1.2.7 和 1.2.8 节中详细描述，更详细的内容请参阅 Intel 架构手册。在这里，你只要理解在保护模式中段地址（段基地址：偏移量）与物理地址转换的差别就可以了，并且转换后的偏移是 32 位而不是 16 位。
  2. 第二、引导加载器通过 x86 的专用 I/O 指令直接访问 IDE 磁盘设备寄存器，从硬盘中读取内核。如果你想去更好地了解在这里说的专用 I/O 指令，请查看 [6.828 参考页面][8] 上的 “IDE 硬盘控制器” 章节。你不用学习太多的专用设备编程方面的内容：在实践中，写设备驱动程序是操作系统开发中的非常重要的部分，但是，从概念或者架构的角度看，它也是最让人乏味的部分。

理解了引导加载器源代码之后，我们来看一下 `obj/boot/boot.asm` 文件。这个文件是在引导加载器编译过程中，由我们的 GNUmakefile 创建的引导加载器的反汇编文件。这个反汇编文件让我们可以更容易地看到引导加载器代码所处的物理内存位置，并且也可以更容易地跟踪在 GDB 中步进的引导加载器发生了什么事情。同样的，`obj/kern/kernel.asm` 文件中包含了 JOS 内核的一个反汇编，它也经常被用于内核调试。

你可以使用 `b` 命令在 GDB 中设置中断点地址。比如，`b *0x7c00` 命令在地址 `0x7C00` 处设置了一个断点。当处于一个断点中时，你可以使用 `c` 和 `si` 命令去继续运行：`c` 命令让 QEMU 继续运行，直到下一个断点为止（或者是你在 GDB 中按下了 Ctrl - C），而 `si N` 命令是每次步进 `N` 个指令。

要检查内存中的指令（除了要立即运行的下一个指令之外，因为它是由 GDB 自动输出的），你可以使用 `x/i` 命令。这个命令的语法是 `x/Ni ADDR`，其中 `N` 是连接的指令个数，`ADDR` 是开始反汇编的内存地址。

> **练习 3**
>
> 查看 [实验工具指南][16]，特别是 GDB 命令的相关章节。即便你熟悉使用 GDB 也要好好看一看，GDB 的一些命令比较难理解，但是它对操作系统的工作很有帮助。

在地址 0x7c00 处设置断点，它是加载后的引导扇区的位置。继续运行，直到那个断点。在 `boot/boot.S` 中跟踪代码，使用源代码和反汇编文件 `obj/boot/boot.asm` 去保持跟踪。你也可以使用 GDB 中的 `x/i` 命令去反汇编引导加载器接下来的指令，比较引导加载器源代码与在 `obj/boot/boot.asm` 和 GDB 中的反汇编文件。

在 `boot/main.c` 文件中跟踪进入 `bootmain()` ，然后进入 `readsect()`。识别 `readsect()` 中相关的每一个语句的准确汇编指令。跟踪 `readsect()` 中剩余的指令，然后返回到 `bootmain()` 中，识别 `for` 循环的开始和结束位置，这个循环从磁盘上读取内核的剩余扇区。找出循环结束后运行了什么代码，在这里设置一个断点，然后继续。接下来再走完引导加载器的剩余工作。

完成之后，就能够回答下列的问题了：

  * 处理器开始运行 32 代码时指向到什么地方？从 16 位模式切换到 32 位模式的真实原因是什么？
  * 引导加载器执行的最后一个指令是什么，内核加载之后的第一个指令是什么？
  * 内核的第一个指令在哪里？
  * 为从硬盘上获取完整的内核，引导加载器如何决定有多少扇区必须被读入？在哪里能找到这些信息？

#### 加载内核

我们现在来进一步查看引导加载器在 `boot/main.c` 中的 C 语言部分的详细细节。在继续之前，我们先停下来回顾一下 C 语言编程的基础知识。

> **练习 4**
>
> 下载 [pointers.c][17] 的源代码，运行它，然后确保你理解了输出值的来源的所有内容。尤其是，确保你理解了第 1 行和第 6 行的指针地址的来源、第 2 行到第 4 行的值是如何得到的、以及为什么第 5 行指向的值表面上看像是错误的。
>
> 如果你对指针的使用不熟悉，Brian Kernighan 和 Dennis Ritchie（就是大家知道的 “K&R”）写的《C Programming Language》是一个非常好的参考书。同学们可以去买这本书（这里是 [Amazon 购买链接][18]），或者在 [MIT 的图书馆的 7 个副本][19] 中找到其中一个。在 [SIPB Office][20] 也有三个副本可以细读。
>
> 在课程阅读中，[Ted Jensen 写的教程][21] 可以使用，它大量引用了 K&R 的内容。
>
> 警告：除非你特别精通 C 语言，否则不要跳过这个阅读练习。如果你没有真正理解了 C 语言中的指针，在接下来的实验中你将非常痛苦，最终你将很难理解它们。相信我们；你将不会遇到什么是 ”最困难的方式“。

要了解 `boot/main.c`，你需要了解一个 ELF 二进制格式的内容。当你编译和链接一个 C 程序时，比如，JOS 内核，编译器将每个 C 源文件（'`.c`'）转换为一个包含预期硬件平台的汇编指令编码的二进制格式的对象文件（'`.o`'），然后链接器将所有编译过的对象文件组合成一个单个的二进制镜像，比如，`obj/kern/kernel`，在本案例中，它就是 ELF 格式的二进制文件，它表示是一个 ”可运行和可链接格式“。

关于这个格式的全部信息可以在 [我们的参考页面][8] 上的 [ELF 规范][22] 中找到，但是，你并不需要深入地研究这个格式 的细节。虽然完整的格式是非常强大和复杂的，但是，大多数复杂的部分是为了支持共享库的动态加载，在我们的课程中，并不需要做这些。

鉴于 6.828 的目的，你可以认为一个 ELF 可运行文件是一个用于加载信息的头文件，接下来的几个程序节，根据加载到内存中的特定地址的不同，每个都是连续的代码块或数据块。引导加载器并不修改代码或者数据；它加载它们到内存，然后开始运行它。

一个 ELF 二进制文件使用一个固定长度的 ELF 头开始，紧接着是一个可变长度的程序头，列出了每个加载的程序节。C 语言在 `inc/elf.h` 中定义了这些 ELF 头。在程序节中我们感兴趣的部分有：

  * `.text`：程序的可运行指令。
  * `.rodata`：只读数据，比如，由 C 编译器生成的 ASCII 字符串常量。（然而我们并不需要操心设置硬件去禁止写入它）
  * `.data`：保持在程序的初始化数据中的数据节，比如，初始化声明所需要的全局变量，比如，像 `int x = 5;`。

当链接器计算程序的内存布局的时候，它为未初始化的全局变量保留一些空间，比如，`int x;`，在内存中的被称为 `.bss` 的节后面会马上跟着一个 `.data`。C 规定 "未初始化的" 全局变量以一个 0 值开始。因此，在 ELF 二进制中 `.bss` 中并不存储内容；而是，链接器只记录地址和`.bss` 节的大小。加载器或者程序自身必须在 `.bss` 节中写入 0。

通过输入如下的命令来检查在内核中可运行的所有节的名字、大小、以及链接地址的列表：

```
athena% i386-jos-elf-objdump -h obj/kern/kernel
```

如果在你的计算机上默认使用的是一个 ELF 工具链，比如像大多数现代的 Linux 和 BSD，你可以使用 `objdump` 来代替 `i386-jos-elf-objdump`。

你将看到更多的节，而不仅是上面列出的那几个，但是，其它的那些节对于我们的实验目标来说并不重要。其它的那些节中大多数都是为了保留调试信息，它们一般包含在程序的可执行文件中，但是，这些节并不会被程序加载器加载到内存中。

我们需要特别注意 `.text` 节中的 VMA（或者链接地址）和 LMA（或者加载地址）。一个节的加载地址是那个节加载到内存中的地址。在 ELF 对象中，它保存在 `ph->p_pa` 域（在本案例中，它实际上是物理地址，不过 ELF 规范在这个域的意义方面规定的很模糊）。

一个节的链接地址是这个节打算在内存中运行时的地址。链接器在二进制代码中以变量的方式去编码这个链接地址，比如，当代码需要全局变量的地址时，如果二进制代码从一个未链接的地址去运行，结果将是无法运行。（它一般是去生成一个不包含任何一个绝对地址的、与位置无关的代码。现在的共享库大量使用的就是这种方法，但这是以性能和复杂性为代价的，所以，我们在 6.828 中不使用这种方法。）

一般情况下，链接和加载地址是一样的。比如，通过如下的命令去查看引导加载器的 `.text` 节：
```
athena% i386-jos-elf-objdump -h obj/boot/boot.out
```

BIOS 加载引导扇区到内存中的 0x7c00 地址，因此，这就是引导扇区的加载地址。这也是引导扇区的运行地址，因此，它也是链接地址。我们在`boot/Makefrag` 中通过传递 `-Ttext 0x7C00` 给链接器来设置链接地址，因此，链接器将在生成的代码中产生正确的内存地址。

> **练习 5**
>
> 如果你得到一个错误的引导加载器链接地址，通过再次跟踪引导加载器的前几个指令，你将会发现第一个指令会 “中断” 或者出错。然后在 `boot/Makefrag` 修改链接地址来修复错误，运行 `make clean`，使用 `make` 重新编译，然后再次跟踪引导加载器去查看会发生什么事情。不要忘了改回正确的链接地址，然后再次 `make clean`！

我们继续来看内核的加载和链接地址。与引导加载器不同，这里有两个不同的地址：内核告诉引导加载器加载它到内存的低位地址（小于 1 MB 的地址），但是它期望在一个高位地址来运行。我们将在下一节中深入研究它是如何实现的。

除了节的信息之外，在 ELF 头中还有一个对我们很重要的域，它叫做 `e_entry`。这个域保留着程序入口的链接地址：程序的 `.text` 节中的内存地址就是将要被执行的程序的地址。你可以用如下的命令来查看程序入口链接地址：
```
athena% i386-jos-elf-objdump -f obj/kern/kernel
```

你现在应该能够理解在 `boot/main.c` 中的最小的 ELF 加载器了。它从硬盘中读取内核的每个节，并将它们节的加载地址读入到内存中，然后跳转到内核的入口点。

> **练习 6**
>
> 我们可以使用 GDB 的 `x` 命令去检查内存。[GDB 手册][23] 上讲的非常详细，但是现在，我们知道命令 `x/Nx ADDR` 是输出地址 `ADDR` 上 `N` 个<ruby>词<rt>word</rt></ruby>就够了。（注意在命令中所有的 `x` 都是小写。）警告：<ruby>词<rt>word</rt></ruby>的多少并没有一个普遍的标准。在 GNU 汇编中，一个<ruby>词<rt>word</rt></ruby>是两个字节（在 xorw 中的 'w'，它在这个词中就是 2 个字节）。

重置机器（退出 QEMU/GDB 然后再次启动它们）。检查内存中在 `0x00100000` 地址上的 8 个词，输出 BIOS 上的引导加载器入口，然后再次找出引导载器上的内核的入口。为什么它们不一样？在第二个断点上有什么内容？（你并不用真的在 QEMU 上去回答这个问题，只需要思考就可以。）

### 第三部分：内核

我们现在开始去更详细地研究最小的 JOS 内核。（最后你还将写一些代码！）就像引导加载器一样，内核也是从一些汇编语言代码设置一些东西开始的，以便于 C 语言代码可以正确运行。

#### 使用虚拟内存去解决位置依赖问题

前面在你检查引导加载器的链接和加载地址时，它们是完全一样的，但是内核的链接地址（可以通过 `objdump` 来输出）和它的加载地址之间差别很大。可以回到前面去看一下，以确保你明白我们所讨论的内容。（链接内核比引导加载器更复杂，因此，链接和加载地址都在 `kern/kernel.ld` 的顶部。）

操作系统内核经常链接和运行在高位的虚拟地址，比如，`0xf0100000`，为的是给让用户程序去使用处理器的虚拟地址空间的低位部分。至于为什么要这么安排，在下一个实验中我们将会知道。

许多机器在 `0xf0100000` 处并没有物理地址，因此，我们不能指望在那个位置可以存储内核。相反，我们使用处理器的内存管理硬件去映射虚拟地址 `0xf0100000`（内核代码打算运行的链接地址）到物理地址 `0x00100000`（引导加载器将内核加载到内存的物理地址的位置）。通过这种方法，虽然内核的虚拟地址是高位的，离用户程序的地址空间足够远，它将被加载到 PC 的物理内存的 1MB 的位置，只处于 BIOS ROM 之上。这种方法要求 PC 至少要多于 1 MB 的物理内存（以便于物理地址 `0x00100000` 可以工作），这在上世纪九十年代以后生产的PC 上应该是没有问题的。

实际上，在下一个实验中，我们将映射整个 256 MB 的 PC 的物理地址空间，从物理地址 `0x00000000` 到 `0x0fffffff`，映射到虚拟地址 `0xf0000000` 到 `0xffffffff`。你现在就应该明白了为什么 JOS 只能使用物理内存的前 256 MB 的原因了。

现在，我们只映射前 4 MB 的物理内存，它足够我们的内核启动并运行。我们通过在 `kern/entrypgdir.c` 中手工写入静态初始化的页面目录和页面表就可以实现。现在，你不需要理解它们是如何工作的详细细节，只需要达到目的就行了。将上面的 `kern/entry.S` 文件中设置 `CR0_PG` 标志，内存引用就被视为物理地址（严格来说，它们是线性地址，但是，在 `boot/boot.S` 中设置了一个从线性地址到物理地址的映射标识，我们绝对不能改变它）。一旦 `CR0_PG` 被设置，内存引用的就是虚拟地址，这个虚拟地址是通过虚拟地址硬件将物理地址转换得到的。`entry_pgdir` 将把从 `0x00000000` 到 `0x00400000` 的物理地址范围转换在 `0xf0000000` 到 `0xf0400000` 的范围内的虚拟地址。任何不在这两个范围之一中的地址都将导致硬件异常，因为，我们还没有设置中断去处理这种情况，这种异常将导致 QEMU 去转储机器状态然后退出。（或者如果你没有在 QEMU 中应用 6.828 专用补丁，将导致 QEMU 无限重启。)

> **练习 7**
>
> 使用 QEMU 和 GDB 去跟踪进入到 JOS 内核，然后停止在 `movl %eax, %cr0` 指令处。检查 `0x00100000` 和 `0xf0100000` 处的内存。现在使用GDB 的 `stepi` 命令去单步执行那个指令。再次检查 `0x00100000` 和 `0xf0100000` 处的内存。确保你能理解这时发生的事情。

新映射建立之后的第一个指令是什么？如果没有映射到位，它将不能正常工作。在 `kern/entry.S` 中注释掉 `movl %eax, %cr0`。然后跟踪它，看看你的猜测是否正确。

#### 格式化控制台的输出

大多数人认为像 `printf()` 这样的函数是天生就有的，有时甚至认为这是 C 语言的 “原语”。但是在操作系统的内核中，我们需要自己去实现所有的 I/O。

通过阅读 `kern/printf.c`、`lib/printfmt.c`、以及 `kern/console.c`，确保你理解了它们之间的关系。在后面的实验中，你将会明白为什么 `printfmt.c` 是位于单独的 `lib` 目录中。

> **练习 8**
>
> 我们将省略掉一小部分代码片断 —— 这部分代码片断是使用 ”%o" 模式输出八进制数字所需要的。找到它并填充到这个代码片断中。
>
> 然后你就能够回答下列的问题：
>
>   1. 解释 `printf.c` 和 `console.c` 之间的接口。尤其是，`console.c` 出口的函数是什么？这个函数是如何被 `printf.c` 使用的？
>
>   2. 在 `console.c` 中解释下列的代码：
>
>      ```
>      if (crt_pos >= CRT_SIZE) {
>         int i;
>         memcpy(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
>         for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
>             crt_buf[i] = 0x0700 | ' ';
>         crt_pos -= CRT_COLS;
>      }
>      ```
>
>   3. 下列的问题你可能需要参考第一节课中的笔记。这些笔记涵盖了 GCC 在 x86 上的调用规则。
>
>      一步一步跟踪下列代码的运行：
>
>      ```
>      int x = 1, y = 3, z = 4;
>      cprintf("x %d, y %x, z %d\n", x, y, z);
>      ```
>
>        1. 在调用 `cprintf()` 时，`fmt` 做了些什么？`ap` 做了些什么？
>        2. （按运行顺序）列出 `cons_putc`、`va_arg`、以及 `vcprintf` 的调用列表。对于 `cons_putc`，同时列出它的参数。对于`va_arg`，列出调用之前和之后的 `ap` 内容？对于 `vcprintf`，列出它的两个参数值。
>
>   4. 运行下列代码：
>
> 	```
> unsigned int i = 0x00646c72;
> cprintf("H%x Wo%s", 57616, &i);
> ```
> 	输出是什么？解释如何在前面的练习中一步一步实现这个输出。这是一个 [ASCII 表][24]，它是一个字节到字符串的映射表。
>
> 	这个输出取决于 x86 是小端法这一事实。如果这个 x86 采用大端法格式，你怎么去设置 `i`，以产生相同的输出？你需要将 `57616` 改变为一个不同值吗？
>
> 	[这是小端法和大端法的描述][25] 和 [一个更古怪的描述][26]。
>
>   5. 在下列代码中，`y=` 会输出什么？（注意：这个问题没有确切值）为什么会发生这种情况？
>     `cprintf("x=%d y=%d", 3);`
>
>
>   6. 假设修改了 GCC 的调用规则，以便于按声明的次序在栈上推送参数，这样最后的参数就是最后一个推送进去的。那你如何去改变 `cprintf` 或者它的接口，以便它仍然可以传递数量可变的参数？


#### 栈

在本实验的最后一个练习中，我们将理详细地解释在 x86 中 C 语言是如何使用栈的，以及在这个过程中，我们将写一个新的内核监视函数，这个函数将输出栈的回溯信息：一个保存了指令指针（IP）值的列表，这个列表中有嵌套的 `call` 指令运行在当前运行点的指针值。

> **练习 9**
>
> 搞清楚内核在什么地方初始化栈，以及栈在内存中的准确位置。内核如何为栈保留空间？以及这个保留区域的 “结束” 位置是指向初始化结束后的指针吗？

x86 栈指针（`esp` 寄存器）指向当前使用的栈的最低位置。在这个区域中那个位置以下的所有部分都是空闲的。给一个栈推送一个值涉及下移栈指针和栈指针指向的位置中写入值。从栈中弹出一个值涉及到从栈指针指向的位置读取值和上移栈指针。在 32 位模式中，栈中仅能保存 32 位值，并且 `esp` 通常分为四部分。各种 x86 指令，比如，`call`，是 “硬编码” 去使用栈指针寄存器的。

相比之下，`ebp`（基指针）寄存器，按软件惯例主要是由栈关联的。在进入一个 C 函数时，函数的前序代码在函数运行期间，通常会通过推送它到栈中来保存前一个函数的基指针，然后拷贝当前的 `esp` 值到 `ebp` 中。如果一个程序中的所有函数都遵守这个规则，那么，在程序运行过程中的任何一个给定时间点，通过在 `ebp` 中保存的指针链和精确确定的函数嵌套调用顺序是如何到达程序中的这个特定的点，就可以通过栈来跟踪回溯。这种跟踪回溯的函数在实践中非常有用，比如，由于给某个函数传递了一个错误的参数，导致一个 `assert` 失败或者 `panic`，但是，你并不能确定是谁传递了错误的参数。栈的回溯跟踪可以让你找到这个惹麻烦的函数。

> **练习 10**
>
> 要熟悉 x86 上的 C 调用规则，可以在 `obj/kern/kernel.asm` 文件中找到函数 `test_backtrace` 的地址，设置一个断点，然后检查在内核启动后，每次调用它时发生了什么。每个递归嵌套的 `test_backtrace` 函数在栈上推送了多少个词（word），这些词（word）是什么？

上面的练习可以给你提供关于实现栈跟踪回溯函数的一些信息，为实现这个函数，你应该去调用 `mon_backtrace()`。在 `kern/monitor.c` 中已经给你提供了这个函数的一个原型。你完全可以在 C 中去使用它，但是，你可能需要在 `inc/x86.h` 中使用到 `read_ebp()` 函数。你应该在这个新函数中实现一个到内核监视命令的钩子，以便于用户可以与它交互。

这个跟踪回溯函数将以下面的格式显示一个函数调用列表：
```
Stack backtrace:
 ebp f0109e58 eip f0100a62 args 00000001 f0109e80 f0109e98 f0100ed2 00000031
 ebp f0109ed8 eip f01000d6 args 00000000 00000000 f0100058 f0109f28 00000061
 ...
```

输出的第一行列出了当前运行的函数，名字为 `mon_backtrace`，就是它自己，第二行列出了被 `mon_backtrace` 调用的函数，第三行列出了另一个被调用的函数，依次类推。你可以输出所有未完成的栈帧。通过研究 `kern/entry.S`，你可以发现，有一个很容易的方法告诉你何时停止。

在每一行中，`ebp` 表示了那个函数进入栈的基指针：即，栈指针的位置，它就是函数进入之后，函数的前序代码设置的基指针。`eip` 值列出的是函数的返回指令指针：当函数返回时，指令地址将控制返回。返回指令指针一般指向 `call` 指令之后的指令（想一想为什么？）。在 `args` 之后列出的五个十六进制值是在问题中传递给函数的前五个参数。当然，如果函数调用时传递的参数少于五个，那么，在这里就不会列出全部五个值了。（为什么跟踪回溯代码不能检测到调用时实际上传递了多少个参数？如何去修复这个 “缺陷”？）

下面是在阅读 K&R 的书中的第 5 章中的一些关键点，为了接下来的练习和将来的实验，你应该记住它们。

  * 如果 `int *p = (int*)100`，那么 `(int)p + 1` 和 `(int)(p + 1)` 是不同的数字：前一个是 `101`，但是第二个是 `104`。当在一个指针上加一个整数时，就像第二种情况，这个整数将隐式地与指针所指向的对象相乘。
  * `p[i]` 的定义与 `*(p+i)` 定义是相同的，都反映了在内存中由 `p` 指向的第 `i` 个对象。当对象大于一个字节时，上面的加法规则可以使这个定义正常工作。
  * `&p[i]` 与 `(p+i)` 是相同的，获取在内存中由 p 指向的第 `i` 个对象的地址。

虽然大多数 C 程序不需要在指针和整数之间转换，但是操作系统经常做这种转换。不论何时，当你看到一个涉及内存地址的加法时，你要问你自己，你到底是要做一个整数加法还是一个指针加法，以确保做完加法后的值是正确的，而不是相乘后的结果。

> **练 11**
>
> 实现一个像上面详细描述的那样的跟踪回溯函数。一定使用与示例中相同的输出格式，否则，将会引发评级脚本的识别混乱。在你认为你做的很好的时候，运行 `make grade` 这个评级脚本去查看它的输出是否是我们的脚本所期望的结果，如果不是去修改它。你提交了你的实验 1 代码后，我们非常欢迎你将你的跟踪回溯函数的输出格式修改成任何一种你喜欢的格式。

在这时，你的跟踪回溯函数将能够给你提供导致 `mon_backtrace()` 被运行的，在栈上调用它的函数的地址。但是，在实践中，你经常希望能够知道这个地址相关的函数名字。比如，你可能希望知道是哪个有 Bug 的函数导致了你的内核崩溃。

为帮助你实现这个功能，我们提供了 `debuginfo_eip()` 函数，它在符号表中查找 `eip`，然后返回那个地址的调试信息。这个函数定义在 `kern/kdebug.c` 文件中。

> **练习 12**
>
> 修改你的栈跟踪回溯函数，对于每个 `eip`，显示相关的函数名字、源文件名、以及那个 `eip` 的行号。

在 `debuginfo_eip` 中，`__STAB_*` 来自哪里？这个问题的答案很长；为帮助你找到答案，下面是你需要做的一些事情：

  * 在 `kern/kernel.ld` 文件中查找 `__STAB_*`
  * 运行 `i386-jos-elf-objdump -h obj/kern/kernel`
  * 运行 `i386-jos-elf-objdump -G obj/kern/kernel`
  * 运行 `i386-jos-elf-gcc -pipe -nostdinc -O2 -fno-builtin -I. -MD -Wall -Wno-format -DJOS_KERNEL -gstabs -c -S kern/init.c, and look at init.s`。
  * 如果引导加载器在加载二进制内核时，将符号表作为内核的一部分加载进内存中，那么，去查看它。


通过在 `stab_binsearch` 中插入调用，可以完成在 `debuginfo_eip` 中通过地址找到行号的功能。

在内核监视中添加一个 `backtrace` 命令，扩展你实现的 `mon_backtrace` 的功能，通过调用 `debuginfo_eip`，然后以下面的格式来输出每个栈帧行：

```
K> backtrace
Stack backtrace:
 ebp f010ff78 eip f01008ae args 00000001 f010ff8c 00000000 f0110580 00000000
 kern/monitor.c:143: monitor+106
 ebp f010ffd8 eip f0100193 args 00000000 00001aac 00000660 00000000 00000000
 kern/init.c:49: i386_init+59
 ebp f010fff8 eip f010003d args 00000000 00000000 0000ffff 10cf9a00 0000ffff
 kern/entry.S:70: <unknown>+0
K>
```

每行都给出了文件名和在那个文件中栈帧的 `eip` 所在的行，紧接着是函数的名字和那个函数的第一个指令到 `eip` 的偏移量（比如，`monitor+106` 意味着返回 `eip` 是从 `monitor` 开始之后的 106 个字节）。

为防止评级脚本引起混乱，应该将文件和函数名输出在单独的行上。

提示：`printf` 格式的字符串提供一个易用（尽管有些难理解）的方式去输出<ruby>非空终止<rt>non-null-terminated</rt></ruby>字符串，就像在 STABS 表中的这些一样。`printf("%.*s", length, string)` 输出 `string` 中的最多 `length` 个字符。查阅 `printf` 的 man 页面去搞清楚为什么这样工作。

你可以从 `backtrace` 中找到那些没有的功能。比如，你或者可能看到一个到 `monitor()` 的调用，但是没有到 `runcmd()` 中。这是因为编译器的行内（in-lines）函数调用。其它的优化可能导致你看到一些意外的行号。如果你从 `GNUMakefile` 删除  `-O2`  参数，`backtraces` 可能会更有意义（但是你的内核将运行的更慢）。

**到此为止， 在 `lab` 目录中的实验全部完成**，使用 `git commit` 提交你的改变，然后输入 `make handin` 去提交你的代码。

--------------------------------------------------------------------------------

via: https://sipb.mit.edu/iap/6.828/lab/lab1/

作者：[mit][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://sipb.mit.edu
[1]:http://www.git-scm.com/
[2]:http://www.kernel.org/pub/software/scm/git/docs/user-manual.html
[3]:http://eagain.net/articles/git-for-computer-scientists/
[4]:https://sipb.mit.edu/iap/6.828/tools
[5]:https://exokernel.scripts.mit.edu/submit/
[6]:https://sipb.mit.edu/iap/6.828/readings/pcasm-book.pdf
[7]:http://www.delorie.com/djgpp/doc/brennan/brennan_att_inline_djgpp.html
[8]:https://sipb.mit.edu/iap/6.828/reference
[9]:https://sipb.mit.edu/iap/6.828/readings/i386/toc.htm
[10]:http://www.intel.com/content/www/us/en/processors/architectures-software-developer-manuals.html
[11]:http://developer.amd.com/documentation/guides/Pages/default.aspx#manuals
[12]:http://www.qemu.org/
[13]:http://www.gnu.org/software/gdb/
[14]:http://web.archive.org/web/20040404164813/members.iweb.net.au/%7Epstorr/pcbook/book2/book2.htm
[15]:https://sipb.mit.edu/iap/6.828/readings/boot-cdrom.pdf
[16]:https://sipb.mit.edu/iap/6.828/labguide
[17]:https://sipb.mit.edu/iap/6.828/files/pointers.c
[18]:http://www.amazon.com/C-Programming-Language-2nd/dp/0131103628/sr=8-1/qid=1157812738/ref=pd_bbs_1/104-1502762-1803102?ie=UTF8&amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;s=books
[19]:http://library.mit.edu/F/AI9Y4SJ2L5ELEE2TAQUAAR44XV5RTTQHE47P9MKP5GQDLR9A8X-10422?func=item-global&amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;doc_library=MIT01&amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;doc_number=000355242&amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;year=&amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;volume=&amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;sub_library=
[20]:http://sipb.mit.edu/
[21]:https://sipb.mit.edu/iap/6.828/readings/pointers.pdf
[22]:https://sipb.mit.edu/iap/6.828/readings/elf.pdf
[23]:http://sourceware.org/gdb/current/onlinedocs/gdb_9.html#SEC63
[24]:http://web.cs.mun.ca/%7Emichael/c/ascii-table.html
[25]:http://www.webopedia.com/TERM/b/big_endian.html
[26]:http://www.networksorcery.com/enp/ien/ien137.txt