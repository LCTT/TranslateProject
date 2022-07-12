[#]: subject: "How static linking works on Linux"
[#]: via: "https://opensource.com/article/22/6/static-linking-linux"
[#]: author: "Jayashree Huttanagoudar https://opensource.com/users/jayashree-huttanagoudar"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: "turbokernel"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14819-1.html"

Linux 上静态链接库工作原理
======

![](https://img.linux.net.cn/data/attachment/album/202207/12/120441y0q5a5abfyjyy7ug.jpg)

> 学习如何用静态链接库将多个 C 目标文件结合到一个单个的可执行文件之中。

使用 C 编写的应用程序时，通常有多个源码文件，但最终你需要编译成单个的可执行文件。

你可以通过两种方式来完成这项工作：通过创建一个 <ruby>静态<rt>static</rt></ruby> 库 或 一个 <ruby>动态<rt>dynamic</rt></ruby> 库（也被称为 <ruby>共享<rt>shared</rt></ruby> 库）。从创建和链接的方式来看，它们是两种不同类型的库。选择使用哪种方式取决于你的的具体场景。

在 [上一篇文章][3] 中，我演示了如何创建一个动态链接的可执行文件，这是一种更通用的方法。在这篇文章中，我将说明如何创建一个静态链接的可执行文件。

### 使用静态库链接器

<ruby>链接器<rt>linker</rt></ruby>是一个命令，它将一个程序的多个部分结合在一起，并为它们重新组织内存分配。

链接器的功能包括：

* 整合一个程序的所有的部分
* 计算出一个新的内存组织结构，以便所有的部分组合在一起
* 恢复内存地址，以便程序可以在新的内存组织结构下运行
* 解析符号引用

链接器通过这些功能，创建了一个名称为可执行文件的一个可运行程序。

静态库是通过复制一个程序中的所有依赖库模块到最终的可执行镜像来创建的。链接器将链接静态库作为编译过程的最后一步。可执行文件是通过解析外部引用、将库例程与程序代码结合在一起来创建的。

### 创建目标文件

这里是一个静态库的示例以及其链接过程。首先，创建带有这些函数识别标志的头文件 `mymath.h` :

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

现在，使用 GCC 来生成目标文件 `add.o` 、`sub.o` 、`mult.o` 和 `divi.o`：

（LCTT 校注：关于“<ruby>目标文件<rt>object file</rt></ruby>”，有时候也被称作“对象文件”，对此，存在一些译法混乱情形，称之为“目标文件”的译法比较流行，本文采用此译法。）

```
$ gcc -c add.c sub.c mult.c divi.c
```

`-c` 选项跳过链接步骤，而只创建目标文件。

创建一个名称为 `libmymath.a` 的静态库，接下来，移除目标文件，因为它们不再被需要。（注意，使用一个 `trash` 命令比使用一个 `rm` 命令更安全。）

```
$ ar rs libmymath.a add.o sub.o mult.o divi.o
$ trash *.o
$ ls
add.c  divi.c  libmymath.a  mult.c  mymath.h  sub.c
```

现在，你已经创建了一个名称为 `libmymath` 的简单数学示例库，你可以在 C 代码中使用它。当然，也有非常复杂的 C 库，这就是他们这些开发者来生成最终产品的工艺流程，你和我可以安装这些库并在 C 代码中使用。

接下来，在一些自定义代码中使用你的数学库，然后链接它。

### 创建一个静态链接的应用程序

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

注意：第一行是一个 `include` 语句，通过名称来引用你自己的 `libmymath` 库。

针对 `mathDemo.c` 创建一个名称为 `mathDemo.o` 的对象文件:

```
$ gcc -I . -c mathDemo.c
```

`-I` 选项告诉 GCC 搜索在其后列出的头文件。在这个实例中，你通过单个点（`.`）来指定当前目录。

链接 `mathDemo.o` 和 `libmymath.a` 来生成最终的可执行文件。这里有两种方法来向 GCC 告知这一点。

你可以指向文件：

```
$ gcc -static -o mathDemo mathDemo.o libmymath.a
```

或者，你可以具体指定库的路径及名称：

```
$ gcc -static -o mathDemo -L . mathDemo.o -lmymath
```

在后面的那个示例中，`-lmymath` 选项告诉链接器来链接对象文件 `mathDemo.o` 和对象文件 `libmymath.a` 来生成最终的可执行文件。`-L` 选项指示链接器在下面的参数中查找库（类似于你使用 `-I` 所做的工作）。

### 分析结果

使用 `file` 命令来验证它是静态链接的：

```
$ file mathDemo
mathDemo: ELF 64-bit LSB executable, x86-64...
statically linked, with debug_info, not stripped
```

使用 `ldd` 命令，你将会看到该可执行文件不是动态链接的：

```
$ ldd ./mathDemo
        not a dynamic executable
```

你也可以查看 `mathDemo` 可执行文件的大小：

```
$ du -h ./mathDemo
932K    ./mathDemo
```

在我 [前一篇文章][3] 的示例中，动态链接的可执行文件只占有 24K 大小。

运行该命令来看看它的工作内容：

```
$ ./mathDemo
Enter two numbers
10
5

10 + 5 = 15
10 - 5 = 5
10 * 5 = 50
10 / 5 = 2
```

看起来令人满意！

### 何时使用静态链接

动态链接可执行文件通常优于静态链接可执行文件，因为动态链接会保持应用程序的组件模块化。假如一个库接收到一次关键安全更新，那么它可以很容易地修补，因为它存在于应用程序的外部。

当你使用静态链接时，库的代码会“隐藏”在你创建的可执行文件之中，意味着在库每次更新时（相信我，你会有更好的东西），仅有的一种修补方法是重新编译和发布一个新的可执行文件。

不过，如果一个库的代码，要么存在于它正在使用的具有相同代码的可执行文件中，要么存在于不会接收到任何更新的专用嵌入式设备中，那么静态连接将是一种可接受的选项。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/static-linking-linux

作者：[Jayashree Huttanagoudar][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jayashree-huttanagoudar
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png
[2]: https://creativecommons.org/licenses/by/3.0/us/
[3]: https://linux.cn/article-14813-1.html
[4]: https://www.redhat.com/sysadmin/recover-file-deletion-linux
[5]: https://opensource.com/article/22/5/dynamic-linking-modular-libraries-linux
