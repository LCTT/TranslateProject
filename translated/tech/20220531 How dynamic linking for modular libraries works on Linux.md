[#]: subject: "How dynamic linking for modular libraries works on Linux"
[#]: via: "https://opensource.com/article/22/5/dynamic-linking-modular-libraries-linux"
[#]: author: "Jayashree Huttanagoudar https://opensource.com/users/jayashree-huttanagoudar"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Linux 上动态链接模块库
======
学习如何将多个 C <ruby>对象<rt>object</rt></ruby> 文件组合到一个带有动态库的单个可执行文件文件之中

![Links][1]

图片作者: Paul Lewin ，由 Opensource.com 稍微修改，CC BY-SA 2.0

当不使用 C 编程语言编写一个应用程序时，你的代码通常有多个源文件代码。

归根结底，这些文件必需被编译到一个单个的可执行文件之中。你可以通过创建静态或动态库 (后者也被称为 <ruby>共享<rt>shared</rt></ruby> 库) 来实现这一点。这两种类型的库在创建和链接方面有所差异。两者都有缺点和优点，这取决于你的使用实例。

动态链接是最常见的方法，由其是在 Linux 系统上。动态链接会保持库模块化，因此，很多应用程序可以共享一个库。应用程序的模块化也允许单独更新其依赖的共享库。

在这篇文章中，我将演示动态链接是如何工作的。在后期的文章中，我将演示静态链接。

### 链接器

链接器是一个命令，它将一个程序的数个部分组合到一起，并为它们重新组织存储器分配。

链接器的功能包括：

* 集成一个程序的所有的部分
* 计算组织出一个新的存储器结构，以便所有的部分组合在一起
* 重新复活存储器地址，以便程序可以在新的存储器组织下运行
* 解析符号引用

作为这些链接器功能的结果，创建了一个名称为可执行文件的一个可运行程序。在你创建一个动态链接的可执行文件前，你需要一些将被链接 *到* 的库，和一个应用程序来编译。准备好你 [最喜欢的文本编辑器][2] 并继续。

### 创建 <ruby>对象<rt>object</rt></ruby> 文件

首先，创建带有这些函数识别标志的头文件 `mymath.h` ：

```
int add(int a, int b);
int sub(int a, int b);
int mult(int a, int b);
int divi(int a, int b);
```

使用这些函数定义来创建 `add.c` 、`sub.c` 、`mult.c` 和 `divi.c` 文件。我将把所有的代码都放置到一个代码块中，因此将其分为四个文件，如注释所示：

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

现在，使用 GCC 来创建对象文件 `add.o`、`sub.o`、`mult.o` 和 `divi.o` ：

```
$ gcc -c add.c sub.c mult.c divi.c
```

`-c` 选项跳过链接步骤，并且只创建对象文件。

### 创建一个共享的对象文件

在最终可执行文件的执行过程中将链接动态库。在最终可执行文件中仅放置动态库的名称。实际上的链接过程发生在运行时，在此期间，可执行文件和库都被放置到了主存储器之中。

除了可共享外，动态库的另外一个优点是它减少最终可执行文件的大小。在一个应用程序的最终可执行文件生成时，其使用的库只包括该库的名称，而不再包含该库的一个多余的副本。

你可以从你现有的示例代码中创建动态库：

```
$ gcc -Wall -fPIC -c add.c sub.c mult.c divi.c
```

选项 `-fPIC` 告诉 GCC 来生成位置独立代码 (PIC) 。`-Wall` 选项不是必需的，并且与代码的编译方式是无关的。不过，它却是有价值的选项，因为它会启用编译器警告，这在解决难题时是很有帮助的。

使用 GCC ，创建共享库 `libmymath.so` ：

```
$ gcc -shared -o libmymath.so \
add.o sub.o mult.o divi.o
```

现在，你已经创建了一个简单的示例数学库 `libmymath.so` ，你可以在 C 代码中使用它。当然，这里有非常复杂的 C 库，这就是他们这些开发者来生成最终产品的工艺流程，你和我可以安装这些库并在 C 代码中使用。

接下来，你可以在一些自定义代码中使用你的新的数学库，然后链接它。

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

注意：第一行是一个 `include` 语句，通过名称来引用你自己的 `libmymath` 库。为使用一个共享库，你必须已经安装了它，如果你没有安装你将要使用的库，那么当你的可执行文件在运行和搜索其包含的库时，它将不能找到共享库。在已知目录中未安装所需库的情况下，你需要能够编译代码，这里有 [一些方法来重写默认的设置][3]。不过，对于一般使用来说，库存在于已知位置是可以预期的，因此，这就是我在这里演示的东西。

复制文件 `libmymath.so` 到一个标准的系统目录，例如：`/usr/lib64`， 然后运行 `ldconfig` 。`ldconfig` 命令会在标准库目录中创建所需要的链接，并将其缓存到可找到的最近的共享库。

```
$ sudo cp libmymath.so /usr/lib64/
$ sudo ldconfig
```

### 编译应用程序

从你的应用程序源文件代码 (`mathDemo.c`) 中创建一个名称为 `mathDemo.o` 的对象文件：

```
$ gcc -I . -c mathDemo.c
```

`-I` 选项告诉 GCC 来在其后所列出的目录中搜索头文件 (在这个实例中是 `mymath.h` )。在这个实例中，你正在具体指定当前目录，通过一个单个点 (`.` ) 来表示。创建一个可执行文件，使用 `-l` 选项来通过名称来引用到你的共享数学库：

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

当然，它是一个小的应用程序，它所占用的磁盘空间量也反映了这一点。相比之下，相同代码的一个静态链接版本 (正如你将在我后期的文章所看到的一样) 是 932K !

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

因为链接发生在运行时，所以，使用一个共享库会导致产生一个轻量型的可执行文件。因为它在运行时解析引用，所以它会花费更多的执行时间。不过，因为 在日常使用的 Linux 系统上绝大多数的命令是动态链接的，并且在现代硬件上，所以和使用静态编译程序所能节省的时间相比是可以忽略的。对开发者和用户来说，它的固有模块性是一种强大的特色功能。

在这篇文章中，我描述了如何创建动态库并将其链接到一个最终可执行文件。在我的下一篇文章中，我将使用相同的源文件代码来创建一个静态链接的可执行文件。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/dynamic-linking-modular-libraries-linux

作者：[Jayashree Huttanagoudar][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jayashree-huttanagoudar
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/links.png
[2]: https://opensource.com/article/21/2/open-source-text-editors
[3]: https://opensource.com/article/22/5/compile-code-ldlibrarypath
