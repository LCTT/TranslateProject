[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn the basics of programming with C)
[#]: via: (https://opensource.com/article/20/8/c-programming-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 C 语言学习基本的编程
======
我们将所有的 C 语言要素放置到一份易读的备忘录上。
![备忘录封面图片][1]

在 1972 年，丹尼斯·里奇在贝尔实验室，在几年前，他和他的团队成员发明了 Unix 。在创建了一个经久不衰的操作系统(至今仍在使用)之后,他需要一种好的方法来编程这些 Unix 计算机，以便它们可用执行新的任务。在现在看来，这很奇怪，但在当时，编程语言相对较少；Fortran，Lisp，[Algol][2] 以及 B 语言都很流行，但是，对于贝尔实验室的研究员们想要做的事情来说，它们还是远远不够的。丹尼斯·里奇创造了他自己的解决方案，表现出一种以程序员的主要特征而闻名的特质，他称之为 C 语言，并且在近 50 年后，它仍在广泛的使用。

### 为什么你应该学习 C 语言

今天，这里有很多语言为程序员提供比 C 语言更多是特性。最明显的一种语言是 C++ 语言，一种相当明显的命名方式的语言，它在 C 语言之上构建，创建了一种很好的面向对象的语言。不过，这里有很多其它的语言，它们都很好的存在理由。计算机擅长始终如一的重复，因此任何可预见的东西都足以构建到一种语言中，对程序员来说这意味着更少的工作量。为什么要在 C++ 语言中一行 (`long x = long(n);`) 可以做到的相同的事时，而要花费两行来改写 C 语言中的一个 `int` 为一个 `long` ?

然而，C 语言在今天仍然有用。

首先，C 语言是一种最小和简单的的语言。这里没有超出编程基础的非常高级的概念，很大程度上是因为 C 语言简直是现代编程语言的基础之一。例如，C 语言的特性数组，但是它不提供字典(除非你自己写)。当你学习 C 语言时，你将学习编程的构建语句块,它可以帮助你辨别出当前语言的改善和精心制作的设计构思。

因为 C 语言是一种最小的编程语言，你的应用程序很可能会获得性能上的提升，这在很多其它编程语言中是看不到的。当你考虑你的代码可以执行多快的时候，它很容易被卷入到下面的速度竞赛，因此，询问你是否 _需要_ 更快的速度来完成一项特定的任务是很重要的。与 Python 或 Java 相比，使用 C 语言，你没有必要为每一行的代码所困扰。C 语言程序运行很快。这是 Linux 内核使用 C 语言编写的一个很好的理由。

最后，C 语言很容易入门，特别是，如果你正在运行  Linux ，你可能已经在运行 C 语言代码，因为 Linux 系统包含 GNU C 库(`glibc`)。为了编写和构建 C 语言程序, 你需要做的全部工作就是安装一个编译器，打开一个文本编辑器，开始编码。

### 开始学习 C 语言

如果你正在运行 Linux ，你可以使用你的软件包管理器安装一个 C 编译器。在 Fedora 或 RHEL 上:


```
$ sudo dnf install gcc
```

在 Debian 及其衍生系统上:


```
$ sudo apt install build-essential
```

在 macOS 上，你可以 [安装 Homebrew][3] ，并使用它来安装 [GCC][4]:


```
`$ brew install gcc`
```

在 Windows 上, 你可以使用 [MinGW][5] 安装一套最小的包含 GCC的 GNU 实用程序集。

在 Linux 或 macOS 上验证你已经安装的 GCC:


```
$ gcc --version
gcc (GCC) x.y.z
Copyright (C) 20XX Free Software Foundation, Inc.
```

在 Windows 上, 提供 EXE 文件的完整路径：


```
PS> C:\MinGW\bin\gcc.exe --version
gcc.exe (MinGW.org GCC Build-2) x.y.z
Copyright (C) 20XX Free Software Foundation, Inc.
```

### C 语法

C 语言不是一种脚本型的语言。它是一种编译型的语言，这意味着它由 C 编译器处理来产生一个二进制可执行文件。这不同于一种脚本型语言(像：[Bash][6] )或一种混合型语言(像：[Python][7] )。

在 C 语言中,你创建 _函数_ 来实施你渴望做到的任务。默认情况下，一个名称为 `main` 的函数将被执行。

这里是一个使用 C 语言写的简单的 "hello world" 程序:


```
#include <stdio.h>

int main() {
  printf("Hello world");
  return 0;
}
```

第一行包含一个被称为 `stdio.h` (标准输入和输出) 的 _头文件_ ，它基本上是自由的、非常初级的 C 语言代码，你可以在你自己的程序中重复使用。创建一个由一个基本的输出语句构成的名称为 `main` 的函数。保存这些文本到一个被称为 `hello.c` 的文件中，然后使用 GCC 编译它:


```
`$ gcc hello.c --output hello`
```

尝试运行你的 C 语言程序:


```
$ ./hello
Hello world$
```

#### 返回值

一个函数在执行后“返回”一些东西是 Unix 哲学的一部分:在成功时不返回任何东西，在失败使返回其它的一些东西(例如，一个错误信息)。这些返回代码通常使用数字(确切地说是整数)表示: 0 表示没有东西，任何大于 0 的数字都表示一些不成功的状态。

Unix 和 Linux 被设计成在运行成功时要求沉默的是很明智的。这样，你可以总是通过假设在执行一系列命令后没有获得任何错误或警告来期待成功。类似地，在 C 语言中的函数在设计上也不希望出现错误。

你可以使用一小处使你的出现出现错误的修改来自己看到这些设计:


```
include <stdio.h>

int main() {
  printf("Hello world");
  return 1;
}
```

编译它:


```
$ gcc hello.c --output failer
```

现在使用一个内置的 Linux 测试来运行它。仅在成功时，`&&` 操作符执行一个命令的第二部分。例如:


```
$ echo "success" && echo "it worked"
success
it worked
```

在 _失败_ 时，`||`测试执行一个命令的第二部分。


```
$ ls blah || echo "it did not work"
ls: cannot access 'blah': No such file or directory
it did not work
```

现在，尝试你的程序，在成功时，它 _不_ 返回 0 ;而是返回 1 :


```
$ ./failer &&; echo "it worked"
String is: hello
```

这个程序成功地执行，但是没有触发第二个命令。

#### 变量和类型

在一些语言中，你可以在不具体指定变量所包含的数据的 _类型_ 的情况下创建变量。这些语言如此设计使得解释器对一个变量运行一些测试来企图发现变量什么样的数据类型。例如，Python 知道当你创建一个表达式时，`var=1` 定义了一个整型数，将 `var` 添加一些东西上，这显然是一个整型数。它同样知道当你连接 `hello` 和 `world` 时，单词 `world` 是一个字符串。

C 语言不会为你做任何这些识别和调查；你必需定义你自己的变量类型。这里有几种变量类型，包括整型(int)，字符型(char)，浮点型(float)，布尔型(Boolean)。

你可能也注意到这里没有字符串类型。与 Python 和 Java 和 Lua 以及其它的编程语言不同，C 语言没有字符串类型，而是将字符串看作一个字符数组。

这里是一些简单的代码，它建立了一个 `char` 数组变量，然后使用 [printf][9] 将数组变量和一段简单的信息打印到你的屏幕上:


```
#include <stdio.h>

int main() {
   char var[6] = "hello";
   printf("Your string is: %s\r\n",var);
}
```

你可能会注意到，这个代码示例向一个由五个字母组成的单词提供六个字符的空间。这是因为在字符串的结尾有处一个隐藏的终止符，终止符占用数组中的一个字节。你可以通过编译和执行代码来运行它:


```
$ gcc hello.c --output hello
$ ./hello
hello
```

### 函数

和其它的编程语言一样，C 函数采取可选函数。你可以通过定义你希望一个函数接受的数据类型来将参数从一个函数传递到另一个函数:


```
#include <stdio.h>

int printmsg(char a[]) {
   printf("String is: %s\r\n",a);
}

int main() {
   char a[6] = "hello";
   printmsg(a);
   return 0;
}
```

使用这种方法简单将一个函数分解为两个函数的方法并不是非常有用，但是它证明 `main` 默认运行以及如何在函数之间传递数据。

### 条件语句

在真实的编程中，你通常希望你的代码根据数据做出判断。这是使用This is done with _条件_ 语句完成的，并且 `if` 语句是它们中最基础的一个语句。

为了使这个示例程序更具动态性，你可以包含 `string.h` 头文件，它包含用于检查(顾名思义)字符串的代码。尝试使用来自 `string.h` 文件中的 `strlen` 函数测试传递给 `printmsg` 函数的字符串是否大于 0 :


```
#include <stdio.h>
#include <string.h>

int printmsg(char a[]) {
  size_t len = strlen(a);
  if ( len > 0) {
    printf("String is: %s\r\n",a);
  }
}

int main() {
   char a[6] = "hello";
   printmsg(a);
   return 1;
}
```

正如在这个示例中所实现的，示例条件永远都不会是真实的，因为所提供的字符串总是 "hello" ，它的长度总是大于 0 。`echo` 命令的这个不够认真的重新实施的最后接触是接受来自用户的输入。

### 命令参数

`stdio.h` 文件包含的代码在每次程序启动时提供两个参数: 一个是包含在命令 (`argc`) 中的项目总数，一个是包含每个项目 (`argv`) 的数组。例如， 假设你发出这个虚构的命令:


```
$ foo -i bar
```

`argc` 是 3 个，`argv` 的内容是:

  * `argv[0] = foo`
  * `argv[1] = -i`
  * `argv[2] = bar`



你可以修改示例 C 语言程序来接受 `argv[2]` 作为字符串，而不是默认来接受`hello` 吗?

### 命令式编程语言

C 语言是一种命令式编程语言。它不是面向对象的，它没有类结构。使用 C 语言的经验可以教你很多关于如何处理数据和如何更好地管理你的代码运行时生成的数据。充分地使用 C 语言，你最后能够编写其它语言 (例如 Python 和 Lua) 能够使用的库。

为了学习更多关于 C 的知识，你需要使用它。在 `/usr/include/` 中查找有用的 C 语言头文件，并且看看你可以做什么小任务来使其对你学习 C 语言有用。 正如你学习时，使用 [Jim Hall][12] 的 FreeDOS 的 [C 语言忘备录][11]。它在一张双面纸忘备录上放置所有的基本要素，因此在你实施练习时，你可以立即访问 C 语言语法的所有要素。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/c-programming-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://opensource.com/article/20/6/algol68
[3]: https://opensource.com/article/20/6/homebrew-mac
[4]: https://gcc.gnu.org/
[5]: https://opensource.com/article/20/8/gnu-windows-mingw
[6]: https://opensource.com/resources/what-bash
[7]: https://opensource.com/resources/python
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[9]: https://opensource.com/article/20/8/printf
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/strlen.html
[11]: https://opensource.com/downloads/c-programming-cheat-sheet
[12]: https://opensource.com/users/jim-hall
