[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12573-1.html)
[#]: subject: (How to use printf to format output)
[#]: via: (https://opensource.com/article/20/8/printf)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何使用 printf 来格式化输出
======

> 来了解一下 printf ，一个神秘的、灵活的和功能丰富的函数，可以替换 echo、print 和 cout。

![](https://img.linux.net.cn/data/attachment/album/202009/02/001109wp3xdtr27xop25e7.jpg)

当我开始学习 Unix 时，我很早就接触到了 `echo` 命令。同样，我最初的 [Python][2] 课程也涉及到了 `print` 函数。再想起学习 C++ 和 [Java][2] 时学到 `cout` 和 `systemout`。似乎每种语言都骄傲地宣称拥有一种方便的单行输出方法，并生怕这种方式要过时一样宣传它。

但是当我翻开中级教程的第一页后，我遇到了 `printf`，一个晦涩难懂的、神秘莫测的，又出奇灵活的函数。本文一反向初学者隐藏 `printf` 这个令人费解的传统，旨在介绍这个不起眼的 `printf` 函数，并解释如何在几乎所有语言中使用它。

### printf 简史

术语 `printf` 代表“<ruby>格式化打印<rt>print formatted</rt></ruby>”，它可能最早出现 [Algol 68][3] 编程语言中。自从它被纳入到 C 语言后，`printf` 已经在 C++、Java、Bash、PHP 中一次次重新实现，并且很可能在你最喜欢的 “后 C” 语言中再次出现。

显然，它很受欢迎，但很多人认为它的语法很复杂，尤其是与 `echo` 或 `print` 或 `cout` 等替代的函数相比尤为明显。例如，这是在 Bash 中的一个简单的 `echo` 语句：

```
$ echo hello
hello
$
```

这是在 Bash 中使用 `printf` 得到同样结果:

```
$ printf "%s\n" hello
hello
$
```

但是所增加的复杂性反而让你拥有很多功能，这是为什么 `printf` 值得学习的确切原因。

### printf 输出

在 `printf` 背后的基本思想是：它能够基于与内容*分离的*样式信息来格式化输出。例如，这里是 `printf` 认可的视作特殊字符的特定序列集合。你喜欢的语言可能会有或多或少的序列，但是通常包含：

  * `\n`: 新行
  * `\r`: 回车换行
  * `\t`: 水平制表符
  * `\NNN`: 一个包含一个到三个数字，使用八进制值表示的特殊字节

例如：

```
$ printf "\t\123\105\124\110\n"
     SETH
$
```

在这个 Bash 示例中， `printf` 渲染一个制表符后，然后是分配给四个八进制值字符串的 ASCII 字符，并以一个生成一个新行（`\n`）的控制序列结束。

如果同样使用 `echo` 来输出会产生更多的字符：

```
$ printf "\t\123\105\124\110\n"
\t\123\105\124\110\n
$
```

使用 Python 的 `print` 函数来完成同样的任务，你会发现 Python 的 `print` 命令比你想象的要强大：

```
>>> print("\t\123\n")
        S

>>>
```

显然，Python 的 `print` 包含传统的 `printf` 特性以及简单的 `echo` 或 `cout` 的特性。

不过，这些示例包括的只是文字字符，尽管在某些情况下它们也很有用，但它们可能是 `printf` 最不重要的部分。`printf` 的真正的威力在于格式化说明。

### 使用 printf 格式化输出

格式化说明符是以一个百分号（`%`）开头的字符。

常见的格式化说明符包括：

  * `%s`: 字符串
  * `%d`: 数字
  * `%f`: 浮点数字
  * `%o`: 一个八进制的数字

这些格式化说明符是 `printf` 语句的占位符，你可以使用一个在其它地方提供的值来替换你的 `printf` 语句中的占位符。这些值在哪里提供取决于你使用的语言和它的语法，这里有一个简单的 Java 例子：

```
string var="hello\n";
system.out.printf("%s", var);
```

把这个代码包裹在适当的样板文件中，在执行后，将呈现:

```
$ ./example
hello
$
```

但是，当一个变量的内容更改时，有意思的地方就来了。假设你想基于不断增加的数字来更新输出:

```
#include <stdio.h>

int main() {
  int var=0;
  while ( var < 100) {
    var++;
  printf("Processing is %d% finished.\n", var);
  }
  return 0;
}
```

编译并运行:

```
Processing is 1% finished.
[...]
Processing is 100% finished.
```

注意，在代码中的两个 `%` 将被解析为一个打印出来的 `%` 符号。

### 使用 printf 限制小数位数

数字也可以是很复杂，`printf` 提供很多格式化选项。你可以对浮点数使用 `%f` 限制打印出多少个小数位。通过把一个点（`.`）和一个限制的数放置在百分符号和 `f` 之间, 你可以告诉 `printf` 打印多少位小数。这是一个简单的用 Bash 写的简练示例：

```
$ printf "%.2f\n" 3.141519
3.14
$
```

类似的语法也适用于其它的语言。这里是一个 C 语言的示例：

```
#include <math.h>
#include <stdio.h>

int main() {
  fprintf(stdout, "%.2f\n", 4 * atan(1.0));
  return 0;
}
```

对于三位小数，使用 `.3f` ，依次类推。

### 使用 printf 来在数字上添加逗号

因为位数大的数字很难解读，所以通常使用一个逗号来断开大的数字。你可以在百分号和 `d` 之间放置一个撇号（`'`），让 `printf` 根据需要添加逗号：

```
$ printf "%'d\n" 1024
1,024
$ printf "%'d\n" 1024601
1,024,601
$
```

### 使用 printf 来添加前缀零

`printf` 的另一个常用的用法是对文件名称中的数字强制实行一种特定的格式。例如，如果你在一台计算机上有 10 个按顺序排列的文件，计算机可能会把 `10.jpg` 排在 `1.jpg` 之前，这可能不是你的本意。当你以编程的方式写一个到文件时，你可以使用 `printf` 来用前缀为 0 的字符形成文件名称。这是一个简单的用 Bash 写的简练示例：

```
$ printf "%03d.jpg\n" {1..10}
001.jpg
002.jpg
[...]
010.jpg
```

注意：每个数字最多使用 3 位数字。

### 使用 printf

正如这些 `printf` 示例所显示，包括控制字符，尤其是 `\n` ，可能会冗长，并且语法相对复杂。这就是为什么开发像 `echo` 和 `cout` 之类的快捷方式的原因。不过，如果你时不时地使用 `printf` ，你就会习惯于这种语法，并且它也会变成你的习惯。我不认为 `printf` 有任何理由成为你在日常活动中打印时的*首选*，但是它是一个很好的工具，当你需要它时，它不会拖累你。

花一些时间学习你所选择语言中的 `printf`，并且当你需要时就使用它。它是一个强有力的工具，你不会后悔随时可用的工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/printf

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://opensource.com/resources/python
[3]: https://opensource.com/article/20/6/algol68
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/fprintf.html
[5]: http://www.opengroup.org/onlinepubs/009695399/functions/atan.html
