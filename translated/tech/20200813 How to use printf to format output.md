[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use printf to format output)
[#]: via: (https://opensource.com/article/20/8/printf)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何使用 printf 来格式化输出
======
开始了解 printf ，一个神秘的，灵活的，和功能丰满的可替换 echo， print，和 cout 的函数。

![在计算机前喝热饮料][1]

当我开始学习 Unix 时，在很早的过程中，我就被介绍尝试 `echo` 命令。同样在很早的过程中，我最初的 [Python][2] 课程介绍 `print` 函数。拾起 C++ 和 [Java][2] 介绍给我的 `cout` 和 `systemout`。似乎每种语言都很自豪地有一个简单的一行产生输出的方法，并且被宣告这种方法的样式过时了。

但是在我翻开中级教程的第一页后，我遇到了 `printf`，一个晦涩难懂的，诡秘的，和出奇灵活的函数。违背了向初学者隐藏 `printf` 这个令人迷惑的传统，这篇文章旨在介绍不起眼的 `printf` 函数，并解释如何在近乎任意语言中使用它。

### printf 简史

术语 `printf` 代表 "格式化输出"，可能在 [Algol 68][3] 编程语言中首次出现。自从它包含在 C 中，`printf` 已经在 C++，Java，Bash，PHP 中被重新实施，并且很可能在发生在你最喜欢的 ( C 衍生) 语言中。

它显然是很受欢迎，并且还有很多人认为它的语法很复杂，尤其是与 `echo` 或 `print` 或 `cout` 等可替代函数相比尤为明显。例如，在 Bash 中有一个简单的 echo 语句：


```
$ echo hello
hello
$
```

在 Bash 中使用 `printf` 有相同的结果:


```
$ printf "%s\n" hello
hello
$
```

但是所增加的复杂性反而让你拥有很多功能，这是为什么 `printf` 值得学习的确切原因。

### printf 输出

在 `printf` 背后的主要概念是：它能够基于来自内容的 _单独的_ 样式信息来格式化输出。例如，这里是 `printf` 认可的作为特殊字符的排列顺序的收藏品。你最喜欢的语言可能有更多一些或更少一些排列顺序，但是通常包含：

  * `\n`: 新行
  * `\r`: 换行
  * `\t`: 水平制表符
  * `\NNN`: 一个使用八进制值的包含一个到三个数字的特殊字节



例如：


```
$ printf "\t\123\105\124\110\n"
     SETH
$
```

在这个 Bash 示例中， `printf` 在 ASCII 分配到四个八进制值的字符串的字符后渲染一个制表符。使用控制排列顺序来中止行，并生成一个新行 (`\n`) 。

使用 `echo` 来尝试相同的东西来生成一点儿完完全全的东西:


```
$ printf "\t\123\105\124\110\n"
\t\123\105\124\110\n
$
```

对于相同是任务，使用 Python 的 `print` 函数，你会发现 Python 的 `print` 命令有你可以期待的更多的东西:


```
>>> print("\t\123\n")
        S

>>>
```

显然，Python 的 `print` 包含传统的 `printf` 功能以及简单的 `echo` 或 `cout` 的功能。

不过，这些示例只包括字面意义上的字符，虽然在一些情况下它们也很有用，它们可能是 `printf` 最不重要的部分。`printf` 的真正的威力在于格式化规范。

### 使用 printf 格式化输出

格式化说明符是以一个百分号(`%`)开头的字符。
常见的格式化说明符包括:

  * `%s`: 字符串
  * `%d`: 数字
  * `%f`: 浮点数字
  * `%o`: 一个八进制的数字



这些格式化说明符在一个 `printf` 语句中是占位符，在你的`printf`语句中，你可以使用一个你在其它地方中提供的值来替换。但是这些提供的值取决于你正在使用的语言及其语法，这里是一个简单的 Java 示例:


```
string var="hello\n";
system.out.printf("%s", var);
```

这个包裹在适当的样板文件中的代码，在执行后，将呈现:


```
$ ./example
hello
$
```

但是，当一个变量的内容更改时，它将会更加有趣。假设你想更新基于不断增加数字的输出:


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

编译和运行:


```
Processing is 1% finished.
[...]
Processing is 100% finished.
```

注意，在代码中的两个 `%` 分解为一个打印的 `%` 符号。

### 使用 printf 限制小数位数

数字可能会变得复杂，`printf` 提供很多格式化选项。你可以对浮点数使用 `%f` 限制打印出多少个小数位。通过把一个点 (`.`)和一个限制的数放置在百分符号和 `f` 之间, 你将告诉 `printf` 渲染多少位小数。这是一个简单的用 Bash 写的简练示例 :


```
$ printf "%.2f\n" 3.141519
3.14
$
```

类似的语法也适用于其它的语言。这里是一个 C 语言的示例:


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

因为位数大的数字很难分解，所以通常使用一个逗号来断开大的数字。你可以根据需要在由 `printf` 组成的百分号和`d` 之间放置一个撇号(`'`) :


```
$ printf "%'d\n" 1024
1,024
$ printf "%'d\n" 1024601
1,024,601
$
```

### 使用 printf 来添加前缀零

Another common use for `printf` 的另一个常用的用法是对文件名称中的数字强制实行一种特定的格式。例如，如果你在一台计算机上有 10 个按顺序排列的文件，该计算机可能会把 `10.jpg` 排在before `1.jpg` 之前，这可能不是你的本意。当你以编程的方式写一个到文件时，你可以使用 `printf` 来用前缀为0的字符来构成文件名称。这是一个简单的用 Bash 写的简练示例：


```
$ printf "%03d.jpg\n" {1..10}
001.jpg
002.jpg
[...]
010.jpg
```

注意：每个数字最多使用 3 位数字。

### 使用 printf

正如这些 `printf` 示例所显示，包括控制字符，尤其是 `\n` ，可能会冗长，并且语法是相当地复杂。这就是为什么开发像 `echo` 和 `cout` 之类的快捷方式的原因。不过，如果你是不是地使用 `printf` ，你将会习惯于语法，并且它也将变成你的后天本性。，我看不出任何理由让 `printf` 成为你在日常活动中打印时的 _第一_ 选择，但是它是一个极好的工具来让你足够舒适，当你需要它时，将不会让你降低速度。

花一些时间学习你所选择语言中的 `printf` ，并且当你需要它时就使用它。它是一个强有力的你不会忘记的随时可用的工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/printf

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://opensource.com/resources/python
[3]: https://opensource.com/article/20/6/algol68
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/fprintf.html
[5]: http://www.opengroup.org/onlinepubs/009695399/functions/atan.html
