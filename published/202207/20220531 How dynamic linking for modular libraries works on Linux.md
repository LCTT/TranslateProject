[#]: subject: "How dynamic linking for modular libraries works on Linux"
[#]: via: "https://opensource.com/article/22/5/dynamic-linking-modular-libraries-linux"
[#]: author: "Jayashree Huttanagoudar https://opensource.com/users/jayashree-huttanagoudar"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14813-1.html"

如何在 Linux 上动态链接模块库
======

![](https://img.linux.net.cn/data/attachment/album/202207/10/182540caie7ldrefflffah.jpg)

> 学习如何用动态链接库将多个 C 目标文件结合到一个单个的可执行文件之中。

当使用 C 编程语言编写一个应用程序时，你的代码通常有多个源文件代码。

最终，这些文件必须被编译到一个单个的可执行文件之中。你可以通过创建静态或动态库（后者也被称为 <ruby>共享<rt>shared</rt></ruby> 库）来实现这一点。这两种类型的库在创建和链接的方式上有所不同。两者都有缺点和优点，这取决于你的使用情况。

动态链接是最常见的方法，尤其是在 Linux 系统上。动态链接会保持库模块化，因此，很多应用程序可以共享一个库。应用程序的模块化也允许单独更新其依赖的共享库。

在这篇文章中，我将演示动态链接是如何工作的。在后期的文章中，我将演示静态链接。

### 链接器

<ruby>链接器<rt>linker</rt></ruby>是一个命令，它将一个程序的数个部分结合在一起，并为它们重新组织内存分配。

链接器的功能包括：

* 整合一个程序的所有的部分
* 计算出一个新的内存组织结构，以便所有的部分组合在一起
* 恢复内存地址，以便程序可以在新的内存组织结构下运行
* 解析符号引用

链接器通过这些功能，创建了一个名为<ruby>可执行文件<rt>executable</rt></ruby>的可以运行的程序。在你创建一个动态链接的可执行文件前，你需要一些用来链接的库，和一个用来编译的应用程序。准备好你 [最喜欢的文本编辑器][2] 并继续。

### 创建目标文件

首先，创建带有这些函数签名的头文件 `mymath.h` ：

```
int add(int a, int b);
int sub(int a, int b);
int mult(int a, int b);
int divi(int a, int b);
```

使用这些函数定义来创建 `add.c` 、`sub.c` 、`mult.c` 和 `divi.c` 文件。我将把所有的代码都放置到一个代码块中，请将其分为四个文件，如注释所示：

```
// add.c
int add(int a, int b){
return (a+b);
}

//sub.c
int sub(int a, int b){
return (a-b);
}

//mult.c
int mult(int a, int b){
return (a*b);
}

//divi.c
int divi(int a, int b){
return (a/b);
}
```

现在，使用 GCC 来创建目标文件 `add.o`、`sub.o`、`mult.o` 和 `divi.o` ：

（LCTT 校注：关于“<ruby>目标文件<rt>object file</rt></ruby>”，有时候也被称作“对象文件”，对此，存在一些译法混乱情形，称之为“目标文件”的译法比较流行，本文采用此译法。）

```
$ gcc -c add.c sub.c mult.c divi.c
```

`-c` 选项跳过链接步骤，并且只创建目标文件。

### 创建一个共享的目标文件

在最终的可执行文件的执行过程中将链接动态库。在最终的可执行文件中仅放置动态库的名称。实际上的链接过程发生在运行时，在此期间，可执行文件和库都被放置到了主内存中。

除了可共享外，动态库的另外一个优点是它减少了最终的可执行文件的大小。在一个应用程序最终的可执行文件生成时，其使用的库只包括该库的名称，而不是该库的一个多余的副本。

你可以从你现有的示例代码中创建动态库：

```
$ gcc -Wall -fPIC -c add.c sub.c mult.c divi.c
```

选项 `-fPIC` 告诉 GCC 来生成<ruby>位置无关的代码<rt>position-independent code</rt></ruby>（PIC）。`-Wall` 选项不是必需的，并且与代码的编译方式是无关的。不过，它却是一个有价值的选项，因为它会启用编译器警告，这在排除故障时是很有帮助的。

使用 GCC ，创建共享库 `libmymath.so` ：

```
$ gcc -shared -o libmymath.so add.o sub.o mult.o divi.o
```

现在，你已经创建了一个简单的示例数学库 `libmymath.so` ，你可以在 C 代码中使用它。当然，也有非常复杂的 C 库，这就是他们这些开发者来生成最终产品的工艺流程，你和我可以安装这些库并在 C 代码中使用。

接下来，你可以在一些自定义代码中使用你的新数学库，然后链接它。

### 创建一个动态链接的可执行文件

假设你已经为数学运算编写了一个命令。创建一个名称为 `mathDemo.c` 的文件，并将这些代码复制粘贴至其中：

```
#include <mymath.h>
#include <stdio.h>
#include <stdlib.h>

int main()
{
  int x, y;
  printf("Enter two numbers\n");
  scanf("%d%d",&x,&y);
 
  printf("\n%d + %d = %d", x, y, add(x, y));
  printf("\n%d - %d = %d", x, y, sub(x, y));
  printf("\n%d * %d = %d", x, y, mult(x, y));

  if(y==0){
    printf("\nDenominator is zero so can't perform division\n");
      exit(0);
  }else{
      printf("\n%d / %d = %d\n", x, y, divi(x, y));
      return 0;
  }
}
```

注意：第一行是一个 `include` 语句，通过名称来引用你自己的 `libmymath` 库。要使用一个共享库，你必须已经安装了它，如果你没有安装你将要使用的库，那么当你的可执行文件在运行并搜索其包含的库时，将找不到该共享库。如果你需要在不安装库到已知目录的情况下编译代码，这里有 [一些方法可以覆盖默认设置][3]。不过，对于一般使用来说，我们希望库存在于已知的位置，因此，这就是我在这里演示的东西。

复制文件 `libmymath.so` 到一个标准的系统目录，例如：`/usr/lib64`， 然后运行 `ldconfig` 。`ldconfig` 命令创建所需的链接，并缓存到标准库目录中发现的最新共享库。

```
$ sudo cp libmymath.so /usr/lib64/
$ sudo ldconfig
```

### 编译应用程序

从你的应用程序源文件代码（`mathDemo.c`）中创建一个名称为 `mathDemo.o` 的目标文件：

```
$ gcc -I . -c mathDemo.c
```

`-I` 选项告诉 GCC 来在其后所列出的目录中搜索头文件（在这个示例中是 `mymath.h`）。在这个示例中，你指定的是当前目录，通过一个单点（`.`）来表示。创建一个可执行文件，使用 `-l` 选项来通过名称来引用你的共享数学库：

```
$ gcc -o mathDynamic mathDemo.o -lmymath
```

GCC 会找到 `libmymath.so` ，因为它存在于一个默认的系统库目录中。使用 `ldd` 来查证所使用的共享库：

```
$ ldd mathDemo
    linux-vdso.so.1 (0x00007fffe6a30000)
    libmymath.so => /usr/lib64/libmymath.so (0x00007fe4d4d33000)
    libc.so.6 => /lib64/libc.so.6 (0x00007fe4d4b29000)
    /lib64/ld-linux-x86-64.so.2 (0x00007fe4d4d4e000)
```

看看 `mathDemo` 可执行文件的大小：

```
$ du ./mathDynamic
24   ./mathDynamic
```

当然，它是一个小的应用程序，它所占用的磁盘空间量也反映了这一点。相比之下，相同代码的一个静态链接版本（正如你将在我后期的文章所看到的一样）是 932K !

```
$ ./mathDynamic
Enter two numbers
25
5

25 + 5 = 30
25 - 5 = 20
25 * 5 = 125
25 / 5 = 5
```

你可以使用 `file` 命令来查证它是动态链接的：

```
$ file ./mathDynamic
./mathDynamic: ELF 64-bit LSB executable, x86-64,
dynamically linked,
interpreter /lib64/ld-linux-x86-64.so.2,
with debug_info, not stripped
```

成功！

### 动态链接

因为链接发生在运行时，所以，使用一个共享库会产生一个轻量型的可执行文件。因为它在运行时解析引用，所以它会花费更多的执行时间。不过，因为在日常使用的 Linux 系统上绝大多数的命令是动态链接的，并且在现代硬件上，所能节省的时间是可以忽略不计的。对开发者和用户来说，它的固有模块性是一种强大的功能。

在这篇文章中，我描述了如何创建动态库，并将其链接到一个最终可执行文件。在我的下一篇文章中，我将使用相同的源文件代码来创建一个静态链接的可执行文件。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/dynamic-linking-modular-libraries-linux

作者：[Jayashree Huttanagoudar][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jayashree-huttanagoudar
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/links.png
[2]: https://opensource.com/article/21/2/open-source-text-editors
[3]: https://opensource.com/article/22/5/compile-code-ldlibrarypath
