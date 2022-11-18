[#]: subject: (Identify security properties on Linux using checksec)
[#]: via: (https://opensource.com/article/21/6/linux-checksec)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)
[#]: collector: (lujun9972)
[#]: translator: (chai001125)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-15264-1.html)

在 Linux 上使用 Checksec 识别二进制文件的安全属性
======

> 这篇文章能让你了解如何使用 Checksec ，来识别一个可执行文件的安全属性，了解安全属性的含义，并知道如何使用它们。

![][0]

编译源代码会生成一个二进制文件（LCTT 译注：即 `.o` 文件）。在编译期间，你可以向 `gcc` 编译器提供 <ruby>标志<rt> flags </rt></ruby>，以启用或禁用二进制文件的某些属性，这些属性与安全性相关。

Checksec 是一个漂亮的小工具，同时它也是一个 shell 脚本。Checksec 可以识别编译时构建到二进制文件中的安全属性。编译器可能会默认启用一些安全属性，你也可以提供特定的标志，来启用其他的安全属性。

本文将介绍如何使用 Checksec ，来识别二进制文件的安全属性，包括：

  1. Checksec 在查找有关安全属性的信息时，使用了什么**底层的命令**
  2. 在将源代码编译成二进制文件时，如何使用<ruby> GNU 编译器套件<rt> GNU Compiler Collection </rt></ruby>（即 GCC）来**启用安全属性**。

### 安装 checksec

要在 Fedora 和其他基于 RPM 的 Linux 系统上，安装 Checksec，请使用以下命令：

```
$ sudo dnf install checksec
```

对于基于 Debian 的 Linux 发行版，使用对应的 `apt` 命令，来安装 Checksec。

```
$ sudo apt install checksec
```

### shell 脚本

在安装完 Checksec 后，能够发现 Checksec 是一个**单文件**的 shell 脚本，它位于 `/usr/bin/checksec`，并且这个文件挺大的。Checksec 的一个优点是你可以通过快速通读这个 shell 脚本，从而了解 Checksec 的执行原理、明白所有能查找有关二进制文件或可执行文件的安全属性的**系统命令**：

```
$ file /usr/bin/checksec
/usr/bin/checksec: Bourne-Again shell script, ASCII text executable, with very long lines

$ wc -l /usr/bin/checksec
2111 /usr/bin/checksec
```

以下的命令展示了如何对你每天都会使用的：`ls` 命令的二进制文件运行 Checksec。Checksec 命令的格式是：`checksec --file=`，后面再跟上二进制文件的绝对路径：

```
$ checksec --file=/usr/bin/ls
RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      Symbols         FORTIFY Fortified       Fortifiable     FILE
Full RELRO      Canary found      NX enabled    PIE enabled     No RPATH   No RUNPATH   No Symbols        Yes   5       17              /usr/bin/ls
```

当你在终端中对某个二进制文件运行 Checksec 时，你会看到安全属性有颜色上的区分，显示什么是好的安全属性（绿色），什么可能不是好的安全属性（红色）。我在这里说 **“可能”** 是因为即使有些安全属性是红色的，也不一定意味着这个二进制文件很糟糕，它可能只是表明发行版供应商在编译二进制文件时做了一些权衡，从而舍弃了部分安全属性。

Checksec 输出的第一行提供了二进制文件的各种安全属性，例如 `RELRO`、`STACK CANARY`、`NX` 等（我将在后文进行详细解释）。第二行打印出给定二进制文件（本例中为 `ls`）在这些安全属性的状态（例如，`NX enabled` 表示为堆栈中的数据没有执行权限）。

### 示例二进制文件

在本文中，我将使用以下的 “hello world” 程序作为示例二进制文件。

```
#include <stdio.h>

int main()
{
        printf("Hello World\n");
        return 0;
}
 
```

请注意，在编译源文件 `hello.c` 的时候，我没有给 `gcc` 提供任何额外的标志：

```
$ gcc hello.c -o hello
 
$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=014b8966ba43e3ae47fab5acae051e208ec9074c, for GNU/Linux 3.2.0, not stripped

$ ./hello
Hello World
```

使用 Checksec 运行二进制文件 `hello`，打印的某些安全属性的状态，与上面的 `ls` 二进制文件的结果不同（在你的屏幕上，某些属性可能显示为红色）：

```
$ checksec --file=./hello
RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      Symbols         FORTIFY Fortified       Fortifiable     FILE
Partial RELRO   No canary found   NX enabled    No PIE          No RPATH   No RUNPATH   85) Symbols       No    0       0./hello
$
```

（LCTT 译注：在我的 Ubuntu 22.04 虚拟机，使用 11.3.0 版本的 `gcc`，结果与上述不太相同，利用默认参数进行编译，会得到 RELRO、PIE、NX 保护是全开的情况。）

### 更改 Checksec 的输出格式

Checksec 允许自定义各种输出格式，你可以使用 `--output` 来自定义输出格式。我将选择的输出格式是 JSON 格式，并将输出结果通过管道传输到 `jq` 实用程序，来得到漂亮的打印。

接下来，确保你已安装好了 [jq][3]，因为本教程会使用 `jq` 从 Checksec 的输出结果中，用 `grep` 来快速得到某一特定的安全属性状态，并报告该安全属性是否启动（启动为 `yes`，未启动为 `no`）：

```
$ checksec --file=./hello --output=json | jq
{
  "hello": {
    "relro": "partial",
    "canary": "no",
    "nx": "yes",
    "pie": "no",
    "rpath": "no",
    "runpath": "no",
    "symbols": "yes",
    "fortify_source": "no",
    "fortified": "0",
    "fortify-able": "0"
  }
}
```

### 看一看所有的安全属性

上面的二进制文件 `hello` 包括几个安全属性。我将该二进制文件与 `ls` 的二进制文件进行比较，以检查启用的安全属性有何不同，并解释 Checksec 是如何找到此信息。

#### 1、符号（Symbol）

我先从简单的讲起。在编译期间，某些 <ruby>符号<rt> symbols </rt></ruby>包含在二进制文件中，这些符号主要用作于调试。开发软件时，需要用到这些符号，来调试和修复错误。

这些符号通常会从供用户普遍使用的最终二进制文件中删除。删除这些符号不会影响到二进制文件的执行。删除符号通常是为了节省空间，因为一旦符号被删除了，二进制文件就会稍微小一些。在闭源或专有软件中，符号通常都会被删除，因为把这些符号放在二进制文件中，可以很容易地推断出软件的内部工作原理。

根据 Checksec 的结果，在二进制文件 `hello` 中有符号，但在 `ls` 的二进制文件中不会有符号。同样地，你还可以用 `file` 命令，来找到符号的信息，在二进制文件 `hello` 的输出结果的最后，看到 `not stripped`，表明二进制文件 `hello` 有符号：

```
$ checksec --file=/bin/ls --output=json | jq | grep symbols
    "symbols": "no",

$ checksec --file=./hello --output=json | jq | grep symbols
    "symbols": "yes",

$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=014b8966ba43e3ae47fab5acae051e208ec9074c, for GNU/Linux 3.2.0, not stripped
```

Checksec 是如何找到符号的信息呢？Checksec 提供了一个方便的 `--debug` 选项，来显示运行了哪些函数。因此，运行以下的命令，会显示在 shell 脚本中运行了哪些函数：

```
$ checksec --debug --file=./hello
```

在本教程中，我试图寻找 Checksec 查找安全属性信息时，使用了什么**底层命令**。由于 Checksec 是一个 shell 脚本，因此你始终可以使用 Bash 功能。以下的命令将输出从 shell 脚本中运行的每个命令：

```
$ bash -x /usr/bin/checksec --file=./hello
```

如果你滚动浏览上述的输出结果的话，你会看到 `echo_message` 后面有各个安全属性的类别。以下显示了 Checksec 检测二进制文件是否包含符号时，运行的底层命令：

```
+ readelf -W --symbols ./hello
+ grep -q '\\.symtab'
+ echo_message '\033[31m96) Symbols\t\033[m  ' Symbols, ' symbols="yes"' '"symbols":"yes",'
```

上面的输出显示，Checksec 利用 `readelf`，来读取二进制文件，并提供一个特殊 `--symbols` 标志，来列出二进制文件中的所有符号。然后它会查找一个特殊值：`.symtab`，它提供了所能找到的条目的计数（即符号的个数）。你可以在上面编译的测试二进制文件 `hello` 上，尝试以下命令，得到与 Checksec 查看二进制文件类似的符号信息：

```
$ readelf -W --symbols ./hello
$ readelf -W --symbols ./hello | grep -i symtab
```

（LCTT 译注：也可以通过直接查看 `/usr/bin/checksec` 下的 Checksec 源文件。）

##### 如何删除符号

你可以在编译后或编译时删除符号。

  * **编译后：** 在编译后，你可以使用 `strip`，手动地来删除二进制文件的符号。删除后，使用 `file` 命令，来检验是否还有符号，现在显示 `stripped`，表明二进制文件 `hello` 无符号了：

    ```
    $ gcc hello.c -o hello
    $
    $ file hello
    hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=322037496cf6a2029dcdcf68649a4ebc63780138, for GNU/Linux 3.2.0, not stripped
    $
    $ strip hello
    $
    $ file hello
    hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=322037496cf6a2029dcdcf68649a4ebc63780138, for GNU/Linux 3.2.0, stripped
    $ 
    ```
  * **编译时：** 你也可以在编译时，用 `-s` 参数让 gcc 编译器帮你自动地删除符号：

    ```
    $ gcc -s hello.c -o hello
    $
    $ file hello
    hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=247de82a8ad84e7d8f20751ce79ea9e0cf4bd263, for GNU/Linux 3.2.0, stripped
    $
    ```

    重新运行 Checksec，你可以看到现在二进制文件 `hello` 的 `symbols` 这一属性的值是`no`： 

    ```
    $ checksec --file=./hello --output=json | jq | grep symbols
        "symbols": "no",
    $
    ```

#### 2、Canary（堆栈溢出哨兵）

Canary 是放置在缓冲区和 <ruby>栈<rt> stack </rt></ruby> 上的控制数据之间的已知值，它用于监视缓冲区是否溢出。当应用程序执行时，会为其分配两种内存，其中之一就是 _栈_。栈是一个具有两个操作的数据结构：第一个操作 `push`，将数据压入堆栈；第二个操作 `pop`，以后进先出的顺序从栈中弹出数据。恶意的输入可能会导致栈溢出，或使用特制的输入破坏栈，并导致程序崩溃：

```
$ checksec --file=/bin/ls --output=json | jq | grep canary
    "canary": "yes",
$
$ checksec --file=./hello --output=json | jq | grep canary
    "canary": "no",
$
```

Checksec 是如何确定二进制文件是否启用了 Canary 的呢？使用上述同样的方法，得到 Checksec 在检测二进制文件是否启用 Canary 时，运行的底层命令：

```
$ readelf -W -s ./hello | grep -E '__stack_chk_fail|__intel_security_cookie'
```

##### 启用 Canary

为了防止栈溢出等情况，编译器提供了 `-stack-protector-all` 标志，它向二进制文件添加了额外的代码，来检查缓冲区是否溢出：

```
$ gcc -fstack-protector-all hello.c -o hello

$ checksec --file=./hello --output=json | jq | grep canary
    "canary": "yes",
```

Checksec 显示 Canary 属性现已启用。你还可以通过以下方式，来验证这一点：

```
$ readelf -W -s ./hello | grep -E '__stack_chk_fail|__intel_security_cookie'
     2: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND __stack_chk_fail@GLIBC_2.4 (3)
    83: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND __stack_chk_fail@@GLIBC_2.4
$
```

#### 3、位置无关可执行文件（PIE）

<ruby>位置无关可执行文件<rt>Position-Independent Executable</rt></ruby>（PIE），顾名思义，它指的是放置在内存中某处执行的代码，不管其绝对地址的位置，即代码段、数据段地址随机化（ASLR）：

```
$ checksec --file=/bin/ls --output=json | jq | grep pie
    "pie": "yes",

$ checksec --file=./hello --output=json | jq | grep pie
    "pie": "no",
```

通常，PIE 仅对 <ruby>库<rt> libraries </rt></ruby>启用，并不对独立命令行程序启用 PIE。在下面的输出中，`hello` 显示为 `LSB executable`，而 `libc` 标准库（`.so`） 文件被标记为 `LSB shared object`：

```
$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=014b8966ba43e3ae47fab5acae051e208ec9074c, for GNU/Linux 3.2.0, not stripped

$ file /lib64/libc-2.32.so
/lib64/libc-2.32.so: ELF 64-bit LSB shared object, x86-64, version 1 (GNU/Linux), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=4a7fb374097fb927fb93d35ef98ba89262d0c4a4, for GNU/Linux 3.2.0, not stripped
```

Checksec 查找是否启用 PIE 的底层命令如下：

```
$ readelf -W -h ./hello | grep EXEC
  Type:                              EXEC (Executable file)
```

如果你在共享库上尝试相同的命令，你将看到 `DYN`，而不是 `EXEC`：

```
$ readelf -W -h /lib64/libc-2.32.so | grep DYN
  Type:                              DYN (Shared object file)
```

##### 启用 PIE

要在测试程序 `hello.c` 上启用 PIE，请在编译时，使用以下命令：

```
$ gcc -pie -fpie hello.c -o hello`
```

你可以使用 Checksec，来验证 PIE 是否已启用：

```
$ checksec --file=./hello --output=json | jq | grep pie
    "pie": "yes",
$
```

现在，应该会显示为 “<ruby> PIE 可执行<rt> pie executable </rt></ruby>”，其类型从 `EXEC` 更改为 `DYN`：

```
$ file hello
hello: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=bb039adf2530d97e02f534a94f0f668cd540f940, for GNU/Linux 3.2.0, not stripped

$ readelf -W -h ./hello | grep DYN
  Type:                              DYN (Shared object file)
```

#### 4、NX（堆栈禁止执行）

NX 代表 <ruby>不可执行<rt> non-executable </rt></ruby>。它通常在 CPU 层面上启用，因此启用 NX 的操作系统可以将某些内存区域标记为不可执行。通常，缓冲区溢出漏洞将恶意代码放在堆栈上，然后尝试执行它。但是，让堆栈这些可写区域变得不可执行，可以防止这种攻击。在使用 `gcc` 对源程序进行编译时，默认启用此安全属性：

```
$ checksec --file=/bin/ls --output=json | jq | grep nx
    "nx": "yes",

$ checksec --file=./hello --output=json | jq | grep nx
    "nx": "yes",
```

Checksec 使用以下底层命令，来确定是否启用了 NX。在尾部的 `RW` 表示堆栈是可读可写的；因为没有 `E`，所以堆栈是不可执行的：

```
$ readelf -W -l ./hello | grep GNU_STACK
  GNU_STACK      0x000000 0x0000000000000000 0x0000000000000000 0x000000 0x000000 RW  0x10
```

##### 演示如何禁用 NX

我们不建议禁用 NX，但你可以在编译程序时，使用 `-z execstack` 参数，来禁用 NX：

```
$ gcc -z execstack hello.c -o hello

$ checksec --file=./hello --output=json | jq | grep nx
    "nx": "no",
```

编译后，堆栈会变为可读可写可执行（`RWE`），允许在堆栈上的恶意代码执行：

```
$ readelf -W -l ./hello | grep GNU_STACK
  GNU_STACK      0x000000 0x0000000000000000 0x0000000000000000 0x000000 0x000000 RWE 0x10
```

#### 5、RELRO（GOT 写保护）

RELRO 代表 “<ruby>重定位只读<rt> Relocation Read-Only </rt></ruby>”。可执行链接格式（ELF）二进制文件使用全局偏移表（GOT）来动态地解析函数。启用 RELRO 后，会设置二进制文件中的 GOT 表为只读，从而防止重定位攻击：

```
$ checksec --file=/bin/ls --output=json | jq | grep relro
    "relro": "full",

$ checksec --file=./hello --output=json | jq | grep relro
    "relro": "partial",
```

Checksec 使用以下底层命令，来查找是否启用 RELRO。在二进制文件 `hello` 仅启用了 RELRO 属性中的一个属性，因此，在 Checksec 验证时，显示 `partial`：

```
$ readelf -W -l ./hello | grep GNU_RELRO
  GNU_RELRO      0x002e10 0x0000000000403e10 0x0000000000403e10 0x0001f0 0x0001f0 R   0x1

$ readelf -W -d ./hello | grep BIND_NOW
```

##### 启用全 RELRO

要启用全 RELRO，请在 `gcc` 编译时，使用以下命令行参数：

```
$ gcc -Wl,-z,relro,-z,now hello.c -o hello

$ checksec --file=./hello --output=json | jq | grep relro
    "relro": "full",
```

现在， RELRO 中的第二个属性也被启用，使程序变成全 RELRO：

```
$ readelf -W -l ./hello | grep GNU_RELRO
  GNU_RELRO      0x002dd0 0x0000000000403dd0 0x0000000000403dd0 0x000230 0x000230 R   0x1

$ readelf -W -d ./hello | grep BIND_NOW
 0x0000000000000018 (BIND_NOW)       
```

#### 6、Fortify

Fortify 是另一个安全属性，但它超出了本文的范围。Checksec 是如何在二进制文件中验证 Fortify，以及如何在 `gcc` 编译时启用 Fortify，作为你需要解决的课后练习。

```
$ checksec --file=/bin/ls --output=json | jq  | grep -i forti
    "fortify_source": "yes",
    "fortified": "5",
    "fortify-able": "17"

$ checksec --file=./hello --output=json | jq  | grep -i forti
    "fortify_source": "no",
    "fortified": "0",
    "fortify-able": "0"
```

### 其他的 Checksec 功能

关于安全性的话题是永无止境的，不可能在本文涵盖所有关于安全性的内容，但我还想提一下 Checksec 命令的一些其他功能，这些功能也很好用。

#### 对多个二进制文件运行 Checksec

你不必对每个二进制文件都进行一次 Checksec。相反，你可以提供多个二进制文件所在的目录路径，Checksec 将一次性为你验证所有文件：

```
$ checksec --dir=/usr
```

#### 对进程运行 Checksec

Checksec 除了能检查二进制文件的安全属性，Checksec 还能对程序起作用。以下的命令用于查找你系统上所有正在运行的程序的安全属性。如果你希望 Checksec 检查所有正在运行的进程，可以使用 `--proc-all`，或者你也可以使用进程名称，选择特定的进程进行检查：

```
$ checksec --proc-all

$ checksec --proc=bash
```

#### 对内核运行 Checksec

除了本文介绍的用 Checksec 检查用户态应用程序的安全属性之外，你还可以使用它来检查系统内置的 <ruby>内核属性<rt> kernel properties </rt></ruby>：

```
$ checksec --kernel
```

### 快来试一试 Checksec 吧

Checksec 是一个能了解哪些用户空间和内核的安全属性被启用的好方法。现在，你就可以开始使用 Checksec，来了解每个安全属性是什么，并明白启用每个安全属性的原因，以及它能阻止的攻击类型。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/linux-checksec

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[chai001125](https://github.com/chai001125)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/lead-images/target-security.png
[2]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[3]: https://stedolan.github.io/jq/download/
[0]: https://img.linux.net.cn/data/attachment/album/202211/18/095702dzvm482460vnrv6y.jpg